import 'package:flutter/scheduler.dart';
import 'package:fluxer_markdown/src/utils/ansi_blink_scheduler.dart';
import 'package:fluxer_markdown/src/utils/ansi_palette.dart';
import 'package:fluxer_markdown/src/utils/ansi_text_parser.dart';
import 'package:fluxer_markdown/src/utils/bounded_text.dart';
import 'package:material_ui/material_ui.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AnsiCodeText extends StatefulWidget {
  const AnsiCodeText({
    required this.code,
    required this.baseStyle,
    required this.palette,
    super.key,
  });

  final String code;
  final TextStyle baseStyle;
  final AnsiPalette palette;

  @override
  State<AnsiCodeText> createState() => _AnsiCodeTextState();
}

class _AnsiCodeTextState extends State<AnsiCodeText>
    with WidgetsBindingObserver {
  late final Listenable _blinkRepaintListenable;
  late List<AnsiTextRun> _runs;
  var _hasBlink = false;
  var _isOnScreen = false;
  var _lifecycleObserving = false;

  final ValueNotifier<int> _contentGeneration = ValueNotifier<int>(0);
  final ValueNotifier<bool> _animateBlink = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _blinkRepaintListenable = Listenable.merge(<Listenable>[
      _animateBlink,
      AnsiBlinkScheduler.instance.visible,
    ]);
    _syncRuns();
    if (_hasBlink) {
      _startLifecycleObserver();
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_hasBlink) {
      _updateBlinkSubscription();
    }
  }

  @override
  void didUpdateWidget(covariant AnsiCodeText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.code != widget.code ||
        oldWidget.baseStyle != widget.baseStyle ||
        oldWidget.palette != widget.palette) {
      _syncRuns();
      if (_hasBlink) {
        _updateBlinkSubscription();
      }
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!mounted || !_hasBlink) {
      return;
    }
    _updateBlinkSubscription();
  }

  @override
  void dispose() {
    _stopLifecycleObserver();
    _setAnimating(false);
    _contentGeneration.dispose();
    _animateBlink.dispose();
    super.dispose();
  }

  void _startLifecycleObserver() {
    if (_lifecycleObserving) {
      return;
    }
    WidgetsBinding.instance.addObserver(this);
    _lifecycleObserving = true;
  }

  void _stopLifecycleObserver() {
    if (!_lifecycleObserving) {
      return;
    }
    WidgetsBinding.instance.removeObserver(this);
    _lifecycleObserving = false;
  }

  void _syncRuns() {
    _runs = parseAnsiTextRuns(
      widget.code,
      widget.baseStyle,
      palette: widget.palette,
    );
    final bool hasBlink = _runs.any((AnsiTextRun run) => run.blink);
    if (hasBlink != _hasBlink) {
      if (_hasBlink) {
        _setAnimating(false);
        _stopLifecycleObserver();
        _isOnScreen = false;
      }
      _hasBlink = hasBlink;
      if (_hasBlink) {
        _startLifecycleObserver();
      }
    }
    _contentGeneration.value++;
  }

  bool _shouldAnimateBlink() {
    if (!_hasBlink || !_isOnScreen) {
      return false;
    }
    if (!TickerMode.valuesOf(context).enabled) {
      return false;
    }
    if (MediaQuery.disableAnimationsOf(context)) {
      return false;
    }
    final AppLifecycleState? lifecycle =
        SchedulerBinding.instance.lifecycleState;
    if (lifecycle != null && lifecycle != AppLifecycleState.resumed) {
      return false;
    }
    return true;
  }

  void _updateBlinkSubscription() {
    _setAnimating(_shouldAnimateBlink());
  }

  void _setAnimating(bool animating) {
    if (animating == _animateBlink.value) {
      return;
    }
    if (_animateBlink.value) {
      AnsiBlinkScheduler.instance.unsubscribe();
    }
    _animateBlink.value = animating;
    if (animating) {
      AnsiBlinkScheduler.instance.subscribe();
    }
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (!mounted) {
      return;
    }
    final bool onScreen = info.visibleFraction > 0;
    if (onScreen == _isOnScreen) {
      return;
    }
    _isOnScreen = onScreen;
    _updateBlinkSubscription();
  }

  Widget _richText({required bool blinkVisible}) {
    return buildFluxerBoundedRichText(
      text: TextSpan(
        style: widget.baseStyle,
        children: ansiRunsToInlineSpans(_runs, blinkVisible: blinkVisible),
      ),
      baseStyle: widget.baseStyle,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _contentGeneration,
      builder: (BuildContext context, Widget? child) {
        if (!_hasBlink) {
          return _richText(blinkVisible: true);
        }
        return VisibilityDetector(
          key: ObjectKey(this),
          onVisibilityChanged: _onVisibilityChanged,
          child: ListenableBuilder(
            listenable: _blinkRepaintListenable,
            builder: (BuildContext context, Widget? child) {
              final bool blinkVisible =
                  !_animateBlink.value ||
                  AnsiBlinkScheduler.instance.visible.value;
              return _richText(blinkVisible: blinkVisible);
            },
          ),
        );
      },
    );
  }
}
