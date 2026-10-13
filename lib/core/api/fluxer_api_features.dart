const String fluxerApiFeaturesHeaderName = 'X-Fluxer-Features';

const List<String> fluxerApiClientFeatures = <String>[
  'view_channel_members_permission',
  'channel_threads',
];

String buildFluxerApiFeaturesHeaderValue() =>
    fluxerApiClientFeatures.join(', ');
