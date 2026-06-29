import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/friends/providers/friend_providers.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/change_nickname_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

Future<void> showChangeFriendNicknameSheet(
  BuildContext context,
  WidgetRef ref, {
  required String userId,
  required String username,
  required String? currentNick,
}) async {
  final ChangeNicknameResult? result = await ChangeNicknameSheet.show(
    context,
    username: username,
    currentNick: currentNick,
  );
  if (result == null || !context.mounted) {
    return;
  }
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final toast = ref.read(toastProvider.notifier);
  try {
    await ref
        .read(friendRepositoryProvider)
        .updateNickname(userId: userId, nickname: result.nick);
    toast.show(
      FluxerToast(
        message: l10n.userProfileNicknameSuccess,
        variant: FluxerToastVariant.success,
      ),
    );
  } on Object {
    toast.show(
      FluxerToast(
        message: l10n.userProfileActionFailed,
        variant: FluxerToastVariant.danger,
      ),
    );
  }
}
