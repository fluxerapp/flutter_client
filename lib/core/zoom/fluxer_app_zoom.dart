import 'dart:async';
import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

const String _kTextInputChannel = 'flutter/textinput';
const String _kPlatformChannel = 'flutter/platform';
const MethodCodec _kJsonMethodCodec = JSONMethodCodec();
const double kMinZoomedShortestSide = 360;

class FluxerAppZoom {
  FluxerAppZoom._();

  static final ValueNotifier<double> factor = ValueNotifier<double>(1);

  static double maxZoomFor(Size logicalSize, TargetPlatform platform) {
    if (platform != TargetPlatform.iOS && platform != TargetPlatform.android) {
      return double.infinity;
    }
    return math.max(1, logicalSize.shortestSide / kMinZoomedShortestSide);
  }

  static double maxZoomOfView(ui.FlutterView view) => maxZoomFor(
    view.physicalSize / view.devicePixelRatio,
    defaultTargetPlatform,
  );

  static void apply(double requested) {
    if (!requested.isFinite || requested <= 0) {
      return;
    }
    final ui.FlutterView? view =
        WidgetsBinding.instance.platformDispatcher.implicitView;
    final double zoom = view == null
        ? requested
        : math.min(requested, maxZoomOfView(view));
    if (zoom == factor.value) {
      return;
    }
    factor.value = zoom;
    final WidgetsBinding binding = WidgetsBinding.instance;
    if (binding is FluxerAppZoomBinding) {
      binding.applyZoom();
    }
  }

  static MediaQueryData scaleMediaQuery(MediaQueryData data, double zoom) {
    if (zoom == 1) {
      return data;
    }
    return data.copyWith(
      size: data.size / zoom,
      devicePixelRatio: data.devicePixelRatio * zoom,
      padding: data.padding / zoom,
      viewInsets: data.viewInsets / zoom,
      viewPadding: data.viewPadding / zoom,
      systemGestureInsets: data.systemGestureInsets / zoom,
      displayFeatures: <ui.DisplayFeature>[
        for (final ui.DisplayFeature feature in data.displayFeatures)
          ui.DisplayFeature(
            bounds: Rect.fromLTRB(
              feature.bounds.left / zoom,
              feature.bounds.top / zoom,
              feature.bounds.right / zoom,
              feature.bounds.bottom / zoom,
            ),
            type: feature.type,
            state: feature.state,
          ),
      ],
    );
  }

  static MediaQueryData mediaQueryOfView(BuildContext context) =>
      scaleMediaQuery(MediaQueryData.fromView(View.of(context)), factor.value);
}

class FluxerAppZoomBinding extends WidgetsFlutterBinding {
  static WidgetsBinding ensureInitialized() {
    FluxerAppZoomBinding();
    return WidgetsBinding.instance;
  }

  double get _zoom => FluxerAppZoom.factor.value;

  void applyZoom() {
    handleMetricsChanged();
  }

  @override
  ViewConfiguration createViewConfigurationFor(RenderView renderView) =>
      zoomViewConfiguration(
        super.createViewConfigurationFor(renderView),
        _zoom,
      );

  @override
  void handlePointerEvent(PointerEvent event) {
    final double zoom = _zoom;
    super.handlePointerEvent(
      zoom == 1 ? event : scalePointerEventForZoom(event, zoom),
    );
  }

  @override
  BinaryMessenger createBinaryMessenger() =>
      _ZoomBinaryMessenger(super.createBinaryMessenger(), () => _zoom);
}

@visibleForTesting
ViewConfiguration zoomViewConfiguration(ViewConfiguration base, double zoom) {
  if (zoom == 1) {
    return base;
  }
  final double devicePixelRatio = base.devicePixelRatio * zoom;
  return ViewConfiguration(
    physicalConstraints: base.physicalConstraints,
    logicalConstraints: base.physicalConstraints / devicePixelRatio,
    devicePixelRatio: devicePixelRatio,
  );
}

@visibleForTesting
PointerEvent scalePointerEventForZoom(PointerEvent event, double zoom) {
  final Offset position = event.position / zoom;
  final Offset delta = event.delta / zoom;
  return switch (event) {
    PointerScrollEvent() => PointerScrollEvent(
      viewId: event.viewId,
      timeStamp: event.timeStamp,
      kind: event.kind,
      device: event.device,
      position: position,
      scrollDelta: event.scrollDelta / zoom,
      embedderId: event.embedderId,
      onRespond: event.respond,
    ),
    PointerPanZoomUpdateEvent() => event.copyWith(
      position: position,
      delta: delta,
      pan: event.pan / zoom,
      localPan: event.pan / zoom,
      panDelta: event.panDelta / zoom,
      localPanDelta: event.panDelta / zoom,
    ),
    _ => event.copyWith(position: position, delta: delta),
  };
}

class _ZoomBinaryMessenger extends BinaryMessenger {
  _ZoomBinaryMessenger(this._inner, this._zoom);

