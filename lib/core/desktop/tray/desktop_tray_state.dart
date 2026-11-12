import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/updater/oxygen_update_provider.dart';
import 'package:fluxer_app/core/desktop/updater/oxygen_updater.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart';

@immutable
class DesktopTrayAccount {
  const DesktopTrayAccount({
    required this.userId,
    required this.label,
    required this.isCurrent,
  });

  final String userId;
  final String label;
  final bool isCurrent;

  @override
  bool operator ==(Object other) =>
      other is DesktopTrayAccount &&
      other.userId == userId &&
      other.label == label &&
      other.isCurrent == isCurrent;

  @override
  int get hashCode => Object.hash(userId, label, isCurrent);
}

@immutable
class DesktopTrayMenuState {
  const DesktopTrayMenuState({
    required this.l10n,
    required this.productName,
    required this.signedIn,
    required this.presenceStatus,
    required this.accounts,
    required this.inVoice,
    required this.voiceChannelLabel,
    required this.selfMute,
    required this.selfDeaf,
    required this.updaterEnabled,
    required this.updateAvailable,
  });

  final FluxerLocalizations l10n;
  final String productName;
  final bool signedIn;
  final String? presenceStatus;
  final List<DesktopTrayAccount> accounts;
  final bool inVoice;
  final String? voiceChannelLabel;
  final bool selfMute;
  final bool selfDeaf;
  final bool updaterEnabled;
  final bool updateAvailable;

  @override
  bool operator ==(Object other) =>
      other is DesktopTrayMenuState &&
      identical(other.l10n, l10n) &&
      other.productName == productName &&
      other.signedIn == signedIn &&
      other.presenceStatus == presenceStatus &&
      listEquals(other.accounts, accounts) &&
      other.inVoice == inVoice &&
      other.voiceChannelLabel == voiceChannelLabel &&
      other.selfMute == selfMute &&
      other.selfDeaf == selfDeaf &&
      other.updaterEnabled == updaterEnabled &&
      other.updateAvailable == updateAvailable;

  @override
  int get hashCode => Object.hash(
    l10n,
    productName,
    signedIn,
    presenceStatus,
    Object.hashAll(accounts),
    inVoice,
    voiceChannelLabel,
    selfMute,
    selfDeaf,
    updaterEnabled,
    updateAvailable,
  );
}

final Provider<DesktopTrayMenuState> desktopTrayMenuStateProvider =
    Provider<DesktopTrayMenuState>((Ref ref) {
      final String? currentUserId = ref.watch(currentUserIdProvider);
      final VoiceSessionState voice = ref.watch(voiceSessionProvider);
      final bool inVoice = voice.isInVoice;
      final String? connectionId = voice.activeConnectionId;
      final VoiceState? selfVoiceState = inVoice && connectionId != null
          ? ref.watch(voiceStateForConnectionProvider(connectionId))
          : null;
      final localVoice = ref.watch(localVoiceStateProvider);
      final String? channelId = voice.channelId;
      final List<StoredAccount> storedAccounts = ref.watch(
        accountManagerProvider.select((state) => state.accounts),
      );
      return DesktopTrayMenuState(
        l10n: ref.watch(appLocalizationsProvider),
        productName: ref.watch(
          instanceRuntimeConfigProvider.select((config) => config.productName),
        ),
        signedIn: currentUserId != null,
        presenceStatus: ref.watch(
          userSettingsStatusProvider.select((settings) => settings?.status),
        ),
        accounts: [
          for (final StoredAccount account in storedAccounts)
            DesktopTrayAccount(
              userId: account.userId,
              label: account.identifier,
              isCurrent: account.userId == currentUserId,
            ),
        ],
        inVoice: inVoice,
        voiceChannelLabel: inVoice && channelId != null
            ? ref.watch(channelByIdProvider(channelId).select(_channelLabel))
            : null,
        selfMute: inVoice
            ? (selfVoiceState?.selfMute ?? false)
            : localVoice.selfMute,
        selfDeaf: inVoice
            ? (selfVoiceState?.selfDeaf ?? false)
            : localVoice.selfDeaf,
        updaterEnabled: OxygenUpdater.isInitialized,
        updateAvailable:
            ref.watch(oxygenUpdateProvider) == OxygenUpdateStatus.available,
      );
    });

String? _channelLabel(AsyncValue<Channel?> value) {
  final String? name = value.value?.name.trim();
  return name == null || name.isEmpty ? null : name;
}
