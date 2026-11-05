import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/domain/enforcement_notice.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';

final RegExp _markdownLink = RegExp(r'\[([^\]]+)\]\((https?://[^\s)]+)\)');

class SuspendedAccountScreen extends StatelessWidget {
  const SuspendedAccountScreen({
    required this.notice,
    required this.onBack,
    super.key,
  });

  final EnforcementNotice? notice;
  final VoidCallback onBack;

  String _title(FluxerLocalizations l10n) {
    final EnforcementNotice? current = notice;
    if (current == null || current.isClosure) {
      return l10n.suspendedClosedTitle;
    }
    return current.permanent
        ? l10n.suspendedBannedTitle
        : l10n.suspendedTemporaryTitle;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final EnforcementNotice? current = notice;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Semantics(
          header: true,
          child: Text(
            _title(l10n),
            style: context.textStyles.heading.copyWith(
              color: context.colors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        if (current != null) ..._noticeSections(context, l10n, current),
        SizedBox(height: layout.s6),
        FluxerButton.primary(
          onPressed: onBack,
          label: l10n.suspendedBackToLogin,
        ),
      ],
    );
  }

  List<Widget> _noticeSections(
    BuildContext context,
    FluxerLocalizations l10n,
    EnforcementNotice notice,
  ) {
    final bool showWhy =
        notice.rule != null ||
        notice.facts.isNotEmpty ||
        notice.statement != null;
    final EnforcementNoticeAppeal? appeal = notice.appeal;
    return [
      _Section(
        heading: l10n.suspendedWhatHappened,
        children: [
          _LineText(
            line: notice.summary,
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.textPrimary,
            ),
          ),
          for (final String effect in notice.effects) _LineText(line: effect),
        ],
      ),
      if (showWhy)
        _Section(
          heading: l10n.suspendedWhy,
          children: [
            if (notice.rule case final EnforcementNoticeRule rule)
              _RuleLine(rule: rule),
            for (final String fact in notice.facts) _LineText(line: fact),
            if (notice.statement case final String statement)
              _LineText(line: l10n.suspendedNoteFromTeam(statement)),
          ],
        ),
      if (notice.howWeDecided.isNotEmpty)
        _Section(
          heading: l10n.suspendedHowWeDecided,
          children: [
            for (final String line in notice.howWeDecided)
              _LineText(line: line),
          ],
        ),
      if (appeal != null)
        _Section(
          heading: l10n.suspendedHowToAppeal,
          children: [
            _MailtoText(
              email: appeal.email,
              text: _appealSentence(l10n, appeal),
            ),
            for (final String line in notice.redress)
              _LineText(
                line: line,
                style: context.textStyles.bodySmall.copyWith(
                  color: context.colors.textTertiary,
                ),
              ),
            _MailtoText(
              email: appeal.email,
              text: appeal.accountHasEmail
                  ? l10n.suspendedDeletionRequest(appeal.email)
                  : l10n.suspendedDeletionRequestNoEmail(appeal.email),
            ),
          ],
        ),
      if (notice.decisionId case final String decisionId) ...[
        SizedBox(height: context.layout.s4),
        SelectableText(
          l10n.suspendedDecisionId(decisionId),
          style: context.textStyles.bodySmall.copyWith(
            color: context.colors.textTertiary,
          ),
        ),
      ],
    ];
  }

  String _appealSentence(
    FluxerLocalizations l10n,
    EnforcementNoticeAppeal appeal,
  ) {
    final String? deadline = appeal.deadline?.replaceFirst(RegExp(r'\.$'), '');
    if (deadline == null) {
      return l10n.suspendedAppealNoDeadline(appeal.email);
    }
    if (!appeal.accountHasEmail) {
      return l10n.suspendedAppealNoEmail(appeal.email, deadline);
    }
    return l10n.suspendedAppealWithEmail(appeal.email, deadline);
  }
}

class _Section extends StatelessWidget {
  const _Section({required this.heading, required this.children});

  final String heading;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.only(top: layout.s5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(
              heading,
              style: context.textStyles.bodyMedium.copyWith(
                color: context.colors.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          for (final Widget child in children)
            Padding(
              padding: EdgeInsets.only(top: layout.s2),
              child: child,
            ),
        ],
      ),
    );
  }
}

TextStyle _bodyStyle(BuildContext context) =>
    context.textStyles.bodySmall.copyWith(color: context.colors.textSecondary);

InlineSpan _linkSpan(
  BuildContext context,
  String text,
  TextStyle style,
  VoidCallback onTap,
) {
  return WidgetSpan(
    alignment: PlaceholderAlignment.baseline,
    baseline: TextBaseline.alphabetic,
    child: FluxerTextLink(
      text: text,
      onTap: onTap,
      style: style.copyWith(color: context.colors.textLink),
    ),
  );
}

class _LineText extends StatelessWidget {
  const _LineText({required this.line, this.style});

  final String line;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final TextStyle base = style ?? _bodyStyle(context);
    final List<InlineSpan> spans = <InlineSpan>[];
    int index = 0;
    for (final RegExpMatch match in _markdownLink.allMatches(line)) {
      spans.add(TextSpan(text: line.substring(index, match.start)));
      final String url = match.group(2)!;
      spans.add(
        _linkSpan(
          context,
          match.group(1)!,
          base,
          () => unawaited(handleExternalLinkTap(context, url)),
        ),
      );
      index = match.end;
    }
    spans.add(TextSpan(text: line.substring(index)));
    return Text.rich(TextSpan(style: base, children: spans));
  }
}

class _RuleLine extends StatelessWidget {
  const _RuleLine({required this.rule});

  final EnforcementNoticeRule rule;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final TextStyle base = _bodyStyle(context);
    final String text = l10n.suspendedRule(rule.title);
    final String? url = rule.url;
    final int index = text.indexOf(rule.title);
    if (url == null || index < 0) {
      return Text(text, style: base);
    }
    return Text.rich(
      TextSpan(
        style: base,
        children: [
          TextSpan(text: text.substring(0, index)),
          _linkSpan(
            context,
            rule.title,
            base,
            () => unawaited(handleExternalLinkTap(context, url)),
          ),
          TextSpan(text: text.substring(index + rule.title.length)),
        ],
      ),
    );
  }
}

class _MailtoText extends StatelessWidget {
  const _MailtoText({required this.email, required this.text});

  final String email;
  final String text;

  @override
  Widget build(BuildContext context) {
    final TextStyle base = _bodyStyle(context);
    final int index = text.indexOf(email);
    if (index < 0) {
      return Text(text, style: base);
    }
    return Text.rich(
      TextSpan(
        style: base,
        children: [
          TextSpan(text: text.substring(0, index)),
          _linkSpan(
            context,
            email,
            base,
            () => unawaited(
              handleExternalLinkTap(
                context,
                'mailto:$email',
                skipWarning: true,
              ),
            ),
          ),
          TextSpan(text: text.substring(index + email.length)),
        ],
      ),
    );
  }
}
