import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_evaluator.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/features/chat/utils/attachments/file_upload_constants.dart';

void main() {
  group('LimitEvaluator', () {
    test('applies premium attachment limit when premium trait matches', () {
      const LimitConfigSnapshot snapshot = LimitConfigSnapshot(
        rules: <LimitRule>[
          LimitRule(
            filters: LimitFilter(traits: <String>['premium']),
            limits: <String, int>{
              LimitKeys.maxAttachmentFileSize: kPremiumMaxAttachmentBytes,
            },
          ),
        ],
      );
      final LimitEvaluator evaluator = LimitEvaluator(snapshot);
      final int actual = evaluator.resolveOne(
        buildUserLimitContext(traits: <String>['premium']),
        LimitKeys.maxAttachmentFileSize,
      );
      expect(actual, kPremiumMaxAttachmentBytes);
    });

    test('uses free defaults when premium trait does not match', () {
      const LimitConfigSnapshot snapshot = LimitConfigSnapshot(
        rules: <LimitRule>[
          LimitRule(
            filters: LimitFilter(traits: <String>['premium']),
            limits: <String, int>{
              LimitKeys.maxAttachmentFileSize: kPremiumMaxAttachmentBytes,
            },
          ),
        ],
      );
      final LimitEvaluator evaluator = LimitEvaluator(snapshot);
      final int actual = evaluator.resolveOne(
        buildUserLimitContext(traits: const <String>[]),
        LimitKeys.maxAttachmentFileSize,
      );
      expect(actual, kDefaultFreeLimits[LimitKeys.maxAttachmentFileSize]);
    });

    test(
      'self-hosted everyone mode grants feature toggles without premium trait',
      () {
        const LimitConfigSnapshot snapshot = LimitConfigSnapshot(
          rules: <LimitRule>[
            LimitRule(
              limits: <String, int>{
                LimitKeys.featureGlobalExpressions: 1,
                LimitKeys.maxMessageLength: kMaxMessageLengthPremium,
              },
            ),
          ],
        );
        final LimitEvaluator evaluator = LimitEvaluator(snapshot);
        final LimitMatchContext context = buildUserLimitContext(
          traits: const <String>[],
        );
        expect(
          evaluator.resolveOne(context, LimitKeys.featureGlobalExpressions),
          1,
        );
        expect(
          evaluator.resolveOne(context, LimitKeys.maxMessageLength),
          kMaxMessageLengthPremium,
        );
      },
    );

    test('unfiltered rule lowers a limit below the built-in default', () {
      const LimitConfigSnapshot snapshot = LimitConfigSnapshot(
        rules: <LimitRule>[
          LimitRule(limits: <String, int>{LimitKeys.maxMessageLength: 500}),
        ],
      );
      final LimitEvaluator evaluator = LimitEvaluator(snapshot);
      expect(
        evaluator.resolveOne(
          buildUserLimitContext(traits: const <String>[]),
          LimitKeys.maxMessageLength,
        ),
        500,
      );
    });

    test('filtered rule never lowers what a broader rule granted', () {
      const LimitConfigSnapshot snapshot = LimitConfigSnapshot(
        rules: <LimitRule>[
          LimitRule(
            filters: LimitFilter(traits: <String>['premium']),
            limits: <String, int>{LimitKeys.maxMessageLength: 1000},
          ),
          LimitRule(limits: <String, int>{LimitKeys.maxMessageLength: 3000}),
        ],
      );
      final LimitEvaluator evaluator = LimitEvaluator(snapshot);
      expect(
        evaluator.resolveOne(
          buildUserLimitContext(traits: <String>['premium']),
          LimitKeys.maxMessageLength,
        ),
        3000,
      );
    });

    test('built-in tables match the server defaults', () {
      final Map<String, Object?> server =
          jsonDecode(
                File(
                  'test/fixtures/limits/server_defaults.json',
                ).readAsStringSync(),
              )
              as Map<String, Object?>;
      expect(kAllLimitKeys, unorderedEquals(server['keys']! as List<Object?>));
      expect(kDefaultFreeLimits, server['free']);
      expect(<String, String>{
        for (final MapEntry<String, LimitScope> entry
            in kLimitKeyScopes.entries)
          entry.key: entry.value.name,
      }, server['scopes']);
    });
  });
}
