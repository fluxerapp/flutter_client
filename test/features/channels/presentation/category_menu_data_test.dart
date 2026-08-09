import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/channels/presentation/category_menu_data.dart';
import '../../../helpers/test_l10n.dart';

void main() {
  final FluxerLocalizations l10n = testL10n;

  CategoryMenuState fullState({
    bool hasUnread = true,
    bool isCollapsed = false,
    bool allCategoriesCollapsed = false,
    bool isMuted = false,
    bool canManageChannels = true,
    bool developerMode = true,
    bool hasAgreedToMatureContent = true,
  }) {
    return resolveCategoryMenuState(
      hasUnread: hasUnread,
      isCollapsed: isCollapsed,
      allCategoriesCollapsed: allCategoriesCollapsed,
      isMuted: isMuted,
      canManageChannels: canManageChannels,
      developerMode: developerMode,
      hasAgreedToMatureContent: hasAgreedToMatureContent,
    );
  }

  group('resolveCategoryMenuState', () {
    test('returns passed state unchanged', () {
      final CategoryMenuState state = resolveCategoryMenuState(
        hasUnread: true,
        isCollapsed: false,
        allCategoriesCollapsed: false,
        isMuted: true,
        canManageChannels: true,
        developerMode: true,
        hasAgreedToMatureContent: true,
        mutedHint: '1 hour left',
      );
      expect(state.hasUnread, isTrue);
      expect(state.isCollapsed, isFalse);
      expect(state.allCategoriesCollapsed, isFalse);
      expect(state.isMuted, isTrue);
      expect(state.canManageChannels, isTrue);
      expect(state.developerMode, isTrue);
      expect(state.hasAgreedToMatureContent, isTrue);
      expect(state.mutedHint, '1 hour left');
    });
  });

  group('buildCategoryMenuGroups', () {
    test('includes all expected groups for a fully permitted state', () {
      final List<CategoryMenuGroup> groups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(),
      );
      final List<CategoryMenuAction> actions = flattenCategoryMenuActions(
        groups,
      );
      expect(actions, contains(CategoryMenuAction.markAsRead));
      expect(actions, contains(CategoryMenuAction.toggleCollapse));
      expect(actions, contains(CategoryMenuAction.toggleCollapseAll));
      expect(actions, contains(CategoryMenuAction.mute));
      expect(actions, contains(CategoryMenuAction.editCategory));
      expect(actions, contains(CategoryMenuAction.deleteCategory));
      expect(actions, contains(CategoryMenuAction.copyCategoryId));
      expect(actions, contains(CategoryMenuAction.debugCategory));
      expect(actions, contains(CategoryMenuAction.resetMatureContentAgree));
    });

    test('disables mark as read when category has no unread', () {
      final List<CategoryMenuGroup> groups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(hasUnread: false),
      );
      final CategoryMenuEntry? entry = _findEntry(
        groups,
        CategoryMenuAction.markAsRead,
      );
      expect(entry, isNotNull);
      expect(entry!.enabled, isFalse);
    });

    test('labels collapse action based on current collapsed state', () {
      final List<CategoryMenuGroup> collapsedGroups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(isCollapsed: true),
      );
      final CategoryMenuEntry? collapsedEntry = _findEntry(
        collapsedGroups,
        CategoryMenuAction.toggleCollapse,
      );
      expect(collapsedEntry, isNotNull);
      expect(collapsedEntry!.label, l10n.categoryExpandCategory);

      final List<CategoryMenuGroup> expandedGroups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(),
      );
      final CategoryMenuEntry? expandedEntry = _findEntry(
        expandedGroups,
        CategoryMenuAction.toggleCollapse,
      );
      expect(expandedEntry, isNotNull);
      expect(expandedEntry!.label, l10n.categoryCollapseCategory);
    });

    test(
      'labels collapse all action based on collapsed state of all categories',
      () {
        final List<CategoryMenuGroup> allCollapsedGroups =
            buildCategoryMenuGroups(
              l10n: l10n,
              state: fullState(allCategoriesCollapsed: true),
            );
        final CategoryMenuEntry? allCollapsedEntry = _findEntry(
          allCollapsedGroups,
          CategoryMenuAction.toggleCollapseAll,
        );
        expect(allCollapsedEntry, isNotNull);
        expect(allCollapsedEntry!.label, l10n.categoryExpandAllCategories);

        final List<CategoryMenuGroup> notAllCollapsedGroups =
            buildCategoryMenuGroups(l10n: l10n, state: fullState());
        final CategoryMenuEntry? notAllCollapsedEntry = _findEntry(
          notAllCollapsedGroups,
          CategoryMenuAction.toggleCollapseAll,
        );
        expect(notAllCollapsedEntry, isNotNull);
        expect(notAllCollapsedEntry!.label, l10n.categoryCollapseAllCategories);
      },
    );

    test('labels mute action based on muted state', () {
      final List<CategoryMenuGroup> mutedGroups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(isMuted: true),
      );
      final CategoryMenuEntry? mutedEntry = _findEntry(
        mutedGroups,
        CategoryMenuAction.mute,
      );
      expect(mutedEntry, isNotNull);
      expect(mutedEntry!.label, l10n.categoryUnmuteCategory);

      final List<CategoryMenuGroup> unmutedGroups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(),
      );
      final CategoryMenuEntry? unmutedEntry = _findEntry(
        unmutedGroups,
        CategoryMenuAction.mute,
      );
      expect(unmutedEntry, isNotNull);
      expect(unmutedEntry!.label, l10n.categoryMuteCategory);
    });

    test('hides edit and delete when user cannot manage channels', () {
      final List<CategoryMenuGroup> groups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(canManageChannels: false),
      );
      final List<CategoryMenuAction> actions = flattenCategoryMenuActions(
        groups,
      );
      expect(actions, isNot(contains(CategoryMenuAction.editCategory)));
      expect(actions, isNot(contains(CategoryMenuAction.deleteCategory)));
    });

    test('marks delete category as dangerous', () {
      final List<CategoryMenuGroup> groups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(),
      );
      expect(
        categoryMenuEntryIsDanger(groups, CategoryMenuAction.deleteCategory),
        isTrue,
      );
      expect(
        categoryMenuEntryIsDanger(groups, CategoryMenuAction.editCategory),
        isFalse,
      );
    });

    test('hides debug items when developer mode is off', () {
      final List<CategoryMenuGroup> groups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(developerMode: false),
      );
      final List<CategoryMenuAction> actions = flattenCategoryMenuActions(
        groups,
      );
      expect(actions, isNot(contains(CategoryMenuAction.debugCategory)));
      expect(
        actions,
        isNot(contains(CategoryMenuAction.resetMatureContentAgree)),
      );
      expect(actions, contains(CategoryMenuAction.copyCategoryId));
    });

    test('hides reset mature content agreement when not previously agreed', () {
      final List<CategoryMenuGroup> groups = buildCategoryMenuGroups(
        l10n: l10n,
        state: fullState(hasAgreedToMatureContent: false),
      );
      final List<CategoryMenuAction> actions = flattenCategoryMenuActions(
        groups,
      );
      expect(
        actions,
        isNot(contains(CategoryMenuAction.resetMatureContentAgree)),
      );
      expect(actions, contains(CategoryMenuAction.debugCategory));
    });
  });
}

CategoryMenuEntry? _findEntry(
  List<CategoryMenuGroup> groups,
  CategoryMenuAction action,
) {
  for (final CategoryMenuGroup group in groups) {
    for (final CategoryMenuEntry entry in group) {
      if (entry.action == action) {
        return entry;
      }
    }
  }
  return null;
}
