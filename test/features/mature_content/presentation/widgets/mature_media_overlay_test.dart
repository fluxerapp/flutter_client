import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_media_overlay.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/material_ui.dart' hide SensitiveContent;
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('shows reveal button for blurred mature media', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          matureMediaPolicyProvider(
            const MatureMediaPolicyRequest(
              channelId: 'channel-1',
              isMatureMedia: true,
            ),
          ).overrideWith(
            (ref) => const MatureMediaPolicy(
              shouldBlur: true,
              shouldBlock: false,
              canReveal: true,
            ),
          ),
        ],
        child: const MatureMediaOverlay(
          channelId: 'channel-1',
          isMatureMedia: true,
          child: SizedBox(width: 120, height: 80),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Reveal'), findsOneWidget);
    await tester.tap(find.text('Reveal'));
    await tester.pumpAndSettle();
    expect(find.text('Reveal'), findsNothing);
  });

  testWidgets('does not build child while policy is loading', (tester) async {
    final Completer<MatureMediaPolicy> pendingPolicy =
        Completer<MatureMediaPolicy>();
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          matureMediaPolicyProvider(
            const MatureMediaPolicyRequest(
              channelId: 'channel-1',
              isMatureMedia: true,
            ),
          ).overrideWith((ref) => pendingPolicy.future),
        ],
        child: const MatureMediaOverlay(
          channelId: 'channel-1',
          isMatureMedia: true,
          child: Text('secret'),
        ),
      ),
    );
    await tester.pump();
    expect(find.text('secret'), findsNothing);
    pendingPolicy.complete(
      const MatureMediaPolicy(
        shouldBlur: true,
        shouldBlock: false,
        canReveal: true,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Reveal'), findsOneWidget);
    expect(find.text('secret'), findsNothing);
  });

  for (final (MatureAccess access, String label) in <(MatureAccess, String)>[
    (MatureAccess.appLocked, 'Sensitive media is hidden on iPhone and iPad.'),
    (MatureAccess.minor, 'Sensitive media is hidden for your account.'),
  ]) {
    testWidgets(
      'locked media for ${access.name} shows "$label" and no reveal',
      (tester) async {
        await tester.pumpWidget(
          _buildTestApp(
            overrides: [
              sensitiveContentProvider.overrideWith(
                () => _FixedSensitive(access),
              ),
              matureMediaPolicyProvider(
                const MatureMediaPolicyRequest(
                  channelId: 'channel-1',
                  isMatureMedia: true,
                ),
              ).overrideWith(
                (ref) => const MatureMediaPolicy(
                  shouldBlur: true,
                  shouldBlock: false,
                  canReveal: false,
                  appLocked: true,
                ),
              ),
            ],
            child: const MatureMediaOverlay(
              channelId: 'channel-1',
              isMatureMedia: true,
              child: SizedBox(width: 200, height: 120),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.text(label), findsOneWidget);
        expect(find.text('Reveal'), findsNothing);
      },
    );
  }

  testWidgets('blocked mature media renders placeholder without reveal', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          matureMediaPolicyProvider(
            const MatureMediaPolicyRequest(
              channelId: 'channel-1',
              isMatureMedia: true,
            ),
          ).overrideWith(
            (ref) => const MatureMediaPolicy(
              shouldBlur: false,
              shouldBlock: true,
              canReveal: false,
            ),
          ),
        ],
        child: const MatureMediaOverlay(
          channelId: 'channel-1',
          isMatureMedia: true,
          placeholderSize: Size(200, 120),
          child: Text('hidden'),
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('hidden'), findsNothing);
    expect(find.text('Reveal'), findsNothing);
  });
}

class _FixedSensitive extends SensitiveContent {
  _FixedSensitive(this._access);

  final MatureAccess _access;

  @override
  SensitiveContentState build() => SensitiveContentState(access: _access);
}

Widget _buildTestApp({
  required Widget child,
  List<Override> overrides = const [],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}
