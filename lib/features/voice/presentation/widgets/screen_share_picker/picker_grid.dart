import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_card.dart';
import 'package:fluxer_app/features/voice/presentation/widgets/screen_share_picker/picker_style.dart';
import 'package:fluxer_app/material_ui.dart';

class VoiceScreenSharePickerGrid extends StatelessWidget {
  const VoiceScreenSharePickerGrid({
    required this.sources,
    required this.onSelected,
    this.pending = false,
    super.key,
  });

  static const int _kColumns = 2;
  static const double _kPreviewAspectRatio = 16 / 9;

  final List<ScreenShareSource> sources;
  final ValueChanged<ScreenShareSource> onSelected;
  final bool pending;

  @override
  Widget build(BuildContext context) {
    final ScreenSharePickerMetrics metrics = ScreenSharePickerMetrics.of(
      MediaQuery.sizeOf(context),
    );
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double cardWidth =
            (constraints.maxWidth -
                metrics.padding * 2 -
                metrics.gap * (_kColumns - 1)) /
            _kColumns;
        return GridView.builder(
          padding: EdgeInsets.all(metrics.padding),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _kColumns,
            mainAxisSpacing: metrics.gap,
            crossAxisSpacing: metrics.gap,
            mainAxisExtent:
                cardWidth / _kPreviewAspectRatio +
                kScreenSharePickerCardBodyHeight,
          ),
          itemCount: sources.length,
          itemBuilder: (BuildContext context, int index) {
            final ScreenShareSource source = sources[index];
            return VoiceScreenSharePickerCard(
              key: ValueKey<String>(source.id),
              source: source,
              enabled: !pending,
              onSelected: () => onSelected(source),
            );
          },
        );
      },
    );
  }
}
