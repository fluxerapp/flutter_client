import 'package:fluxer_app/core/app_lock/app_lock_config.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String appLockTimeoutLabel(FluxerLocalizations l10n, AppLockTimeout timeout) {
  return switch (timeout) {
    AppLockTimeout.immediately => l10n.appLockTimeoutImmediately,
    AppLockTimeout.thirtySeconds => l10n.appLockTimeoutThirtySeconds,
    AppLockTimeout.oneMinute => l10n.appLockTimeoutOneMinute,
    AppLockTimeout.fiveMinutes => l10n.appLockTimeoutFiveMinutes,
    AppLockTimeout.fifteenMinutes => l10n.appLockTimeoutFifteenMinutes,
    AppLockTimeout.oneHour => l10n.appLockTimeoutOneHour,
  };
}
