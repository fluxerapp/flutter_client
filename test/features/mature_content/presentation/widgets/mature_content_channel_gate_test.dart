import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/mature_content/domain/mature_content_types.dart';
import 'package:fluxer_app/features/mature_content/presentation/widgets/mature_content_channel_gate.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:material_ui/material_ui.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/test_l10n.dart';

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

  const ResolvedMatureGateContext warningContext = ResolvedMatureGateContext(
    channelId: 'channel-2',
    categoryId: null,
    guildId: 'guild-1',
    effectiveMatureContent: false,
    matureContentSource: EffectiveMatureSource.none,
    effectiveWarningLevel: contentWarningLevelContentWarning,
    effectiveWarningText: 'This contains sensitive content.',
    warningSource: EffectiveMatureSource.channel,
    scope: MatureContentAgreementScope.channel,
    scopeId: 'channel-2',
  );

  testWidgets('shows mature channel copy when consent is required', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          matureContentGateReasonProvider(
            'channel-1',
          ).overrideWith((ref) => MatureContentGateReason.consentRequired),
          matureGateContextProvider(
            'channel-1',
          ).overrideWith((ref) => matureContext),
        ],
        child: const MatureContentChannelGate(channelId: 'channel-1'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Mature channel'), findsOneWidget);
    expect(find.text('Proceed'), findsOneWidget);
  });

  testWidgets('shows content warning copy with I understand button', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          matureContentGateReasonProvider(
            'channel-2',
          ).overrideWith((ref) => MatureContentGateReason.consentRequired),
          matureGateContextProvider(
            'channel-2',
          ).overrideWith((ref) => warningContext),
        ],
        child: const MatureContentChannelGate(
          channelId: 'channel-2',
          channelType: ChannelType.guildText,
        ),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Channel content warning'), findsOneWidget);
    expect(find.text('This contains sensitive content.'), findsOneWidget);
    expect(find.text('I understand'), findsOneWidget);
  });
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
