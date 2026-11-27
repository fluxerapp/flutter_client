import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel_reorder_drop.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_channel_drop_target.dart';
import 'package:fluxer_app/features/channels/presentation/widgets/sidebar_drag/sidebar_drop_indicator.dart';
import 'package:fluxer_app/material_ui.dart';

class SidebarNullSpaceDropTarget extends StatefulWidget {
  const SidebarNullSpaceDropTarget({
    required this.trailing,
    required this.onChannelDrop,
    super.key,
  });

  final bool trailing;
  final SidebarChannelDropCallback onChannelDrop;

  @override
  State<SidebarNullSpaceDropTarget> createState() =>
      _SidebarNullSpaceDropTargetState();
}

class _SidebarNullSpaceDropTargetState
    extends State<SidebarNullSpaceDropTarget> {
  static const double _kHeight = 10;
  static const double _kHorizontalInset = 8;
  static const double _kIndicatorHeight = 2;

  bool _isOver = false;

  ChannelReorderDropResult get _result => ChannelReorderDropResult(
    targetId: widget.trailing ? kTrailingSpaceTargetId : kNullSpaceTargetId,
    position: widget.trailing
        ? ChannelReorderDropPosition.after
        : ChannelReorderDropPosition.before,
    targetParentIdSpecified: true,
  );

  void _setOver(bool value) {
    if (_isOver != value) {
      setState(() => _isOver = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DragTarget<ChannelReorderDragItem>(
      onWillAcceptWithDetails: (_) => true,
      onMove: (_) => _setOver(true),
      onLeave: (_) => _setOver(false),
      onAcceptWithDetails: (DragTargetDetails<ChannelReorderDragItem> details) {
        _setOver(false);
        widget.onChannelDrop(details.data, _result);
      },
      builder:
          (
            BuildContext context,
            List<ChannelReorderDragItem?> candidateData,
            List<dynamic> rejectedData,
          ) {
            return SizedBox(
              height: _kHeight,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: _kHorizontalInset,
                ),
                child: Center(
                  child: AnimatedOpacity(
                    opacity: _isOver ? 1 : 0,
                    duration: context.motion.normal,
                    child: Container(
                      height: _kIndicatorHeight,
                      decoration: BoxDecoration(
                        color: SidebarDropIndicator.colorFor(
                          context,
                          isValid: true,
                        ),
                        borderRadius: BorderRadius.circular(_kIndicatorHeight),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
    );
  }
}
