import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/guilds/data/guild_repository.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/account_delete_sheet.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class _FakeGuildRepository implements GuildRepository {
  _FakeGuildRepository({required this.ownedGuilds});

  final List<Guild> ownedGuilds;

  @override
  Future<List<Guild>> getOwnedGuilds(String userId) async => ownedGuilds;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class _DeleteAccountLauncher extends ConsumerWidget {
  const _DeleteAccountLauncher();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => AccountDeleteSheet.show(context, ref),
      child: const Text('Delete Account'),
    );
  }
}

Widget _wrap({required ProviderContainer container, required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return UncontrolledProviderScope(
    container: container,
    child: MaterialApp(
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      home: Scaffold(body: child),
    ),
  );
}

void main() {
  testWidgets('shows ownership warning when user owns communities', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        currentUserIdProvider.overrideWithValue('user-1'),
        guildRepositoryProvider.overrideWithValue(
          _FakeGuildRepository(
            ownedGuilds: const [
              Guild(id: 'guild-1', name: 'Owned Community', ownerId: 'user-1'),
            ],
          ),
        ),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      _wrap(container: container, child: const _DeleteAccountLauncher()),
    );

    await tester.tap(find.text('Delete Account'));
    await tester.pumpAndSettle();

    expect(find.text('Cannot delete account'), findsOneWidget);
    expect(find.text('Owned Community'), findsOneWidget);
    expect(
      find.textContaining('Are you sure you want to delete your account?'),
      findsNothing,
    );
  });

  testWidgets('shows delete confirmation when user owns no communities', (
    tester,
  ) async {
    final ProviderContainer container = ProviderContainer(
      overrides: [
        currentUserIdProvider.overrideWithValue('user-1'),
        guildRepositoryProvider.overrideWithValue(
          _FakeGuildRepository(ownedGuilds: const []),
        ),
      ],
    );
    addTearDown(container.dispose);

    await tester.pumpWidget(
      _wrap(container: container, child: const _DeleteAccountLauncher()),
    );

    await tester.tap(find.text('Delete Account'));
    await tester.pumpAndSettle();

    expect(
      find.textContaining('Are you sure you want to delete your account?'),
      findsOneWidget,
    );
    expect(find.text('Cannot delete account'), findsNothing);
  });
}
