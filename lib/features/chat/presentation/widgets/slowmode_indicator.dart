import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/chat/providers/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/slowmode_immunity_provider.dart';
import 'package:fluxer_app/features/chat/providers/slowmode_tracker.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

const Duration _kTickInterval = Duration(seconds: 1);
const int _kSecondsPerMinute = 60;
const int _kSecondsPerHour = 3600;

/// Floating pill shown next to the chat input when slowmode is active.
class SlowmodeIndicator extends ConsumerStatefulWidget {
  const SlowmodeIndicator({super.key});

  @override
  ConsumerState<SlowmodeIndicator> createState() => _SlowmodeIndicatorState();
}

class _SlowmodeIndicatorState extends ConsumerState<SlowmodeIndicator> {
  Timer? _ticker;

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
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
    final channelId = ref.watch(
      chatViewModelProvider.select((s) => s.channelId),
    );
    if (channelId.isEmpty) {
      _ensureTicker(false);
      return const SizedBox.shrink();
    }
    ref.watch(slowmodeTrackerProvider);
    final channel = ref.watch(channelByIdProvider(channelId)).value;
    final rateLimit = channel?.rateLimitPerUser ?? 0;
    if (rateLimit <= 0) {
      _ensureTicker(false);
      return const SizedBox.shrink();
    }
    final isImmune = ref.watch(isSlowmodeImmuneProvider(channelId)).value ??
        false;
    final remaining = ref
        .read(slowmodeTrackerProvider.notifier)
        .remainingFor(channelId, rateLimit);
    final showCountdown = remaining > Duration.zero && !isImmune;
    _ensureTicker(showCountdown);
    return _SlowmodePill(
      remaining: showCountdown ? remaining : null,
      rateLimitSeconds: rateLimit,
      isImmune: isImmune,
    );
  }
}

class _SlowmodePill extends StatelessWidget {
  const _SlowmodePill({
    required this.remaining,
    required this.rateLimitSeconds,
    required this.isImmune,
  });

  final Duration? remaining;
  final int rateLimitSeconds;
  final bool isImmune;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final l10n = FluxerLocalizations.of(context);
    final isActive = remaining != null;
    final foreground = isActive ? colors.textDanger : colors.textSecondary;
    final borderColor = isActive
        ? colors.textDanger
        : colors.userAreaDividerColor;
    final textStyle = TextStyle(
      color: foreground,
      fontSize: 12,
      height: 1.2,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
    final label = isActive
        ? _formatRemaining(remaining!)
        : l10n.slowmodeLabel(_formatRateLimit(rateLimitSeconds));
    final tooltip = isImmune && !isActive
        ? l10n.slowmodeTooltipImmune
        : l10n.slowmodeTooltipActive;
    return Tooltip(
      message: tooltip,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: colors.chatInputBackground,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(PhosphorIconsFill.clock, size: 12, color: foreground),
            const SizedBox(width: 6),
            Text(label, style: textStyle),
          ],
        ),
      ),
    );
  }

  String _formatRemaining(Duration remaining) {
    final totalSeconds = (remaining.inMilliseconds / 1000).ceil();
    final hours = totalSeconds ~/ _kSecondsPerHour;
    final minutes = (totalSeconds % _kSecondsPerHour) ~/ _kSecondsPerMinute;
    final seconds = totalSeconds % _kSecondsPerMinute;
    final mm = minutes.toString().padLeft(2, '0');
    final ss = seconds.toString().padLeft(2, '0');
    if (hours > 0) {
      final hh = hours.toString().padLeft(2, '0');
      return '$hh:$mm:$ss';
    }
    return '$mm:$ss';
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
