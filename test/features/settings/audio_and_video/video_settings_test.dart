// Root ProviderScope built by a helper; the lint only exempts a
// ProviderScope written inline in pumpWidget.
// ignore_for_file: riverpod_lint/scoped_providers_should_specify_dependencies

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/premium/should_show_premium_commerce_provider.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_and_video/screen_share_premium_card.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_and_video/video_control_group.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/audio_and_video/video_settings.dart';
import 'package:fluxer_app/features/settings/providers/preferences/voice_settings_provider.dart';
import 'package:fluxer_app/features/ui/plutonium_upsell/fluxer_plutonium_upsell.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_compact_select_row.dart';
import 'package:fluxer_app/features/voice/domain/video_quality_caps.dart';
import 'package:fluxer_app/features/voice/domain/voice_settings_state.dart';
import 'package:fluxer_app/features/voice/providers/voice_media_devices_provider.dart';
import 'package:fluxer_app/features/voice/providers/voice_video_quality_provider.dart';
import 'package:fluxer_app/features/voice/utils/screen_share/screen_share_target.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

import '../../../helpers/test_l10n.dart';

const InstanceRuntimeConfig _selfHosted = InstanceRuntimeConfig(
  productName: 'Fluxer',
  selfHosted: true,
  stripeEnabled: false,
  emailsEnabled: false,
  voiceEnabled: true,
  presignedAttachmentUploads: false,
  gifEnabled: false,
  blueskyEnabled: false,
  gifAttributionRequired: false,
  singleCommunity: false,
  directMessagesDisabled: false,
  registrationClosed: false,
  adminRegistrationUrlsEnabled: false,
  collectDateOfBirth: false,
);

class _MousePrimaryModality extends InputModalityNotifier {
  @override
  bool build() => false;
}

class _TouchPrimaryModality extends InputModalityNotifier {
  @override
  bool build() => true;
}

class _FakeVoiceMediaDevices extends VoiceMediaDevices {
  @override
  VoiceMediaDevicesState build() => const VoiceMediaDevicesState();
}

void _useSize(WidgetTester tester, Size size) {
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

Widget _wrap({
  required VideoQualityCaps caps,
  InstanceRuntimeConfig config = InstanceRuntimeConfig.defaults,
  bool touch = false,
  VoidCallback? onOpenAdvancedSettings,
}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [
      inputModalityProvider.overrideWith(
        touch ? _TouchPrimaryModality.new : _MousePrimaryModality.new,
      ),
      voiceSettingsProvider.overrideWith(VoiceSettings.new),
      voiceMediaDevicesProvider.overrideWith(_FakeVoiceMediaDevices.new),
      voiceVideoQualityCapsProvider.overrideWithValue(caps),
      voiceDeviceVideoQualityCapsProvider.overrideWithValue(
        VideoQualityCaps.full,
      ),
      voiceScreenShareBitrateBudgetProvider.overrideWithValue(
        ScreenShareBitrateBudget.automatic,
      ),
      instanceRuntimeConfigProvider.overrideWithValue(config),
      shouldShowPremiumCommerceProvider.overrideWithValue(!config.selfHosted),
    ],
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: fluxerLocalizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: VoiceVideoSettings(
            onOpenAdvancedSettings: onOpenAdvancedSettings,
          ),
        ),
      ),
    ),
  );
}

ProviderContainer _container(WidgetTester tester) =>
    ProviderScope.containerOf(tester.element(find.byType(VoiceVideoSettings)));

void main() {
  group('desktop', () {
    testWidgets('free accounts get two control groups and the premium card', (
      tester,
    ) async {
      _useSize(tester, const Size(1400, 1600));
      await tester.pumpWidget(_wrap(caps: VideoQualityCaps.base));
      await tester.pumpAndSettle();

      expect(find.byType(VoiceVideoControlGroup), findsNWidgets(2));
      expect(find.text('Camera quality'), findsOneWidget);
      expect(find.text('Streaming mode'), findsOneWidget);
      expect(find.text('Screen share quality'), findsOneWidget);
      expect(find.text('720p'), findsWidgets);
      expect(find.byType(VoiceScreenSharePremiumCard), findsOneWidget);
      expect(find.text('Get Plutonium'), findsOneWidget);
      expect(
        find.text('Frame rates above 30 FPS require Plutonium'),
        findsOneWidget,
      );
      expect(find.text('Bitrate'), findsNothing);
    });

    testWidgets('picking a resolution switches to Custom', (tester) async {
      _useSize(tester, const Size(1400, 1600));
      await tester.pumpWidget(_wrap(caps: VideoQualityCaps.full));
      await tester.pumpAndSettle();

      expect(find.text('Bitrate'), findsOneWidget);
      final Finder resolutionRow = find.byWidgetPredicate(
        (Widget widget) =>
            widget is FluxerSettingsCompactSelectRow<ScreenshareResolution>,
      );
      await tester.tap(
        find.descendant(of: resolutionRow, matching: find.text('1080p')),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('1440p').last);
      await tester.pumpAndSettle();

      final VoiceSettingsState settings = _container(
        tester,
      ).read(voiceSettingsProvider);
      expect(settings.streamingMode, StreamingMode.custom);
      expect(settings.screenshareResolution, ScreenshareResolution.ultra);
    });

    testWidgets('instances without premium name their limit', (tester) async {
      _useSize(tester, const Size(1400, 1600));
      await tester.pumpWidget(
        _wrap(caps: VideoQualityCaps.base, config: _selfHosted),
      );
      await tester.pumpAndSettle();

      expect(find.byType(VoiceScreenSharePremiumCard), findsNothing);
      expect(
        find.text(
          'This instance currently allows screen sharing up to 720p at 30 FPS.',
        ),
        findsOneWidget,
      );
    });

    testWidgets('the advanced row opens advanced media settings', (
      tester,
    ) async {
      _useSize(tester, const Size(1400, 1600));
      int opened = 0;
      await tester.pumpWidget(
        _wrap(
          caps: VideoQualityCaps.base,
          onOpenAdvancedSettings: () => opened++,
        ),
      );
      await tester.pumpAndSettle();

      await tester.tap(find.text('Open advanced media settings'));
      expect(opened, 1);
    });
  });

  group('mobile', () {
    testWidgets('rows are grouped and open a picker sheet', (tester) async {
      _useSize(tester, const Size(390, 2000));
      await tester.pumpWidget(_wrap(caps: VideoQualityCaps.full, touch: true));
      await tester.pumpAndSettle();

      expect(find.byType(VoiceVideoControlGroup), findsNothing);
      expect(find.text('Screen share'), findsWidgets);
      expect(find.byType(FluxerPlutoniumUpsell), findsNothing);

      await tester.tap(find.text('Frame rate'));
      await tester.pumpAndSettle();
      expect(find.text('120 FPS'), findsOneWidget);
      await tester.tap(find.text('60 FPS'));
      await tester.pumpAndSettle();

      final VoiceSettingsState settings = _container(
        tester,
      ).read(voiceSettingsProvider);
      expect(settings.streamingMode, StreamingMode.custom);
      expect(settings.videoFrameRate, 60);
    });

    testWidgets('free accounts see the upsell', (tester) async {
      _useSize(tester, const Size(390, 2000));
      await tester.pumpWidget(_wrap(caps: VideoQualityCaps.base, touch: true));
      await tester.pumpAndSettle();

      expect(find.byType(FluxerPlutoniumUpsell), findsOneWidget);
      expect(
        find.text('Unlock HD screen share with Plutonium'),
        findsOneWidget,
      );
    });
  });
}
