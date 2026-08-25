import 'package:fluxer_app/material_ui.dart';

bool chatRouteShouldSync(BuildContext context) {
  final ModalRoute<dynamic>? route = ModalRoute.of(context);
  return route == null || route.isCurrent;
}
