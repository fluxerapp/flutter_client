import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/constants/media_proxy_sizes.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/messages/message_item.dart';
import 'package:fluxer_app/features/settings/providers/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/use_12_hour_time_format_provider.dart';
import 'package:fluxer_app/shared/providers/guild_user_display_provider.dart';
import 'package:fluxer_app/shared/providers/member_role_color.dart';
import 'package:fluxer_app/shared/utils/guild_user_display.dart';
import 'package:fluxer_dart/export.dart';
import '../../../../../helpers/test_l10n.dart';

/// Author snowflake used by every case in this file.
const String _authorId = '123456789012345678';
const String _guildId = 'g1';
const String _globalAvatarHash = 'global_avatar_hash';

/// Default/blank avatar CDN URL FluxerAvatar derives when imageUrl is null.
String get _defaultAvatarUrl {
  final index = BigInt.parse(_authorId) % BigInt.from(6);
  return 'https://fluxerstatic.com/avatars/$index.png';
}

/// Global user avatar URL the message payload would produce without AVATAR_UNSET.
String get _globalAvatarUrl => FluxerMediaUrl.userAvatar(
  userId: _authorId,
  hash: _globalAvatarHash,
  size: MediaProxySizes.avatarProfile,
)!;

Message _message() => Message(
  id: 'msg-1',
  channelId: 'c1',
  authorId: _authorId,
  authorName: 'Alice',
  authorAvatar: _globalAvatarHash,
  content: 'hello',
  timestamp: DateTime.utc(2026, 1, 1, 12),
);

const MessageRenderSettings _settings = MessageRenderSettings(
  activeGuildId: _guildId,
  renderEmbeds: false,
  renderReactions: false,
  inlineAttachmentMedia: false,
  renderSpoilers: RenderSpoilers.onClick,
  revealSpoilers: false,
  chatPreferences: ChatPreferencesState(),
  messageGroupSpacing: 16,
);

/// Guild-resolved display for a member with AVATAR_UNSET: avatarUrl nullled,
/// but avatarHash still holds the global hash (matches production resolvers).
const GuildUserDisplay _unsetDisplay = GuildUserDisplay(
  displayName: 'Alice',
  accountDisplayName: 'Alice',
  avatarUrl: null,
  avatarHash: _globalAvatarHash,
  avatarColor: null,
);

/// Same member with avatar shown (inherit / set): global avatar URL.
final GuildUserDisplay _shownDisplay = GuildUserDisplay(
  displayName: 'Alice',
  accountDisplayName: 'Alice',
  avatarUrl: _globalAvatarUrl,
  avatarHash: _globalAvatarHash,
  avatarColor: null,
);

Widget _app({
  required GuildUserDisplay authorDisplay,
  required Message message,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    key: ValueKey<Object>(authorDisplay.avatarUrl ?? 'unset'),
    overrides: [
      guildUserDisplayProvider((
        _authorId,
        _guildId,
      )).overrideWith((ref) => AsyncValue.data(authorDisplay)),
      guildUserDisplayFromDbProvider((
        _authorId,
        _guildId,
      )).overrideWith((ref) => AsyncValue.data(authorDisplay)),
      memberRoleColorProvider((
        _authorId,
        _guildId,
      )).overrideWith((ref) => null),
      use12HourTimeFormatProvider.overrideWithValue(false),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: MessageItem(message: message, renderSettings: _settings),
      ),
    ),
  );
}

CachedNetworkImage _avatarImage(WidgetTester tester) {
  final images = tester.widgetList<CachedNetworkImage>(
    find.byType(CachedNetworkImage),
  );
  expect(
    images,
    isNotEmpty,
    reason: 'message row should render an avatar image',
  );
  return images.first;
}

void main() {
  group('MessageItem avatar AVATAR_UNSET', () {
    testWidgets(
      'avatar-unset member message requests default avatar URL, not global',
      (tester) async {
        await tester.pumpWidget(
          _app(authorDisplay: _unsetDisplay, message: _message()),
        );
        await tester.pump();

        final image = _avatarImage(tester);
        expect(image.imageUrl, _defaultAvatarUrl);
        expect(image.imageUrl, isNot(_globalAvatarUrl));
        expect(image.imageUrl, isNot(contains('/avatars/$_authorId/')));
        expect(image.imageUrl, isNot(contains(_globalAvatarHash)));
      },
    );

    testWidgets(
      'same author flips between global and default URLs when unset toggles',
      (tester) async {
        // Shown first — global avatar URL is the image identity.
        await tester.pumpWidget(
          _app(authorDisplay: _shownDisplay, message: _message()),
        );
        await tester.pump();
        expect(_avatarImage(tester).imageUrl, _globalAvatarUrl);

        // Unset on — image identity must change to the default/blank URL so
        // the network cache cannot resurrect the prior global avatar.
        await tester.pumpWidget(
          _app(authorDisplay: _unsetDisplay, message: _message()),
        );
        await tester.pump();
        final unsetImage = _avatarImage(tester);
        expect(unsetImage.imageUrl, _defaultAvatarUrl);
        expect(unsetImage.imageUrl, isNot(_globalAvatarUrl));

        // Unset off again — back to the global URL (distinct identity).
        await tester.pumpWidget(
          _app(authorDisplay: _shownDisplay, message: _message()),
        );
        await tester.pump();
        expect(_avatarImage(tester).imageUrl, _globalAvatarUrl);
      },
    );

    testWidgets(
      'avatar identity stays stable across optimistic→delivered message id swap',
      (tester) async {
        final optimistic = _message().copyWith(id: 'optimistic-temp-id');
        final delivered = _message().copyWith(id: 'delivered-snowflake-id');

        await tester.pumpWidget(
          _app(authorDisplay: _unsetDisplay, message: optimistic),
        );
        await tester.pump();
        final before = _avatarImage(tester).imageUrl;

        await tester.pumpWidget(
          _app(authorDisplay: _unsetDisplay, message: delivered),
        );
        await tester.pump();
        final after = _avatarImage(tester).imageUrl;

        expect(before, _defaultAvatarUrl);
        expect(after, before);
      },
    );
  });
}
