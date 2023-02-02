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
  BorderRadiusGeometry? borderRadius,
  Color? headerColor,
}) {
  if (!(Platform.isIOS || Platform.isAndroid)) {
    throw Exception('This OS is not supported');
  }
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
        borderRadius: borderRadius ??
            const BorderRadius.vertical(top: Radius.circular(0))),
    builder: (BuildContext context) => ScrollableModalBottomSheet(
      controller: controller,
      initialChildSize: initialChildSize,
      scrollable: scrollable,
      url: url,
      header: header,
      headerColor: headerColor,
      borderRadius: borderRadius,
    ),
  );
}

class ScrollableModalBottomSheet extends StatelessWidget {
  final WebViewController controller;
  final Widget? header;
  final double initialChildSize;
  final bool scrollable;
  final String url;
  final Color? headerColor;
  final BorderRadiusGeometry? borderRadius;
  const ScrollableModalBottomSheet(
      {Key? key,
      required this.controller,
      this.header,
      required this.initialChildSize,
      required this.scrollable,
      required this.url,
      this.headerColor,
      this.borderRadius})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        expand: false,
        initialChildSize: initialChildSize,
        builder: (context, scrollController) {
          return Column(
            children: [
              if (header != null) ...{
                Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    color: headerColor,
                  ),
                  height: MediaQuery.of(context).padding.bottom,
                ),
                header!,
              },
              Expanded(
                  child: SingleChildScrollView(
                physics:
                    scrollable ? null : const NeverScrollableScrollPhysics(),
                child: const ScrollableModalWebView(),
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
