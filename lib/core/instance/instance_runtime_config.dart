import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_dart/export.dart';

@immutable
class InstanceRuntimeConfig {
  const InstanceRuntimeConfig({
    required this.productName,
    required this.selfHosted,
    required this.stripeEnabled,
    required this.emailsEnabled,
    required this.voiceEnabled,
    required this.presignedAttachmentUploads,
    required this.gifEnabled,
    required this.blueskyEnabled,
    required this.gifAttributionRequired,
    required this.singleCommunity,
    required this.directMessagesDisabled,
    required this.registrationClosed,
    required this.adminRegistrationUrlsEnabled,
    required this.collectDateOfBirth,
    this.iconUrl,
    this.symbolUrl,
    this.logoUrl,
    this.wordmarkUrl,
    this.themeColorHex,
    this.gifDisplayName,
    this.singleCommunityGuildId,
  });

  final String productName;
  final String? iconUrl;
  final String? symbolUrl;
  final String? logoUrl;
  final String? wordmarkUrl;
  final String? themeColorHex;
  final bool selfHosted;
  final bool stripeEnabled;
  final bool emailsEnabled;
  final bool voiceEnabled;
  final bool presignedAttachmentUploads;
  final bool gifEnabled;
  final bool blueskyEnabled;
  final bool gifAttributionRequired;
  final String? gifDisplayName;
  final bool singleCommunity;
  final String? singleCommunityGuildId;
  final bool directMessagesDisabled;
  final bool registrationClosed;
  final bool adminRegistrationUrlsEnabled;
  final bool collectDateOfBirth;

  static const InstanceRuntimeConfig defaults = InstanceRuntimeConfig(
    productName: InstanceConstants.defaultProductName,
    selfHosted: false,
    stripeEnabled: true,
    emailsEnabled: true,
    voiceEnabled: true,
    presignedAttachmentUploads: true,
    gifEnabled: true,
    blueskyEnabled: true,
    gifAttributionRequired: false,
    singleCommunity: false,
    directMessagesDisabled: false,
    registrationClosed: false,
    adminRegistrationUrlsEnabled: false,
    collectDateOfBirth: true,
  );

  factory InstanceRuntimeConfig.fromWellKnown(
    WellKnownFluxerResponse? response,
  ) {
    if (response == null) {
      return defaults;
    }
    final WellKnownFluxerResponseAppPublicBranding branding =
        response.appPublic.branding;
    final String productName = branding.productName.trim();
    final String gifName = response.gif.displayName.trim();
    final String? singleCommunityGuildId = response
        .community
        .singleCommunityGuildId
        ?.trim();
    return InstanceRuntimeConfig(
      productName: productName.isEmpty
          ? InstanceConstants.defaultProductName
          : productName,
      iconUrl: _nonEmpty(branding.iconUrl),
      symbolUrl: _nonEmpty(branding.symbolUrl),
      logoUrl: _nonEmpty(branding.logoUrl),
      wordmarkUrl: _nonEmpty(branding.wordmarkUrl),
      themeColorHex: _nonEmpty(branding.themeColor),
      selfHosted: response.features.selfHosted,
      stripeEnabled: response.features.stripeEnabled,
      emailsEnabled: response.features.emailsEnabled,
      voiceEnabled: response.features.voiceEnabled,
      presignedAttachmentUploads: response.features.presignedAttachmentUploads,
      gifEnabled: response.services.gifEnabled,
      blueskyEnabled: response.services.blueskyEnabled,
      gifAttributionRequired: response.gif.attributionRequired,
      gifDisplayName: gifName.isEmpty ? null : gifName,
      singleCommunity: response.community.singleCommunity,
      singleCommunityGuildId:
          singleCommunityGuildId == null || singleCommunityGuildId.isEmpty
          ? null
          : singleCommunityGuildId,
      directMessagesDisabled: response.community.directMessagesDisabled,
      registrationClosed:
          response.registration.mode ==
          WellKnownFluxerResponseRegistrationModeMode.closed,
      adminRegistrationUrlsEnabled:
          response.registration.adminRegistrationUrlsEnabled,
      collectDateOfBirth: response.appPublic.registration.collectDateOfBirth,
    );
  }

