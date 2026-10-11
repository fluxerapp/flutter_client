import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_loader.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/quick_reaction_row.dart';
import 'package:fluxer_app/features/chat/providers/pickers/emoji_picker_provider.dart';
import 'package:fluxer_app/shared/utils/emoji_registry.dart';

String _surrogates(String name) => EmojiRegistry.entryByName(name)!.surrogates;

List<String> _describe(List<QuickReactionItem> items) => [
  for (final item in items)
    switch (item) {
      UnicodeQuickReaction(:final emoji) => emoji,
      CustomQuickReaction(:final emoji) => 'custom:${emoji.id}',
    },
];

Future<List<QuickReactionItem>> _resolve(
  List<String> keys, {
  Map<String, GuildEmojiEntry> custom = const {},
  bool Function(GuildEmojiEntry emoji)? canUse,
}) => resolveQuickReactionItems(
  rankedUsageKeys: keys,
  loadCustomEmoji: (id) async => custom[id],
  canUseCustomEmoji: canUse ?? (_) => true,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(EmojiRegistry.preload);

  test('uses the synced frecency order like web', () async {
    expect(
      _describe(
        await _resolve([
          'unicode:sweat_smile',
          'unicode:sob',
          'unicode:rofl',
          'unicode:heart_eyes',
          'unicode:fire',
        ]),
      ),
      [
        _surrogates('sweat_smile'),
        _surrogates('sob'),
        _surrogates('rofl'),
        _surrogates('heart_eyes'),
      ],
    );
  });

  test('pads with web defaults when there is no usage', () async {
    expect(_describe(await _resolve(const [])), [
      _surrogates('thumbsup'),
      _surrogates('ok_hand'),
      _surrogates('tada'),
      _surrogates('heart'),
    ]);
  });

  test('scans past unusable custom emoji instead of padding early', () async {
    final keys = <String>[
      for (var i = 0; i < 20; i++) 'custom:other:$i',
      'unicode:fire',
      'custom:mine:x',
    ];
    final items = await _resolve(
      keys,
      custom: {
        for (var i = 0; i < 20; i++)
          '$i': GuildEmojiEntry(
            id: '$i',
            name: 'e$i',
            animated: false,
            guildId: 'other',
          ),
        'x': GuildEmojiEntry(
          id: 'x',
          name: 'mine',
          animated: false,
          guildId: 'mine',
        ),
      },
      canUse: (emoji) => emoji.guildId == 'mine',
    );
    expect(_describe(items), [
      _surrogates('fire'),
      'custom:x',
      _surrogates('thumbsup'),
      _surrogates('ok_hand'),
    ]);
  });

  test('takes only the first needed defaults, as web does', () async {
    expect(
      _describe(
        await _resolve(['unicode:thumbsup', 'unicode:fire', 'unicode:sob']),
      ),
      [_surrogates('thumbsup'), _surrogates('fire'), _surrogates('sob')],
    );
  });
}
