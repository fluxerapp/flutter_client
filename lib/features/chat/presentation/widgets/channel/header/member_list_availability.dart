import 'package:fluxer_app/material_ui.dart';

class ChannelMemberListAvailability extends InheritedWidget {
  const ChannelMemberListAvailability({
    required this.available,
    required super.child,
    super.key,
  });

  final bool available;

  static bool of(BuildContext context) =>
      context
          .dependOnInheritedWidgetOfExactType<ChannelMemberListAvailability>()
          ?.available ??
      true;

  @override
  bool updateShouldNotify(ChannelMemberListAvailability oldWidget) =>
      oldWidget.available != available;
}
