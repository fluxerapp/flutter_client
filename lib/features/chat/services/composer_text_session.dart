import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/services/composer_mention_controller.dart';
import 'package:fluxer_app/features/ui/input/inline_token_clipboard.dart';

class ComposerTextSession {
  ComposerTextSession({
    required this._ref,
    required this._controller,
    required this._focusNode,
  });

  final WidgetRef _ref;
  final ComposerMentionController _controller;
  final FocusNode _focusNode;

  bool _isApplyingWireText = false;
  bool _suppressControllerToStateSync = false;
  bool _disposed = false;
  int _channelApplyGeneration = 0;
  String? _lastWireTextPushedToState;
  Timer? _wireSyncDebounceTimer;
  String? _wireSyncPendingWire;

  bool get isApplyingWireText => _isApplyingWireText;

  void dispose() {
    _disposed = true;
    _channelApplyGeneration++;
    _wireSyncDebounceTimer?.cancel();
    _wireSyncDebounceTimer = null;
    _wireSyncPendingWire = null;
    _suppressControllerToStateSync = false;
  }

  void onControllerChanged() {
    if (_suppressControllerToStateSync) {
      return;
    }
    if (_controller.value.composing.isValid) {
      return;
    }
    if (_isApplyingWireText) {
      return;
    }
    final String wire = stripPrivateUseCharacters(_controller.toWireText());
    if (wire == _lastWireTextPushedToState) {
      return;
    }
    _lastWireTextPushedToState = wire;
    _ref.read(chatViewModelProvider.notifier).updateMessageText(wire);
  }

  void syncFromViewModelIfNeeded() {
    if (_isApplyingWireText) {
      return;
    }
    if (_focusNode.hasFocus && _controller.value.composing.isValid) {
      return;
    }
    final String wire = stripPrivateUseCharacters(
      _ref.read(chatViewModelProvider).messageText,
    );
    if (_controller.toWireText() == wire) {
      _lastWireTextPushedToState = wire;
      return;
    }
    if (_shouldDeferComposerStateWriteBack(wire)) {
      return;
    }

    _wireSyncDebounceTimer?.cancel();
    _wireSyncPendingWire = wire;
    _wireSyncDebounceTimer = Timer(const Duration(milliseconds: 150), () {
      final String? pendingWire = _wireSyncPendingWire;
      if (pendingWire == null || pendingWire == _lastWireTextPushedToState) {
        return;
      }
      unawaited(applyWireTextFromState(pendingWire));
    });
  }

  bool _shouldDeferComposerStateWriteBack(String wireFromState) {
    if (!_focusNode.hasFocus) {
      return false;
    }
    final String localWire = stripPrivateUseCharacters(
      _controller.toWireText(),
    );
    if (localWire.isEmpty) {
      return wireFromState.isNotEmpty;
    }
    if (wireFromState.isEmpty) {
      if (_lastWireTextPushedToState != null &&
          _lastWireTextPushedToState!.isNotEmpty) {
        return false;
      }
      return true;
    }
    if (wireFromState.length < localWire.length &&
        localWire.startsWith(wireFromState)) {
      return true;
    }
    return false;
  }

  void resetAfterSend() {
    _lastWireTextPushedToState = '';
    if (_controller.toWireText().isEmpty && _controller.text.isEmpty) {
      return;
    }
    unawaited(applyWireTextFromState('', force: true));
  }

  void onChannelChanged() {
    if (_disposed) {
      return;
    }
    _wireSyncDebounceTimer?.cancel();
    _wireSyncPendingWire = null;
    _suppressControllerToStateSync = true;
    final int generation = ++_channelApplyGeneration;
    final String wire = stripPrivateUseCharacters(
      _ref.read(chatViewModelProvider).messageText,
    );
    unawaited(
      applyWireTextFromState(wire, force: true).whenComplete(() {
        if (_disposed || generation != _channelApplyGeneration) {
          return;
        }
        _lastWireTextPushedToState = stripPrivateUseCharacters(
          _controller.toWireText(),
        );
        _suppressControllerToStateSync = false;
      }),
    );
  }

  Future<void> applyWireTextFromState(String wire, {bool force = false}) async {
    if (!force && _focusNode.hasFocus && _controller.value.composing.isValid) {
      return;
    }
    _isApplyingWireText = true;
    try {
      await _controller
          .applyWireText(wire, force: force)
          .timeout(const Duration(seconds: 1), onTimeout: () {});
      _lastWireTextPushedToState = wire;
    } finally {
      _isApplyingWireText = false;
    }
  }

  Future<void> applyWireTextForEdit(String wire) {
    return applyWireTextFromState(wire, force: true);
  }
}
