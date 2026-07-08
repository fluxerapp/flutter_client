import 'package:flutter/material.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/create_category_sheet.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/create_channel_sheet.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CreateChannelCategoryPickerSheet {
  CreateChannelCategoryPickerSheet._();

  static Future<void> show(
    BuildContext context, {
    String? parentId,
    Future<void> Function(ChannelCreateRequest request)? onCreateChannel,
    Future<void> Function(String name)? onCreateCategory,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.guildMenuSettingsChannels,
      variant: FluxerBottomSheetVariant.menu,
      useRootNavigator: true,
      builder: (BuildContext sheetContext, VoidCallback close) {
        return FluxerBottomSheetContent(
          scrollable: false,
          child: FluxerBottomSheetGroupColumn(
            children: <Widget>[
              FluxerMenuGroup(
                children: <Widget>[
                  FluxerBottomSheetMenuItem(
                    label: l10n.guildNavbarCreateChannel,
                    icon: PhosphorIconsFill.plusCircle,
                    onTap: () async {
                      close();
                      if (!context.mounted) {
                        return;
                      }
                      final ChannelCreateRequest? request =
                          await CreateChannelSheet.show(
                            context,
                            parentId: parentId,
                          );
                      if (request != null && context.mounted) {
                        await onCreateChannel?.call(request);
                      }
                    },
                  ),
                  FluxerBottomSheetMenuItem(
                    label: l10n.guildNavbarCreateCategory,
                    icon: PhosphorIconsFill.folderPlus,
                    onTap: () async {
                      close();
                      if (!context.mounted) {
                        return;
                      }
                      final String? name = await CreateCategorySheet.show(
                        context,
                      );
                      if (name != null && name.isNotEmpty && context.mounted) {
                        await onCreateCategory?.call(name);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
