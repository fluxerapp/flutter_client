import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/shell/providers/current_user_private_provider.dart';
import 'package:fluxer_dart/export.dart';

Future<void> clearUnreadGiftInventoryFlag(WidgetRef ref) async {
  final FluxerClient client = ref.read(fluxerClientProvider);
  await client.users.updateCurrentUser(
    body: const UserUpdateWithVerificationRequest(
      hasUnreadGiftInventory: false,
    ),
  );
  await ref.read(currentUserPrivateReadProvider.notifier).refresh();
}

Future<void> dismissPremiumOnboardingFlag(WidgetRef ref) async {
  final FluxerClient client = ref.read(fluxerClientProvider);
  await client.users.updateCurrentUser(
    body: const UserUpdateWithVerificationRequest(
      hasDismissedPremiumOnboarding: true,
    ),
  );
  await ref.read(currentUserPrivateReadProvider.notifier).refresh();
}
