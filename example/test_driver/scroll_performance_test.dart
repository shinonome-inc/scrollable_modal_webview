import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("scroll performance test", () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test("measure1", () async {
      final Timeline timeline = await driver.traceAction(() async {
        await driver.tap(find.text(
            "display showScrollableModalWebView (has a header and a safeArea)"));
        final SerializableFinder webView = find.byValueKey("webView");

        await Future<void>.delayed(const Duration(seconds: 3));

        for (int i = 0; i < 5; i++) {
          await driver.scroll(
              webView, 0.0, -1000.0, const Duration(milliseconds: 500));
          await Future<void>.delayed(const Duration(milliseconds: 500));
        }

        for (int i = 0; i < 5; i++) {
          await driver.scroll(
              webView, 0.0, 1000.0, const Duration(milliseconds: 500));
          await Future<void>.delayed(const Duration(milliseconds: 500));
        }
      });

      TimelineSummary.summarize(timeline)
          .writeTimelineToFile('home_scroll_perf', pretty: true);
    });
  });
}
