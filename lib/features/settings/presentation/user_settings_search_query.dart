import 'dart:async';

import 'package:material_ui/material_ui.dart';

mixin UserSettingsSearchQueryMixin<T extends StatefulWidget> on State<T> {
  final TextEditingController searchController = TextEditingController();
  Timer? _searchDebounce;
  var debouncedSearchQuery = '';

  bool get isSettingsSearchActive => debouncedSearchQuery.trim().isNotEmpty;

  void onSearchQueryChanged(String value) {
    _searchDebounce?.cancel();
    if (value.trim().isEmpty) {
      setState(() => debouncedSearchQuery = '');
      return;
    }
    setState(() {});
    _searchDebounce = Timer(const Duration(milliseconds: 300), () {
      if (!mounted) {
        return;
      }
      setState(() => debouncedSearchQuery = value);
    });
  }

  void clearSearchQuery() {
    resetSearchQuery();
    setState(() {});
  }

  void resetSearchQuery() {
    _searchDebounce?.cancel();
    searchController.clear();
    debouncedSearchQuery = '';
  }

  void disposeSearchQuery() {
    _searchDebounce?.cancel();
    searchController.dispose();
  }
}
