import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/transient_network_error.dart';
import 'package:http/http.dart' show ClientException;
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  test('matches common connection-loss message fragments', () {
    expect(
      isTransientNetworkError(
        const SocketException('Connection reset by peer'),
      ),
      isTrue,
    );
    expect(
      isTransientNetworkError(
        ClientException(
          'Software caused connection abort',
          Uri.parse('https://instance/'),
        ),
      ),
      isTrue,
    );
    expect(
      isTransientNetworkError(
        WebSocketChannelException.from(
          const SocketException('Connection reset by peer'),
        ),
      ),
      isTrue,
    );
    expect(isTransientNetworkError(StateError('logic bug')), isFalse);
  });
}
