import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/profile/presentation/user_profile_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/blocked_users_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserBlockedUsers extends ConsumerWidget {
  const UserBlockedUsers({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blockedAsync = ref.watch(blockedUsersViewModelProvider);
    final colors = context.colors;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);

    final Widget body = blockedAsync.when(
      loading: () => const Center(child: FluxerLoadingSpinner()),
      error: (_, _) => Center(
        child: Padding(
          padding: EdgeInsets.all(layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              PhosphorIcon(
                PhosphorIconsFill.networkSlash,
                size: 48,
                color: colors.textPrimaryMuted,
              ),
              SizedBox(height: layout.s3),
              Text(
                l10n.blockedUsersLoadError,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textPrimaryMuted,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: layout.s4),
              FluxerButton.primary(
                label: l10n.retry,
                onPressed: () => ref.invalidate(blockedUsersViewModelProvider),
              ),
            ],
          ),
        ),
      ),
      data: (blocked) {
        if (blocked.isEmpty) {
          return Center(
            child: Padding(
              padding: EdgeInsets.all(layout.s4),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PhosphorIcon(
                    PhosphorIconsFill.prohibit,
                    size: 48,
                    color: colors.textPrimaryMuted,
                  ),
                  SizedBox(height: layout.s3),
                  Text(
                    l10n.blockedUsersEmptyTitle,
                    style: context.textStyles.heading.copyWith(
                      color: colors.textPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: layout.s1),
                  Text(
                    l10n.blockedUsersEmptyDescription,
                    style: context.textStyles.bodySmall.copyWith(
                      color: colors.textPrimaryMuted,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.all(layout.s4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FluxerSettingsSection(
                title: l10n.blockedUsersTitle,
                description: l10n.blockedUsersDescription,
                isFirst: true,
                density: FluxerSettingsSectionDensity.compact,
                children: [
                  for (final friend in blocked)
                    _BlockedUserCard(
                      friend: friend,
                      onUnblock: () => _handleUnblock(context, ref, friend),
                      onMoreOptions: (position) =>
                          _showMoreOptions(context, friend, position),
                    ),
                ],
              ),
            ],
          ),
        );
      },
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final minHeight = constraints.hasBoundedHeight
            ? constraints.maxHeight
            : 0.0;
        return SingleChildScrollView(
          controller: scrollController,
          padding: settingsScrollPadding(context),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: minHeight),
            child: body,
          ),
        );
      },
    );
  }

  Future<void> _handleUnblock(
    BuildContext context,
    WidgetRef ref,
    Friend friend,
  ) async {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final notifier = ref.read(blockedUsersViewModelProvider.notifier);

    await FluxerBottomSheet.show<void>(
      context,
      title: l10n.blockedUsersUnblockTitle,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: layout.s4),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.blockedUsersUnblockDescription(friend.username),
                style: sheetContext.textStyles.bodySmall.copyWith(
                  color: colors.textPrimary,
                ),
              ),
              SizedBox(height: layout.s4),
              FluxerButton.primary(
                label: l10n.blockedUsersUnblock,
                onPressedAsync: () async {
                  await notifier.unblock(friend.id);
                  if (sheetContext.mounted) {
                    close();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _showMoreOptions(
    BuildContext context,
    Friend friend,
    Offset position,
  ) async {
    final l10n = FluxerLocalizations.of(context);

    await FluxerActionMenu.show(
      context,
      position: position,
      builder: (menuContext, close) => [
        FluxerMenuItem(
          label: l10n.blockedUsersCopyTag,
          icon: PhosphorIconsBold.copy,
          onPressed: () async {
            close();
            await copyToClipboard(context: menuContext, value: friend.tag);
          },
        ),
        FluxerMenuItem(
          label: l10n.blockedUsersCopyId,
          icon: PhosphorIconsBold.identificationCard,
          onPressed: () async {
            close();
            await copyToClipboard(context: menuContext, value: friend.id);
          },
        ),
      ],
    );
  }
}

// ---------------------------------------------------------------------------
// Card
// ---------------------------------------------------------------------------

class _BlockedUserCard extends StatelessWidget {
  _BlockedUserCard({
    required this.friend,
    required this.onUnblock,
    required this.onMoreOptions,
  });

  final Friend friend;
  final VoidCallback onUnblock;
  final ValueChanged<Offset> onMoreOptions;

  final GlobalKey _moreButtonKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;

    return FluxerTappable(
      onTap: () => FluxerUserProfileSheet.show(context, userId: friend.id),
      builder: (context, _) => Container(
        decoration: BoxDecoration(
          color: colors.backgroundSecondary,
          border: Border.all(color: colors.borderColor),
          borderRadius: layout.radiusMd,
        ),
        padding: EdgeInsets.all(layout.s3),
        child: Row(
          children: [
            FluxerAvatar.user(
              fallbackText: friend.displayName,
              userId: friend.id,
              imageUrl: FluxerMediaUrl.userAvatar(
                userId: friend.id,
                hash: friend.avatar,
              ),
              avatarColor: friend.avatarColor,
              showStatus: false,
            ),
            SizedBox(width: layout.s3),
            Expanded(child: _buildName(context, colors)),
            SizedBox(width: layout.s2),
            FluxerButton.secondary(
              label: FluxerLocalizations.of(context).blockedUsersUnblock,
              size: FluxerButtonSize.compact,
              fitContent: true,
              onPressed: onUnblock,
            ),
            SizedBox(width: layout.s2),
            FluxerButton.secondary(
              key: _moreButtonKey,
              icon: PhosphorIconsBold.dotsThreeVertical,
              isSquare: true,
              size: FluxerButtonSize.compact,
              onPressed: _emitMorePosition,
            ),
          ],
        ),
      ),
    );
  }

  void _emitMorePosition() {
    final renderBox =
        _moreButtonKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) {
      return;
    }
    final position = renderBox.localToGlobal(Offset(0, renderBox.size.height));
    onMoreOptions(position);
  }

  Widget _buildName(BuildContext context, FluxerColorTheme colors) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        style: context.textStyles.bodySmall.copyWith(
          color: colors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        children: [
          TextSpan(text: friend.username),
          TextSpan(
            text: '#${friend.discriminator}',
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimary.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    );
  }
}
