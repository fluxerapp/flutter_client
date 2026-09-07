import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_dart/export.dart';

WellKnownFluxerResponse wellKnownFixture({
  required String media,
  required String staticCdn,
  String api = 'https://chat.example/api',
  String gateway = 'wss://chat.example/gateway',
  bool selfHosted = true,
}) {
  return WellKnownFluxerResponse.fromJson(<String, dynamic>{
    'api_code_version': 1,
    'endpoints': <String, dynamic>{
      'api': api,
      'api_client': api,
      'api_public': api,
      'gateway': gateway,
      'media': media,
      'static_cdn': staticCdn,
      'marketing': 'https://chat.example',
      'admin': 'https://chat.example/admin',
      'invite': 'https://chat.example/invite',
      'gift': 'https://chat.example/gift',
      'webapp': 'https://chat.example',
    },
    'captcha': <String, dynamic>{
      'provider': 'none',
      'hcaptcha_site_key': null,
      'turnstile_site_key': null,
    },
    'features': <String, dynamic>{
      'voice_enabled': true,
      'stripe_enabled': false,
      'self_hosted': selfHosted,
      'presigned_attachment_uploads': true,
      'emails_enabled': true,
    },
    'registration': <String, dynamic>{
      'mode': 'open',
      'admin_registration_urls_enabled': true,
    },
    'community': <String, dynamic>{
      'single_community': false,
      'single_community_guild_id': null,
      'direct_messages_disabled': false,
    },
    'services': <String, dynamic>{
      'gif_enabled': true,
      'youtube_enabled': true,
      'bluesky_enabled': true,
    },
    'gif': <String, dynamic>{
      'provider': 'klipy',
      'display_name': 'KLIPY',
      'attribution_required': false,
    },
    'sso': <String, dynamic>{
      'enabled': false,
      'enforced': false,
      'display_name': null,
      'redirect_uri': '',
    },
    'limits': <String, dynamic>{
      'version': 2,
      'traitDefinitions': <String>[],
      'rules': <Map<String, dynamic>>[],
      'defaultsHash': 'hash',
    },
    'push': <String, dynamic>{'public_vapid_key': null},
    'app_public': <String, dynamic>{
      'branding': <String, dynamic>{
        'product_name': 'Acme',
        'icon_url': 'https://chat.example/logo.png',
        'symbol_url': null,
        'logo_url': null,
        'wordmark_url': null,
        'favicon_url': null,
        'theme_color': null,
      },
      'setup': <String, dynamic>{'configured': true, 'admin_url': null},
      'legal': <String, dynamic>{'terms_url': null, 'privacy_url': null},
      'registration': <String, dynamic>{'collect_date_of_birth': true},
    },
  });
}

InstanceConfigSnapshot selfHostedInstanceSnapshot({
  bool includeWellKnown = true,
}) {
  return InstanceConfigSnapshot(
    apiBaseUrl: 'https://chat.example/api',
    gatewayUrl: 'wss://chat.example/gateway',
    displayDomain: 'chat.example',
    wellKnown: includeWellKnown
        ? wellKnownFixture(
            media: 'https://chat.example/media',
            staticCdn: 'https://chat.example/static',
          )
        : null,
  );
}
