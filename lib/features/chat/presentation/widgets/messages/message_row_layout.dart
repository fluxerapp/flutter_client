import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart'
    show MessageItem;
import 'package:fluxer_app/features/chat/presentation/widgets/messages/system_message.dart'
    show SystemMessage;

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
const double kCompactAuthorGap = 4;
const double kCompactSystemIconSize = 14;
