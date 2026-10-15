import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/api_exception.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_dart/export.dart';

Future<String> createPremiumCustomerPortalSession(WidgetRef ref) async {
  final FluxerClient client = ref.read(fluxerClientProvider);
  final UrlResponse response = await client.premium.createCustomerPortal();
  final String url = response.url;
  if (url.isEmpty) {
    throw const ApiException();
  }
  return url;
}
