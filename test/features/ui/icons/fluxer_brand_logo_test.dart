import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/icons/fluxer_brand_logo.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../helpers/pump_fluxer_app.dart';

void main() {
  testWidgets('excludes the brand mark from semantics', (tester) async {
    final SemanticsHandle handle = tester.ensureSemantics();

    await tester.pumpWidget(
      pumpFluxerApp(child: const FluxerBrandLogo(size: 48)),
    );

    expect(find.byType(ExcludeSemantics), findsWidgets);
    expect(find.byType(SvgPicture), findsOneWidget);
    handle.dispose();
  });
}
