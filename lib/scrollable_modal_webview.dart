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
  Color? backgroundColor,
}) {
  if (!(Platform.isIOS || Platform.isAndroid)) {
    throw Exception('This OS is not supported');
  }
  final double statusBarHeight = MediaQuery.of(context).padding.top;
  showModalBottomSheet(
    context: context,
    backgroundColor: backgroundColor,
    isScrollControlled: true,
    shape: shape,
    builder: (BuildContext context) => ScrollableModalBottomSheet(
      controller: controller,
      initialChildSize: initialChildSize,
      scrollable: scrollable,
      url: url,
      header: header,
      statusBarHeight: statusBarHeight,
    ),
  );
}

class ScrollableModalBottomSheet extends StatelessWidget {
  final WebViewController controller;
  final Widget? header;
  final double initialChildSize;
  final bool scrollable;
  final String url;
  final double statusBarHeight;

  /// this class is ui component of scrollable modal bottom sheet.
  const ScrollableModalBottomSheet({
    Key? key,
    required this.controller,
    this.header,
    required this.initialChildSize,
    required this.scrollable,
    required this.url,
    required this.statusBarHeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize,
        builder: (context, scrollController) {
          return Column(
            children: [
              if (initialChildSize >=
                  1.0 * (deviceHeight - statusBarHeight) / deviceHeight)
                SizedBox(height: statusBarHeight),
              if (header != null) header!,
              Expanded(
                  child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  physics:
                      scrollable ? null : const NeverScrollableScrollPhysics(),
                  child: const ScrollableModalWebView(),
                ),
              ))
            ],
          );
        });
  }
}

class ScrollableModalWebView extends StatefulWidget {
  const ScrollableModalWebView({super.key});

  @override
  State<ScrollableModalWebView> createState() => _ScrollableModalWebViewState();
}

class _ScrollableModalWebViewState extends State<ScrollableModalWebView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
