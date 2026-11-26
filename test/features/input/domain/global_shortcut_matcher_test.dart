import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/default_keybinds.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_binding.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_matcher.dart';
import 'package:fluxer_app/features/input/domain/global_shortcut_resolution.dart';
import 'package:fluxer_app/features/input/domain/keybind_action.dart';
import 'package:fluxer_app/features/input/domain/keybind_dom_codes.dart';
import 'package:fluxer_app/features/input/domain/mac_key_codes.dart';

GlobalShortcutBinding _binding(
  StoredKeybindCombo combo, {
  String id = 'ptt',
  KeybindAction action = KeybindAction.voicePushToTalk,
}) => GlobalShortcutBinding.fromStored(
  sourceId: id,
  action: action,
  combo: combo,
  isMacOS: true,
)!;

GlobalShortcutKeyEvent _key(
  String code, {
  bool down = true,
  Set<KeybindModifier> modifiers = const <KeybindModifier>{},
}) => GlobalShortcutKeyEvent(
  down: down,
  keycode: kMacKeyCodeForDomCode[code]!,
  code: code,
  modifiers: modifiers,
);

String _log(List<GlobalShortcutTransition> transitions) =>
    transitions.join(',');

void main() {
  late GlobalShortcutMatcher matcher;

  setUp(() => matcher = GlobalShortcutMatcher());

  test('presses once and releases on key up', () {
    matcher.setBindings(<GlobalShortcutBinding>[
      _binding(const StoredKeybindCombo(key: 'v', code: 'KeyV')),
    ]);
    expect(_log(matcher.handleKey(_key('KeyV'))), 'ptt:press');
    expect(matcher.handleKey(_key('KeyV')), isEmpty);
    expect(_log(matcher.handleKey(_key('KeyV', down: false))), 'ptt:release');
  });

  test('modifiers must match exactly once any is expected', () {
    matcher.setBindings(<GlobalShortcutBinding>[
      _binding(
        const StoredKeybindCombo(key: 'm', ctrlOrMeta: true, shift: true),
        id: 'mute',
        action: KeybindAction.voiceToggleMute,
      ),
    ]);
    expect(
      matcher.handleKey(
        _key('KeyM', modifiers: const <KeybindModifier>{KeybindModifier.meta}),
      ),
      isEmpty,
    );
    expect(
      _log(
        matcher.handleKey(
          _key(
            'KeyM',
            modifiers: const <KeybindModifier>{
              KeybindModifier.meta,
              KeybindModifier.shift,
            },
          ),
        ),
      ),
      'mute:press',
    );
  });

  test('modifier-only bindings accept either side', () {
    matcher.setBindings(<GlobalShortcutBinding>[
      _binding(
        const StoredKeybindCombo(
          key: 'Alt',
          code: 'AltLeft',
          alt: true,
          modifierOnly: true,
        ),
      ),
    ]);
    const Set<KeybindModifier> alt = <KeybindModifier>{KeybindModifier.alt};
    expect(
      _log(matcher.handleKey(_key('AltRight', modifiers: alt))),
      'ptt:press',
    );
    expect(
      _log(matcher.handleKey(_key('AltRight', down: false))),
      'ptt:release',
    );
  });

  test('both-sides bindings need both keys', () {
    matcher.setBindings(<GlobalShortcutBinding>[
      _binding(
        const StoredKeybindCombo(
          key: 'Shift',
          code: 'ShiftLeft',
          shift: true,
          modifierOnly: true,
          bothSides: true,
        ),
      ),
    ]);
    const Set<KeybindModifier> shift = <KeybindModifier>{KeybindModifier.shift};
    expect(matcher.handleKey(_key('ShiftLeft', modifiers: shift)), isEmpty);
    expect(
      _log(matcher.handleKey(_key('ShiftRight', modifiers: shift))),
      'ptt:press',
    );
    expect(
      _log(matcher.handleKey(_key('ShiftLeft', down: false, modifiers: shift))),
      'ptt:release',
    );
  });

  test('mouse buttons press and release', () {
    matcher.setBindings(<GlobalShortcutBinding>[
      _binding(const StoredKeybindCombo(mouseButton: 3)),
    ]);
    expect(
      _log(
        matcher.handleMouse(
          const GlobalShortcutMouseEvent(down: true, button: 3),
        ),
      ),
      'ptt:press',
    );
    expect(
      _log(
        matcher.handleMouse(
          const GlobalShortcutMouseEvent(down: false, button: 3),
        ),
      ),
      'ptt:release',
    );
  });

  test('release-only mode ignores presses but still releases', () {
    matcher
      ..setBindings(<GlobalShortcutBinding>[
        _binding(const StoredKeybindCombo(key: 'v', code: 'KeyV')),
      ])
      ..handleKey(_key('KeyV'));
    expect(
      _log(matcher.handleKey(_key('KeyV', down: false), releaseOnly: true)),
      'ptt:release',
    );
    expect(matcher.handleKey(_key('KeyV'), releaseOnly: true), isEmpty);
  });

  test('changing a held binding releases it', () {
    matcher
      ..setBindings(<GlobalShortcutBinding>[
        _binding(const StoredKeybindCombo(key: 'v', code: 'KeyV')),
      ])
      ..handleKey(_key('KeyV'));
    expect(
      _log(
        matcher.setBindings(<GlobalShortcutBinding>[
          _binding(const StoredKeybindCombo(key: 'b', code: 'KeyB')),
        ]),
      ),
      'ptt:release',
    );
  });

  test('releaseAll releases every press', () {
    matcher
      ..setBindings(<GlobalShortcutBinding>[
        _binding(const StoredKeybindCombo(key: 'v', code: 'KeyV')),
      ])
      ..handleKey(_key('KeyV'));
    expect(_log(matcher.releaseAll()), 'ptt:release');
    expect(matcher.releaseAll(), isEmpty);
  });

  group('resolution', () {
    List<GlobalShortcutBinding> resolve(
      List<CustomKeybindEntry> custom, {
      bool disableBuiltin = false,
    }) => resolveGlobalShortcutBindings(
      defaults: buildDefaultKeybinds(),
      customKeybinds: custom,
      disableBuiltinKeybinds: disableBuiltin,
      isMacOS: true,
    );

    test('defaults only route mute and deafen', () {
      expect(
        resolve(
          const <CustomKeybindEntry>[],
        ).map((GlobalShortcutBinding binding) => binding.action),
        <KeybindAction>[
          KeybindAction.voiceToggleMute,
          KeybindAction.voiceToggleDeafen,
        ],
      );
      expect(
        resolve(const <CustomKeybindEntry>[], disableBuiltin: true),
        isEmpty,
      );
    });

    test('unset global defaults to on for capable actions only', () {
      const StoredKeybindCombo combo = StoredKeybindCombo(
        key: 'v',
        code: 'KeyV',
      );
      CustomKeybindEntry entry(KeybindAction action, StoredKeybindCombo c) =>
          CustomKeybindEntry(
            id: action.name,
            action: keybindActionId(action),
            combo: c,
          );
      expect(
        resolve(<CustomKeybindEntry>[
          entry(KeybindAction.voicePushToTalk, combo),
          entry(KeybindAction.miscSearch, combo),
          entry(
            KeybindAction.voicePushToMute,
            const StoredKeybindCombo(key: 'b', code: 'KeyB', global: false),
          ),
        ], disableBuiltin: true).map(
          (GlobalShortcutBinding binding) => binding.action,
        ),
        <KeybindAction>[KeybindAction.voicePushToTalk],
      );
    });
  });
}
