import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_controller.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_provider.dart';
import 'package:fluxer_app/core/desktop/permissions/mac_permissions_state.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_picker.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_sources_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/desktop_hud/hud_menu.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_footer.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_permission_prompt.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_sources.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_style.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_tabs.dart';
import 'package:fluxer_app/features/voice/providers/screen_share_sources_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_session_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

Future<void> showVoiceScreenSharePicker(
  BuildContext context, {
  ScreenSharePickerMode mode = ScreenSharePickerMode.start,
  ScreenSharePickerTab initialTab = ScreenSharePickerTab.applications,
}) {
  return pushFluxerDesktopRoute<void>(
    context,
    navigator: Navigator.of(context, rootNavigator: true),
    surface: FluxerDesktopSurface.modal,
    barrierTint: kScreenSharePickerBarrier,
    builder: (BuildContext routeContext) =>
        VoiceScreenSharePickerModal(mode: mode, initialTab: initialTab),
  );
}

class VoiceScreenSharePickerModal extends ConsumerStatefulWidget {
  const VoiceScreenSharePickerModal({
    required this.mode,
    required this.initialTab,
    super.key,
  });

  final ScreenSharePickerMode mode;
  final ScreenSharePickerTab initialTab;

  @override
  ConsumerState<VoiceScreenSharePickerModal> createState() =>
      _VoiceScreenSharePickerModalState();
}

class _VoiceScreenSharePickerModalState
    extends ConsumerState<VoiceScreenSharePickerModal> {
  late ScreenSharePickerTab _tab = widget.initialTab;
  bool _checkedAccess = !macPermissions.isSupported;
  bool _pending = false;

  @override
  void initState() {
    super.initState();
    if (!_checkedAccess) {
      unawaited(_checkAccess());
    }
  }

  Future<void> _checkAccess() async {
    await macPermissions.ensure(MacPermissionKind.screen, liveProbe: true);
    if (mounted) {
      setState(() => _checkedAccess = true);
    }
  }

  ScreenSharePickerAccess _access() {
    if (!macPermissions.isSupported) {
      return ScreenSharePickerAccess.granted;
    }
    if (!_checkedAccess) {
      return ScreenSharePickerAccess.checking;
    }
    final MacPermissionsState permissions = ref.watch(
      macPermissionStatusesProvider,
    );
    if (permissions.isGranted(MacPermissionKind.screen)) {
      return ScreenSharePickerAccess.granted;
    }
    return permissions.screenStillBlockedAfterReturn
        ? ScreenSharePickerAccess.relaunchRequired
        : ScreenSharePickerAccess.blocked;
  }

  void _close() {
    if (mounted) {
      Navigator.of(context).maybePop();
    }
  }

  void _openSettings() {
    if (mounted) {
      unawaited(openVoiceHudAudioVideoSettings(context, ref));
    }
  }

  Future<void> _select(ScreenShareSource source) async {
    if (_pending) {
      return;
    }
    setState(() => _pending = true);
    final String notificationText = FluxerLocalizations.of(
      context,
    ).voiceScreenShareNotificationText;
    await ref
        .read(voiceSessionProvider.notifier)
        .changeSelfStreamSource(
          screenShareNotificationText: notificationText,
          source: source,
        );
    _close();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final Size window = MediaQuery.sizeOf(context);
    final ScreenSharePickerMetrics metrics = ScreenSharePickerMetrics.of(
      window,
    );
    final ScreenSharePickerAccess access = _access();
    final ScreenShareSourcesState? sources =
        access == ScreenSharePickerAccess.granted
        ? ref.watch(screenShareSourcesProvider)
        : null;
    final bool loading =
        sources != null &&
        sources.status == ScreenShareSourcesStatus.loading &&
        sources.sources.isEmpty;
    final BorderRadius radius = BorderRadius.circular(kScreenSharePickerRadius);
    return Center(
      child: SizedBox.fromSize(
        size: metrics.frameSize(window),
        child: Semantics(
          scopesRoute: true,
          namesRoute: true,
          label: widget.mode == ScreenSharePickerMode.change
              ? l10n.voiceScreenSharePickerChangeTitle
              : l10n.voiceScreenSharePickerTitle,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.colors.backgroundSecondary,
              borderRadius: radius,
              border: Border.all(
                color: context.colors.backgroundHeaderSecondary,
              ),
            ),
            child: ClipRRect(
              borderRadius: radius,
              child: Material(
                type: MaterialType.transparency,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        metrics.padding,
                        metrics.padding,
                        metrics.padding,
                        0,
                      ),
                      child: VoiceScreenSharePickerTabs(
                        selected: _tab,
                        onChanged: (ScreenSharePickerTab tab) =>
                            setState(() => _tab = tab),
                      ),
                    ),
                    Expanded(
                      child: sources == null
                          ? VoiceScreenSharePickerPermissionPrompt(
                              access: access,
                            )
                          : VoiceScreenSharePickerSources(
                              tab: _tab,
                              state: sources,
                              pending: _pending,
                              onSelected: (ScreenShareSource source) =>
                                  unawaited(_select(source)),
                              onRetry: () => unawaited(
                                ref
                                    .read(screenShareSourcesProvider.notifier)
                                    .reload(),
                              ),
                            ),
                    ),
                    VoiceScreenSharePickerFooter(
                      loading: loading,
                      onCancel: _close,
                      onOpenSettings: _openSettings,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
