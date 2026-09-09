import 'dart:async';

import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_action.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_action_items.dart';
import 'package:fluxer_app/core/quick_actions/home_quick_actions_plugin.dart';
import 'package:fluxer_app/core/quick_actions/pending_home_quick_action_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_quick_actions_binding.g.dart';

@Riverpod(keepAlive: true)
class HomeQuickActionsBinding extends _$HomeQuickActionsBinding {
  @override
  void build() {
    if (!isFluxerNativeMobileOs) {
      return;
    }

    final HomeQuickActionsPlugin plugin = ref.read(
      homeQuickActionsPluginProvider,
    );
    unawaited(
      plugin.initialize((String type) {
        if (!ref.mounted) {
          return;
        }
        final HomeQuickAction? action = HomeQuickAction.tryParse(type);
        if (action == null) {
          talker.info('[HomeQuickAction] Ignored unknown type: $type');
          return;
        }
        ref.read(pendingHomeQuickActionProvider.notifier).store(action);
      }),
    );

    ref
      ..listen(appLocalizationsProvider, (_, _) {
        unawaited(_syncItems());
      })
      ..listen<InstanceRuntimeConfig>(instanceRuntimeConfigProvider, (
        InstanceRuntimeConfig? previous,
        InstanceRuntimeConfig next,
      ) {
        if (previous?.directMessagesDisabled == next.directMessagesDisabled) {
          return;
        }
        unawaited(_syncItems());
      });
    unawaited(_syncItems());
  }

  Future<void> _syncItems() async {
    if (!ref.mounted) {
      return;
    }
    final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
    final bool includeDms = !ref
        .read(instanceRuntimeConfigProvider)
        .directMessagesDisabled;
    if (!ref.mounted) {
      return;
    }
    try {
      await ref
          .read(homeQuickActionsPluginProvider)
          .setShortcutItems(
            buildHomeQuickActionItems(
              titles: HomeQuickActionTitles(
                dms: l10n.homeQuickActionDms,
                search: l10n.quickSwitcherTabSearch,
                notifications: l10n.notificationsPageTitle,
              ),
              includeDms: includeDms,
            ),
          );
    } on Exception catch (e) {
      talker.warning('[HomeQuickAction] Failed to set shortcut items: $e');
    }
  }
}
