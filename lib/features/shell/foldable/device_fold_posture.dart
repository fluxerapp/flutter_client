import 'dart:ui';

import 'package:fluxer_app/material_ui.dart';
import 'package:foldable/foldable.dart';

enum FoldPostureKind { flat, book, tabletop }

@immutable
class DeviceFoldPosture {
  const DeviceFoldPosture({
    required this.kind,
    this.hingeBounds,
    this.cameraOcclusion,
    this.splitSidebarAtHinge = false,
  });

  const DeviceFoldPosture.flat() : this(kind: FoldPostureKind.flat);

  final FoldPostureKind kind;
  final Rect? hingeBounds;
  final Rect? cameraOcclusion;
  final bool splitSidebarAtHinge;

  bool get avoidsFloatingSurfaces =>
      hingeBounds != null && !hingeBounds!.isEmpty;

  bool get isTabletop => kind == FoldPostureKind.tabletop;
}

DeviceFoldPosture deviceFoldPostureOf(BuildContext context) {
  final List<DisplayFeature> features = MediaQuery.displayFeaturesOf(context);
  Rect? androidHinge;
  for (final DisplayFeature feature in features) {
    if (feature.type == DisplayFeatureType.hinge &&
        feature.state == DisplayFeatureState.postureHalfOpened) {
      androidHinge = feature.bounds;
      break;
    }
    if (feature.type == DisplayFeatureType.fold &&
        feature.state == DisplayFeatureState.postureHalfOpened) {
      androidHinge = feature.bounds;
      break;
    }
  }
  if (androidHinge != null && !androidHinge.isEmpty) {
    return _postureFromHingeRect(androidHinge, splitSidebarAtHinge: true);
  }

  final FoldableData duo = DuoMediaQuery.of(context);
  if (duo.isPartiallyOpen) {
    for (final ReservedRegion division in duo.activeDivisions) {
      if (!division.bounds.isEmpty) {
        return _postureFromHingeRect(
          division.bounds,
          splitSidebarAtHinge: true,
        );
      }
    }
    return const DeviceFoldPosture(kind: FoldPostureKind.book);
  }

  Rect? camera;
  for (final ReservedRegion region in duo.regions) {
    if (region.isActive && region.kind == ReservedRegionKind.occlusion) {
      camera = region.bounds;
      break;
    }
  }
  if (camera != null) {
    return DeviceFoldPosture(
      kind: FoldPostureKind.flat,
      cameraOcclusion: camera,
    );
  }

  return const DeviceFoldPosture.flat();
}

DeviceFoldPosture _postureFromHingeRect(
  Rect hinge, {
  required bool splitSidebarAtHinge,
}) {
  final bool horizontalHinge = hinge.width > hinge.height;
  return DeviceFoldPosture(
    kind: horizontalHinge ? FoldPostureKind.tabletop : FoldPostureKind.book,
    hingeBounds: hinge,
    splitSidebarAtHinge: splitSidebarAtHinge,
  );
}
