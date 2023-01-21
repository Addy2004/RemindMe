import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:remind_me/main.dart' as app;
import 'dart:io';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding();
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('end-to-end test', () {
    testWidgets('boot app', (tester) async {
      late String platform;
      if(Platform.isAndroid){
        platform = 'android';
      }
      //app loads
      app.main();
      await tester.pumpAndSettle();

      //Screenshot time
      await tester.pumpAndSettle();
      await binding.convertFlutterSurfaceToImage();
      await tester.pumpAndSettle();
      await binding.takeScreenshot('$platform-screenshot');
    });
  });
}