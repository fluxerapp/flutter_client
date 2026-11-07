import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/age/declared_age_range_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/account_delete_sheet.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

final GlobalKey<NavigatorState> declaredAgeRangeNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'declaredAgeRange');

class DeclaredAgeRangeLock extends ConsumerWidget {
  const DeclaredAgeRangeLock({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DeclaredAgeFloor floor = ref.watch(declaredAgeFloorProvider);
    if (floor != DeclaredAgeFloor.underMinimum) {
      return child;
    }
    return Navigator(
      key: declaredAgeRangeNavigatorKey,
      onGenerateRoute: (RouteSettings settings) => PageRouteBuilder<void>(
        settings: settings,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (_, _, _) => const _UnderMinimumLockScreen(),
      ),
    );
  }
}

class _UnderMinimumLockScreen extends ConsumerWidget {
  const _UnderMinimumLockScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Material(
      color: context.colors.backgroundPrimary,
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Semantics(
                    header: true,
                    child: Text(
                      l10n.ageRangeUnderMinimumTitle,
                      textAlign: TextAlign.center,
                      style: context.textStyles.heading.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    defaultTargetPlatform == TargetPlatform.android
                        ? l10n.ageRangeUnderMinimumBodyGoogle
                        : l10n.ageRangeUnderMinimumBody,
                    textAlign: TextAlign.center,
                    style: context.textStyles.bodyMedium.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: 24),
                  FluxerButton.secondary(
                    label: l10n.signOut,
                    onPressedAsync: () async {
                      final String? userId = ref.read(currentUserIdProvider);
                      if (userId == null) {
                        return;
                      }
                      await ref
                          .read(accountManagerProvider.notifier)
                          .signOut(userId);
                    },
                  ),
                  const SizedBox(height: 12),
                  FluxerButton.dangerSecondary(
                    label: l10n.dangerZoneDeleteTitle,
                    onPressedAsync: () => AccountDeleteSheet.show(context, ref),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
