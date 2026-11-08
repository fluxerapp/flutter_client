import 'dart:async';
import 'dart:ui' show FlutterView, PlatformDispatcher, TextDirection;

import 'package:flutter/semantics.dart';
import 'package:flutter/widgets.dart' show WidgetsBinding;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/accessibility/providers/screen_reader_active_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/appearance_preferences_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_channel_participants_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_pip_providers.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/features/voice/voice_session_errors.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/gateway.dart' show VoiceState;
import 'package:intl/intl.dart' show Bidi;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'voice_call_announcer_provider.g.dart';

const Duration kVoiceCallAnnouncementBatchWindow = Duration(milliseconds: 1500);
const Duration kVoiceCallAnnouncementSettleDelay = Duration(seconds: 2);
const Duration kVoiceCallLiveRegionClearDelay = Duration(seconds: 4);

class VoiceCallParticipantRoster {
  const VoiceCallParticipantRoster({
    this.key,
    this.namesByUserId = const <String, String>{},
  });

  final String? key;
  final Map<String, String> namesByUserId;
}

@riverpod
VoiceCallParticipantRoster voiceCallParticipantRoster(Ref ref) {
  final String? key = ref.watch(
    voiceSessionProvider.select(voiceSessionParticipantsKey),
  );
  if (key == null) {
    return const VoiceCallParticipantRoster();
  }
  final String? currentUserId = ref.watch(currentUserIdProvider);
  final List<VoiceChannelParticipantData> participants = ref.watch(
    voiceChannelParticipantsProvider(key),
  );
  return VoiceCallParticipantRoster(
    key: key,
    namesByUserId: <String, String>{
      for (final VoiceChannelParticipantData participant in participants)
        if (participant.userId != currentUserId)
          participant.userId:
              participant.user?.globalName ?? participant.user?.username ?? '',
    },
  );
}

typedef VoiceCallServerFlags = ({bool mute, bool deaf});

@riverpod
VoiceCallServerFlags? voiceCallOwnServerFlags(Ref ref) {
  final String? connectionId = ref.watch(
    voiceSessionProvider.select(
      (VoiceSessionState s) => s.isConnected ? s.activeConnectionId : null,
    ),
  );
  if (connectionId == null) {
    return null;
  }
  final VoiceState? voice = ref.watch(
    voiceStateForConnectionProvider(connectionId),
  );
  if (voice == null) {
    return null;
  }
  return (mute: voice.mute || voice.suppress, deaf: voice.deaf);
}

@Riverpod(keepAlive: true)
class VoiceCallAnnouncer extends _$VoiceCallAnnouncer {
  final Map<String, String> _pendingJoins = <String, String>{};
  final Map<String, String> _pendingLeaves = <String, String>{};
  Timer? _batchTimer;
  Timer? _settleTimer;
  Timer? _clearTimer;
  bool _settling = true;
  String? _rosterKey;
  Map<String, String> _roster = const <String, String>{};

  @override
  String? build() {
    ref
      ..onDispose(() {
        _batchTimer?.cancel();
        _settleTimer?.cancel();
        _clearTimer?.cancel();
      })
      ..listen<VoiceSessionState>(voiceSessionProvider, _onSessionChanged)
      ..listen<VoiceCallServerFlags?>(
        voiceCallOwnServerFlagsProvider,
        _onOwnServerFlagsChanged,
        fireImmediately: true,
      )
      ..listen<VoiceCallParticipantRoster>(
        voiceCallParticipantRosterProvider,
        (_, VoiceCallParticipantRoster next) => _onRosterChanged(next),
        fireImmediately: true,
      );
    return null;
  }

  bool get _screenReaderActive => ref.read(screenReaderActiveProvider);

  FluxerLocalizations get _l10n => ref.read(appLocalizationsProvider);

  void announce(String message) {
    if (message.isEmpty || !_screenReaderActive) {
      return;
    }
    final PlatformDispatcher dispatcher =
        WidgetsBinding.instance.platformDispatcher;
    if (dispatcher.accessibilityFeatures.supportsAnnounce) {
      final FlutterView? view = dispatcher.implicitView;
      if (view != null) {
        final TextDirection direction =
            Bidi.isRtlLanguage(dispatcher.locale.languageCode)
            ? TextDirection.rtl
            : TextDirection.ltr;
        unawaited(SemanticsService.sendAnnouncement(view, message, direction));
      }
      return;
    }
    _clearTimer?.cancel();
    state = message;
    _clearTimer = Timer(kVoiceCallLiveRegionClearDelay, () {
      if (ref.mounted) {
        state = null;
      }
    });
  }

