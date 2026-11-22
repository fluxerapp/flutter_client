import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_resolution.dart';

void main() {
  group('keybindActionId', () {
    test('matches the web command ids', () {
      expect(keybindActionId(KeybindAction.messageEdit), 'message_edit');
      expect(keybindActionId(KeybindAction.navGuildSlot1), 'nav_guild_slot_1');
      expect(
        keybindActionId(KeybindAction.voicePushToTalk),
        'voice_push_to_talk',
      );
      expect(
        keybindActionId(KeybindAction.voiceToggleVideo),
        'voice_toggle_camera',
      );
      expect(keybindActionId(KeybindAction.voiceToggleVad), 'voice_toggle_vad');
    });

    test('round trips every action', () {
      for (final KeybindAction action in KeybindAction.values) {
        expect(keybindActionFromId(keybindActionId(action)), action);
      }
    });
  });

  group('resolveEffectiveKeybinds', () {
    final List<DefaultKeybind> defaults = buildDefaultKeybinds();

    CustomKeybindEntry custom(KeybindAction action, StoredKeybindCombo combo) {
      return CustomKeybindEntry(
        id: action.name,
        action: keybindActionId(action),
        combo: combo,
      );
    }

    test('custom keybind replaces the built-in one', () {
      final List<DefaultKeybind> resolved = resolveEffectiveKeybinds(
        defaults: defaults,
        customKeybinds: <CustomKeybindEntry>[
          custom(
            KeybindAction.voiceToggleMute,
            const StoredKeybindCombo(key: 'm', alt: true),
          ),
        ],
        disableBuiltinKeybinds: false,
      );
      final List<DefaultKeybind> mute = resolved
          .where(
            (DefaultKeybind e) => e.action == KeybindAction.voiceToggleMute,
          )
          .toList();
      expect(mute, hasLength(1));
      expect(mute.single.combo.key, 'm');
      expect(mute.single.combo.alt, isTrue);
    });

    test('disable marker removes the built-in keybind', () {
      final List<DefaultKeybind> resolved = resolveEffectiveKeybinds(
        defaults: defaults,
        customKeybinds: <CustomKeybindEntry>[
          custom(
            KeybindAction.voiceToggleMute,
            const StoredKeybindCombo(enabled: false),
          ),
        ],
        disableBuiltinKeybinds: false,
      );
      expect(
        resolved.any(
          (DefaultKeybind e) => e.action == KeybindAction.voiceToggleMute,
        ),
        isFalse,
      );
    });

    test('disabling built-in shortcuts keeps only custom keybinds', () {
      final List<DefaultKeybind> resolved = resolveEffectiveKeybinds(
        defaults: defaults,
        customKeybinds: <CustomKeybindEntry>[
          custom(
            KeybindAction.voicePushToTalk,
            const StoredKeybindCombo(key: 'v'),
          ),
        ],
        disableBuiltinKeybinds: true,
      );
      expect(resolved, hasLength(1));
      expect(resolved.single.action, KeybindAction.voicePushToTalk);
      expect(resolved.single.informationalOnly, isFalse);
    });

    test('inactive custom keybinds are ignored', () {
      final List<DefaultKeybind> resolved = resolveEffectiveKeybinds(
        defaults: defaults,
        customKeybinds: <CustomKeybindEntry>[
          custom(KeybindAction.voiceToggleMute, const StoredKeybindCombo()),
        ],
        disableBuiltinKeybinds: false,
      );
      final DefaultKeybind mute = resolved.firstWhere(
        (DefaultKeybind e) => e.action == KeybindAction.voiceToggleMute,
      );
      expect(mute.combo.hasTrigger, isTrue);
    });
  });
}