  Color? get themeColor => parseCssHexColor(themeColorHex);

  String? get compactMarkUrl =>
      _nonEmpty(symbolUrl) ?? _nonEmpty(iconUrl) ?? _nonEmpty(logoUrl);

  bool get giftsEnabled => !selfHosted || stripeEnabled;

  bool isStockCommunityGuild(String guildId) {
    return singleCommunity &&
        singleCommunityGuildId != null &&
        singleCommunityGuildId == guildId;
  }

  bool canPublicRegister({String? registrationUrlCode}) {
    if (!registrationClosed) {
      return true;
    }
    if (!adminRegistrationUrlsEnabled) {
      return false;
    }
    final String? code = registrationUrlCode?.trim();
    return code != null && code.isNotEmpty;
  }

  @override
  bool operator ==(Object other) {
    return other is InstanceRuntimeConfig &&
        other.productName == productName &&
        other.iconUrl == iconUrl &&
        other.symbolUrl == symbolUrl &&
        other.logoUrl == logoUrl &&
        other.wordmarkUrl == wordmarkUrl &&
        other.themeColorHex == themeColorHex &&
        other.selfHosted == selfHosted &&
        other.stripeEnabled == stripeEnabled &&
        other.emailsEnabled == emailsEnabled &&
        other.voiceEnabled == voiceEnabled &&
        other.presignedAttachmentUploads == presignedAttachmentUploads &&
        other.gifEnabled == gifEnabled &&
        other.blueskyEnabled == blueskyEnabled &&
        other.gifAttributionRequired == gifAttributionRequired &&
        other.gifDisplayName == gifDisplayName &&
        other.singleCommunity == singleCommunity &&
        other.singleCommunityGuildId == singleCommunityGuildId &&
        other.directMessagesDisabled == directMessagesDisabled &&
        other.registrationClosed == registrationClosed &&
        other.adminRegistrationUrlsEnabled == adminRegistrationUrlsEnabled &&
        other.collectDateOfBirth == collectDateOfBirth;
  }

  @override
  int get hashCode => Object.hashAll(<Object?>[
    productName,
    iconUrl,
    symbolUrl,
    logoUrl,
    wordmarkUrl,
    themeColorHex,
    selfHosted,
    stripeEnabled,
    emailsEnabled,
    voiceEnabled,
    presignedAttachmentUploads,
    gifEnabled,
    blueskyEnabled,
    gifAttributionRequired,
    gifDisplayName,
    singleCommunity,
    singleCommunityGuildId,
    directMessagesDisabled,
    registrationClosed,
    adminRegistrationUrlsEnabled,
    collectDateOfBirth,
  ]);

  static String? _nonEmpty(String? value) {
    final String? trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty) {
      return null;
    }
    return trimmed;
  }
}

Color? parseCssHexColor(String? raw) {
  if (raw == null) {
    return null;
  }
  String value = raw.trim();
  if (value.isEmpty) {
    return null;
  }
  if (value.startsWith('#')) {
    value = value.substring(1);
  }
  if (value.length == 3) {
    value = value.split('').map((String char) => '$char$char').join();
  }
  if (value.length == 6) {
    final int? rgb = int.tryParse(value, radix: 16);
    if (rgb == null) {
      return null;
    }
    return Color(0xFF000000 | rgb);
  }
  if (value.length == 8) {
    final int? rgba = int.tryParse(value, radix: 16);
    if (rgba == null) {
      return null;
    }
    final int rgb = (rgba >> 8) & 0xFFFFFF;
    final int alpha = rgba & 0xFF;
    return Color((alpha << 24) | rgb);
  }
  return null;
}

String? parseRegistrationUrlCode(String? input) {
  if (input == null) {
    return null;
  }
  final String trimmed = input.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  try {
    final Uri uri = Uri.parse(
      trimmed.contains('://') ? trimmed : 'https://$trimmed',
    );
    final String? code = uri.queryParameters['registration_url']?.trim();
    if (code != null && code.isNotEmpty) {
      return code;
    }
  } on FormatException {
    return null;
  }
  return null;
}
