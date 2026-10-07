import 'package:dio/dio.dart';
import 'package:fluxer_app/core/theme/custom_theme_css.dart';
import 'package:fluxer_app/features/themes/utils/shared_theme_links.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'shared_theme_css_provider.g.dart';

final Dio _sharedThemeDio = Dio(
  BaseOptions(
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    responseType: ResponseType.plain,
  ),
);

class SharedThemeUnreadableException implements Exception {
  const SharedThemeUnreadableException(this.themeId);

  final String themeId;

  @override
  String toString() => 'SharedThemeUnreadableException($themeId)';
}

Duration? _noRetry(int retryCount, Object error) => null;

@Riverpod(retry: _noRetry)
Future<String> sharedThemeCss(Ref ref, String themeId) async {
  final Response<String> response = await _sharedThemeDio.get<String>(
    sharedThemeCssUrl(themeId),
  );
  final String? css = normalizeCustomThemeCss(response.data);
  if (css == null) {
    throw SharedThemeUnreadableException(themeId);
  }
  return css;
}
