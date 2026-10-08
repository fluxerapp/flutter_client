import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_textarea.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_bottom_input_slot.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer/bottom_input_slot_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/threads/presentation/thread_composer_gate.dart';
import 'package:fluxer_app/material_ui.dart';

const int _kResumeInsetSyncFrames = 4;

class ChatComposerColumn extends ConsumerStatefulWidget {
  const ChatComposerColumn({
    required this.autocompletePanelHost,
    required this.autocompletePanelScrollController,
    required this.showInlineEmojiPicker,
    super.key,
  });

  final ComposerAutocompletePanelHost autocompletePanelHost;
  final ScrollController autocompletePanelScrollController;
  final bool showInlineEmojiPicker;

  @override
  ConsumerState<ChatComposerColumn> createState() => _ChatComposerColumnState();
}

class _ChatComposerColumnState extends ConsumerState<ChatComposerColumn>
    with WidgetsBindingObserver {
  bool _syncScheduled = false;
  int _resumeInsetSyncFramesRemaining = 0;
  int _metricsSyncGeneration = 0;
  double? _lastSyncedViewInsetsBottom;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _scheduleKeyboardMetricsSync();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _metricsSyncGeneration++;
    _resumeInsetSyncFramesRemaining = 0;
    _syncScheduled = false;
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _scheduleKeyboardMetricsSync();
      _scheduleResumeInsetSyncRetries();
    }
  }

  @override
  void didChangeMetrics() {
    _scheduleKeyboardMetricsSync();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _scheduleKeyboardMetricsSync();
  }

  void _scheduleKeyboardMetricsSync() {
    if (_syncScheduled) {
      return;
    }
    _syncScheduled = true;
    final int generation = _metricsSyncGeneration;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncScheduled = false;
      if (!mounted || generation != _metricsSyncGeneration) {
        return;
      }
      _syncKeyboardMetrics(generation);
    });
  }

  void _scheduleResumeInsetSyncRetries() {
    _resumeInsetSyncFramesRemaining = _kResumeInsetSyncFrames;
    final int generation = _metricsSyncGeneration;
    WidgetsBinding.instance.addPostFrameCallback((Duration timestamp) {
      _resumeInsetSyncTick(timestamp, generation);
    });
  }

  void _resumeInsetSyncTick(Duration timestamp, int generation) {
    if (!mounted ||
        generation != _metricsSyncGeneration ||
        _resumeInsetSyncFramesRemaining <= 0) {
      return;
    }
    _resumeInsetSyncFramesRemaining--;
    _syncKeyboardMetrics(generation);
    if (_resumeInsetSyncFramesRemaining > 0) {
      WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
        _resumeInsetSyncTick(duration, generation);
      });
    }
  }

  void _syncKeyboardMetrics(int generation) {
    if (!mounted || generation != _metricsSyncGeneration || !context.mounted) {
      return;
    }
    final MediaQueryData? mediaQuery = MediaQuery.maybeOf(context);
    if (mediaQuery == null) {
      return;
    }
    if (layoutModeOfSize(mediaQuery.size) != LayoutMode.mobile) {
      return;
    }
    final view = View.of(context);
    ref.read(mobileKeyboardMetricsProvider.notifier)
      ..updateLayout(
        screenHeight: mediaQuery.size.height,
        isPortrait: mediaQuery.size.height >= mediaQuery.size.width,
        isIos: !kIsWeb && Platform.isIOS,
      )
      ..syncViewInsets(
        resolvedKeyboardInsetBottomFrom(
          mediaQueryInsetBottom: mediaQuery.viewInsets.bottom,
          physicalViewInsetBottom: view.viewInsets.bottom,
          devicePixelRatio: mediaQuery.devicePixelRatio,
        ),
        safeAreaBottom: mediaQuery.padding.bottom,
      );
  }

  @override
  Widget build(BuildContext context) {
    if (!isMobileLayout(context)) {
      _lastSyncedViewInsetsBottom = null;
    } else {
      final double viewInsetsBottom = resolvedKeyboardInsetBottom(context);
      if (viewInsetsBottom != _lastSyncedViewInsetsBottom) {
        _lastSyncedViewInsetsBottom = viewInsetsBottom;
        _scheduleKeyboardMetricsSync();
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RepaintBoundary(
          child: ThreadComposerGate(
            child: ChannelTextarea(
              autocompletePanelHost: widget.autocompletePanelHost,
              autocompletePanelScrollController:
                  widget.autocompletePanelScrollController,
            ),
          ),
        ),
        if (isMobileLayout(context)) const BottomInputSpacer(),
      ],
    );
  }
}
