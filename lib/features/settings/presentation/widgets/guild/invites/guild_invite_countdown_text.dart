import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/utils/guild_invites_utils.dart';

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
      _GuildInviteCountdownTextState();
}

class _GuildInviteCountdownTextState extends State<GuildInviteCountdownText> {
  Timer? _timer;
  InviteCountdownState _state = const InviteCountdownState(
    text: null,
    isMonospace: false,
  );

  @override
  void initState() {
    super.initState();
    _updateCountdown();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateCountdown(),
    );
  }

  @override
  void didUpdateWidget(covariant GuildInviteCountdownText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.expiresAt != widget.expiresAt ||
        oldWidget.expiredLabel != widget.expiredLabel) {
      _updateCountdown();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _updateCountdown() {
    if (widget.expiresAt == null) {
      setState(() {
        _state = InviteCountdownState(
          text: widget.neverLabel,
          isMonospace: false,
        );
      });
      return;
    }
    setState(() {
      _state = GuildInvitesUtils.resolveCountdown(
        expiresAt: widget.expiresAt,
        expiredLabel: widget.expiredLabel,
      );
    });
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
