import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/presentation/widgets/guild_drag_wrapper.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

class _TouchInput extends InputModalityNotifier {
  @override
  bool build() => true;
}

class _RailRevision extends Notifier<int> {
  @override
  int build() => 0;

  void bump() => state++;
}

final _railRevisionProvider = NotifierProvider<_RailRevision, int>(
  _RailRevision.new,
);

final _railReadProvider = Provider<int>((Ref ref) => 1);

class _RailWork {
  int listenerCalls = 0;
  int postFrameReads = 0;
  int disposed = 0;
}

class _RailConsumer extends ConsumerStatefulWidget {
  const _RailConsumer({required this.work});

  final _RailWork work;

  @override
  ConsumerState<_RailConsumer> createState() => _RailConsumerState();
}

class _RailConsumerState extends ConsumerState<_RailConsumer> {
  @override
  void dispose() {
    widget.work.disposed++;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<int>(_railRevisionProvider, (int? previous, int next) {
      widget.work.listenerCalls++;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) {
          return;
        }
        ref.read(_railReadProvider);
        widget.work.postFrameReads++;
      });
    });
    return const SizedBox(width: 72, height: 48);
  }
}

Widget _rail({required ProviderContainer container, required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

Widget _guildItem(String id) {
  return GuildDragWrapper(
    key: ValueKey<String>('guild-$id'),
    itemId: id,
    isFolder: false,
    dragFeedback: GuildDragFeedback(label: id),
    child: const SizedBox(width: 48, height: 48),
  );
}

void main() {
  testWidgets(
    'removing the guild rail after a touch reorder unmounts every item',
    (WidgetTester tester) async {
      final ProviderContainer container = ProviderContainer(
        overrides: [inputModalityProvider.overrideWith(_TouchInput.new)],
      );
      addTearDown(container.dispose);
      final _RailWork work = _RailWork();

      await tester.pumpWidget(
        _rail(
          container: container,
          child: ListView(
            children: <Widget>[
              _guildItem('1'),
              _guildItem('2'),
              _RailConsumer(work: work),
            ],
          ),
        ),
      );

      final TestGesture gesture = await tester.startGesture(
        tester.getCenter(find.byKey(const ValueKey<String>('guild-1'))),
      );
      await tester.pump(const Duration(milliseconds: 600));
      for (var i = 0; i < 10; i++) {
        await gesture.moveBy(const Offset(0, 8));
        await tester.pump(const Duration(milliseconds: 16));
      }
      await gesture.up();
      await tester.pump(const Duration(seconds: 1));

      await tester.pumpWidget(
        _rail(container: container, child: const SizedBox()),
      );

      expect(tester.takeException(), isNull);
      expect(work.disposed, 1);
    },
  );

  testWidgets('a removed guild rail does no work on later frames', (
    WidgetTester tester,
  ) async {
    final ProviderContainer container = ProviderContainer(
      overrides: [inputModalityProvider.overrideWith(_TouchInput.new)],
    );
    addTearDown(container.dispose);
    final _RailWork work = _RailWork();

    await tester.pumpWidget(
      _rail(
        container: container,
        child: Column(
          children: <Widget>[
            _guildItem('1'),
            _guildItem('2'),
            _RailConsumer(work: work),
          ],
        ),
      ),
    );
    container.read(_railRevisionProvider.notifier).bump();
    await tester.pump();
    expect(work.listenerCalls, 1);
    expect(work.postFrameReads, 1);

    await tester.pumpWidget(
      _rail(container: container, child: const SizedBox()),
    );
    final Object? removalError = tester.takeException();
    final int listenerCallsAtRemoval = work.listenerCalls;
    final int readsAtRemoval = work.postFrameReads;

    for (var i = 0; i < 60; i++) {
      container.read(_railRevisionProvider.notifier).bump();
      await tester.pump(const Duration(milliseconds: 16));
    }
    for (var i = 0; i < 60; i++) {
      await tester.pump(const Duration(milliseconds: 16));
    }

    final Object? idleError = tester.takeException();
    expect(work.listenerCalls, listenerCallsAtRemoval);
    expect(work.postFrameReads, readsAtRemoval);
    expect(removalError, isNull);
    expect(idleError, isNull);
    expect(tester.binding.hasScheduledFrame, isFalse);
    expect(tester.binding.transientCallbackCount, 0);
  });
}
