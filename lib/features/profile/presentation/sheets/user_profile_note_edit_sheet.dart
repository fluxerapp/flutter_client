import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/providers/user_note_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class UserProfileNoteEditSheet {
  UserProfileNoteEditSheet._();

  static Future<void> show(
    BuildContext context, {
    required String userId,
    String? initialNote,
  }) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).userProfileNoteTitle,
      useRootNavigator: true,
      builder: (sheetContext, close) {
        return _NoteEditor(
          userId: userId,
          initialNote: initialNote,
          onClose: close,
        );
      },
    );
  }
}

class _NoteEditor extends ConsumerStatefulWidget {
  const _NoteEditor({
    required this.userId,
    required this.initialNote,
    required this.onClose,
  });

  final String userId;
  final String? initialNote;
  final VoidCallback onClose;

  @override
  ConsumerState<_NoteEditor> createState() => _NoteEditorState();
}

class _NoteEditorState extends ConsumerState<_NoteEditor> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialNote ?? '');
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    final l10n = FluxerLocalizations.of(context);
    try {
      await ref
          .read(userNoteViewModelProvider(userId: widget.userId).notifier)
          .save(_controller.text);
      if (mounted) {
        widget.onClose();
      }
    } on Object {
      if (!mounted) {
        return;
      }
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.userProfileFailedSaveNote,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  Future<void> _delete() async {
    try {
      await ref
          .read(userNoteViewModelProvider(userId: widget.userId).notifier)
          .delete();
      if (mounted) {
        widget.onClose();
      }
    } on Object {
      if (!mounted) {
        return;
      }
      final l10n = FluxerLocalizations.of(context);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: l10n.userProfileFailedSaveNote,
              variant: FluxerToastVariant.danger,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final hasInitial =
        widget.initialNote != null && widget.initialNote!.isNotEmpty;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: layout.s4),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FluxerInput.multiline(
            controller: _controller,
            textCapitalization: TextCapitalization.sentences,
            maxLength: 256,
            minLines: 4,
            maxLines: 8,
          ),
          SizedBox(height: layout.s4),
          Row(
            children: [
              if (hasInitial) ...[
                Expanded(
                  child: FluxerButton.dangerPrimary(
                    label: l10n.userProfileNoteDelete,
                    onPressedAsync: _delete,
                  ),
                ),
                SizedBox(width: layout.s2),
              ],
              Expanded(
                child: FluxerButton.primary(
                  label: l10n.userProfileNoteSave,
                  onPressedAsync: _save,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
