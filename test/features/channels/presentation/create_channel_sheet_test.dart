import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' as db;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/features/channels/presentation/sheets/create_channel_sheet.dart';
import 'package:fluxer_app/features/chat/utils/composer/composer_mention_query.dart';
import 'package:fluxer_app/features/guilds/providers/guild_sync_provider.dart';
import 'package:fluxer_app/features/members/data/guild_mention_member_search.dart';
import 'package:fluxer_app/features/members/domain/member.dart';
import 'package:fluxer_app/features/members/providers/guild_roles_provider.dart';
import 'package:fluxer_app/features/members/providers/member_providers.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart' hide ChannelType;

import '../../../helpers/open_test_database.dart';
import '../../../helpers/pump_fluxer_app.dart';
import '../../../helpers/test_l10n.dart';

const String _guildId = 'g1';
const String _selfId = 'u1';

class _NoGuildSync extends GuildSync {
  @override
  void syncIfNeeded(String guildId, {bool force = false}) {}
}

class _NoMembers extends Fake implements GuildMentionMemberSearch {
  @override
  Future<List<Member>> searchCached({
    required String guildId,
    required ParsedMentionQuery parsed,
    Map<String, String>? discriminatorByUserId,
    Map<String, String?> friendNicknameById = const <String, String?>{},
    MentionAutocompleteSession? stableSession,
  }) async => const <Member>[];
}

void main() {
  testWidgets('a private channel hides from everyone but its creator', (
    WidgetTester tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(1400, 1000));
    addTearDown(() => tester.binding.setSurfaceSize(null));
    late BuildContext host;
    await tester.pumpWidget(
      pumpFluxerApp(
        overrides: [
          fluxerDatabaseProvider.overrideWithValue(openTestDatabase()),
          currentUserIdProvider.overrideWithValue(_selfId),
          guildSyncProvider.overrideWith(_NoGuildSync.new),
          guildMentionMemberSearchProvider.overrideWithValue(_NoMembers()),
          guildRolesByIdProvider(
            _guildId,
          ).overrideWith((ref) => Stream<Map<String, db.Role>>.value({})),
        ],
        child: Scaffold(
          body: Builder(
            builder: (BuildContext context) {
              host = context;
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );

    final Future<ChannelCreateRequest?> result = CreateChannelSheet.show(
      host,
      guildId: _guildId,
    );
    await pumpFluxerFrames(tester);
    await tester.enterText(find.byType(EditableText).first, 'backstage');
    await tester.ensureVisible(find.byType(FluxerToggleSwitch));
    await tester.tap(find.byType(FluxerToggleSwitch));
    await pumpFluxerFrames(tester);
    await tester.tap(find.text(testL10n.next));
    await pumpFluxerFrames(tester);

    expect(find.text(testL10n.guildNavbarAddMembersOrRoles), findsOneWidget);
    await tester.tap(find.text(testL10n.skip));
    await pumpFluxerFrames(tester);

    final ChannelCreateRequest0 request =
        (await result)! as ChannelCreateRequest0;
    expect(request.name, 'backstage');
    expect(
      <(String, int?, String?, String?)>[
        for (final GuildTextChannelCreateRequestPermissionOverwrites o
            in request.permissionOverwrites!)
          (o.id, o.type.json, o.allow, o.deny),
      ],
      <(String, int?, String?, String?)>[
        (_guildId, 0, null, '1024'),
        (_selfId, 1, '1024', null),
      ],
    );
  });
}
