import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:remind_me/main.dart' as app;
import 'dart:io';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('boot app', (tester) async {
      //app loads
      app.main();
      await tester.pumpAndSettle();

      //Screenshot time
      await takeScreenshot(tester, binding, 'Screenshot');
    });
  });
}

takeScreenshot(tester, binding, name) async {
  if (Platform.isAndroid) {
    try{
      await tester.pumpAndSettle();
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
    }
    catch (e) {
      print("TakeScreenshot exception $e");
    }
    await tester.pumpAndSettle();
  }
  await binding.takeScreenShot(name);
}