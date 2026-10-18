import 'package:fluxer_app/core/observability/reporting_consent/app_foreground_session_watchdog.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_foreground_session_bootstrap_provider.g.dart';

@Riverpod(keepAlive: true)
class AppForegroundSessionBootstrap extends _$AppForegroundSessionBootstrap {
  @override
  AppForegroundSessionBootstrapResult build() {
    return cachedAppForegroundSessionBootstrap;
  }
}
