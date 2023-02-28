// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrollable_modal_webview/scrollable_modal_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';

void main() {
  testWidgets('Test if header exist in IOS', (WidgetTester tester) async {
    WebViewPlatform.instance = WebKitWebViewPlatform();
    final WebViewController webViewController = WebViewController();
    final header = Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: const Center(
        child: Text('ScrollableModalBottomSheet'),
      ),
    );
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        return TextButton(
            onPressed: () => showScrollableModalWebView(
                platform: Platform.isIOS,
                context: context,
                scrollable: true,
                header: header,
                backgroundColor: Colors.blue,
                controller: webViewController,
                initialChildSize: 0.96,
                url: 'https://flutter.dev/',
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                )),
            child: const Text(
                "display showScrollableModalWebView (has a header and a safeArea)"));
      }),
    ));

    expect(
        find.text(
            "display showScrollableModalWebView (has a header and a safeArea)"),
        findsOneWidget);
    await tester.tap(find.text(
        "display showScrollableModalWebView (has a header and a safeArea)"));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byWidget(header), findsOneWidget);
  });

  testWidgets('Test if header do not exists in IOS',
      (WidgetTester tester) async {
    WebViewPlatform.instance = WebKitWebViewPlatform();
    final WebViewController webViewController = WebViewController();
    final header = Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: const Center(
        child: Text('ScrollableModalBottomSheet'),
      ),
    );
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        return TextButton(
            onPressed: () => showScrollableModalWebView(
                platform: Platform.isIOS,
                context: context,
                scrollable: true,
                backgroundColor: Colors.blue,
                controller: webViewController,
                initialChildSize: 0.96,
                url: 'https://flutter.dev/',
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                )),
            child: const Text(
                "display showScrollableModalWebView (has a header and a safeArea)"));
      }),
    ));

    expect(
        find.text(
            "display showScrollableModalWebView (has a header and a safeArea)"),
        findsOneWidget);
    await tester.tap(find.text(
        "display showScrollableModalWebView (has a header and a safeArea)"));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byWidget(header), findsNothing);
  });

  testWidgets('Test if header exist in Android', (WidgetTester tester) async {
    WebViewPlatform.instance = AndroidWebViewPlatform();
    final WebViewController webViewController = WebViewController();
    final header = Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: const Center(
        child: Text('ScrollableModalBottomSheet'),
      ),
    );
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        return TextButton(
            onPressed: () => showScrollableModalWebView(
                platform: Platform.isAndroid,
                context: context,
                scrollable: true,
                header: header,
                backgroundColor: Colors.blue,
                controller: webViewController,
                initialChildSize: 0.96,
                url: 'https://flutter.dev/',
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                )),
            child: const Text(
                "display showScrollableModalWebView (has a header and a safeArea)"));
      }),
    ));

    expect(
        find.text(
            "display showScrollableModalWebView (has a header and a safeArea)"),
        findsOneWidget);
    await tester.tap(find.text(
        "display showScrollableModalWebView (has a header and a safeArea)"));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byWidget(header), findsOneWidget);
  });

  testWidgets('Test if header do not exist in Android',
      (WidgetTester tester) async {
    WebViewPlatform.instance = AndroidWebViewPlatform();
    final WebViewController webViewController = WebViewController();
    final header = Container(
      height: 30,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: const Center(
        child: Text('ScrollableModalBottomSheet'),
      ),
    );
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: Builder(builder: (context) {
        return TextButton(
            onPressed: () => showScrollableModalWebView(
                platform: Platform.isAndroid,
                context: context,
                scrollable: true,
                backgroundColor: Colors.blue,
                controller: webViewController,
                initialChildSize: 0.96,
                url: 'https://flutter.dev/',
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                )),
            child: const Text(
                "display showScrollableModalWebView (has a header and a safeArea)"));
      }),
    ));

    expect(
        find.text(
            "display showScrollableModalWebView (has a header and a safeArea)"),
        findsOneWidget);
    await tester.tap(find.text(
        "display showScrollableModalWebView (has a header and a safeArea)"));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.byWidget(header), findsNothing);
  });

  testWidgets("Test if webView can be displayed in iOS",
      (WidgetTester tester) async {
    WebViewPlatform.instance = WebKitWebViewPlatform();
    final WebViewController controller = WebViewController()
      ..loadRequest(Uri.parse('https://flutter.dev/'));

    final webView = WebViewWidget(controller: controller);

    await tester.pumpWidget(
      MaterialApp(home: Builder(builder: (context) {
        return webView;
      })),
    );

    expect(find.byWidget(webView), findsOneWidget);
  });

  testWidgets("Test if webView can be displayed in Android",
      (WidgetTester tester) async {
    WebViewPlatform.instance = AndroidWebViewPlatform();
    final WebViewController controller = WebViewController()
      ..loadRequest(Uri.parse('https://flutter.dev/'));

    final webView = WebViewWidget(controller: controller);

    await tester.pumpWidget(
      MaterialApp(home: Builder(builder: (context) {
        return webView;
      })),
    );

    expect(find.byWidget(webView), findsOneWidget);
  });
}
