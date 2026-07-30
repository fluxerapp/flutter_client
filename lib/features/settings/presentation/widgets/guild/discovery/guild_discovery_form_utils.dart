import 'package:fluxer_app/features/discovery/domain/discovery_category_labels.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';
import 'package:fluxer_app/features/discovery/domain/discovery_supported_languages.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

List<FluxerSelectItem<int>> discoveryCategorySelectItems(
  FluxerLocalizations l10n,
) {
  return List<FluxerSelectItem<int>>.generate(
    9,
    (int index) => FluxerSelectItem<int>(
      value: index,
      label: discoveryCategoryLabel(l10n, index) ?? '$index',
    ),
  );
}

List<FluxerSelectItem<String>> discoveryLanguageSelectItems() {
  return sortedDiscoveryLanguages()
      .map(
        (DiscoveryLanguage language) => FluxerSelectItem<String>(
          value: language.code,
          label: language.displayLabel,
          searchText:
              '${language.name} ${language.nativeName} ${language.code}',
        ),
      )
      .toList();
}

String resolveDiscoveryPrimaryLanguage(String language) {
  final bool isSupported = sortedDiscoveryLanguages().any(
    (DiscoveryLanguage item) => item.code == language,
  );
  if (isSupported) {
    return language;
  }
  return DiscoveryConstants.defaultLanguage;
}

String? validateDiscoveryDescription(
  FluxerLocalizations l10n,
  String description,
) {
  final String trimmed = description.trim();
  if (trimmed.isEmpty) {
    return l10n.guildSettingsDiscoveryDescriptionRequired;
  }
  if (trimmed.length < DiscoveryConstants.descriptionMinLength) {
    return l10n.guildSettingsDiscoveryDescriptionMinLength(
      DiscoveryConstants.descriptionMinLength,
    );
  }
  if (trimmed.length > DiscoveryConstants.descriptionMaxLength) {
    return l10n.guildSettingsDiscoveryDescriptionMaxLength(
      DiscoveryConstants.descriptionMaxLength,
    );
  }
  return null;
}
