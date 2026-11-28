import 'package:fluxer_app/material_ui.dart';

@immutable
class FluxerUnsavedChangesEntry {
  const FluxerUnsavedChangesEntry({
    required this.hasUnsavedChanges,
    required this.onReset,
    required this.onSave,
    this.isSaving = false,
    this.label,
  });

  final bool hasUnsavedChanges;
  final VoidCallback onReset;
  final VoidCallback onSave;
  final bool isSaving;
  final String? label;

  bool sameStateAs(FluxerUnsavedChangesEntry? other) {
    return other != null &&
        other.hasUnsavedChanges == hasUnsavedChanges &&
        other.isSaving == isSaving &&
        other.label == label;
  }
}
