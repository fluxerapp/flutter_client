import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

class MatureMediaOverlay extends ConsumerStatefulWidget {
  const MatureMediaOverlay({
    required this.child,
    required this.channelId,
    required this.isMatureMedia,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.placeholderSize,
    super.key,
  });

  final Widget child;
  final String? channelId;
  final bool isMatureMedia;
  final BorderRadius borderRadius;
  final Size? placeholderSize;

  @override
  ConsumerState<MatureMediaOverlay> createState() => _MatureMediaOverlayState();
}

class _MatureMediaOverlayState extends ConsumerState<MatureMediaOverlay> {
  var _revealed = false;

  @override
  void didUpdateWidget(covariant MatureMediaOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channelId != widget.channelId ||
        oldWidget.isMatureMedia != widget.isMatureMedia) {
      _revealed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isMatureMedia || widget.channelId == null) {
      return widget.child;
    }
    final AsyncValue<MatureMediaPolicy> policyAsync = ref.watch(
      matureMediaPolicyProvider(
        MatureMediaPolicyRequest(
          channelId: widget.channelId!,
          isMatureMedia: widget.isMatureMedia,
        ),
      ),
    );
    return policyAsync.when(
      data: (MatureMediaPolicy policy) => _buildWithPolicy(context, policy),
      loading: () => _buildPendingPlaceholder(context),
      error: (_, _) => _buildPendingPlaceholder(context),
    );
  }

  bool _shouldShowMedia(MatureMediaPolicy policy) {
    if (policy.shouldBlock) {
      return false;
    }
    if (!policy.shouldBlur) {
      return true;
    }
    return _revealed && policy.canReveal;
  }

  Widget _buildWithPolicy(BuildContext context, MatureMediaPolicy policy) {
    if (policy.shouldBlock) {
      return _buildBlockedPlaceholder(context);
    }
    if (_shouldShowMedia(policy)) {
      return widget.child;
    }
    return _buildBlurredOverlay(context, policy);
  }

  Widget _buildPendingPlaceholder(BuildContext context) {
    final Size size = widget.placeholderSize ?? const Size(200, 120);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.spoilerBackground,
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }

  Widget _buildBlockedPlaceholder(BuildContext context) {
    final Size size = widget.placeholderSize ?? const Size(200, 120);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: context.colors.spoilerBackground,
          borderRadius: widget.borderRadius,
        ),
      ),
    );
  }

  Widget _buildBlurredOverlay(BuildContext context, MatureMediaPolicy policy) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ClipRRect(
      borderRadius: widget.borderRadius,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          _buildPendingPlaceholder(context),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.spoilerBackground.withValues(alpha: 0.72),
              ),
              child: Center(
                child: policy.canReveal
                    ? Semantics(
                        button: true,
                        label: l10n.matureMediaRevealHint,
                        child: TextButton(
                          onPressed: () => setState(() => _revealed = true),
                          style: TextButton.styleFrom(
                            backgroundColor: context.colors.backgroundSecondary,
                            foregroundColor: context.colors.textPrimary,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          child: Text(
                            l10n.matureMediaRevealButton,
                            style: context.textStyles.bodySmall.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
