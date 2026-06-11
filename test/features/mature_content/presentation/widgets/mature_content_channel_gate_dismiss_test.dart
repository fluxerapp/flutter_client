import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_content_channel_gate.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:riverpod/src/framework.dart' show Override;

void main() {
  const ResolvedMatureGateContext matureContext = ResolvedMatureGateContext(
    channelId: 'channel-1',
    categoryId: null,
    guildId: 'guild-1',
    effectiveMatureContent: true,
    matureContentSource: EffectiveMatureSource.channel,
    effectiveWarningLevel: contentWarningLevelInherit,
    effectiveWarningText: null,
    warningSource: EffectiveMatureSource.none,
    scope: MatureContentAgreementScope.channel,
    scopeId: 'channel-1',
  );

  testWidgets('dismisses after user agrees in-channel', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          matureContentAgreementsProvider.overrideWith(_LoadedAgreements.new),
          matureGateContextProvider(
            'channel-1',
          ).overrideWith((ref) async => matureContext),
        ],
        child: const MatureContentChannelGate(channelId: 'channel-1'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Proceed'), findsOneWidget);
    await tester.tap(find.text('Proceed'));
    await tester.pumpAndSettle();
    expect(find.text('Proceed'), findsNothing);
  });
}

class _LoadedAgreements extends MatureContentAgreements {
  @override
  MatureContentAgreementsState build() {
    return const MatureContentAgreementsState(isLoaded: true);
  }
}

Widget _buildTestApp({
  required Widget child,
  List<Override> overrides = const [],
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: overrides,
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
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
