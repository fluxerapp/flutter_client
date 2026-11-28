import 'package:fluxer_app/material_ui.dart';

@immutable
class FluxerSectionOutlineEntry {
  const FluxerSectionOutlineEntry({required this.id, required this.title});

  final String id;
  final String title;

  @override
  bool operator ==(Object other) =>
      other is FluxerSectionOutlineEntry &&
      other.id == id &&
      other.title == title;

  @override
  int get hashCode => Object.hash(id, title);
}
