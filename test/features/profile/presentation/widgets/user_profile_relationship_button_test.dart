import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/friends/domain/friend.dart';
import 'package:fluxer_app/features/profile/presentation/widgets/user_profile_relationship_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import '../../../../helpers/test_l10n.dart';

Widget buildTestApp(Widget child) {
  final colorTheme = buildDarkColorTheme();
  return MaterialApp(
    locale: kTestLocale,
    localizationsDelegates: FluxerLocalizations.localizationsDelegates,
    supportedLocales: FluxerLocalizations.supportedLocales,
    theme: buildFluxerTheme(
      colorTheme: colorTheme,
      textTheme: FluxerTextTheme.fromColors(colorTheme),
      layoutTheme: FluxerLayoutTheme.scaled(),
    ),
    home: Scaffold(body: child),
  );
}

UserProfileRelationshipButton _build({
  required void Function(String) record,
  FriendStatus? status,
  bool isCurrentUser = false,
}) {
  return UserProfileRelationshipButton(
    relationshipStatus: status,
    isCurrentUser: isCurrentUser,
    onUnblock: () => record('unblock'),
    onRemoveFriend: () => record('removeFriend'),
    onAcceptRequest: () => record('accept'),
    onCancelRequest: () => record('cancel'),
    onSendFriendRequest: () => record('send'),
  );
}

void main() {
  group('UserProfileRelationshipButton', () {
    testWidgets('renders nothing for current user', (tester) async {
      await tester.pumpWidget(
        buildTestApp(_build(isCurrentUser: true, record: (_) {})),
      );
      expect(find.byType(PhosphorIcon), findsNothing);
    });

    testWidgets('blocked → prohibit icon → onUnblock', (tester) async {
      String? action;
      await tester.pumpWidget(
        buildTestApp(
          _build(status: FriendStatus.blocked, record: (a) => action = a),
        ),
      );
      await tester.tap(find.byType(PhosphorIcon));
      expect(action, 'unblock');
    });

    testWidgets('accepted → userMinus icon → onRemoveFriend', (tester) async {
      String? action;
      await tester.pumpWidget(
        buildTestApp(
          _build(status: FriendStatus.accepted, record: (a) => action = a),
        ),
      );
      await tester.tap(find.byType(PhosphorIcon));
      expect(action, 'removeFriend');
    });

    testWidgets('pendingIncoming → onAcceptRequest', (tester) async {
      String? action;
      await tester.pumpWidget(
        buildTestApp(
          _build(
            status: FriendStatus.pendingIncoming,
            record: (a) => action = a,
          ),
        ),
      );
      await tester.tap(find.byType(PhosphorIcon));
      expect(action, 'accept');
    });

    testWidgets('pendingOutgoing → onCancelRequest', (tester) async {
      String? action;
      await tester.pumpWidget(
        buildTestApp(
          _build(
            status: FriendStatus.pendingOutgoing,
            record: (a) => action = a,
          ),
        ),
      );
      await tester.tap(find.byType(PhosphorIcon));
      expect(action, 'cancel');
    });

    testWidgets('null (stranger) → onSendFriendRequest', (tester) async {
      String? action;
      await tester.pumpWidget(buildTestApp(_build(record: (a) => action = a)));
      await tester.tap(find.byType(PhosphorIcon));
      expect(action, 'send');
    });
  });
}
