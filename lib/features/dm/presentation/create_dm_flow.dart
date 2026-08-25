import 'package:fluxer_app/features/dm/presentation/modals/create_dm_modal.dart';
import 'package:fluxer_app/features/dm/presentation/sheets/create_dm_bottom_sheet.dart';
import 'package:fluxer_app/features/dm/providers/create_dm_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/material_ui.dart';

class CreateDmFlow {
  CreateDmFlow._();

  static Future<void> show(
    BuildContext context, {
    CreateDmOptions options = const CreateDmOptions(),
  }) {
    if (isMobileLayout(context)) {
      return CreateDmBottomSheet.show(context, options: options);
    }
    return CreateDmModal.show(context, options: options);
  }
}
