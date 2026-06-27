import 'package:flutter/material.dart';

bool chatRouteShouldSync(BuildContext context) {
  final ModalRoute<dynamic>? route = ModalRoute.of(context);
  return route == null || route.isCurrent;
}
