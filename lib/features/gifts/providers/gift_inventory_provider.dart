import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'gift_inventory_provider.g.dart';

@riverpod
class GiftInventory extends _$GiftInventory {
  @override
  Future<List<GiftCodeMetadataResponse>> build() async {
    return ref.read(fluxerClientProvider).users.listUserGifts();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      return ref.read(fluxerClientProvider).users.listUserGifts();
    });
  }
}
