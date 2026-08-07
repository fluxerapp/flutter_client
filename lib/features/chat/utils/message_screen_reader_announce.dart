import 'dart:async';
import 'dart:ui' show FlutterView, PlatformDispatcher, TextDirection;

import 'package:flutter/semantics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/utils/message_accessibility_summary.dart';
import 'package:fluxer_app/features/settings/providers/appearance_preferences_provider.dart';
import 'package:fluxer_app/l10n/app_locale_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:intl/intl.dart' show Bidi;

void announceIncomingMessageIfEnabled(Ref ref, Message message) {
  if (!ref.read(
    appearancePreferencesProvider.select(
      (state) => state.screenReaderAnnounceNewMessages,
    ),
  )) {
    return;
  }
  final FluxerLocalizations l10n = ref.read(appLocalizationsProvider);
  final String summary = messageAccessibilitySummary(message, l10n);
  final String announcement = message.isSystemMessage
      ? summary
      : l10n.messageScreenReaderAnnouncement(
          message.authorName.isNotEmpty ? message.authorName : message.authorId,
          summary,
        );
  final locale = PlatformDispatcher.instance.locale;
  final TextDirection direction = Bidi.isRtlLanguage(locale.languageCode)
      ? TextDirection.rtl
      : TextDirection.ltr;
  final FlutterView? view = PlatformDispatcher.instance.implicitView;
  if (view == null) {
    return;
  }
  unawaited(SemanticsService.sendAnnouncement(view, announcement, direction));
}
