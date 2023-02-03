library scrollable_modal_webview;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Shows a scrollable modal WebView.
void showScrollableModalWebView({
  required BuildContext context,
  required WebViewController controller,
  required String url,
  Widget? header,
  bool scrollable = true,
  double initialChildSize = 1.0,
  ShapeBorder? shape,
}) {
  if (!(Platform.isIOS || Platform.isAndroid)) {
    throw Exception('This OS is not supported');
  }
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: shape,
    builder: (BuildContext context) => ScrollableModalBottomSheet(
      controller: controller,
      initialChildSize: initialChildSize,
      scrollable: scrollable,
      url: url,
      header: header,
    ),
  );
}

class ScrollableModalBottomSheet extends StatelessWidget {
  final WebViewController controller;
  final Widget? header;
  final double initialChildSize;
  final bool scrollable;
  final String url;
  const ScrollableModalBottomSheet({
    Key? key,
    required this.controller,
    this.header,
    required this.initialChildSize,
    required this.scrollable,
    required this.url,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize,
        builder: (context, scrollController) {
          return Column(
            children: [
              if (header != null) header!,
              Expanded(
                  child: SingleChildScrollView(
                physics:
                    scrollable ? null : const NeverScrollableScrollPhysics(),
                child: ModalWebView(controller: controller, url: url),
              ))
            ],
          );
        });
  }
}

class ModalWebView extends StatefulWidget {
  /// Creates a widget that show WebView in Modal Bottom Sheet.
  const ModalWebView({
    Key? key,
    required this.controller,
    required this.url,
  }) : super(key: key);
  final WebViewController controller;
  final String url;

  @override
  State<ModalWebView> createState() => _ModalWebViewState();
}

class _ModalWebViewState extends State<ModalWebView> {
  late WebViewController _controller;
  double _webViewHeight = 0;

  Future<void> _calculateWebViewHeight() async {
    const String javaScript = 'document.documentElement.scrollHeight;';
    final result = await _controller.runJavaScriptReturningResult(javaScript);
    final double height = double.parse(result.toString());
    setState(() {
      _webViewHeight = height;
    });
  }

  @override
  void initState() {
    super.initState();
    final WebViewController controller = widget.controller;
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
            _calculateWebViewHeight();
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    final double deviceKeyBordHeight = MediaQuery.of(context).viewInsets.bottom;
    return SizedBox(
      height: _webViewHeight + deviceKeyBordHeight,
      child: WebViewWidget(
        controller: _controller,
      ),
    );
  }
}
