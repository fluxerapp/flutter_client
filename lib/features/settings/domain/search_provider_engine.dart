enum SearchProviderMode { text, translate, image }

class SearchProviderEngine {
  const SearchProviderEngine({
    required this.id,
    required this.name,
    required this.urlTemplate,
    required this.enabled,
    required this.isBuiltIn,
  });

  final String id;
  final String name;
  final String urlTemplate;
  final bool enabled;
  final bool isBuiltIn;

  SearchProviderEngine copyWith({
    String? id,
    String? name,
    String? urlTemplate,
    bool? enabled,
    bool? isBuiltIn,
  }) {
    return SearchProviderEngine(
      id: id ?? this.id,
      name: name ?? this.name,
      urlTemplate: urlTemplate ?? this.urlTemplate,
      enabled: enabled ?? this.enabled,
      isBuiltIn: isBuiltIn ?? this.isBuiltIn,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'name': name,
      'urlTemplate': urlTemplate,
      'enabled': enabled,
      'isBuiltIn': isBuiltIn,
    };
  }

  factory SearchProviderEngine.fromJson(Map<String, Object?> json) {
    return SearchProviderEngine(
      id: json['id']! as String,
      name: json['name']! as String,
      urlTemplate: json['urlTemplate']! as String,
      enabled: json['enabled'] as bool? ?? false,
      isBuiltIn: json['isBuiltIn'] as bool? ?? false,
    );
  }
}

class SearchProviderCategoryState {
  const SearchProviderCategoryState({
    required this.engines,
    this.defaultEngineId,
  });

  final List<SearchProviderEngine> engines;
  final String? defaultEngineId;

  List<SearchProviderEngine> get enabledEngines =>
      engines.where((engine) => engine.enabled).toList();

  List<SearchProviderEngine> get builtInEngines =>
      engines.where((engine) => engine.isBuiltIn).toList();

  List<SearchProviderEngine> get customEngines =>
      engines.where((engine) => !engine.isBuiltIn).toList();

  SearchProviderCategoryState copyWith({
    List<SearchProviderEngine>? engines,
    Object? defaultEngineId = _unset,
  }) {
    return SearchProviderCategoryState(
      engines: engines ?? this.engines,
      defaultEngineId: identical(defaultEngineId, _unset)
          ? this.defaultEngineId
          : defaultEngineId as String?,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'defaultEngineId': defaultEngineId,
      'engines': engines.map((engine) => engine.toJson()).toList(),
    };
  }

  factory SearchProviderCategoryState.fromJson(Map<String, Object?> json) {
    final rawEngines = json['engines'];
    return SearchProviderCategoryState(
      defaultEngineId: json['defaultEngineId'] as String?,
      engines: rawEngines is List
          ? rawEngines
                .whereType<Map<String, Object?>>()
                .map(SearchProviderEngine.fromJson)
                .toList()
          : const <SearchProviderEngine>[],
    );
  }

  static const Object _unset = Object();
}

const List<SearchProviderEngine> kBuiltInTextSearchEngines = [
  SearchProviderEngine(
    id: 'google',
    name: 'Google',
    urlTemplate: 'https://www.google.com/search?q={query}',
    enabled: true,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'bing',
    name: 'Bing',
    urlTemplate: 'https://www.bing.com/search?q={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'duckduckgo',
    name: 'DuckDuckGo',
    urlTemplate: 'https://duckduckgo.com/?q={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'yahoo',
    name: 'Yahoo',
    urlTemplate: 'https://search.yahoo.com/search?p={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'ecosia',
    name: 'Ecosia',
    urlTemplate: 'https://www.ecosia.org/search?q={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'brave',
    name: 'Brave Search',
    urlTemplate: 'https://search.brave.com/search?q={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'startpage',
    name: 'Startpage',
    urlTemplate: 'https://www.startpage.com/do/dsearch?query={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'yandex',
    name: 'Yandex',
    urlTemplate: 'https://yandex.com/search/?text={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'wikipedia',
    name: 'Wikipedia',
    urlTemplate: 'https://en.wikipedia.org/w/index.php?search={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'youtube',
    name: 'YouTube',
    urlTemplate: 'https://www.youtube.com/results?search_query={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'github',
    name: 'GitHub',
    urlTemplate: 'https://github.com/search?q={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'reddit',
    name: 'Reddit',
    urlTemplate: 'https://www.reddit.com/search/?q={query}',
    enabled: false,
    isBuiltIn: true,
  ),
];

const List<SearchProviderEngine> kBuiltInTranslatorEngines = [
  SearchProviderEngine(
    id: 'google_translate',
    name: 'Google Translate',
    urlTemplate:
        'https://translate.google.com/?sl=auto&tl=auto&text={query}&op=translate',
    enabled: true,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'deepl',
    name: 'DeepL',
    urlTemplate: 'https://www.deepl.com/translator#auto/auto/{query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'bing_translator',
    name: 'Bing Translator',
    urlTemplate: 'https://www.bing.com/translator/?text={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'yandex_translate',
    name: 'Yandex Translate',
    urlTemplate: 'https://translate.yandex.com/?text={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'reverso',
    name: 'Reverso',
    urlTemplate:
        'https://www.reverso.net/text-translation#sl=auto&tl=eng&text={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'linguee',
    name: 'Linguee',
    urlTemplate:
        'https://www.linguee.com/english-german/search?source=auto&query={query}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'papago',
    name: 'Papago',
    urlTemplate: 'https://papago.naver.com/?st={query}',
    enabled: false,
    isBuiltIn: true,
  ),
];

