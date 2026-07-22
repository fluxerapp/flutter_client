import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/database/daos/user_preferences_dao.dart'
    as preferences_dao;
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/mature_content/providers/mature_content_agreements_provider.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:riverpod/src/framework.dart' show Override;

import '../../../helpers/open_test_database.dart';

class _FakeUserSettings extends UserSettingsViewModel {
  @override
  UserSettingsViewState build() => const UserSettingsViewState(
    userId: 'user-1',
    username: 'user',
    displayName: 'User',
    discriminator: '0001',
    avatar: null,
    avatarColor: null,
    memberSince: null,
    status: 'online',
    messageDisplayCompact: false,
    developerMode: false,
    trustedDomains: <String>[],
  );
}

void main() {
  test('revokeChannelAgreement removes channel and persists', () async {
    final db = openTestDatabase();
    await db.userPreferencesDao.setMatureContentAgreements(
      'user-1',
      const preferences_dao.MatureContentAgreements(
        agreedChannelIds: <String>['channel-1'],
      ),
    );
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
      ],
    );
    addTearDown(container.dispose);
    final MatureContentAgreements notifier = container.read(
      matureContentAgreementsProvider.notifier,
    );
    await Future<void>.delayed(Duration.zero);
    expect(notifier.hasAgreedToChannel('channel-1'), isTrue);
    await notifier.revokeChannelAgreement('channel-1');
    expect(notifier.hasAgreedToChannel('channel-1'), isFalse);
    final preferences_dao.MatureContentAgreements persisted = await db
        .userPreferencesDao
        .getMatureContentAgreements('user-1');
    expect(persisted.agreedChannelIds, isEmpty);
  });

  test(
    'revokeChannelAgreement is a no-op when channel was not agreed',
    () async {
      final db = openTestDatabase();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          fluxerDatabaseProvider.overrideWithValue(db),
          userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
        ],
      );
      addTearDown(container.dispose);
      final MatureContentAgreements notifier = container.read(
        matureContentAgreementsProvider.notifier,
      );
      await Future<void>.delayed(Duration.zero);
      await notifier.revokeChannelAgreement('missing-channel');
      expect(notifier.hasAgreedToChannel('missing-channel'), isFalse);
    },
  );

  test('revokeCategoryAgreement removes category and persists', () async {
    final db = openTestDatabase();
    await db.userPreferencesDao.setMatureContentAgreements(
      'user-1',
      const preferences_dao.MatureContentAgreements(
        agreedCategoryIds: <String>['category-1'],
      ),
    );
    final ProviderContainer container = ProviderContainer(
      overrides: <Override>[
        fluxerDatabaseProvider.overrideWithValue(db),
        userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
      ],
    );
    addTearDown(container.dispose);
    final MatureContentAgreements notifier = container.read(
      matureContentAgreementsProvider.notifier,
    );
    await Future<void>.delayed(Duration.zero);
    expect(notifier.hasAgreedToCategory('category-1'), isTrue);
    await notifier.revokeCategoryAgreement('category-1');
    expect(notifier.hasAgreedToCategory('category-1'), isFalse);
    final preferences_dao.MatureContentAgreements persisted = await db
        .userPreferencesDao
        .getMatureContentAgreements('user-1');
    expect(persisted.agreedCategoryIds, isEmpty);
  });

  test(
    'revokeCategoryAgreement is a no-op when category was not agreed',
    () async {
      final db = openTestDatabase();
      final ProviderContainer container = ProviderContainer(
        overrides: <Override>[
          fluxerDatabaseProvider.overrideWithValue(db),
          userSettingsViewModelProvider.overrideWith(_FakeUserSettings.new),
        ],
      );
      addTearDown(container.dispose);
      final MatureContentAgreements notifier = container.read(
        matureContentAgreementsProvider.notifier,
      );
      await Future<void>.delayed(Duration.zero);
      await notifier.revokeCategoryAgreement('missing-category');
      expect(notifier.hasAgreedToCategory('missing-category'), isFalse);
    },
  );
}
