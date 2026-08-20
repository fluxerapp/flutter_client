import 'dart:math' as math;

import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart'
    show MessageItem;
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart'
    show SystemMessage;
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:material_ui/material_ui.dart';

/// Horizontal layout shared by [MessageItem] and [SystemMessage].
const double kMessageAvatarSize = 40;
const double kMessageAvatarTextGap = 16;
const double kMessageAvatarColumnWidth =
    kMessageAvatarSize + kMessageAvatarTextGap;

const double kMessageRowPaddingHorizontal = 16;
const double kMessageRowPaddingVertical = 8;
const double kMessageAvatarTopPadding = 2;

const double kSystemMessageIconSize = 18;
const double kSystemMessageBodyFontSize = 14;
const double kSystemMessageTimestampFontSize = 10;
const String kSystemMessageTimestampLeading = ' ';

const double kCompactAvatarSize = 16;
const double kCompactTimestampGap = 4;
const double kCompactTimestampFontSize = 11;
const double kCompactMessageLineHeight = 22;
const double kCompactTimestampLineHeight =
    kCompactMessageLineHeight / kCompactTimestampFontSize;
const double kCompactUsernameGap = 7.2;
const double kCompactTextIndentFromUsername = 32;
const double kCompactReplySpineInlineOffset = 4;
const double kCompactAuthorGap = kCompactUsernameGap;
const double kCompactSystemIconSize = 14;

TextStyle compactTimestampTextStyle({
  required TextStyle base,
  required Color color,
  FontWeight fontWeight = FontWeight.w400,
}) => base.copyWith(
  color: color,
  fontSize: kCompactTimestampFontSize,
  fontWeight: fontWeight,
  height: kCompactTimestampLineHeight,
);

double measureCompactTimestampColumnWidth(
  TextStyle style,
  String locale, {
  required bool use12Hour,
}) {
  final Iterable<String> samples = use12Hour
      ? <DateTime>[
          DateTime(2026, 1, 1, 12),
          DateTime(2026, 1, 1, 23, 59),
        ].map((DateTime time) => formatUserTime(time, locale, use12Hour: true))
      : <String>['23:59'];
  return samples
      .map((String sample) {
        final TextPainter painter = TextPainter(
          text: TextSpan(text: sample, style: style),
          textDirection: TextDirection.ltr,
          maxLines: 1,
        )..layout();
        return painter.width.ceilToDouble();
      })
      .fold<double>(0, math.max);
}

double compactMessageBodyStart({required double timestampColumnWidth}) =>
    timestampColumnWidth + kCompactTimestampGap;
