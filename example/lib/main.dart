import 'package:flutter/material.dart';
import 'package:scrollable_modal_webview/scrollable_modal_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "example of scrollable_modal_webview package",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Container()),
          TextButton(
            child: const Text(
                "display showScrollableModalWebView (has a header and a safeArea)"),
            onPressed: () => showScrollableModalWebView(
                context: context,
                header: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text('ScrollableModalBottomSheet'),
                  ),
                ),
                backgroundColor: Colors.blue,
                controller: controller,
                initialChildSize: 0.96,
                url: 'https://flutter.dev/',
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                )),
          ),
          Expanded(child: Container()),
          TextButton(
            child: const Text(
                "display showScrollableModalWebView (has a header but don't have a safeArea)"),
            onPressed: () => showScrollableModalWebView(
                context: context,
                header: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(10.0)),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text('ScrollableModalBottomSheet'),
                  ),
                ),
                controller: controller,
                initialChildSize: 0.8,
                url: 'https://flutter.dev/',
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                )),
          ),
          Expanded(child: Container()),
          TextButton(
            child: const Text(
                "display showScrollableModalWebView (has a safeArea but don't have a header)"),
            onPressed: () => showScrollableModalWebView(
                context: context,
                backgroundColor: Colors.blue,
                controller: controller,
                initialChildSize: 0.96,
                url: 'https://flutter.dev/',
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                )),
          ),
          Expanded(child: Container()),
          TextButton(
            child: const Text(
                "display showScrollableModalWebView (don't have a header and safeArea)"),
            onPressed: () => showScrollableModalWebView(
                context: context,
                scrollable: true,
                controller: controller,
                initialChildSize: 0.8,
                url: 'https://flutter.dev/',
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                )),
          ),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
