import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/chat/domain/composer_slash_command.dart';
import 'package:fluxer_app/features/chat/utils/composer_slash_commands.dart';
import 'package:fluxer_app/features/chat/utils/slash_slot_validation.dart';

enum ComposerSlashFocus { slot, optionalHint }

class ComposerSlashSlotState {
  ComposerSlashSlotState({
    required this.option,
    this.text = '',
    this.wire,
    this.displayLabel,
    this.invalid = false,
    this.touched = false,
  });

  final ComposerCommandOption option;
  String text;
  String? wire;
  String? displayLabel;
  bool invalid;
  bool touched;

  String get optionTypeName {
    return switch (option.type) {
      ComposerCommandOptionType.string => 'string',
      ComposerCommandOptionType.user => 'user',
      ComposerCommandOptionType.channel => 'channel',
      ComposerCommandOptionType.role => 'role',
      ComposerCommandOptionType.integer => 'integer',
      ComposerCommandOptionType.number => 'number',
      ComposerCommandOptionType.boolean => 'boolean',
      ComposerCommandOptionType.choice => 'choice',
    };
  }

  String get resolvedWire => (wire ?? text).trim();
}

class ComposerSlashSession extends ChangeNotifier {
  ComposerActionSlashCommand? _command;
  final List<ComposerSlashSlotState> _slots = <ComposerSlashSlotState>[];
  List<ComposerCommandOption> _absentOptional = <ComposerCommandOption>[];
  int _focusedSlotIndex = 0;
  ComposerSlashFocus _focus = ComposerSlashFocus.slot;
  bool _showRequiredError = false;

  ComposerActionSlashCommand? get command => _command;
  bool get isActive => _command != null;
  List<ComposerSlashSlotState> get slots =>
      List<ComposerSlashSlotState>.unmodifiable(_slots);
  List<ComposerCommandOption> get absentOptional =>
      List<ComposerCommandOption>.unmodifiable(_absentOptional);
  int get focusedSlotIndex => _focusedSlotIndex;
  ComposerSlashFocus get focus => _focus;
  bool get showRequiredError => _showRequiredError;

  ComposerSlashSlotState? get focusedSlot {
    if (!isActive || _focus != ComposerSlashFocus.slot) {
      return null;
    }
    if (_focusedSlotIndex < 0 || _focusedSlotIndex >= _slots.length) {
      return null;
    }
    return _slots[_focusedSlotIndex];
  }

  bool get optionalHintFocused =>
      isActive && _focus == ComposerSlashFocus.optionalHint;

  void start(ComposerActionSlashCommand command) {
    final partitioned = partitionSlashCommandOptions(command.options);
    _command = command;
    _slots
      ..clear()
      ..addAll(
        partitioned.required.map(
          (ComposerCommandOption option) =>
              ComposerSlashSlotState(option: option),
        ),
      );
    _absentOptional = partitioned.optional;
    _focusedSlotIndex = 0;
    _focus = _slots.isEmpty
        ? ComposerSlashFocus.optionalHint
        : ComposerSlashFocus.slot;
    _showRequiredError = false;
    notifyListeners();
  }

  void clear() {
    _command = null;
    _slots.clear();
    _absentOptional = <ComposerCommandOption>[];
    _focusedSlotIndex = 0;
    _focus = ComposerSlashFocus.slot;
    _showRequiredError = false;
    notifyListeners();
  }

  void setSlotText(int index, String text) {
    if (index < 0 || index >= _slots.length) {
      return;
    }
    final ComposerSlashSlotState slot = _slots[index];
    slot
      ..text = text
      ..displayLabel = null
      ..wire = null
      ..touched = slot.touched || text.trim().isNotEmpty;
    _showRequiredError = false;
    _revalidateSlot(index, notify: false);
    notifyListeners();
  }

  void applySlotPayload({
    required int index,
    required String display,
    required String wire,
  }) {
    if (index < 0 || index >= _slots.length) {
      return;
    }
    _slots[index]
      ..text = display
      ..displayLabel = display
      ..wire = wire
      ..invalid = false
      ..touched = true;
    _showRequiredError = false;
    notifyListeners();
  }

  void applySlotChoice(int index, String choiceName, String choiceValue) {
    applySlotPayload(index: index, display: choiceName, wire: choiceValue);
  }

  void addOptionalOption(String name) {
    final int found = _absentOptional.indexWhere(
      (ComposerCommandOption o) => o.name == name,
    );
    if (found < 0) {
      return;
    }
    final ComposerCommandOption option = _absentOptional.removeAt(found);
    if (_focus == ComposerSlashFocus.slot) {
      _invalidateEmptyRequired(_focusedSlotIndex, notify: false);
    }
    _slots.add(ComposerSlashSlotState(option: option));
    _focusedSlotIndex = _slots.length - 1;
    _focus = ComposerSlashFocus.slot;
    notifyListeners();
  }

