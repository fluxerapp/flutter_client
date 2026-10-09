import 'package:fluxer_app/features/moderation/domain/report_flow.dart';

enum ReportFlowPhase { screen, summary, notice, thanks }

class ReportFlowWalk {
  const ReportFlowWalk._({
    required this.flow,
    required this.steps,
    required this.screenId,
    required this.phase,
    required this.drafts,
    this.noticeId,
    this.reportSent = false,
  });

  factory ReportFlowWalk.start(ReportFlow flow) {
    return ReportFlowWalk._(
      flow: flow,
      steps: const <ReportFlowStep>[],
      screenId: flow.startScreenId,
      phase: ReportFlowPhase.screen,
      drafts: const <String, Set<String>>{},
    );
  }

  final ReportFlow flow;
  final List<ReportFlowStep> steps;
  final String screenId;
  final ReportFlowPhase phase;
  final Map<String, Set<String>> drafts;
  final String? noticeId;
  final bool reportSent;

  ReportFlowScreen get screen => flow.screen(screenId)!;

  ReportFlowNotice? get notice {
    final String? id = noticeId;
    return id == null ? null : flow.notice(id);
  }

  int get depth =>
      steps.length +
      (phase == ReportFlowPhase.notice || phase == ReportFlowPhase.thanks
          ? 1
          : 0);

  bool get isAtStart => steps.isEmpty;

  bool get endedOnStartScreen =>
      phase == ReportFlowPhase.thanks &&
      !reportSent &&
      screenId == flow.startScreenId;

  bool get canGoBack =>
      steps.isNotEmpty &&
      (phase == ReportFlowPhase.screen || phase == ReportFlowPhase.summary);

  Set<String> get checkedItems => drafts[screenId] ?? const <String>{};

  bool get canContinueChecklist {
    final ReportFlowChecklist? checklist = screen.checklist;
    return phase == ReportFlowPhase.screen &&
        checklist != null &&
        checkedItems.length >= checklist.minChecked;
  }

  bool get showsUrgentBanner {
    switch (phase) {
      case ReportFlowPhase.screen:
        return screen.urgent;
      case ReportFlowPhase.summary:
        return steps.any(
          (ReportFlowStep step) => flow.screen(step.screenId)?.urgent ?? false,
        );
      case ReportFlowPhase.notice:
      case ReportFlowPhase.thanks:
        return false;
    }
  }

  List<String> get categoryLabels {
    final List<String> labels = <String>[];
    for (final ReportFlowStep step in steps) {
      final ReportFlowScreen? stepScreen = flow.screen(step.screenId);
      if (stepScreen == null) {
        continue;
      }
      final String? optionId = step.optionId;
      final List<String>? itemIds = step.itemIds;
      if (optionId != null) {
        final ReportFlowOption? option = stepScreen.option(optionId);
        if (option != null) {
          labels.add(option.label);
        }
      } else if (itemIds != null) {
        labels.addAll(
          (stepScreen.checklist?.items ?? const <ReportFlowChecklistItem>[])
              .where(
                (ReportFlowChecklistItem item) => itemIds.contains(item.id),
              )
              .map((ReportFlowChecklistItem item) => item.label),
        );
      }
    }
    return labels;
  }

  ReportFlowWalk chooseOption(String optionId) {
    if (phase != ReportFlowPhase.screen ||
        screen.kind == ReportFlowScreenKind.checklist) {
      return this;
    }
    final ReportFlowOption? option = screen.option(optionId);
    if (option == null) {
      return this;
    }
    final ReportFlowOutcome outcome = option.outcome;
    final ReportFlowStep step = ReportFlowStep(
      screenId: screenId,
      optionId: optionId,
    );
    switch (outcome.type) {
      case ReportFlowOutcomeType.screen:
        return _advance(step, outcome);
      case ReportFlowOutcomeType.submit:
        return _copy(
          steps: <ReportFlowStep>[...steps, step],
          phase: ReportFlowPhase.summary,
        );
      case ReportFlowOutcomeType.end:
        final String? endNotice = outcome.noticeId;
        if (endNotice != null && flow.notice(endNotice) != null) {
          return _copy(phase: ReportFlowPhase.notice, noticeId: endNotice);
        }
        return _copy(phase: ReportFlowPhase.thanks);
      case ReportFlowOutcomeType.link:
        return this;
    }
  }

  ReportFlowWalk toggleItem(String itemId) {
    final ReportFlowChecklist? checklist = screen.checklist;
    if (phase != ReportFlowPhase.screen ||
        checklist == null ||
        !checklist.items.any(
          (ReportFlowChecklistItem item) => item.id == itemId,
        )) {
      return this;
    }
    final Set<String> next = <String>{...checkedItems};
    if (!next.remove(itemId)) {
      next.add(itemId);
    }
    return _copy(
      drafts: <String, Set<String>>{
        ...drafts,
        screenId: Set.unmodifiable(next),
      },
    );
  }

  ReportFlowWalk continueChecklist() {
    final ReportFlowChecklist? checklist = screen.checklist;
    if (checklist == null || !canContinueChecklist) {
      return this;
    }
    final Set<String> checked = checkedItems;
    final ReportFlowStep step = ReportFlowStep(
      screenId: screenId,
      itemIds: checklist.items
          .where((ReportFlowChecklistItem item) => checked.contains(item.id))
          .map((ReportFlowChecklistItem item) => item.id)
          .toList(growable: false),
    );
    switch (checklist.outcome.type) {
      case ReportFlowOutcomeType.screen:
        return _advance(step, checklist.outcome);
      case ReportFlowOutcomeType.submit:
        return _copy(
          steps: <ReportFlowStep>[...steps, step],
          phase: ReportFlowPhase.summary,
        );
      case ReportFlowOutcomeType.end:
      case ReportFlowOutcomeType.link:
        return this;
    }
  }

  ReportFlowWalk continueInfo() {
    final String? next = screen.nextScreenId;
    if (phase != ReportFlowPhase.screen ||
        next == null ||
        flow.screen(next) == null) {
      return this;
    }
    return _copy(
      steps: <ReportFlowStep>[
        ...steps,
        ReportFlowStep(screenId: screenId),
      ],
      screenId: next,
    );
  }

  ReportFlowWalk back() {
    if (!canGoBack) {
      return this;
    }
    final ReportFlowStep last = steps.last;
    return _copy(
      steps: steps.sublist(0, steps.length - 1),
      screenId: last.screenId,
      phase: ReportFlowPhase.screen,
    );
  }

  ReportFlowWalk markSent() {
    if (phase != ReportFlowPhase.summary) {
      return this;
    }
    return _copy(phase: ReportFlowPhase.thanks, reportSent: true);
  }

  ReportFlowWalk _advance(ReportFlowStep step, ReportFlowOutcome outcome) {
    final String? next = outcome.screenId;
    if (next == null || flow.screen(next) == null) {
      return this;
    }
    return _copy(steps: <ReportFlowStep>[...steps, step], screenId: next);
  }

  ReportFlowWalk _copy({
    List<ReportFlowStep>? steps,
    String? screenId,
    ReportFlowPhase? phase,
    Map<String, Set<String>>? drafts,
    String? noticeId,
    bool reportSent = false,
  }) {
    return ReportFlowWalk._(
      flow: flow,
      steps: List.unmodifiable(steps ?? this.steps),
      screenId: screenId ?? this.screenId,
      phase: phase ?? this.phase,
      drafts: Map.unmodifiable(drafts ?? this.drafts),
      noticeId: noticeId,
      reportSent: reportSent,
    );
  }
}
