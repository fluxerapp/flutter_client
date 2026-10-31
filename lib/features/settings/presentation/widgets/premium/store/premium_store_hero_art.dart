String premiumStoreHeroArtAsset({required bool selfHosted}) {
  if (selfHosted) {
    return 'assets/images/plutonium/premium-crown.webp';
  }
  return 'assets/images/plutonium/plutonium-atom.webp';
}
