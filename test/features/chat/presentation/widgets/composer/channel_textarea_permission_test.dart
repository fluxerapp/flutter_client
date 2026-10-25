import 'package:flutter/material.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';

import '../../../../../helpers/composer_channel_textarea_harness.dart';
import '../../../../../helpers/open_test_database.dart';

final StateProvider<ChannelMessagePermissions> _permissions =
    StateProvider<ChannelMessagePermissions>(
      (_) => ChannelMessagePermissions.all,
    );

void main() {
  testWidgets('permissions going pending keep the typed draft', (tester) async {
    final container = await pumpComposerChannelTextareaHarness(
      tester,
      guildChannelPermissionsOf: (ref) => ref.watch(_permissions),
    );
    await tester.enterText(channelComposerField(), 'keep me');
    await tester.pump(const Duration(milliseconds: 50));

    container.read(_permissions.notifier).state =
        ChannelMessagePermissions.unresolved;
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    expect(readMutableChatViewModel(container).state.messageText, 'keep me');
    FocusManager.instance.primaryFocus?.unfocus();
    await tester.pump(const Duration(milliseconds: 400));
    await releaseTestWidgetTree(tester);
  });
}
