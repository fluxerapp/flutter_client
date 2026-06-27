import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/limits/limit_evaluator.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/limits/limit_types.dart';
import 'package:fluxer_app/features/chat/utils/file_upload_constants.dart';

void main() {
  group('LimitEvaluator', () {
    test('applies premium attachment limit when premium trait matches', () {
      const LimitConfigSnapshot snapshot = LimitConfigSnapshot(
        traitDefinitions: <String>['premium'],
        rules: <LimitRule>[
          LimitRule(
            id: 'premium',
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
        traitDefinitions: <String>['premium'],
        rules: <LimitRule>[
          LimitRule(
            id: 'premium',
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
          traitDefinitions: <String>[],
          rules: <LimitRule>[
            LimitRule(
              id: 'default',
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
  });
}
