import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/publish_message_sheets.dart';
import 'package:fluxer_app/features/chat/providers/publish_nudge_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CrosspostPublishNudge extends ConsumerWidget {
  const CrosspostPublishNudge({required this.message, super.key});

  final Message message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? nudgeId = ref.watch(publishNudgeMessageIdProvider);
    if (nudgeId != message.id) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          PhosphorIcon(
            PhosphorIconsBold.megaphone,
            size: 16,
            color: context.colors.textTertiary,
          ),
          Text(
            l10n.publishNudgeNotSent,
            style: context.textStyles.smallText.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          FluxerButton.primary(
            onPressed: () => unawaited(
              publishMessage(ref: ref, context: context, message: message),
            ),
            label: l10n.chatMessagePublish,
            size: FluxerButtonSize.small,
            fitContent: true,
          ),
          FluxerButton.secondary(
            onPressed: () => ref
                .read(publishNudgeControllerProvider.notifier)
                .dismiss(message.id),
            label: l10n.publishNudgeDismiss,
            size: FluxerButtonSize.small,
            fitContent: true,
          ),
          FluxerButton.ghost(
            onPressed: () => unawaited(
              ref.read(publishNudgeControllerProvider.notifier).hideForever(),
            ),
            label: l10n.publishNudgeHideForever,
            size: FluxerButtonSize.small,
            fitContent: true,
          ),
        ],
      ),
    );
  }
}
