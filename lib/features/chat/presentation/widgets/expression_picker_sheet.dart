import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/expression_picker.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';

class ExpressionPickerSheet {
  ExpressionPickerSheet._();

  static Future<void> show(
    BuildContext context, {
    List<ExpressionPickerTab> visibleTabs = const [
      ExpressionPickerTab.gifs,
      ExpressionPickerTab.memes,
      ExpressionPickerTab.stickers,
      ExpressionPickerTab.emojis,
    ],
    ExpressionPickerTab initialTab = ExpressionPickerTab.emojis,
  }) {
    final colors = context.colors;
    final layout = context.layout;

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: colors.backgroundSecondary,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: layout.radiusXxl.topLeft),
      ),
      builder: (sheetContext) {
        void close() => Navigator.of(sheetContext).pop();

        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) => _SheetContent(
            visibleTabs: visibleTabs,
            initialTab: initialTab,
            onClose: close,
          ),
        );
      },
    );
  }
}

class _SheetContent extends StatefulWidget {
  const _SheetContent({
    required this.visibleTabs,
    required this.initialTab,
    required this.onClose,
  });

  final List<ExpressionPickerTab> visibleTabs;
  final ExpressionPickerTab initialTab;
  final VoidCallback onClose;

  @override
  State<_SheetContent> createState() => _SheetContentState();
}

class _SheetContentState extends State<_SheetContent> {
  late ExpressionPickerTab _selectedTab;

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.initialTab;
  }

  String _tabLabel(ExpressionPickerTab tab) => switch (tab) {
    ExpressionPickerTab.gifs => 'GIFs',
    ExpressionPickerTab.memes => 'Media',
    ExpressionPickerTab.stickers => 'Stickers',
    ExpressionPickerTab.emojis => 'Emojis',
  };

  @override
  Widget build(BuildContext context) => Column(
    children: [
      const SizedBox(height: 8),
      const FluxerBottomSheetDragHandle(),
      if (widget.visibleTabs.length > 1) _buildSegmentedTabs(context),
      const SizedBox(height: 8),
      Expanded(
        child: ExpressionPicker(
          onClose: widget.onClose,
          visibleTabs: widget.visibleTabs,
          initialTab: _selectedTab,
          showTabs: false,
        ),
      ),
    ],
  );

  Widget _buildSegmentedTabs(BuildContext context) {
    final colors = context.colors;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colors.backgroundTertiary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Row(
            children: widget.visibleTabs.map((tab) {
              final isActive = tab == _selectedTab;
              return Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTab = tab),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: isActive
                          ? colors.backgroundSecondary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: isActive
                          ? const [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.08),
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ]
                          : null,
                    ),
                    child: Text(
                      _tabLabel(tab),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        height: 18 / 14,
                        color: isActive
                            ? colors.textPrimary
                            : colors.textSecondary,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
