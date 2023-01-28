library scrollable_modal_webview;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void showScrollableModalWebView({
  /// Shows a scrollable modal WebView.
  required WebViewController controller,
  required String url,
  required BuildContext context,
  PreferredSizeWidget? header,
  bool scrollable = true,
  double initialChildSize = 1.0,
  double radius = 10.0,
}) {
  if (!(Platform.isIOS || Platform.isAndroid)) {
    throw Exception('This OS is not supported');
  }
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) => const ScrollableModalWebView(),
  );
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
