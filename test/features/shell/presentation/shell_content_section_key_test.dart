import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/shell/presentation/desktop_shell_scaffold.dart';

void main() {
  test('channels within a guild share a section', () {
    expect(
      shellContentSectionKey('/channels/guild-1/channel-1'),
      shellContentSectionKey('/channels/guild-1/channel-2'),
    );
    expect(
      shellContentSectionKey('/channels/guild-1/members'),
      '/channels/guild-1',
    );
    expect(shellContentSectionKey('/channels/guild-1'), '/channels/guild-1');
  });

  test('different guilds and home sections stay distinct', () {
    expect(
      shellContentSectionKey('/channels/guild-1/channel-1'),
      isNot(shellContentSectionKey('/channels/guild-2/channel-1')),
    );
    expect(shellContentSectionKey('/channels/@me/dm-1'), '/channels/@me');
    expect(shellContentSectionKey('/channels/@me/dm-2/call'), '/channels/@me');
    expect(
      shellContentSectionKey('/channels/@favorites/channel-1'),
      '/channels/@favorites',
    );
    expect(
      shellContentSectionKey('/channels/@me/dm-1'),
      isNot(shellContentSectionKey('/channels/@favorites/dm-1')),
    );
  });

  test('query strings are ignored', () {
    expect(
      shellContentSectionKey('/channels/guild-1/channel-1?message=42'),
      '/channels/guild-1',
    );
  });

  test('non-channel routes keep their full path', () {
    expect(shellContentSectionKey('/bookmarks'), '/bookmarks');
    expect(shellContentSectionKey('/mentions'), '/mentions');
    expect(shellContentSectionKey('/settings/account'), '/settings/account');
  });
}
