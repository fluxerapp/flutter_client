@Tags(<String>['slow'])
library;

import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/moderation/data/report_flow_repository.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow_walk.dart';
import 'package:fluxer_dart/export.dart'
    hide ReportFlowStep, ReportFlowTargetType;

import '../helpers/report_flow_test_walks.dart';

final String? _harnessUrl = Platform.environment['HARNESS_API_URL'];

class _Seed {
  _Seed(this.json);

  final Map<String, dynamic> json;

  Map<String, dynamic> _object(String key) => json[key] as Map<String, dynamic>;

  String get reporterId => _object('reporter')['user_id'] as String;
  String get reporterToken => _object('reporter')['token'] as String;
  String get targetId => _object('target')['user_id'] as String;
  String get dmChannelId => _object('dm')['channel_id'] as String;
  String get dmMessageId => _object('dm')['message_id'] as String;
  String get guildId => _object('guild')['guild_id'] as String;
  String get guildChannelId => _object('guild')['channel_id'] as String;
  String get webhookId => _object('guild')['webhook_id'] as String;
  String get webhookName => _object('guild')['webhook_name'] as String;
  String get webhookMessageId =>
      _object('guild')['webhook_message_id'] as String;
  String get botMessageId => _object('guild')['bot_message_id'] as String;
  String get memberMessageId => _object('guild')['member_message_id'] as String;
  Map<String, dynamic> get orphanWebhook =>
      _object('guild')['deleted_creator_webhook'] as Map<String, dynamic>;
  String get outsiderId => _object('admin')['user_id'] as String;
  String get outsiderToken => _object('admin')['token'] as String;
  String get botUserId => _object('bot')['user_id'] as String;
  String get botDmChannelId =>
      (_object('bot')['dm'] as Map<String, dynamic>)['channel_id'] as String;
  String get botDmMessageId =>
      (_object('bot')['dm'] as Map<String, dynamic>)['message_id'] as String;
}

class _Client {
  _Client(String token) {
    dio = Dio(
      BaseOptions(
        baseUrl: '$_harnessUrl/v1',
        contentType: 'application/json',
        headers: <String, Object>{'authorization': token},
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          paths.add(options.path);
          if (options.method == 'POST') {
            posts++;
          }
          handler.next(options);
        },
      ),
    );
    repository = ReportFlowRepository(dio);
  }

  late final Dio dio;
  late final ReportFlowRepository repository;
  final List<String> paths = <String>[];
  int posts = 0;

  Future<Message> message(String channelId, String messageId) async {
    final Response<List<dynamic>> response = await dio.get<List<dynamic>>(
      '/channels/$channelId/messages',
      queryParameters: <String, Object>{'limit': 10},
    );
    final Map<String, dynamic> json = response.data!
        .cast<Map<String, dynamic>>()
        .firstWhere((Map<String, dynamic> item) => item['id'] == messageId);
    return Message.fromSdk(MessageResponseSchema.fromJson(json));
  }
}

final Dio _harness = Dio(BaseOptions(baseUrl: _harnessUrl ?? ''));

Future<_Seed> _seed() async {
  final Response<Map<String, dynamic>> response = await _harness
      .post<Map<String, dynamic>>('/__harness/seed', data: <String, Object>{});
  return _Seed(response.data!);
}

Future<List<Map<String, dynamic>>> _reports(String reporterId) async {
  final Response<Map<String, dynamic>> response = await _harness
      .get<Map<String, dynamic>>(
        '/__harness/reports',
        queryParameters: <String, String>{'reporter_id': reporterId},
      );
  return (response.data!['reports'] as List<dynamic>)
      .cast<Map<String, dynamic>>();
}

Object? _decoded(Object? value) => value is String ? jsonDecode(value) : value;

Future<ReportFlowSubmitException> _failure(Future<String> submit) async {
  try {
    await submit;
  } on ReportFlowSubmitException catch (error) {
    return error;
  }
  fail('the submission did not fail');
}

Future<void> _submit(
  _Client client,
  _Seed seed,
  ReportFlowWalk walk, {
  String locale = 'en-US',
}) {
  return switch (walk.flow.targetType) {
    ReportFlowTargetType.message => client.repository.submitMessage(
      channelId: seed.dmChannelId,
      messageId: seed.dmMessageId,
      revisionHash: walk.flow.revisionHash,
      steps: walk.steps,
      locale: locale,
    ),
    ReportFlowTargetType.user => client.repository.submitUser(
      userId: seed.targetId,
      revisionHash: walk.flow.revisionHash,
      steps: walk.steps,
      locale: locale,
    ),
  };
}

