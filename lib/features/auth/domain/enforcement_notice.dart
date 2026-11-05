class EnforcementNoticeRule {
  const EnforcementNoticeRule({required this.title, this.url});

  final String title;
  final String? url;
}

class EnforcementNoticeAppeal {
  const EnforcementNoticeAppeal({
    required this.email,
    required this.accountHasEmail,
    this.deadline,
  });

  final String email;
  final String? deadline;
  final bool accountHasEmail;
}

class EnforcementNotice {
  const EnforcementNotice({
    required this.kind,
    required this.permanent,
    required this.summary,
    this.decisionId,
    this.effects = const <String>[],
    this.rule,
    this.facts = const <String>[],
    this.statement,
    this.howWeDecided = const <String>[],
    this.appeal,
    this.redress = const <String>[],
  });

  final String kind;
  final bool permanent;
  final String summary;
  final String? decisionId;
  final List<String> effects;
  final EnforcementNoticeRule? rule;
  final List<String> facts;
  final String? statement;
  final List<String> howWeDecided;
  final EnforcementNoticeAppeal? appeal;
  final List<String> redress;

  bool get isClosure => kind == 'closure';

  static EnforcementNotice? tryParse(Object? json) {
    if (json is! Map) {
      return null;
    }
    final Object? kind = json['kind'];
    final Object? summary = json['summary'];
    if (kind is! String || summary is! String) {
      return null;
    }
    final Object? rule = json['rule'];
    final Object? appeal = json['appeal'];
    return EnforcementNotice(
      kind: kind,
      permanent: json['permanent'] == true,
      summary: summary,
      decisionId: _string(json['decision_id']),
      effects: _strings(json['effects']),
      rule: rule is Map && rule['title'] is String
          ? EnforcementNoticeRule(
              title: rule['title'] as String,
              url: _string(rule['url']),
            )
          : null,
      facts: _strings(json['facts']),
      statement: _string(json['statement']),
      howWeDecided: _strings(json['how_we_decided']),
      appeal: appeal is Map && appeal['email'] is String
          ? EnforcementNoticeAppeal(
              email: appeal['email'] as String,
              deadline: _string(appeal['deadline']),
              accountHasEmail: appeal['account_has_email'] == true,
            )
          : null,
      redress: _strings(json['redress']),
    );
  }

  static String? _string(Object? value) {
    if (value is String && value.isNotEmpty) {
      return value;
    }
    if (value is num) {
      return value.toString();
    }
    return null;
  }

  static List<String> _strings(Object? value) {
    if (value is! List) {
      return const <String>[];
    }
    return value.whereType<String>().toList(growable: false);
  }
}
