import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final matureContentAppStorePolicyProvider = Provider<bool>(
  (Ref ref) => !kIsWeb && defaultTargetPlatform == TargetPlatform.iOS,
);
