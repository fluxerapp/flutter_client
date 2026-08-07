import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:protobuf/protobuf.dart' as $pb;

class AccessibilityOverridesLocalState {
  const AccessibilityOverridesLocalState({
    required this.keepAnimatedEmojiUnderReducedMotion,
    required this.keepGifAutoPlayUnderReducedMotion,
    required this.keepStickerAnimationUnderReducedMotion,
  });

  final bool keepAnimatedEmojiUnderReducedMotion;
  final bool keepGifAutoPlayUnderReducedMotion;
  final bool keepStickerAnimationUnderReducedMotion;
}

class AccessibilityOverridesSyncedField
    extends SyncedFieldAdapter<AccessibilityOverridesLocalState> {
  AccessibilityOverridesSyncedField(this._ref);

  final Ref _ref;

  @override
  SyncedPreferenceField get field =>
      SyncedPreferenceField.accessibilityOverrides;

  @override
  AccessibilityOverridesLocalState readLocal() {
    final appearance = _ref.read(appearancePreferencesProvider);
    return AccessibilityOverridesLocalState(
      keepAnimatedEmojiUnderReducedMotion:
          appearance.keepAnimatedEmojiUnderReducedMotion,
      keepGifAutoPlayUnderReducedMotion:
          appearance.keepGifAutoPlayUnderReducedMotion,
      keepStickerAnimationUnderReducedMotion:
          appearance.keepStickerAnimationUnderReducedMotion,
    );
  }

  @override
  Future<void> applyRemote(AccessibilityOverridesLocalState value) async {
    await _ref
        .read(appearancePreferencesProvider.notifier)
        .applySyncedAccessibilityOverrides(
          keepAnimatedEmojiUnderReducedMotion:
              value.keepAnimatedEmojiUnderReducedMotion,
          keepGifAutoPlayUnderReducedMotion:
              value.keepGifAutoPlayUnderReducedMotion,
          keepStickerAnimationUnderReducedMotion:
              value.keepStickerAnimationUnderReducedMotion,
        );
  }

  @override
  AccessibilityOverridesLocalState? readFromProto(
    pb.SyncedPreferences message,
  ) {
    if (!message.hasAccessibilityOverrides()) {
      return null;
    }
    final overrides = message.accessibilityOverrides;
    return AccessibilityOverridesLocalState(
      keepGifAutoPlayUnderReducedMotion: overrides.gifAutoplayDirty,
      keepAnimatedEmojiUnderReducedMotion: overrides.animateEmojiDirty,
      keepStickerAnimationUnderReducedMotion: overrides.animateStickersDirty,
    );
  }

  @override
  $pb.GeneratedMessage? readWireSubMessage(pb.SyncedPreferences wire) {
    return wire.hasAccessibilityOverrides()
        ? wire.accessibilityOverrides
        : null;
  }

  @override
  $pb.GeneratedMessage toProtoMessage(AccessibilityOverridesLocalState local) {
    return toProtoForPush(local: local);
  }

  @override
  $pb.GeneratedMessage toProtoMessageForPush(
    AccessibilityOverridesLocalState local, {
    $pb.GeneratedMessage? wireSubMessage,
  }) {
    return toProtoForPush(
      local: local,
      wireBase: wireSubMessage as accessibility_pb.AccessibilityOverrides?,
    );
  }

  @override
  bool statesEqual(
    AccessibilityOverridesLocalState a,
    AccessibilityOverridesLocalState b,
  ) {
    return a.keepAnimatedEmojiUnderReducedMotion ==
            b.keepAnimatedEmojiUnderReducedMotion &&
        a.keepGifAutoPlayUnderReducedMotion ==
            b.keepGifAutoPlayUnderReducedMotion &&
        a.keepStickerAnimationUnderReducedMotion ==
            b.keepStickerAnimationUnderReducedMotion;
  }

  @override
  AccessibilityOverridesLocalState mergeForMigration({
    required AccessibilityOverridesLocalState local,
    required AccessibilityOverridesLocalState remote,
  }) {
    return remote;
  }

  @override
  bool verifyRoundtrip(AccessibilityOverridesLocalState candidate) {
    final proto =
        toProtoMessage(candidate) as accessibility_pb.AccessibilityOverrides;
    final roundtripped = readFromProto(
      pb.SyncedPreferences(accessibilityOverrides: proto),
    );
    return roundtripped != null && statesEqual(candidate, roundtripped);
  }

  static accessibility_pb.AccessibilityOverrides toProtoForPush({
    required AccessibilityOverridesLocalState local,
    accessibility_pb.AccessibilityOverrides? wireBase,
  }) {
    return (wireBase != null
          ? (accessibility_pb.AccessibilityOverrides()
              ..mergeFromMessage(wireBase))
          : accessibility_pb.AccessibilityOverrides())
      ..gifAutoplayDirty = local.keepGifAutoPlayUnderReducedMotion
      ..animateEmojiDirty = local.keepAnimatedEmojiUnderReducedMotion
      ..animateStickersDirty = local.keepStickerAnimationUnderReducedMotion;
  }
}
