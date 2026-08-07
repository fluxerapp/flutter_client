import 'package:dio/dio.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/features/gifts/utils/gift_code_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gift_embed_provider.g.dart';

sealed class GiftEmbedState {}

class GiftEmbedNotFound extends GiftEmbedState {}

class GiftEmbedLoaded extends GiftEmbedState {
  GiftEmbedLoaded(this.gift);

  final GiftCodeResponse gift;
}

GiftCodeResponse _giftMarkedRedeemed(GiftCodeResponse gift) {
  return GiftCodeResponse(
    code: gift.code,
    durationType: gift.durationType,
    durationQuantity: gift.durationQuantity,
    redeemed: true,
    createdBy: gift.createdBy,
  );
}

@riverpod
class GiftEmbed extends _$GiftEmbed {
  @override
  Future<GiftEmbedState> build(String code) {
    return _fetch(extractGiftCode(code));
  }

  Future<GiftEmbedState> _fetch(String normalizedCode) async {
    final client = ref.read(fluxerClientProvider);
    try {
      final gift = await client.gifts.getGiftCode(code: normalizedCode);
      return GiftEmbedLoaded(gift);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return GiftEmbedNotFound();
      }
      rethrow;
    }
  }

  Future<GiftCodeResponse> redeem() async {
    final normalizedCode = extractGiftCode(code);
    final client = ref.read(fluxerClientProvider);
    await client.gifts.redeemGiftCode(code: normalizedCode);

    final current = state.value;
    if (current is GiftEmbedLoaded) {
      final updated = _giftMarkedRedeemed(current.gift);
      state = AsyncData(GiftEmbedLoaded(updated));
      return updated;
    }

    final refreshed = await _fetch(normalizedCode);
    state = AsyncData(refreshed);
    if (refreshed is GiftEmbedLoaded) {
      return refreshed.gift;
    }
    throw StateError('Gift is not redeemable');
  }

  void markNotFound() {
    state = AsyncData(GiftEmbedNotFound());
  }

  void markRedeemed() {
    final current = state.value;
    if (current is! GiftEmbedLoaded) {
      return;
    }
    state = AsyncData(GiftEmbedLoaded(_giftMarkedRedeemed(current.gift)));
  }
}
