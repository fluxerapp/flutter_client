import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';

final storeBillingContextProvider =
    AsyncNotifierProvider<
      StoreBillingContextNotifier,
      StoreBillingContextResponse?
    >(StoreBillingContextNotifier.new);

class StoreBillingContextNotifier
    extends AsyncNotifier<StoreBillingContextResponse?> {
  @override
  Future<StoreBillingContextResponse?> build() async {
    final client = ref.watch(fluxerClientProvider);
    try {
      return await client.premium.getStoreBillingContext();
    } on Object {
      return null;
    }
  }
}
