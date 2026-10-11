import 'dart:async';

import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/relative_time.dart';

class DmRowTimestamp extends StatefulWidget {
  const DmRowTimestamp({required this.time, required this.style, super.key});

  final DateTime time;
  final TextStyle style;

  @override
  State<DmRowTimestamp> createState() => _DmRowTimestampState();
}

class _DmRowTimestampState extends State<DmRowTimestamp> {
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(
      const Duration(seconds: 30),
      (_) => setState(() {}),
    );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Text(
    relativeTimeShort(
      widget.time,
      FluxerLocalizations.of(context),
      minimumOneMinute: true,
    ),
    style: widget.style,
    maxLines: 1,
  );
}
