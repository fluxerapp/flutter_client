import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreBoard extends StatelessWidget {
  const PremiumStoreBoard({required this.child, this.padding, super.key});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    return DecoratedBox(
      decoration: style.boardDecoration,
      child: Padding(padding: padding ?? EdgeInsets.zero, child: child),
    );
  }
}
