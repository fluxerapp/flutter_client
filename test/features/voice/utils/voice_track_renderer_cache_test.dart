import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/voice/utils/voice_track_renderer_cache.dart';

void main() {
  VoiceTrackRendererCache<Object> cache({
    required List<Object> created,
    required List<Object> destroyed,
  }) {
    return VoiceTrackRendererCache<Object>(
      create: () async {
        final Object renderer = Object();
        created.add(renderer);
        return renderer;
      },
      dispose: (Object renderer) async {
        destroyed.add(renderer);
      },
    );
  }

  void tick(FakeAsync async, [Duration duration = Duration.zero]) {
    async
      ..elapse(duration)
      ..flushMicrotasks();
  }

  group('VoiceTrackRendererCache', () {
    test('reuses a renderer released inside the grace period', () {
      fakeAsync((FakeAsync async) {
        final List<Object> created = <Object>[];
        final List<Object> destroyed = <Object>[];
        final VoiceTrackRendererCache<Object> renderers = cache(
          created: created,
          destroyed: destroyed,
        );
        late final Object first;
        unawaited(
          renderers.retain('screen').then((Object value) => first = value),
        );
        tick(async);

        renderers.release('screen');
        tick(async, const Duration(milliseconds: 200));
        late final Object second;
        unawaited(
          renderers.retain('screen').then((Object value) => second = value),
        );
        tick(async, kVoiceTrackHandoffGrace);

        expect(identical(first, second), isTrue);
        expect(created, hasLength(1));
        expect(destroyed, isEmpty);
      });
    });

    test('destroys a renderer once the grace period ends', () {
      fakeAsync((FakeAsync async) {
        final List<Object> created = <Object>[];
        final List<Object> destroyed = <Object>[];
        final VoiceTrackRendererCache<Object> renderers = cache(
          created: created,
          destroyed: destroyed,
        );
        unawaited(renderers.retain('screen'));
        tick(async);
        renderers.release('screen');

        tick(async, kVoiceTrackHandoffGrace - const Duration(milliseconds: 1));
        expect(destroyed, isEmpty);

        tick(async, const Duration(milliseconds: 1));
        expect(destroyed, <Object>[created.single]);

        tick(async, kVoiceTrackHandoffGrace);
        expect(destroyed, hasLength(1));
      });
    });

    test('shares one renderer across overlapping retains', () {
      fakeAsync((FakeAsync async) {
        final List<Object> created = <Object>[];
        final List<Object> destroyed = <Object>[];
        final VoiceTrackRendererCache<Object> renderers = cache(
          created: created,
          destroyed: destroyed,
        );
        late final Object first;
        late final Object second;
        unawaited(
          renderers.retain('screen').then((Object value) => first = value),
        );
        unawaited(
          renderers.retain('screen').then((Object value) => second = value),
        );
        tick(async);
        renderers.release('screen');
        tick(async, kVoiceTrackHandoffGrace);

        expect(identical(first, second), isTrue);
        expect(created, hasLength(1));
        expect(destroyed, isEmpty);
      });
    });

    test('ending the session disposes idle renderers immediately', () {
      fakeAsync((FakeAsync async) {
        final List<Object> created = <Object>[];
        final List<Object> destroyed = <Object>[];
        final VoiceTrackRendererCache<Object> renderers = cache(
          created: created,
          destroyed: destroyed,
        );
        unawaited(renderers.retain('screen'));
        tick(async);
        renderers
          ..release('screen')
          ..markSessionEnded();
        tick(async);

        expect(destroyed, <Object>[created.single]);

        tick(async, kVoiceTrackHandoffGrace);
        expect(destroyed, hasLength(1));
      });
    });

    test('drain completes after session-ended destroys', () {
      fakeAsync((FakeAsync async) {
        final List<Object> created = <Object>[];
        final List<Object> destroyed = <Object>[];
        final VoiceTrackRendererCache<Object> renderers = cache(
          created: created,
          destroyed: destroyed,
        );
        unawaited(renderers.retain('screen'));
        tick(async);
        renderers
          ..release('screen')
          ..markSessionEnded();
        var drained = false;
        unawaited(renderers.drain().then((_) => drained = true));
        tick(async);
        expect(drained, isTrue);
        expect(destroyed, <Object>[created.single]);
      });
    });

    test('ending the session keeps a held renderer until it is released', () {
      fakeAsync((FakeAsync async) {
        final List<Object> created = <Object>[];
        final List<Object> destroyed = <Object>[];
        final VoiceTrackRendererCache<Object> renderers = cache(
          created: created,
          destroyed: destroyed,
        );
        unawaited(renderers.retain('screen'));
        tick(async);
        renderers.markSessionEnded();
        tick(async);
        expect(destroyed, isEmpty);

        renderers.release('screen');
        tick(async);
        expect(destroyed, <Object>[created.single]);
      });
    });
  });
}