  final BinaryMessenger _inner;
  final double Function() _zoom;

  @override
  Future<void> handlePlatformMessage(
    String channel,
    ByteData? data,
    ui.PlatformMessageResponseCallback? callback,
  ) async {
    ui.channelBuffers.push(
      channel,
      data,
      (ByteData? reply) => callback?.call(reply),
    );
  }

  @override
  Future<ByteData?>? send(String channel, ByteData? message) {
    final double zoom = _zoom();
    if (zoom == 1 ||
        message == null ||
        (channel != _kTextInputChannel && channel != _kPlatformChannel)) {
      return _inner.send(channel, message);
    }
    return _inner.send(
      channel,
      scaleOutgoingPlatformMessageForZoom(message, zoom),
    );
  }

  @override
  void setMessageHandler(String channel, MessageHandler? handler) {
    if (handler == null || channel != _kTextInputChannel) {
      _inner.setMessageHandler(channel, handler);
      return;
    }
    _inner.setMessageHandler(channel, (ByteData? message) async {
      final double zoom = _zoom();
      if (zoom == 1 || message == null) {
        return handler(message);
      }
      final MethodCall call = _kJsonMethodCodec.decodeMethodCall(message);
      final ByteData? reply = await handler(
        _kJsonMethodCodec.encodeMethodCall(
          scaleIncomingTextInputCallForZoom(call, zoom),
        ),
      );
      if (reply == null ||
          call.method != 'TextInputClient.requestElementsInRect') {
        return reply;
      }
      final Object? elements = _kJsonMethodCodec.decodeEnvelope(reply);
      return _kJsonMethodCodec.encodeSuccessEnvelope(<Object?>[
        for (final Object? element in elements! as List<Object?>)
          <Object?>[
            for (final (int index, Object? value)
                in (element! as List<Object?>).indexed)
              if (index == 0) value else (value! as num) * zoom,
          ],
      ]);
    });
  }
}

@visibleForTesting
ByteData scaleOutgoingPlatformMessageForZoom(ByteData message, double zoom) {
  final MethodCall call = _kJsonMethodCodec.decodeMethodCall(message);
  final Object? arguments = call.arguments;
  final Object? scaled = switch (call.method) {
    'TextInput.setEditableSizeAndTransform' => <String, Object?>{
      ...arguments! as Map<String, Object?>,
      'transform': <num>[
        for (final (int index, Object? value)
            in ((arguments as Map<String, Object?>)['transform']!
                    as List<Object?>)
                .indexed)
          if (index % 4 < 2) (value! as num) * zoom else value! as num,
      ],
    },
    'TextInput.setStyle' => <String, Object?>{
      ...arguments! as Map<String, Object?>,
      'fontSize': switch ((arguments as Map<String, Object?>)['fontSize']) {
        final num size => size * zoom,
        _ => null,
      },
    },
    'ContextMenu.showSystemContextMenu' => <String, Object?>{
      ...arguments! as Map<String, Object?>,
      'targetRect': <String, num>{
        for (final MapEntry<String, Object?> entry
            in ((arguments as Map<String, Object?>)['targetRect']!
                    as Map<String, Object?>)
                .entries)
          entry.key: (entry.value! as num) * zoom,
      },
    },
    _ => arguments,
  };
  if (identical(scaled, arguments)) {
    return message;
  }
  return _kJsonMethodCodec.encodeMethodCall(MethodCall(call.method, scaled));
}

@visibleForTesting
MethodCall scaleIncomingTextInputCallForZoom(MethodCall call, double zoom) {
  final Object? arguments = call.arguments;
  final Object? scaled = switch (call.method) {
    'TextInputClient.focusElement' ||
    'TextInputClient.insertTextPlaceholder' => <Object?>[
      for (final (int index, Object? value)
          in (arguments! as List<Object?>).indexed)
        if (index == 0) value else (value! as num) / zoom,
    ],
    'TextInputClient.requestElementsInRect' => <Object?>[
      for (final Object? value in arguments! as List<Object?>)
        (value! as num) / zoom,
    ],
    'TextInputClient.updateFloatingCursor' => <Object?>[
      for (final (int index, Object? value)
          in (arguments! as List<Object?>).indexed)
        if (index == 2)
          <String, Object?>{
            ...value! as Map<String, Object?>,
            for (final String axis in const <String>['X', 'Y'])
              if ((value as Map<String, Object?>)[axis] case final num v)
                axis: v / zoom,
          }
        else
          value,
    ],
    _ => arguments,
  };
  return identical(scaled, arguments) ? call : MethodCall(call.method, scaled);
}

class FluxerAppZoomScope extends StatelessWidget {
  const FluxerAppZoomScope({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: FluxerAppZoom.factor,
      child: child,
      builder: (BuildContext context, double zoom, Widget? child) => MediaQuery(
        data: FluxerAppZoom.scaleMediaQuery(MediaQuery.of(context), zoom),
        child: child!,
      ),
    );
  }
}
