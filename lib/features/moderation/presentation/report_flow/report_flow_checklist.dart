import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';

class ReportFlowChecklistView extends StatelessWidget {
  const ReportFlowChecklistView({
    required this.checklist,
    required this.checked,
    required this.onToggle,
    super.key,
  });

  final ReportFlowChecklist checklist;
  final Set<String> checked;
  final ValueChanged<String> onToggle;

  @override
  Widget build(BuildContext context) {
    return FluxerMenuGroup(
      children: <Widget>[
        for (final ReportFlowChecklistItem item in checklist.items)
          _ReportFlowChecklistRow(
            key: ValueKey<String>('report-flow-item-${item.id}'),
            item: item,
            checked: checked.contains(item.id),
            onTap: () => onToggle(item.id),
          ),
      ],
    );
  }
}

class _ReportFlowChecklistRow extends StatelessWidget {
  const _ReportFlowChecklistRow({
    required this.item,
    required this.checked,
    required this.onTap,
    super.key,
  });

  final ReportFlowChecklistItem item;
  final bool checked;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final String? description = item.description;
    return FluxerTappable(
      onTap: onTap,
      checked: checked,
      semanticLabel: description == null
          ? item.label
          : '${item.label}. $description',
      excludeChildSemantics: true,
      builder: (context, states) {
        final bool pressed = states.contains(WidgetState.pressed);
        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          color: pressed
              ? colors.backgroundModifierHover.withValues(alpha: 0.6)
              : Colors.transparent,
          constraints: const BoxConstraints(minHeight: 56),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      item.label,
                      style: context.textStyles.username.copyWith(
                        color: colors.textPrimary,
                      ),
                    ),
                    if (description != null)
                      Text(
                        description,
                        style: context.textStyles.timestamp.copyWith(
                          color: colors.textTertiary,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: checked,
                  onChanged: (_) => onTap(),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
