import 'package:fluxer_app/core/providers/well_known_provider.dart';
import 'package:fluxer_dart/export.dart';

class FakeWellKnown extends WellKnown {
  @override
  Future<WellKnownFluxerResponse> build() async {
    return const WellKnownFluxerResponse(
      apiCodeVersion: 1,
      endpoints: InstanceEndpointsSchema(
        api: '',
        apiClient: '',
        apiPublic: '',
        gateway: '',
        media: '',
        staticCdn: '',
        marketing: '',
        admin: '',
        invite: '',
        gift: '',
        webapp: '',
      ),
      captcha: InstanceCaptchaSchema(
        provider: InstanceCaptchaProviderSchema.none,
      ),
      features: InstanceFeaturesSchema(
        voiceEnabled: false,
        stripeEnabled: false,
        premiumEnabled: false,
        stripeServiceable: false,
        selfHosted: false,
        presignedAttachmentUploads: false,
        emailsEnabled: false,
        phoneVerificationEnabled: false,
        accountIdentity: AccountIdentityModeSchema.email,
        tagStyle: TagStyleSchema.random,
      ),
      gif: InstanceGifSchema(
        provider: '',
        displayName: '',
        attributionRequired: false,
      ),
      sso: InstanceSsoSchema(
        enabled: false,
        enforced: false,
        displayName: null,
        redirectUri: '',
      ),
      registration: InstanceRegistrationSchema(
        mode: InstanceRegistrationModeSchema.open,
        adminRegistrationUrlsEnabled: false,
      ),
      community: InstanceCommunitySchema(
        singleCommunity: false,
        singleCommunityGuildId: null,
        directMessagesDisabled: false,
        guildCreateAccess: true,
      ),
      services: InstanceServicesSchema(
        gifEnabled: false,
        youtubeEnabled: false,
        blueskyEnabled: false,
      ),
      limits: WellKnownFluxerResponseLimits(
        version: 2,
        traitDefinitions: <String>[],
        rules: <WellKnownFluxerResponseLimitsRules>[],
        defaultsHash: '',
      ),
      push: InstancePushSchema(publicVapidKey: null),
      appPublic: InstanceAppPublicSchema(
        branding: InstanceBrandingSchema(
          productName: '',
          iconUrl: null,
          symbolUrl: null,
          logoUrl: null,
          wordmarkUrl: null,
          faviconUrl: null,
          themeColor: null,
          statusPageUrl: null,
          statusPageIncidentHistoryUrl: null,
          premiumProductName: 'Plutonium',
          premiumInfoUrl: null,
        ),
        setup: InstanceSetupSchema(configured: true, adminUrl: null),
        legal: InstanceAppPublicSchemaLegal(
          termsUrl: null,
          privacyUrl: null,
          guidelinesUrl: null,
        ),
        registration: InstanceAppPublicSchemaRegistration(
          collectDateOfBirth: false,
        ),
      ),
    );
  }
}
