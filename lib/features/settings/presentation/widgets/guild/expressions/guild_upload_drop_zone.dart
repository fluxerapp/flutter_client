import 'package:desktop_drop/desktop_drop.dart';
import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';

class GuildUploadDropZone extends StatefulWidget {
  const GuildUploadDropZone({
    required this.description,
    required this.onFilesDropped,
    super.key,
  });

  final String description;
  final ValueChanged<List<DropItem>> onFilesDropped;

  @override
  State<GuildUploadDropZone> createState() => _GuildUploadDropZoneState();
}

class _GuildUploadDropZoneState extends State<GuildUploadDropZone> {
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    if (isMobileLayout(context)) {
      return const SizedBox.shrink();
    }
    final colors = context.colors;
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.fromLTRB(layout.s4, layout.s3, layout.s4, 0),
      child: DropTarget(
        onDragEntered: (_) => setState(() => _isDragging = true),
        onDragExited: (_) => setState(() => _isDragging = false),
        onDragDone: (DropDoneDetails details) {
          setState(() => _isDragging = false);
          widget.onFilesDropped(details.files);
        },
        child: AnimatedContainer(
          duration: context.motion.fast,
          width: double.infinity,
          padding: EdgeInsets.all(layout.s6),
          decoration: BoxDecoration(
            borderRadius: layout.radiusLg,
            border: Border.all(
              color: _isDragging ? colors.borderColorHover : colors.borderColor,
            ),
            color: _isDragging
                ? colors.backgroundModifierHover.withValues(alpha: 0.35)
                : colors.backgroundSecondaryAlt,
          ),
          child: Text(
            widget.description,
            textAlign: TextAlign.center,
            style: context.textStyles.bodyMedium.copyWith(
              color: colors.textPrimaryMuted,
            ),
          ),
        ),
      ),
    );
  }
}
