import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' show User;
import 'package:fluxer_app/features/accessibility/text_scale.dart';
import 'package:fluxer_app/features/profile/providers/user_presence_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/app_bottom_nav_bar.dart';
import 'package:fluxer_app/features/ui/avatar/fluxer_guild_icon_avatar.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../helpers/pump_fluxer_app.dart';

const MediaQueryData _maxTextScaleMediaQuery = MediaQueryData(
  textScaler: TextScaler.linear(2),
  size: Size(390, 844),
);

Widget _wrapLargeText(Widget child) {
  return MediaQuery(data: _maxTextScaleMediaQuery, child: child);
}

void main() {
  group('large text accessibility', () {
    testWidgets('bottom nav shows Notifications without overflow', (
      tester,
    ) async {
      await tester.pumpWidget(
        pumpFluxerApp(
          child: _wrapLargeText(
            FluxerConstrainedUiTextScale(
              child: Scaffold(
                bottomNavigationBar: AppBottomNavBar(
                  currentIndex: 1,
                  onBranchSelected: (_) {},
                ),
              ),
            ),
          ),
          overrides: [
            userSettingsViewModelProvider.overrideWithValue(
              const UserSettingsViewState(
                userId: 'u1',
                username: 'testuser',
                displayName: 'Test User',
                discriminator: '0001',
                avatar: null,
                avatarColor: null,
                memberSince: null,
                status: 'online',
                messageDisplayCompact: false,
                developerMode: false,
                trustedDomains: <String>[],
              ),
            ),
            userPresenceProvider(
              'u1',
            ).overrideWith((Ref ref) => Stream<User?>.value(null)),
          ],
        ),
      );
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 100));

      expect(find.text('Notifications'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('guild letter fallback stays inside fixed icon box', (
      tester,
    ) async {
      await tester.pumpWidget(
        pumpFluxerApp(
          child: _wrapLargeText(
            const Center(
              child: FluxerGuildIconAvatar(name: 'Test Guild', size: 44),
            ),
          ),
        ),
      );
      await tester.pump();

      expect(find.text('TG'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
