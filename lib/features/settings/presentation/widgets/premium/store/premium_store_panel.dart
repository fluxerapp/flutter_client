import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_board.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStorePanel extends StatelessWidget {
  const PremiumStorePanel({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PremiumStoreBoard(
      padding: const EdgeInsets.fromLTRB(16, 28, 16, 20),
      child: child,
    );
  }
}
