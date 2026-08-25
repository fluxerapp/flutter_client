import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/synced_preferences/engine/proto_synced_field_adapter.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/accessibility.pb.dart'
    as accessibility_pb;
import 'package:fluxer_app/core/synced_preferences/generated/fluxer/user/preferences/v1/preferences.pb.dart'
    as pb;
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';

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
    extends
        ProtoSyncedFieldAdapter<
          AccessibilityOverridesLocalState,
          accessibility_pb.AccessibilityOverrides
        > {
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
  bool hasField(pb.SyncedPreferences message) {
    return message.hasAccessibilityOverrides();
  }

  @override
  accessibility_pb.AccessibilityOverrides readSubMessage(
    pb.SyncedPreferences message,
  ) {
    return message.accessibilityOverrides;
  }

  @override
  AccessibilityOverridesLocalState fromProto(
    accessibility_pb.AccessibilityOverrides proto,
  ) {
    return AccessibilityOverridesLocalState(
      keepGifAutoPlayUnderReducedMotion: proto.gifAutoplayDirty,
      keepAnimatedEmojiUnderReducedMotion: proto.animateEmojiDirty,
      keepStickerAnimationUnderReducedMotion: proto.animateStickersDirty,
    );
  }

  @override
  void writeProto(
    accessibility_pb.AccessibilityOverrides proto,
    AccessibilityOverridesLocalState local,
  ) {
    proto
      ..gifAutoplayDirty = local.keepGifAutoPlayUnderReducedMotion
      ..animateEmojiDirty = local.keepAnimatedEmojiUnderReducedMotion
      ..animateStickersDirty = local.keepStickerAnimationUnderReducedMotion;
  }

  @override
  accessibility_pb.AccessibilityOverrides createEmptyProto() {
    return accessibility_pb.AccessibilityOverrides();
  }

  @override
  pb.SyncedPreferences wrapProto(
    accessibility_pb.AccessibilityOverrides proto,
  ) {
    return pb.SyncedPreferences(accessibilityOverrides: proto);
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

  static accessibility_pb.AccessibilityOverrides toProtoForPush({
    required AccessibilityOverridesLocalState local,
    accessibility_pb.AccessibilityOverrides? wireBase,
  }) {
    final proto = mergeOrCreate(
      wireBase,
      accessibility_pb.AccessibilityOverrides.new,
    );
    proto
      ..gifAutoplayDirty = local.keepGifAutoPlayUnderReducedMotion
      ..animateEmojiDirty = local.keepAnimatedEmojiUnderReducedMotion
      ..animateStickersDirty = local.keepStickerAnimationUnderReducedMotion;
    return proto;
  }
}
