// ignore_for_file: document_ignores, deprecated_member_use, migrate_design_widgets

import 'package:flutter/material.dart' as legacy;
import 'package:flutter/widgets.dart';

class LegacyMaterialScope extends StatelessWidget {
  const LegacyMaterialScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) => legacy.ScaffoldMessenger(child: child);
}
