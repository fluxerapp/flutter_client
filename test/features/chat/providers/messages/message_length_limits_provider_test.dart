import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/limits/limit_context.dart';
import 'package:fluxer_app/core/limits/limit_defaults.dart';
import 'package:fluxer_app/core/premium/current_user_entitlements_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/chat/providers/messages/message_length_limits_provider.dart';
import 'package:fluxer_dart/export.dart';

class _PendingWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() {
    return Completer<WellKnownFluxerResponse>().future;
  }
}

void main() {
  group('message length limits providers', () {
    test(
      'maxMessageLength uses non-premium fallback when well-known loading',
      () {
        final ProviderContainer container = ProviderContainer(
          overrides: [
            wellKnownProvider.overrideWith(_PendingWellKnown.new),
            currentUserLimitContextProvider.overrideWith(
              (Ref ref) => buildUserLimitContext(traits: const <String>[]),
            ),
            isEffectivelyPremiumProvider.overrideWith((Ref ref) => false),
          ],
        );
        addTearDown(container.dispose);

        expect(
          container.read(maxMessageLengthProvider),
          kMaxMessageLengthNonPremium,
        );
      },
    );

    test('maxMessageLength uses premium fallback for premium users', () {
      final ProviderContainer container = ProviderContainer(
        overrides: [
          wellKnownProvider.overrideWith(_PendingWellKnown.new),
          currentUserLimitContextProvider.overrideWith(
            (Ref ref) => buildUserLimitContext(traits: const <String>['premium']),
          ),
          isEffectivelyPremiumProvider.overrideWith((Ref ref) => true),
        ],
      );
      addTearDown(container.dispose);

      expect(
        container.read(maxMessageLengthProvider),
        kMaxMessageLengthPremium,
      );
    });

    test('premiumMaxMessageLength uses premium fallback when loading', () {
      final ProviderContainer container = ProviderContainer(
        overrides: [wellKnownProvider.overrideWith(_PendingWellKnown.new)],
      );
      addTearDown(container.dispose);

      expect(
        container.read(premiumMaxMessageLengthProvider),
        kMaxMessageLengthPremium,
      );
    });
  });
}
