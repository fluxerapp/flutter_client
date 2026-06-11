import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/utils/guild_composer_barrier_l10n.dart';
import 'package:fluxer_app/features/guilds/services/guild_verification.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/claim_account_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/phone_add_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

/// Replaces the message composer when guild verification blocks messaging.
class ChannelComposerBarrier extends ConsumerStatefulWidget {
  const ChannelComposerBarrier({required this.access, super.key});

  final GuildComposerAccess access;

  @override
  ConsumerState<ChannelComposerBarrier> createState() =>
      _ChannelComposerBarrierState();
}

class _ChannelComposerBarrierState
    extends ConsumerState<ChannelComposerBarrier> {
  Timer? _countdownTimer;
  Duration? _remaining;

  @override
  void initState() {
    super.initState();
    _remaining = widget.access.timeRemaining;
    _ensureCountdownTimer();
  }

  @override
  void didUpdateWidget(ChannelComposerBarrier oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.access.timeRemaining != widget.access.timeRemaining) {
      _remaining = widget.access.timeRemaining;
      _ensureCountdownTimer();
    }
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }

  void _ensureCountdownTimer() {
    _countdownTimer?.cancel();
    _countdownTimer = null;
    final Duration? remaining = _remaining;
    if (remaining == null || remaining <= Duration.zero) {
      return;
    }
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (!mounted) {
        return;
      }
      final Duration? current = _remaining;
      if (current == null) {
        return;
      }
      final Duration next = current - const Duration(seconds: 1);
      setState(() {
        _remaining = next <= Duration.zero ? Duration.zero : next;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final GuildComposerBlockReason? reason = widget.access.reason;
    if (reason == null) {
      return const SizedBox.shrink();
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final String message = guildComposerBarrierMessage(l10n, reason);
    final Widget? action = _buildAction(context, l10n, reason);
    final Duration? remaining = _remaining;
    final Widget? countdown = remaining != null && remaining > Duration.zero
        ? Text(
            formatComposerBarrierCountdown(remaining),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
              fontFeatures: const <FontFeature>[FontFeature.tabularFigures()],
            ),
          )
        : null;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: context.colors.chatInputBackground,
            border: Border(
              top: BorderSide(color: context.colors.userAreaDividerColor),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: PhosphorIcon(
                  _iconForReason(reason),
                  size: 18,
                  color: context.colors.textSecondary,
                ),
              ),
              Expanded(
                child: Text(
                  message,
                  style: context.textStyles.bodyMedium.copyWith(
                    color: context.colors.textSecondary,
                    height: 1.35,
                  ),
                ),
              ),
              if (countdown != null) ...<Widget>[
                const SizedBox(width: 8),
                countdown,
              ],
              if (action != null) ...<Widget>[const SizedBox(width: 8), action],
            ],
          ),
        ),
        Container(
          height: MediaQuery.of(context).padding.bottom,
          decoration: BoxDecoration(color: context.colors.chatInputBackground),
        ),
      ],
    );
  }

  IconData _iconForReason(GuildComposerBlockReason reason) {
    return switch (reason) {
      GuildComposerBlockReason.guildSendDisabled =>
        PhosphorIconsFill.warningCircle,
      GuildComposerBlockReason.timedOut => PhosphorIconsFill.timer,
      GuildComposerBlockReason.unclaimedAccount =>
        PhosphorIconsFill.shieldWarning,
      GuildComposerBlockReason.unverifiedEmail =>
        PhosphorIconsFill.envelopeSimple,
      GuildComposerBlockReason.accountTooNew ||
      GuildComposerBlockReason.notMemberLongEnough => PhosphorIconsFill.clock,
      GuildComposerBlockReason.noPhoneNumber => PhosphorIconsFill.phone,
    };
  }

  Widget? _buildAction(
    BuildContext context,
    FluxerLocalizations l10n,
    GuildComposerBlockReason reason,
  ) {
    return switch (reason) {
      GuildComposerBlockReason.unclaimedAccount => FluxerButton.secondary(
        label: l10n.claimAccount,
        size: FluxerButtonSize.compact,
        onPressed: () => ClaimAccountSheet.show(context, ref),
      ),
      GuildComposerBlockReason.unverifiedEmail => FluxerButton.secondary(
        label: l10n.channelComposerBarrierVerifyEmail,
        size: FluxerButtonSize.compact,
        onPressed: () =>
            UserSettingsModal.show(context, openSecuritySection: true),
      ),
      GuildComposerBlockReason.noPhoneNumber => FluxerButton.secondary(
        label: l10n.channelComposerBarrierVerifyPhone,
        size: FluxerButtonSize.compact,
        onPressed: () => PhoneAddSheet.show(context, ref),
      ),
      GuildComposerBlockReason.guildSendDisabled ||
      GuildComposerBlockReason.timedOut ||
      GuildComposerBlockReason.accountTooNew ||
      GuildComposerBlockReason.notMemberLongEnough => null,
    };
  }
}
