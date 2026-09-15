import 'dart:async';

import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/utils/guild_invites_utils.dart';
import 'package:fluxer_app/material_ui.dart';

class GuildInviteCountdownText extends StatefulWidget {
  const GuildInviteCountdownText({
    required this.expiresAt,
    required this.expiredLabel,
    required this.neverLabel,
    super.key,
    this.textStyle,
    this.plainTextStyle,
  });

  final DateTime? expiresAt;
  final String expiredLabel;
  final String neverLabel;
  final TextStyle? textStyle;
  final TextStyle? plainTextStyle;

  @override
  State<GuildInviteCountdownText> createState() =>
      GuildInviteCountdownTextState();
}

class GuildInviteCountdownTextState extends State<GuildInviteCountdownText> {
  Timer? _timer;
  InviteCountdownState _state = const InviteCountdownState(
    text: null,
    isMonospace: false,
  );

  @visibleForTesting
  bool get hasActiveTimer => _timer != null;

  @override
  void initState() {
    super.initState();
    _applyCountdown(notify: false);
  }

  @override
  void didUpdateWidget(covariant GuildInviteCountdownText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expiresAt != widget.expiresAt ||
        oldWidget.expiredLabel != widget.expiredLabel ||
        oldWidget.neverLabel != widget.neverLabel) {
      _applyCountdown(notify: true);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _applyCountdown({required bool notify}) {
    final InviteCountdownState next = _resolveState();
    _syncTimer(next);
    if (_state.text == next.text && _state.isMonospace == next.isMonospace) {
      return;
    }
    if (notify && mounted) {
      setState(() {
        _state = next;
      });
      return;
    }
    _state = next;
  }

  InviteCountdownState _resolveState() {
    if (widget.expiresAt == null) {
      return InviteCountdownState(text: widget.neverLabel, isMonospace: false);
    }
    return GuildInvitesUtils.resolveCountdown(
      expiresAt: widget.expiresAt,
      expiredLabel: widget.expiredLabel,
    );
  }

  void _syncTimer(InviteCountdownState next) {
    if (next.isMonospace) {
      _timer ??= Timer.periodic(
        const Duration(seconds: 1),
        (_) => _applyCountdown(notify: true),
      );
      return;
    }
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    final String? text = _state.text;
    if (text == null || text.isEmpty) {
      return const SizedBox.shrink();
    }
    final TextStyle baseStyle = _state.isMonospace
        ? (widget.textStyle ??
              context.textStyles.bodySmall.copyWith(
                fontFamily: 'monospace',
                color: context.colors.textPrimary,
              ))
        : (widget.plainTextStyle ??
              context.textStyles.bodySmall.copyWith(
                color: context.colors.textPrimary,
              ));
    return Text(
      text,
      style: baseStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
