import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/gifts/services/gift_redeem_service.dart';
import 'package:fluxer_app/features/ui/toast/fluxer_toast_overlay.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

import '../../helpers/core_test_provider_overrides.dart';
import '../../helpers/test_l10n.dart';

class _FakeGiftsApi extends Fake implements GiftsApi {
  bool offline = true;
  final List<String> redeemed = <String>[];

  @override
  Future<GiftCodeResponse> getGiftCode({required String code}) async {
    if (offline) {
      throw DioException(
        requestOptions: RequestOptions(path: '/gifts/$code'),
        type: DioExceptionType.connectionError,
      );
    }
    return GiftCodeResponse(
      code: code,
      durationType: GiftCodeDurationTypeSchema.months,
      durationQuantity: 1,
      redeemed: false,
    );
  }

  @override
  Future<void> redeemGiftCode({required String code}) async {
    redeemed.add(code);
  }
}

class _FakeFluxerClient extends FluxerClient {
  _FakeFluxerClient(this._gifts) : super(Dio());

  final GiftsApi _gifts;

  @override
  GiftsApi get gifts => _gifts;
}

void main() {
  testWidgets('iOS does not redeem a gift it could not look up', (
    WidgetTester tester,
  ) async {
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    final _FakeGiftsApi gifts = _FakeGiftsApi();
    final List<bool> results = <bool>[];
    final colorTheme = buildDarkColorTheme();
    await tester.pumpWidget(
      ProviderScope(
        overrides: coreTestProviderOverrides(
          extra: [
            fluxerClientProvider.overrideWithValue(_FakeFluxerClient(gifts)),
          ],
        ),
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: FluxerToastOverlay(
            child: Scaffold(
              body: Consumer(
                builder: (BuildContext context, WidgetRef ref, _) {
                  return TextButton(
                    onPressed: () async {
                      results.add(
                        await redeemGiftCode(
                          context: context,
                          ref: ref,
                          code: 'gift-code',
                        ),
                      );
                    },
                    child: const Text('redeem'),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('redeem'));
    await tester.pumpAndSettle();
    expect(find.text(testL10n.giftRedeemFailedTitle), findsOneWidget);
    expect(gifts.redeemed, isEmpty);

    await tester.tapAt(Offset.zero);
    await tester.pumpAndSettle();
    gifts.offline = false;
    await tester.tap(find.text('redeem'));
    await tester.pumpAndSettle();
    expect(gifts.redeemed, <String>['gift-code']);
    expect(results, <bool>[false, true]);

    await tester.pumpWidget(const SizedBox.shrink());
    debugDefaultTargetPlatformOverride = null;
  });
}