  void _onSessionChanged(VoiceSessionState? previous, VoiceSessionState next) {
    final VoiceSessionState prev = previous ?? const VoiceSessionState();
    final FluxerLocalizations l10n = _l10n;
    if (!prev.isReconnecting && next.isReconnecting) {
      _beginSettling();
      announce(l10n.voiceAnnounceReconnecting);
    } else if (prev.isReconnecting &&
        next.isConnected &&
        !next.isReconnecting) {
      _beginSettling();
      announce(l10n.voiceAnnounceReconnected);
    } else if (!prev.isConnected && next.isConnected) {
      _beginSettling();
      announce(l10n.voiceAnnounceConnected);
    }
    if (prev.isConnected &&
        next.isConnected &&
        prev.channelId != null &&
        next.channelId != null &&
        prev.channelId != next.channelId) {
      _beginSettling();
      announce(l10n.voiceAnnounceMoved);
    }
    final String? error = next.errorMessage;
    if (error != null && error != prev.errorMessage) {
      announce(resolveVoiceSessionErrorMessage(error, l10n));
    }
    if (prev.isInVoice && !next.isInVoice) {
      _resetBatch();
      announce(l10n.voiceAnnounceDisconnected);
    }
  }

  void _onOwnServerFlagsChanged(
    VoiceCallServerFlags? previous,
    VoiceCallServerFlags? next,
  ) {
    if (previous == null || next == null) {
      return;
    }
    final FluxerLocalizations l10n = _l10n;
    if (previous.mute != next.mute) {
      announce(
        next.mute
            ? l10n.voiceAnnounceServerMuted
            : l10n.voiceAnnounceServerUnmuted,
      );
    }
    if (previous.deaf != next.deaf) {
      announce(
        next.deaf
            ? l10n.voiceAnnounceServerDeafened
            : l10n.voiceAnnounceServerUndeafened,
      );
    }
  }

  void _beginSettling() {
    _settling = true;
    _resetBatch();
    _settleTimer?.cancel();
    _settleTimer = Timer(kVoiceCallAnnouncementSettleDelay, () {
      _settling = false;
    });
  }

  void _resetBatch() {
    _batchTimer?.cancel();
    _batchTimer = null;
    _pendingJoins.clear();
    _pendingLeaves.clear();
  }

  void _onRosterChanged(VoiceCallParticipantRoster next) {
    final Map<String, String> previous = _roster;
    final bool sameCall = next.key != null && next.key == _rosterKey;
    _rosterKey = next.key;
    _roster = next.namesByUserId;
    if (!sameCall) {
      _beginSettling();
      return;
    }
    if (_settling ||
        !ref.read(voiceSessionProvider).isConnected ||
        !_screenReaderActive ||
        !ref.read(
          appearancePreferencesProvider.select(
            (state) => state.announceCallJoinsAndLeaves,
          ),
        )) {
      return;
    }
    for (final MapEntry<String, String> entry in next.namesByUserId.entries) {
      if (!previous.containsKey(entry.key)) {
        if (_pendingLeaves.remove(entry.key) == null) {
          _pendingJoins[entry.key] = entry.value;
        }
      }
    }
    for (final MapEntry<String, String> entry in previous.entries) {
      if (!next.namesByUserId.containsKey(entry.key)) {
        if (_pendingJoins.remove(entry.key) == null) {
          _pendingLeaves[entry.key] = entry.value;
        }
      }
    }
    if (_pendingJoins.isEmpty && _pendingLeaves.isEmpty) {
      return;
    }
    _batchTimer ??= Timer(kVoiceCallAnnouncementBatchWindow, _flushBatch);
  }

  void _flushBatch() {
    _batchTimer = null;
    final FluxerLocalizations l10n = _l10n;
    final List<String> parts = <String>[
      ?_describe(
        _pendingJoins,
        single: l10n.voiceAnnounceUserJoined,
        many: l10n.voiceAnnounceUsersJoined,
      ),
      ?_describe(
        _pendingLeaves,
        single: l10n.voiceAnnounceUserLeft,
        many: l10n.voiceAnnounceUsersLeft,
      ),
    ];
    _pendingJoins.clear();
    _pendingLeaves.clear();
    if (parts.isNotEmpty) {
      announce(parts.join('. '));
    }
  }

  String? _describe(
    Map<String, String> pending, {
    required String Function(String name) single,
    required String Function(int count) many,
  }) {
    if (pending.isEmpty) {
      return null;
    }
    if (pending.length == 1) {
      final String latest = _roster[pending.keys.first] ?? '';
      final String name = latest.isNotEmpty ? latest : pending.values.first;
      return single(name.isNotEmpty ? name : _l10n.voiceAnnounceSomeone);
    }
    return many(pending.length);
  }
}
