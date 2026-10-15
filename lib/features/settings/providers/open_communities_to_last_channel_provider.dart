import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'open_communities_to_last_channel_provider.g.dart';

const String _kOpenCommunitiesToLastChannelKey =
    'open_communities_to_last_channel';

@Riverpod(keepAlive: true)
class OpenCommunitiesToLastChannel extends _$OpenCommunitiesToLastChannel {
  @override
  bool build() => false;

  Future<void> load() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    state = preferences.getBool(_kOpenCommunitiesToLastChannelKey) ?? false;
  }

  Future<void> setEnabled({required bool value}) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool(_kOpenCommunitiesToLastChannelKey, value);
    state = value;
  }
}
