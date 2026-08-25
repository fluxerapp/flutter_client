import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview_surface.dart';
import 'package:fluxer_app/features/chat/utils/csv_attachment_preview_utils.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_content.dart';
import 'package:fluxer_app/material_ui.dart';

class CsvAttachmentTablePanel extends StatelessWidget {
  const CsvAttachmentTablePanel({
    required this.status,
    required this.visibleLineCount,
    this.rows,
    this.previewError,
    this.copyTextContent,
    this.fillAvailableSpace = false,
    this.scrollController,
    this.remainingSuffix,
    super.key,
  });

  final TextualAttachmentPreviewStatus status;
  final int visibleLineCount;
  final CsvRows? rows;
  final TextualAttachmentPreviewError? previewError;
  final String? copyTextContent;
  final bool fillAvailableSpace;
  final ScrollController? scrollController;
  final String? remainingSuffix;

  @override
  Widget build(BuildContext context) {
    final Widget body;
    if (status == TextualAttachmentPreviewStatus.error) {
      body = TextualAttachmentPreviewErrorRow(previewError: previewError);
    } else if (rows == null ||
        status == TextualAttachmentPreviewStatus.loading ||
        status == TextualAttachmentPreviewStatus.idle) {
      body = const TextualAttachmentPreviewLoading();
    } else {
      body = _CsvTable(rows: rows!, remainingSuffix: remainingSuffix);
    }

    return RepaintBoundary(
      child: TextualAttachmentPreviewSurface(
        status: status,
        visibleLineCount: visibleLineCount,
        previewError: previewError,
        copyTextContent: copyTextContent,
        fillAvailableSpace: fillAvailableSpace,
        scrollController: scrollController,
        contentPadding: kTextualPreviewCodeInset,
        child: body,
      ),
    );
  }
}

class _CsvTable extends StatelessWidget {
  const _CsvTable({required this.rows, this.remainingSuffix});

  final CsvRows rows;
  final String? remainingSuffix;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final int columnCount = csvColumnCount(rows);
    final double baseFontSize = context.textStyles.smallText.fontSize ?? 13;
    final double minCellWidth = baseFontSize * 5;
    final EdgeInsets cellPadding = EdgeInsets.symmetric(
      horizontal: baseFontSize * 0.75,
      vertical: baseFontSize * 0.5,
    );
    final TextStyle tableStyle = context.textStyles.smallText.copyWith(
      color: colors.textPrimary,
      fontSize: baseFontSize * 0.875,
      height: 1.4,
      fontWeight: FontWeight.w400,
    );
    final TextStyle headerStyle = tableStyle.copyWith(
      color: colors.textPrimary,
      fontWeight: FontWeight.w600,
      height: context.textStyles.smallText.height,
    );
    final BorderSide borderSide = BorderSide(color: colors.borderColor);
    final BorderRadius borderRadius = layout.radiusMd;

    final List<TableRow> tableRows = List<TableRow>.generate(rows.length, (
      int rowIndex,
    ) {
      final List<String> row = rows[rowIndex];
      final bool isHeader = rowIndex == 0;
      final int bodyRowIndex = rowIndex - 1;
      return TableRow(
        children: List<Widget>.generate(columnCount, (int cellIndex) {
          final String value = cellIndex < row.length ? row[cellIndex] : '';
          final Color backgroundColor = isHeader
              ? colors.bgTableHeader
              : bodyRowIndex.isEven
              ? colors.bgTableRowOdd
              : colors.bgTableRowEven;
          return Container(
            constraints: BoxConstraints(minWidth: minCellWidth),
            padding: cellPadding,
            alignment: isHeader ? Alignment.topLeft : Alignment.centerLeft,
            color: backgroundColor,
            child: Text(value, style: isHeader ? headerStyle : tableStyle),
          );
        }),
      );
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Table(
            defaultVerticalAlignment:
                TableCellVerticalAlignment.intrinsicHeight,
            defaultColumnWidth: const IntrinsicColumnWidth(),
            border: TableBorder(
              top: borderSide,
              left: borderSide,
              right: borderSide,
              bottom: borderSide,
              horizontalInside: borderSide,
              borderRadius: borderRadius,
            ),
            children: tableRows,
          ),
        ),
        if (remainingSuffix != null) ...[
          const SizedBox(height: 6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              remainingSuffix!,
              style: context.textStyles.smallText.copyWith(
                color: colors.textTertiary,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
