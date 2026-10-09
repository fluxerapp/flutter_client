import 'package:dio/dio.dart';

import 'package:fluxer_app/features/auth/domain/ban_view.dart';

/// Repository for ban view API calls.
///
/// These endpoints use a `BanView` token (not a regular auth token), so
/// we use a separate Dio instance with no interceptors.
class BanViewRepository {
  final String _baseUrl;

  const BanViewRepository(this._baseUrl);

  Dio _createDio(String banViewToken) {
    return Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        contentType: 'application/json',
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'Authorization': 'BanView $banViewToken'},
      ),
    );
  }

  Future<BanStatus> getStatus(String token) async {
    final dio = _createDio(token);
    final response = await dio.get<Map<String, dynamic>>(
      '/auth/ban-view/status',
    );
    return BanStatus.fromJson(response.data!);
  }

  Future<void> submitAppeal({
    required String token,
    required String rationale,
  }) async {
    final dio = _createDio(token);
    await dio.post<void>(
      '/auth/ban-view/appeal',
      data: {'rationale': rationale},
    );
  }

  Future<void> recheck(String token) async {
    final dio = _createDio(token);
    await dio.post<Map<String, dynamic>>('/auth/ban-view/recheck');
  }

  Future<String> refreshToken(String token) async {
    final dio = _createDio(token);
    final response = await dio.post<Map<String, dynamic>>(
      '/auth/ban-view/refresh',
    );
    return response.data!['token'] as String;
  }
}
