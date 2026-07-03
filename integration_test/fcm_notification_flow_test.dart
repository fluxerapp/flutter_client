import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('FCM notification flow test harness is available', (
    WidgetTester tester,
  ) async {
    expect(IntegrationTestWidgetsFlutterBinding.instance, isNotNull);
  });
}