void main() {
  final bool skip = _harnessUrl == null || _harnessUrl!.isEmpty;

  group('report flow against the harness API', skip: skip, () {
    for (final ReportFlowTestWalk testWalk in <ReportFlowTestWalk>[
      ...messageTestWalks,
      ...userTestWalks,
    ]) {
      test(testWalk.name, () async {
        final _Seed seed = await _seed();
        final _Client client = _Client(seed.reporterToken);
        final ReportFlow flow = await client.repository.fetch(
          testWalk.target,
          locale: 'en-US',
        );
        expect(flow.locale, 'en-US');
        final ReportFlowWalk walk = runReportFlowTestWalk(flow, testWalk);

        if (testWalk.ending != ReportFlowTestEnding.submitted) {
          expect(
            walk.phase,
            testWalk.ending == ReportFlowTestEnding.notice
                ? ReportFlowPhase.notice
                : ReportFlowPhase.thanks,
          );
          expect(client.posts, 0);
          expect(await _reports(seed.reporterId), isEmpty);
          return;
        }

        expect(walk.phase, ReportFlowPhase.summary);
        await _submit(client, seed, walk);
        expect(client.posts, 1);

        final Map<String, dynamic> row = (await _reports(
          seed.reporterId,
        )).single;
        expect(row['reason'], testWalk.reason);
        expect(row['category'], testWalk.category);
        expect(row['flow_surface'], 'in_app');
        expect(row['flow_locale'], 'en-US');
        expect(row['flow_revision'], flow.revisionHash);
        expect(_decoded(row['flow_steps']), testWalk.postedSteps);
        if (testWalk.target == ReportFlowTargetType.message) {
          expect(row['reported_message_id'], seed.dmMessageId);
        } else {
          expect(row['reported_user_id'], seed.targetId);
        }
      });
    }

    test('German UI gets German copy and stores the locale', () async {
      final _Seed seed = await _seed();
      final _Client client = _Client(seed.reporterToken);
      final ReportFlow flow = await client.repository.fetch(
        ReportFlowTargetType.message,
        locale: 'de',
      );
      final ReportFlow english = await client.repository.fetch(
        ReportFlowTargetType.message,
        locale: 'en-US',
      );

      expect(flow.locale, 'de');
      expect(flow.revisionHash, english.revisionHash);
      expect(
        flow.screen('root_message')!.title,
        isNot(english.screen('root_message')!.title),
      );

      await _submit(
        client,
        seed,
        ReportFlowWalk.start(flow).chooseOption('spam'),
        locale: 'de',
      );
      expect((await _reports(seed.reporterId)).single['flow_locale'], 'de');
    });

    test('409 is split by code', () async {
      final _Seed seed = await _seed();
      final _Client client = _Client(seed.reporterToken);
      final ReportFlow flow = await client.repository.fetch(
        ReportFlowTargetType.message,
        locale: 'en-US',
      );
      final ReportFlowWalk spam = ReportFlowWalk.start(
        flow,
      ).chooseOption('spam');

      await _submit(client, seed, spam);
      final ReportFlowSubmitException again = await _failure(
        client.repository.submitMessage(
          channelId: seed.dmChannelId,
          messageId: seed.dmMessageId,
          revisionHash: flow.revisionHash,
          steps: spam.steps,
          locale: 'en-US',
        ),
      );
      expect(again.failure, ReportFlowSubmitFailure.alreadyReported);

      const List<ReportFlowStep> invalid = <ReportFlowStep>[
        ReportFlowStep(screenId: 'root_message', optionId: 'dislike'),
      ];
      final ReportFlowSubmitException outdated = await _failure(
        client.repository.submitMessage(
          channelId: seed.guildChannelId,
          messageId: seed.webhookMessageId,
          revisionHash: '0000000000000000',
          steps: invalid,
          locale: 'en-US',
        ),
      );
      expect(outdated.failure, ReportFlowSubmitFailure.outdated);

      final ReportFlowSubmitException invalidAnswers = await _failure(
        client.repository.submitMessage(
          channelId: seed.guildChannelId,
          messageId: seed.webhookMessageId,
          revisionHash: flow.revisionHash,
          steps: invalid,
          locale: 'en-US',
        ),
      );
      expect(invalidAnswers.failure, ReportFlowSubmitFailure.outdated);

      Future<(int?, Object?)> rawStatus(String revisionHash) async {
        final Response<Map<String, dynamic>> response = await client.dio
            .post<Map<String, dynamic>>(
              '/reports/flows/message/submissions',
              data: <String, Object>{
                'channel_id': seed.guildChannelId,
                'message_id': seed.webhookMessageId,
                'revision_hash': revisionHash,
                'locale': 'en-US',
                'steps': invalid
                    .map((ReportFlowStep step) => step.toJson())
                    .toList(),
              },
              options: Options(validateStatus: (int? status) => true),
            );
        return (response.statusCode, response.data?['code']);
      }

      expect(await rawStatus('0000000000000000'), (
        409,
        'REPORT_FLOW_OUTDATED',
      ));
      expect(await rawStatus(flow.revisionHash), (
        400,
        'INVALID_REPORT_FLOW_ANSWERS',
      ));

      final _Seed profileSeed = await _seed();
      final _Client profileClient = _Client(profileSeed.reporterToken);
      final ReportFlow userFlow = await profileClient.repository.fetch(
        ReportFlowTargetType.user,
        locale: 'en-US',
      );
      final ReportFlowWalk profileWalk = runReportFlowTestWalk(
        userFlow,
        userTestWalks.firstWhere(
          (ReportFlowTestWalk walk) => walk.name == 'spam profile',
        ),
      );
      await _submit(profileClient, profileSeed, profileWalk);
      final ReportFlowSubmitException profileAgain = await _failure(
        profileClient.repository.submitUser(
          userId: profileSeed.targetId,
          revisionHash: userFlow.revisionHash,
          steps: profileWalk.steps,
          locale: 'en-US',
        ),
      );
      expect(profileAgain.failure, ReportFlowSubmitFailure.alreadyReported);
      expect(await _reports(profileSeed.reporterId), hasLength(1));
      expect(await _reports(seed.reporterId), hasLength(1));
    });

    test(
      'a webhook message files a report with the webhook and no user',
      () async {
        final _Seed seed = await _seed();
        final _Client client = _Client(seed.reporterToken);
        final Message message = await client.message(
          seed.guildChannelId,
          seed.webhookMessageId,
        );
        expect(message.isWebhookMessage, isTrue);
        expect(message.webhookId, seed.webhookId);
        expect(message.authorName, seed.webhookName);
        expect(message.authorIsBot, isTrue);
        expect(
          IarMessageContext(
            message: message,
            guildId: seed.guildId,
          ).blockableUserId,
          isNull,
        );

        final ReportFlow flow = await client.repository.fetch(
          ReportFlowTargetType.message,
          locale: 'en-US',
        );
        await client.repository.submitMessage(
          channelId: message.channelId,
          messageId: message.id,
          revisionHash: flow.revisionHash,
          steps: ReportFlowWalk.start(flow).chooseOption('spam').steps,
          locale: 'en-US',
        );
        expect(client.posts, 1);
        expect(
          client.paths.where((String path) => path.contains('relationships')),
          isEmpty,
        );

        final Map<String, dynamic> row = (await _reports(
          seed.reporterId,
        )).single;
        expect(row['reported_user_id'], isNull);
        expect(row['reported_webhook_id'], seed.webhookId);
        expect(row['reported_webhook_name'], seed.webhookName);
        expect(row['reported_message_id'], seed.webhookMessageId);
        expect(row['reported_channel_id'], seed.guildChannelId);
        expect(row['reported_guild_id'], seed.guildId);
        expect(row['reason'], 'spam');
        expect(row['flow_surface'], 'in_app');
      },
    );

    test(
      'a webhook message whose creator was deleted still files a report',
      () async {
        final _Seed seed = await _seed();
        final _Client client = _Client(seed.reporterToken);
        final String webhookId = seed.orphanWebhook['webhook_id'] as String;
        final String messageId = seed.orphanWebhook['message_id'] as String;
        final Message message = await client.message(
          seed.guildChannelId,
          messageId,
        );
        expect(message.webhookId, webhookId);
        expect(
          IarMessageContext(
            message: message,
            guildId: seed.guildId,
          ).blockableUserId,
          isNull,
        );

        final ReportFlow flow = await client.repository.fetch(
          ReportFlowTargetType.message,
          locale: 'en-US',
        );
        await client.repository.submitMessage(
          channelId: message.channelId,
          messageId: message.id,
          revisionHash: flow.revisionHash,
          steps: ReportFlowWalk.start(flow).chooseOption('spam').steps,
          locale: 'en-US',
        );

        final Map<String, dynamic> row = (await _reports(
          seed.reporterId,
        )).single;
        expect(row['reported_user_id'], isNull);
        expect(row['reported_webhook_id'], webhookId);
        expect(
          row['reported_webhook_name'],
          seed.orphanWebhook['webhook_name'],
        );
        expect(row['reported_message_id'], messageId);
      },
    );

    test(
      'a webhook message is refused like a user message outside the guild',
      () async {
        final _Seed seed = await _seed();
        final _Client client = _Client(seed.outsiderToken);
        final ReportFlow flow = await client.repository.fetch(
          ReportFlowTargetType.message,
          locale: 'en-US',
        );
        final List<ReportFlowStep> steps = ReportFlowWalk.start(
          flow,
        ).chooseOption('spam').steps;

        Future<(int?, Object?)> rawStatus(String messageId) async {
          final Response<Map<String, dynamic>> response = await client.dio
              .post<Map<String, dynamic>>(
                '/reports/flows/message/submissions',
                data: <String, Object>{
                  'channel_id': seed.guildChannelId,
                  'message_id': messageId,
                  'revision_hash': flow.revisionHash,
                  'locale': 'en-US',
                  'steps': steps
                      .map((ReportFlowStep step) => step.toJson())
                      .toList(),
                },
                options: Options(validateStatus: (int? status) => true),
              );
          return (response.statusCode, response.data?['code']);
        }

        final (int?, Object?) webhook = await rawStatus(seed.webhookMessageId);
        expect(webhook.$1, anyOf(403, 404));
        expect(webhook, await rawStatus(seed.memberMessageId));
        final ReportFlowSubmitException failure = await _failure(
          client.repository.submitMessage(
            channelId: seed.guildChannelId,
            messageId: seed.webhookMessageId,
            revisionHash: flow.revisionHash,
            steps: steps,
            locale: 'en-US',
          ),
        );
        expect(
          failure.failure,
          isIn(<ReportFlowSubmitFailure>[
            ReportFlowSubmitFailure.rejected,
            ReportFlowSubmitFailure.generic,
          ]),
        );
        expect(await _reports(seed.outsiderId), isEmpty);
      },
    );

    for (final (String label, bool inGuild) in <(String, bool)>[
      ('guild', true),
      ('DM', false),
    ]) {
      test('a bot $label message files a report against the bot', () async {
        final _Seed seed = await _seed();
        final _Client client = _Client(seed.reporterToken);
        final String channelId = inGuild
            ? seed.guildChannelId
            : seed.botDmChannelId;
        final String messageId = inGuild
            ? seed.botMessageId
            : seed.botDmMessageId;
        final Message message = await client.message(channelId, messageId);
        expect(message.isWebhookMessage, isFalse);
        expect(message.authorIsBot, isTrue);
        expect(message.authorId, seed.botUserId);
        expect(
          IarMessageContext(
            message: message,
            guildId: inGuild ? seed.guildId : null,
          ).blockableUserId,
          seed.botUserId,
        );

        final ReportFlow flow = await client.repository.fetch(
          ReportFlowTargetType.message,
          locale: 'en-US',
        );
        await client.repository.submitMessage(
          channelId: channelId,
          messageId: messageId,
          revisionHash: flow.revisionHash,
          steps: ReportFlowWalk.start(flow).chooseOption('spam').steps,
          locale: 'en-US',
        );
        expect(client.posts, 1);

        final Map<String, dynamic> row = (await _reports(
          seed.reporterId,
        )).single;
        expect(row['reported_user_id'], seed.botUserId);
        expect(row['reported_webhook_id'], isNull);
        expect(row['reported_message_id'], messageId);
        expect(row['reported_channel_id'], channelId);
        expect(row['reported_guild_id'], inGuild ? seed.guildId : isNull);
        expect(row['reason'], 'spam');
      });
    }
  });
}
