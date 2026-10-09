String themeColorTokenLabel(String propertyName) {
  final String spaced = propertyName.replaceAllMapped(
    RegExp('([a-z])([A-Z])'),
    (Match match) => '${match[1]} ${match[2]}',
  );
  if (spaced.isEmpty) {
    return propertyName;
  }
  return '${spaced[0].toUpperCase()}${spaced.substring(1)}';
}
