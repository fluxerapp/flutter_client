import 'package:fluxer_app/core/widgets/fluxer_widget_preview.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_save_bar.dart';
import 'package:fluxer_app/material_ui.dart';

class FluxerSettingsSheet extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final showSaveBar = onReset != null && onSave != null;

    return Stack(
      children: [
        Positioned.fill(child: child),
        if (showSaveBar)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: FluxerSaveBar(
              visible: hasUnsavedChanges,
              onReset: onReset!,
              onSave: onSave!,
              isSaving: isSaving,
              label: saveBarLabel,
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
