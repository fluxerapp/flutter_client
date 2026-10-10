import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/experiments/experiments_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/voice_prompts_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

enum VoiceP2pStartChoice { p2p, standard }

int _voiceP2pMaxParticipants(BuildContext context) {
  return ProviderScope.containerOf(
    context,
    listen: false,
  ).read(voiceP2pMaxParticipantsProvider);
}

Future<VoiceP2pStartChoice?> showVoiceP2pStartSheet(
  BuildContext context, {
  required bool allowStandard,
}) {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final int maxParticipants = _voiceP2pMaxParticipants(context);
  return FluxerBottomSheet.show<VoiceP2pStartChoice>(
    context,
    useRootNavigator: true,
    title: l10n.voiceP2pStartTitle,
    builder: (BuildContext sheetContext, VoidCallback close) {
      return Padding(
        padding: settingsSheetScrollPadding(sheetContext),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _VoiceP2pSheetDescription(
              text: l10n.voiceP2pStartDescription(maxParticipants),
            ),
            SizedBox(height: sheetContext.layout.s5),
            FluxerButton.primary(
              onPressed: () =>
                  Navigator.of(sheetContext).pop(VoiceP2pStartChoice.p2p),
              label: l10n.voiceP2pStartConfirm,
            ),
            if (allowStandard) ...<Widget>[
              SizedBox(height: sheetContext.layout.s2),
              FluxerButton.secondary(
                onPressed: () => Navigator.of(
                  sheetContext,
                ).pop(VoiceP2pStartChoice.standard),
                label: l10n.voiceP2pStartStandard,
              ),
            ],
          ],
        ),
      );
    },
  );
}

Future<bool> showVoiceP2pConsentSheet(
  BuildContext context, {
  required bool pinned,
  Duration? timeout,
}) async {
  final FluxerLocalizations l10n = FluxerLocalizations.of(context);
  final int maxParticipants = _voiceP2pMaxParticipants(context);
  Route<Object?>? route;
  final Future<bool?> sheet = FluxerBottomSheet.show<bool>(
    context,
    useRootNavigator: true,
    title: l10n.voiceP2pJoinTitle,
    builder: (BuildContext sheetContext, VoidCallback close) {
      route ??= ModalRoute.of(sheetContext);
      return _VoiceP2pConsentSheetBody(
        description: pinned
            ? l10n.voiceP2pPinnedJoinDescription(maxParticipants)
            : l10n.voiceP2pJoinDescription(maxParticipants),
      );
    },
  );
  final bool? agreed = timeout == null
      ? await sheet
      : await sheet.timeout(
          timeout,
          onTimeout: () {
            final Route<Object?>? open = route;
            if (open != null && open.isActive) {
              open.navigator?.removeRoute(open);
            }
            return null;
          },
        );
  return agreed ?? false;
}

Future<bool> confirmVoiceP2pJoin(
  BuildContext context, {
  required bool pinned,
}) async {
  final bool alwaysAgree = ProviderScope.containerOf(
    context,
    listen: false,
  ).read(voicePromptsPreferencesProvider).skipP2pJoinConfirm;
  if (alwaysAgree) {
    return true;
  }
  return showVoiceP2pConsentSheet(context, pinned: pinned);
}

class _VoiceP2pConsentSheetBody extends ConsumerStatefulWidget {
  const _VoiceP2pConsentSheetBody({required this.description});

  final String description;

  @override
  ConsumerState<_VoiceP2pConsentSheetBody> createState() =>
      _VoiceP2pConsentSheetBodyState();
}

class _VoiceP2pConsentSheetBodyState
    extends ConsumerState<_VoiceP2pConsentSheetBody> {
  bool _alwaysAgree = false;

  void _agree() {
    if (_alwaysAgree) {
      unawaited(
        ref
            .read(voicePromptsPreferencesProvider.notifier)
            .setSkipP2pJoinConfirm(value: true),
      );
    }
    Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Padding(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _VoiceP2pSheetDescription(text: widget.description),
          SizedBox(height: context.layout.s4),
          FluxerCheckbox(
            value: _alwaysAgree,
            onChanged: (bool? value) =>
                setState(() => _alwaysAgree = value ?? false),
            label: l10n.voiceP2pAlwaysAgreeLabel,
          ),
          SizedBox(height: context.layout.s5),
          FluxerButton.primary(
            onPressed: _agree,
            label: l10n.voiceP2pJoinConfirm,
          ),
        ],
      ),
    );
  }
}

class _VoiceP2pSheetDescription extends StatelessWidget {
  const _VoiceP2pSheetDescription({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: context.textStyles.bodySmall.copyWith(
        color: context.colors.textSecondary,
        height: 1.4,
      ),
    );
  }
}
