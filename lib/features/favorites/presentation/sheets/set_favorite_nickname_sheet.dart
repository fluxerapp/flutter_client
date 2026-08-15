import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/favorites/providers/favorite_channels_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

Future<void> showSetFavoriteNicknameSheet(
  BuildContext context, {
  required String channelId,
  String? currentNickname,
}) async {
  final l10n = FluxerLocalizations.of(context);
  final controller = TextEditingController(text: currentNickname ?? '');
  await FluxerBottomSheet.show<void>(
    context,
    title: l10n.favoritesSetNickname,
    builder: (sheetContext, close) => Consumer(
      builder: (context, ref, _) {
        return FluxerBottomSheetContent(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FluxerInput(
                controller: controller,
                label: l10n.favoritesNicknameLabel,
              ),
              const SizedBox(height: 16),
              FluxerButton.primary(
                label: l10n.favoritesSaveNickname,
                onPressed: () async {
                  final nickname = controller.text.trim();
                  await ref
                      .read(favoriteChannelsRepositoryProvider)
                      .setChannelNickname(
                        channelId: channelId,
                        nickname: nickname.isEmpty ? null : nickname,
                      );
                  close();
                },
              ),
            ],
          ),
        );
      },
    ),
  );
}
