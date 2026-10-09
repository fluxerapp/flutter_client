import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/composer/composer_input_field.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/services/composer_mention_controller.dart';
import 'package:fluxer_app/features/chat/services/composer_slash_session.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/test_l10n.dart';

class _ComposerInputFieldHarness extends ConsumerStatefulWidget {
  const _ComposerInputFieldHarness({
    required this.focusNode,
    required this.scrollController,
    required this.slashSession,
    required this.showCounter,
  });

  final FocusNode focusNode;
  final ScrollController scrollController;
  final ComposerSlashSession slashSession;
  final ValueNotifier<bool> showCounter;

  @override
  ConsumerState<_ComposerInputFieldHarness> createState() =>
      _ComposerInputFieldHarnessState();
}

class _ComposerInputFieldHarnessState
    extends ConsumerState<_ComposerInputFieldHarness> {
  ComposerMentionController? _controller;

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller ??= ComposerMentionController(ref: ref);
    return ComposerInputField(
      channelId: 'test-channel',
      controller: _controller!,
      focusNode: widget.focusNode,
      composerScrollController: widget.scrollController,
      composerFieldKey: GlobalKey(),
      slashSession: widget.slashSession,
      perms: ChannelMessagePermissions.all,
      maxMessageLength: 2000,
      premiumMaxLength: 4000,
      decoration: const InputDecoration(hintText: 'Message'),
      minLines: 1,
      maxLines: 6,
      enterSends: false,
      showComposerCounter: widget.showCounter,
      sendableWireLength: 0,
      hintSemanticsLabel: 'Message',
      onSendPressed: () {},
      onComposerFieldTap: () {},
      onPasteExceedsLimit: (_) {},
      onPasteLostContent: () {},
      onValidationResult: (_) {},
      onUpgradePressed: () {},
    );
  }
}

void main() {
  testWidgets('ComposerInputField exposes channel composer TextField', (
    tester,
  ) async {
    final FluxerColorTheme colorTheme = buildDarkColorTheme();
    final FocusNode focusNode = FocusNode();
    final ScrollController scrollController = ScrollController();
    final ComposerSlashSession slashSession = ComposerSlashSession();
    final ValueNotifier<bool> showCounter = ValueNotifier<bool>(false);
    addTearDown(() {
      focusNode.dispose();
      scrollController.dispose();
      slashSession.dispose();
      showCounter.dispose();
    });

    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          locale: kTestLocale,
          localizationsDelegates: fluxerLocalizationsDelegates,
          supportedLocales: FluxerLocalizations.supportedLocales,
          theme: buildFluxerTheme(
            colorTheme: colorTheme,
            textTheme: FluxerTextTheme.fromColors(colorTheme),
            layoutTheme: FluxerLayoutTheme.scaled(),
          ),
          home: Scaffold(
            body: _ComposerInputFieldHarness(
              focusNode: focusNode,
              scrollController: scrollController,
              slashSession: slashSession,
              showCounter: showCounter,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();

    expect(
      find.byKey(const ValueKey<String>('channel-composer-field')),
      findsOneWidget,
    );
  });
}
