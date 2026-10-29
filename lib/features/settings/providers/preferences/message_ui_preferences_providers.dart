import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_ui_preferences_providers.g.dart';

enum DoubleTapActionPreference { unspecified, react, edit, none }

extension DoubleTapActionPreferenceBehavior on DoubleTapActionPreference {
  DoubleTapActionPreference get effective {
    if (this == DoubleTapActionPreference.unspecified) {
      return DoubleTapActionPreference.react;
    }
    return this;
  }
}

@immutable
class DoubleTapActionPreferencesState {
  const DoubleTapActionPreferencesState({
    this.action = DoubleTapActionPreference.unspecified,
  });

  final DoubleTapActionPreference action;

  DoubleTapActionPreference get effectiveAction => action.effective;

  @override
  bool operator ==(Object other) {
    return other is DoubleTapActionPreferencesState && other.action == action;
  }

  @override
  int get hashCode => action.hashCode;
}

@Riverpod(keepAlive: true)
class DoubleTapActionPreferences extends _$DoubleTapActionPreferences {
  @override
  DoubleTapActionPreferencesState build() {
    ref.watch(currentUserIdProvider);
    return const DoubleTapActionPreferencesState();
  }

  Future<void> applySynced(DoubleTapActionPreferencesState value) async {
    state = value;
  }

  Future<void> setAction(DoubleTapActionPreference action) async {
    state = DoubleTapActionPreferencesState(action: action);
    ref.markSyncedDirty(SyncedPreferenceField.doubleTapAction);
  }
}

const String kDefaultDoubleTapReactionName = '\u{1F44D}';

@immutable
class DoubleTapReactionPreferencesState {
  const DoubleTapReactionPreferencesState({
    this.name = kDefaultDoubleTapReactionName,
    this.id,
    this.isSet = false,
  });

  static const unset = DoubleTapReactionPreferencesState();

  final String name;
  final String? id;
  final bool isSet;

  bool get isCustom {
    final emojiId = id;
    return emojiId != null && emojiId.isNotEmpty;
  }

  @override
  bool operator ==(Object other) {
    return other is DoubleTapReactionPreferencesState &&
        other.name == name &&
        other.id == id &&
        other.isSet == isSet;
  }

  @override
  int get hashCode => Object.hash(name, id, isSet);
}

@Riverpod(keepAlive: true)
class DoubleTapReactionPreferences extends _$DoubleTapReactionPreferences {
  @override
  DoubleTapReactionPreferencesState build() {
    ref.watch(currentUserIdProvider);
    return DoubleTapReactionPreferencesState.unset;
  }

  Future<void> applySynced(DoubleTapReactionPreferencesState value) async {
    state = value;
  }

  Future<void> setReaction({required String name, String? id}) async {
    final trimmed = name.trim();
    if (trimmed.isEmpty) {
      return;
    }
    final emojiId = id == null || id.isEmpty ? null : id;
    state = DoubleTapReactionPreferencesState(
      name: trimmed,
      id: emojiId,
      isSet: true,
    );
    ref.markSyncedDirty(SyncedPreferenceField.doubleTapReaction);
  }
}

enum SwipeRightToLeftActionPreference { unspecified, reply, channelDetails }

extension SwipeRightToLeftActionPreferenceBehavior
    on SwipeRightToLeftActionPreference {
  SwipeRightToLeftActionPreference get effective {
    if (this == SwipeRightToLeftActionPreference.unspecified) {
      return SwipeRightToLeftActionPreference.reply;
    }
    return this;
  }
}

@immutable
class SwipeRightToLeftActionPreferencesState {
  const SwipeRightToLeftActionPreferencesState({
    this.action = SwipeRightToLeftActionPreference.unspecified,
  });

  final SwipeRightToLeftActionPreference action;

  SwipeRightToLeftActionPreference get effectiveAction => action.effective;

  @override
  bool operator ==(Object other) {
    return other is SwipeRightToLeftActionPreferencesState &&
        other.action == action;
  }

  @override
  int get hashCode => action.hashCode;
}

@Riverpod(keepAlive: true)
class SwipeRightToLeftActionPreferences
    extends _$SwipeRightToLeftActionPreferences {
  @override
  SwipeRightToLeftActionPreferencesState build() {
    ref.watch(currentUserIdProvider);
    return const SwipeRightToLeftActionPreferencesState();
  }

  Future<void> applySynced(SwipeRightToLeftActionPreferencesState value) async {
    state = value;
  }

  Future<void> setAction(SwipeRightToLeftActionPreference action) async {
    state = SwipeRightToLeftActionPreferencesState(action: action);
    ref.markSyncedDirty(SyncedPreferenceField.swipeRightToLeftAction);
  }
}

@immutable
class TextualPreviewPreferencesState {
  const TextualPreviewPreferencesState({this.wrapText = false});

  final bool wrapText;

  TextualPreviewPreferencesState copyWith({bool? wrapText}) {
    return TextualPreviewPreferencesState(wrapText: wrapText ?? this.wrapText);
  }

  @override
  bool operator ==(Object other) {
    return other is TextualPreviewPreferencesState &&
        other.wrapText == wrapText;
  }

  @override
  int get hashCode => wrapText.hashCode;
}

@Riverpod(keepAlive: true)
class TextualPreviewPreferences extends _$TextualPreviewPreferences {
  @override
  TextualPreviewPreferencesState build() {
    ref.watch(currentUserIdProvider);
    return const TextualPreviewPreferencesState();
  }

  Future<void> applySynced(TextualPreviewPreferencesState value) async {
    state = value;
  }

  Future<void> setWrapText({required bool value}) async {
    state = state.copyWith(wrapText: value);
    ref.markSyncedDirty(SyncedPreferenceField.textualPreview);
  }

  Future<void> toggleWrapText() async {
    await setWrapText(value: !state.wrapText);
  }
}

@immutable
class ChatInputPreferencesState {
  const ChatInputPreferencesState({this.saveCameraCapturesToDevice = true});

  final bool saveCameraCapturesToDevice;

  ChatInputPreferencesState copyWith({bool? saveCameraCapturesToDevice}) {
    return ChatInputPreferencesState(
      saveCameraCapturesToDevice:
          saveCameraCapturesToDevice ?? this.saveCameraCapturesToDevice,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatInputPreferencesState &&
        other.saveCameraCapturesToDevice == saveCameraCapturesToDevice;
  }

  @override
  int get hashCode => saveCameraCapturesToDevice.hashCode;
}

@Riverpod(keepAlive: true)
class ChatInputPreferences extends _$ChatInputPreferences {
  @override
  ChatInputPreferencesState build() {
    ref.watch(currentUserIdProvider);
    return const ChatInputPreferencesState();
  }

  Future<void> applySynced(ChatInputPreferencesState value) async {
    state = value;
  }

  Future<void> setSaveCameraCapturesToDevice({required bool value}) async {
    state = state.copyWith(saveCameraCapturesToDevice: value);
    ref.markSyncedDirty(SyncedPreferenceField.saveCameraUploadsToDevice);
  }
}
