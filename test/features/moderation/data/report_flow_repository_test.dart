import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/moderation/data/report_flow_repository.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';

class _Request {
  _Request(this.method, this.path, this.query, this.body);

  final String method;
  final String path;
  final Map<String, dynamic> query;
  final Object? body;
}

class _RecordingAdapter implements HttpClientAdapter {
  final List<_Request> requests = <_Request>[];
  int statusCode = 200;
  String body = '{}';

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    Object? sent;
    if (requestStream != null) {
      final List<int> bytes = <int>[];
      await requestStream.forEach(bytes.addAll);
      sent = jsonDecode(utf8.decode(bytes));
    }
    requests.add(
      _Request(options.method, options.path, options.queryParameters, sent),
    );
    return ResponseBody.fromString(
      body,
      statusCode,
      headers: <String, List<String>>{
        Headers.contentTypeHeader: <String>['application/json'],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

const List<ReportFlowStep> _spamSteps = <ReportFlowStep>[
  ReportFlowStep(screenId: 'root_message', optionId: 'spam'),
];

const List<ReportFlowStep> _profileSteps = <ReportFlowStep>[
  ReportFlowStep(screenId: 'profile_intro'),
  ReportFlowStep(screenId: 'profile_parts', itemIds: <String>['photo']),
  ReportFlowStep(screenId: 'root_user', optionId: 'spam'),
  ReportFlowStep(screenId: 'spam_profile', optionId: 'spam_profile'),
];

void main() {
  late _RecordingAdapter adapter;
  late ReportFlowRepository repository;

  setUp(() {
    adapter = _RecordingAdapter();
    final Dio dio = Dio(BaseOptions(baseUrl: 'https://api.example.test/v1'))
      ..httpClientAdapter = adapter;
    repository = ReportFlowRepository(dio);
  });

  Future<ReportFlowSubmitException> submitFailure(
    int status,
    Map<String, Object> body,
  ) async {
    adapter
      ..statusCode = status
      ..body = jsonEncode(body);
    try {
      await repository.submitMessage(
        channelId: '1',
        messageId: '2',
        revisionHash: 'abc',
        steps: _spamSteps,
        locale: 'en-US',
      );
    } on ReportFlowSubmitException catch (error) {
      return error;
    }
    fail('submit did not throw');
  }

  test('fetch gets the in-app flow with the UI locale', () async {
    adapter.body = File(
      'test/fixtures/report_flows/message_in_app.json',
    ).readAsStringSync();

    final ReportFlow flow = await repository.fetch(
      ReportFlowTargetType.message,
      locale: 'de',
    );

    expect(adapter.requests.single.method, 'GET');
    expect(adapter.requests.single.path, '/reports/flows/message');
    expect(adapter.requests.single.query, <String, Object>{
      'surface': 'in_app',
      'locale': 'de',
    });
    expect(flow.targetType, ReportFlowTargetType.message);
    expect(flow.screen('root_message')!.options.first.id, 'abuse');
  });

  test('fetch surfaces a missing route as a load failure', () async {
    adapter
      ..statusCode = 404
      ..body = jsonEncode(<String, String>{
        'code': 'NOT_FOUND',
        'message': 'Not found.',
      });

    await expectLater(
      repository.fetch(ReportFlowTargetType.user, locale: 'en-US'),
      throwsA(isA<DioException>()),
    );
    expect(adapter.requests.single.path, '/reports/flows/user');
  });

  test('a message submission posts the walk with locale and hash', () async {
    adapter.body = jsonEncode(<String, String>{
      'report_id': '99',
      'status': 'pending',
      'reported_at': '2026-10-03T00:00:00Z',
    });

    final String reportId = await repository.submitMessage(
      channelId: '10',
      messageId: '20',
      revisionHash: '16781a19a797f23f',
      steps: _spamSteps,
      locale: 'de',
    );

    expect(reportId, '99');
    final _Request request = adapter.requests.single;
    expect(request.method, 'POST');
    expect(request.path, '/reports/flows/message/submissions');
    expect(request.body, <String, Object>{
      'channel_id': '10',
      'message_id': '20',
      'revision_hash': '16781a19a797f23f',
      'locale': 'de',
      'steps': <Object>[
        <String, Object>{'screen_id': 'root_message', 'option_id': 'spam'},
      ],
    });
  });

  test('a user submission posts info and checklist steps', () async {
    adapter.body = jsonEncode(<String, String>{'report_id': '7'});

    await repository.submitUser(
      userId: '30',
      guildId: '40',
      revisionHash: 'hash',
      steps: _profileSteps,
      locale: 'en-US',
    );
    await repository.submitUser(
      userId: '31',
      revisionHash: 'hash',
      steps: _profileSteps,
      locale: 'en-US',
    );

    expect(adapter.requests.first.path, '/reports/flows/user/submissions');
    expect(adapter.requests.first.body, <String, Object>{
      'user_id': '30',
      'guild_id': '40',
      'revision_hash': 'hash',
      'locale': 'en-US',
      'steps': <Object>[
        <String, Object>{'screen_id': 'profile_intro'},
        <String, Object>{
          'screen_id': 'profile_parts',
          'item_ids': <String>['photo'],
        },
        <String, Object>{'screen_id': 'root_user', 'option_id': 'spam'},
        <String, Object>{
          'screen_id': 'spam_profile',
          'option_id': 'spam_profile',
        },
      ],
    });
    expect(
      (adapter.requests.last.body! as Map<String, dynamic>).containsKey(
        'guild_id',
      ),
      isFalse,
    );
  });

  group('submit failures', () {
    test('409 CONFLICT means already reported', () async {
      final ReportFlowSubmitException error = await submitFailure(409, {
        'code': 'CONFLICT',
        'message': 'Already reported.',
      });
      expect(error.failure, ReportFlowSubmitFailure.alreadyReported);
    });

    test('409 REPORT_FLOW_OUTDATED means the form changed', () async {
      final ReportFlowSubmitException error = await submitFailure(409, {
        'code': 'REPORT_FLOW_OUTDATED',
        'message': 'The report form changed.',
      });
      expect(error.failure, ReportFlowSubmitFailure.outdated);
    });

    test('400 INVALID_REPORT_FLOW_ANSWERS also restarts the form', () async {
      final ReportFlowSubmitException error = await submitFailure(400, {
        'code': 'INVALID_REPORT_FLOW_ANSWERS',
        'message': 'Bad answers.',
      });
      expect(error.failure, ReportFlowSubmitFailure.outdated);
    });

    test('429 means rate limited', () async {
      final ReportFlowSubmitException error = await submitFailure(429, {
        'code': 'RATE_LIMITED',
        'message': 'Slow down.',
        'retry_after': 1,
      });
      expect(error.failure, ReportFlowSubmitFailure.rateLimited);
    });

    test('account gate codes are told apart', () async {
      expect(
        (await submitFailure(400, {
          'code': 'UNCLAIMED_ACCOUNT_CANNOT_SUBMIT_REPORTS',
          'message': 'Claim first.',
        })).failure,
        ReportFlowSubmitFailure.accountUnclaimed,
      );
      final ReportFlowSubmitException verify = await submitFailure(403, {
        'code': 'REPORT_EMAIL_VERIFICATION_REQUIRED',
        'message': 'Verify your email.',
      });
      expect(verify.failure, ReportFlowSubmitFailure.emailVerificationRequired);
      expect(verify.apiMessage, 'Verify your email.');
    });

    test('rule rejections keep the API message', () async {
      for (final (int status, String code) in <(int, String)>[
        (403, 'REPORT_BANNED'),
        (400, 'CANNOT_REPORT_OWN_MESSAGE'),
        (404, 'UNKNOWN_MESSAGE'),
      ]) {
        final ReportFlowSubmitException error = await submitFailure(status, {
          'code': code,
          'message': 'Localized $code',
        });
        expect(error.failure, ReportFlowSubmitFailure.rejected, reason: code);
        expect(error.apiMessage, 'Localized $code');
      }
    });

    test('anything else is generic', () async {
      expect(
        (await submitFailure(500, {
          'code': 'INTERNAL_SERVER_ERROR',
          'message': 'Oops.',
        })).failure,
        ReportFlowSubmitFailure.generic,
      );
      expect(
        classifyReportFlowSubmitError(StateError('boom')).failure,
        ReportFlowSubmitFailure.generic,
      );
    });
  });
}
