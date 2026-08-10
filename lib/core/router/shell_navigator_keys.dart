import 'package:flutter/material.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final homeBranchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final notificationsBranchNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'notifications',
);
final youBranchNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'you');
final shellTabOverlayNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'shellTabOverlay',
);

final List<GlobalKey<NavigatorState>> shellBranchNavigatorKeys =
    <GlobalKey<NavigatorState>>[
      homeBranchNavigatorKey,
      notificationsBranchNavigatorKey,
      youBranchNavigatorKey,
    ];
