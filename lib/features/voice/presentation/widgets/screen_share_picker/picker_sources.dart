import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_picker.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_sources_state.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_grid.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_state.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/icons/phosphor.dart';

class VoiceScreenSharePickerSources extends StatelessWidget {
  const VoiceScreenSharePickerSources({
    required this.tab,
    required this.state,
    required this.pending,
    required this.onSelected,
    required this.onRetry,
    super.key,
  });

  final ScreenSharePickerTab tab;
  final ScreenShareSourcesState state;
  final bool pending;
  final ValueChanged<ScreenShareSource> onSelected;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final List<ScreenShareSource> sources = state.of(tab.kind);
    if (state.status == ScreenShareSourcesStatus.failed) {
      return VoiceScreenSharePickerState(
        body: l10n.voiceScreenSharePickerLoadFailed,
        actions: <Widget>[
          FluxerButton.secondary(
            label: l10n.voiceConnectionRetry,
            fitContent: true,
            onPressed: onRetry,
          ),
        ],
      );
    }
    if (sources.isNotEmpty) {
      return VoiceScreenSharePickerGrid(
        sources: sources,
        pending: pending,
        onSelected: onSelected,
      );
    }
    if (state.status == ScreenShareSourcesStatus.loading) {
      return const VoiceScreenSharePickerState(leading: FluxerLoadingSpinner());
    }
    return switch (tab) {
      ScreenSharePickerTab.applications => VoiceScreenSharePickerState(
        icon: PhosphorIconsFill.appWindow,
        heading: l10n.voiceScreenSharePickerNoWindowsTitle,
        body: l10n.voiceScreenSharePickerNoWindowsBody,
      ),
      ScreenSharePickerTab.entireScreen => VoiceScreenSharePickerState(
        icon: PhosphorIconsFill.monitor,
        heading: l10n.voiceScreenSharePickerNoDisplaysTitle,
        body: l10n.voiceScreenSharePickerNoDisplaysBody,
      ),
    };
  }
}
