enum ReportFlowTargetType {
  message('message'),
  user('user');

  const ReportFlowTargetType(this.wireValue);

  final String wireValue;
}

enum ReportFlowOutcomeType {
  screen('screen'),
  submit('submit'),
  end('end'),
  link('link');

  const ReportFlowOutcomeType(this.wireValue);

  final String wireValue;

  static ReportFlowOutcomeType fromWire(String value) {
    for (final ReportFlowOutcomeType type in values) {
      if (type.wireValue == value) {
        return type;
      }
    }
    throw FormatException('Unknown report flow outcome type: $value');
  }
}

enum ReportFlowScreenKind { choice, checklist, info }

class ReportFlowOutcome {
  const ReportFlowOutcome({
    required this.type,
    this.screenId,
    this.noticeId,
    this.url,
  });

  factory ReportFlowOutcome.fromJson(Map<String, Object?> json) {
    return ReportFlowOutcome(
      type: ReportFlowOutcomeType.fromWire(_string(json, 'type')),
      screenId: _optionalString(json, 'screen_id'),
      noticeId: _optionalString(json, 'notice_id'),
      url: _optionalString(json, 'url'),
    );
  }

  final ReportFlowOutcomeType type;
  final String? screenId;
  final String? noticeId;
  final String? url;
}

class ReportFlowOption {
  const ReportFlowOption({
    required this.id,
    required this.label,
    required this.outcome,
  });

  factory ReportFlowOption.fromJson(Map<String, Object?> json) {
    return ReportFlowOption(
      id: _string(json, 'id'),
      label: _string(json, 'label'),
      outcome: ReportFlowOutcome.fromJson(_map(json, 'outcome')),
    );
  }

  final String id;
  final String label;
  final ReportFlowOutcome outcome;
}

class ReportFlowChecklistItem {
  const ReportFlowChecklistItem({
    required this.id,
    required this.label,
    this.description,
  });

  factory ReportFlowChecklistItem.fromJson(Map<String, Object?> json) {
    return ReportFlowChecklistItem(
      id: _string(json, 'id'),
      label: _string(json, 'label'),
      description: _optionalString(json, 'description'),
    );
  }

  final String id;
  final String label;
  final String? description;
}

class ReportFlowChecklist {
  const ReportFlowChecklist({
    required this.items,
    required this.minChecked,
    required this.outcome,
  });

  factory ReportFlowChecklist.fromJson(Map<String, Object?> json) {
    final Object? minChecked = json['min_checked'];
    if (minChecked is! int) {
      throw const FormatException('Report flow checklist needs min_checked');
    }
    return ReportFlowChecklist(
      items: _list(
        json,
        'items',
      ).map(ReportFlowChecklistItem.fromJson).toList(growable: false),
      minChecked: minChecked,
      outcome: ReportFlowOutcome.fromJson(_map(json, 'outcome')),
    );
  }

  final List<ReportFlowChecklistItem> items;
  final int minChecked;
  final ReportFlowOutcome outcome;
}

class ReportFlowScreen {
  const ReportFlowScreen({
    required this.id,
    required this.title,
    required this.urgent,
    required this.options,
    this.subtitle,
    this.optionsHeading,
    this.checklist,
    this.nextScreenId,
  });

  factory ReportFlowScreen.fromJson(Map<String, Object?> json) {
    final Object? checklist = json['checklist'];
    return ReportFlowScreen(
      id: _string(json, 'id'),
      title: _string(json, 'title'),
      subtitle: _optionalString(json, 'subtitle'),
      urgent: json['urgent'] == true,
      options: _list(
        json,
        'options',
      ).map(ReportFlowOption.fromJson).toList(growable: false),
      optionsHeading: _optionalString(json, 'options_heading'),
      checklist: checklist is Map<String, Object?>
          ? ReportFlowChecklist.fromJson(checklist)
          : null,
      nextScreenId: _optionalString(json, 'next_screen_id'),
    );
  }

