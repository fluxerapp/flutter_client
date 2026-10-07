import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_command.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_command_execute.dart';

class _RecordingAdapter implements HttpClientAdapter {
  final List<RequestOptions> requests = <RequestOptions>[];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    return ResponseBody.fromString('', 204);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late _RecordingAdapter adapter;
  late Dio dio;

  setUp(() {
    adapter = _RecordingAdapter();
    dio = Dio(BaseOptions(baseUrl: 'https://api.example/v1'))
      ..httpClientAdapter = adapter;
  });

  test('/kick sends the parsed reason as the audit log reason', () async {
    final ComposerKickCommand command =
        parseComposerCommand('/kick <@123> spam bot, ünïcode')
            as ComposerKickCommand;

    await kickGuildMember(
      dio,
      guildId: '42',
      userId: command.userId,
      reason: command.reason,
    );

    final RequestOptions request = adapter.requests.single;
    expect(request.method, 'DELETE');
    expect(
      request.uri.toString(),
      'https://api.example/v1/guilds/42/members/123',
    );
    final String header = request.headers['X-Audit-Log-Reason'] as String;
    expect(header, Uri.encodeComponent('spam bot, ünïcode'));
    expect(Uri.decodeComponent(header), 'spam bot, ünïcode');
  });

  test('/kick without a reason sends no audit log reason', () async {
    final ComposerKickCommand command =
        parseComposerCommand('/kick <@123>') as ComposerKickCommand;

    await kickGuildMember(
      dio,
      guildId: '42',
      userId: command.userId,
      reason: command.reason,
    );

    final RequestOptions request = adapter.requests.single;
    expect(request.method, 'DELETE');
    expect(request.headers.containsKey('X-Audit-Log-Reason'), isFalse);
  });
}
