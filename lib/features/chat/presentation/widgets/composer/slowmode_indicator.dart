import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/wide_composer_layout.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_immunity_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_indicator_shake_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode/slowmode_tracker.dart';
import 'package:fluxer_app/features/chat/utils/slowmode_format.dart';
import 'package:fluxer_app/features/ui/tooltip/fluxer_tooltip.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Duration _kTickInterval = Duration(seconds: 1);
const Duration _kShakeDuration = Duration(milliseconds: 300);
const int _kSecondsPerMinute = 60;
const int _kSecondsPerHour = 3600;

/// Floating pill shown next to the chat input when slowmode is active.
class SlowmodeIndicator extends ConsumerStatefulWidget {
  const SlowmodeIndicator({
    this.leadingSpacing = 0,
    this.compact = false,
    super.key,
  });

  final double leadingSpacing;
  final bool compact;

  @override
  ConsumerState<SlowmodeIndicator> createState() => _SlowmodeIndicatorState();
}

class _SlowmodeIndicatorState extends ConsumerState<SlowmodeIndicator>
    with SingleTickerProviderStateMixin {
  Timer? _ticker;
  late final AnimationController _shakeController;
  late final Animation<double> _shakeOffset;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      vsync: this,
      duration: _kShakeDuration,
    );
    _shakeOffset =
        TweenSequence<double>(<TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 0, end: -5),
            weight: 1,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: -5, end: 5),
            weight: 2,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 5, end: -4),
            weight: 2,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: -4, end: 4),
            weight: 2,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double>(begin: 4, end: 0),
            weight: 1,
          ),
        ]).animate(
          CurvedAnimation(parent: _shakeController, curve: Curves.easeInOut),
        );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    _shakeController.dispose();
    super.dispose();
  }

  void _playShake() {
    _shakeController.forward(from: 0);
  }

  void _ensureTicker(bool active) {
    if (active && _ticker == null) {
      _ticker = Timer.periodic(_kTickInterval, (_) {
        if (mounted) {
          setState(() {});
        }
      });
      return;
    }
    if (!active && _ticker != null) {
      _ticker!.cancel();
      _ticker = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(slowmodeIndicatorShakeProvider, (_, _) => _playShake());
    final channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    if (channelId.isEmpty) {
      _ensureTicker(false);
      return const SizedBox.shrink();
    }
    ref.watch(slowmodeTrackerProvider.select((s) => s[channelId] ?? 0));
    final channel = ref.watch(channelByIdProvider(channelId)).value;
    final rateLimit = channel?.rateLimitPerUser ?? 0;
    if (rateLimit <= 0) {
      _ensureTicker(false);
      return const SizedBox.shrink();
    }
    final bool isImmune = ref
        .watch(isSlowmodeImmuneProvider(channelId))
        .maybeWhen(data: (bool immune) => immune, orElse: () => false);
    final remaining = ref
        .read(slowmodeTrackerProvider.notifier)
        .remainingFor(channelId, rateLimit);
    final showCountdown = remaining > Duration.zero && !isImmune;
    _ensureTicker(showCountdown);
    return Padding(
      padding: EdgeInsets.only(left: widget.leadingSpacing),
      child: AnimatedBuilder(
        animation: _shakeOffset,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(_shakeOffset.value, 0),
            child: child,
          );
        },
        child: _SlowmodePill(
          remaining: showCountdown ? remaining : null,
          rateLimitSeconds: rateLimit,
          isImmune: isImmune,
          compact: widget.compact,
        ),
      ),
    );
  }
}

class _SlowmodePill extends StatelessWidget {
  const _SlowmodePill({
    required this.remaining,
    required this.rateLimitSeconds,
    required this.isImmune,
    required this.compact,
  });

  final Duration? remaining;
  final int rateLimitSeconds;
  final bool isImmune;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = FluxerLocalizations.of(context);
    final isActive = remaining != null;
    final foreground = isActive ? colors.textDanger : colors.textSecondary;
    final Color surfaceColor = composerStatusSurfaceColor(context);
    final List<Shadow>? shadows = compact
        ? null
        : wideComposerStatusTextShadows(surfaceColor);
    final textStyle = context.textStyles.timestamp.copyWith(
      color: compact ? foreground : colors.textPrimaryMuted,
      fontWeight: FontWeight.w600,
      fontSize: 12,
      height: compact ? null : 1,
      fontFeatures: const [FontFeature.tabularFigures()],
      shadows: shadows,
    );
    final String durationLabel = formatSlowmodeDurationLabel(rateLimitSeconds);
    final String label = compact
        ? (isActive
              ? formatSlowmodeCountdown(remaining!)
              : l10n.slowmodeLabel(_formatRateLimit(rateLimitSeconds)))
        : (isActive
              ? l10n.slowmodeStatusActive(formatSlowmodeCountdown(remaining!))
              : l10n.slowmodeStatusEnabled);
    final String tooltip = compact
        ? (isImmune && !isActive
              ? l10n.slowmodeTooltipImmune
              : l10n.slowmodeTooltipActive)
        : (isImmune
              ? l10n.slowmodeTooltipSetImmune(durationLabel)
              : isActive
              ? l10n.slowmodeTooltipSetWait(durationLabel)
              : l10n.slowmodeTooltipSetChannel(durationLabel));
    final Widget content = AnimatedDefaultTextStyle(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
      style: textStyle.copyWith(
        color: compact
            ? foreground
            : (isActive ? colors.textDanger : colors.textPrimaryMuted),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              label,
              style: textStyle.copyWith(
                color: compact
                    ? foreground
                    : (isActive ? colors.textDanger : colors.textPrimaryMuted),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(width: compact ? 6 : 3),
          Icon(
            PhosphorIconsFill.clock,
            size: 12,
            color: compact
                ? foreground
                : (isActive ? colors.textDanger : colors.textPrimaryMuted),
          ),
        ],
      ),
    );
    return FluxerTooltip(
      message: tooltip,
      child: Semantics(
        label: label,
        child: compact
            ? content
            : ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: WideComposerLayout.slowmodeMaxWidth,
                ),
                child: SizedBox(
                  height: WideComposerLayout.statusLineHeight,
                  child: content,
                ),
              ),
      ),
    );
  }

  String _formatRateLimit(int totalSeconds) {
    if (totalSeconds >= _kSecondsPerHour) {
      final hours = totalSeconds / _kSecondsPerHour;
      return '${_trim(hours)}h';
    }
    if (totalSeconds >= _kSecondsPerMinute) {
      final minutes = totalSeconds / _kSecondsPerMinute;
      return '${_trim(minutes)}m';
    }
    return '${totalSeconds}s';
  }

  String _trim(double value) {
    if (value == value.roundToDouble()) {
      return value.toInt().toString();
    }
    return value.toStringAsFixed(1);
  }
}