  final String id;
  final String title;
  final String? subtitle;
  final bool urgent;
  final List<ReportFlowOption> options;
  final String? optionsHeading;
  final ReportFlowChecklist? checklist;
  final String? nextScreenId;

  ReportFlowScreenKind get kind {
    if (checklist != null) {
      return ReportFlowScreenKind.checklist;
    }
    if (nextScreenId != null) {
      return ReportFlowScreenKind.info;
    }
    return ReportFlowScreenKind.choice;
  }

  ReportFlowOption? option(String optionId) {
    for (final ReportFlowOption option in options) {
      if (option.id == optionId) {
        return option;
      }
    }
    return null;
  }
}

class ReportFlowNotice {
  const ReportFlowNotice({
    required this.id,
    required this.title,
    required this.body,
  });

  factory ReportFlowNotice.fromJson(Map<String, Object?> json) {
    return ReportFlowNotice(
      id: _string(json, 'id'),
      title: _string(json, 'title'),
      body: _string(json, 'body'),
    );
  }

  final String id;
  final String title;
  final String body;
}

class ReportFlow {
  ReportFlow({
    required this.targetType,
    required this.revisionHash,
    required this.locale,
    required this.startScreenId,
    required List<ReportFlowScreen> screens,
    required List<ReportFlowNotice> notices,
    this.guidelinesUrl,
  }) : _screens = <String, ReportFlowScreen>{
         for (final ReportFlowScreen screen in screens) screen.id: screen,
       },
       _notices = <String, ReportFlowNotice>{
         for (final ReportFlowNotice notice in notices) notice.id: notice,
       } {
    if (!_screens.containsKey(startScreenId)) {
      throw FormatException('Report flow lacks start screen $startScreenId');
    }
  }

  factory ReportFlow.fromJson(Map<String, Object?> json) {
    final String targetType = _string(json, 'target_type');
    return ReportFlow(
      targetType: ReportFlowTargetType.values.firstWhere(
        (ReportFlowTargetType type) => type.wireValue == targetType,
        orElse: () =>
            throw FormatException('Unknown report flow target: $targetType'),
      ),
      revisionHash: _string(json, 'revision_hash'),
      locale: _string(json, 'locale'),
      startScreenId: _string(json, 'start_screen_id'),
      guidelinesUrl: _optionalString(json, 'guidelines_url'),
      screens: _list(
        json,
        'screens',
      ).map(ReportFlowScreen.fromJson).toList(growable: false),
      notices: _list(
        json,
        'notices',
      ).map(ReportFlowNotice.fromJson).toList(growable: false),
    );
  }

  final ReportFlowTargetType targetType;
  final String revisionHash;
  final String locale;
  final String startScreenId;
  final String? guidelinesUrl;
  final Map<String, ReportFlowScreen> _screens;
  final Map<String, ReportFlowNotice> _notices;

  ReportFlowScreen? screen(String screenId) => _screens[screenId];

  ReportFlowNotice? notice(String noticeId) => _notices[noticeId];
}

class ReportFlowStep {
  const ReportFlowStep({required this.screenId, this.optionId, this.itemIds});

  final String screenId;
  final String? optionId;
  final List<String>? itemIds;

  Map<String, Object> toJson() => <String, Object>{
    'screen_id': screenId,
    'option_id': ?optionId,
    'item_ids': ?itemIds,
  };
}

String _string(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is String) {
    return value;
  }
  throw FormatException('Report flow field $key must be a string');
}

String? _optionalString(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  return value is String ? value : null;
}

Map<String, Object?> _map(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is Map<String, Object?>) {
    return value;
  }
  throw FormatException('Report flow field $key must be an object');
}

Iterable<Map<String, Object?>> _list(Map<String, Object?> json, String key) {
  final Object? value = json[key];
  if (value is List<Object?>) {
    return value.map((Object? entry) {
      if (entry is Map<String, Object?>) {
        return entry;
      }
      throw FormatException('Report flow field $key must hold objects');
    });
  }
  throw FormatException('Report flow field $key must be a list');
}
