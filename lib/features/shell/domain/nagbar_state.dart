import 'package:fluxer_app/features/shell/domain/nagbar_type.dart';

class NagbarState {
  const NagbarState({
    required this.type,
    required this.priority,
    required this.visible,
    required this.dismissible,
  });

  final NagbarType type;
  final double priority;
  final bool visible;
  final bool dismissible;
}
