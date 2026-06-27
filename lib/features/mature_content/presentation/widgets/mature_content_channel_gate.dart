import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/presentation/mature_content_gate_copy.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';

class MatureContentChannelGate extends ConsumerWidget {
  const MatureContentChannelGate({
    required this.channelId,
    this.guildId,
    this.channelType,
    super.key,
  });

  final String channelId;
  final String? guildId;
  final ChannelType? channelType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MatureContentGateReason> reasonAsync = ref.watch(
      matureContentGateReasonProvider(channelId),
    );
    final AsyncValue<ResolvedMatureGateContext?> contextAsync = ref.watch(
      matureGateContextProvider(channelId),
    );
    return reasonAsync.when(
      data: (MatureContentGateReason reason) {
        if (reason == MatureContentGateReason.none) {
          return const SizedBox.shrink();
        }
        return contextAsync.when(
          data: (ResolvedMatureGateContext? gateContext) {
            if (gateContext == null) {
              return const SizedBox.shrink();
            }
            return _MatureContentChannelGateBody(
              reason: reason,
              gateContext: gateContext,
              channelId: channelId,
              channelType: channelType,
            );
          },
          loading: () => const Center(child: FluxerLoadingSpinner()),
          error: (_, _) => const SizedBox.shrink(),
        );
      },
      loading: () => const Center(child: FluxerLoadingSpinner()),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}

class _MatureContentChannelGateBody extends ConsumerWidget {
  const _MatureContentChannelGateBody({
    required this.reason,
    required this.gateContext,
    required this.channelId,
    this.channelType,
  });

  final MatureContentGateReason reason;
  final ResolvedMatureGateContext gateContext;
  final String channelId;
  final ChannelType? channelType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final MatureContentGateCopy copy = resolveMatureContentGateCopy(
      l10n: l10n,
      reason: reason,
      context: gateContext,
      channelType: channelType,
    );
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.layout.s6),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 420),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                copy.title,
                textAlign: TextAlign.center,
                style: context.textStyles.heading.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              SizedBox(height: context.layout.s3),
              Text(
                copy.body,
                textAlign: TextAlign.center,
                style: context.textStyles.bodyMedium.copyWith(
                  color: context.colors.textSecondary,
                  height: 1.4,
                ),
              ),
              if (copy.canProceed && copy.primaryButtonLabel != null) ...[
                SizedBox(height: context.layout.s4),
                SizedBox(
                  width: double.infinity,
                  child: FluxerButton.primary(
                    label: copy.primaryButtonLabel,
                    onPressed: () async {
                      final String scopeId = gateContext.scopeId ?? channelId;
                      await ref
                          .read(matureContentAgreementsProvider.notifier)
                          .agreeForScope(
                            scope: gateContext.scope,
                            scopeId: scopeId,
                          );
                    },
                  ),
                ),
              ],
              if (!copy.canProceed) ...[
                SizedBox(height: context.layout.s4),
                SizedBox(
                  width: double.infinity,
                  child: FluxerButton.secondary(
                    label: MaterialLocalizations.of(context).cancelButtonLabel,
                    onPressed: () => context.pop(),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
