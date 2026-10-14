import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStorePanel extends StatelessWidget {
  const PremiumStorePanel({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(decoration: PremiumStoreStyle.of(context).panel),
        ),
        Positioned(
          top: -1,
          left: 24,
          right: 24,
          child: Container(
            height: 1,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0x00B0ADFF),
                  Color(0xB3B0ADFF),
                  Color(0xB3817CFF),
                  Color(0x00B0ADFF),
                ],
                stops: [0, 0.2, 0.7, 1],
              ),
            ),
          ),
        ),
        child,
      ],
    );
  }
}
