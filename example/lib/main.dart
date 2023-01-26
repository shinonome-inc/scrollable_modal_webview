import 'package:flutter/material.dart';
import 'package:scrollable_modal_webview/scrollable_modal_webview.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text("display showScrollableModalWebView"),
          onPressed: () {
            // TODO: After creating the showScrollableModalWebView function in scrollable_modal_webview.dart, change it.
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const ScrollableModalWebView()));
          },
        ),
      ),
    );
  }
}
