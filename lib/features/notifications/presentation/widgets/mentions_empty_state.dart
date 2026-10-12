import 'package:fluxer_app/features/notifications/presentation/widgets/notifications_empty_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MentionsEmptyState extends StatelessWidget {
  const MentionsEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return NotificationsEmptyState(
      icon: PhosphorIconsBold.at,
      title: l10n.notificationsNoMentionsTitle,
      body: l10n.notificationsNoMentionsBody,
    );
  }
}
