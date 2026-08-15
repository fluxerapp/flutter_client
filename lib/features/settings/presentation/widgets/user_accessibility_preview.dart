import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/accessibility/effective_motion_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/markdown/fluxer_markdown_adapter.dart';
import 'package:fluxer_markdown/fluxer_markdown.dart';
import 'package:material_ui/material_ui.dart';

const String kAccessibilityLinkPreviewExampleUrl = 'https://fluxer.app';
const Color _kPreviewUsernameColor = Color(0xFFE91E63);

class UserAccessibilityPreview extends ConsumerWidget {
  const UserAccessibilityPreview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final appearance = ref.watch(appearancePreferencesProvider);
    final userSettings = ref.watch(userSettingsViewModelProvider);
    final String authorName = userSettings.displayName.trim().isEmpty
        ? l10n.accessibilityPreviewUserName
        : userSettings.displayName;
    final String message = l10n.accessibilityPreviewLinksMessage(
      kAccessibilityLinkPreviewExampleUrl,
    );
    final String? avatarUrl = FluxerMediaUrl.userAvatar(
      userId: userSettings.userId,
      hash: userSettings.avatar,
    );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.backgroundModifierAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              FluxerButton.primary(
                label: l10n.accessibilityPreviewButtonLabel,
                size: FluxerButtonSize.small,
                fitContent: true,
                onPressed: () {},
              ),
              const SizedBox(width: 12),
              const FluxerAvatar.user(
                userId: '100',
                fallbackText: 'A',
                status: 'online',
                size: 32,
              ),
              const SizedBox(width: 12),
              const FluxerAvatar.user(
                userId: '101',
                fallbackText: 'B',
                status: 'dnd',
                size: 32,
              ),
              const SizedBox(width: 12),
              const FluxerAvatar.user(
                userId: '102',
                fallbackText: 'C',
                status: 'idle',
                size: 32,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FluxerAvatar.user(
                userId: userSettings.userId,
                fallbackText: authorName,
                imageUrl: avatarUrl,
                showStatus: false,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      authorName,
                      style: context.textStyles.username.copyWith(
                        color: _kPreviewUsernameColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 2),
                    FluxerMarkdown(
                      data: message,
                      config: createFluxerMarkdownConfig(
                        context: context,
                        alwaysUnderlineLinks: appearance.alwaysUnderlineLinks,
                        dimStrikethroughText: appearance.dimStrikethroughText,
                        animateCustomEmoji: effectiveMotionOf(
                          ref,
                          context,
                        ).effectiveAnimateEmoji,
                      ),
                      baseStyle: context.textStyles.messageText.copyWith(
                        color: colors.textChat,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
