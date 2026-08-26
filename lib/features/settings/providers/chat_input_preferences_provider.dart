import 'package:fluxer_app/core/synced_preferences/engine/synced_preference_field.dart';
import 'package:fluxer_app/core/synced_preferences/engine/synced_preferences_dirty.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chat_input_preferences_provider.g.dart';

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
    return const ChatInputPreferencesState();
  }

  Future<void> applySynced(ChatInputPreferencesState value) async {
    state = value;
  }

  Future<void> setSaveCameraCapturesToDevice({required bool value}) async {
    state = state.copyWith(saveCameraCapturesToDevice: value);
    ref.markSyncedDirty(SyncedPreferenceField.chatInput);
  }
}
