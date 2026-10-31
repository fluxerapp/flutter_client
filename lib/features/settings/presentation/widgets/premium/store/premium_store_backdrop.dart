import 'package:fluxer_app/features/settings/presentation/widgets/premium/store/premium_store_style.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStoreBackdrop extends StatelessWidget {
  const PremiumStoreBackdrop({
    required this.bar,
    required this.child,
    super.key,
  });

  final Widget bar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final PremiumStoreStyle style = PremiumStoreStyle.of(context);
    return ColoredBox(
      color: style.page,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: child),
          DecoratedBox(
            decoration: BoxDecoration(
              color: style.page,
              border: Border(top: BorderSide(color: style.line)),
            ),
            child: bar,
          ),
        ],
      ),
    );
  }
}
