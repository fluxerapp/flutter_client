import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/mute_duration_sheet.dart';
import 'package:fluxer_app/features/channels/providers/channel_notification_menu_provider.dart';
import 'package:fluxer_app/features/guilds/data/guild_user_settings_repository.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum ChannelNotificationMenuLayout { actionMenu, bottomSheet }

class ChannelNotificationMenuContent extends ConsumerWidget {
  const ChannelNotificationMenuContent({
    required this.channel,
    required this.onClose,
    this.layout = ChannelNotificationMenuLayout.bottomSheet,
    super.key,
  });

  final Channel channel;
  final VoidCallback onClose;
  final ChannelNotificationMenuLayout layout;

  bool get _isActionMenu => layout == ChannelNotificationMenuLayout.actionMenu;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<ChannelNotificationMenuState> menuStateAsync = ref.watch(
      channelNotificationMenuStateProvider(channel),
    );

    return menuStateAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(16),
        child: SizedBox(
          width: 24,
          height: 24,
          child: CircularProgressIndicator(strokeWidth: 2),
        ),
      ),
      error: (_, _) => const SizedBox.shrink(),
      data: (ChannelNotificationMenuState menuState) {
        return _isActionMenu
            ? _buildActionMenu(context, ref, l10n, menuState)
            : _buildBottomSheetMenu(context, ref, l10n, menuState);
      },
    );
  }

  Widget _buildActionMenu(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    ChannelNotificationMenuState menuState,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        ..._muteItems(context, ref, l10n, menuState),
        const FluxerMenuDivider(),
        ..._defaultItems(context, ref, l10n, menuState),
        const FluxerMenuDivider(),
        ..._levelItems(context, ref, l10n, menuState),
      ],
    );
  }

  Widget _buildBottomSheetMenu(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    ChannelNotificationMenuState menuState,
  ) {
    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.symmetric(vertical: 4),
      ),
      child: FluxerBottomSheetGroupColumn(
        children: <Widget>[
          FluxerMenuGroup(children: _muteItems(context, ref, l10n, menuState)),
          FluxerMenuGroup(
            children: _defaultItems(context, ref, l10n, menuState),
          ),
          FluxerMenuGroup(children: _levelItems(context, ref, l10n, menuState)),
        ],
      ),
    );
  }

  List<Widget> _muteItems(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    ChannelNotificationMenuState menuState,
  ) {
    final String? mutedHint = formatMutedHintText(menuState.muteConfig);

    if (menuState.isMuted) {
      if (_isActionMenu) {
        return <Widget>[
          FluxerMenuItem(
            label: l10n.notificationUnmuteChannel,
            hint: mutedHint,
            trailingIcon: PhosphorIconsFill.bellSlash,
            onPressed: () {
              onClose();
              unawaited(_unmute(context, ref));
            },
          ),
        ];
      }
      return <Widget>[
        FluxerBottomSheetMenuItem(
          label: l10n.notificationUnmuteChannel,
          hint: mutedHint,
          icon: PhosphorIconsFill.bellSlash,
          onTap: () {
            onClose();
            unawaited(_unmute(context, ref));
          },
        ),
      ];
    }

    if (_isActionMenu) {
      return <Widget>[
        FluxerMenuSubmenuItem(
          label: l10n.notificationMuteChannel,
          onPressed: () {
            onClose();
            unawaited(_openMuteSheet(context, ref));
          },
        ),
      ];
    }
    return <Widget>[
      FluxerBottomSheetSubmenuItem(
        label: l10n.notificationMuteChannel,
        onTap: () {
          onClose();
          unawaited(_openMuteSheet(context, ref));
        },
      ),
    ];
  }

  List<Widget> _defaultItems(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    ChannelNotificationMenuState menuState,
  ) {
    final String defaultLabel = menuState.hasCategory
        ? l10n.notificationUseCategoryDefault
        : l10n.notificationUseCommunityDefault;
    final String defaultHint = channelNotificationLevelLabel(
      l10n,
      menuState.effectiveDefault,
    );
    return <Widget>[
      _radioItem(
        label: defaultLabel,
        hint: defaultHint,
        isSelected: menuState.selected == UserNotificationSettings.inherit,
        onSelect: () => _setNotificationLevel(
          context,
          ref,
          UserNotificationSettings.inherit,
        ),
      ),
    ];
  }

  List<Widget> _levelItems(
    BuildContext context,
    WidgetRef ref,
    FluxerLocalizations l10n,
    ChannelNotificationMenuState menuState,
  ) {
    final List<({UserNotificationSettings value, String label})> options =
        <({UserNotificationSettings value, String label})>[
          (
            value: UserNotificationSettings.allMessages,
            label: l10n.notificationAllMessages,
          ),
          (
            value: UserNotificationSettings.onlyMentions,
            label: l10n.notificationOnlyAtMentions,
          ),
          (
            value: UserNotificationSettings.noMessages,
            label: l10n.notificationNothing,
          ),
        ];

    return options
        .map(
          (({UserNotificationSettings value, String label}) option) =>
              _radioItem(
                label: option.label,
                isSelected: menuState.selected == option.value,
                onSelect: () =>
                    _setNotificationLevel(context, ref, option.value),
              ),
        )
        .toList();
  }

  Widget _radioItem({
    required String label,
    required bool isSelected,
    required Future<void> Function() onSelect,
    String? hint,
  }) {
    if (_isActionMenu) {
      return FluxerMenuRadioItem(
        label: label,
        hint: hint,
        isSelected: isSelected,
        onPressed: () {
          onClose();
          unawaited(onSelect());
        },
      );
    }
    return FluxerBottomSheetMenuRadioItem(
      label: label,
      hint: hint,
      isSelected: isSelected,
      onTap: () {
        onClose();
        unawaited(onSelect());
      },
    );
  }

  Future<void> _setNotificationLevel(
    BuildContext context,
    WidgetRef ref,
    UserNotificationSettings setting,
  ) async {
    await ref
        .read(guildUserSettingsRepositoryProvider)
        .updateChannelOverride(
          guildId: channel.guildId,
          channelId: channel.id,
          messageNotifications: setting,
        );
    if (context.mounted) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: FluxerLocalizations.of(
                context,
              ).channelDetailsNotificationSettingsUpdated,
              variant: FluxerToastVariant.success,
            ),
          );
    }
  }

  Future<void> _unmute(BuildContext context, WidgetRef ref) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    await ref
        .read(guildUserSettingsRepositoryProvider)
        .updateChannelOverride(
          guildId: channel.guildId,
          channelId: channel.id,
          muted: false,
        );
    if (context.mounted) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.channelDetailsUnmutedChannel,
              variant: FluxerToastVariant.success,
            ),
          );
    }
  }

  Future<void> _openMuteSheet(BuildContext context, WidgetRef ref) async {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MuteSelection? selection = await showMuteDurationSheet(
      context,
      muteTitle: l10n.notificationMuteChannel,
    );
    if (selection == null || !context.mounted) {
      return;
    }
    await ref
        .read(guildUserSettingsRepositoryProvider)
        .updateChannelOverride(
          guildId: channel.guildId,
          channelId: channel.id,
          muted: true,
          durationSeconds: selection.durationSeconds,
        );
    if (context.mounted) {
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.channelDetailsMutedChannel,
              variant: FluxerToastVariant.success,
            ),
          );
    }
  }
}
