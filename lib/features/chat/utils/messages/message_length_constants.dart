import 'package:fluxer_app/core/limits/limit_defaults.dart';

int resolveMaxMessageLength({required bool isPremium}) {
  return isPremium ? kMaxMessageLengthPremium : kMaxMessageLengthNonPremium;
}
