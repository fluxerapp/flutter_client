import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/widgets/custom_status_display.dart';

class UserProfileCustomStatus extends StatelessWidget {
  const UserProfileCustomStatus({required this.text, super.key});

  final String? text;

  @override
  Widget build(BuildContext context) {
    return CustomStatusDisplay(stored: text);
  }
}
