import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

String? discoveryCategoryLabel(FluxerLocalizations l10n, int categoryType) {
  return switch (categoryType) {
    0 => l10n.discoveryCategoryGaming,
    1 => l10n.discoveryCategoryMusic,
    2 => l10n.discoveryCategoryEntertainment,
    3 => l10n.discoveryCategoryEducation,
    4 => l10n.discoveryCategoryScienceAndTechnology,
    5 => l10n.discoveryCategoryContentCreator,
    6 => l10n.discoveryCategoryAnimeAndManga,
    7 => l10n.discoveryCategoryMoviesAndTv,
    8 => l10n.discoveryCategoryOther,
    _ => null,
  };
}
