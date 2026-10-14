import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/dm/data/dm_repository.dart';
import 'package:fluxer_app/features/dm/presentation/menus/group_dm_member_context_menu.dart';
import 'package:fluxer_app/features/dm/providers/dm_providers.dart';
import 'package:fluxer_app/features/ui/toast/toast_provider.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/pump_fluxer_app.dart';

class _RecordingDmRepository implements DmRepository {
  final List<(String, String)> removed = <(String, String)>[];
  Exception? failWith;

  @override
  Future<void> removeGroupDmMember({
    required String channelId,
    required String userId,
  }) async {
    removed.add((channelId, userId));
    final Exception? error = failWith;
    if (error != null) {
      throw error;
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

Future<ProviderContainer> _openMenu(
  WidgetTester tester, {
  required _RecordingDmRepository repository,
  required String currentUserId,
  required String memberId,
}) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
  await tester.pumpWidget(
    pumpFluxerApp(
      overrides: [
        currentUserIdProvider.overrideWithValue(currentUserId),
        dmRepositoryProvider.overrideWithValue(repository),
      ],
      child: Scaffold(
        body: Consumer(
          builder: (context, ref, _) => TextButton(
            onPressed: () => unawaited(
              GroupDmMemberContextMenu.show(
                context,
                ref,
                position: const Offset(100, 100),
                channelId: 'group-1',
                ownerId: 'owner',
                userId: memberId,
                displayName: 'Bob',
              ),
            ),
            child: const Text('open'),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('open'));
  await pumpFluxerFrames(tester);
  return ProviderScope.containerOf(tester.element(find.text('open')));
}

void main() {
  testWidgets('owner removes another member after confirming', (tester) async {
    final _RecordingDmRepository repository = _RecordingDmRepository();
    final ProviderContainer container = await _openMenu(
      tester,
      repository: repository,
      currentUserId: 'owner',
      memberId: 'bob',
    );

    await tester.tap(find.text('Remove from group'));
    await pumpFluxerFrames(tester);
    expect(find.text('Remove Bob from the group?'), findsOneWidget);
    expect(repository.removed, isEmpty);

    await tester.tap(find.text('Remove'));
    await pumpFluxerFrames(tester);

    expect(repository.removed, <(String, String)>[('group-1', 'bob')]);
    expect(
      container.read(toastProvider).map((e) => e.toast.message),
      contains('Removed from group'),
    );
  });

  testWidgets('failed removal tells the owner the member is still there', (
    tester,
  ) async {
    final _RecordingDmRepository repository = _RecordingDmRepository()
      ..failWith = Exception('boom');
    final ProviderContainer container = await _openMenu(
      tester,
      repository: repository,
      currentUserId: 'owner',
      memberId: 'bob',
    );

    await tester.tap(find.text('Remove from group'));
    await pumpFluxerFrames(tester);
    await tester.tap(find.text('Remove'));
    await pumpFluxerFrames(tester);

    expect(
      container.read(toastProvider).map((e) => e.toast.message),
      contains('Bob is still in the group. Try again in a moment.'),
    );
  });

  testWidgets('non-owners do not see remove from group', (tester) async {
    await _openMenu(
      tester,
      repository: _RecordingDmRepository(),
      currentUserId: 'member',
      memberId: 'bob',
    );

    expect(find.text('Copy user ID'), findsOneWidget);
    expect(find.text('Remove from group'), findsNothing);
  });

  testWidgets('the owner cannot remove themself', (tester) async {
    await _openMenu(
      tester,
      repository: _RecordingDmRepository(),
      currentUserId: 'owner',
      memberId: 'owner',
    );

    expect(find.text('Remove from group'), findsNothing);
  });
}
