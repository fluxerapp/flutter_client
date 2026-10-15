import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/core/theme/themes/light.dart';
import 'package:fluxer_app/features/auth/domain/stored_account.dart';
import 'package:fluxer_app/features/auth/providers/account_manager_provider.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_self_card.dart';
import 'package:fluxer_app/features/profile/providers/user_settings_status_provider.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/status_indicator/fluxer_status_indicator.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../helpers/pump_fluxer_app.dart';
import '../../../../helpers/test_l10n.dart';

const String _kLongStatus =
    'Heads down on the release notes until the build lands this evening';

void main() {
  for (final ({
        String name,
        FluxerColorTheme colors,
        double textScale,
        String? customStatus,
      })
      variant
      in <
        ({
          String name,
          FluxerColorTheme colors,
          double textScale,
          String? customStatus,
        })
      >[
        (
          name: 'dark, default text',
          colors: buildDarkColorTheme(),
          textScale: 1,
          customStatus: null,
        ),
        (
          name: 'light, long custom status',
          colors: buildLightColorTheme(),
          textScale: 1,
          customStatus: _kLongStatus,
        ),
        (
          name: 'dark, large text, long custom status',
          colors: buildDarkColorTheme(),
          textScale: 2,
          customStatus: _kLongStatus,
        ),
      ]) {
    testWidgets('status and account rows line up (${variant.name})', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1206, 2622);
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        pumpFluxerApp(
          theme: buildFluxerTheme(
            colorTheme: variant.colors,
            textTheme: FluxerTextTheme.fromColors(variant.colors),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          overrides: [
            currentUserIdProvider.overrideWithValue('me'),
            accountManagerProvider.overrideWith(_FakeAccountManager.new),
            userSettingsStatusProvider.overrideWithValue(
              _settings(status: 'dnd', customStatus: variant.customStatus),
            ),
          ],
          child: MediaQuery(
            data: MediaQueryData(
              size: const Size(402, 874),
              textScaler: TextScaler.linear(variant.textScale),
            ),
            child: const Scaffold(
              body: Padding(
                padding: EdgeInsets.all(16),
                child: UserProfileSelfCard(),
              ),
            ),
          ),
        ),
      );
      await tester.pump();

      final Finder statusLabel = find.text(testL10n.statusChangeSheetTitle);
      final Finder accountsLabel = find.text(
        testL10n.profileTabMenuSwitchAccounts,
      );
      final Finder statusRow = _rowOf(statusLabel);
      final Finder accountsRow = _rowOf(accountsLabel);
      final Rect statusIcon = tester.getRect(
        find.descendant(
          of: statusRow,
          matching: find.byType(FluxerStatusIndicator),
        ),
      );
      final Rect accountsIcon = tester.getRect(
        find.descendant(
          of: accountsRow,
          matching: find.byIcon(PhosphorIconsBold.users),
        ),
      );

      expect(
        tester.getSize(statusRow).height,
        tester.getSize(accountsRow).height,
      );
      expect(
        tester.getTopLeft(statusLabel).dx,
        tester.getTopLeft(accountsLabel).dx,
      );
      expect(statusIcon.center.dx, moreOrLessEquals(accountsIcon.center.dx));
      for (final (Finder label, Rect icon, Finder row)
          in <(Finder, Rect, Finder)>[
            (statusLabel, statusIcon, statusRow),
            (accountsLabel, accountsIcon, accountsRow),
          ]) {
        final double rowCenter = tester.getCenter(row).dy;
        expect(tester.getCenter(label).dy, moreOrLessEquals(rowCenter));
        expect(icon.center.dy, moreOrLessEquals(rowCenter));
      }
      expect(
        tester
            .getRect(
              find.descendant(
                of: statusRow,
                matching: find.byIcon(PhosphorIconsBold.caretRight),
              ),
            )
            .right,
        tester
            .getRect(
              find.descendant(
                of: accountsRow,
                matching: find.byIcon(PhosphorIconsBold.caretRight),
              ),
            )
            .right,
      );
      final Rect card = tester.getRect(find.byType(FluxerMenuGroup));
      final Rect separator = tester.getRect(
        find.descendant(
          of: find.byType(FluxerMenuGroup),
          matching: find.byType(Divider),
        ),
      );
      final double inset = FluxerLayoutTheme.scaled().groupRowInset;
      expect(separator.left, moreOrLessEquals(card.left + inset));
      expect(separator.right, moreOrLessEquals(card.right - inset));
      if (variant.customStatus != null) {
        expect(find.text(_kLongStatus), findsOneWidget);
        expect(find.text(testL10n.statusDnd), findsNothing);
      } else {
        expect(find.text(testL10n.statusDnd), findsOneWidget);
      }
      expect(tester.takeException(), isNull);
    });
  }
}

Finder _rowOf(Finder label) =>
    find.ancestor(of: label, matching: find.byType(AnimatedContainer)).first;

class _FakeAccountManager extends AccountManager {
  @override
  AccountManagerState build() => const AccountManagerState(
    accounts: <StoredAccount>[
      StoredAccount(userId: 'other-1', isValid: true, mediaBaseUrl: ''),
      StoredAccount(userId: 'other-2', isValid: true, mediaBaseUrl: ''),
    ],
    isSwitching: false,
  );

  @override
  Future<void> loadAccounts() async {}
}

UserSettingsResponse _settings({
  required String status,
  required String? customStatus,
}) {
  return UserSettingsResponse.fromJson(<String, Object?>{
    'status': status,
    'theme': 'dark',
    'locale': 'en-US',
    'synced_preferences': '',
    'render_embeds': true,
    'profile_privacy': 0,
    'privacy_setup_version': 0,
    'restricted_guilds': <String>[],
    'bot_restricted_guilds': <String>[],
    'default_guilds_restricted': false,
    'bot_default_guilds_restricted': false,
    'inline_attachment_media': true,
    'inline_embed_media': true,
    'gif_auto_play': true,
    'render_reactions': true,
    'animate_emoji': true,
    'animate_stickers': 0,
    'render_spoilers': 0,
    'message_display_compact': false,
    'friend_source_flags': 0,
    'incoming_call_flags': 0,
    'group_dm_add_permission_flags': 0,
    'guild_folders': <Map<String, Object?>>[],
    'custom_status': customStatus == null
        ? null
        : <String, Object?>{'text': customStatus},
    'afk_timeout': 600,
    'default_share_voice_activity': false,
    'developer_mode': false,
    'trusted_domains': <String>[],
    'default_hide_muted_channels': false,
    'sensitive_content_friend_dm_filter': 0,
    'sensitive_content_non_friend_dm_filter': 0,
    'sensitive_content_guild_filter': 0,
    'suppress_unprivileged_self_mentions': false,
    'suppress_unprivileged_self_mentions_bypass_user_ids': <String>[],
    'staff_dm_access_user_ids': <String>[],
    'time_format': 0,
  });
}
