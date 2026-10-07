import 'dart:convert';
import 'dart:io';

import 'package:fluxer_app/features/moderation/domain/report_flow.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow_walk.dart';

enum ReportFlowTestEnding { submitted, thanks, notice }

class ReportFlowTestWalk {
  const ReportFlowTestWalk({
    required this.name,
    required this.target,
    required this.actions,
    required this.ending,
    this.reason,
    this.category,
    this.categoryLabels,
    this.urgent = false,
    this.shortThanks = false,
  });

  final String name;
  final ReportFlowTargetType target;
  final List<Map<String, Object>> actions;
  final ReportFlowTestEnding ending;
  final String? reason;
  final String? category;
  final List<String>? categoryLabels;
  final bool urgent;
  final bool shortThanks;

  List<Map<String, Object>> get postedSteps =>
      ending == ReportFlowTestEnding.submitted
      ? actions
      : const <Map<String, Object>>[];
}

ReportFlow loadReportFlowFixture(ReportFlowTargetType target) {
  final File file = File(
    'test/fixtures/report_flows/${target.wireValue}_in_app.json',
  );
  return ReportFlow.fromJson(
    jsonDecode(file.readAsStringSync()) as Map<String, Object?>,
  );
}

ReportFlowWalk applyReportFlowAction(
  ReportFlowWalk walk,
  Map<String, Object> action,
) {
  final Object? optionId = action['option_id'];
  final Object? itemIds = action['item_ids'];
  if (optionId is String) {
    return walk.chooseOption(optionId);
  }
  if (itemIds is List<String>) {
    ReportFlowWalk next = walk;
    for (final String itemId in itemIds) {
      next = next.toggleItem(itemId);
    }
    return next.continueChecklist();
  }
  return walk.continueInfo();
}

ReportFlowWalk runReportFlowTestWalk(ReportFlow flow, ReportFlowTestWalk test) {
  ReportFlowWalk walk = ReportFlowWalk.start(flow);
  for (final Map<String, Object> action in test.actions) {
    if (walk.screenId != action['screen_id']) {
      throw StateError(
        '${test.name}: expected screen ${action['screen_id']}, '
        'walk is on ${walk.screenId}',
      );
    }
    walk = applyReportFlowAction(walk, action);
  }
  return walk;
}

