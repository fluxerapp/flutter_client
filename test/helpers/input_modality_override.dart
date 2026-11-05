import 'package:fluxer_app/shared/providers/input_modality_provider.dart';
import 'package:riverpod/src/framework.dart' show Override;

class _FixedInputModality extends InputModalityNotifier {
  _FixedInputModality({required this.touch});

  final bool touch;

  @override
  bool build() => touch;
}

Override inputModalityOverride({required bool touch}) =>
    inputModalityProvider.overrideWith(() => _FixedInputModality(touch: touch));