  void focusSlot(int index) {
    if (index < 0 || index >= _slots.length) {
      return;
    }
    if (_focus == ComposerSlashFocus.slot && _focusedSlotIndex != index) {
      _invalidateEmptyRequired(_focusedSlotIndex, notify: false);
    }
    _focusedSlotIndex = index;
    _focus = ComposerSlashFocus.slot;
    notifyListeners();
  }

  void focusOptionalHint() {
    if (_absentOptional.isEmpty) {
      return;
    }
    if (_focus == ComposerSlashFocus.slot) {
      _invalidateEmptyRequired(_focusedSlotIndex, notify: false);
    }
    _focus = ComposerSlashFocus.optionalHint;
    notifyListeners();
  }

  void unfocusSlot(int index) {
    scheduleMicrotask(() {
      if (!isActive) {
        return;
      }
      if (_focus == ComposerSlashFocus.slot && _focusedSlotIndex == index) {
        return;
      }
      _invalidateEmptyRequired(index);
    });
  }

  bool focusNextSlot() {
    if (_focus == ComposerSlashFocus.optionalHint) {
      return false;
    }
    _invalidateEmptyRequired(_focusedSlotIndex, notify: false);
    if (_focusedSlotIndex + 1 < _slots.length) {
      _focusedSlotIndex += 1;
      _focus = ComposerSlashFocus.slot;
      notifyListeners();
      return true;
    }
    if (_absentOptional.isNotEmpty) {
      _focus = ComposerSlashFocus.optionalHint;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool focusPreviousSlot() {
    if (_focus == ComposerSlashFocus.optionalHint) {
      if (_slots.isEmpty) {
        return false;
      }
      _focusedSlotIndex = _slots.length - 1;
      _focus = ComposerSlashFocus.slot;
      notifyListeners();
      return true;
    }
    if (_focusedSlotIndex > 0) {
      _invalidateEmptyRequired(_focusedSlotIndex, notify: false);
      _focusedSlotIndex -= 1;
      notifyListeners();
      return true;
    }
    return false;
  }

  bool backspaceOnEmptyFirstSlot() {
    if (_focus != ComposerSlashFocus.slot || _focusedSlotIndex != 0) {
      return false;
    }
    if (_slots.isEmpty) {
      return false;
    }
    if (_slots.first.text.isNotEmpty) {
      return false;
    }
    clear();
    return true;
  }

  bool get isSubmitValid {
    for (final ComposerSlashSlotState slot in _slots) {
      if (slot.invalid) {
        return false;
      }
      if (slot.option.required &&
          !slot.option.allowEmpty &&
          slot.resolvedWire.isEmpty) {
        return false;
      }
    }
    return _command != null;
  }

  void markRequiredError() {
    _showRequiredError = true;
    int? firstInvalid;
    for (int i = 0; i < _slots.length; i++) {
      _invalidateEmptyRequired(i, notify: false);
      _revalidateSlot(i, notify: false);
      if (firstInvalid == null && _slots[i].invalid) {
        firstInvalid = i;
      }
    }
    if (firstInvalid != null) {
      _focusedSlotIndex = firstInvalid;
      _focus = ComposerSlashFocus.slot;
    }
    notifyListeners();
  }

  void _invalidateEmptyRequired(int index, {bool notify = true}) {
    if (index < 0 || index >= _slots.length) {
      return;
    }
    final ComposerSlashSlotState slot = _slots[index];
    if (!slot.option.required ||
        slot.option.allowEmpty ||
        slot.resolvedWire.isNotEmpty) {
      return;
    }
    slot
      ..touched = true
      ..invalid = true;
    _showRequiredError = true;
    if (notify) {
      notifyListeners();
    }
  }

  void _revalidateSlot(int index, {bool notify = true}) {
    if (index < 0 || index >= _slots.length) {
      return;
    }
    final ComposerSlashSlotState slot = _slots[index];
    final bool submitRequired = slot.option.required && !slot.option.allowEmpty;
    final String raw = (slot.wire ?? slot.text).trim();
    if (raw.isEmpty) {
      slot.invalid = submitRequired && (slot.touched || _showRequiredError);
      if (notify) {
        notifyListeners();
      }
      return;
    }
    final SlashSlotValidationResult result = validateSlashSlot(
      optionType: slot.optionTypeName,
      rawText: raw,
      required: submitRequired,
      choices: slot.option.choices
          .map((ComposerCommandChoice c) => (name: c.name, value: c.value))
          .toList(growable: false),
    );
    slot.invalid = !result.valid;
    if (result.valid) {
      slot.wire = result.resolvedWire;
    }
    if (notify) {
      notifyListeners();
    }
  }

  String toWireText() {
    final ComposerActionSlashCommand? command = _command;
    if (command == null) {
      return '';
    }
    final StringBuffer buffer = StringBuffer(command.name);
    for (final ComposerSlashSlotState slot in _slots) {
      final String value = slot.resolvedWire;
      if (value.isEmpty) {
        continue;
      }
      buffer
        ..write(' ')
        ..write(value);
    }
    return buffer.toString();
  }
}
