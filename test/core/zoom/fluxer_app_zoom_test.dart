import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/zoom/fluxer_app_zoom.dart';
import 'package:fluxer_app/material_ui.dart';

const MethodCodec _codec = JSONMethodCodec();

void main() {
  tearDown(() => FluxerAppZoom.factor.value = 1);

  test('zoom shrinks the logical surface and raises the pixel ratio', () {
    const ViewConfiguration base = ViewConfiguration(
      physicalConstraints: BoxConstraints.tightFor(width: 1206, height: 2622),
      logicalConstraints: BoxConstraints.tightFor(width: 402, height: 874),
      devicePixelRatio: 3,
    );

    final ViewConfiguration zoomed = zoomViewConfiguration(base, 1.5);

    expect(zoomed.devicePixelRatio, 4.5);
    expect(zoomed.logicalConstraints.maxWidth, moreOrLessEquals(268));
    expect(zoomed.physicalConstraints, base.physicalConstraints);
    expect(identical(zoomViewConfiguration(base, 1), base), isTrue);
  });

  test('pointer positions land in zoomed logical pixels', () {
    final PointerEvent down = scalePointerEventForZoom(
      const PointerDownEvent(position: Offset(300, 600)),
      1.5,
    );
    final PointerEvent move = scalePointerEventForZoom(
      const PointerMoveEvent(position: Offset(300, 600), delta: Offset(30, 6)),
      1.5,
    );
    final PointerEvent scroll = scalePointerEventForZoom(
      const PointerScrollEvent(
        position: Offset(150, 300),
        scrollDelta: Offset(0, 90),
      ),
      1.5,
    );

    expect(down, isA<PointerDownEvent>());
    expect(down.position, const Offset(200, 400));
    expect(down.localPosition, const Offset(200, 400));
    expect(move.delta, const Offset(20, 4));
    expect((scroll as PointerScrollEvent).scrollDelta, const Offset(0, 60));
    expect(scroll.position, const Offset(100, 200));
  });

  test('editable transforms and menu anchors are sent in device points', () {
    final Matrix4 transform = Matrix4.translationValues(10, 20, 0);
    final ByteData scaled = scaleOutgoingPlatformMessageForZoom(
      _codec.encodeMethodCall(
        MethodCall('TextInput.setEditableSizeAndTransform', <String, Object?>{
          'width': 100.0,
          'height': 40.0,
          'transform': transform.storage.toList(),
        }),
      ),
      2,
    );
    final MethodCall call = _codec.decodeMethodCall(scaled);
    final Matrix4 sent = Matrix4.fromList(
      ((call.arguments as Map<String, Object?>)['transform']! as List<Object?>)
          .map((Object? value) => (value! as num).toDouble())
          .toList(),
    );
    expect(MatrixUtils.transformPoint(sent, Offset.zero), const Offset(20, 40));
    expect(
      MatrixUtils.transformPoint(sent, const Offset(100, 40)),
      const Offset(220, 120),
    );

    final MethodCall menu = _codec.decodeMethodCall(
      scaleOutgoingPlatformMessageForZoom(
        _codec.encodeMethodCall(
          const MethodCall(
            'ContextMenu.showSystemContextMenu',
            <String, Object?>{
              'targetRect': <String, double>{
                'x': 5,
                'y': 6,
                'width': 7,
                'height': 8,
              },
            },
          ),
        ),
        2,
      ),
    );
    expect(
      (menu.arguments as Map<String, Object?>)['targetRect'],
      <String, num>{'x': 10, 'y': 12, 'width': 14, 'height': 16},
    );
  });

  test('floating cursor offsets arrive in zoomed logical pixels', () {
    final MethodCall call = scaleIncomingTextInputCallForZoom(
      const MethodCall('TextInputClient.updateFloatingCursor', <Object?>[
        1,
        'FloatingCursorDragState.update',
        <String, Object?>{'X': 30, 'Y': 60},
      ]),
      1.5,
    );
    expect((call.arguments as List<Object?>)[2], <String, Object?>{
      'X': 20,
      'Y': 40,
    });
  });

  testWidgets('phones cap zoom so the narrow side stays 360 points', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1206, 2622);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
    FluxerAppZoom.apply(2);
    debugDefaultTargetPlatformOverride = null;

    expect(FluxerAppZoom.factor.value, moreOrLessEquals(402 / 360));
    expect(
      FluxerAppZoom.maxZoomFor(const Size(1280, 800), TargetPlatform.macOS),
      double.infinity,
    );
    expect(
      FluxerAppZoom.maxZoomFor(const Size(300, 600), TargetPlatform.android),
      1,
    );
  });

  testWidgets('the zoom scope scales text and elements together', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(1200, 2400);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    late MediaQueryData data;
    FluxerAppZoom.factor.value = 2;

    await tester.pumpWidget(
      FluxerAppZoomScope(
        child: Builder(
          builder: (BuildContext context) {
            data = MediaQuery.of(context);
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(data.size, const Size(200, 400));
    expect(data.devicePixelRatio, 6);
    expect(data.textScaler, MediaQueryData.fromView(tester.view).textScaler);
  });
}
