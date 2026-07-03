import 'package:dio/dio.dart';
import 'package:fluxer_dart/export.dart';

class DiscoverySearchResult {
  const DiscoverySearchResult({required this.guilds, required this.total});

  final List<DiscoveryGuildListResponseGuilds> guilds;
  final int total;
}

class DiscoveryRepository {
  final FluxerClient _client;

  const DiscoveryRepository(this._client);

  Future<List<DiscoveryCategoryResponse>> listCategories() async {
    try {
      return await _client.discovery.listDiscoveryCategories();
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to load discovery categories',
      );
    }
  }

  Future<DiscoverySearchResult> searchGuilds({
    required int offset,
    String? query,
    int? category,
    String? language,
    int limit = 36,
  }) async {
    try {
      final DiscoveryGuildListResponse response = await _client.discovery
          .searchDiscoveryGuilds(
            query: query?.isEmpty ?? true ? null : query,
            category: category,
            language: language,
            sortBy: SortBy.memberCount,
            limit: limit,
            offset: offset,
          );
      return DiscoverySearchResult(
        guilds: response.guilds,
        total: response.total.toInt(),
      );
    } on DioException catch (e) {
      throw Exception(
        e.response?.statusMessage ?? 'Failed to search discovery communities',
      );
    }
  }

  Future<void> joinGuild(String guildId) async {
    try {
      await _client.discovery.joinDiscoveryGuild(guildId: guildId);
    } on DioException {
      rethrow;
    }
  }
}
