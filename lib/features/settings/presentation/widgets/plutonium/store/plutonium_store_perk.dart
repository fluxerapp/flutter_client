import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_panel.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/plutonium/store/plutonium_store_style.dart';
import 'package:fluxer_app/material_ui.dart';

class PremiumStorePerk extends StatelessWidget {
  const PremiumStorePerk({
    required this.asset,
    required this.title,
    required this.body,
    required this.imageFirst,
    super.key,
  });

  final String asset;
  final String title;
  final String body;
  final bool imageFirst;

  @override
  Widget build(BuildContext context) {
    return PremiumStorePanel(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final bool wide = constraints.maxWidth >= 560;
            final Widget art = Image.asset(
              asset,
              fit: BoxFit.contain,
              excludeFromSemantics: true,
            );
            final Widget copy = _PerkCopy(title: title, body: body);
            if (!wide) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [art, const SizedBox(height: 20), copy],
              );
            }
            final Widget leading = imageFirst ? art : copy;
            final Widget trailing = imageFirst ? copy : art;
            final int leadingFlex = imageFirst ? 7 : 5;
            final int trailingFlex = imageFirst ? 5 : 7;
            return Row(
              children: [
                Expanded(flex: leadingFlex, child: leading),
                const SizedBox(width: 28),
                Expanded(flex: trailingFlex, child: trailing),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _PerkCopy extends StatelessWidget {
  const _PerkCopy({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: textStyles.heading.copyWith(color: PremiumStoreStyle.ink),
        ),
        const SizedBox(height: 10),
        Text(
          body,
          style: textStyles.bodyMedium.copyWith(
            color: PremiumStoreStyle.inkSoft,
          ),
        ),
      ],
    );
  }
}
