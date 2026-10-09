import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/build/push_provider_guard.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_logic.dart';
import 'package:fluxer_app/core/push/relay_consent/push_relay_consent_prompt_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'push_relay_consent_provider.g.dart';

const String _kPushRelayConsentGrantedKey = 'push_relay_consent_granted';

bool pushRelayConsentIsAvailable() {
  if (!PushProviderGuard.isApple && !PushProviderGuard.isFirebaseMessaging) {
    return false;
  }
  return defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;
}

@Riverpod(keepAlive: true)
class PushRelayConsent extends _$PushRelayConsent {
  Future<void>? _loadInFlight;
  bool _isLoaded = false;
  bool _hasDecision = false;

  @override
  bool build() => false;

  Future<void> load() {
    _loadInFlight = _load();
    return _loadInFlight!;
  }

  Future<void> ensureLoaded() {
    if (_isLoaded) {
      return Future<void>.value();
    }
    return _loadInFlight ??= _load();
  }

  Future<void> _load() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    if (_isLoaded) {
      return;
    }
    final bool? stored = preferences.getBool(_kPushRelayConsentGrantedKey);
    _hasDecision = stored != null;
    state = stored ?? false;
    _isLoaded = true;
  }

  Future<void> setEnabled({required bool value}) async {
    _hasDecision = true;
    _isLoaded = true;
    state = value;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kPushRelayConsentGrantedKey, value);
  }
}

Future<bool> ensurePushRelayConsent(Ref ref, String relayUrl) async {
  final bool isOfficialInstance = ref.read(isActiveInstanceOfficialProvider);
  final PushRelayConsent consent = ref.read(pushRelayConsentProvider.notifier);
  await consent.ensureLoaded();
  final bool isConsentGranted = ref.read(pushRelayConsentProvider);
  if (!isPushRelayConsentRequired(
    relayUrl: relayUrl,
    isConsentGranted: isConsentGranted,
    isOfficialInstance: isOfficialInstance,
  )) {
    return true;
  }
  if (shouldPromptForPushRelayConsent(
    relayUrl: relayUrl,
    isConsentGranted: isConsentGranted,
    hasDecision: consent._hasDecision,
    isOfficialInstance: isOfficialInstance,
  )) {
    ref.read(pushRelayConsentPromptProvider.notifier).requestPrompt();
  }
  return false;
}

Future<void> recordPushRelayConsentSheetResult({
  required PushRelayConsent consent,
  required bool? agreed,
}) async {
  await consent.setEnabled(value: agreed ?? false);
}
