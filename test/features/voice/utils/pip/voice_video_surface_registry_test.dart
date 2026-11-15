import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/pip/voice_video_surface_registry.dart';

class _Surface implements VoiceVideoSurface {
  _Surface(this.globalRect, [this.videoSize]);

  @override
  Rect? globalRect;

  @override
  Size? videoSize;
}

void main() {
  final VoiceVideoSurfaceRegistry registry = VoiceVideoSurfaceRegistry.instance;

  tearDown(registry.debugClear);

  test('picks the largest surface and fits the video inside it', () {
    registry
      ..add('t', _Surface(const Rect.fromLTWH(0, 0, 100, 100)))
      ..add(
        't',
        _Surface(const Rect.fromLTWH(0, 100, 400, 400), const Size(1600, 900)),
      );

    final VoiceVideoSurfaceInfo info = registry.lookup('t')!;
    expect(info.videoSize, const Size(1600, 900));
    expect(info.rect, const Rect.fromLTWH(0, 187.5, 400, 225));
  });

  test('missing keys and detached surfaces', () {
    expect(registry.lookup('none'), isNull);
    registry.add('t', _Surface(null));
    expect(registry.lookup('t')!.rect, isNull);
  });

  test('listeners receive only changed keys', () {
    final List<String> changed = <String>[];
    registry.addListener(changed.add);
    final _Surface surface = _Surface(Rect.zero);
    registry
      ..add('a', surface)
      ..add('a', surface)
      ..markChanged('b')
      ..remove('a', surface)
      ..remove('a', surface);
    expect(changed, <String>['a', 'b', 'a']);
  });
}
