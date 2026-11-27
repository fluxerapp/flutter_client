import 'package:flutter/foundation.dart';

enum ScreenShareSourceKind { window, screen }

@immutable
class ScreenShareSource {
  const ScreenShareSource({
    required this.id,
    required this.name,
    required this.kind,
    this.thumbnail,
  });

  final String id;
  final String name;
  final ScreenShareSourceKind kind;
  final Uint8List? thumbnail;

  ScreenShareSource copyWith({String? name, Uint8List? thumbnail}) {
    return ScreenShareSource(
      id: id,
      name: name ?? this.name,
      kind: kind,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ScreenShareSource &&
      other.id == id &&
      other.name == name &&
      other.kind == kind &&
      identical(other.thumbnail, thumbnail);

  @override
  int get hashCode => Object.hash(id, name, kind, identityHashCode(thumbnail));
}
