import 'dart:ui' show PlatformDispatcher;

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'screen_reader_active_provider.g.dart';

@Riverpod(keepAlive: true)
class ScreenReaderActive extends _$ScreenReaderActive {
  @override
  bool build() =>
      PlatformDispatcher.instance.accessibilityFeatures.accessibleNavigation;

  void set({required bool value}) {
    if (state != value) {
      state = value;
    }
  }
}

class ScreenReaderActiveSync extends ConsumerStatefulWidget {
  const ScreenReaderActiveSync({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<ScreenReaderActiveSync> createState() =>
      _ScreenReaderActiveSyncState();
}

class _ScreenReaderActiveSyncState
    extends ConsumerState<ScreenReaderActiveSync> {
  bool? _last;

  @override
  Widget build(BuildContext context) {
    final bool active = MediaQuery.accessibleNavigationOf(context);
    if (active != _last) {
      _last = active;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          ref.read(screenReaderActiveProvider.notifier).set(value: active);
        }
      });
    }
    return widget.child;
  }
}
