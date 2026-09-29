import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/providers/startup_session_expiry.dart';

void main() {
  test('a 401 on the stored host expires the session', () {
    expect(
      startupShouldExpireSession(
        mounted: true,
        requestBaseUrl: 'https://self.example/api/',
        storedApiBaseUrl: 'https://self.example/api',
      ),
      isTrue,
    );
  });

  test('a 401 against another host does not expire the session', () {
    expect(
      startupShouldExpireSession(
        mounted: true,
        requestBaseUrl: 'https://other.example/api',
        storedApiBaseUrl: 'https://self.example/api',
      ),
      isFalse,
    );
  });

  test('a 401 after startup is replaced does not expire the session', () {
    expect(
      startupShouldExpireSession(
        mounted: false,
        requestBaseUrl: 'https://self.example/api',
        storedApiBaseUrl: 'https://self.example/api',
      ),
      isFalse,
    );
  });
}
