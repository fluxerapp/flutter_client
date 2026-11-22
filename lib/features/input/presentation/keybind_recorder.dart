import 'package:flutter/services.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/input/domain/custom_keybind.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo.dart';
import 'package:fluxer_app/features/input/domain/keybind_combo_format.dart';
import 'package:fluxer_app/features/input/domain/keybind_key_names.dart';
import 'package:fluxer_app/features/ui/keybind_hint/fluxer_keybind_hint.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class KeybindRecorder extends StatefulWidget {
  const KeybindRecorder({
    required this.combo,
    required this.onChanged,
    this.enabled = true,
    super.key,
  });

  final StoredKeybindCombo combo;
  final ValueChanged<StoredKeybindCombo> onChanged;
  final bool enabled;

  static int _activeRecorders = 0;

  static bool get isRecording => _activeRecorders > 0;

  @override
  State<KeybindRecorder> createState() => _KeybindRecorderState();
}

class _KeybindRecorderState extends State<KeybindRecorder> {
  final FocusNode _focusNode = FocusNode(debugLabel: 'KeybindRecorder');
  bool _recording = false;

  @override
  void dispose() {
    if (_recording) {
      KeybindRecorder._activeRecorders--;
    }
    _focusNode.dispose();
    super.dispose();
  }

  void _startRecording() {
    if (!widget.enabled || _recording) {
      return;
    }
    KeybindRecorder._activeRecorders++;
    setState(() => _recording = true);
    _focusNode.requestFocus();
  }

  void _stopRecording() {
    if (!_recording) {
      return;
    }
    KeybindRecorder._activeRecorders--;
    setState(() => _recording = false);
    _focusNode.unfocus();
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (!_recording) {
      return KeyEventResult.ignored;
    }
    if (event is! KeyDownEvent) {
      return KeyEventResult.handled;
    }
    final HardwareKeyboard keyboard = HardwareKeyboard.instance;
    final bool noModifiers =
        !keyboard.isControlPressed &&
        !keyboard.isAltPressed &&
        !keyboard.isMetaPressed &&
        !keyboard.isShiftPressed;
    if (event.logicalKey == LogicalKeyboardKey.escape && noModifiers) {
      _stopRecording();
      return KeyEventResult.handled;
    }
    if (event.logicalKey == LogicalKeyboardKey.backspace && noModifiers) {
      widget.onChanged(widget.combo.cleared());
      _stopRecording();
      return KeyEventResult.handled;
    }
    final KeybindCombo? combo = keybindComboFromKeyEvent(event);
    if (combo == null) {
      return KeyEventResult.handled;
    }
    widget.onChanged(widget.combo.withTrigger(combo));
    _stopRecording();
    return KeyEventResult.handled;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final List<String> chips = widget.combo.hasTriggerInput
        ? formatKeybindComboChips(widget.combo.toKeybindCombo())
        : const <String>[];
    return Focus(
      focusNode: _focusNode,
      onKeyEvent: _onKeyEvent,
      onFocusChange: (bool focused) {
        if (!focused) {
          _stopRecording();
        }
      },
      child: Semantics(
        button: true,
        label: l10n.keybindRecorderSemanticLabel,
        child: FluxerGestureDetector(
          onTap: _recording ? _stopRecording : _startRecording,
          child: AnimatedContainer(
            duration: context.motion.fast,
            constraints: const BoxConstraints(minHeight: 36, minWidth: 140),
            padding: EdgeInsets.symmetric(
              horizontal: layout.s3,
              vertical: layout.s2,
            ),
            decoration: BoxDecoration(
              color: colors.backgroundTertiary,
              borderRadius: layout.radiusMd,
              border: Border.all(
                color: _recording ? colors.brandPrimary : colors.borderColor,
                width: _recording ? 2 : 1,
              ),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              widthFactor: 1,
              child: _recording
                  ? Text(
                      l10n.keybindRecorderRecording,
                      style: context.textStyles.label.copyWith(
                        color: colors.textSecondary,
                      ),
                    )
                  : chips.isEmpty
                  ? Text(
                      l10n.keybindRecorderUnassigned,
                      style: context.textStyles.label.copyWith(
                        color: colors.textTertiary,
                      ),
                    )
                  : FluxerKeybindHint(keys: chips),
            ),
          ),
        ),
      ),
    );
  }
}
