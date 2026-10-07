import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow_walk.dart';

import '../../../helpers/report_flow_test_walks.dart';

List<Map<String, Object>> _posted(ReportFlowWalk walk) =>
    walk.steps.map((ReportFlowStep step) => step.toJson()).toList();

void main() {
  final ReportFlow messageFlow = loadReportFlowFixture(
    ReportFlowTargetType.message,
  );
  final ReportFlow userFlow = loadReportFlowFixture(ReportFlowTargetType.user);

  ReportFlow flowFor(ReportFlowTargetType target) =>
      target == ReportFlowTargetType.message ? messageFlow : userFlow;

  group('fixtures', () {
    test('parse every screen kind', () {
      expect(messageFlow.startScreenId, 'root_message');
      expect(
        messageFlow.screen('root_message')!.kind,
        ReportFlowScreenKind.choice,
      );
      expect(
        messageFlow.screen('private_info')!.kind,
        ReportFlowScreenKind.checklist,
      );
      expect(userFlow.startScreenId, 'profile_intro');
      expect(userFlow.screen('profile_intro')!.kind, ReportFlowScreenKind.info);
      expect(
        userFlow.screen('crisis_support')!.kind,
        ReportFlowScreenKind.info,
      );
      expect(messageFlow.notice('need_more_info'), isNotNull);
      expect(userFlow.notice('need_more_info_profile'), isNotNull);
      expect(messageFlow.revisionHash, hasLength(16));
    });
  });

  group('B.7 walks', () {
    for (final ReportFlowTestWalk testWalk in <ReportFlowTestWalk>[
      ...messageTestWalks,
      ...userTestWalks,
    ]) {
      test(testWalk.name, () {
        final ReportFlowWalk walk = runReportFlowTestWalk(
          flowFor(testWalk.target),
          testWalk,
        );
        switch (testWalk.ending) {
          case ReportFlowTestEnding.submitted:
            expect(walk.phase, ReportFlowPhase.summary);
            expect(_posted(walk), testWalk.postedSteps);
            expect(walk.showsUrgentBanner, testWalk.urgent);
            final List<String>? labels = testWalk.categoryLabels;
            if (labels != null) {
              expect(walk.categoryLabels, labels);
            }
            final ReportFlowWalk sent = walk.markSent();
            expect(sent.phase, ReportFlowPhase.thanks);
            expect(sent.reportSent, isTrue);
            expect(sent.endedOnStartScreen, isFalse);
          case ReportFlowTestEnding.thanks:
            expect(walk.phase, ReportFlowPhase.thanks);
            expect(walk.reportSent, isFalse);
            expect(walk.endedOnStartScreen, !testWalk.shortThanks);
            expect(walk.markSent().phase, ReportFlowPhase.thanks);
          case ReportFlowTestEnding.notice:
            expect(walk.phase, ReportFlowPhase.notice);
            expect(
              walk.notice!.id,
              testWalk.target == ReportFlowTargetType.user
                  ? 'need_more_info_profile'
                  : 'need_more_info',
            );
            expect(walk.canGoBack, isFalse);
        }
      });
    }
  });

  group('transitions', () {
    test('start sits on the start screen with no steps', () {
      final ReportFlowWalk walk = ReportFlowWalk.start(messageFlow);
      expect(walk.screenId, 'root_message');
      expect(walk.phase, ReportFlowPhase.screen);
      expect(walk.steps, isEmpty);
      expect(walk.canGoBack, isFalse);
      expect(walk.depth, 0);
    });

    test('a link option changes nothing', () {
      final ReportFlowWalk walk = ReportFlowWalk.start(messageFlow);
      expect(identical(walk.chooseOption('dsa'), walk), isTrue);
      final ReportFlowWalk intro = ReportFlowWalk.start(userFlow);
      expect(identical(intro.chooseOption('learn_more'), intro), isTrue);
    });

    test('an unknown option changes nothing', () {
      final ReportFlowWalk walk = ReportFlowWalk.start(messageFlow);
      expect(identical(walk.chooseOption('nope'), walk), isTrue);
    });

    test('end without a notice keeps the steps and sends nothing', () {
      final ReportFlowWalk walk = ReportFlowWalk.start(
        messageFlow,
      ).chooseOption('abuse').chooseOption('rude_language');
      expect(walk.phase, ReportFlowPhase.thanks);
      expect(_posted(walk), <Map<String, Object>>[
        <String, Object>{'screen_id': 'root_message', 'option_id': 'abuse'},
      ]);
      expect(walk.reportSent, isFalse);
      expect(walk.canGoBack, isFalse);
    });

    test('info screens push a bare step and go to the next screen', () {
      final ReportFlowWalk walk = ReportFlowWalk.start(userFlow).continueInfo();
      expect(walk.screenId, 'profile_parts');
      expect(_posted(walk), <Map<String, Object>>[
        <String, Object>{'screen_id': 'profile_intro'},
      ]);
      expect(walk.canGoBack, isTrue);
    });

    test('checklist needs min_checked before it continues', () {
      ReportFlowWalk walk = ReportFlowWalk.start(userFlow).continueInfo();
      expect(walk.canContinueChecklist, isFalse);
      expect(identical(walk.continueChecklist(), walk), isTrue);
      walk = walk.toggleItem('name');
      expect(walk.canContinueChecklist, isTrue);
      walk = walk.toggleItem('name');
      expect(walk.canContinueChecklist, isFalse);
      expect(identical(walk.toggleItem('unknown'), walk), isTrue);
    });

    test('checklist items post in definition order', () {
      final ReportFlowWalk walk = ReportFlowWalk.start(messageFlow)
          .chooseOption('private_info')
          .toggleItem('phone')
          .toggleItem('ip_address')
          .toggleItem('email')
          .continueChecklist();
      expect(walk.phase, ReportFlowPhase.summary);
      expect(walk.steps.last.itemIds, <String>['email', 'phone', 'ip_address']);
      expect(walk.categoryLabels, <String>[
        "Sharing someone's private details",
        'Email address',
        'Phone number',
        'IP address',
      ]);
    });

    test('back from a checklist step restores its ticks', () {
      final ReportFlowWalk summary = ReportFlowWalk.start(messageFlow)
          .chooseOption('private_info')
          .toggleItem('email')
          .toggleItem('phone')
          .continueChecklist();
      final ReportFlowWalk back = summary.back();
      expect(back.phase, ReportFlowPhase.screen);
      expect(back.screenId, 'private_info');
      expect(back.checkedItems, <String>{'email', 'phone'});
      expect(back.steps, hasLength(1));
      expect(back.back().screenId, 'root_message');
      expect(back.back().steps, isEmpty);
    });

    test('back from P2 returns to the intro', () {
      final ReportFlowWalk parts = ReportFlowWalk.start(
        userFlow,
      ).continueInfo();
      final ReportFlowWalk intro = parts.back();
      expect(intro.screenId, 'profile_intro');
      expect(intro.steps, isEmpty);
      expect(intro.canGoBack, isFalse);
    });

    test('back from the summary returns to the screen that submitted', () {
      final ReportFlowWalk summary = ReportFlowWalk.start(messageFlow)
          .chooseOption('abuse')
          .chooseOption('threat')
          .chooseOption('violent_threat');
      expect(summary.phase, ReportFlowPhase.summary);
      final ReportFlowWalk back = summary.back();
      expect(back.phase, ReportFlowPhase.screen);
      expect(back.screenId, 'threat');
      expect(back.steps, hasLength(2));
    });

    test('depth grows forward and shrinks back', () {
      final ReportFlowWalk start = ReportFlowWalk.start(messageFlow);
      final ReportFlowWalk abuse = start.chooseOption('abuse');
      final ReportFlowWalk thanks = abuse.chooseOption('rude_language');
      expect(<int>[start.depth, abuse.depth, thanks.depth], <int>[0, 1, 2]);
      final ReportFlowWalk summary = start.chooseOption('spam');
      expect(summary.depth, 1);
      expect(summary.markSent().depth, 2);
      expect(summary.back().depth, 0);
    });

    test('the urgent banner follows the current screen, then the walk', () {
      final ReportFlowWalk sexual = ReportFlowWalk.start(
        messageFlow,
      ).chooseOption('abuse').chooseOption('sexual');
      expect(sexual.showsUrgentBanner, isTrue);
      expect(sexual.back().showsUrgentBanner, isFalse);
      final ReportFlowWalk summary = sexual.chooseOption('sexual_unwanted');
      expect(summary.showsUrgentBanner, isTrue);
      expect(summary.markSent().showsUrgentBanner, isFalse);
      expect(
        ReportFlowWalk.start(
          messageFlow,
        ).chooseOption('spam').showsUrgentBanner,
        isFalse,
      );
    });

    test('options on the summary or a finished walk are ignored', () {
      final ReportFlowWalk summary = ReportFlowWalk.start(
        messageFlow,
      ).chooseOption('spam');
      expect(identical(summary.chooseOption('abuse'), summary), isTrue);
      expect(identical(summary.continueInfo(), summary), isTrue);
      final ReportFlowWalk thanks = summary.markSent();
      expect(identical(thanks.back(), thanks), isTrue);
    });
  });
}
