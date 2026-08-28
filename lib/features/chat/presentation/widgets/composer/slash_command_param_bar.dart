import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/service/composer_slash_session.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SlashCommandParamBar extends StatelessWidget {
  const SlashCommandParamBar({
    required this.session,
    required this.onClear,
    super.key,
  });

  final ComposerSlashSession session;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final ComposerSlashSlotState? slot = session.focusedSlot;
    final bool showRequiredError = session.showRequiredError;
    final String name = slot?.option.name ?? '';
    final String? description = showRequiredError
        ? null
        : slot?.option.description;
    final Color requiredErrorColor = Color.lerp(
      context.colors.statusDanger,
      context.colors.textPrimary,
      0.32,
    )!;
    final Color muted = context.colors.textPrimaryMuted;
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 6, 0),
      child: SizedBox(
        height: WideComposerLayout.actionRowMinHeight,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  if (name.isNotEmpty) ...<Widget>[
                    Text(
                      name,
                      maxLines: 1,
                      style: context.textStyles.bodyMedium.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        height: 1.35,
                        color: context.colors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 7),
                  ],
                  if (showRequiredError)
                    Expanded(
                      child: Text(
                        l10n.composerCommandOptionRequired,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.timestamp.copyWith(
                          fontSize: 12,
                          height: 1.35,
                          color: requiredErrorColor,
                        ),
                      ),
                    )
                  else if (description != null && description.isNotEmpty)
                    Expanded(
                      child: Text(
                        description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.timestamp.copyWith(
                          fontSize: 12,
                          height: 1.35,
                          color: muted,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              width: WideComposerLayout.actionButtonExtent,
              height: WideComposerLayout.actionButtonExtent,
              child: IconButton(
                tooltip: l10n.composerCommandClear,
                onPressed: onClear,
                style: ButtonStyle(
                  padding: const WidgetStatePropertyAll<EdgeInsets>(
                    EdgeInsets.zero,
                  ),
                  overlayColor: const WidgetStatePropertyAll<Color>(
                    Colors.transparent,
                  ),
                  foregroundColor: WidgetStateProperty.resolveWith<Color>((
                    Set<WidgetState> states,
                  ) {
                    if (states.contains(WidgetState.hovered) ||
                        states.contains(WidgetState.pressed)) {
                      return context.colors.textPrimary;
                    }
                    return muted;
                  }),
                ),
                icon: const PhosphorIcon(
                  PhosphorIconsRegular.xCircle,
                  size: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
