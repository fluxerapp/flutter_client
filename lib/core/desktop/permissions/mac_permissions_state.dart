import 'package:flutter/foundation.dart';
import 'package:fluxer_macos/fluxer_macos.dart';

const Set<MacPermissionKind> kMacPermissionKindsWithQuitPrompt =
    <MacPermissionKind>{
      MacPermissionKind.screen,
      MacPermissionKind.inputMonitoring,
    };

@immutable
class MacPermissionsState {
  const MacPermissionsState({
    this.statuses = const <MacPermissionKind, MacPermissionStatus>{},
    this.changeRequested = const <MacPermissionKind>{},
    this.screenStillBlockedAfterReturn = false,
  });

  final Map<MacPermissionKind, MacPermissionStatus> statuses;
  final Set<MacPermissionKind> changeRequested;
  final bool screenStillBlockedAfterReturn;

  MacPermissionStatus statusOf(MacPermissionKind kind) =>
      statuses[kind] ?? MacPermissionStatus.notDetermined;

  bool isGranted(MacPermissionKind kind) =>
      statusOf(kind) == MacPermissionStatus.granted;

  bool get allGranted => MacPermissionKind.values.every(isGranted);

  List<MacPermissionKind> get settledKinds => MacPermissionKind.values
      .where(
        (MacPermissionKind kind) =>
            isGranted(kind) ||
            statusOf(kind) == MacPermissionStatus.unsupported,
      )
      .toList(growable: false);

  bool showsQuitPromptAdvice(MacPermissionKind kind) =>
      kMacPermissionKindsWithQuitPrompt.contains(kind) &&
      changeRequested.contains(kind) &&
      !isGranted(kind);

  bool get anyQuitPromptAdvice =>
      MacPermissionKind.values.any(showsQuitPromptAdvice);

  MacPermissionsState withStatus(
    MacPermissionKind kind,
    MacPermissionStatus status,
  ) {
    final bool granted = status == MacPermissionStatus.granted;
    return copyWith(
      statuses: <MacPermissionKind, MacPermissionStatus>{
        ...statuses,
        kind: status,
      },
      changeRequested: granted
          ? (<MacPermissionKind>{...changeRequested}..remove(kind))
          : changeRequested,
      screenStillBlockedAfterReturn:
          !(granted && kind == MacPermissionKind.screen) &&
          screenStillBlockedAfterReturn,
    );
  }

  MacPermissionsState copyWith({
    Map<MacPermissionKind, MacPermissionStatus>? statuses,
    Set<MacPermissionKind>? changeRequested,
    bool? screenStillBlockedAfterReturn,
  }) {
    return MacPermissionsState(
      statuses: statuses ?? this.statuses,
      changeRequested: changeRequested ?? this.changeRequested,
      screenStillBlockedAfterReturn:
          screenStillBlockedAfterReturn ?? this.screenStillBlockedAfterReturn,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is MacPermissionsState &&
      mapEquals(other.statuses, statuses) &&
      setEquals(other.changeRequested, changeRequested) &&
      other.screenStillBlockedAfterReturn == screenStillBlockedAfterReturn;

  @override
  int get hashCode => Object.hash(
    Object.hashAllUnordered(statuses.keys),
    Object.hashAllUnordered(statuses.values),
    Object.hashAllUnordered(changeRequested),
    screenStillBlockedAfterReturn,
  );
}
