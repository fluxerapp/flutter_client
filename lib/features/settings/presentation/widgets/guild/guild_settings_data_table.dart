import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_tappable.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildSettingsDataTable extends StatelessWidget {
  const GuildSettingsDataTable({
    required this.columns,
    required this.rows,
    super.key,
  });

  final List<String> columns;
  final List<Widget> rows;

  @override
  Widget build(BuildContext context) {
    if (rows.isEmpty) {
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: context.layout.s2),
          child: Row(
            children: <Widget>[
              for (int i = 0; i < columns.length; i++)
                Expanded(
                  flex: i == 0 ? 2 : 1,
                  child: Text(
                    columns[i],
                    style: context.textStyles.categoryName,
                  ),
                ),
            ],
          ),
        ),
        Divider(color: context.colors.borderColor, height: 1),
        ...rows,
      ],
    );
  }
}

class GuildSettingsDataRow extends StatelessWidget {
  const GuildSettingsDataRow({
    required this.cells,
    super.key,
    this.trailing,
    this.onTap,
  });

  final List<Widget> cells;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return FluxerTappable(
      onTap: onTap,
      builder: (BuildContext context, Set<WidgetState> states) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: context.layout.s3),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: context.colors.borderColor),
            ),
          ),
          child: Row(
            children: <Widget>[
              for (int i = 0; i < cells.length; i++)
                Expanded(flex: i == 0 ? 2 : 1, child: cells[i]),
              ?trailing,
            ],
          ),
        );
      },
    );
  }
}
