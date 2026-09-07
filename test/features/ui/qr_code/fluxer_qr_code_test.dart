import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/ui/qr_code/fluxer_qr_code.dart';
import 'package:fluxer_app/material_ui.dart';

void main() {
  testWidgets('renders a square QR of the requested size', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: FluxerQrCode(
            data: 'otpauth://totp/Fluxer:alice?secret=ABCDEF&issuer=Fluxer',
            size: 160,
          ),
        ),
      ),
    );

    expect(find.byType(CustomPaint), findsOneWidget);
    expect(tester.getSize(find.byType(FluxerQrCode)), const Size(160, 160));
  });

  testWidgets('exposes a semantic image label when provided', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FluxerQrCode(
          data: 'otpauth://totp/Fluxer:alice?secret=ABCDEF&issuer=Fluxer',
          semanticLabel: 'Scan the QR code',
        ),
      ),
    );

    expect(find.bySemanticsLabel('Scan the QR code'), findsOneWidget);
  });
}
