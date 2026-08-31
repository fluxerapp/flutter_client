import 'package:fluxer_app/core/build/app_build_config.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'native_markdown_parser_provider.g.dart';

const String _kNativeMarkdownParserEnabledKey =
    'native_markdown_parser_enabled';

bool nativeMarkdownParserIsAvailable() => AppBuildConfig.isCanary;

@Riverpod(keepAlive: true)
class NativeMarkdownParserSetting extends _$NativeMarkdownParserSetting {
  @override
  bool build() => nativeMarkdownParserIsAvailable();

  Future<void> load() async {
    if (!nativeMarkdownParserIsAvailable()) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    state = preferences.getBool(_kNativeMarkdownParserEnabledKey) ?? true;
  }

  Future<void> setEnabled({required bool value}) async {
    if (!nativeMarkdownParserIsAvailable()) {
      return;
    }
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kNativeMarkdownParserEnabledKey, value);
    state = value;
  }
}
