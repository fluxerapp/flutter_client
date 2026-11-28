import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/inline_message_edit.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

final NotifierProvider<
  InlineMessageEditNotifier,
  Map<String, InlineMessageEdit>
>
inlineMessageEditProvider =
    NotifierProvider<InlineMessageEditNotifier, Map<String, InlineMessageEdit>>(
      InlineMessageEditNotifier.new,
    );

class InlineMessageEditNotifier
    extends Notifier<Map<String, InlineMessageEdit>> {
  @override
  Map<String, InlineMessageEdit> build() => const <String, InlineMessageEdit>{};

  bool isEditing(String channelId, String messageId) =>
      state[channelId]?.messageId == messageId;

  void start(Message message, {String? text}) {
    final InlineMessageEdit? current = state[message.channelId];
    if (current != null && current.messageId == message.id && text == null) {
      if (!current.focusPending) {
        _put(current.copyWith(focusPending: true));
      }
      return;
    }
    state = <String, InlineMessageEdit>{
      ...state,
      message.channelId: InlineMessageEdit(
        message: message,
        text: text ?? message.content,
      ),
    };
  }

  void updateText(String channelId, String messageId, String text) {
    final InlineMessageEdit? current = state[channelId];
    if (current == null ||
        current.messageId != messageId ||
        current.text == text) {
      return;
    }
    _put(current.copyWith(text: text));
  }

  bool consumeFocus(String channelId, String messageId) {
    final InlineMessageEdit? current = state[channelId];
    if (current == null ||
        current.messageId != messageId ||
        !current.focusPending) {
      return false;
    }
    _put(current.copyWith(focusPending: false));
    return true;
  }

  void _put(InlineMessageEdit edit) {
    state = <String, InlineMessageEdit>{...state, edit.channelId: edit};
  }

  void end(String channelId, String messageId) {
    final InlineMessageEdit? current = state[channelId];
    if (current == null || current.messageId != messageId) {
      return;
    }
    state = <String, InlineMessageEdit>{
      for (final MapEntry<String, InlineMessageEdit> entry in state.entries)
        if (entry.key != channelId) entry.key: entry.value,
    };
  }
}

bool inlineMessageEditEnabled({
  required bool touchPrimary,
  required double windowWidth,
}) => !touchPrimary && windowWidth >= kDesktopPointerUiMinWidth;

bool readInlineMessageEditEnabled(Ref ref) {
  final ui.FlutterView? view =
      WidgetsBinding.instance.platformDispatcher.implicitView;
  if (view == null) {
    return false;
  }
  return inlineMessageEditEnabled(
    touchPrimary: ref.read(inputModalityProvider),
    windowWidth: view.physicalSize.width / view.devicePixelRatio,
  );
}
