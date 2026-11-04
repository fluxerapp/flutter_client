import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/app/account_user_id.dart';
import 'package:fluxer_app/features/shell/providers/user/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart';

Future<void> clearUnreadGiftInventoryFlag(WidgetRef ref) async {
  final FluxerClient client = ref.read(fluxerClientProvider);
  await client.users.updateCurrentUser(
    body: UserUpdateWithVerificationRequest(hasUnreadGiftInventory: false),
  );
  await ref
      .read(currentUserPrivateReadProvider(readAccountUserId(ref)).notifier)
      .refresh();
}

Future<void> dismissPremiumOnboardingFlag(WidgetRef ref) async {
  final FluxerClient client = ref.read(fluxerClientProvider);
  await client.users.updateCurrentUser(
    body: UserUpdateWithVerificationRequest(
      hasDismissedPremiumOnboarding: true,
    ),
  );
  await ref
      .read(currentUserPrivateReadProvider(readAccountUserId(ref)).notifier)
      .refresh();
}
