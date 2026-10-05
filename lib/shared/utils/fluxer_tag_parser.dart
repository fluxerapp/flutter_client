class FluxerTagParseResult {
  const FluxerTagParseResult({
    required this.username,
    required this.discriminator,
  });

  final String username;
  final String discriminator;
}

final RegExp _zeroDiscriminatorInput = RegExp(r'^0{1,4}$');

FluxerTagParseResult parseFluxerTagInput(
  String input, {
  bool uniqueUsernames = false,
}) {
  final parts = input.split('#');
  if (parts.length > 1) {
    final String discriminator = parts.sublist(1).join('#');
    return FluxerTagParseResult(
      username: parts.first,
      discriminator:
          uniqueUsernames && _zeroDiscriminatorInput.hasMatch(discriminator)
          ? '0000'
          : discriminator,
    );
  }
  return FluxerTagParseResult(username: input, discriminator: '0000');
}

bool isValidFluxerTagDiscriminator(String discriminator) {
  return RegExp(r'^\d{4}$').hasMatch(discriminator);
}

bool isValidFluxerTagSubmission(String username, String discriminator) {
  return username.trim().isNotEmpty &&
      isValidFluxerTagDiscriminator(discriminator);
}
