import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/auth/data/phone_verification_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'phone_verification_providers.g.dart';

@Riverpod(keepAlive: true)
PhoneVerificationRepository phoneVerificationRepository(Ref ref) {
  return PhoneVerificationRepository(ref.watch(fluxerClientProvider));
}