const List<SearchProviderEngine> kBuiltInReverseImageEngines = [
  SearchProviderEngine(
    id: 'google_lens',
    name: 'Google Lens',
    urlTemplate: 'https://lens.google.com/uploadbyurl?url={url}',
    enabled: true,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'yandex',
    name: 'Yandex',
    urlTemplate: 'https://yandex.com/images/search?rpt=imageview&url={url}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'bing',
    name: 'Bing',
    urlTemplate:
        'https://www.bing.com/images/searchbyimage?cbir=sbi&imgurl={url}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'tineye',
    name: 'TinEye',
    urlTemplate: 'https://tineye.com/search?url={url}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'saucenao',
    name: 'SauceNAO',
    urlTemplate: 'https://saucenao.com/search.php?url={url}',
    enabled: false,
    isBuiltIn: true,
  ),
  SearchProviderEngine(
    id: 'iqdb',
    name: 'IQDB',
    urlTemplate: 'https://iqdb.org/?url={url}',
    enabled: false,
    isBuiltIn: true,
  ),
];

SearchProviderCategoryState createDefaultSearchProviderCategory(
  SearchProviderMode mode,
) {
  final builtIns = switch (mode) {
    SearchProviderMode.text => kBuiltInTextSearchEngines,
    SearchProviderMode.translate => kBuiltInTranslatorEngines,
    SearchProviderMode.image => kBuiltInReverseImageEngines,
  };
  final defaultId = switch (mode) {
    SearchProviderMode.text => 'google',
    SearchProviderMode.translate => 'google_translate',
    SearchProviderMode.image => 'google_lens',
  };
  return SearchProviderCategoryState(
    engines: builtIns,
    defaultEngineId: defaultId,
  );
}

SearchProviderCategoryState mergeSearchProviderCategory(
  SearchProviderMode mode,
  SearchProviderCategoryState? stored,
) {
  final defaults = createDefaultSearchProviderCategory(mode);
  if (stored == null || stored.engines.isEmpty) {
    return defaults;
  }

  final storedById = {for (final engine in stored.engines) engine.id: engine};
  final mergedBuiltIns = defaults.engines.map((builtIn) {
    final storedEngine = storedById[builtIn.id];
    if (storedEngine == null) {
      return builtIn;
    }
    return builtIn.copyWith(enabled: storedEngine.enabled);
  }).toList();

  final customEngines = stored.engines
      .where((engine) => !engine.isBuiltIn)
      .toList();

  final defaultEngineId = stored.defaultEngineId ?? defaults.defaultEngineId;

  return SearchProviderCategoryState(
    engines: [...mergedBuiltIns, ...customEngines],
    defaultEngineId: defaultEngineId,
  );
}

class SearchEnginesState {
  const SearchEnginesState({
    SearchProviderCategoryState? textSearch,
    SearchProviderCategoryState? translators,
    SearchProviderCategoryState? reverseImage,
  }) : textSearch =
           textSearch ??
           const SearchProviderCategoryState(
             engines: kBuiltInTextSearchEngines,
           ),
       translators =
           translators ??
           const SearchProviderCategoryState(
             engines: kBuiltInTranslatorEngines,
           ),
       reverseImage =
           reverseImage ??
           const SearchProviderCategoryState(
             engines: kBuiltInReverseImageEngines,
           );

  final SearchProviderCategoryState textSearch;
  final SearchProviderCategoryState translators;
  final SearchProviderCategoryState reverseImage;

  String? get textSearchEngineId => textSearch.defaultEngineId;
  String? get reverseImageSearchEngineId => reverseImage.defaultEngineId;
  String? get translatorEngineId => translators.defaultEngineId;

  SearchEnginesState copyWith({
    SearchProviderCategoryState? textSearch,
    SearchProviderCategoryState? translators,
    SearchProviderCategoryState? reverseImage,
  }) {
    return SearchEnginesState(
      textSearch: textSearch ?? this.textSearch,
      translators: translators ?? this.translators,
      reverseImage: reverseImage ?? this.reverseImage,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'textSearch': textSearch.toJson(),
      'translators': translators.toJson(),
      'reverseImage': reverseImage.toJson(),
    };
  }

  factory SearchEnginesState.fromJson(Map<String, Object?> json) {
    SearchProviderCategoryState? readCategory(
      String key,
      SearchProviderMode mode,
    ) {
      final raw = json[key];
      if (raw is Map<String, Object?>) {
        return mergeSearchProviderCategory(
          mode,
          SearchProviderCategoryState.fromJson(raw),
        );
      }
      return null;
    }

    return SearchEnginesState(
      textSearch: readCategory('textSearch', SearchProviderMode.text),
      translators: readCategory('translators', SearchProviderMode.translate),
      reverseImage: readCategory('reverseImage', SearchProviderMode.image),
    );
  }

