import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/presentation/report_flow/report_flow_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';

Future<void> openReportFlow(
  BuildContext context, {
  required IarContext iarContext,
}) {
  return FluxerBottomSheet.show<void>(
    context,
    builder: (sheetContext, close) =>
        ReportFlowSheet(target: iarContext, close: close),
  );
}
