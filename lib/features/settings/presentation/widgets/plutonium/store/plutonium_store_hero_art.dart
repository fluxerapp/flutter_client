String plutoniumStoreHeroArtAsset({required bool selfHosted}) {
  if (selfHosted) {
    return 'assets/images/promo-plutonium-crown.png';
  }
  return 'assets/images/plutonium/plutonium-atom.webp';
}