  factory SearchEnginesState.defaults() {
    return SearchEnginesState(
      textSearch: createDefaultSearchProviderCategory(SearchProviderMode.text),
      translators: createDefaultSearchProviderCategory(
        SearchProviderMode.translate,
      ),
      reverseImage: createDefaultSearchProviderCategory(
        SearchProviderMode.image,
      ),
    );
  }

  factory SearchEnginesState.fromLegacyJson(Map<String, Object?> json) {
    final defaults = SearchEnginesState.defaults();
    return defaults.copyWith(
      textSearch: defaults.textSearch.copyWith(
        defaultEngineId: json['textSearchEngineId'] as String?,
      ),
      translators: defaults.translators.copyWith(
        defaultEngineId: json['translatorEngineId'] as String?,
      ),
      reverseImage: defaults.reverseImage.copyWith(
        defaultEngineId: json['reverseImageSearchEngineId'] as String?,
      ),
    );
  }

  SearchProviderCategoryState categoryFor(SearchProviderMode mode) {
    return switch (mode) {
      SearchProviderMode.text => textSearch,
      SearchProviderMode.translate => translators,
      SearchProviderMode.image => reverseImage,
    };
  }

  SearchEnginesState updateCategory(
    SearchProviderMode mode,
    SearchProviderCategoryState category,
  ) {
    return switch (mode) {
      SearchProviderMode.text => copyWith(textSearch: category),
      SearchProviderMode.translate => copyWith(translators: category),
      SearchProviderMode.image => copyWith(reverseImage: category),
    };
  }

  SearchEnginesState mergeSyncedDefaults({
    String? textSearchEngineId,
    String? reverseImageSearchEngineId,
    String? translatorEngineId,
  }) {
    return copyWith(
      textSearch: textSearch.copyWith(defaultEngineId: textSearchEngineId),
      translators: translators.copyWith(defaultEngineId: translatorEngineId),
      reverseImage: reverseImage.copyWith(
        defaultEngineId: reverseImageSearchEngineId,
      ),
    );
  }
}

extension SearchProviderCategoryStateMutations on SearchProviderCategoryState {
  SearchProviderCategoryState setEngineEnabled({
    required String engineId,
    required bool enabled,
  }) {
    final updatedEngines = engines.map((engine) {
      if (engine.id != engineId) {
        return engine;
      }
      return engine.copyWith(enabled: enabled);
    }).toList();

    final shouldClearDefault = !enabled && defaultEngineId == engineId;

    return copyWith(
      engines: updatedEngines,
      defaultEngineId: shouldClearDefault ? null : defaultEngineId,
    );
  }

  SearchProviderCategoryState setDefaultEngine(String engineId) {
    final updatedEngines = engines.map((engine) {
      if (engine.id == engineId) {
        return engine.copyWith(enabled: true);
      }
      return engine;
    }).toList();

    return copyWith(engines: updatedEngines, defaultEngineId: engineId);
  }

  SearchProviderCategoryState addCustomEngine({
    required String id,
    required String name,
    required String urlTemplate,
  }) {
    return copyWith(
      engines: [
        ...engines,
        SearchProviderEngine(
          id: id,
          name: name,
          urlTemplate: urlTemplate,
          enabled: true,
          isBuiltIn: false,
        ),
      ],
    );
  }

  SearchProviderCategoryState updateCustomEngine({
    required String engineId,
    required String name,
    required String urlTemplate,
  }) {
    final updatedEngines = engines.map((engine) {
      if (engine.id != engineId || engine.isBuiltIn) {
        return engine;
      }
      return engine.copyWith(name: name, urlTemplate: urlTemplate);
    }).toList();
    return copyWith(engines: updatedEngines);
  }

  SearchProviderCategoryState removeCustomEngine(String engineId) {
    final updatedEngines = engines
        .where((engine) => engine.id != engineId || engine.isBuiltIn)
        .toList();
    final shouldClearDefault = defaultEngineId == engineId;
    return copyWith(
      engines: updatedEngines,
      defaultEngineId: shouldClearDefault ? null : defaultEngineId,
    );
  }
}

String createCustomSearchProviderId() {
  final timestamp = DateTime.now().millisecondsSinceEpoch;
  final random = DateTime.now().microsecondsSinceEpoch % 1000000;
  return 'custom_${timestamp}_$random';
}

String buildSearchProviderUrl({
  required String urlTemplate,
  required String value,
}) {
  final encoded = Uri.encodeComponent(value);
  return urlTemplate
      .replaceAll('{query}', encoded)
      .replaceAll('{url}', encoded);
}

SearchProviderEngine? resolveDefaultSearchEngine(
  SearchProviderCategoryState category,
) {
  final enabled = category.enabledEngines;
  if (enabled.isEmpty) {
    return null;
  }
  final defaultId = category.defaultEngineId;
  if (defaultId != null) {
    for (final engine in enabled) {
      if (engine.id == defaultId) {
        return engine;
      }
    }
  }
  return enabled.first;
}
