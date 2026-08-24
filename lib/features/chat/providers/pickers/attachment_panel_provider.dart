import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attachment_panel_provider.g.dart';

@Riverpod()
class AttachmentPanel extends _$AttachmentPanel {
  @override
  bool build() => false;

  void open() => state = true;

  void close() => state = false;

  void toggle() => state = !state;
}
