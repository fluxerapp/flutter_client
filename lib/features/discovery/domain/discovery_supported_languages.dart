class DiscoveryLanguage {
  const DiscoveryLanguage({
    required this.code,
    required this.name,
    required this.nativeName,
  });

  final String code;
  final String name;
  final String nativeName;

  String get displayLabel => '$name ($nativeName)';
}

const List<DiscoveryLanguage> discoverySupportedLanguages = <DiscoveryLanguage>[
  DiscoveryLanguage(code: 'ar', name: 'Arabic', nativeName: 'العربية'),
  DiscoveryLanguage(code: 'bg', name: 'Bulgarian', nativeName: 'Български'),
  DiscoveryLanguage(code: 'cs', name: 'Czech', nativeName: 'Čeština'),
  DiscoveryLanguage(code: 'da', name: 'Danish', nativeName: 'Dansk'),
  DiscoveryLanguage(code: 'de', name: 'German', nativeName: 'Deutsch'),
  DiscoveryLanguage(code: 'el', name: 'Greek', nativeName: 'Ελληνικά'),
  DiscoveryLanguage(code: 'en-US', name: 'English', nativeName: 'English'),
  DiscoveryLanguage(
    code: 'es-ES',
    name: 'Spanish (Spain)',
    nativeName: 'Español (España)',
  ),
  DiscoveryLanguage(
    code: 'es-419',
    name: 'Spanish (Latin America)',
    nativeName: 'Español (Latinoamérica)',
  ),
  DiscoveryLanguage(code: 'fi', name: 'Finnish', nativeName: 'Suomi'),
  DiscoveryLanguage(code: 'fr', name: 'French', nativeName: 'Français'),
  DiscoveryLanguage(code: 'he', name: 'Hebrew', nativeName: 'עברית'),
  DiscoveryLanguage(code: 'hi', name: 'Hindi', nativeName: 'हिन्दी'),
  DiscoveryLanguage(code: 'hr', name: 'Croatian', nativeName: 'Hrvatski'),
  DiscoveryLanguage(code: 'hu', name: 'Hungarian', nativeName: 'Magyar'),
  DiscoveryLanguage(
    code: 'id',
    name: 'Indonesian',
    nativeName: 'Bahasa Indonesia',
  ),
  DiscoveryLanguage(code: 'it', name: 'Italian', nativeName: 'Italiano'),
  DiscoveryLanguage(code: 'ja', name: 'Japanese', nativeName: '日本語'),
  DiscoveryLanguage(code: 'ko', name: 'Korean', nativeName: '한국어'),
  DiscoveryLanguage(code: 'lt', name: 'Lithuanian', nativeName: 'Lietuvių'),
  DiscoveryLanguage(code: 'nl', name: 'Dutch', nativeName: 'Nederlands'),
  DiscoveryLanguage(code: 'no', name: 'Norwegian', nativeName: 'Norsk'),
  DiscoveryLanguage(code: 'pl', name: 'Polish', nativeName: 'Polski'),
  DiscoveryLanguage(
    code: 'pt-BR',
    name: 'Portuguese (Brazil)',
    nativeName: 'Português (Brasil)',
  ),
  DiscoveryLanguage(code: 'ro', name: 'Romanian', nativeName: 'Română'),
  DiscoveryLanguage(code: 'ru', name: 'Russian', nativeName: 'Русский'),
  DiscoveryLanguage(code: 'sv-SE', name: 'Swedish', nativeName: 'Svenska'),
  DiscoveryLanguage(code: 'th', name: 'Thai', nativeName: 'ไทย'),
  DiscoveryLanguage(code: 'tr', name: 'Turkish', nativeName: 'Türkçe'),
  DiscoveryLanguage(code: 'uk', name: 'Ukrainian', nativeName: 'Українська'),
  DiscoveryLanguage(code: 'vi', name: 'Vietnamese', nativeName: 'Tiếng Việt'),
  DiscoveryLanguage(
    code: 'zh-CN',
    name: 'Chinese (Simplified)',
    nativeName: '中文 (简体)',
  ),
  DiscoveryLanguage(
    code: 'zh-TW',
    name: 'Chinese (Traditional)',
    nativeName: '中文 (繁體)',
  ),
];

List<DiscoveryLanguage> sortedDiscoveryLanguages() {
  final List<DiscoveryLanguage> languages = List<DiscoveryLanguage>.from(
    discoverySupportedLanguages,
  );
  languages.sort(
    (DiscoveryLanguage a, DiscoveryLanguage b) =>
        a.name.toLowerCase().compareTo(b.name.toLowerCase()),
  );
  return languages;
}