const List<ReportFlowTestWalk> messageTestWalks = <ReportFlowTestWalk>[
  ReportFlowTestWalk(
    name: "S2 I don't like it",
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'root_message', 'option_id': 'dislike'},
    ],
    ending: ReportFlowTestEnding.thanks,
  ),
  ReportFlowTestWalk(
    name: 'S3 S16 spam',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'root_message', 'option_id': 'spam'},
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'spam',
    category: 'spam',
    categoryLabels: <String>['Spam or unwanted ads'],
  ),
  ReportFlowTestWalk(
    name: 'S4 rude language',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'root_message', 'option_id': 'abuse'},
      <String, Object>{'screen_id': 'abuse', 'option_id': 'rude_language'},
    ],
    ending: ReportFlowTestEnding.thanks,
    shortThanks: true,
  ),
  ReportFlowTestWalk(
    name: 'S6 private information',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{
        'screen_id': 'root_message',
        'option_id': 'private_info',
      },
      <String, Object>{
        'screen_id': 'private_info',
        'item_ids': <String>['email', 'phone'],
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'doxxing',
    category: 'doxxing',
    categoryLabels: <String>[
      "Sharing someone's private details",
      'Email address',
      'Phone number',
    ],
  ),
  ReportFlowTestWalk(
    name: 'S6 intimate photo override',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{
        'screen_id': 'root_message',
        'option_id': 'private_info',
      },
      <String, Object>{
        'screen_id': 'private_info',
        'item_ids': <String>['face_photo', 'intimate_photo'],
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'intimate_image_abuse',
    category: 'doxxing',
  ),
  ReportFlowTestWalk(
    name: 'S8 S9 age stated',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{
        'screen_id': 'root_message',
        'option_id': 'something_else',
      },
      <String, Object>{
        'screen_id': 'something_else_message',
        'option_id': 'too_young',
      },
      <String, Object>{
        'screen_id': 'age_stated_message',
        'option_id': 'age_yes',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'underage',
    category: 'underage_user',
    categoryLabels: <String>[
      'Something else',
      "They're under the minimum age to use Fluxer",
      'Yes, it mentions their age',
    ],
  ),
  ReportFlowTestWalk(
    name: 'S10 age not stated',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{
        'screen_id': 'root_message',
        'option_id': 'something_else',
      },
      <String, Object>{
        'screen_id': 'something_else_message',
        'option_id': 'too_young',
      },
      <String, Object>{
        'screen_id': 'age_stated_message',
        'option_id': 'age_no',
      },
    ],
    ending: ReportFlowTestEnding.notice,
  ),
  ReportFlowTestWalk(
    name: 'S11 S12 self-harm worry',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{
        'screen_id': 'root_message',
        'option_id': 'something_else',
      },
      <String, Object>{
        'screen_id': 'something_else_message',
        'option_id': 'self_harm',
      },
      <String, Object>{
        'screen_id': 'self_harm',
        'option_id': 'worried_self_harm',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'wellbeing_concern',
    category: 'self_harm',
    urgent: true,
  ),
  ReportFlowTestWalk(
    name: 'S14 harmful false claims',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{
        'screen_id': 'root_message',
        'option_id': 'violence_misinfo',
      },
      <String, Object>{
        'screen_id': 'violence_misinfo',
        'option_id': 'false_info',
      },
      <String, Object>{
        'screen_id': 'false_info',
        'option_id': 'harmful_false_claims',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'harmful_false_claims',
    category: 'other',
  ),
  ReportFlowTestWalk(
    name: 'S15 fraud',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{
        'screen_id': 'root_message',
        'option_id': 'something_else',
      },
      <String, Object>{
        'screen_id': 'something_else_message',
        'option_id': 'impersonation',
      },
      <String, Object>{'screen_id': 'impersonation', 'option_id': 'fraud'},
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'fraud',
    category: 'illegal_activity',
  ),
  ReportFlowTestWalk(
    name: 'S18 to S21 csam',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'root_message', 'option_id': 'abuse'},
      <String, Object>{'screen_id': 'abuse', 'option_id': 'sexual'},
      <String, Object>{'screen_id': 'sexual', 'option_id': 'minor_sexual'},
      <String, Object>{'screen_id': 'minor_sexual', 'option_id': 'csam'},
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'csam',
    category: 'child_safety',
    categoryLabels: <String>[
      'Abusive or harmful content',
      'Sexual content',
      'Sexualizing a minor',
      'Real or AI-generated images or videos of child sexual abuse',
    ],
    urgent: true,
  ),
  ReportFlowTestWalk(
    name: 'S7 to S5 terrorism',
    target: ReportFlowTargetType.message,
    actions: <Map<String, Object>>[
      <String, Object>{
        'screen_id': 'root_message',
        'option_id': 'violence_misinfo',
      },
      <String, Object>{
        'screen_id': 'violence_misinfo',
        'option_id': 'terrorism',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'terrorism_extremism',
    category: 'violent_content',
  ),
];

const List<ReportFlowTestWalk> userTestWalks = <ReportFlowTestWalk>[
  ReportFlowTestWalk(
    name: 'P1 to P3 harassment',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['photo', 'profile_text'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'abuse'},
      <String, Object>{'screen_id': 'profile_abuse', 'option_id': 'harassment'},
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'harassment',
    category: 'harassment',
    categoryLabels: <String>[
      'Pictures',
      'Profile text',
      'Abusive or harmful content',
      'Their profile harasses or targets me or someone else',
    ],
  ),
  ReportFlowTestWalk(
    name: 'P4 age not stated',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['profile_text'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'something_else'},
      <String, Object>{
        'screen_id': 'something_else_user',
        'option_id': 'too_young',
      },
      <String, Object>{
        'screen_id': 'age_stated_profile',
        'option_id': 'age_no',
      },
    ],
    ending: ReportFlowTestEnding.notice,
  ),
  ReportFlowTestWalk(
    name: 'P4 age stated',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['profile_text'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'something_else'},
      <String, Object>{
        'screen_id': 'something_else_user',
        'option_id': 'too_young',
      },
      <String, Object>{
        'screen_id': 'age_stated_profile',
        'option_id': 'age_yes',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'underage',
    category: 'underage_user',
  ),
  ReportFlowTestWalk(
    name: 'P4 self-harm worry',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['profile_text'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'something_else'},
      <String, Object>{
        'screen_id': 'something_else_user',
        'option_id': 'self_harm',
      },
      <String, Object>{'screen_id': 'crisis_support'},
      <String, Object>{
        'screen_id': 'self_harm_profile',
        'option_id': 'worried',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'wellbeing_concern',
    category: 'other',
    urgent: true,
  ),
  ReportFlowTestWalk(
    name: 'P5 private information',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['profile_text'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'something_else'},
      <String, Object>{
        'screen_id': 'something_else_user',
        'option_id': 'private_info',
      },
      <String, Object>{
        'screen_id': 'profile_private_info',
        'item_ids': <String>['phone', 'address'],
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'doxxing',
    category: 'inappropriate_profile',
    categoryLabels: <String>[
      'Profile text',
      'Something else',
      "Their profile shares someone's private details",
      'Phone number',
      'Home address or workplace',
    ],
  ),
  ReportFlowTestWalk(
    name: 'spam profile',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['name'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'spam'},
      <String, Object>{
        'screen_id': 'spam_profile',
        'option_id': 'spam_profile',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'spam',
    category: 'spam_account',
  ),
  ReportFlowTestWalk(
    name: 'staff impersonation',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['photo', 'name'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'impersonation'},
      <String, Object>{
        'screen_id': 'impersonation',
        'option_id': 'impersonation_staff',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'impersonation_staff',
    category: 'impersonation',
  ),
  ReportFlowTestWalk(
    name: 'hateful profile',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['profile_text'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'hate_violence'},
      <String, Object>{
        'screen_id': 'profile_hate_violence',
        'option_id': 'hate',
      },
      <String, Object>{'screen_id': 'hate', 'option_id': 'hate_slurs'},
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'hate_slurs',
    category: 'hate_speech',
  ),
  ReportFlowTestWalk(
    name: 'csam in a profile',
    target: ReportFlowTargetType.user,
    actions: <Map<String, Object>>[
      <String, Object>{'screen_id': 'profile_intro'},
      <String, Object>{
        'screen_id': 'profile_parts',
        'item_ids': <String>['photo'],
      },
      <String, Object>{'screen_id': 'root_user', 'option_id': 'abuse'},
      <String, Object>{'screen_id': 'profile_abuse', 'option_id': 'sexual'},
      <String, Object>{
        'screen_id': 'profile_sexual',
        'option_id': 'minor_sexual',
      },
      <String, Object>{
        'screen_id': 'profile_minor_sexual',
        'option_id': 'csam',
      },
    ],
    ending: ReportFlowTestEnding.submitted,
    reason: 'csam',
    category: 'child_safety',
    urgent: true,
  ),
];
