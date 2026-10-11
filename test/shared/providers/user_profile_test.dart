import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';

void main() {
  test('cached member with malformed role ids builds without roles', () {
    const User user = User(
      id: '2',
      username: 'ptnick',
      discriminator: '0002',
      bot: false,
      system: false,
      status: 'online',
      mobile: false,
    );
    final Member member = Member(
      userId: '2',
      guildId: '10',
      nick: 'Guild Nick',
      roleIdsJson: '',
      joinedAt: DateTime.utc(2026),
    );

    final profile = userProfileFromCachedUser(user, member: member);

    expect(profile.guildMember?.nick, 'Guild Nick');
    expect(profile.guildMember?.roles, isEmpty);
  });
}
