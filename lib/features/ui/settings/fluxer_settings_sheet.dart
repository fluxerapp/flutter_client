import 'package:fluxer_app/features/ui/preview/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_save_bar.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_controller.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_entry.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_unsaved_changes_scope.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSettingsSheet extends StatefulWidget {
  const FluxerSettingsSheet({
    required this.child,
    this.hasUnsavedChanges = false,
    this.isSaving = false,
    this.onReset,
    this.onSave,
    this.saveBarLabel,
    super.key,
  });

  final Widget child;
  final bool hasUnsavedChanges;
  final bool isSaving;
  final VoidCallback? onReset;
  final VoidCallback? onSave;
  final String? saveBarLabel;

  @override
  State<FluxerSettingsSheet> createState() => _FluxerSettingsSheetState();
}

class _FluxerSettingsSheetState extends State<FluxerSettingsSheet> {
  FluxerUnsavedChangesController? _registeredWith;

  @override
  void dispose() {
    _registeredWith?.remove(this);
    super.dispose();
  }

  void _syncRegistration(FluxerUnsavedChangesScope? scope) {
    final FluxerUnsavedChangesController? controller = scope?.controller;
    final VoidCallback? onReset = widget.onReset;
    final VoidCallback? onSave = widget.onSave;
    if (_registeredWith != null && _registeredWith != controller) {
      _registeredWith!.remove(this);
      _registeredWith = null;
    }
    if (controller == null) {
      return;
    }
    if (onReset == null || onSave == null) {
      controller.remove(this);
      _registeredWith = null;
      return;
    }
    controller.update(
      this,
      FluxerUnsavedChangesEntry(
        hasUnsavedChanges: widget.hasUnsavedChanges,
        isSaving: widget.isSaving,
        onReset: onReset,
        onSave: onSave,
        label: widget.saveBarLabel,
      ),
    );
    _registeredWith = controller;
  }

  @override
  Widget build(BuildContext context) {
    final FluxerUnsavedChangesScope? scope = FluxerUnsavedChangesScope.maybeOf(
      context,
    );
    _syncRegistration(scope);
    final bool showSaveBar =
        widget.onReset != null &&
        widget.onSave != null &&
        !(scope?.showsHeaderBanner ?? false);

    return Stack(
      children: [
        Positioned.fill(child: widget.child),
        if (showSaveBar)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FluxerSaveBar(
              visible: widget.hasUnsavedChanges,
              onReset: widget.onReset!,
              onSave: widget.onSave!,
              isSaving: widget.isSaving,
              label: widget.saveBarLabel,
              flashing: scope?.controller.flashing ?? false,
            ),
          ),
      ],
    );
  }
}

@FluxerWidgetPreview(name: 'With save bar', group: 'FluxerSettingsSheet')
Widget fluxerSettingsSheetPreview() {
  return FluxerSettingsSheet(
    hasUnsavedChanges: true,
    onReset: () {},
    onSave: () {},
    child: const Center(child: Text('Settings content')),
  );
}
