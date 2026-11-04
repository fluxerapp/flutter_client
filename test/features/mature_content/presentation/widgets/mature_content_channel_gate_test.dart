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
import 'package:fluxer_app/features/mature_content/providers/sensitive_content_provider.dart';
import 'package:fluxer_app/material_ui.dart' hide SensitiveContent;
import 'package:riverpod/src/framework.dart' show Override;

import '../../../../helpers/test_l10n.dart';

class _AppLockedSensitive extends SensitiveContent {
  @override
  SensitiveContentState build() =>
      const SensitiveContentState(access: MatureAccess.appLocked);
}

class _AgreedAgreements extends MatureContentAgreements {
  @override
  MatureContentAgreementsState build() => const MatureContentAgreementsState(
    isLoaded: true,
    agreedChannelIds: {'channel-1'},
  );
}

void main() {
  const ResolvedMatureGateContext matureContext = ResolvedMatureGateContext(
    channelId: 'channel-1',
    categoryId: null,
    guildId: 'guild-1',
    effectiveMatureContent: true,
    effectiveWarningLevel: contentWarningLevelInherit,
    effectiveWarningText: null,
    scope: MatureContentAgreementScope.channel,
    scopeId: 'channel-1',
  );

  const ResolvedMatureGateContext warningContext = ResolvedMatureGateContext(
    channelId: 'channel-2',
    categoryId: null,
    guildId: 'guild-1',
    effectiveMatureContent: false,
    effectiveWarningLevel: contentWarningLevelContentWarning,
    effectiveWarningText: 'This contains sensitive content.',
    scope: MatureContentAgreementScope.channel,
    scopeId: 'channel-2',
  );

  testWidgets('shows web opt-in copy without proceed on iOS', (tester) async {
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          matureContentGateReasonProvider(
            'channel-1',
          ).overrideWith((ref) => MatureContentGateReason.webOptInRequired),
          matureGateContextProvider(
            'channel-1',
          ).overrideWith((ref) => matureContext),
        ],
        child: const MatureContentChannelGate(channelId: 'channel-1'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('Mature channel'), findsOneWidget);
    expect(find.text('Proceed'), findsNothing);
    expect(find.text('Cancel'), findsOneWidget);
  });

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

  testWidgets('iOS without the opt-in shows the app lock and no Proceed', (
    tester,
  ) async {
    await tester.pumpWidget(
      _buildTestApp(
        overrides: [
          sensitiveContentProvider.overrideWith(_AppLockedSensitive.new),
          matureContentAgreementsProvider.overrideWith(_AgreedAgreements.new),
          matureGateContextProvider(
            'channel-1',
          ).overrideWith((ref) => matureContext),
        ],
        child: const MatureContentChannelGate(channelId: 'channel-1'),
      ),
    );
    await tester.pumpAndSettle();
    expect(
      find.textContaining('18+ content is off on iPhone and iPad'),
      findsOneWidget,
    );
    expect(find.text('Proceed'), findsNothing);
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
