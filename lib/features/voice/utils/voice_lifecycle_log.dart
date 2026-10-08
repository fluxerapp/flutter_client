import 'dart:async';

import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/voice/utils/voice_lifecycle_breadcrumb.dart';

void logVoiceLifecycle(
  String event, {
  required int connectGeneration,
  String? channelId,
  String? connectionId,
  String? reason,
  String? connectionState,
}) {
  final StringBuffer buffer = StringBuffer('[Voice][lifecycle] $event');
  buffer.write(' gen=$connectGeneration');
  if (channelId != null) {
    buffer.write(' channelId=$channelId');
  }
  if (connectionId != null) {
    buffer.write(' connectionId=$connectionId');
  }
  if (reason != null) {
    buffer.write(' reason=$reason');
  }
  if (connectionState != null) {
    buffer.write(' connectionState=$connectionState');
  }
  talker.info(buffer.toString());
  unawaited(
    persistVoiceLifecycleBreadcrumb(
      event: event,
      connectGeneration: connectGeneration,
      reason: reason,
    ),
  );
}
