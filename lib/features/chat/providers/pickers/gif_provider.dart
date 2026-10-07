import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_app/features/chat/data/gif_repository.dart';
import 'package:fluxer_app/features/chat/domain/gif_selection.dart';
import 'package:fluxer_dart/export.dart' as sdk;
import 'package:riverpod/misc.dart';

typedef GifSearchRequest = ({String query, sdk.Locale locale});

final Provider<GifRepository> gifRepositoryProvider = Provider<GifRepository>((
  ref,
) {
  final dio = ref.watch(fluxerDioProvider);
  return GifRepository(
    dio: dio,
    loadActiveProvider: () async {
      final wellKnown = await ref.read(wellKnownProvider.future);
      return gifProviderKindFromWireValue(wellKnown.gif.provider);
    },
  );
});

final FutureProvider<GifProviderKind> activeGifProviderProvider =
    FutureProvider<GifProviderKind>((ref) {
      return ref.watch(gifRepositoryProvider).getActiveProvider();
    });

final FutureProviderFamily<GifPickerFeatured, sdk.Locale> gifFeaturedProvider =
    FutureProvider.autoDispose.family<GifPickerFeatured, sdk.Locale>((
      ref,
      locale,
    ) {
      return ref.watch(gifRepositoryProvider).getFeatured(locale: locale);
    });

final FutureProviderFamily<List<GifPickerGif>, sdk.Locale> gifTrendingProvider =
    FutureProvider.autoDispose.family<List<GifPickerGif>, sdk.Locale>((
      ref,
      locale,
    ) {
      return ref.watch(gifRepositoryProvider).getTrending(locale: locale);
    });

final FutureProviderFamily<List<GifPickerGif>, GifSearchRequest>
gifSearchProvider = FutureProvider.autoDispose
    .family<List<GifPickerGif>, GifSearchRequest>((ref, request) {
      return ref
          .watch(gifRepositoryProvider)
          .search(query: request.query, locale: request.locale);
    });

final FutureProviderFamily<List<String>, GifSearchRequest>
gifSuggestionsProvider = FutureProvider.autoDispose
    .family<List<String>, GifSearchRequest>((ref, request) {
      return ref
          .watch(gifRepositoryProvider)
          .suggest(query: request.query, locale: request.locale);
    });
