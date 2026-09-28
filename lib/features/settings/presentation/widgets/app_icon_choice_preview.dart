import 'package:fluxer_app/features/settings/domain/app_icon_choice.dart';
import 'package:fluxer_app/material_ui.dart';

class AppIconChoicePreview extends StatelessWidget {
  const AppIconChoicePreview({required this.choice, super.key});

  static const Size size = Size(48, 48);

  final AppIconChoice choice;

  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        child: Image.asset(
          choice.previewAssetPath,
          width: size.width,
          height: size.height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
