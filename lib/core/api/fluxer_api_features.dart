/// Client capability flags sent on API requests via `X-Fluxer-Features`.
///
/// The API uses this header to gate permission bits that older clients cannot
/// safely edit. See `featureUtils.ts` in `fluxer_api` for the server mapping.
const String fluxerApiFeaturesHeaderName = 'X-Fluxer-Features';

const List<String> fluxerApiClientFeatures = <String>[
  'view_channel_members_permission',
];

String buildFluxerApiFeaturesHeaderValue() =>
    fluxerApiClientFeatures.join(', ');
