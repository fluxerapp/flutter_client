import 'dart:async';
import 'dart:math' as math;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/gateway/providers/gateway_event_providers.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/profile/domain/custom_status_utils.dart';
import 'package:fluxer_app/features/profile/domain/presence_status_labels.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/shell/presentation/user_area_popout.dart';
import 'package:fluxer_app/features/shell/presentation/widgets/user_panel_widgets.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/voice_connection_status/voice_connection_status.dart';
import 'package:fluxer_app/features/voice/providers/local_voice_state_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:fluxer_app/shared/utils/user_tag.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';
import 'package:fluxer_dart/gateway.dart';

class UserArea extends ConsumerWidget {
  final VoidCallback? onSettingsTap;

  const UserArea({this.onSettingsTap, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final VoiceSessionState voice = ref.watch(voiceSessionProvider);
    final localVoice = ref.watch(localVoiceStateProvider);
    final String? connectionId = voice.activeConnectionId;
    final VoiceState? selfVoiceState = connectionId == null
        ? null
        : ref.watch(voiceStateForConnectionProvider(connectionId));
    final bool inVoice = voice.isInVoice;
    final bool isMuted = inVoice
        ? (selfVoiceState?.selfMute ?? false)
        : localVoice.selfMute;
    final bool isDeafened = inVoice
        ? (selfVoiceState?.selfDeaf ?? false)
        : localVoice.selfDeaf;
    final layout = context.layout;
    final colors = context.colors;
    final bool showVoiceSection =
        isWideLayout(context) && voice.showDesktopVoiceConnectionSection;
    if (usesDesktopPointerUi(context)) {
      return _DesktopUserArea(
        showVoiceSection: showVoiceSection,
        controls: _controlButtons(
          context,
          ref,
          l10n: l10n,
          isMuted: isMuted,
          isDeafened: isDeafened,
        ),
      );
    }
    final user = ref.watch(userSettingsViewModelProvider);
    final double verticalPadding =
        (layout.userAreaHeight - kUserAreaContentHeight) / 2;

    return ColoredBox(
      color: colors.panelControlBg,
      child: SafeArea(
        top: false,
        left: false,
        right: false,
        bottom: isWideLayout(context),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (showVoiceSection) ...<Widget>[
              const UserAreaDivider(),
              const VoiceConnectionStatus(),
              const UserAreaDivider(),
            ] else
              const UserAreaDivider(),
            Padding(
              padding: EdgeInsets.fromLTRB(
                layout.s4,
                verticalPadding,
                layout.s4,
                verticalPadding,
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Material(
                      color: Colors.transparent,
                      borderRadius: layout.radiusMd,
                      child: InkWell(
                        borderRadius: layout.radiusMd,
                        hoverColor: colors.textPrimary.withValues(alpha: 0.03),
                        onTap: () =>
                            unawaited(UserAreaPopout.show(context, ref)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: layout.s2),
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              minHeight: kUserAreaContentHeight,
                            ),
                            child: Row(
                              children: <Widget>[
                                FluxerAvatar.userPresence(
                                  fallbackText: user.displayName,
                                  userId: user.userId,
                                  imageUrl: user.avatarUrl,
                                  avatarColor: user.avatarColor,
                                  size: 36,
                                ),
                                SizedBox(width: layout.s2),
                                Expanded(
                                  child: Text(
                                    user.displayName,
                                    style: context.textStyles.label.copyWith(
                                      height: 18 / 14,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: layout.s3),
                  ..._controlButtons(
                    context,
                    ref,
                    l10n: l10n,
                    isMuted: isMuted,
                    isDeafened: isDeafened,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _controlButtons(
    BuildContext context,
    WidgetRef ref, {
    required FluxerLocalizations l10n,
    required bool isMuted,
    required bool isDeafened,
  }) {
    final layout = context.layout;
    return <Widget>[
      UserPanelControlButton(
        icon: PhosphorIcon(
          isMuted
              ? PhosphorIconsFill.microphoneSlash
              : PhosphorIconsFill.microphone,
        ),
        isActive: isMuted,
        tooltip: isMuted
            ? l10n.userAreaUnmuteMicrophone
            : l10n.userAreaMuteMicrophone,
        onPressed: () {
          unawaited(ref.read(voiceSessionProvider.notifier).toggleSelfMute());
        },
      ),
      SizedBox(width: layout.s1),
      UserPanelControlButton(
        icon: PhosphorIcon(
          isDeafened
              ? PhosphorIconsFill.speakerSlash
              : PhosphorIconsFill.speakerHigh,
        ),
        isActive: isDeafened,
        tooltip: isDeafened
            ? l10n.voiceControlUndeafen
            : l10n.voiceControlDeafen,
        onPressed: () {
          unawaited(ref.read(voiceSessionProvider.notifier).toggleSelfDeafen());
        },
      ),
      SizedBox(width: layout.s1),
      UserPanelControlButton(
        icon: const PhosphorIcon(PhosphorIconsRegular.gear),
        tooltip: l10n.userAreaUserSettings,
        onPressed: onSettingsTap,
      ),
    ];
  }
}

class _DesktopUserArea extends StatelessWidget {
  const _DesktopUserArea({
    required this.showVoiceSection,
    required this.controls,
  });

  final bool showVoiceSection;
  final List<Widget> controls;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final double avatarLead = math.max(
      kUserAreaDesktopInnerInset,
      layout.guildListWidth / 2 -
          kUserAreaDesktopBoxInset -
          kUserAreaDesktopContentHeight / 2,
    );
    return ColoredBox(
      color: colors.backgroundSecondary,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(
          kUserAreaDesktopBoxInset,
          0,
          kUserAreaDesktopBoxInset,
          kUserAreaDesktopBoxInset + 1,
        ),
        child: DecoratedBox(
          position: DecorationPosition.foreground,
          decoration: BoxDecoration(
            borderRadius: layout.radiusLg,
            border: Border.all(color: colors.floatingSurfaceRingColor),
          ),
          child: ClipRRect(
            borderRadius: layout.radiusLg,
            child: ColoredBox(
              color: colors.panelControlBg,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  if (showVoiceSection) ...<Widget>[
                    const VoiceConnectionStatus(),
                    Container(
                      height: 1,
                      color: colors.floatingSurfaceRingColorStrong,
                    ),
                  ],
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: kUserAreaDesktopBoxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        avatarLead,
                        0,
                        kUserAreaDesktopInnerInset,
                        0,
                      ),
                      child: Row(
                        children: <Widget>[
                          const Expanded(child: _DesktopUserIdentityButton()),
                          SizedBox(width: layout.s3 + layout.s3),
                          ...controls,
                        ],
                      ),
                    ),
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

class _DesktopUserIdentityButton extends ConsumerStatefulWidget {
  const _DesktopUserIdentityButton();

  @override
  ConsumerState<_DesktopUserIdentityButton> createState() =>
      _DesktopUserIdentityButtonState();
}

class _DesktopUserIdentityButtonState
    extends ConsumerState<_DesktopUserIdentityButton> {
  bool _open = false;

  Future<void> _openPopout() async {
    setState(() => _open = true);
    try {
      await UserAreaPopout.show(context, ref);
    } finally {
      if (mounted) {
        setState(() => _open = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final (
      String userId,
      String displayName,
      String username,
      String discriminator,
      String? avatarUrl,
      int? avatarColor,
    ) = ref.watch(
      userSettingsViewModelProvider.select(
        (UserSettingsViewState s) => (
          s.userId,
          s.displayName,
          s.username,
          s.discriminator,
          s.avatarUrl,
          s.avatarColor,
        ),
      ),
    );
    final String status =
        ref.watch(userSettingsStatusProvider)?.status ?? 'online';
    final String? customStatus = ref
        .watch(userPresenceProvider(userId))
        .value
        ?.customStatus;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final TextStyle statusStyle = context.textStyles.label.copyWith(
      color: fluxerDesktopSubtleText(colors),
      fontSize: 11,
      fontWeight: FontWeight.w500,
      height: 14 / 11,
    );
    final Widget defaultState = hasVisibleCustomStatus(customStatus)
        ? CustomStatusDisplay(
            stored: customStatus,
            maxLines: 1,
            emojiSize: 14,
            textStyle: statusStyle,
          )
        : Text(
            presenceStatusLabel(status, l10n),
            style: statusStyle,
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          );
    final Widget hoveredState = Text(
      formatUserTag(username, discriminator, uniqueUsernames: true),
      style: statusStyle,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
    );
    final Widget avatar = FluxerAvatar.userPresence(
      fallbackText: displayName,
      userId: userId,
      imageUrl: avatarUrl,
      avatarColor: avatarColor,
      size: kUserAreaDesktopContentHeight,
    );
    final Widget name = Text(
      displayName,
      style: context.textStyles.label.copyWith(
        color: colors.textPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 18 / 14,
      ),
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.ellipsis,
    );
    final BorderRadius hoverRadius = BorderRadius.circular(
      layout.radiusMd.topLeft.x + layout.s1,
    );
    return FluxerTappable(
      onTap: () => unawaited(_openPopout()),
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool rolled = _open || states.contains(WidgetState.hovered);
        return SizedBox(
          height: kUserAreaDesktopContentHeight,
          child: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                left: -layout.s1,
                top: -layout.s1,
                right: -layout.s1,
                bottom: -layout.s1,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: rolled
                        ? fluxerCssColorMix(
                            colors.textPrimary,
                            Colors.transparent,
                            0.03,
                          )
                        : Colors.transparent,
                    borderRadius: hoverRadius,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  avatar,
                  SizedBox(width: layout.s2),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        name,
                        _UserAreaHoverRoll(
                          rolled: rolled,
                          height: 14,
                          defaultChild: defaultState,
                          hoveredChild: hoveredState,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _UserAreaHoverRoll extends StatelessWidget {
  const _UserAreaHoverRoll({
    required this.rolled,
    required this.height,
    required this.defaultChild,
    required this.hoveredChild,
  });

  final bool rolled;
  final double height;
  final Widget defaultChild;
  final Widget hoveredChild;

  @override
  Widget build(BuildContext context) {
    final Duration duration = MediaQuery.disableAnimationsOf(context)
        ? Duration.zero
        : const Duration(milliseconds: 220);
    const double travel = 1.07;
    return SizedBox(
      height: height,
      child: ClipRect(
        child: Stack(
          children: <Widget>[
            AnimatedSlide(
              offset: Offset(0, rolled ? travel : 0),
              duration: duration,
              curve: Curves.ease,
              child: AnimatedOpacity(
                opacity: rolled ? 0 : 1,
                duration: duration,
                curve: Curves.ease,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: defaultChild,
                ),
              ),
            ),
            AnimatedSlide(
              offset: Offset(0, rolled ? 0 : travel),
              duration: duration,
              curve: Curves.ease,
              child: AnimatedOpacity(
                opacity: rolled ? 1 : 0,
                duration: duration,
                curve: Curves.ease,
                child: Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: hoveredChild,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
