import 'package:flutter/material.dart';
import 'package:talker/talker.dart';
import 'package:talker_flutter/talker_flutter.dart' as talker_ui;

final talker = Talker(settings: TalkerSettings());

/// Pushes the Talker log viewer
Future<void> pushTalkerLogScreen(
  BuildContext context, {
  String title = 'App Logs',
}) {
  return Navigator.of(context, rootNavigator: true).push<void>(
    MaterialPageRoute<void>(
      builder: (BuildContext routeContext) =>
          talker_ui.TalkerScreen(talker: talker, appBarTitle: title),
    ),
  );
}
