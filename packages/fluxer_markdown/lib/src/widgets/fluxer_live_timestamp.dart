import 'dart:async';

import 'package:material_ui/material_ui.dart';

/// Shared 1s clock for relative markdown timestamps.
///
/// One timer for every live timestamp on screen. Listeners rebuild themselves
/// only; the surrounding markdown tree is not marked dirty.
class FluxerRelativeTimeTick extends ChangeNotifier {
  FluxerRelativeTimeTick._();

  static final FluxerRelativeTimeTick instance = FluxerRelativeTimeTick._();

  Timer? _timer;
  int _refCount = 0;

  @visibleForTesting
  bool get hasTimer => _timer != null;

  void retain() {
    _refCount++;
    _timer ??= Timer.periodic(const Duration(seconds: 1), (_) {
      notifyListeners();
    });
  }

  void release() {
    if (_refCount == 0) {
      return;
    }
    _refCount--;
    if (_refCount > 0) {
      return;
    }
    _timer?.cancel();
    _timer = null;
  }
}

class FluxerLiveTimestamp extends StatefulWidget {
  const FluxerLiveTimestamp({
    required this.format,
    required this.style,
    super.key,
  });

  final String Function() format;
  final TextStyle style;

  @override
  State<FluxerLiveTimestamp> createState() => _FluxerLiveTimestampState();
}

class _FluxerLiveTimestampState extends State<FluxerLiveTimestamp> {
  late String _text;

  @override
  void initState() {
    super.initState();
    _text = widget.format();
    FluxerRelativeTimeTick.instance
      ..retain()
      ..addListener(_onTick);
  }

  @override
  void didUpdateWidget(covariant FluxerLiveTimestamp oldWidget) {
    super.didUpdateWidget(oldWidget);
    final String next = widget.format();
    if (next != _text) {
      _text = next;
    }
  }

  @override
  void dispose() {
    FluxerRelativeTimeTick.instance
      ..removeListener(_onTick)
      ..release();
    super.dispose();
  }

  void _onTick() {
    if (!mounted) {
      return;
    }
    final String next = widget.format();
    if (next == _text) {
      return;
    }
    setState(() {
      _text = next;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: widget.style,
      maxLines: 1,
      softWrap: false,
      overflow: TextOverflow.clip,
    );
  }
}
