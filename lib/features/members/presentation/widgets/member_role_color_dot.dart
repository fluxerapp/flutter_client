import 'package:fluxer_app/shared/utils/role_color_utils.dart';
import 'package:material_ui/material_ui.dart';

class MemberRoleColorDot extends StatelessWidget {
  const MemberRoleColorDot({required this.color, this.size = 16, super.key});

  final int color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(guildRoleColorInt(color)),
      ),
    );
  }
}
