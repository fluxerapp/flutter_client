import 'dart:io';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/channel_textarea.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_autocomplete_field.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/chat_bottom_input_slot.dart';
import 'package:fluxer_app/features/chat/providers/pickers/mobile_keyboard_metrics_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _syncScheduled = false;
      if (!mounted) {
        return;
      }
      _syncKeyboardMetrics();
    });
  }

  void _scheduleResumeInsetSyncRetries() {
    _resumeInsetSyncFramesRemaining = _kResumeInsetSyncFrames;
    WidgetsBinding.instance.addPostFrameCallback(_resumeInsetSyncTick);
  }

  void _resumeInsetSyncTick(Duration _) {
    if (!mounted || _resumeInsetSyncFramesRemaining <= 0) {
      return;
    }
    _resumeInsetSyncFramesRemaining--;
    _syncKeyboardMetrics();
    if (_resumeInsetSyncFramesRemaining > 0) {
      WidgetsBinding.instance.addPostFrameCallback(_resumeInsetSyncTick);
    }
  }

  double _resolvedViewInsetsBottom(BuildContext context) {
    final double mediaQueryInset = MediaQuery.viewInsetsOf(context).bottom;
    final ui.FlutterView? flutterView =
        ui.PlatformDispatcher.instance.implicitView;
    if (flutterView == null) {
      return mediaQueryInset;
    }
    final double viewInset =
        flutterView.viewInsets.bottom / flutterView.devicePixelRatio;
    return math.max(mediaQueryInset, viewInset);
  }

  void _syncKeyboardMetrics() {
    if (!isMobileLayout(context)) {
      return;
    }
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    ref.read(mobileKeyboardMetricsProvider.notifier)
      ..updateLayout(
        screenHeight: mediaQuery.size.height,
        isPortrait: mediaQuery.size.height >= mediaQuery.size.width,
        isIos: !kIsWeb && Platform.isIOS,
      )
      ..syncViewInsets(
        _resolvedViewInsetsBottom(context),
        safeAreaBottom: mediaQuery.padding.bottom,
      );
  }

  @override
  Widget build(BuildContext context) {
    if (!isMobileLayout(context)) {
      _lastSyncedViewInsetsBottom = null;
    } else {
      final double viewInsetsBottom = _resolvedViewInsetsBottom(context);
      if (viewInsetsBottom != _lastSyncedViewInsetsBottom) {
        _lastSyncedViewInsetsBottom = viewInsetsBottom;
        _scheduleKeyboardMetricsSync();
      }
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        RepaintBoundary(
          child: ChannelTextarea(
            autocompletePanelHost: widget.autocompletePanelHost,
            autocompletePanelScrollController:
                widget.autocompletePanelScrollController,
          ),
        ),
        if (isMobileLayout(context)) const BottomInputSpacer(),
      ],
    );
  }
}
