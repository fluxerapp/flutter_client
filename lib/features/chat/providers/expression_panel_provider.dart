import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expression_panel_provider.g.dart';

@Riverpod(keepAlive: true)
class ExpressionPanel extends _$ExpressionPanel {
  @override
  bool build() => false;

  void open() => state = true;
  void close() => state = false;
  void toggle() => state = !state;
}

@Riverpod(keepAlive: true)
class PendingEmojiInsert extends _$PendingEmojiInsert {
  @override
  ({String name, String surrogates})? build() => null;

  void emit(String name, String surrogates) =>
      state = (name: name, surrogates: surrogates);

  void consume() => state = null;
}
