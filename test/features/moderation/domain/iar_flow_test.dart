import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/moderation/domain/iar_flow.dart';
import 'package:fluxer_dart/export.dart';

void main() {
  group('ruleReasonsByCategory', () {
    test('every reason belongs to exactly one category', () {
      final seen = <IarRuleReason>{};
      for (final reasons in ruleReasonsByCategory.values) {
        for (final reason in reasons) {
          expect(
            seen.add(reason),
            isTrue,
            reason: '$reason is in more than one category',
          );
        }
      }
    });

    test('every reason is reachable from some category', () {
      final reachable = <IarRuleReason>{
        for (final reasons in ruleReasonsByCategory.values) ...reasons,
      };
      expect(reachable, equals(IarRuleReason.values.toSet()));
    });
  });

  group('iarCategoryForReason', () {
    test('inverse of ruleReasonsByCategory for every reason', () {
      for (final reason in IarRuleReason.values) {
        final category = iarCategoryForReason(reason);
        expect(
          ruleReasonsByCategory[category],
          contains(reason),
          reason: '$reason should map back into category $category',
        );
      }
    });
  });

  group('iarReasonToMessageCategory', () {
    test('every IAR reason maps to a defined backend enum value', () {
      for (final reason in IarRuleReason.values) {
        final wire = iarReasonToMessageCategory(reason);
        expect(
          wire,
          isNot(equals(MessageReportCategory.$unknown)),
          reason: '$reason maps to \$unknown',
        );
      }
    });

    test('rule reasons that share a wire category match the web mapping', () {
      // harassment and raidCoordination both route to harassment wire-side
      // (`REPORT_CATEGORY_BY_REASON.{harassment,raid_coordination}.message`
      // on the web).
      expect(
        iarReasonToMessageCategory(IarRuleReason.harassment),
        equals(MessageReportCategory.harassment),
      );
      expect(
        iarReasonToMessageCategory(IarRuleReason.raidCoordination),
        equals(MessageReportCategory.harassment),
      );
      // terrorismExtremism shares violentContent with violence.
      expect(
        iarReasonToMessageCategory(IarRuleReason.terrorismExtremism),
        equals(MessageReportCategory.violentContent),
      );
      expect(
        iarReasonToMessageCategory(IarRuleReason.violence),
        equals(MessageReportCategory.violentContent),
      );
      // Reasons that exist only for non-message contexts on the web
      // (`inappropriateProfile`, `harmfulMisinformation`) fall through to
      // the catch-all `other` wire value for messages.
      expect(
        iarReasonToMessageCategory(IarRuleReason.inappropriateProfile),
        equals(MessageReportCategory.other),
      );
      expect(
        iarReasonToMessageCategory(IarRuleReason.harmfulMisinformation),
        equals(MessageReportCategory.other),
      );
    });
  });

  group('messageReportReasons', () {
    // Order and membership mirror web `getMessageRuleReasonOptions`.
    const expectedOrder = [
      IarRuleReason.harassment,
      IarRuleReason.hate,
      IarRuleReason.violence,
      IarRuleReason.matureContent,
      IarRuleReason.childSafety,
      IarRuleReason.harmfulMisinformation,
      IarRuleReason.spamScams,
      IarRuleReason.malware,
      IarRuleReason.privacy,
      IarRuleReason.impersonation,
      IarRuleReason.illegalActivity,
      IarRuleReason.selfHarm,
      IarRuleReason.other,
    ];
    const excluded = {
      IarRuleReason.terrorismExtremism,
      IarRuleReason.inappropriateProfile,
      IarRuleReason.raidCoordination,
    };

    test('has 13 unique reasons', () {
      expect(messageReportReasons, hasLength(13));
      expect(messageReportReasons.toSet(), hasLength(13));
    });

    test('matches the web message reason list in order', () {
      expect(messageReportReasons, orderedEquals(expectedOrder));
    });

    test('together with the excluded reasons covers the whole enum', () {
      expect({
        ...messageReportReasons,
        ...excluded,
      }, equals(IarRuleReason.values.toSet()));
      expect(
        messageReportReasons.toSet().intersection(excluded),
        isEmpty,
        reason: 'a reason cannot be both listed and excluded',
      );
    });

    test('every listed reason maps to a defined backend enum value', () {
      for (final reason in messageReportReasons) {
        expect(
          iarReasonToMessageCategory(reason),
          isNot(equals(MessageReportCategory.$unknown)),
          reason: '$reason maps to \$unknown',
        );
      }
    });
  });

  group('classifyIarReportFailure', () {
    DioException dioWithStatus(int status) {
      final options = RequestOptions(path: '/reports/message');
      return DioException(
        requestOptions: options,
        response: Response(requestOptions: options, statusCode: status),
      );
    }

    test('409 maps to alreadyReported', () {
      expect(
        classifyIarReportFailure(dioWithStatus(409)),
        equals(IarReportFailure.alreadyReported),
      );
    });

    test('429 maps to rateLimited', () {
      expect(
        classifyIarReportFailure(dioWithStatus(429)),
        equals(IarReportFailure.rateLimited),
      );
    });

    test('other status codes fall through to generic', () {
      for (final status in [400, 403, 404, 500]) {
        expect(
          classifyIarReportFailure(dioWithStatus(status)),
          equals(IarReportFailure.generic),
          reason: 'status $status should be generic',
        );
      }
    });

    test('transport errors with no response map to generic', () {
      final error = DioException(
        requestOptions: RequestOptions(path: '/reports/message'),
        type: DioExceptionType.connectionError,
      );
      expect(classifyIarReportFailure(error), equals(IarReportFailure.generic));
    });

    test('non-Dio errors map to generic', () {
      expect(
        classifyIarReportFailure(Exception('boom')),
        equals(IarReportFailure.generic),
      );
      expect(
        classifyIarReportFailure(StateError('nope')),
        equals(IarReportFailure.generic),
      );
    });
  });

  group('iarReasonToUserCategory', () {
    const expected = <IarRuleReason, UserReportCategory>{
      IarRuleReason.harassment: UserReportCategory.harassment,
      IarRuleReason.hate: UserReportCategory.hateSpeech,
      IarRuleReason.violence: UserReportCategory.harassment,
      IarRuleReason.terrorismExtremism: UserReportCategory.other,
      IarRuleReason.matureContent: UserReportCategory.harassment,
      IarRuleReason.childSafety: UserReportCategory.underageUser,
      IarRuleReason.harmfulMisinformation: UserReportCategory.other,
      IarRuleReason.illegalActivity: UserReportCategory.other,
      IarRuleReason.spamScams: UserReportCategory.spamAccount,
      IarRuleReason.malware: UserReportCategory.spamAccount,
      IarRuleReason.privacy: UserReportCategory.harassment,
      IarRuleReason.impersonation: UserReportCategory.impersonation,
      IarRuleReason.inappropriateProfile:
          UserReportCategory.inappropriateProfile,
      IarRuleReason.raidCoordination: UserReportCategory.other,
      IarRuleReason.selfHarm: UserReportCategory.other,
      IarRuleReason.other: UserReportCategory.other,
    };

    test('maps every reason to the web user category', () {
      for (final reason in IarRuleReason.values) {
        expect(
          iarReasonToUserCategory(reason),
          equals(expected[reason]),
          reason: '$reason',
        );
      }
    });

    test(r'never maps to the $unknown sentinel', () {
      for (final reason in IarRuleReason.values) {
        expect(
          iarReasonToUserCategory(reason),
          isNot(equals(UserReportCategory.$unknown)),
          reason: '$reason maps to \$unknown',
        );
      }
    });
  });

  group('userReportReasons', () {
    // Order and membership mirror web `getUserRuleReasonOptions`.
    const expectedOrder = [
      IarRuleReason.harassment,
      IarRuleReason.hate,
      IarRuleReason.violence,
      IarRuleReason.matureContent,
      IarRuleReason.childSafety,
      IarRuleReason.harmfulMisinformation,
      IarRuleReason.spamScams,
      IarRuleReason.malware,
      IarRuleReason.privacy,
      IarRuleReason.impersonation,
      IarRuleReason.inappropriateProfile,
      IarRuleReason.illegalActivity,
      IarRuleReason.selfHarm,
      IarRuleReason.other,
    ];
    const excluded = {
      IarRuleReason.terrorismExtremism,
      IarRuleReason.raidCoordination,
    };

    test('matches the web user reason list in order', () {
      expect(userReportReasons, orderedEquals(expectedOrder));
    });

    test('includes inappropriateProfile and excludes guild-only reasons', () {
      expect(userReportReasons, contains(IarRuleReason.inappropriateProfile));
      expect(
        userReportReasons,
        isNot(contains(IarRuleReason.terrorismExtremism)),
      );
      expect(
        userReportReasons,
        isNot(contains(IarRuleReason.raidCoordination)),
      );
    });

    test('together with the excluded reasons covers the whole enum', () {
      expect({
        ...userReportReasons,
        ...excluded,
      }, equals(IarRuleReason.values.toSet()));
      expect(userReportReasons.toSet().intersection(excluded), isEmpty);
    });
  });

  group('iarReasonToGuildCategory', () {
    const expected = <IarRuleReason, GuildReportCategory>{
      IarRuleReason.harassment: GuildReportCategory.harassment,
      IarRuleReason.hate: GuildReportCategory.hateSpeech,
      IarRuleReason.violence: GuildReportCategory.other,
      IarRuleReason.terrorismExtremism: GuildReportCategory.extremistCommunity,
      IarRuleReason.matureContent: GuildReportCategory.other,
      IarRuleReason.childSafety: GuildReportCategory.childSafety,
      IarRuleReason.harmfulMisinformation: GuildReportCategory.other,
      IarRuleReason.illegalActivity: GuildReportCategory.illegalActivity,
      IarRuleReason.spamScams: GuildReportCategory.spam,
      IarRuleReason.malware: GuildReportCategory.malwareDistribution,
      IarRuleReason.privacy: GuildReportCategory.harassment,
      IarRuleReason.impersonation: GuildReportCategory.other,
      IarRuleReason.inappropriateProfile: GuildReportCategory.other,
      IarRuleReason.raidCoordination: GuildReportCategory.raidCoordination,
      IarRuleReason.selfHarm: GuildReportCategory.other,
      IarRuleReason.other: GuildReportCategory.other,
    };

    test('maps every reason to the web guild category', () {
      for (final reason in IarRuleReason.values) {
        expect(
          iarReasonToGuildCategory(reason),
          equals(expected[reason]),
          reason: '$reason',
        );
      }
    });

    test(r'never maps to the $unknown sentinel', () {
      for (final reason in IarRuleReason.values) {
        expect(
          iarReasonToGuildCategory(reason),
          isNot(equals(GuildReportCategory.$unknown)),
          reason: '$reason maps to \$unknown',
        );
      }
    });
  });

  group('guildReportReasons', () {
    const expectedOrder = [
      IarRuleReason.harassment,
      IarRuleReason.hate,
      IarRuleReason.terrorismExtremism,
      IarRuleReason.matureContent,
      IarRuleReason.childSafety,
      IarRuleReason.harmfulMisinformation,
      IarRuleReason.raidCoordination,
      IarRuleReason.spamScams,
      IarRuleReason.malware,
      IarRuleReason.privacy,
      IarRuleReason.illegalActivity,
      IarRuleReason.selfHarm,
      IarRuleReason.other,
    ];
    const excluded = {
      IarRuleReason.violence,
      IarRuleReason.impersonation,
      IarRuleReason.inappropriateProfile,
    };

    test('matches the web guild reason list in order', () {
      expect(guildReportReasons, orderedEquals(expectedOrder));
    });

    test(
      'includes guild-only reasons and excludes message/user-only reasons',
      () {
        expect(guildReportReasons, contains(IarRuleReason.terrorismExtremism));
        expect(guildReportReasons, contains(IarRuleReason.raidCoordination));
        expect(guildReportReasons, isNot(contains(IarRuleReason.violence)));
        expect(
          guildReportReasons,
          isNot(contains(IarRuleReason.impersonation)),
        );
        expect(
          guildReportReasons,
          isNot(contains(IarRuleReason.inappropriateProfile)),
        );
      },
    );

    test('together with the excluded reasons covers the whole enum', () {
      expect({
        ...guildReportReasons,
        ...excluded,
      }, equals(IarRuleReason.values.toSet()));
      expect(guildReportReasons.toSet().intersection(excluded), isEmpty);
    });

    test('every listed reason maps to a defined backend enum value', () {
      for (final reason in guildReportReasons) {
        expect(
          iarReasonToGuildCategory(reason),
          isNot(equals(GuildReportCategory.$unknown)),
          reason: '$reason maps to \$unknown',
        );
      }
    });
  });
}
