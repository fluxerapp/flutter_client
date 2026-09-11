// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class FluxerLocalizationsHi extends FluxerLocalizations {
  FluxerLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get reconnectingTitle => 'हम गड़बड़ हो गए!';

  @override
  String get reconnectingBody =>
      'इंस्टेंस में कुछ समस्या है।\nएक सेकंड में ठीक हो जाएगा!';

  @override
  String get gatewayReconnectingToast => 'फिर से कनेक्ट हो रहा है…';

  @override
  String get gatewayConnectedToast => 'कनेक्ट हो गया';

  @override
  String get sessionExpiredToast =>
      'आपका सत्र समाप्त हो गया है। कृपया पुनः साइन इन करें।';

  @override
  String splashStartupFailed(String error) {
    return 'शुरू करने में विफल: $error';
  }

  @override
  String get retry => 'पुनः प्रयास करें';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'कनेक्शन टूट गया';

  @override
  String get splashViewOnStatusPage => 'स्थिति पृष्ठ पर देखें';

  @override
  String get splashConnectionIssuesPrompt => 'कनेक्शन में समस्या है?';

  @override
  String get splashStatusPageLink => 'स्थिति पृष्ठ';

  @override
  String get splashReadIncident => 'घटना पढ़ें';

  @override
  String get splashIncidentHistory => 'घटना इतिहास';

  @override
  String get nagbarLearnMore => 'और जानें';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return '$localizedTime के लिए रखरखाव निर्धारित है। अनुमानित अवधि: $duration।';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'रखरखाव जारी है। अनुमानित अवधि: $duration।';
  }

  @override
  String get nagbarMaintenanceComplete => 'रखरखाव पूरा हो गया है।';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'नमस्ते $displayName, अपना अकाउंट क्लेम करें ताकि आप उस तक पहुंच न खोएं।';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'नमस्ते $displayName, कृपया अपना ईमेल पता सत्यापित करें।';
  }

  @override
  String get nagbarOpenSettings => 'सेटिंग खोलें';

  @override
  String get systemPermissionSettingsTitle => 'अनुमति सक्षम करें';

  @override
  String get systemPermissionSettingsOpenSettings => 'सेटिंग खोलें';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName को आपके माइक्रोफ़ोन तक पहुँच नहीं है। आप इसे अपनी डिवाइस गोपनीयता सेटिंग्स में सक्षम कर सकते हैं।';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName को आपके कैमरे तक पहुँच नहीं है। आप इसे अपनी डिवाइस की गोपनीयता सेटिंग्स में सक्षम कर सकते हैं।';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName को आपकी फ़ोटो लाइब्रेरी तक पहुँच नहीं है। आप इसे अपनी डिवाइस की गोपनीयता सेटिंग्स में सक्षम कर सकते हैं।';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName को सूचनाएं भेजने की अनुमति नहीं है। आप इसे अपनी डिवाइस सेटिंग में चालू कर सकते हैं।';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'आपकी सदस्यता का नवीनीकरण विफल हो गया है, लेकिन आपके पास $productName के लाभ $graceDate तक उपलब्ध रहेंगे। अभी कार्रवाई करें, नहीं तो आप सभी लाभ खो देंगे।';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'आपकी $productName सदस्यता समाप्त हो गई है। अपने लाभों को बनाए रखने के लिए अभी नवीनीकृत करें।';
  }

  @override
  String get nagbarManageSubscription => 'सदस्यता प्रबंधित करें';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return '$productFullName में आपका स्वागत है। अपने $productName के फ़ायदे देखें और अपनी सदस्यता प्रबंधित करें।';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return '$productName की सुविधाएं देखें';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'आपके उपहार इन्वेंट्री में एक नया उपहार कोड इंतज़ार कर रहा है।';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'आपके उपहार इन्वेंट्री में $count नए उपहार कोड इंतज़ार कर रहे हैं।';
  }

  @override
  String get nagbarViewGiftInventory => 'गिफ्ट इन्वेंट्री देखें';

  @override
  String get nagbarVisionaryMfa =>
      'अपने Visionary खाते को सुरक्षित करने के लिए दो-चरणीय प्रमाणीकरण सक्षम करें।';

  @override
  String get nagbarEnableMfa => '2FA सक्षम करें';

  @override
  String get nagbarTermsAcceptance =>
      'हमने अपनी शर्तें अपडेट कर दी हैं। जारी रखने के लिए कृपया उनकी समीक्षा करें और स्वीकार करें।';

  @override
  String get nagbarReviewTerms => 'शर्तें देखें';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'टीम के साथ चैट करने और अप-टू-डेट रहने के लिए $communityName से जुड़ें।';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return '$communityName से जुड़ें';
  }

  @override
  String get nagbarPushNotification =>
      'सूचनाएं चालू करें ताकि आप संदेश और उल्लेख न चूकें।';

  @override
  String get nagbarEnableNotifications => 'सूचनाएं चालू करें';

  @override
  String get nagbarBillingPortalFailed =>
      'बिलिंग पोर्टल नहीं खोल सका। कृपया कुछ देर बाद फिर से प्रयास करें।';

  @override
  String get welcomeBack => 'वापस स्वागत है';

  @override
  String get email => 'ईमेल';

  @override
  String get emailInvalid => 'कृपया एक मान्य ईमेल पता दर्ज करें।';

  @override
  String get password => 'पासवर्ड';

  @override
  String get forgotPassword => 'पासवर्ड भूल गए?';

  @override
  String get logIn => 'लॉग इन करें';

  @override
  String get logInWithPasskey => 'पासकी से लॉग इन करें';

  @override
  String continueWithSso(String provider) {
    return '$provider के साथ जारी रखें';
  }

  @override
  String get ssoRequired => 'इस इंस्टेंस तक पहुँचने के लिए SSO आवश्यक है।';

  @override
  String get organizationSsoProvider =>
      'अपने संगठन के सिंगल साइन-ऑन प्रोवाइडर से साइन इन करें.';

  @override
  String get failedToStartSso => 'SSO शुरू नहीं हो पाया';

  @override
  String get ssoCancelled => 'SSO लॉगिन रद्द कर दिया गया';

  @override
  String preferSso(String provider) {
    return 'SSO का उपयोग करना पसंद है? $provider के साथ जारी रखें।';
  }

  @override
  String get logInViaBrowser => 'ब्राउज़र के ज़रिए लॉग इन करें';

  @override
  String get needAccountPrompt => 'खाता चाहिए?';

  @override
  String get register => 'रजिस्टर करें';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'पुष्टि करें कि आप इंसान हैं';

  @override
  String get captchaDescription =>
      'यह सुनिश्चित करने के लिए कि आप बॉट नहीं हैं, हमें आपकी पुष्टि करने की आवश्यकता है। कृपया नीचे दिए गए सत्यापन को पूरा करें।';

  @override
  String get captchaSwitchToHcaptcha =>
      'समस्या आ रही है? इसके बजाय hCaptcha आज़माएँ';

  @override
  String get captchaSwitchToTurnstile => 'इसके बजाय टर्नस्टाइल आज़माएँ';

  @override
  String get cancel => 'रद्द करें';

  @override
  String get ipAuthCheckEmail => 'अपना ईमेल देखें';

  @override
  String ipAuthDescription(String email) {
    return 'हमने इस लॉगिन को अधिकृत करने के लिए एक लिंक भेजा है। कृपया अपना इनबॉक्स $email पर खोलें।';
  }

  @override
  String get ipAuthConnectionLost => 'कनेक्शन टूट गया';

  @override
  String get ipAuthConnectionLostDescription =>
      'ऑथराइज़ेशन का इंतज़ार करते समय हमारा कनेक्शन टूट गया। कृपया फिर से कोशिश करें।';

  @override
  String get ipAuthLinkExpired => 'साइन-इन लिंक समाप्त हो गया';

  @override
  String get ipAuthLinkExpiredDescription =>
      'यह प्राधिकरण लिंक समाप्त हो गया है। कृपया फिर से साइन इन करें।';

  @override
  String get ipAuthResendEmail => 'ईमेल फिर से भेजें';

  @override
  String get ipAuthResent => 'फिर से भेजा गया';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds सेकंड';
  }

  @override
  String get back => 'वापस';

  @override
  String get next => 'आगे';

  @override
  String get mfaTitle => 'दो-कारक प्रमाणीकरण';

  @override
  String get mfaChooseMethod => 'एक सत्यापन विधि चुनें';

  @override
  String get mfaMethodTotp => 'ऑथेंटिकेटर ऐप';

  @override
  String get mfaMethodWebauthn => 'सुरक्षा कुंजी / पासकी';

  @override
  String get mfaTotpDescription =>
      'अपने ऑथेंटिकेटर ऐप से 6 अंकों का कोड या अपने बैकअप कोड में से एक दर्ज करें।';

  @override
  String get mfaCodeLabel => 'कोड';

  @override
  String get mfaTryAnotherMethod => 'कोई और तरीका आज़माएँ';

  @override
  String get mfaUseSecurityKey => 'इसके बजाय सुरक्षा कुंजी/पासकी आज़माएँ';

  @override
  String get accountSelectorTitle => 'कोई खाता चुनें';

  @override
  String get accountSelectorDescription =>
      'जारी रखने के लिए कोई खाता चुनें या कोई दूसरा जोड़ें.';

  @override
  String get accountAdd => 'खाता जोड़ें';

  @override
  String get accountRemove => 'हटाएँ';

  @override
  String accountRemoveTitle(String username) {
    return '$username हटाएं';
  }

  @override
  String get accountRemoveDescription =>
      'इससे इस खाते का सेव किया गया सेशन हट जाएगा।';

  @override
  String get accountRemoveOnlyDescription =>
      'इससे इस डिवाइस पर मौजूद एकमात्र सेव किया गया अकाउंट हट जाएगा।';

  @override
  String get accountExpired => 'समय-सीमा समाप्त';

  @override
  String accountSessionExpired(String identifier) {
    return '$identifier के लिए सत्र समाप्त हो गया है। कृपया पुनः लॉग इन करें।';
  }

  @override
  String get accountManageTitle => 'खाते प्रबंधित करें';

  @override
  String get accountSwitchFailed => 'खाते नहीं बदल सके। फिर से कोशिश करें।';

  @override
  String get profileTabMenuSwitchAccounts => 'खाते बदलें';

  @override
  String get statusChangeSheetTitle => 'स्टेटस सेट करें';

  @override
  String get statusOnlineStatusSection => 'ऑनलाइन स्टेटस';

  @override
  String get statusOnline => 'ऑनलाइन';

  @override
  String get statusIdle => 'निष्क्रिय';

  @override
  String get statusDnd => 'परेशान न करें';

  @override
  String get statusInvisible => 'अदृश्य';

  @override
  String get statusOffline => 'ऑफ़लाइन';

  @override
  String get statusUntilIChangeIt => 'जब तक मैं इसे बदल न दूं';

  @override
  String get statusDontClear => 'साफ़ न करें';

  @override
  String get statusFor10Seconds => '10 सेकंड के लिए';

  @override
  String get statusClearAfter10Seconds => '10 सेकंड';

  @override
  String get statusClearAfter15Minutes => '15 मिनट';

  @override
  String get statusClearAfter30Minutes => '30 मिनट';

  @override
  String get statusClearAfter1Hour => '1 घंटा';

  @override
  String get statusClearAfter3Hours => '3 घंटे';

  @override
  String get statusClearAfter4Hours => '4 घंटे';

  @override
  String get statusClearAfter8Hours => '8 घंटे';

  @override
  String get statusClearAfter24Hours => '24 घंटे';

  @override
  String get statusClearAfter3Days => '3 दिन';

  @override
  String get statusDndDescription => 'आपको डेस्कटॉप पर सूचनाएं नहीं मिलेंगी';

  @override
  String get statusInvisibleDescription => 'आप ऑफ़लाइन दिखेंगे';

  @override
  String get customStatusSetTitle => 'कस्टम स्टेटस सेट करें';

  @override
  String get customStatusCurrentHint => 'कस्टम स्टेटस';

  @override
  String get customStatusClear => 'कस्टम स्टेटस हटाएँ';

  @override
  String get customStatusPlaceholder => 'क्या चल रहा है?';

  @override
  String get customStatusChooseEmoji => 'एक इमोजी चुनें';

  @override
  String get customStatusClearAfter => 'इसके बाद हटाएँ';

  @override
  String get customStatusSave => 'सेव करें';

  @override
  String get accountActive => 'सक्रिय खाता';

  @override
  String get signOut => 'साइन आउट करें';

  @override
  String get suspendedPermanentTitle => 'खाता स्थायी रूप से निलंबित';

  @override
  String get suspendedTemporaryTitle => 'खाता निलंबित';

  @override
  String get suspendedPermanentDescription =>
      'आपके खाते को हमारी सेवा की शर्तों का उल्लंघन करने के कारण स्थायी रूप से निलंबित कर दिया गया है।';

  @override
  String get suspendedTemporaryDescription =>
      'आपका खाता अस्थायी रूप से निलंबित कर दिया गया है। निलंबन अवधि समाप्त होने के बाद आप अपने खाते तक पहुँचने में सक्षम होंगे।';

  @override
  String get suspendedIssuedAt => 'जारी';

  @override
  String get suspendedEndsAt => 'समाप्त';

  @override
  String get suspendedDuration => 'अवधि';

  @override
  String get suspendedPermanent => 'स्थायी';

  @override
  String get suspendedReason => 'वजह';

  @override
  String get suspendedAppealDeadline => 'अपील की समय सीमा';

  @override
  String suspendedDeletionWarning(String date) {
    return 'आपका खाता $date को हटाने के लिए निर्धारित है।';
  }

  @override
  String get suspendedRecheck => 'अपडेट के लिए जाँचें';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return '$seconds सेकंड में फिर से जांचें';
  }

  @override
  String get suspendedBackToLogin => 'लॉगिन पर वापस जाएं';

  @override
  String get suspendedAppealTitle => 'अपील';

  @override
  String get suspendedAppealHint =>
      'अपने निलंबन पर पुनर्विचार करने के कारण बताएं (न्यूनतम 50 अक्षर)...';

  @override
  String get suspendedAppealSubmit => 'अपील सबमिट करें';

  @override
  String get suspendedAppealPending => 'समीक्षा के लिए लंबित';

  @override
  String get suspendedAppealAccepted => 'अपील स्वीकार की गई';

  @override
  String get suspendedAppealRejected => 'अपील अस्वीकृत';

  @override
  String get suspendedAppealAcceptedDescription =>
      'आपकी अपील स्वीकार कर ली गई है और आपका खाता बहाल कर दिया गया है।';

  @override
  String get suspendedSignIn => 'अपने खाते में साइन इन करें';

  @override
  String get forgotPasswordTitle => 'पासवर्ड भूल गए?';

  @override
  String get forgotPasswordDescription =>
      'अपना ईमेल पता डालें और हम आपको पासवर्ड रीसेट करने के लिए एक लिंक भेजेंगे।';

  @override
  String get forgotPasswordSubmit => 'रीसेट लिंक भेजें';

  @override
  String get forgotPasswordSentTitle => 'अपना ईमेल देखें';

  @override
  String get forgotPasswordSentDescription =>
      'हमने आपके ईमेल पते पर पासवर्ड रीसेट करने के निर्देश भेज दिए हैं। कृपया अपना इनबॉक्स देखें और पासवर्ड रीसेट करने के लिए लिंक का पालन करें।';

  @override
  String get forgotPasswordBackToLogin => 'लॉगिन पर वापस जाएं';

  @override
  String get resetPasswordTitle => 'नया पासवर्ड सेट करें';

  @override
  String get resetPasswordDescription =>
      'अपना पासवर्ड रीसेट करने की प्रक्रिया पूरी करने के लिए नीचे अपना नया पासवर्ड दर्ज करें।';

  @override
  String get resetPasswordNewPassword => 'नया पासवर्ड';

  @override
  String get resetPasswordConfirm => 'नया पासवर्ड कन्फ़र्म करें';

  @override
  String get resetPasswordSubmit => 'पासवर्ड रीसेट करें';

  @override
  String get resetPasswordMismatch => 'पासवर्ड मेल नहीं खाते।';

  @override
  String get registerTitle => 'खाता बनाएँ';

  @override
  String get registerDisplayName => 'डिस्प्ले नाम (वैकल्पिक)';

  @override
  String get registerDisplayNameHint => 'लोग आपको किस नाम से बुलाएँ?';

  @override
  String get registerUsername => 'उपयोगकर्ता नाम (वैकल्पिक)';

  @override
  String get registerUsernameHint => 'रैंडम यूज़रनेम के लिए खाली छोड़ दें';

  @override
  String get registerUsernameTagHint =>
      'एक 4-अंकीय टैग स्वचालित रूप से जोड़ा जाएगा ताकि विशिष्टता सुनिश्चित हो सके';

  @override
  String get registerDateOfBirth => 'जन्म तिथि';

  @override
  String get registerMonth => 'महीना';

  @override
  String get registerDay => 'दिन';

  @override
  String get registerYear => 'साल';

  @override
  String get registerConsent =>
      'मैं सेवा की शर्तों और गोपनीयता नीति से सहमत हूँ';

  @override
  String get registerConsentPrefix => 'मैं सहमत हूँ';

  @override
  String get registerConsentTerms => 'सेवा की शर्तें';

  @override
  String get registerConsentAnd => 'और';

  @override
  String get registerConsentPrivacy => 'गोपनीयता नीति';

  @override
  String get registerConfirmPassword => 'पासवर्ड की पुष्टि करें';

  @override
  String get registerSubmit => 'अकाउंट बनाएँ';

  @override
  String get registerHaveAccount => 'क्या आपका पहले से कोई खाता है?';

  @override
  String get registerPendingApproval =>
      'आपका खाता अनुरोध अनुमोदन की प्रतीक्षा में है। एडमिन द्वारा अनुमोदित किए जाने के बाद आप साइन इन कर सकते हैं.';

  @override
  String get registerClosed =>
      'फ़िलहाल पंजीकरण बंद है। खाता बनाने के लिए किसी एडमिन से मिला पंजीकरण लिंक इस्तेमाल करें.';

  @override
  String get passkeyNoCredentials =>
      'इस ऐप के लिए कोई पासकी नहीं मिली। इसके बजाय ईमेल और पासवर्ड से लॉग इन करें।';

  @override
  String get passkeyDeviceNotSupported =>
      'यह डिवाइस पासकी का समर्थन नहीं करता है।';

  @override
  String get passkeyDomainNotAssociated =>
      'इस ऐप के लिए पासकी कॉन्फ़िगर नहीं की गई हैं। इसके बजाय ईमेल और पासवर्ड से लॉग इन करें।';

  @override
  String get passkeyTimeout =>
      'पासकी प्रमाणीकरण का समय समाप्त हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get passkeyNotAvailable =>
      'इस ऐप के लिए पासकी उपलब्ध नहीं हैं। इसके बजाय ईमेल और पासवर्ड से लॉग इन करें।';

  @override
  String get passkeyFailed =>
      'पासकी प्रमाणीकरण विफल रहा। कृपया पुनः प्रयास करें।';

  @override
  String get errorUnableToCreateAccount =>
      'खाता बनाने में असमर्थ। कृपया पुनः प्रयास करें।';

  @override
  String get errorUnableToSignIn =>
      'अभी साइन इन करने में असमर्थ। कृपया पुनः प्रयास करें।';

  @override
  String get errorServiceUnavailable =>
      'यह इंस्टेंस अस्थायी रूप से अनुपलब्ध है। थोड़ी देर में पुनः प्रयास करें।';

  @override
  String get errorInvalidEmailOrPassword => 'अमान्य ईमेल या पासवर्ड।';

  @override
  String get errorUnableToSendResetLink =>
      'रीसेट लिंक भेजने में असमर्थ। कृपया पुनः प्रयास करें।';

  @override
  String get errorUnableToResetPassword =>
      'पासवर्ड रीसेट करने में असमर्थ। कृपया पुनः प्रयास करें।';

  @override
  String get embedInviteJoin => 'समुदाय में शामिल हों';

  @override
  String get embedInviteGoTo => 'समुदाय पर जाएं';

  @override
  String embedInviteOnline(String count) {
    return '$count ऑनलाइन';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count सदस्य';
  }

  @override
  String get embedInviteUnknownTitle => 'अमान्य आमंत्रण';

  @override
  String get embedInviteUnknownSubtitle => 'नया इनवाइट भेजने के लिए कहें.';

  @override
  String get embedInviteUnavailable => 'आमंत्रण अनुपलब्ध';

  @override
  String get embedInviteJoinGroup => 'ग्रुप में शामिल हों';

  @override
  String get embedInviteAlreadyJoined => 'पहले से शामिल हुए';

  @override
  String get embedInviteDisabled => 'आमंत्रण अक्षम किए गए';

  @override
  String get embedInvitePaused => 'इस कम्युनिटी के लिए इनवाइट रोके गए हैं.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName ने संभावित रेड का पता लगाया है, इसलिए नए उपयोगकर्ता अभी शामिल नहीं हो सकते हैं।';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'इस कम्युनिटी ने इनवाइट रोक दिए हैं. आप बाद में फिर से कोशिश कर सकते हैं.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName ने इस कम्युनिटी में संभावित रेड का पता लगाया है। इनवाइट रोक दिए गए हैं, इसलिए नए यूज़र अभी शामिल नहीं हो सकते हैं।';
  }

  @override
  String get inviteAcceptTitle =>
      'आपको इसमें शामिल होने के लिए आमंत्रित किया गया है';

  @override
  String get inviteAcceptJoinButton => 'समुदाय में शामिल हों';

  @override
  String get inviteAcceptGoToButton => 'समुदाय पर जाएं';

  @override
  String get inviteAcceptInvitesPaused => 'आमंत्रण रोके गए';

  @override
  String get inviteAcceptNotFoundTitle => 'आमंत्रण अमान्य';

  @override
  String get inviteAcceptNotFoundDescription =>
      'यह आमंत्रण समाप्त हो गया हो सकता है या अमान्य हो सकता है।';

  @override
  String get invalidDeepLinkTitle => 'लिंक नहीं खोला जा सका';

  @override
  String get invalidDeepLinkDescription =>
      'यह लिंक टूटा हुआ हो सकता है, केवल वेब पर उपलब्ध हो सकता है, या आपके पास इसकी पहुँच नहीं हो सकती है। लिंक की जाँच करें और पुनः प्रयास करें।';

  @override
  String get invalidDeepLinkGoHomeButton => 'होम पर जाएं';

  @override
  String get inviteAcceptJoinGroupButton => 'ग्रुप में शामिल हों';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'आपको $inviterName ने एक ग्रुप DM में शामिल होने के लिए आमंत्रित किया है';
  }

  @override
  String get inviteAcceptSomeone => 'कोई';

  @override
  String get inviteAcceptEmojiPack => 'इमोजी पैक';

  @override
  String get inviteAcceptStickerPack => 'स्टिकर पैक';

  @override
  String get inviteAcceptInstallEmojiPack => 'इमोजी पैक इंस्टॉल करें';

  @override
  String get inviteAcceptInstallStickerPack => 'स्टिकर पैक इंस्टॉल करें';

  @override
  String get inviteAcceptPackInstallNote =>
      'इस आमंत्रण को स्वीकार करने पर पैक अपने आप इंस्टॉल हो जाएगा।';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'चैनल एक्सेस अस्वीकृत';

  @override
  String get channelAccessDeniedDescription =>
      'आपके पास उस चैनल का ऐक्सेस नहीं है जहाँ यह मैसेज भेजा गया था.';

  @override
  String get messageJumpLinkNoAccess => 'पहुँच नहीं है';

  @override
  String get okay => 'ठीक है';

  @override
  String get embedThemeTitle => 'शेयर की गई थीम';

  @override
  String get embedThemeSubtitle =>
      'यह क्लाइंट कस्टम थीम का समर्थन नहीं करता है।';

  @override
  String get embedThemeUnavailableButton => 'थीम अनुपलब्ध';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'विज़नरी (लाइफटाइम $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन $productName के',
      one: '1 दिन $productName का',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count हफ़्ते $productName',
      one: '1 हफ़्ता $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count महीने $productName',
      one: '1 महीना $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count साल का $productName',
      one: '1 साल का $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return '$creatorTag से';
  }

  @override
  String get embedGiftClaimHelp => 'अपना उपहार पाने के लिए क्लिक करें!';

  @override
  String get embedGiftAlreadyRedeemed => 'पहले ही रिडीम किया गया';

  @override
  String get embedGiftClaimAccountHelp =>
      'यह उपहार पाने के लिए अपना अकाउंट क्लेम करें।';

  @override
  String get embedGiftClaim => 'गिफ्ट क्लेम करें';

  @override
  String get embedGiftClaimed => 'गिफ्ट क्लेम किया गया';

  @override
  String get embedGiftClaimAccount => 'रिडीम करने के लिए अकाउंट क्लेम करें';

  @override
  String get embedGiftUnknownTitle => 'अज्ञात उपहार';

  @override
  String get embedGiftUnknownSubtitle =>
      'यह गिफ़्ट कोड अमान्य है या पहले ही क्लेम किया जा चुका है।';

  @override
  String get embedGiftUnavailable => 'उपहार उपलब्ध नहीं है';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'अपने $productName सब्सक्रिप्शन को सक्रिय करने के लिए अपना उपहार प्राप्त करें!';
  }

  @override
  String get giftAcceptAlreadyClaimed =>
      'यह उपहार पहले ही क्लेम किया जा चुका है।';

  @override
  String get giftAcceptMaybeLater => 'बाद में करें';

  @override
  String get giftRedeemedToast => 'उपहार रिडीम किया गया!';

  @override
  String get giftRedeemInvalidTitle => 'अमान्य उपहार कोड';

  @override
  String get giftRedeemInvalidMessage =>
      'यह कोड अमान्य है या पहले ही इस्तेमाल किया जा चुका है।';

  @override
  String get giftRedeemAlreadyRedeemedTitle =>
      'गिफ्ट पहले ही रिडीम किया जा चुका है';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'यह कोड पहले ही रिडीम किया जा चुका है।';

  @override
  String get giftRedeemNotFoundTitle => 'गिफ़्ट नहीं मिला';

  @override
  String get giftRedeemNotFoundMessage => 'यह कोड मौजूद नहीं है।';

  @override
  String get giftRedeemFailedTitle => 'गिफ्ट रिडीम करने में विफल';

  @override
  String get giftRedeemFailedMessage =>
      'यह उपहार रिडीम नहीं किया जा सका. फिर से कोशिश करें.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'यह उपहार रिडीम नहीं किया जा सकता';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'विजनरी खाते Plutonium उपहारों को रिडीम नहीं कर सकते हैं। इसके बजाय इसे किसी दोस्त के साथ साझा करने के लिए लिंक कॉपी करें।';

  @override
  String get giftCopyLink => 'गिफ्ट लिंक कॉपी करें';

  @override
  String get privacySettings => 'निजता सेटिंग्स';

  @override
  String get privacyDirectMessages => 'डायरेक्ट मैसेज';

  @override
  String get privacyDirectMessagesDescription =>
      'इस समुदाय के अन्य सदस्यों से डायरेक्ट मैसेज की अनुमति दें';

  @override
  String get privacyBotDirectMessages => 'बॉट डायरेक्ट मैसेज';

  @override
  String get privacyBotDirectMessagesDescription =>
      'इस समुदाय के बॉट्स को आपको सीधे संदेश भेजने की अनुमति दें';

  @override
  String get privacyMutualDmsDisabled =>
      'समुदाय के एडमिन ने इस समुदाय में केवल आपसी सदस्यों से सीधे संदेश प्राप्त करना अक्षम कर दिया है।';

  @override
  String get communityDebug => 'कम्युनिटी डीबग';

  @override
  String get copiedToClipboard => 'क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get notificationSettings => 'सूचना सेटिंग';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName को म्यूट करें';
  }

  @override
  String get notificationMuteDescription =>
      'किसी समुदाय को म्यूट करने से आपको मेंशन किए जाने के अलावा, अनरीड इंडिकेटर और नोटिफ़िकेशन दिखाई नहीं देंगे';

  @override
  String get notificationCommunitySettings => 'सामुदायिक सूचना सेटिंग';

  @override
  String get notificationAllMessages => 'सभी संदेश';

  @override
  String get notificationOnlyMentions => 'सिर्फ़ उल्लेख';

  @override
  String get notificationNothing => 'कुछ नहीं';

  @override
  String get notificationSuppressEveryone => '@everyone और @here को दबाएँ';

  @override
  String get notificationSuppressRoles => 'सभी भूमिका उल्लेखों को दबाएं';

  @override
  String get notificationMobilePush => 'मोबाइल पुश सूचनाएं';

  @override
  String get notificationOverrides => 'अधिसूचना ओवरराइड';

  @override
  String get notificationSelectChannel => 'कोई चैनल या कैटगरी चुनें';

  @override
  String get notificationOnlyAtMentions => 'सिर्फ़ @उल्लेखों पर';

  @override
  String get notificationMuteChannel => 'चैनल म्यूट करें';

  @override
  String get notificationUnmuteChannel => 'चैनल को अनम्यूट करें';

  @override
  String get notificationUseCategoryDefault => 'श्रेणी डिफ़ॉल्ट का उपयोग करें';

  @override
  String get notificationUseCommunityDefault => 'समुदाय डिफ़ॉल्ट का उपयोग करें';

  @override
  String get notificationNoCategory => 'कोई श्रेणी नहीं';

  @override
  String get dmMarkAsRead => 'पढ़ा हुआ के रूप में चिह्नित करें';

  @override
  String get dmMuteConversation => 'DM म्यूट करें';

  @override
  String get dmUnmuteConversation => 'DM अनम्यूट करें';

  @override
  String get dmPinDm => 'DM पिन करें';

  @override
  String get dmUnpinDm => 'DM अनपिन करें';

  @override
  String get dmAlwaysShowInSidebar => 'हमेशा साइडबार में दिखाएँ';

  @override
  String get dmRemoveFromAlwaysShown => 'हमेशा दिखाएँ से हटाएँ';

  @override
  String get dmCloseDm => 'DM बंद करें';

  @override
  String get dmCloseDmConfirmTitle => 'DM बंद करें';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'क्या आप वाकई $username के साथ अपना डीएम बंद करना चाहते हैं? आप इसे बाद में कभी भी फिर से खोल सकते हैं।';
  }

  @override
  String get dmDeleteMyMessagesTitle => 'इस बातचीत में अपने मैसेज मिटाएँ?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'इससे इस बातचीत में आपके द्वारा भेजे गए सभी मैसेज हमेशा के लिए मिट जाएंगे. इसे पहले जैसा नहीं किया जा सकता.';

  @override
  String get dmCopyChannelId => 'चैनल आईडी कॉपी करें';

  @override
  String get dmChannelIdCopied => 'चैनल आईडी कॉपी किया गया';

  @override
  String get dmCopyUserId => 'उपयोगकर्ता आईडी कॉपी करें';

  @override
  String get dmUserIdCopied => 'यूज़र आईडी कॉपी हो गई';

  @override
  String get dmViewProfile => 'प्रोफ़ाइल देखें';

  @override
  String get dmVoiceCall => 'वॉयस कॉल शुरू करें';

  @override
  String get incomingVoiceCallTitle => 'आने वाली वॉइस कॉल';

  @override
  String get incomingVoiceCallAccept => 'स्वीकार करें';

  @override
  String get incomingVoiceCallDecline => 'खारिज करें';

  @override
  String get incomingVoiceCallLabel => 'इनकमिंग कॉल';

  @override
  String get incomingVoiceCallIgnore => 'नज़रअंदाज़ करें';

  @override
  String get directVoiceCallNotEligible =>
      'यह कॉल अभी शुरू नहीं की जा सकती। थोड़ी देर बाद फिर से कोशिश करें।';

  @override
  String get voiceJoinCallFailed =>
      'इस कॉल से कनेक्ट नहीं हो सका। अपना कनेक्शन जांचें और दोबारा प्रयास करें।';

  @override
  String get voiceJoinIncomingCallFailed =>
      'इस कॉल में शामिल नहीं हो सके। अपना कनेक्शन जांचें और दोबारा प्रयास करें।';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'सर्वर पर इस कॉल को अपडेट नहीं किया जा सका। अपना कनेक्शन जांचें और पुनः प्रयास करें।';

  @override
  String get dmAddNote => 'नोट जोड़ें';

  @override
  String get dmEditGroup => 'ग्रुप एडिट करें';

  @override
  String get dmInviteToCommunity => 'समुदाय में आमंत्रित करें';

  @override
  String get dmBlock => 'ब्लॉक करें';

  @override
  String get dmLeaveGroup => 'ग्रुप छोड़ें';

  @override
  String get dmNoCommunitiesAvailable => 'कोई समुदाय उपलब्ध नहीं है';

  @override
  String dmGroupMemberCount(int count) {
    return '$count सदस्य';
  }

  @override
  String get dmMuteFor15Min => '15 मिनट के लिए';

  @override
  String get dmMuteFor30Min => '30 मिनट के लिए';

  @override
  String get dmMuteFor1Hour => '1 घंटे के लिए';

  @override
  String get dmMuteFor3Hours => '3 घंटे के लिए';

  @override
  String get dmMuteFor4Hours => '4 घंटे के लिए';

  @override
  String get dmMuteFor8Hours => '8 घंटे के लिए';

  @override
  String get dmMuteFor24Hours => '24 घंटे के लिए';

  @override
  String get dmMuteFor3Days => '3 दिन के लिए';

  @override
  String get dmMuteForever => 'जब तक मैं इसे वापस चालू न करूँ';

  @override
  String get dmPinGroupDm => 'ग्रुप डीएम को पिन करें';

  @override
  String get dmUnpinGroupDm => 'ग्रुप डीएम को अनपिन करें';

  @override
  String get dmUnnamedGroup => 'बिना नाम का ग्रुप';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName का ग्रुप';
  }

  @override
  String get dmFavoriteDm => 'पसंदीदा DM';

  @override
  String get dmUnfavoriteDm => 'DM से पसंदीदा हटाएं';

  @override
  String get dmFavoriteGroupDm => 'ग्रुप डीएम को फ़ेवरेट करें';

  @override
  String get dmUnfavoriteGroupDm => 'ग्रुप DM को अनफ़ेवरेट करें';

  @override
  String get dmChangeFriendNickname => 'दोस्त का निकनेम बदलें';

  @override
  String get dmRemoveFriend => 'दोस्त को हटाएँ';

  @override
  String get dmAddFriend => 'मित्र जोड़ें';

  @override
  String get dmAcceptFriendRequest => 'मित्र अनुरोध स्वीकार करें';

  @override
  String get dmIgnoreFriendRequest => 'मित्र अनुरोध को अनदेखा करें';

  @override
  String get dmFriendRequestSent => 'अनुरोध भेजा गया';

  @override
  String get dmUnblock => 'ब्लॉक हटाएँ';

  @override
  String get dmDebugUser => 'उपयोगकर्ता को डीबग करें';

  @override
  String get dmDebugChannel => 'चैनल डीबग करें';

  @override
  String get dmDebugCategory => 'श्रेणी डीबग करें';

  @override
  String get dmPinned => 'पिन की गई चैट';

  @override
  String get dmUnpinned => 'अनपिन किया गया DM';

  @override
  String get dmMuted => 'DM म्यूट किया गया';

  @override
  String get dmUnmuted => 'DM अनम्यूट किया गया';

  @override
  String get dmRemoveFriendConfirmTitle => 'दोस्त को हटाएँ';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'क्या आप वाकई $username को दोस्त के तौर पर हटाना चाहते हैं?';
  }

  @override
  String get dmBlockConfirmTitle => 'उपयोगकर्ता को ब्लॉक करें';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'क्या आप वाकई $username को ब्लॉक करना चाहते हैं? वे आपको मैसेज या फ्रेंड रिक्वेस्ट नहीं भेज पाएंगे।';
  }

  @override
  String get dmFriendRequestSentToast => 'दोस्ती का अनुरोध भेजा गया';

  @override
  String get dmFriendRequestFailed => 'मित्र अनुरोध भेजने में विफल';

  @override
  String get dmAcceptFriendRequestFailed =>
      'मित्र अनुरोध स्वीकार करने में विफल';

  @override
  String get dmRemoveFriendFailed => 'दोस्त को हटाने में विफल';

  @override
  String get dmBlockFailed => 'उपयोगकर्ता को ब्लॉक करने में विफल';

  @override
  String get dmUnblockFailed => 'उपयोगकर्ता को अनब्लॉक करने में विफल';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'मित्र अनुरोध को अनदेखा करने में विफल';

  @override
  String get dmAddFriends => 'दोस्त जोड़ें';

  @override
  String get addFriendSheetTitle => 'दोस्त जोड़ें';

  @override
  String get addFriendUsernameHint => 'उपयोगकर्ता नाम#0000';

  @override
  String get addFriendUsernameLabel => 'दोस्त का यूज़रनेम';

  @override
  String get addFriendSendRequest => 'अनुरोध भेजें';

  @override
  String get addFriendNoUserFound => 'इस यूज़रनेम से कोई यूज़र नहीं मिला।';

  @override
  String get addFriendInvalidUsername =>
      'एक मान्य उपयोगकर्ता नाम दर्ज करें (Username#0000).';

  @override
  String get addFriendOutgoingSuccess => 'दोस्ती का अनुरोध भेजा गया';

  @override
  String get addFriendClaimTitle => 'अपना अकाउंट क्लेम करें';

  @override
  String get addFriendClaimDescription =>
      'फ्रेंड रिक्वेस्ट भेजने के लिए अपना अकाउंट क्लेम करें।';

  @override
  String get addFriendVerifyTitle => 'अपना ईमेल वेरिफाई करें';

  @override
  String get addFriendVerifyDescription =>
      'फ्रेंड रिक्वेस्ट भेजने से पहले आपको अपना ईमेल पता वेरिफ़ाई करना होगा।';

  @override
  String get addFriendVerifyEmail => 'ईमेल वेरिफ़ाई करें';

  @override
  String addFriendIncomingRequests(int count) {
    return 'आने वाले फ्रेंड रिक्वेस्ट ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'बाहरी मित्र अनुरोध ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'आने वाली दोस्त की रिक्वेस्ट';

  @override
  String get addFriendOutgoingStatus => 'दोस्ती का अनुरोध भेजा गया';

  @override
  String get addFriendViewProfile => 'प्रोफ़ाइल देखें';

  @override
  String get addFriendAccept => 'स्वीकार करें';

  @override
  String get addFriendIgnore => 'नज़रअंदाज़ करें';

  @override
  String get addFriendAcceptTitle => 'मित्रता अनुरोध स्वीकार करें';

  @override
  String get addFriendIgnoreTitle => 'दोस्ती का अनुरोध अनदेखा करें';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '$userName की फ्रेंड रिक्वेस्ट स्वीकार करें?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'क्या आप $displayName की फ्रेंड रिक्वेस्ट को अनदेखा करना चाहते हैं?';
  }

  @override
  String get addFriendCancelRequest => 'अनुरोध रद्द करें';

  @override
  String get addFriendCancelRequestFailed =>
      'मित्रता अनुरोध रद्द नहीं कर पाए। फिर से कोशिश करें।';

  @override
  String get addFriendNotAcceptingRequests =>
      'वे अभी मित्र अनुरोध स्वीकार नहीं कर रहे हैं।';

  @override
  String get addFriendUnblockFirst =>
      'मित्रता अनुरोध भेजने के लिए पहले उन्हें अनब्लॉक करें।';

  @override
  String get addFriendCannotSendToSelf =>
      'आप खुद को फ्रेंड रिक्वेस्ट नहीं भेज सकते।';

  @override
  String get addFriendAlreadyFriends => 'आप पहले से ही इस यूज़र के दोस्त हैं।';

  @override
  String get addFriendClaimToSend =>
      'मित्रता अनुरोध भेजने के लिए साइन अप पूरा करें।';

  @override
  String get addFriendVerifyToSend =>
      'मित्रता अनुरोध भेजने से पहले अपना ईमेल सत्यापित करें।';

  @override
  String get addFriendFriendsListFull =>
      'आपकी या उनकी मित्र सूची भर गई है। किसी को हटाएँ और फिर से कोशिश करें।';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'सिस्टम';

  @override
  String get emojiSearchPlaceholder => 'अपनी पसंद की इमोजी ढूंढें';

  @override
  String get emojiSearchEmpty => 'कोई इमोजी आपके खोज से मेल नहीं खाती';

  @override
  String get emojiAutocompleteDefaultLabel => 'डिफ़ॉल्ट इमोजी';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'यह $productName पर एक डिफ़ॉल्ट इमोजी है।';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'यह इमोजी इस समुदाय से है। आप इसे कहीं भी इस्तेमाल कर सकते हैं।';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'यह किसी समुदाय का कस्टम इमोजी है।';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'यह एक समुदाय का कस्टम इमोजी है। इस इमोजी का इस्तेमाल करने के लिए लेखक से इनवाइट मांगें।';

  @override
  String get emojiInfoFromHeader => 'यह इमोजी से है';

  @override
  String get emojiInfoDiscoverableCommunity => 'डिस्कवरेबल कम्युनिटी';

  @override
  String get emojiInfoPrivateCommunity => 'निजी समुदाय';

  @override
  String get emojiInfoVerifiedCommunity => 'पुष्टि किया गया समुदाय';

  @override
  String get emojiInfoAddToFavorites => 'पसंदीदा में जोड़ें';

  @override
  String get emojiInfoRemoveFromFavorites => 'पसंदीदा से हटाएं';

  @override
  String get emojiFrequentlyUsed => 'अक्सर इस्तेमाल किए जाने वाले';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'मीडिया';

  @override
  String get emojiTabStickers => 'स्टिकर';

  @override
  String get emojiTabEmojis => 'इमोजी';

  @override
  String get gifPickerSearch => 'GIF खोजें';

  @override
  String get gifPickerSearchKlipy => 'KLIPY खोजें';

  @override
  String get gifPickerSearchTenor => 'Tenor पर खोजें';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'पसंदीदा';

  @override
  String get gifPickerFavoritesEmptyTitle => 'अभी तक कोई पसंदीदा GIF नहीं है';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'यहां देखने के लिए किसी GIF को स्टार करें।';

  @override
  String get gifPickerTrending => 'ट्रेंडिंग GIF';

  @override
  String get gifPickerNoResultsTitle => 'कोई खोज परिणाम नहीं';

  @override
  String get gifPickerNoResultsDescription => 'कोई दूसरा सर्च टर्म आज़माएं';

  @override
  String get gifPickerLoadFailedTitle => 'GIF लोड नहीं हो सके';

  @override
  String get gifPickerLoadFailedBody =>
      'अपना कनेक्शन जांचें और फिर से कोशिश करें।';

  @override
  String get emojiCategoryPeople => 'लोग';

  @override
  String get emojiCategoryNature => 'प्रकृति';

  @override
  String get emojiCategoryFood => 'खाना और पीना';

  @override
  String get emojiCategoryActivity => 'गतिविधियां';

  @override
  String get emojiCategoryTravel => 'यात्रा और स्थान';

  @override
  String get emojiCategoryObjects => 'ऑब्जेक्ट';

  @override
  String get emojiCategorySymbols => 'चिह्न';

  @override
  String get emojiCategoryFlags => 'झंडे';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Plutonium के साथ $communityCount से $emojiCount अनलॉक करें।';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Plutonium पाएं';

  @override
  String get emojiPlutoniumUpsellDismiss => 'दोबारा न दिखाएँ';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कस्टम इमोजी',
      one: '1 कस्टम इमोजी',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count समुदाय',
      one: '1 समुदाय',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'बाहरी लिंक चेतावनी';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'आप $productName छोड़ने वाले हैं';
  }

  @override
  String get externalLinkWarningDescription =>
      'बाहरी लिंक खतरनाक हो सकते हैं। कृपया सावधान रहें।';

  @override
  String get externalLinkWarningDestinationUrl => 'गंतव्य यूआरएल:';

  @override
  String get externalLinksSectionTitle => 'बाहरी लिंक';

  @override
  String get externalLinksSectionDescription =>
      'बाहरी लिंक चेतावनियों को कैसे संभाला जाए, इसे कॉन्फ़िगर करें।';

  @override
  String get externalLinkWarningTrustPrefix => 'हमेशा भरोसा करें';

  @override
  String get externalLinkWarningTrustSuffix =>
      '— अगली बार इस चेतावनी को छोड़ें';

  @override
  String get externalLinkVisitSite => 'साइट पर जाएँ';

  @override
  String get externalLinkTrustAllLabel => 'सभी बाहरी लिंक पर भरोसा करें';

  @override
  String get externalLinkStripTrackingLabel =>
      'यूआरएल से ट्रैकिंग पैरामीटर हटाएँ';

  @override
  String get externalLinkStripTrackingDescription =>
      'आपके भेजे गए मैसेज में मौजूद URL से ट्रैकिंग पैरामीटर (जैसे utm_source, fbclid, gclid) अपने आप हटा दिए जाते हैं. लिंक किसी और तक पहुँचने से पहले ही साफ़ हो जाता है.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'सभी बाहरी लिंक पर भरोसा करें?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'इससे सभी बाहरी लिंक पर भरोसा किया जाएगा और हर डोमेन के लिए चेतावनी को छोड़ दिया जाएगा. आपके मौजूदा भरोसेमंद डोमेन बदल दिए जाएँगे. यह कम सुरक्षित है.';

  @override
  String get externalLinkTrustAllConfirmAction => 'सभी पर भरोसा करें';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'सभी लिंक पर भरोसा करना बंद करें?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'बाहरी लिंक की चेतावनियां फिर से दिखाई जाएंगी। आपको विश्वसनीय डोमेन को एक-एक करके जोड़ना होगा।';

  @override
  String get externalLinkStopTrustingAllAction => 'सभी पर भरोसा करना बंद करें';

  @override
  String get externalLinkTrustedAllDescription =>
      'सभी बाहरी लिंक विश्वसनीय हैं। चेतावनियाँ नहीं दिखाई जाएँगी।';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'आपके पास $count विश्वसनीय डोमेन हैं। बाहरी लिंक पर जाते समय बॉक्स को चेक करके और जोड़ें।';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'सक्षम होने पर, बाहरी लिंक की कोई चेतावनी नहीं दिखाई जाएगी। यह कम सुरक्षित है।';

  @override
  String get imageFileTooLarge =>
      'छवि फ़ाइल बहुत बड़ी है। कृपया 10 MB से छोटी फ़ाइल चुनें।';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'एनिमेटेड अवतारों के लिए Plutonium की आवश्यकता होती है';

  @override
  String get animatedBannersRequirePlutonium =>
      'एनिमेटेड बैनर के लिए Plutonium की आवश्यकता होती है';

  @override
  String get animatedAvifNotSupported => 'एनिमेटेड AVIF समर्थित नहीं है';

  @override
  String get animatedAvifNotSupportedBody =>
      'एनिमेटेड AVIF फ़ाइलों को क्रॉप करना और घुमाना अभी समर्थित नहीं है। यदि आप आगे बढ़ते हैं, तो इसे इसके मूल रूप में अपलोड किया जाएगा।';

  @override
  String get uploadAsIs => 'जैसा है अपलोड करें';

  @override
  String get croppingAnimatedNotSupported =>
      'एनिमेटेड इमेज को क्रॉप करना अभी समर्थित नहीं है। मूल अपलोड का उपयोग किया जाएगा।';

  @override
  String get cropAvatar => 'अवतार क्रॉप करें';

  @override
  String get cropBanner => 'बैनर क्रॉप करें';

  @override
  String get skip => 'छोड़ें';

  @override
  String get crop => 'क्रॉप';

  @override
  String get cropTouchHint =>
      'ज़ूम करने के लिए पिंच करें, रीपोजिशन करने के लिए ड्रैग करें';

  @override
  String get cropMouseHint => 'कोनों को खींचकर आकार बदलें, अंदर खींचकर ले जाएँ';

  @override
  String get changeYourFluxerTag => 'अपना यूज़रनेम बदलें';

  @override
  String get fluxerTagInputLabel => 'यूज़रनेम';

  @override
  String get fluxerTagDescriptionBase =>
      'यूज़रनेम में सिर्फ़ अक्षर (a-z, A-Z), नंबर (0-9) और अंडरस्कोर हो सकते हैं। यूज़रनेम केस-इनसेंसिटिव होते हैं।';

  @override
  String get fluxerTagDescriptionVisionary =>
      'उपयोगकर्ता नाम में केवल अक्षर (a-z, A-Z), संख्याएँ (0-9) और अंडरस्कोर हो सकते हैं। उपयोगकर्ता नाम केस-इनसेंसिटिव होते हैं। आप #0000 से #9999 तक कोई भी उपलब्ध 4-अंकीय टैग चुन सकते हैं।';

  @override
  String get fluxerTagDescriptionPremium =>
      'उपयोगकर्ता नाम में केवल अक्षर (a-z, A-Z), संख्याएँ (0-9) और अंडरस्कोर हो सकते हैं। उपयोगकर्ता नाम केस-संवेदी नहीं होते हैं। आप #0001 से #9999 तक कोई भी उपलब्ध 4-अंकीय टैग चुन सकते हैं।';

  @override
  String validationLengthRange(int min, int max) {
    return '$min और $max कैरेक्टर के बीच';
  }

  @override
  String get validationAllowedChars =>
      'केवल अक्षर (a-z, A-Z), संख्याएँ (0-9) और अंडरस्कोर (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'अपना टैग कस्टमाइज़ करने या अपना यूज़रनेम बदलते समय उसे रखने के लिए Plutonium प्राप्त करें';

  @override
  String get fluxerTagAlreadyTaken => 'उपयोगकर्ता नाम पहले से ही लिया हुआ है';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'उपयोगकर्ता नाम $username#$discriminator पहले से ही लिया हुआ है। जारी रखने पर आपका डिस्क्रिमिनेटर अपने आप बदल जाएगा।';
  }

  @override
  String get customTagIsTemporary => 'कस्टम टैग अस्थायी है';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'आपका कस्टम 4-अंकीय टैग तभी उपलब्ध होगा जब आपकी Plutonium सदस्यता सक्रिय होगी। जब आपकी सदस्यता $date को समाप्त हो जाएगी, तो 3-दिन की छूट अवधि के बाद आपका टैग बेतरतीब ढंग से असाइन किए गए नंबर पर वापस आ जाएगा।';
  }

  @override
  String get customTagTemporaryBody =>
      'आपका कस्टम 4-अंकीय टैग तभी उपलब्ध है जब आपकी Plutonium सदस्यता सक्रिय हो। जब आपकी सदस्यता समाप्त हो जाएगी, तो 3-दिन की छूट अवधि के बाद आपका टैग एक रैंडम रूप से असाइन किए गए नंबर पर वापस आ जाएगा।';

  @override
  String get iUnderstandContinue => 'मैं समझ गया, जारी रखें';

  @override
  String get premiumWarningPendingDiscriminator =>
      'अगर आप यह यूज़रनेम सेव करते हैं, तो आपकी Plutonium सदस्यता खत्म होने पर आपका कस्टम 4-अंकों वाला टैग एक रैंडम नंबर में बदल जाएगा। अगर आपकी सदस्यता रिन्यू नहीं हो पाती है, तो टैग बदलने से पहले आपके पास 3 दिन की छूट अवधि होगी।';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'आपकी कस्टम 4-अंकीय टैग (#$discriminator) तब तक सक्रिय है जब तक आपकी Plutonium सदस्यता सक्रिय है। यदि आपकी सदस्यता समाप्त हो जाती है या 3-दिन की छूट अवधि के बाद नवीनीकृत नहीं होती है, तो आपकी टैग एक रैंडम संख्या में वापस आ जाएगी।';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'अपने 4-अंकीय टैग को कस्टमाइज़ करें या उपयोगकर्ता नाम बदलते समय इसे रखें';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'आपका Plutonium ट्रायल $date को समाप्त हो रहा है। अपना कस्टम टैग रखने और अपनी प्रोफ़ाइल पर बैज अर्जित करने के लिए अपग्रेड करें।';
  }

  @override
  String get premiumTrialActive =>
      'आप Plutonium ट्रायल पर हैं। अपना कस्टम टैग रखने और अपनी प्रोफ़ाइल पर बैज अर्जित करने के लिए अपग्रेड करें।';

  @override
  String get fluxerTagUpdated => 'यूज़रनेम अपडेट किया गया';

  @override
  String get fluxerTagUpdateFailed =>
      'उपयोगकर्ता नाम अपडेट करने में विफल। कृपया पुनः प्रयास करें।';

  @override
  String get continueAction => 'जारी रखें';

  @override
  String get profileCustomizationTitle => 'प्रोफ़ाइल कस्टमाइज़ेशन';

  @override
  String get profileCustomizationDescription =>
      'अपनी प्रोफ़ाइल का स्वरूप बदलें और लाइव प्रीव्यू देखें';

  @override
  String get usernameLabel => 'यूज़रनेम';

  @override
  String get claimAccountToChangeFluxerTag =>
      'अपना यूज़रनेम बदलने के लिए अपना अकाउंट क्लेम करें';

  @override
  String get changeFluxerTag => 'यूज़रनेम बदलें';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Plutonium के साथ अपनी 4-अंकीय टैग (#$discriminator) को अपनी पसंद के अनुसार अनुकूलित करें';
  }

  @override
  String get changeUsernameAndTagHint => 'अपना यूज़रनेम और 4-अंकीय टैग बदलें';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'आपका कस्टम टैग (#$discriminator) आपकी Plutonium सदस्यता से जुड़ा है और इसकी समय-सीमा समाप्त होने पर यह एक रैंडम टैग में बदल जाएगा।';
  }

  @override
  String get displayNameLabel => 'डिस्प्ले नाम';

  @override
  String get pronounsLabel => 'सर्वनाम';

  @override
  String get avatarLabel => 'अवतार';

  @override
  String get changeAvatar => 'अवतार बदलें';

  @override
  String get removeAvatar => 'अवतार हटाएं';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. अधिकतम 10MB. अनुशंसित: 512×512px';

  @override
  String get bannerLabel => 'बैनर';

  @override
  String get changeBanner => 'बैनर बदलें';

  @override
  String get removeBanner => 'बैनर हटाएं';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. अधिकतम 10MB. न्यूनतम: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'एक्सेंट रंग';

  @override
  String get accentColorDescription =>
      'आपकी प्रोफ़ाइल पर बॉर्डर और बैनर का रंग कस्टमाइज़ करता है';

  @override
  String get aboutMeLabel => 'मेरे बारे में';

  @override
  String get aboutMeHelperText =>
      'आप लिंक, इमोजी और मार्कडाउन का उपयोग कर सकते हैं।';

  @override
  String get emojiPickerTitle => 'इमोजी';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium बैज गोपनीयता';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'नियंत्रित करें कि आपका Plutonium बैज दूसरों को कैसे दिखाई देता है';

  @override
  String get hidePlutoniumBadgeLabel => 'Plutonium बैज को पूरी तरह से छिपाएँ';

  @override
  String get hidePlutoniumBadgeDescription =>
      'अन्य उपयोगकर्ताओं से अपना Plutonium बैज पूरी तरह से छिपाएँ';

  @override
  String get hidePlutoniumPurchaseDate => 'Plutonium खरीदने की तारीख छिपाएँ';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Plutonium खरीद की तारीख छिपाएँ ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'जब आपने पहली बार Plutonium खरीदा था, तो उसे अपने बैज से हटा दें';

  @override
  String get maskVisionaryAsSubscription =>
      'मास्क विजनरी को सदस्यता के रूप में';

  @override
  String get maskVisionaryDescription =>
      'अपनी विजनरी को सामान्य सदस्यता के तौर पर दिखाएँ';

  @override
  String get hideVisionaryIdBadge => 'विजनरी आईडी बैज छिपाएँ';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Visionary ID बैज छिपाएँ (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'अपना विजनरी आईडी बैज हटाएँ';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'आप Plutonium ट्रायल पर हैं — आपकी सदस्यता $date को शुरू होगी';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'आपकी सदस्यता परीक्षण समाप्त होने पर स्वतः शुरू हो जाएगी। किसी कार्रवाई की आवश्यकता नहीं है।';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'आप Plutonium के ट्रायल पर हैं, जो $date को खत्म हो जाएगा';
  }

  @override
  String get premiumTrialActiveProfile => 'आप Plutonium के ट्रायल पर हैं';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. अधिकतम 10MB. अनुशंसित: 512×512px. एनिमेटेड अवतार (GIF) के लिए Plutonium की आवश्यकता होती है।';

  @override
  String get bannerPlutoniumUpsell =>
      'अपनी प्रोफ़ाइल को अलग दिखाने के लिए एक स्थिर या एनिमेटेड बैनर इमेज के साथ कस्टमाइज़ करें।';

  @override
  String get getPlutonium => 'Plutonium पाएं';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'इस प्लेटफ़ॉर्म पर इन-ऐप खरीदारी अभी उपलब्ध नहीं है। बने रहें — जल्द ही आ रहा है!';

  @override
  String get profilePreviewLabel => 'प्रीव्यू';

  @override
  String get profilePreviewMessage => 'मैसेज करें';

  @override
  String profilePreviewMemberSince(String productName) {
    return '$productName सदस्य बने';
  }

  @override
  String get unclaimedAccountTitle => 'अ claimed खाता';

  @override
  String get unclaimedAccountDescription =>
      'आपका खाता अभी तक दावा नहीं किया गया है। ईमेल और पासवर्ड के बिना, आप पहुंच खो सकते हैं। इसे सुरक्षित करने के लिए अभी अपने खाते का दावा करें।';

  @override
  String get claimAccount => 'खाता दावा करें';

  @override
  String get profileTypeLabel => 'प्रोफ़ाइल प्रकार';

  @override
  String get profileTypeGlobal => 'ग्लोबल प्रोफ़ाइल';

  @override
  String get profileTypeGuildDescription =>
      'आप अपनी कम्युनिटी-विशिष्ट प्रोफ़ाइल एडिट कर रहे हैं. यह प्रोफ़ाइल सिर्फ़ इसी कम्युनिटी में दिखेगी और आपकी ग्लोबल प्रोफ़ाइल को ओवरराइड कर देगी.';

  @override
  String get communityNicknameLabel => 'समुदाय का उपनाम';

  @override
  String get perGuildPremiumUpsellText =>
      'अपने अवतार, बैनर, एक्सेंट रंग और बायो को अलग-अलग कम्युनिटी के लिए कस्टमाइज़ करने के लिए Plutonium की ज़रूरत होती है. कम्युनिटी का निकनेम और प्रोनाउन सभी के लिए मुफ़्त हैं.';

  @override
  String get avatarModeInherit => 'ग्लोबल प्रोफ़ाइल का उपयोग करें';

  @override
  String get avatarModeCustom => 'कस्टम इमेज का उपयोग करें';

  @override
  String get avatarModeUnset => 'न दिखाएँ';

  @override
  String get profileSavedToast => 'प्रोफ़ाइल अपडेट की गई';

  @override
  String get profileEditButton => 'प्रोफ़ाइल संपादित करें';

  @override
  String get profileNoteLabel => 'नोट';

  @override
  String get profileNoteVisibility => '(सिर्फ आपको दिखेगा)';

  @override
  String get profileNoteEmpty => 'अभी तक कोई नोट नहीं।';

  @override
  String get sudoTitle => 'अपनी पहचान सत्यापित करें';

  @override
  String get sudoDescription =>
      'इस क्रिया को जारी रखने के लिए सत्यापन की आवश्यकता है।';

  @override
  String get sudoAuthenticatorCode => 'ऑथेंटिकेटर कोड';

  @override
  String get sudoMethodPassword => 'पासवर्ड';

  @override
  String get sudoMethodTotp => 'ऑथेंटिकेटर';

  @override
  String get sudoVerificationFailed =>
      'सत्यापन विफल रहा। कृपया पुनः प्रयास करें।';

  @override
  String get securityAccountTitle => 'अकाउंट';

  @override
  String get securityAccountDescription =>
      'अपना ईमेल, पासवर्ड और खाता सेटिंग प्रबंधित करें';

  @override
  String get securitySectionTitle => 'सुरक्षा';

  @override
  String get securitySectionDescription =>
      'टू-फ़ैक्टर ऑथेंटिकेशन और पासकी से अपने अकाउंट को सुरक्षित रखें';

  @override
  String get securityLoginEmailSectionTitle => 'ईमेल सेटिंग्स';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return '$productName में साइन इन करने के लिए आप जिस ईमेल पते का उपयोग करते हैं, उसे प्रबंधित करें';
  }

  @override
  String get securityLoginEmailAddressLabel => 'ईमेल पता';

  @override
  String get securityLoginNoEmailSet => 'कोई ईमेल पता सेट नहीं है';

  @override
  String get securityLoginChangeEmail => 'ईमेल बदलें';

  @override
  String get securityLoginAddEmail => 'ईमेल जोड़ें';

  @override
  String get securityLoginReveal => 'दिखाएँ';

  @override
  String get securityLoginHide => 'छुपाएँ';

  @override
  String get securityLoginPasswordSectionTitle => 'पासवर्ड';

  @override
  String get securityLoginPasswordSectionDescription =>
      'अपने खाते को सुरक्षित रखने के लिए अपना पासवर्ड बदलें';

  @override
  String get securityLoginCurrentPasswordLabel => 'वर्तमान पासवर्ड';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'पिछली बार बदला गया: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'पिछली बार बदला गया: कभी नहीं';

  @override
  String get securityLoginNoPasswordSet => 'कोई पासवर्ड सेट नहीं है';

  @override
  String get securityLoginChangePassword => 'पासवर्ड बदलें';

  @override
  String get securityLoginSetPassword => 'पासवर्ड सेट करें';

  @override
  String get passwordChangeTitle => 'पासवर्ड बदलें';

  @override
  String get passwordChangeIntroDescription =>
      'हम आपका पासवर्ड बदलने से पहले आपकी पहचान की पुष्टि करने के लिए आपके ईमेल पते पर एक सत्यापन कोड भेजेंगे।';

  @override
  String get passwordChangeStart => 'शुरू करें';

  @override
  String get passwordChangeVerifyTitle => 'अपना ईमेल सत्यापित करें';

  @override
  String get passwordChangeVerifyDescription =>
      'अपने ईमेल पते पर भेजा गया सत्यापन कोड दर्ज करें।';

  @override
  String get passwordChangeVerificationCode => 'सत्यापन कोड';

  @override
  String get passwordChangeVerify => 'वेरीफाई करें';

  @override
  String get passwordChangeNewPasswordTitle => 'नया पासवर्ड सेट करें';

  @override
  String get passwordChangeNewPasswordDescription =>
      'अपना नया पासवर्ड नीचे दर्ज करें।';

  @override
  String get passwordChangeNewPassword => 'नया पासवर्ड';

  @override
  String get passwordChangeConfirmPassword => 'नया पासवर्ड कन्फर्म करें';

  @override
  String get passwordChangeSubmit => 'पासवर्ड बदलें';

  @override
  String get passwordChangeSuccess => 'पासवर्ड बदल दिया गया';

  @override
  String get passwordChangePasswordsDoNotMatch => 'पासवर्ड मेल नहीं खाते';

  @override
  String get passwordChangeInvalidCode => 'अमान्य या समय-सीमा समाप्त कोड';

  @override
  String get emailChangeTitle => 'ईमेल बदलें';

  @override
  String get emailChangeIntroDescription =>
      'हम आपका ईमेल पता बदलने से पहले आपकी पहचान सत्यापित करने के लिए सत्यापन कोड भेजेंगे।';

  @override
  String get emailChangeStart => 'शुरू करें';

  @override
  String get emailChangeVerifyOriginalTitle => 'वर्तमान ईमेल सत्यापित करें';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'अपने वर्तमान ईमेल पते पर भेजा गया सत्यापन कोड दर्ज करें।';

  @override
  String get emailChangeNewEmailTitle => 'नया ईमेल दर्ज करें';

  @override
  String get emailChangeNewEmailDescription =>
      'आप जिस नए ईमेल पते का उपयोग करना चाहते हैं, उसे दर्ज करें।';

  @override
  String get emailChangeNewEmailLabel => 'नया ईमेल';

  @override
  String get emailChangeNewEmailSubmit => 'सत्यापन कोड भेजें';

  @override
  String get emailChangeVerifyNewTitle => 'नया ईमेल सत्यापित करें';

  @override
  String get emailChangeVerifyNewDescription =>
      'अपने नए ईमेल पते पर भेजा गया सत्यापन कोड दर्ज करें।';

  @override
  String get emailChangeSuccess => 'ईमेल बदल गया';

  @override
  String get emailChangeInvalidCode => 'अमान्य या समय-सीमा समाप्त कोड';

  @override
  String get resend => 'फिर से भेजें';

  @override
  String resendCountdown(int seconds) {
    return 'फिर से भेजें ($secondsसेकंड)';
  }

  @override
  String get verificationCode => 'सत्यापन कोड';

  @override
  String get verify => 'वेरीफाई करें';

  @override
  String get enable => 'चालू करें';

  @override
  String get disable => 'बंद करें';

  @override
  String get delete => 'मिटाएँ';

  @override
  String get save => 'सेव करें';

  @override
  String get securityTfaSectionTitle => 'टू-फैक्टर ऑथेंटिकेशन';

  @override
  String get securityTfaSectionDescription =>
      'अपने अकाउंट में सुरक्षा की एक और लेयर जोड़ें';

  @override
  String get securityTfaAuthenticatorApp => 'ऑथेंटिकेटर ऐप';

  @override
  String get securityTfaAuthenticatorEnabled => 'दो-कारक प्रमाणीकरण चालू है';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'दो-कारक प्रमाणीकरण के लिए कोड जनरेट करने के लिए एक ऑथेंटिकेटर ऐप का उपयोग करें';

  @override
  String get securityTfaBackupCodes => 'बैकअप कोड';

  @override
  String get securityTfaBackupCodesDescription =>
      'अपने अकाउंट रिकवरी के लिए बैकअप कोड देखें और मैनेज करें';

  @override
  String get securityTfaViewCodes => 'कोड देखें';

  @override
  String get securityPasskeysSectionTitle => 'पासकी';

  @override
  String get securityPasskeysSectionDescription =>
      'पासवर्ड-रहित साइन-इन और दो-कारक प्रमाणीकरण के लिए पासकी का उपयोग करें';

  @override
  String get securityPasskeysRegistered => 'पंजीकृत पासकी';

  @override
  String get securityPasskeysNone => 'कोई पासकी पंजीकृत नहीं है';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'पासकी',
      one: 'पासकी',
    );
    return '$count $_temp0 पंजीकृत (अधिकतम 10)';
  }

  @override
  String get securityPasskeysAdd => 'पासकी जोड़ें';

  @override
  String securityPasskeysAdded(String date) {
    return 'जोड़ा गया: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'पिछली बार इस्तेमाल किया गया: $date';
  }

  @override
  String get securityPasskeysRename => 'नाम बदलें';

  @override
  String get securityPasskeysDeleteTitle => 'पासकी हटाएं';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'क्या आप वाकई पासकी \"$name\" को हटाना चाहते हैं?';
  }

  @override
  String get securityPasskeyNameTitle => 'पासकी का नाम';

  @override
  String get securityPasskeyNameLabel => 'पासकी का नाम';

  @override
  String get securityPasskeyNameHint => 'जैसे, YubiKey, iPhone, वर्क कंप्यूटर';

  @override
  String get securityPhoneSectionTitle => 'फ़ोन नंबर';

  @override
  String get securityPhoneSectionDescription => 'अपना फ़ोन नंबर प्रबंधित करें।';

  @override
  String get securityPhoneLabel => 'फ़ोन नंबर';

  @override
  String get securityPhoneNone => 'कोई फ़ोन नंबर नहीं जोड़ा गया।';

  @override
  String get securityPhoneAdd => 'फ़ोन जोड़ें';

  @override
  String get securityPhoneRemove => 'हटाएँ';

  @override
  String get securityPhoneRemoveTitle => 'फ़ोन नंबर हटाएँ';

  @override
  String get securityPhoneRemoveDescription =>
      'क्या आप वाकई अपना फ़ोन नंबर हटाना चाहते हैं?';

  @override
  String get securityPhoneRemoved => 'फ़ोन नंबर हटा दिया गया';

  @override
  String get securityClaimTitle => 'सुरक्षा सुविधाएँ';

  @override
  String get securityClaimDescription =>
      'टू-फैक्टर ऑथेंटिकेशन और पासकी जैसे सुरक्षा फ़ीचर ऐक्सेस करने के लिए अपना अकाउंट क्लेम करें।';

  @override
  String get securityVerifyEmailRequired =>
      'दो-कारक प्रमाणीकरण, पासकी या SMS सत्यापन सेट करने से पहले आपको अपना ईमेल पता सत्यापित करना होगा।';

  @override
  String get totpEnableTitle => 'ऑथेंटिकेटर ऐप सेट अप करें';

  @override
  String get totpEnableDescription =>
      'अपने ऑथेंटिकेटर ऐप से क्यूआर कोड स्कैन करें ताकि दो-कारक प्रमाणीकरण के लिए कोड जनरेट हो सकें।';

  @override
  String get totpEnableCodeLabel => 'कोड';

  @override
  String get totpEnableCodeHint =>
      'अपने ऑथेंटिकेटर ऐप से 6-अंकीय कोड दर्ज करें';

  @override
  String get totpEnableSuccess => 'टू-फैक्टर ऑथेंटिकेशन सक्षम कर दिया गया है';

  @override
  String get totpDisableTitle => 'ऑथेंटिकेटर ऐप हटाएं';

  @override
  String get totpDisableDescription =>
      'अपने ऑथेंटिकेटर ऐप से 6-अंकीय कोड दर्ज करें ताकि टू-फैक्टर ऑथेंटिकेशन को डिसेबल किया जा सके।';

  @override
  String get totpDisableSuccess => 'दो-कारक प्रमाणीकरण बंद किया गया';

  @override
  String get backupCodesTitle => 'बैकअप कोड';

  @override
  String get backupCodesWarning =>
      'अगर आप अपने ऑथेंटिकेटर ऐप का ऐक्सेस खो देते हैं और आपके पास ये कोड नहीं हैं, तो आप अपने अकाउंट से स्थायी रूप से लॉक हो जाएंगे। इन्हें अभी डाउनलोड या कॉपी करें और कहीं सुरक्षित जगह पर रखें।';

  @override
  String get backupCodesDownload => 'डाउनलोड करें';

  @override
  String get backupCodesCopy => 'कॉपी करें';

  @override
  String get backupCodesCopied => 'बैकअप कोड क्लिपबोर्ड पर कॉपी किए गए';

  @override
  String get backupCodesAcknowledge =>
      'मैंने अपने बैकअप कोड डाउनलोड या कॉपी कर लिए हैं और उन्हें सुरक्षित स्थान पर रख दिया है।';

  @override
  String get backupCodesDone => 'हो गया';

  @override
  String get backupCodesViewTitle => 'बैकअप कोड देखें';

  @override
  String get backupCodesViewDescription =>
      'अपने बैकअप कोड देखने से पहले सत्यापन की आवश्यकता हो सकती है।';

  @override
  String get phoneAddTitle => 'फ़ोन नंबर जोड़ें';

  @override
  String get phoneAddLabel => 'फ़ोन नंबर';

  @override
  String get phoneAddHint => 'अपना फ़ोन नंबर डालें';

  @override
  String get phoneAddFooter =>
      'हम उपलब्ध होने पर एक SMS कोड भेजेंगे। आपका नंबर आपके खाते से लिंक नहीं है। हम केवल एक एन्क्रिप्टेड मार्कर रखते हैं, जिसमें कोई उपयोगकर्ता आईडी नहीं होती है, ताकि लगभग 30 दिनों में अधिकतम 2 सत्यापन की अनुमति मिल सके।';

  @override
  String get phoneAddSendCode => 'कोड भेजें';

  @override
  String get phoneVerifyTitle => 'फ़ोन नंबर सत्यापित करें';

  @override
  String get phoneVerifyDescription =>
      'अपने फ़ोन नंबर पर भेजा गया सत्यापन कोड दर्ज करें।';

  @override
  String get phoneAddSuccess => 'फ़ोन नंबर वेरिफ़ाई हो गया';

  @override
  String get phoneCountryLabel => 'देश';

  @override
  String get phoneSearchCountries => 'देशों को खोजें...';

  @override
  String get phoneNumberRequired => 'फ़ोन नंबर ज़रूरी है';

  @override
  String get phoneEnterValidNumber => 'एक मान्य मोबाइल फ़ोन नंबर डालें।';

  @override
  String get phoneCannotBeUsed =>
      'इस फ़ोन नंबर का उपयोग नहीं किया जा सकता है। कोई दूसरा मोबाइल नंबर आज़माएँ या सहायता से संपर्क करें।';

  @override
  String get phoneAlreadyUsed =>
      'यह फ़ोन नंबर पहले ही इस्तेमाल किया जा चुका है। कोई दूसरा नंबर आज़माएँ या सहायता से संपर्क करें।';

  @override
  String get phoneCodeDidNotWork =>
      'वह कोड काम नहीं किया। इसे जांचें और फिर से कोशिश करें।';

  @override
  String get phoneTooManyAttempts =>
      'बहुत ज़्यादा कोशिशें की गई हैं। थोड़ी देर इंतज़ार करें, फिर से कोशिश करें।';

  @override
  String get phoneSmsUnavailable =>
      'SMS सत्यापन अभी अनुपलब्ध है। बाद में फिर से कोशिश करें या सहायता से संपर्क करें।';

  @override
  String get phoneNotEligible =>
      'इस खाते के लिए फ़ोन सत्यापन उपलब्ध नहीं है. कोई अन्य तरीका इस्तेमाल करें या सहायता से संपर्क करें.';

  @override
  String get phoneCaptchaRequired =>
      'फ़ोन सत्यापन से पहले ब्राउज़र की जाँच ज़रूरी है। साइन-इन पेज से फिर से कोशिश करें या सहायता से संपर्क करें।';

  @override
  String get phoneSomethingWentWrong => 'कुछ गड़बड़ हो गई। फिर से कोशिश करें।';

  @override
  String get phoneInboundExpensiveDescription =>
      'इस फ़ोन नंबर पर SMS भेजना बहुत महंगा है, इसलिए हमें आपसे SMS भेजने की आवश्यकता है। आप हमसे संपर्क करके अपने खाते से इस आवश्यकता को हटवा भी सकते हैं।';

  @override
  String get phoneInboundDefaultDescription =>
      'हमें आपके फ़ोन नंबर को सत्यापित करने के लिए एक SMS भेजने की आवश्यकता है।';

  @override
  String get phoneInboundStepOpenMessaging =>
      'अपने फ़ोन का मैसेजिंग ऐप खोलें और एक नया टेक्स्ट मैसेज बनाएँ।';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return '$code को $number पर भेजें।';
  }

  @override
  String get phoneInboundStepWait =>
      'आपके संदेश के प्राप्त होने की प्रतीक्षा करें। इसमें एक मिनट लग सकता है।';

  @override
  String get phoneInboundGetNewCode => 'नया कोड पाएं';

  @override
  String get phoneInboundChallengeCodeLabel => 'भेजने के लिए कोड';

  @override
  String get phoneInboundOurNumberLabel => 'इस पर भेजें';

  @override
  String get requiredActionTitle => 'खाता सत्यापन ज़रूरी है';

  @override
  String requiredActionIntroGeneric(String productName) {
    return '$productName का उपयोग जारी रखने के लिए आवश्यक सत्यापन पूरा करें।';
  }

  @override
  String get requiredActionIntroPhone =>
      'जारी रखने से पहले आपके रजिस्ट्रेशन के लिए एक अतिरिक्त एंटी-स्पैम जाँच की ज़रूरत है।';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return '$productName का उपयोग जारी रखने के लिए अपना ईमेल या फ़ोन सत्यापित करें।';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return '$productName का उपयोग जारी रखने के लिए नीचे दिए गए आवश्यक ईमेल और फ़ोन सत्यापन चरणों को पूरा करें।';
  }

  @override
  String get requiredActionChooseMethodTitle => 'सत्यापन विधि चुनें';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return '$productName का उपयोग जारी रखने के लिए नीचे दिए गए सत्यापन पाथ में से कोई एक पूरा करें।';
  }

  @override
  String get requiredActionUseEmail => 'ईमेल का उपयोग करें';

  @override
  String get requiredActionUsePhone => 'फ़ोन का इस्तेमाल करें';

  @override
  String get requiredActionCheckEmailTitle => 'अपना ईमेल देखें';

  @override
  String get requiredActionCheckEmailDescription =>
      'हमने आपके ईमेल पते पर एक सत्यापन लिंक भेजा है। जारी रखने के लिए उसे खोलें।';

  @override
  String get requiredActionResendVerificationEmail =>
      'सत्यापन ईमेल फिर से भेजें';

  @override
  String get requiredActionVerificationEmailSent =>
      'पुष्टिकरण ईमेल भेजा गया है। अपना इनबॉक्स देखें।';

  @override
  String get requiredActionSignOut => 'साइन आउट करें';

  @override
  String get dangerZoneSectionTitle => 'खतरनाक क्षेत्र';

  @override
  String get dangerZoneSectionDescription =>
      'अपरिवर्तनीय और विनाशकारी क्रियाएं';

  @override
  String get dangerZoneDisableTitle => 'खाता अक्षम करें';

  @override
  String get dangerZoneDisableDescription =>
      'अपना अकाउंट कुछ समय के लिए बंद करें. आप बाद में फिर से साइन इन करके इसे चालू कर सकते हैं.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'आपका अकाउंट डिसेबल करने पर आपको सभी सेशन से लॉग आउट कर दिया जाएगा। आप कभी भी दोबारा लॉग इन करके अपना अकाउंट फिर से इनेबल कर सकते हैं।';

  @override
  String get dangerZoneDeleteTitle => 'खाता हटाएं';

  @override
  String get dangerZoneDeleteDescription =>
      'अपना अकाउंट और उससे जुड़ा सारा डेटा हमेशा के लिए मिटा दें. इस कार्रवाई को पहले जैसा नहीं किया जा सकता.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'अपना खाता हटाने से पहले Plutonium सेटिंग में अपनी सक्रिय Plutonium सदस्यता रद्द करें।';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'खाता नहीं मिटा सकते';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'जब तक आप समुदायों के मालिक हैं, तब तक आप अपना खाता नहीं हटा सकते. पहले इन समुदायों का स्वामित्व ट्रांसफ़र करें:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'और $count अधिक';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'स्वामित्व हस्तांतरित करने के लिए, $settingsPath पर जाएं और स्वामित्व हस्तांतरित करें विकल्प का उपयोग करें।';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'क्या आप वाकई अपना अकाउंट मिटाना चाहते हैं? इस कार्रवाई से आपका अकाउंट हमेशा के लिए मिटाने के लिए शेड्यूल हो जाएगा।';

  @override
  String get dangerZoneDeleteBullet1 =>
      'आप 14 दिनों के अंदर डिलीट करने की प्रक्रिया को रद्द कर सकते हैं';

  @override
  String get dangerZoneDeleteBullet2 =>
      '14 दिनों के बाद, आपका अकाउंट हमेशा के लिए मिटा दिया जाएगा';

  @override
  String get dangerZoneDeleteBullet3 =>
      'एक बार डिलीट होने के बाद, आप अपने अकाउंट का ऐक्सेस वापस नहीं पा सकेंगे';

  @override
  String get dangerZoneDeleteBullet4 =>
      'आपका अकाउंट डिलीट होने के बाद आप अपने भेजे गए मैसेज डिलीट नहीं कर पाएँगे';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'अगर आप अपना डेटा एक्सपोर्ट करना चाहते हैं या पहले अपने मैसेज डिलीट करना चाहते हैं, तो आगे बढ़ने से पहले कृपया यूज़र सेटिंग्स में प्राइवेसी डैशबोर्ड सेक्शन पर जाएं।';

  @override
  String get claimAccountTitle => 'अपना खाता क्लेम करें';

  @override
  String get claimAccountDescription =>
      'ईमेल और पासवर्ड जोड़कर अपना अकाउंट क्लेम करें. पूरा करने से पहले हम आपके ईमेल की पुष्टि करने के लिए एक वेरिफिकेशन कोड भेजेंगे.';

  @override
  String get claimAccountEmailLabel => 'ईमेल';

  @override
  String get claimAccountPasswordLabel => 'पासवर्ड';

  @override
  String get claimAccountSendCode => 'कोड भेजें';

  @override
  String get claimAccountVerifyDescription =>
      'इसे वेरिफ़ाई करने के लिए, हमने आपके ईमेल पर जो कोड भेजा है उसे डालें. कोड कन्फ़र्म होने के बाद आपका पासवर्ड सेट हो जाएगा.';

  @override
  String get claimAccountSuccess => 'खाता सफलतापूर्वक क्लेम किया गया';

  @override
  String get importantInformation => 'ज़रूरी जानकारी:';

  @override
  String get genericError => 'एक त्रुटि हुई';

  @override
  String get networkErrorMessage => 'कुछ गलत हो गया। कृपया पुनः प्रयास करें।';

  @override
  String get invalidCode => 'अमान्य कोड';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count साल पहले',
      one: '1 साल पहले',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count महीने पहले',
      one: '1 महीना पहले',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन पहले',
      one: '1 दिन पहले',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count घंटे पहले',
      one: '1 घंटा पहले',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मिनट पहले',
      one: '1 मिनट पहले',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count हफ़्ते पहले',
      one: '1 हफ़्ते पहले',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मिनट में',
      one: '1 मिनट में',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count घंटे में',
      one: '1 घंटे में',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिनों में',
      one: '1 दिन में',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count हफ़्तों में',
      one: '1 हफ़्ते में',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count महीनों में',
      one: '1 महीने में',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count साल में',
      one: '1 साल में',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'अभी';

  @override
  String get authorizedAppsTitle => 'अधिकृत ऐप्लिकेशन';

  @override
  String authorizedAppsDescription(String productName) {
    return 'इन ऐप्लिकेशन्स को आपके $productName खाते तक पहुँच प्रदान की गई है।';
  }

  @override
  String get authorizedAppsEmptyTitle => 'कोई अधिकृत ऐप्लिकेशन नहीं';

  @override
  String get authorizedAppsEmptyDescription =>
      'आपने अपने खाते को ऐक्सेस करने के लिए किसी भी ऐप्लिकेशन को अनुमति नहीं दी है.';

  @override
  String get authorizedAppsLoadError => 'अधिकृत ऐप्लिकेशन लोड करने में विफल';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return '$date को अधिकृत किया गया';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'अनुमतियाँ दी गईं';

  @override
  String get authorizedAppsRevoke => 'रद्द करें';

  @override
  String get authorizedAppsRevokeTitle => 'एप्लिकेशन एक्सेस रद्द करें';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'क्या आप वाकई $appName के लिए एक्सेस रद्द करना चाहते हैं? इस एप्लिकेशन के पास अब आपके खाते तक पहुंच नहीं होगी।';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'अपनी बुनियादी प्रोफ़ाइल जानकारी (यूज़रनेम, अवतार, आदि) ऐक्सेस करें';

  @override
  String get authorizedAppsScopeEmail => 'अपना ईमेल पता देखें';

  @override
  String get authorizedAppsScopeGuilds =>
      'उन कम्युनिटी को देखें जिनके आप सदस्य हैं';

  @override
  String get authorizedAppsScopeConnections => 'अपने कनेक्ट किए गए खाते देखें';

  @override
  String get authorizedAppsScopeBot =>
      'अनुरोधित अनुमतियों के साथ किसी समुदाय में बॉट जोड़ें';

  @override
  String get authorizedAppsScopeAdmin => 'प्रशासनिक एंडपॉइंट्स तक पहुँचें';

  @override
  String get privacyPendingDeletionTitle => 'हटाया जाना बाकी है';

  @override
  String get blockedUsersTitle => 'ब्लॉक किए गए उपयोगकर्ता';

  @override
  String get blockedUsersDescription =>
      'ब्लॉक किए गए यूज़र आपको फ़्रेंड रिक्वेस्ट नहीं भेज सकते या सीधे मैसेज नहीं कर सकते।';

  @override
  String get blockedUsersEmptyTitle => 'कोई ब्लॉक किए गए उपयोगकर्ता नहीं';

  @override
  String get blockedUsersEmptyDescription =>
      'आपने अभी तक किसी को ब्लॉक नहीं किया है।';

  @override
  String get blockedUsersLoadError =>
      'ब्लॉक किए गए उपयोगकर्ताओं को लोड करने में विफल';

  @override
  String get blockedUsersUnblock => 'ब्लॉक हटाएँ';

  @override
  String get blockedUsersUnblockTitle => 'उपयोगकर्ता को अनब्लॉक करें';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'क्या आप वाकई $username को अनब्लॉक करना चाहते हैं?';
  }

  @override
  String get blockedUsersCopyTag => 'यूज़रनेम कॉपी करें';

  @override
  String get blockedUsersCopyId => 'उपयोगकर्ता आईडी कॉपी करें';

  @override
  String get userProfileLoadError => 'प्रोफ़ाइल लोड नहीं हो सकी';

  @override
  String get userProfileLoading => 'प्रोफ़ाइल लोड हो रही है';

  @override
  String get userProfileRetry => 'पुनः प्रयास करें';

  @override
  String get userProfileMessage => 'मैसेज करें';

  @override
  String get userProfileVoiceCall => 'वॉयस कॉल';

  @override
  String get userProfileVideoCall => 'वीडियो कॉल';

  @override
  String get userProfileEditProfile => 'प्रोफ़ाइल संपादित करें';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName स्टाफ़';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName समुदाय टीम';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName पार्टनर';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName बग हंटर';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return '$productName Plutonium';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium सब्सक्राइबर $date से';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return '$productName विजनरी';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName विजनरी, $date से';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'विज़नरी आईडी #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'आपसी मित्र ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'आपसी समुदाय ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'आपसी दोस्त';

  @override
  String get userProfileMutualCommunitiesTitle => 'आपसी समुदाय';

  @override
  String get userProfileNoMutualFriends => 'कोई कॉमन दोस्त नहीं मिले।';

  @override
  String get userProfileNoMutualCommunities => 'कोई साझा समुदाय नहीं मिला।';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'उपनाम: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'DM खोलें';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'आपने $username को ब्लॉक कर दिया है। जब तक आप उन्हें अनब्लॉक नहीं करते, तब तक आप संदेश नहीं भेज पाएंगे।';
  }

  @override
  String get blockedUserComposerBarrierAction => 'ब्लॉक हटाएँ';

  @override
  String get userProfileOpenDm => 'DM खोलें';

  @override
  String get userProfileNoteTitle => 'नोट';

  @override
  String get userProfileNoteVisibility => '(सिर्फ आपको दिखेगा)';

  @override
  String get userProfileNoteSave => 'सेव करें';

  @override
  String get userProfileNoteDelete => 'मिटाएँ';

  @override
  String get userProfileNoteEmpty => 'नोट जोड़ने के लिए क्लिक करें';

  @override
  String get userProfileMemberSince => 'सदस्यता ली';

  @override
  String get userProfileAboutMe => 'मेरे बारे में';

  @override
  String get userProfileRoles => 'भूमिकाएँ';

  @override
  String get memberRoleAdd => 'भूमिका जोड़ें';

  @override
  String memberRoleRemove(String roleName) {
    return 'भूमिका $roleName हटाएँ';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'इस यूज़र की इस कम्युनिटी में कोई भूमिका नहीं है.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'अभी कोई भूमिका नहीं है. भूमिकाओं को $rolesSettingsPath में जोड़ें';
  }

  @override
  String get memberRolesNoRolesAvailable => 'कोई भूमिका उपलब्ध नहीं है';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'इस समुदाय में इस समय असाइन करने के लिए कोई भूमिका नहीं है, लेकिन आप $rolesSettingsPath में एक नई भूमिका बना सकते हैं।';
  }

  @override
  String get guildSettingsTitle => 'कम्युनिटी सेटिंग्ज़';

  @override
  String get guildSettingsRolesTab => 'भूमिकाएँ';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'स्थानीय समय';

  @override
  String get userProfileSameTimeAsYou => 'आपके जैसा ही समय';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'आपसे $duration आगे';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'आपसे $duration पीछे';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours घंटे',
      one: '1 घंटा',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes मिनट',
      one: '1 मिनट',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours घंटे',
      one: '1 घंटा',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes मिनट',
      one: '1 मिनट',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'उपयोगकर्ता नाम कॉपी करें';

  @override
  String get userProfileCopyUserId => 'यूज़र आईडी कॉपी करें';

  @override
  String get userProfileViewMainProfile => 'मुख्य प्रोफ़ाइल देखें';

  @override
  String get userProfileViewCommunityProfile => 'समुदाय प्रोफ़ाइल देखें';

  @override
  String get userProfileBlockUser => 'उपयोगकर्ता को ब्लॉक करें';

  @override
  String get userProfileUnblockUser => 'उपयोगकर्ता को अनब्लॉक करें';

  @override
  String get userProfileRemoveFriend => 'दोस्त को हटाएँ';

  @override
  String get userProfileBlockConfirmTitle => 'उपयोगकर्ता को ब्लॉक करें';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'क्या आप वाकई $username को ब्लॉक करना चाहते हैं?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'उपयोगकर्ता को अनब्लॉक करें';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'क्या आप वाकई $username को अनब्लॉक करना चाहते हैं?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'दोस्त को हटाएँ';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'क्या आप वाकई $username को दोस्त के तौर पर हटाना चाहते हैं?';
  }

  @override
  String get userProfileFailedOpenDm => 'डीएम खोलने में विफल';

  @override
  String get userProfileFailedSaveNote => 'नोट सहेजने में विफल';

  @override
  String get userProfileActionFailed =>
      'कार्रवाई विफल रही, कृपया पुनः प्रयास करें';

  @override
  String get userProfileChangeNickname => 'निकनेम बदलें';

  @override
  String get userProfileKick => 'हटाएं';

  @override
  String get userProfileBan => 'बैन करें';

  @override
  String get userProfileTimeout => 'टाइमआउट';

  @override
  String get userProfileRemoveTimeout => 'टाइमआउट हटाएँ';

  @override
  String get userProfileTransferOwnership => 'ओनरशिप ट्रांसफ़र करें';

  @override
  String get userProfileReportUser => 'यूज़र को रिपोर्ट करें';

  @override
  String get userProfileReportMessage => 'मैसेज की शिकायत करें';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'क्या $username को किक करें?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'क्या आप निश्चित हैं कि आप $username को किक करना चाहते हैं? वे एक नए आमंत्रण के साथ फिर से शामिल हो सकते हैं।';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'टाइमआउट हटाएँ?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'टाइमआउट हटाने से $username फिर से मैसेज भेज पाएंगे, रिएक्ट कर पाएंगे और वॉयस चैनल जॉइन कर पाएंगे।';
  }

  @override
  String get userProfileTransferConfirmTitle => 'स्वामित्व स्थानांतरित करें?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'क्या आप इस समुदाय का स्वामित्व $username को हस्तांतरित करना चाहते हैं? यह अपरिवर्तनीय है और आप मालिक के सभी विशेषाधिकार खो देंगे।';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '$username को बैन करें';
  }

  @override
  String get userProfileBanDurationLabel => 'बैन की अवधि';

  @override
  String get userProfileBanCustomSecondsLabel => 'कस्टम अवधि (सेकंड)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return '$min से $max सेकंड तक';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'चैट हिस्ट्री मिटाएँ';

  @override
  String get userProfileBanDeleteNone => 'कोई भी डिलीट न करें';

  @override
  String get userProfileBanDelete24h => 'पिछले 24 घंटे';

  @override
  String get userProfileBanDelete7d => 'पिछले 7 दिन';

  @override
  String get userProfileBanReasonLabel => 'वजह (वैकल्पिक)';

  @override
  String get userProfileBanReasonHint => 'बैन करने का कारण डालें';

  @override
  String get userProfileBanSubmit => 'सदस्य को बैन करें';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$username को टाइम आउट करें';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'टाइमआउट अवधि';

  @override
  String get userProfileTimeoutSubmit => 'सदस्य को टाइम आउट करें';

  @override
  String get userProfileNicknameLabel => 'उपनाम';

  @override
  String get userProfileNicknameHint => 'एक उपनाम दर्ज करें';

  @override
  String get userProfileNicknameSave => 'सेव करें';

  @override
  String userProfileKickSuccess(String username) {
    return '$username को किक कर दिया गया';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username को बैन कर दिया गया';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username को टाइम आउट कर दिया गया';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return '$username के लिए टाइमआउट हटा दिया गया';
  }

  @override
  String get userProfileNicknameSuccess => 'उपनाम अपडेट किया गया';

  @override
  String get userProfileTransferSuccess => 'स्वामित्व ट्रांसफ़र किया गया';

  @override
  String get durationPermanent => 'स्थायी';

  @override
  String get duration60Seconds => '60 सेकंड';

  @override
  String get duration5Minutes => '5 मिनट';

  @override
  String get duration10Minutes => '10 मिनट';

  @override
  String get duration1Hour => '1 घंटा';

  @override
  String get duration12Hours => '12 घंटे';

  @override
  String get duration1Day => '1 दिन';

  @override
  String get duration3Days => '3 दिन';

  @override
  String get duration5Days => '5 दिन';

  @override
  String get duration1Week => '1 हफ़्ता';

  @override
  String get duration2Weeks => '2 हफ़्ते';

  @override
  String get duration1Month => '1 महीना';

  @override
  String get durationCustom => 'पसंद के मुताबिक…';

  @override
  String get iarReportUserTitle => 'यूज़र को रिपोर्ट करें';

  @override
  String get iarReportGuildTitle => 'कम्युनिटी की शिकायत करें';

  @override
  String get iarReportGuildPreconfirmBody =>
      'अगर यह रिपोर्ट इस कम्युनिटी के किसी खास मैसेज के बारे में है, तो उस मैसेज की रिपोर्ट करें. मैसेज रिपोर्ट से हमारी सुरक्षा टीम को सबसे सही जानकारी मिलती है. कमेंट में जानकारी जोड़ने से हमें इसकी तेज़ी से समीक्षा करने में मदद मिल सकती है. कम्युनिटी की पूरी रिपोर्ट तभी करें, जब मैसेज की रिपोर्ट करने से बड़ी समस्या का पता न चल पाए.';

  @override
  String get iarContinueToReportCommunity => 'समुदाय की रिपोर्ट करना जारी रखें';

  @override
  String get iarPreviewCommunitySubtitle => 'समुदाय';

  @override
  String get iarReasonHarassmentGuildLabel => 'उत्पीड़न या लक्षित दुर्व्यवहार';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'कम्युनिटी से लोगों का एक साथ हमला करना या जानबूझकर परेशान करना आसान हो जाता है.';

  @override
  String get iarReasonHateGuildDescription =>
      'सुरक्षित समूहों के ख़िलाफ़ नफ़रत को बढ़ावा देता है.';

  @override
  String get iarReasonTerrorismLabel => 'आतंकवाद या हिंसक अतिवाद';

  @override
  String get iarReasonTerrorismDescription =>
      'हिंसक चरमपंथी गतिविधि को बढ़ावा देता है, उसके लिए भर्ती करता है या उसे समन्वित करता है।';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'परिपक्व सामग्री या असुरक्षित गेटिंग';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'बिना उचित गेटिंग के परिपक्व सामग्री।';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'नाबालिगों को खतरे में डालता है या बाल-शोषण वाली सामग्री होस्ट करता है।';

  @override
  String get iarReasonRaidLabel => 'रेड कोऑर्डिनेशन';

  @override
  String get iarReasonRaidDescription =>
      'लोगों या समुदायों के ख़िलाफ़ रेड, ब्रिगेड या उत्पीड़न का समन्वय करता है.';

  @override
  String get iarReasonSpamGuildDescription =>
      'समुदाय का इस्तेमाल स्पैम, स्कैम या प्लेटफ़ॉर्म का गलत इस्तेमाल करने के लिए किया जाता है.';

  @override
  String get iarReasonMalwareGuildLabel => 'मालवेयर वितरण';

  @override
  String get iarReasonMalwareGuildDescription =>
      'मैलवेयर, क्रेडेंशियल चोरी या नुकसान पहुँचाने वाली फ़ाइलें वितरित करता है.';

  @override
  String get iarReasonPrivacyGuildLabel => 'निजता का उल्लंघन या डॉक्सिंग';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'व्यक्तिगत जानकारी शेयर करता है, यूज़र का पीछा करता है या निजता का गलत इस्तेमाल करता है.';

  @override
  String get iarReasonSelfHarmGuildLabel =>
      'खुद को नुकसान पहुँचाने के लिए उकसाता है';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'आत्महत्या, खुद को नुकसान पहुँचाने या खाने-पीने से जुड़ी बीमारियों को बढ़ावा देता है.';

  @override
  String get iarReasonInappropriateProfile => 'अनुपयुक्त प्रोफ़ाइल';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'इस उपयोगकर्ता की प्रोफ़ाइल में अनुचित सामग्री है';

  @override
  String typingIndicatorOne(String name) {
    return '$name टाइप कर रहा है...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 और $name2 टाइप कर रहे हैं...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 और $name3 टाइप कर रहे हैं...';
  }

  @override
  String get typingIndicatorMultiple => 'कई लोग लिख रहे हैं...';

  @override
  String get typingIndicatorHandful => 'कुछ लोग टाइप कर रहे हैं...';

  @override
  String get typingIndicatorSymphony => 'टाइपिंग जारी है...';

  @override
  String get typingIndicatorFiesta => 'यहां तो टाइपिंग की धूम मची है';

  @override
  String get typingIndicatorApocalypse =>
      'अरे बाप रे, इतने सारे लोग टाइप कर रहे हैं';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'खुशी है कि आप यहाँ हैं, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'नमस्ते, $username! आपका स्वागत है।';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'नमस्ते, $username! आपको यहाँ देखकर अच्छा लगा।';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'नमस्ते, $username! जब आप तैयार हों, तब शामिल हों।';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'नमस्ते $username, आपको यहां देखकर बहुत अच्छा लगा!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'नमस्ते, $username! आशा है कि आप यहाँ का आनंद लेंगे।';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'नमस्ते, $username, आपका स्वागत है!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'खुशी है कि आप आ गए, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'आपका स्वागत है, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'नमस्ते, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'नमस्ते, $username! हमें खुशी है कि आप यहाँ हैं।';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'नमस्ते, $username! उम्मीद है आपको यहां अच्छा लगेगा।';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'नमस्ते, $username! आपकी अगली बातचीत यहीं से शुरू होती है।';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'नमस्ते, $username! हमें खुशी है कि आप यहाँ हैं।';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return '$username, आपको देखकर अच्छा लगा! आपका स्वागत है।';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'आप आ गए, $username! आपको हमारे साथ पाकर अच्छा लगा।';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'आप आ गए, $username! चलिए शुरू करते हैं।';
  }

  @override
  String get relativeTimeShortNow => 'अभी';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मि',
      one: '1 मि',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count घंटे',
      one: '1 घंटा',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन',
      one: '1 दिन',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मि',
      one: '1 मि',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count साल',
      one: '1 साल',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'मेरे डिवाइस';

  @override
  String get linkedDevicesDescription =>
      'उन सभी डिवाइसों को देखें जो वर्तमान में आपके खाते में लॉग इन हैं। उन सत्रों को रद्द करें जिन्हें आप नहीं पहचानते हैं।';

  @override
  String get linkedDevicesCurrentDevice => 'वर्तमान डिवाइस';

  @override
  String get linkedDevicesOtherDevices => 'अन्य डिवाइस';

  @override
  String get linkedDevicesEnterSelection => 'चयन मोड दर्ज करें';

  @override
  String get linkedDevicesExitSelection => 'चयन मोड से बाहर निकलें';

  @override
  String get linkedDevicesSelectAll => 'सभी चुनें';

  @override
  String get linkedDevicesClearSelection => 'चयन साफ़ करें';

  @override
  String get linkedDevicesRevokeTooltip => 'डिवाइस हटाएँ';

  @override
  String get linkedDevicesSignOutAll => 'अन्य सभी डिवाइस से साइन आउट करें';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count डिवाइस से साइन आउट करें',
      one: '1 डिवाइस से साइन आउट करें',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count डिवाइस से साइन आउट करें',
      one: '1 डिवाइस से साइन आउट करें',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'अन्य सभी डिवाइस से साइन आउट करें';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'यह चयनित डिवाइसों को आपके खाते से लॉग आउट कर देगा। आपको उन डिवाइसों पर फिर से लॉग इन करना होगा।',
      one:
          'यह चयनित डिवाइस को आपके खाते से लॉग आउट कर देगा। आपको उस डिवाइस पर फिर से लॉग इन करना होगा।',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'यह चयनित डिवाइसों को आपके खाते से लॉग आउट कर देगा। आपको उन डिवाइसों पर फिर से लॉग इन करना होगा।';

  @override
  String get linkedDevicesSignOutConfirm => 'जारी रखें';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'आपको सभी लॉग आउट किए गए डिवाइस पर फिर से लॉग इन करना होगा';

  @override
  String get linkedDevicesLoadErrorTitle => 'नेटवर्क त्रुटि';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'हम स्पेस-टाइम कॉन्टिनम से कनेक्ट करने में समस्या का सामना कर रहे हैं। कृपया अपना कनेक्शन जांचें और पुनः प्रयास करें।';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'डिवाइस निरस्त किए गए',
      one: 'डिवाइस निरस्त किया गया',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'साइन आउट नहीं हो सका। कृपया पुनः प्रयास करें।';

  @override
  String get linkedDevicesUnknownOs => 'अज्ञात OS';

  @override
  String get linkedDevicesUnknownPlatform => 'अज्ञात प्लेटफ़ॉर्म';

  @override
  String slowmodeLabel(String duration) {
    return '$duration स्लोमोड';
  }

  @override
  String get slowmodeTooltipActive =>
      'आप स्लोमोड में हैं। कृपया अगला संदेश भेजने से पहले प्रतीक्षा करें।';

  @override
  String get slowmodeTooltipImmune => 'स्लोमोड चालू है, लेकिन आप इम्यून हैं।';

  @override
  String get slowmodeStatusEnabled => 'स्लोमोड सक्रिय है';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'स्लोमोड सक्रिय है ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'स्लोमोड $durationLabel पर सेट है, लेकिन आप इससे मुक्त हैं.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'स्लोमोड $durationLabel पर सेट है. दूसरा मैसेज भेजने से पहले इंतज़ार करें.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'इस चैनल के लिए स्लोमोड $durationLabel पर सेट है.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'आप इस चैनल में मैसेज नहीं भेज सकते।';

  @override
  String systemDmComposerBarrier(String productName) {
    return '$productName स्टाफ़ की सिस्टम घोषणाएँ। आप यहाँ जवाब नहीं दे सकते।';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'इस कम्युनिटी में मैसेजिंग अस्थायी रूप से रोक दी गई है.';

  @override
  String get channelComposerBarrierTimedOut =>
      'आपका समय समाप्त हो गया है। समय-सीमा समाप्त होने तक मैसेजिंग, रिएक्शन और वॉइस रोक दिए गए हैं।';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'इस कम्युनिटी में मैसेज भेजने के लिए आपको अपना अकाउंट क्लेम करना होगा।';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'इस कम्युनिटी में मैसेज भेजने के लिए आपको अपना ईमेल वेरिफ़ाई करना होगा.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'इस कम्युनिटी में मैसेज भेजने के लिए आपका अकाउंट बहुत नया है।';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'आप इस कम्युनिटी के सदस्य इतने समय से नहीं हैं कि मैसेज भेज सकें।';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'इस कम्युनिटी में मैसेज भेजने के लिए आपको फ़ोन नंबर वेरिफ़ाई करना होगा.';

  @override
  String get channelComposerBarrierVerifyEmail => 'ईमेल वेरिफ़ाई करें';

  @override
  String get channelComposerBarrierVerifyPhone => 'फ़ोन सत्यापित करें';

  @override
  String chatAttachmentTooMany(int max) {
    return 'बहुत ज़्यादा अटैचमेंट ($max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName आकार सीमा ($fileSize) से अधिक है';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'ये फ़ाइलें एक साथ भेजने के लिए बहुत बड़ी हैं';

  @override
  String get chatAttachmentDropToUpload => 'अपलोड करने के लिए फ़ाइलें छोड़ें';

  @override
  String get chatAttachmentDropToSend => 'Shift दबाकर फ़ाइलें छोड़ने पर भेजें';

  @override
  String get chatAttachmentSendVoiceMessage => 'वॉइस मैसेज भेजें';

  @override
  String get voiceMessageTitle => 'वॉइस मैसेज';

  @override
  String get voiceMessageHoldHint =>
      'दबाकर रिकॉर्ड करें। हटाने के लिए खींचें, लॉक करने के लिए ऊपर स्लाइड करें, या भेजने के लिए छोड़ें।';

  @override
  String get voiceMessageDiscard => 'वॉइस मैसेज हटाएँ';

  @override
  String get voiceMessageSend => 'वॉइस मैसेज भेजें';

  @override
  String get voiceMessageMicPermissionDenied =>
      'रिकॉर्डिंग शुरू नहीं कर पा रहे हैं। माइक्रोफ़ोन एक्सेस की अनुमति दें।';

  @override
  String get voiceMessageRecordingNotSupported =>
      'इस डिवाइस पर वॉयस रिकॉर्डिंग समर्थित नहीं है।';

  @override
  String get voiceMessageMicInUse =>
      'वॉयस मैसेज रिकॉर्ड करने के लिए वॉयस कॉल छोड़ें।';

  @override
  String get voiceMessageRecordingFailed =>
      'रिकॉर्डिंग विफल रही. फिर से कोशिश करें.';

  @override
  String get voiceMessageSendFailed =>
      'वॉइस मैसेज भेजा नहीं जा सका. फिर से कोशिश करें.';

  @override
  String get voiceMessageRecordingHint =>
      'अभी बोलें। पूरा होने पर रोकें दबाएँ — आप बाद में ट्रिम कर सकते हैं।';

  @override
  String get voiceMessageReviewHint =>
      'ट्रिम करने के लिए हैंडल को खींचें, फिर भेजें दबाएँ।';

  @override
  String get voiceMessageStop => 'रोकें';

  @override
  String get voiceMessageStartRecording => 'रिकॉर्डिंग शुरू करें';

  @override
  String get voiceMessageRerecord => 'फिर से रिकॉर्ड करें';

  @override
  String get voiceMessagePlay => 'चलाएँ';

  @override
  String get voiceMessagePause => 'रोकें';

  @override
  String get voiceMessageSeekForward => 'आगे बढ़ाएँ';

  @override
  String get voiceMessageSeekBackward => 'पीछे जाएं';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'चयन कम से कम $secondsString सेकंड का होना चाहिए।';
  }

  @override
  String get chatAttachmentEditTitle => 'अटैचमेंट एडिट करें';

  @override
  String get chatAttachmentFilenameLabel => 'फ़ाइल का नाम';

  @override
  String get chatAttachmentDescriptionLabel => 'विवरण';

  @override
  String get chatAttachmentDescriptionHint => 'वैकल्पिक ऑल्ट टेक्स्ट';

  @override
  String get chatAttachmentSpoilerLabel => 'स्पॉइलर के तौर पर मार्क करें';

  @override
  String get chatAttachmentRemove => 'अटैचमेंट हटाएँ';

  @override
  String get chatAttachmentDownload => 'डाउनलोड करें';

  @override
  String get chatAttachmentDownloadedToast => 'फ़ोटो में सहेजा गया';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'अटैचमेंट डाउनलोड नहीं हो सका';

  @override
  String get chatAttachmentExpiredTooltip =>
      'अटैचमेंट की समय-सीमा खत्म हो गई है';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'विस्तार करें ($count पंक्तियाँ)',
      one: 'विस्तार करें ($count पंक्ति)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count लाइनें) छिपाएँ',
      one: '($count लाइन) छिपाएँ',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'विस्तार करें ($count पंक्तियाँ)',
      one: 'विस्तार करें ($count पंक्ति)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'पंक्तियाँ ($count) छिपाएँ',
      one: 'पंक्ति ($count) छिपाएँ',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count लाइनें बची हैं)',
      one: '... ($count लाइन बची है)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count पंक्तियाँ बची हैं)',
      one: '... ($count पंक्ति बची है)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'पूरी फ़ाइल देखें';

  @override
  String get chatTextualPreviewChangeLanguage => 'भाषा बदलें';

  @override
  String get chatTextualPreviewSearchLanguage => 'भाषा खोजें…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'सिंटैक्स हाइलाइटिंग';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'कोई परिणाम नहीं मिला';

  @override
  String get chatTextualPreviewMoreOptions => 'और विकल्प';

  @override
  String get chatTextualPreviewWrapText => 'टेक्स्ट रैप करें';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'फ़ाइल इनलाइन प्रीव्यू के लिए बहुत बड़ी है (सीमा $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError =>
      'पूर्वावलोकन लोड नहीं किया जा सकता.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'सादा टेक्स्ट';

  @override
  String get chatTextualPreviewCopy => 'कॉपी करें';

  @override
  String get chatAttachmentSourceGallery => 'गैलरी';

  @override
  String get chatAttachmentSourceCamera => 'कैमरा';

  @override
  String get chatAttachmentSourceBrowse => 'फ़ाइलें ब्राउज़ करें';

  @override
  String get chatAttachmentPasteTooltip => 'क्लिपबोर्ड से फ़ाइल पेस्ट करें';

  @override
  String get chatAttachmentSpoiler => 'स्पॉइलर';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'स्पॉइलर दिखाएँ';

  @override
  String get matureMediaRevealButton => 'दिखाएँ';

  @override
  String get matureMediaRevealHint => 'देखने के लिए क्लिक करें';

  @override
  String get matureContentTitle => 'वयस्क सामग्री';

  @override
  String get matureCommunityTitle => 'परिपक्व समुदाय';

  @override
  String get matureCategoryTitle => 'परिपक्व श्रेणी';

  @override
  String get matureChannelTitle => 'परिपक्व चैनल';

  @override
  String get communityContentWarningTitle => 'समुदाय सामग्री चेतावनी';

  @override
  String get categoryContentWarningTitle => 'श्रेणी सामग्री चेतावनी';

  @override
  String get channelContentWarningTitle => 'चैनल सामग्री चेतावनी';

  @override
  String get defaultContentWarningBody => 'इसमें संवेदनशील सामग्री है।';

  @override
  String get matureCommunityBody =>
      'यह कम्युनिटी मैच्योर कंटेंट के लिए चिह्नित है और इसमें ऐसी सामग्री हो सकती है जो कुछ यूज़र के लिए अनुपयुक्त हो सकती है।';

  @override
  String get matureCategoryBody =>
      'यह श्रेणी परिपक्व सामग्री के लिए चिह्नित है और इसमें ऐसी सामग्री हो सकती है जो कुछ उपयोगकर्ताओं के लिए अनुपयुक्त हो सकती है।';

  @override
  String get matureChannelBody =>
      'यह चैनल परिपक्व सामग्री के लिए चिह्नित है और इसमें ऐसी सामग्री हो सकती है जो कुछ उपयोगकर्ताओं के लिए अनुपयुक्त हो सकती है।';

  @override
  String get matureVoiceChannelBody =>
      'यह वॉइस चैनल परिपक्व सामग्री के लिए चिह्नित है और इसमें ऐसी सामग्री हो सकती है जो कुछ उपयोगकर्ताओं के लिए अनुपयुक्त हो सकती है।';

  @override
  String get matureLinkChannelBody =>
      'यह लिंक चैनल परिपक्व सामग्री के लिए चिह्नित है और ऐसी सामग्री खोल सकता है जो कुछ उपयोगकर्ताओं के लिए अनुपयुक्त हो सकती है।';

  @override
  String get matureCommunityUnavailableBody =>
      'यह मैच्योर कम्युनिटी आपके अकाउंट के लिए उपलब्ध नहीं है।';

  @override
  String get matureCategoryUnavailableBody =>
      'यह परिपक्व श्रेणी आपके खाते के लिए उपलब्ध नहीं है।';

  @override
  String get matureChannelUnavailableBody =>
      'यह मैच्योर चैनल आपके खाते के लिए उपलब्ध नहीं है।';

  @override
  String get matureContentProceedButton => 'आगे बढ़ें';

  @override
  String get matureContentUnderstandButton => 'मैं समझ गया/गई';

  @override
  String get matureContentOpenLinkButton => 'लिंक खोलें';

  @override
  String get sensitiveContentSectionTitle => 'संवेदनशील सामग्री';

  @override
  String get sensitiveContentSectionDescription =>
      'यह नियंत्रित करें कि विभिन्न संदर्भों में परिपक्व या संवेदनशील मीडिया को कैसे फ़िल्टर किया जाए';

  @override
  String get sensitiveContentFriendDmLabel => 'दोस्तों के सीधे मैसेज';

  @override
  String get sensitiveContentNonFriendDmLabel => 'दूसरों के डायरेक्ट मैसेज';

  @override
  String get sensitiveContentGuildLabel => 'कम्युनिटी चैनलों में मैसेज';

  @override
  String get sensitiveContentFilterShow => 'दिखाएँ';

  @override
  String get sensitiveContentFilterBlur => 'धुंधला करें';

  @override
  String get sensitiveContentFilterBlock => 'ब्लॉक करें';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'सुरक्षा स्कैन पूरा होने तक मीडिया को धुंधला करें';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'सक्षम होने पर, सामग्री सुरक्षा स्कैन समाप्त होने तक चित्र और वीडियो धुंधले हो जाएंगे।';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'यह सेटिंग आपके खाते के लिए हमेशा चालू रहती है।';

  @override
  String get sensitiveContentResetButton => 'रीसेट करें';

  @override
  String get sensitiveContentSaveButton => 'सेव करें';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count फ़ाइलें अपलोड हो रही हैं',
      one: '1 फ़ाइल अपलोड हो रही है',
    );
    return '$_temp0';
  }

  @override
  String get chatCancelUpload => 'अपलोड रद्द करें';

  @override
  String chatAttachmentExpiresOn(String date) {
    return '$date को समाप्त होगा';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return '$start और $end के बीच समाप्त हो रहा है';
  }

  @override
  String get connectionsTitle => 'कनेक्शन';

  @override
  String connectionsDescription(String productName) {
    return 'अपने $productName प्रोफ़ाइल से बाहरी खातों और डोमेन को लिंक करें। सत्यापित कनेक्शन दूसरों को देखने के लिए आपकी प्रोफ़ाइल पर प्रदर्शित किए जाएंगे।';
  }

  @override
  String get connectionsEmptyTitle => 'अभी तक कोई कनेक्शन नहीं है';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'अपने ब्लूस्काई खाते को लिंक करें या अपने प्रोफ़ाइल पर दिखाने के लिए डोमेन स्वामित्व सत्यापित करें।';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'अपनी प्रोफ़ाइल पर दिखाने के लिए डोमेन स्वामित्व सत्यापित करें।';

  @override
  String get connectionsAddBluesky => 'ब्लूस्काई';

  @override
  String get connectionsAddDomain => 'डोमेन';

  @override
  String get connectionsAddBlueskyAriaLabel => 'ब्लूस्काई कनेक्शन जोड़ें';

  @override
  String get connectionsAddDomainAriaLabel => 'डोमेन कनेक्शन जोड़ें';

  @override
  String get connectionEdit => 'बदलाव करें';

  @override
  String get connectionRemove => 'हटाएँ';

  @override
  String get connectionVerifiedLabel => 'यह कनेक्शन वेरिफ़ाई हो गया है.';

  @override
  String get connectionUnverifiedLabel =>
      'यह कनेक्शन वेरिफ़ाई नहीं किया गया है.';

  @override
  String get connectionAddTitle => 'कनेक्शन जोड़ें';

  @override
  String get connectionTypeLabel => 'कनेक्शन का प्रकार';

  @override
  String get connectionHandleLabel => 'हैंडल';

  @override
  String get connectionDomainLabel => 'डोमेन';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'यह कनेक्शन आपके पास पहले से है।';

  @override
  String get connectionConnectBluesky => 'ब्लूस्काई से कनेक्ट करें';

  @override
  String get connectionContinue => 'जारी रखें';

  @override
  String get connectionVerifyTitle => 'कनेक्शन सत्यापित करें';

  @override
  String get connectionVerifyInstructions =>
      'डोमेन स्वामित्व साबित करने के लिए नीचे दिए गए रिकॉर्ड का उपयोग करें।';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT रिकॉर्ड';

  @override
  String get connectionDnsHostLabel => 'होस्ट';

  @override
  String get connectionDnsValueLabel => 'वैल्यू';

  @override
  String get connectionCopyHost => 'होस्ट कॉपी करें';

  @override
  String get connectionCopyValue => 'वैल्यू कॉपी करें';

  @override
  String get connectionCopied => 'कॉपी किया गया!';

  @override
  String get connectionTokenFileTitle => 'टोकन फ़ाइल दें';

  @override
  String get connectionTokenFileDescription =>
      '**fluxer-verification** डाउनलोड करें और इसे अपने **.well-known** फ़ोल्डर में रखें ताकि हम डोमेन को मान्य कर सकें।';

  @override
  String get connectionTokenFileDownload => 'Fluxer-वेरिफिकेशन डाउनलोड करें';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'फ़ाइल में वह सत्यापन टोकन है जिसे हम **$dnsUrl** से प्राप्त करेंगे।';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Fluxer-सत्यापन सहेजें';

  @override
  String get connectionVerifyButton => 'वेरीफाई करें';

  @override
  String get connectionBack => 'वापस';

  @override
  String get connectionEditTitle => 'कनेक्शन संपादित करें';

  @override
  String get connectionEditDescription =>
      'चुनें कि आपकी प्रोफ़ाइल पर यह कनेक्शन कौन देख सकता है।';

  @override
  String get connectionVisibilityEveryone => 'हर कोई';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'किसी को भी अपनी प्रोफ़ाइल पर यह कनेक्शन देखने दें';

  @override
  String get connectionVisibilityFriends => 'दोस्त';

  @override
  String get connectionVisibilityFriendsDesc =>
      'अपने दोस्तों को यह कनेक्शन देखने दें';

  @override
  String get connectionVisibilityCommunityMembers => 'समुदाय के सदस्य';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'आप जिन कम्युनिटी में हैं, उनके सदस्यों को यह कनेक्शन देखने दें';

  @override
  String get connectionRemoveTitle => 'कनेक्शन हटाएं';

  @override
  String get connectionRemoveDescription =>
      'क्या आप निश्चित हैं कि आप इस कनेक्शन को हटाना चाहते हैं? इस कार्रवाई को पूर्ववत नहीं किया जा सकता है।';

  @override
  String get connectionRemoveConfirm => 'हटाएँ';

  @override
  String get connectionsLoadError => 'कनेक्शन लोड करने में विफल';

  @override
  String get connectionsReorderError => 'ऑर्डर अपडेट करने में विफल';

  @override
  String get connectionInitiateFailed =>
      'सत्यापन शुरू नहीं हो सका। दोबारा कोशिश करें।';

  @override
  String get connectionVerifyFailed =>
      'सत्यापन नहीं हो सका। अपना DNS रिकॉर्ड जांचें और पुनः प्रयास करें।';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'ब्लूस्काई ऑथराइज़ेशन शुरू नहीं हो सका।';

  @override
  String get connectionUpdateFailed => 'कनेक्शन अपडेट नहीं हो सका';

  @override
  String get connectionRemoveFailed => 'कनेक्शन हटाया नहीं जा सका';

  @override
  String get connectionTokenSavedToast => 'फ़्लक्सर-सत्यापन सहेजा गया';

  @override
  String get connectionTokenSaveFailedToast => 'फ़ाइल सहेजी नहीं जा सकी';

  @override
  String get connectionEnterHandle => 'ब्लूस्काई हैंडल दर्ज करें।';

  @override
  String get connectionEnterDomain => 'एक डोमेन दर्ज करें।';

  @override
  String get lookAndFeelTitle => 'रूप और अनुभव';

  @override
  String get lookAndFeelThemeSectionTitle => 'थीम';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'डार्क, कोल या लाइट अपीयरेंस में से चुनें।';

  @override
  String get lookAndFeelHdrSectionTitle => 'हाई डायनामिक रेंज';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'नियंत्रित करें कि HDR-सक्षम मॉनिटर पर HDR इमेज कैसे दिखें।';

  @override
  String get lookAndFeelHdrFullName => 'फुल डायनामिक रेंज';

  @override
  String get lookAndFeelHdrFullDescription =>
      'HDR इमेज को पूरी ब्राइटनेस और कलर रेंज में दिखाएँ।';

  @override
  String get lookAndFeelHdrStandardName => 'सामान्य रेंज';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'एचडीआर इमेज को सामान्य रेंज में टोन-मैप करें, जिससे पीक ब्राइटनेस कम हो जाएगी.';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'हाई डायनामिक रेंज डिस्प्ले मोड';

  @override
  String get lookAndFeelThemeDark => 'डार्क थीम';

  @override
  String get lookAndFeelThemeCoal => 'कोल थीम';

  @override
  String get lookAndFeelThemeLight => 'लाइट थीम';

  @override
  String get lookAndFeelThemeSystem => 'सिस्टम थीम';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'सभी डिवाइस पर थीम सिंक करें';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'सक्षम होने पर, थीम परिवर्तन आपकी सभी डिवाइसों पर सिंक हो जाएंगे। अक्षम होने पर, यह डिवाइस अपनी थीम सेटिंग का उपयोग करेगी।';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'सिस्टम थीम इस डिवाइस पर आपकी सिस्टम की प्राथमिकता को ट्रैक करने के लिए सिंक को स्वचालित रूप से अक्षम कर देती है।';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'आपके खाते में थीम सिंक नहीं हो सकी। कृपया पुनः प्रयास करें।';

  @override
  String get lookAndFeelChatFontScalingTitle => 'चैट फ़ॉन्ट स्केलिंग';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'चैट एरिया में फ़ॉन्ट का साइज़ एडजस्ट करें।';

  @override
  String get lookAndFeelChatFontSizeLabel => 'चैट फ़ॉन्ट का आकार';

  @override
  String get lookAndFeelAppZoomTitle => 'ऐप ज़ूम स्तर';

  @override
  String get lookAndFeelAppZoomDescription =>
      'एप्लिकेशन के ज़ूम लेवल को एडजस्ट करें।';

  @override
  String get lookAndFeelMessagesSectionTitle => 'मैसेज';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'चुनें कि चैट चैनलों में मैसेज कैसे दिखते हैं.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel => 'मैसेज ग्रुप के बीच की जगह';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'मैसेज डिस्प्ले मोड';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'आरामदायक';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'मैसेज के बीच साफ़ विज़ुअल सेपरेशन के साथ ज़्यादा जगह वाला लेआउट।';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'सघन';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'कम से कम स्पेस के साथ ज़्यादा से ज़्यादा मैसेज दिखते हैं.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'यूज़र अवतार छिपाएं';

  @override
  String get lookAndFeelInterfaceTitle => 'इंटरफ़ेस';

  @override
  String get lookAndFeelInterfaceDescription =>
      'इंटरफ़ेस एलिमेंट और व्यवहार को कस्टमाइज़ करें।';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'चैनल सूची में टाइपिंग इंडिकेटर';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'चैनल सूची में टाइपिंग इंडिकेटर कैसे दिखें, यह चुनें कि जब कोई चैनल में टाइप कर रहा हो।';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'टाइपिंग इंडिकेटर + अवतार';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'चैनल सूची में यूज़र अवतार के साथ टाइपिंग इंडिकेटर दिखाएं';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'सिर्फ टाइपिंग इंडिकेटर';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'बिना अवतार के सिर्फ़ टाइपिंग इंडिकेटर दिखाएं';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'छिपा हुआ';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'चैनल सूची में टाइपिंग इंडिकेटर न दिखाएं';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'चुने हुए चैनल पर टाइपिंग दिखाएँ';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'जब अक्षम (डिफ़ॉल्ट) हो, तो टाइपिंग इंडिकेटर उस चैनल पर दिखाई नहीं देंगे जिसे आप वर्तमान में देख रहे हैं।';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'सामान्य';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'कीबोर्ड संकेत';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'टूलटिप्स के अंदर कीबोर्ड शॉर्टकट संकेत दिखाई दें या नहीं, इसे नियंत्रित करें।';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'टूलटिप्स में कीबोर्ड संकेत छिपाएँ';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'सक्षम होने पर, शॉर्टकट बैज टूलटिप पॉपअप में छिपे रहेंगे।';

  @override
  String get lookAndFeelNekoTitle => 'अन्य';

  @override
  String get lookAndFeelNekoDescription => 'विविध इंटरफ़ेस विकल्प।';

  @override
  String get lookAndFeelShowNekoLabel => 'नेको दिखाएं';

  @override
  String get lookAndFeelShowNekoDescription =>
      'सक्षम होने पर, नेको चैट इनपुट बार के पास दिखाई देता है।';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'वॉइस चैनल में शामिल होने का तरीका';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'समुदायों में वॉयस चैनल में कैसे शामिल हों, इसे नियंत्रित करें।';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'वॉयस चैनल से जुड़ने के लिए डबल-क्लिक ज़रूरी है';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'सक्षम होने पर, आपको वॉयस चैनलों से जुड़ने के लिए उन पर डबल-क्लिक करना होगा। अक्षम होने पर (डिफ़ॉल्ट), चैनल में तुरंत शामिल होने के लिए सिंगल-क्लिक करें।';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'तेज़ भूरी लोमड़ी आलसी कुत्ते के ऊपर से कूद जाती है।';

  @override
  String get lookAndFeelGuildSidebarTitle => 'गिल्ड साइडबार';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'डायरेक्ट मैसेज कैसे दिखें, इसे कॉन्फ़िगर करें।';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count समुदाय फ़्लक्स कैपेसिटर में खराबी के कारण अस्थायी रूप से अनुपलब्ध हैं।',
      one:
          '1 समुदाय फ़्लक्स कैपेसिटर में खराबी के कारण अस्थायी रूप से अनुपलब्ध है।',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable => 'कम्युनिटी अभी उपलब्ध नहीं है';

  @override
  String get guildUnavailableDescription =>
      'कुछ गड़बड़ हो गई है। हम इसे ठीक करने में लगे हैं।';

  @override
  String get guildNotFoundTitle =>
      'यह वह कम्युनिटी नहीं है जिसे आप ढूंढ रहे हैं।';

  @override
  String get guildNotFoundDescription =>
      'आप जिस कम्युनिटी को ढूंढ रहे हैं, हो सकता है उसे डिलीट कर दिया गया हो या आपके पास उस तक ऐक्सेस न हो.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName अभी केवल $productName स्टाफ़ सदस्यों के लिए ही उपलब्ध है';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'अभी उपलब्ध नहीं है';

  @override
  String get lookAndFeelCollapseDMsLabel => 'फ़ोल्डर में डीएम को समेटें';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'जब सक्षम हो, तो गिल्ड साइडबार में अपठित डीएम को $productName बटन में एक फ़ोल्डर में संक्षिप्त कर दिया जाता है। फ़ोल्डर को फैलाने या संक्षिप्त करने के लिए डीएम पृष्ठ पर रहते हुए $productName बटन पर क्लिक करें।';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'चैनल सूची';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'चैनल सूची में म्यूट किए गए चैनलों के लिए न पढ़े गए इंडिकेटर के व्यवहार को नियंत्रित करें।';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'म्यूट किए गए चैनलों पर न पढ़े गए इंडिकेटर दिखाएं';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'जब सक्षम किया जाता है, तो म्यूट किए गए चैनलों पर बाईं ओर एक हल्का अनरीड इंडिकेटर दिखाई देता है। इस सेटिंग के बावजूद उल्लेख अभी भी दिखाई देते हैं।';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'अभी सक्रिय';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'ऐप में \'अभी सक्रिय\' कैसे दिखे, इसे नियंत्रित करें।';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'होम स्क्रीन पर \'अभी सक्रिय\' दिखाएं';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'होम स्क्रीन पर \'अभी सक्रिय दिखाएं\' चालू करें ताकि आवाज़ में सक्रिय दोस्तों को दिखाया जा सके। आपको एक प्रीव्यू, चैनल का संदर्भ, कौन पहले से मौजूद है, और उसमें शामिल होने का एक त्वरित तरीका दिखाई देगा।';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'पसंदीदा';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'ऐप में पसंदीदा की दृश्यता को नियंत्रित करें।';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'फ़ेवरेट सक्षम करें';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'चालू होने पर, आप चैनलों को पसंदीदा बना सकते हैं और वे पसंदीदा अनुभाग में दिखाई देंगे। बंद होने पर, पसंदीदा से संबंधित सभी यूआई तत्व (बटन, मेनू आइटम) छिपे रहेंगे। आपके मौजूदा पसंदीदा सुरक्षित रहेंगे।';

  @override
  String get favoritesTitle => 'पसंदीदा';

  @override
  String get favoritesEmptyTitle => 'अभी कोई पसंदीदा नहीं';

  @override
  String get favoritesEmptyDescription =>
      'चैट हेडर से चैनलों को स्टार करें ताकि वे यहीं रहें।';

  @override
  String get favoritesWelcomeTitle => 'पसंदीदा में आपका स्वागत है';

  @override
  String get favoritesWelcomeDescription =>
      'आपके पसंदीदा चैनल, DM और ग्रुप के लिए आपकी निजी जगह. किसी भी चैनल को यहाँ जोड़ने के लिए उस पर स्टार दबाएँ.';

  @override
  String get favoritesWelcomeTip => 'आपके लिए नहीं है? इसे कभी भी बंद कर दें।';

  @override
  String get favoritesDisableButton => 'पसंदीदा बंद करें';

  @override
  String get favoritesAddedToast => 'फ़ेवरेट में जोड़ा गया';

  @override
  String get favoritesRemovedToast => 'पसंदीदा से हटाया गया';

  @override
  String get favoritesHiddenToast => 'पसंदीदा छिपाए गए';

  @override
  String get favoritesMute => 'फ़ेवरेट को म्यूट करें';

  @override
  String get favoritesUnmute => 'पसंदीदा को अनम्यूट करें';

  @override
  String get favoritesHeaderMenu => 'पसंदीदा मेन्यू';

  @override
  String get favoritesCreateCategory => 'कैटेगरी बनाएँ';

  @override
  String get favoritesCategoryNameLabel => 'श्रेणी का नाम';

  @override
  String get favoritesHideMutedChannels => 'म्यूट किए गए चैनल छिपाएं';

  @override
  String get favoritesShowMutedChannels => 'म्यूट किए गए चैनल दिखाएं';

  @override
  String get favoritesSetNickname => 'उपनाम सेट करें';

  @override
  String get favoritesNicknameLabel => 'उपनाम';

  @override
  String get favoritesSaveNickname => 'निकनेम सेव करें';

  @override
  String get favoritesMoveToCategory => 'श्रेणी में ले जाएँ';

  @override
  String get favoritesUncategorized => 'बिना श्रेणी';

  @override
  String get favoritesOtherCategory => 'अन्य';

  @override
  String get favoritesRemoveFromFavorites => 'पसंदीदा से हटाएं';

  @override
  String get favoritesAddToFavorites => 'पसंदीदा में जोड़ें';

  @override
  String get favoritesAddToSavedMedia => 'सेव किए गए मीडिया में जोड़ें';

  @override
  String get favoritesRemoveFromSavedMedia => 'सहेजे गए मीडिया से हटाएं';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'URL-केवल GIF पसंदीदा में जोड़ें';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'केवल URL GIF पसंदीदा से हटाएं';

  @override
  String get savedMediaAddTitle => 'सेव किए गए मीडिया में जोड़ें';

  @override
  String get savedMediaFormNameLabel => 'नाम';

  @override
  String get savedMediaFormNameHint => 'मेरी शानदार मीडिया';

  @override
  String get savedMediaFormAltTextLabel => 'ऑल्ट टेक्स्ट';

  @override
  String get savedMediaFormAltTextHint => 'मीडिया के बारे में बताएं';

  @override
  String get savedMediaFormTagsLabel => 'टैग';

  @override
  String get savedMediaFormTagsHint => 'मज़ेदार, प्रतिक्रिया, काम';

  @override
  String get savedMediaSaveError =>
      'सहेजे गए मीडिया को अपडेट नहीं किया जा सका।';

  @override
  String get savedMediaNameRequired => 'नाम ज़रूरी है।';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'आप अपने GIF पसंदीदा को कैसे सहेजना चाहेंगे?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'आप स्टार किए गए GIF को केवल-URL पसंदीदा के रूप में सहेज सकते हैं या उन्हें अपने सहेजे गए मीडिया में अपलोड कर सकते हैं। वह चुनें जो आपके उपयोग के तरीके के अनुकूल हो। आप इसे कभी भी सेटिंग्स > एडवांस्ड > मीडिया में बदल सकते हैं।';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-ओनली पसंदीदा (डिफ़ॉल्ट): आपके डिवाइसों में सिंक हो जाते हैं, कोई अपलोड नहीं, सेव किए गए मीडिया के विरुद्ध नहीं गिने जाते। यदि मूल मीडिया का होस्ट उसे हटा देता है तो वह गायब हो सकता है।';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'सहेजा गया मीडिया: अपलोड किया गया, टैग करने योग्य, खोजने योग्य और स्थायी, लेकिन आपकी सहेजे गए मीडिया सीमा के विरुद्ध गिना जाता है।';

  @override
  String get gifFavoriteFirstTimeHint => 'हम केवल एक बार पूछेंगे।';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly =>
      'केवल यूआरएल का प्रयोग करें (अनुशंसित)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia =>
      'सहेजे गए मीडिया का उपयोग करें';

  @override
  String get favoritesHideConfirmTitle => 'पसंदीदा छिपाएं';

  @override
  String get favoritesHideConfirmDescription =>
      'इससे सभी पसंदीदा से संबंधित UI तत्व छिप जाएंगे, जिनमें बटन और मेनू आइटम शामिल हैं। आपके मौजूदा पसंदीदा सुरक्षित रहेंगे और इन्हें कभी भी Settings > Advanced > Appearance से फिर से सक्षम किया जा सकता है।';

  @override
  String get favoritesDirectMessageSubtitle => 'डायरेक्ट मैसेज';

  @override
  String get messagesMediaDisplayGroupTitle => 'डिस्प्ले';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'संदेशों, मीडिया और अन्य सामग्री को कैसे प्रदर्शित किया जाए, इसे नियंत्रित करें।';

  @override
  String get messagesMediaMediaGroupTitle => 'मीडिया';

  @override
  String get messagesMediaMediaGroupDescription =>
      'मीडिया का आकार और बटन की प्राथमिकताएँ सेट करें।';

  @override
  String get messagesMediaInputGroupTitle => 'इनपुट';

  @override
  String get messagesMediaInputGroupDescription =>
      'संदेश इनपुट सेटिंग को कस्टमाइज़ करें।';

  @override
  String get messagesMediaSidebarGroupTitle => 'साइडबार';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'समुदाय साइडबार कैसे प्रदर्शित होता है, इसे कॉन्फ़िगर करें।';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'म्यूट किए गए चैनल डिफ़ॉल्ट रूप से छिपाएँ';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'नई कम्युनिटी में शामिल होने पर म्यूट किए गए चैनल को साइडबार में अपने आप छिपाएँ';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'म्यूट किए गए चैनल डिफ़ॉल्ट रूप से छिपाएँ?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'आप जिन नई कम्युनिटी में शामिल होंगे, उनमें म्यूट किए गए चैनल अपने आप छिपे रहेंगे. क्या आप यह सेटिंग अपनी सभी मौजूदा कम्युनिटी पर भी लागू करना चाहेंगे?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'म्यूट किए गए चैनल को डिफ़ॉल्ट रूप से छिपाना बंद करें?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'आपके शामिल होने वाले नए कम्युनिटी में म्यूट किए गए चैनल अब अपने-आप नहीं छिपेंगे. क्या आप अपनी सभी मौजूदा कम्युनिटी में भी म्यूट किए गए चैनल दिखाना चाहेंगे?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'सभी कम्युनिटी पर लागू करें';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'सभी कम्युनिटी में दिखाएं';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'सिर्फ़ नई कम्युनिटी';

  @override
  String get messagesMediaDisplaySectionTitle => 'मीडिया प्रदर्शन';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'यह नियंत्रित करें कि चित्र, वीडियो और अन्य मीडिया कैसे दिखाए जाते हैं। सभी मीडिया का आकार बदला जाता है और परिवर्तित किया जाता है। संपीड़न योग्य पूर्वावलोकन में संपीड़ित नहीं की जा सकने वाली अत्यंत बड़ी फ़ाइलें इन सेटिंग्स की परवाह किए बिना एम्बेड नहीं होंगी।';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'जब चैट पर लिंक के तौर पर पोस्ट किया जाए';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'जब सीधे $productName पर अपलोड किया जाता है';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'लिंक प्रीव्यू';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'चैट में वेबसाइट लिंक का पूर्वावलोकन कैसे करें, इसे नियंत्रित करें';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'एम्बेड और वेबसाइट लिंक का प्रीव्यू दिखाएं';

  @override
  String get messagesMediaReactionsSectionTitle => 'प्रतिक्रियाएँ';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'संदेशों पर इमोजी प्रतिक्रियाएँ कॉन्फ़िगर करें';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'मैसेज पर इमोजी रिएक्शन दिखाएं';

  @override
  String get messagesMediaSpoilersSectionTitle => 'स्पॉइलर सामग्री';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'स्पॉइलर सामग्री कैसे प्रदर्शित की जाती है, इसे नियंत्रित करें';

  @override
  String get messagesMediaSpoilersRadioLabel => 'स्पॉइलर सामग्री दिखाएं';

  @override
  String get messagesMediaSpoilersOnClickName => 'क्लिक करने पर';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'क्लिक करने पर स्पॉइलर कॉन्टेंट दिखाएँ';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'जिन चैनलों का मैं मॉडरेटर हूं';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'उन चैनलों में स्पॉइलर सामग्री हमेशा दिखाएं जहाँ आपके पास \"संदेश प्रबंधित करें\" की अनुमति है';

  @override
  String get messagesMediaSpoilersAlwaysName => 'हमेशा';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'स्पॉइलर सामग्री हमेशा दिखाएं';

  @override
  String get messagesMediaSizeSectionTitle => 'मीडिया आकार की प्राथमिकताएँ';

  @override
  String get messagesMediaSizeSectionDescription =>
      'एंबेडेड और अटैच किए गए मीडिया के लिए अधिकतम डिस्प्ले आकार को कस्टमाइज़ करें। छोटे आकार कम स्क्रीन स्पेस का उपयोग करते हैं, जबकि बड़े आकार अधिक विवरण दिखाते हैं।';

  @override
  String get messagesMediaSizeEmbedLabel => 'लिंक से मीडिया (एंबेड)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'अपलोड किए गए अटैचमेंट';

  @override
  String get messagesMediaSizeCompactName => 'छोटा (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'छोटी मीडिया साइज़';

  @override
  String get messagesMediaSizeComfortableName => 'आरामदायक (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'अधिक विवरण के साथ बड़ी मीडिया साइज़';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF व्यवहार';

  @override
  String get messagesMediaGifsSectionDescription =>
      'चैट में GIF कैसे डाले जाते हैं, इसे नियंत्रित करें';

  @override
  String get messagesMediaGifsAutoSendLabel => 'चुनने पर GIF अपने आप भेजें';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'कैमरा अपलोड';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'चुनें कि इन-ऐप कैमरे से ली गई फ़ोटो और वीडियो आपके डिवाइस पर रखी जाएं या नहीं';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'डिवाइस पर सेव करें';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'एक्सप्रेशन ऑटो-कम्प्लीट (कोलन ऑटो-कम्प्लीट)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'जब आप कोलन टाइप करते हैं तो एक्सप्रेशन ऑटो-कम्प्लीट में क्या दिखाई देता है, उसे कंट्रोल करें। अपनी पसंद के अनुसार सुझावों को कस्टमाइज़ करें।';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट में डिफ़ॉल्ट इमोजी दिखाएं';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट में कस्टम इमोजी दिखाएं';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट में स्टिकर दिखाएं';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट में सेव किया गया मीडिया दिखाएं';

  @override
  String get messagesMediaEditingSectionTitle => 'संदेश संपादन';

  @override
  String get messagesMediaEditingSectionDescription =>
      'जब आप रद्द करते हैं तो आपकी संपादन ड्राफ़्ट के साथ क्या होता है, इसे नियंत्रित करें।';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'संपादित ड्राफ़्ट को रद्द करने पर सहेजें';

  @override
  String get accessibilitySaturationTitle => 'संतृप्ति';

  @override
  String get accessibilitySaturationDescription =>
      'ऐप में थीम के रंग कितने जीवंत दिखें, इसे समायोजित करें।';

  @override
  String get accessibilityVisualGroupTitle => 'डिस्प्ले';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'लिंक को हमेशा रेखांकित करें';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'स्ट्राइकथ्रू टेक्स्ट को हल्का करें';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM मैसेज प्रीव्यू';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'DM सूची में संदेश पूर्वावलोकन कब दिखाए जाते हैं, इसे नियंत्रित करें।';

  @override
  String get accessibilityDmMessagePreviewModeLabel => 'DM मैसेज प्रीव्यू मोड';

  @override
  String get accessibilityDmMessagePreviewAllName => 'सभी मैसेज';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'सभी DM चैट के लिए मैसेज के प्रीव्यू दिखाएं';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName => 'केवल अपठित DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'केवल बिना पढ़े मैसेज वाले DM के लिए मैसेज प्रीव्यू दिखाएं';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'कोई नहीं';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'DM सूची में मैसेज के प्रीव्यू न दिखाएं';

  @override
  String get accessibilityScreenReaderGroupTitle => 'स्क्रीन रीडर';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'स्क्रीन रीडर के साथ $productName के काम करने का तरीका नियंत्रित करें।';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'नए मैसेज की घोषणा करें';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'जब खुले चैनल में नए मैसेज आएं, तो स्क्रीन रीडर उन्हें अनाउंस करें। नोटिफ़िकेशन की आवाज़ पर कोई असर नहीं होगा।';

  @override
  String get accessibilityTtsGroupTitle => 'टेक्स्ट-टू-स्पीच';

  @override
  String get accessibilityTtsGroupDescription =>
      'बोले गए टेक्स्ट के लिए एक गति चुनें।';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => 'स्पीच प्लेबैक स्पीड';

  @override
  String get accessibilityTtsPlaySampleLabel => 'नमूना चलाएं';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'साइलेंस सैंपल';

  @override
  String get accessibilityPreviewButtonLabel => 'प्रीव्यू बटन';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'यह दिखाता है कि लिंक कैसे दिखते हैं: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'पूर्वावलोकन उपयोगकर्ता';

  @override
  String get accessibilityKeyboardGroupTitle => 'कीबोर्ड';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'चैट टेक्स्ट एरिया पर फ़ोकस रिंग दिखाएं';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'एस्केप कुंजी से कीबोर्ड मोड से बाहर निकलें';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'कॉन्टेक्स्ट मेन्यू शॉर्टकट दिखाएं';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'कॉल शुरू करने से पहले पुष्टि करें';

  @override
  String get accessibilityAnimationGroupTitle => 'एनिमेशन';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'कम की गई गति चालू है, इसलिए सामग्री एनिमेशन डिफ़ॉल्ट रूप से रुके हुए हैं। आप इसे चलाने के लिए अभी भी इनमें से किसी को भी वापस चालू कर सकते हैं।';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'एनिमेटेड इमोजी चलाएं';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'GIF अपने आप चलाएं';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'जब $productName फ़ोकस में हो, तो GIF अपने आप चलाएँ';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'कम गति के बावजूद चल रहा है।';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'कम गति के कारण रोका गया. ऐनिमेटेड इमोजी चलाने के लिए चालू करें.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'कम मोशन की वजह से रोका गया. GIF चलाने के लिए इसे चालू करें.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'बैटरी लाइफ़ और डेटा बचाने के लिए मोबाइल पर डिफ़ॉल्ट रूप से बंद रहता है.';

  @override
  String get accessibilityStickerAnimationsTitle => 'स्टिकर ऐनिमेशन';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'स्टिकर ऐनिमेशन की पसंद';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'हमेशा ऐनिमेट करें';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'स्टिकर हमेशा ऐनिमेट होंगे';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'इंटरैक्शन पर ऐनिमेट करें';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'स्टिकर दबाने पर ऐनिमेट होंगे';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'स्टिकर तब ऐनिमेट होंगे, जब आप उन पर होवर करेंगे या उनसे इंटरैक्ट करेंगे';

  @override
  String get accessibilityStickerNeverAnimateName => 'कभी ऐनिमेट न करें';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'स्टिकर कभी ऐनिमेट नहीं होंगे';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'कम गति के बावजूद हमेशा एनिमेट हो रहा है।';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'कम की गई गति स्टिकर को इंटरैक्शन पर एनिमेट करने तक सीमित करती है। ओवरराइड करने के लिए हमेशा एनिमेट चुनें।';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'बैटरी बचाने के लिए मोबाइल पर इंटरैक्शन पर डिफ़ॉल्ट रूप से ऐनिमेट होता है।';

  @override
  String get accessibilityMotionGroupTitle => 'मोशन';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'सिस्टम के साथ कम मोशन सेटिंग सिंक करें';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'इस डिवाइस की सिस्टम रिड्यूस्ड मोशन प्राथमिकता का उपयोग करें या इसे नीचे कस्टमाइज़ करें।';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'मोशन कम करें';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'ऐनिमेशन और ट्रांज़िशन बंद करें. यह अभी आपकी सिस्टम सेटिंग से कंट्रोल होता है.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'पूरे ऐप में एनिमेशन और ट्रांज़िशन बंद करें।';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'एनिमेटेड इमोजी, GIF और स्टिकर एनिमेशन टैब में आपके नियंत्रण में रहते हैं।';

  @override
  String get accessibilityConfirmStartCallTitle => 'कॉल शुरू करें?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'क्या आप वाकई यह कॉल शुरू करना चाहते हैं?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'कॉल शुरू करें';

  @override
  String get accessibilityTtsSampleDescription =>
      'चुनी हुई स्पीड पर सैंपल लाइन सुनें।';

  @override
  String get accessibilityTtsSampleText =>
      'डॉक्टर, मैं भविष्य से आया हूँ। मैं आपकी बनाई टाइम मशीन से यहाँ आया हूँ। अब, मुझे 1985 में वापस जाने के लिए आपकी मदद चाहिए।';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'इस डिवाइस पर स्पीच सिंथेसिस उपलब्ध नहीं है।';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'स्पीच प्लेबैक विफल रहा। फिर से कोशिश करें, या जांचें कि ऑडियो आउटपुट काम कर रहा है।';

  @override
  String get ttsSubstitutionUnknownUser => 'अज्ञात यूज़र';

  @override
  String get ttsSubstitutionUnknownRole => 'अज्ञात भूमिका';

  @override
  String get ttsSubstitutionUnknownChannel => 'अज्ञात चैनल';

  @override
  String get ttsSubstitutionCodeBlock => 'कोड ब्लॉक';

  @override
  String get ttsSubstitutionSpoiler => 'स्पॉइलर';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'इमोजी $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'स्लैश $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName ने कहा: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '$replyAuthorName को जवाब देते हुए, $authorName ने कहा: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName ने $description';
  }

  @override
  String get ttsSentSticker => 'एक स्टिकर भेजा';

  @override
  String get ttsSentAttachment => 'एक अटैचमेंट भेजा';

  @override
  String ttsSentAttachments(int count) {
    return '$count अटैचमेंट भेजे गए';
  }

  @override
  String get ttsSentEmbed => 'एक एम्बेड भेजा';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author ने $summary भेजा';
  }

  @override
  String get dmListSentAnAttachment => 'अटैचमेंट भेजा';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username ने इस चैनल पर एक मैसेज पिन किया है।';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username ने $userName को ग्रुप में जोड़ा।';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username ने किसी को ग्रुप में जोड़ा।';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username ग्रुप छोड़ चुका है।';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username ने $userName को ग्रुप से हटा दिया।';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username ने किसी को ग्रुप से हटा दिया।';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username ने चैनल का नाम बदलकर $newName कर दिया।';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username ने चैनल का नाम बदला।';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username ने चैनल आइकॉन बदला।';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username ने कॉल शुरू की।';
  }

  @override
  String get systemCallJoinTheCall => 'कॉल में शामिल हों';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username ने $duration तक चली कॉल शुरू की।';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'आपने $username से एक कॉल मिस कर दी जो $duration तक चली।';
  }

  @override
  String systemCallMissed(String username) {
    return 'आपने $username से कॉल मिस कर दी।';
  }

  @override
  String get systemCallDurationFewSeconds => 'कुछ सेकंड पहले';

  @override
  String get systemCallDurationMinute => 'एक मिनट';

  @override
  String get systemCallDurationOneYear => '1 साल';

  @override
  String get systemCallDurationOneMonth => '1 महीना';

  @override
  String get systemCallDurationOneWeek => '1 हफ़्ता';

  @override
  String get systemCallDurationOneDay => '1 दिन';

  @override
  String get systemCallDurationOneHour => '1 घंटा';

  @override
  String systemCallDurationYears(int count) {
    return '$count साल';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count महीने';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count हफ़्ते';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count दिन';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count घंटे';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count मिनट';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'यह मैसेज देखने के लिए $productName को अपडेट करें।';
  }

  @override
  String get voiceConnectionConfirmTitle => 'आवाज़ कनेक्शन की पुष्टि';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'आप पहले से ही $count अन्य डिवाइस से इस वॉयस चैनल से जुड़े हुए हैं। आप क्या करना चाहेंगे?',
      one:
          'आप पहले से ही 1 अन्य डिवाइस से इस वॉयस चैनल से जुड़े हुए हैं। आप क्या करना चाहेंगे?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'इस डिवाइस पर स्विच करें';

  @override
  String get voiceConnectionConfirmJustJoin => 'अन्य कनेक्शन रखें (बस जुड़ें)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'कुछ न करें, मैं शामिल नहीं होना चाहता';

  @override
  String get voiceJoinFailedTitle => 'आवाज़ में शामिल नहीं हो सके';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'आपके अन्य डिवाइस डिस्कनेक्ट नहीं हो सके। थोड़ी देर में फिर से प्रयास करें।';

  @override
  String get voiceChannelEmptyDescription =>
      'यह एक वॉयस चैनल है। बात करना शुरू करने के लिए कनेक्ट करें!';

  @override
  String get voiceChannelJoin => 'वॉइस चैनल में शामिल हों';

  @override
  String get voiceCallJoin => 'कॉल में शामिल हों';

  @override
  String get voiceChannelJoinConnect => 'वॉयस से कनेक्ट करें';

  @override
  String get voiceChannelNoConnectPermission =>
      'आपके पास इस वॉइस चैनल से जुड़ने की अनुमति नहीं है';

  @override
  String get voiceChannelE2eeEncrypted =>
      'माइक्रोफ़ोन, कैमरा और स्क्रीन साझा करने वाली सामग्री एंड-टू-एंड एन्क्रिप्टेड है।';

  @override
  String get voiceCallE2eeEncrypted =>
      'माइक्रोफ़ोन, कैमरा और स्क्रीन साझा करने वाली सामग्री एंड-टू-एंड एन्क्रिप्टेड है।';

  @override
  String get voiceChannelE2eeBroken =>
      'एंड-टू-एंड एन्क्रिप्शन उपलब्ध नहीं है क्योंकि इस वॉइस चैनल में एक असमर्थित प्रतिभागी है।';

  @override
  String get voiceCallE2eeBroken =>
      'एंड-टू-एंड एन्क्रिप्शन अनुपलब्ध है क्योंकि इस कॉल में एक असमर्थित प्रतिभागी है।';

  @override
  String get voiceE2eeUpdateRequired =>
      'इस एन्क्रिप्टेड कॉल में शामिल होने के लिए इस क्लाइंट को अपडेट किया जाना चाहिए।';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'आपका माइक्रोफ़ोन शुरू नहीं हो सका। आप अभी भी कॉल में हैं।';

  @override
  String get voiceChannelStatusConnecting => 'कनेक्ट हो रहा है…';

  @override
  String get voiceChannelStatusConnected => 'कनेक्टेड';

  @override
  String get voiceChannelStatusError => 'गड़बड़ हो गई';

  @override
  String get voiceParticipantTooltipMobileDevice => 'मोबाइल डिवाइस';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'डेस्कटॉप डिवाइस';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'समुदाय ने म्यूट किया';

  @override
  String get voiceParticipantTooltipMuted => 'म्यूट किया गया';

  @override
  String get voiceParticipantTooltipCommunityDeafened => 'समुदाय ने म्यूट किया';

  @override
  String get voiceParticipantTooltipDeafened => 'बहरा किया गया';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'कनेक्शन: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count प्रतिभागी',
      one: '1 प्रतिभागी',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'छोड़ें';

  @override
  String get voiceControlMute => 'म्यूट करें';

  @override
  String get voiceControlUnmute => 'अनम्यूट करें';

  @override
  String get voiceControlDeafen => 'आवाज़ बंद करें';

  @override
  String get voiceControlUndeafen => 'अनडीफ़ेन करें';

  @override
  String get voiceControlVideo => 'वीडियो';

  @override
  String get voiceControlFlipCamera => 'कैमरा पलटें';

  @override
  String get voiceControlScreenShare => 'स्क्रीन शेयर';

  @override
  String get voiceScreenShareNotificationText => 'आपकी स्क्रीन शेयर हो रही है।';

  @override
  String get voiceControlMore => 'ज़्यादा';

  @override
  String get voiceControlDisconnect => 'डिस्कनेक्ट करें';

  @override
  String get voiceInChat => 'वॉइस चैट में';

  @override
  String get voiceConnectionFailed => 'कनेक्शन विफल';

  @override
  String get voiceConnectionRetry => 'फिर से कोशिश करें';

  @override
  String get voiceConnectionDismiss => 'खारिज करें';

  @override
  String get voiceConnectionDisconnected => 'डिस्कनेक्ट हो गया';

  @override
  String voicePingMs(int currentLatency) {
    return 'पिंग: $currentLatency मि॰से॰';
  }

  @override
  String get voiceMeasuringLatency => 'लेटेंसी मापी जा रही है...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return '$channelSourceLabel पर जाएं';
  }

  @override
  String get voiceConnectionTitle => 'वॉइस कनेक्शन';

  @override
  String get voiceConnectionAdvancedStats => 'एडवांस';

  @override
  String get voiceShowCallAvatars => 'कॉल अवतार दिखाएं';

  @override
  String get voiceShowConnectionId => 'कनेक्शन आईडी दिखाएं';

  @override
  String get voiceAudioProcessing => 'ऑडियो प्रोसेस हो रहा है';

  @override
  String get voiceConnectionSessionSection => 'सेशन';

  @override
  String get voiceConnectionDurationLabel => 'अवधि';

  @override
  String get voiceConnectionParticipantsLabel => 'प्रतिभागी';

  @override
  String get voiceConnectionNetworkSection => 'नेटवर्क';

  @override
  String get voiceConnectionPingLabel => 'पिंग करें';

  @override
  String get voiceConnectionJitterLabel => 'घबराहट';

  @override
  String get voiceConnectionSendLabel => 'भेजें';

  @override
  String get voiceConnectionReceiveLabel => 'प्राप्त';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes मि $seconds से';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency मि';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter मि';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth केबीपीएस';
  }

  @override
  String get userAreaMuteMicrophone => 'माइक म्यूट करें';

  @override
  String get userAreaUnmuteMicrophone => 'माइक अनम्यूट करें';

  @override
  String get userAreaUserSettings => 'यूज़र सेटिंग्ज़';

  @override
  String get voiceParticipantMenuViewProfile => 'प्रोफ़ाइल देखें';

  @override
  String get voiceParticipantMenuFocus => 'इस व्यक्ति पर फ़ोकस करें';

  @override
  String get voiceParticipantMenuUnfocus => 'अनफोकस करें';

  @override
  String get voiceParticipantMenuCommunityMute => 'कम्युनिटी म्यूट करें';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'कम्युनिटी डीफ़ेन';

  @override
  String get voiceParticipantMenuUserVolume => 'यूज़र की आवाज़ की वॉल्यूम';

  @override
  String get voiceParticipantMenuStreamVolume => 'स्ट्रीम वॉल्यूम';

  @override
  String get voiceParticipantMenuStopStreaming => 'स्ट्रीमिंग बंद करें';

  @override
  String get voiceParticipantModerationFailed =>
      'सदस्य को अपडेट नहीं किया जा सका। कृपया पुनः प्रयास करें।';

  @override
  String get voiceControlChat => 'चैट';

  @override
  String get voiceCallViewModeLabel => 'देखें';

  @override
  String get voiceCallViewModeGrid => 'ग्रिड';

  @override
  String get voiceCallViewModeFocus => 'फ़ोकस';

  @override
  String get voicePanelSettingsSectionTitle => 'वॉइस सेटिंग्ज़';

  @override
  String get voicePanelUseEarpieceLabel => 'ईयरपीस का उपयोग करें';

  @override
  String get voicePanelOnlyShowVideosLabel => 'सिर्फ़ वीडियो दिखाएँ';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'केवल उन प्रतिभागियों को दिखाएं जिनका कैमरा चालू है।';

  @override
  String get voicePanelShowOwnCameraLabel => 'मेरा कैमरा दिखाएं';

  @override
  String get voicePrioritizeSpeakersLabel => 'बोलने वालों को प्राथमिकता दें';

  @override
  String get voiceTextChatShow => 'चैट दिखाएं';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# अपठित संदेशों के साथ चैट दिखाएं',
      one: '# अपठित संदेश के साथ चैट दिखाएं',
    );
    return '$_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'वीडियो के लिए कैमरा अनुमति आवश्यक है।';

  @override
  String get voiceErrorScreenShareToggle =>
      'स्क्रीन शेयरिंग शुरू नहीं हो सकी। कृपया पुनः प्रयास करें।';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'स्क्रीन-शेयरिंग की अनुमति अस्वीकार कर दी गई थी।';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'इस डिवाइस पर स्क्रीन शेयरिंग उपलब्ध नहीं है।';

  @override
  String get voiceWatchStream => 'स्ट्रीम देखें';

  @override
  String get voiceStopWatching => 'देखना बंद करें';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'वर्तमान स्ट्रीम देखना बंद करें';

  @override
  String get voiceOwnScreenShareTitle => 'आप प्रसारण कर रहे हैं';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'आपकी स्ट्रीम प्रतिभागियों के लिए लाइव है।';

  @override
  String get voiceLiveBadge => 'लाइव';

  @override
  String get dmVoiceViewCall => 'कॉल देखें';

  @override
  String get dmVoiceCallFullScreen => 'पूर्ण स्क्रीन';

  @override
  String get dmVoiceCallFullScreenTooltip => 'कॉल को फुल स्क्रीन में खोलें';

  @override
  String get dmVoiceStripStatusConnecting => 'कनेक्ट हो रहा है…';

  @override
  String get dmVoiceStripStatusInCall => 'कॉल पर';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'वॉइस कॉल';

  @override
  String get dmVoiceCallBarConnecting => 'कनेक्ट हो रहा है…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'सीधी कॉल';

  @override
  String get dmVoiceCallBarGroupPrimary => 'ग्रुप कॉल';

  @override
  String get dmVoiceCallBarIssueFallback => 'आवाज़ की समस्या';

  @override
  String get dmVoiceFullscreenTitle => 'वॉइस';

  @override
  String get voiceCallBarGuildConnectedFallback => 'आवाज़ कनेक्टेड';

  @override
  String get notificationsPageTitle => 'सूचनाएं';

  @override
  String get notificationsFilterUnreads => 'अपठित';

  @override
  String get notificationsFilterMentions => 'मेंशन';

  @override
  String get notificationsBookmarksTooltip => 'बुकमार्क';

  @override
  String get notificationsMentionFilterTooltip => 'मेंशन फ़िल्टर करें';

  @override
  String get notificationsMentionFiltersTitle => 'Mention फ़िल्टर';

  @override
  String get notificationsMentionIncludeEveryone =>
      '@everyone और @here मेंशन शामिल करें';

  @override
  String get notificationsMentionIncludeRoles => 'भूमिका उल्लेख शामिल करें';

  @override
  String get notificationsMentionIncludeGuilds =>
      'सभी कम्युनिटी मेंशन शामिल करें';

  @override
  String get notificationsNoUnreadTitle => 'कोई अपठित संदेश नहीं';

  @override
  String get notificationsNoUnreadBody => 'आप सब देख चुके हैं।';

  @override
  String get notificationsNoMentionsTitle => 'कोई हालिया उल्लेख नहीं';

  @override
  String get notificationsNoMentionsBody =>
      'आपके सभी @उल्लेख यहाँ 7 दिनों के लिए दिखाई देंगे।';

  @override
  String get notificationsMentionsEndTitle => 'आप अंत तक पहुँच गए हैं';

  @override
  String get notificationsMentionsEndBody =>
      'आपने अपने सभी हालिया उल्लेख देख लिए हैं। चिंता न करें, जल्द ही और भी यहाँ दिखाई देंगे।';

  @override
  String get notificationsJump => 'आगे बढ़ें';

  @override
  String get notificationsRemoveMentionTooltip => 'मेंशन हटाएँ';

  @override
  String get notificationsViewAllUnread => 'सभी अपठित देखें';

  @override
  String get notificationsMarkAsRead => 'पढ़ा गया के रूप में मार्क करें';

  @override
  String get notificationsExpand => 'बड़ा करें';

  @override
  String get notificationsCollapse => 'छोटा करें';

  @override
  String get notificationsMessageUnavailable => 'यह संदेश लोड नहीं हो सका।';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining वर्ण बचे हैं';
  }

  @override
  String get characterCounterTooLong => 'मैसेज बहुत लंबा है';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining अक्षर बचे हैं। $premiumMaxLength अक्षर तक लिखने के लिए $productName प्राप्त करें।';
  }

  @override
  String get chatMessageFailedToSend => 'संदेश भेजने में विफल';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'आपका संदेश डिलीवर नहीं हो सका। ऐसा आमतौर पर इसलिए होता है क्योंकि आप प्राप्तकर्ता के साथ कोई समुदाय साझा नहीं करते हैं या प्राप्तकर्ता केवल दोस्तों से डायरेक्ट मैसेज स्वीकार कर रहा है। आपको अपने डायरेक्ट मैसेज की गोपनीयता सेटिंग्स को $settingsPath में भी एडजस्ट करने की आवश्यकता हो सकती है।';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'आपका मैसेज डिलीवर नहीं हो पाया. सीधे मैसेज भेजने के लिए आपको अपना अकाउंट क्लेम करना होगा.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'आपका मैसेज डिलीवर नहीं हो पाया. मैसेज भेजने के लिए आपको अपना अकाउंट क्लेम करना होगा.';

  @override
  String get chatSendFailureContentBlocked =>
      'आपका मैसेज डिलीवर नहीं हो सका क्योंकि इसे हमारे सुरक्षा सिस्टम ने फ़्लैग किया था। अगर आपको लगता है कि यह गलती से हुआ है, तो कृपया सहायता टीम से संपर्क करें।';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'आपका संदेश डिलीवर नहीं हो सका क्योंकि इसमें ऐसे परिपक्व इमोजी या स्टिकर थे जो इस संदर्भ में अनुमत नहीं हैं।';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'यह संदेश केवल आप ही देख सकते हैं।';

  @override
  String get chatClientSystemDismiss => 'खारिज करें';

  @override
  String get privacyDashboardCommunicationSection => 'कम्युनिकेशन';

  @override
  String get privacyDashboardProfilePrivacySection => 'प्रोफ़ाइल गोपनीयता';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'मित्र और प्रत्यक्ष संदेश';

  @override
  String get privacyDashboardActivitySharingSection => 'गतिविधि साझाकरण';

  @override
  String get privacyDashboardSensitiveContentSection => 'संवेदनशील सामग्री';

  @override
  String get privacyDashboardDataExportSection => 'डेटा निर्यात';

  @override
  String get privacyDashboardDataDeletionSection => 'डेटा मिटाना';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'आपकी पूरी प्रोफ़ाइल कौन देख सकता है';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'दोस्त और सभी समुदाय';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'आपकी पूरी प्रोफ़ाइल दोस्तों और आपके समुदायों में मौजूद किसी भी व्यक्ति को दिखाई देती है';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'केवल दोस्त और छोटी कम्युनिटी';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'आपकी पूरी प्रोफ़ाइल 200 या उससे कम सदस्यों वाले आपके दोस्तों और कम्युनिटी के सदस्यों को दिखाई देती है';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'सिर्फ़ दोस्त';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'आपकी पूरी प्रोफ़ाइल केवल आपके दोस्तों को दिखाई देती है';

  @override
  String get privacyDashboardFriendRequestsTitle => 'फ्रेंड रिक्वेस्ट';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'हर कोई';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'सभी को आपको फ्रेंड रिक्वेस्ट भेजने की अनुमति दें';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'दोस्तों के दोस्त';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'आपके दोस्तों के दोस्तों को आपको अनुरोध भेजने की अनुमति दें';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'समुदाय के सदस्य';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'आप जिन समुदायों में हैं, उनके सदस्य आपको अनुरोध भेज सकते हैं';

  @override
  String get privacyDashboardDirectMessagesTitle => 'सीधी बातचीत';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'कम्युनिटी सदस्यों से सीधे मैसेज की अनुमति दें';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'आप जिन समुदायों में हैं, उनके सदस्यों को आपको सीधे संदेश भेजने की अनुमति दें';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'कम्युनिटी बॉट से सीधे मैसेज की अनुमति दें';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'आप जिन समुदायों में हैं, वहां के बॉट आपको सीधे संदेश भेज सकते हैं';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'नियंत्रित करें कि कौन आपको मित्र अनुरोध और सीधे संदेश भेज सकता है';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'कॉल करने और आपको ग्रुप चैट में जोड़ने के लिए नियंत्रित करें';

  @override
  String get privacyDashboardIncomingCallsTitle => 'आने वाली कॉल';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'यह नियंत्रित करें कि कौन आपको कॉल कर सकता है';

  @override
  String get privacyDashboardAllowedCallers => 'अनुमत कॉलर';

  @override
  String get privacyDashboardIncomingCallNobody => 'कोई नहीं';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'सभी आने वाली कॉल ब्लॉक करें';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'सिर्फ़ दोस्तों के लिए';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'केवल दोस्तों को आपको कॉल करने की अनुमति दें (अनुशंसित)';

  @override
  String get privacyDashboardIncomingCallCustom => 'मित्र + कस्टम';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'दोस्तों को अनुमति दें और अतिरिक्त समूह जिन्हें आप चुनते हैं';

  @override
  String get privacyDashboardIncomingCallEveryone => 'हर कोई';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'किसी को भी आपको कॉल करने दें, अजनबी भी';

  @override
  String get privacyDashboardAdditionalGroups => 'अतिरिक्त समूह';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'आपके दोस्तों के दोस्त आपको कॉल कर सकते हैं';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'आपके द्वारा जुड़े हुए समुदायों के लोग आपको कॉल कर सकते हैं';

  @override
  String get privacyDashboardRingBehavior => 'रिंग व्यवहार';

  @override
  String get privacyDashboardSilentCalls => 'सभी से साइलेंट कॉल';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'सभी कॉल बजने के बजाय चुपचाप सूचित करेंगी। डिफ़ॉल्ट रूप से, गैर-दोस्तों से आने वाली कॉल हमेशा म्यूट रहती हैं।';

  @override
  String get privacyDashboardGroupDmTitle =>
      'आपको ग्रुप चैट में कौन जोड़ सकता है';

  @override
  String get privacyDashboardGroupDmDesc =>
      'नियंत्रित करें कि कौन आपको पूछे बिना ग्रुप चैट में जोड़ सकता है। कोई भी अभी भी आपको शामिल होने के लिए आमंत्रण लिंक भेज सकता है।';

  @override
  String get privacyDashboardAllowedInvites => 'अनुमत आमंत्रण';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'किसी को भी आपको पूछे बिना ग्रुप चैट में जोड़ने न दें';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'सिर्फ़ दोस्तों को बिना पूछे आपको जोड़ने की अनुमति दें (अनुशंसित)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'दोस्तों के साथ-साथ अतिरिक्त ग्रुप को भी आपको जोड़ने की अनुमति दें';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'सभी को आपको बिना पूछे ग्रुप चैट में जोड़ने की अनुमति दें';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'आपके दोस्तों के दोस्त आपको ग्रुप चैट में जोड़ सकते हैं';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'जिन समुदायों में आप दोनों हैं, वहां के लोग आपको ग्रुप चैट में जोड़ सकते हैं';

  @override
  String get privacyDashboardVoiceActivityTitle => 'अभी सक्रिय पर वॉइस गतिविधि';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'दोस्तों के साथ अपनी वॉइस गतिविधि शेयर करें';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'सभी दोस्तों के साथ वॉइस गतिविधि शेयर करें?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'सभी दोस्तों के साथ वॉइस गतिविधि शेयर करना बंद करें?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'आप अपनी वॉइस गतिविधि अपने सभी दोस्तों के साथ शेयर करने वाले हैं, जिसमें भविष्य के दोस्त भी शामिल हैं. यह उन सभी को एक अपडेट भेजेगा और इसे 24 घंटों में फिर से बदला जा सकता है.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'आप अपनी वॉइस गतिविधि को अपने सभी दोस्तों के साथ शेयर करना बंद करने वाले हैं, जिसमें भविष्य के दोस्त भी शामिल हैं. यह उन सभी को एक अपडेट भेजेगा और इसे 24 घंटों में ही फिर से बदला जा सकता है.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'हाँ, सभी दोस्तों के साथ शेयर करें';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'हाँ, शेयर करना बंद करें';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return '$time में फिर से उपलब्ध होगा';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'वॉयस गतिविधि शेयरिंग अपडेट की गई';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'अभी वॉइस गतिविधि शेयरिंग अपडेट नहीं कर पाए';

  @override
  String get privacyDashboardDataExportDesc =>
      'अपने अकाउंट डेटा का डाउनलोड करने लायक आर्काइव बनाएँ, जिसमें मैसेज और अटैचमेंट URL शामिल हैं. ज़्यादातर लोग सब कुछ चाहते हैं, लेकिन आप नीचे दायरे को सीमित कर सकते हैं.';

  @override
  String get privacyDashboardExportMyData => 'मेरा डेटा एक्सपोर्ट करें';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'आपके द्वारा DMs, ग्रुप DMs और कम्युनिटी में भेजे गए मैसेज को स्थायी रूप से हटा दें. यह काम बैकग्राउंड में चलता है और पूरा होने पर आपको एक DM मिलेगा.';

  @override
  String get privacyDashboardDeleteMyMessages => 'मेरे मैसेज मिटाएँ';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'क्या आप कम्युनिटी सदस्यों से सीधे मैसेज की अनुमति देना चाहते हैं?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'क्या आप कम्युनिटी सदस्यों से सीधे मैसेज ब्लॉक करना चाहते हैं?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'क्या बॉट आपको सीधे मैसेज भेज सकते हैं?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'क्या आप बॉट को सीधे मैसेज भेजने से ब्लॉक करना चाहते हैं?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'क्या आप अपनी मौजूदा कम्युनिटी के सदस्यों से सीधे मैसेज की अनुमति भी देना चाहते हैं?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'क्या आप अपनी मौजूदा कम्युनिटी के सदस्यों से सीधे मैसेज भी ब्लॉक करना चाहते हैं?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'क्या आप अपनी मौजूदा कम्युनिटी के बॉट को भी सीधे मैसेज भेजने की अनुमति देना चाहते हैं?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'क्या आप अपने मौजूदा समुदायों से बॉट को भी ब्लॉक करना चाहते हैं?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'आप समुदाय का नाम देर तक दबाकर और \'गोपनीयता सेटिंग्स\' चुनकर इस सेटिंग को प्रति-समुदाय भी बदल सकते हैं।';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'सभी कम्युनिटी के लिए अनुमति दें';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'सभी कम्युनिटी के लिए ब्लॉक करें';

  @override
  String get privacyDashboardDmConfirmSkip => 'यह स्टेप छोड़ें';

  @override
  String get privacyDashboardDataRequestGoBack => 'वापस जाएँ';

  @override
  String get privacyDashboardDataRequestExportTitle =>
      'मेरा डेटा एक्सपोर्ट करें';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'मेरे मैसेज मिटाएँ';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'हम इसे जल्द से जल्द प्रोसेस करेंगे। आपका आर्काइव तैयार होने पर आपको एक ईमेल मिलेगा।';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'हम इसे जल्द से जल्द प्रोसेस करेंगे। पूरा होने पर आपको हमारी ओर से एक DM मिलेगा।';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'क्या शामिल करें';

  @override
  String get privacyDashboardDataRequestExportEverything => 'सब कुछ';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'आपके द्वारा भेजे गए सभी मैसेज, साथ ही आपकी सभी अकाउंट सेटिंग, मेंबरशिप और मेटाडेटा एक्सपोर्ट करें।';

  @override
  String get privacyDashboardDataRequestExportCustom => 'पसंद के मुताबिक चुनाव';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'आर्काइव में शामिल करने के लिए बातचीत के प्रकार, कम्युनिटी और समय-सीमा चुनें.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'क्या शामिल करना है चुनें';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'चुनें कि किस तरह की बातचीत को साफ़ करना है।';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'केवल वे जगहें जहाँ मैं अब एक्सेस नहीं कर सकता';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'केवल उन कम्युनिटी और ग्रुप DM से मैसेज मिटाएं जिन्हें आपने छोड़ा है या जिनसे आपको हटा दिया गया है।';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'कौन सी बातचीत';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'आप जिन बातचीत को शामिल करना चाहते हैं, उनके प्रकार टॉगल करें।';

  @override
  String get privacyDashboardDataRequestKindDms => 'ओपन DM';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'बंद किए गए DM';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'ग्रुप DM';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'समुदाय';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'कौनसी कम्युनिटीज़';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'कम्युनिटी फ़िल्टर';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'चुने गए को छोड़कर सभी शामिल करें';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude => 'सिर्फ़ चुने हुए';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'आप अभी किसी भी कम्युनिटी में नहीं हैं।';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'समय सीमा';

  @override
  String get privacyDashboardDataRequestDateMode => 'समय सीमा';

  @override
  String get privacyDashboardDataRequestAllTime => 'हर समय';

  @override
  String get privacyDashboardDataRequestCustomRange => 'कस्टम सीमा';

  @override
  String get privacyDashboardDataRequestStartDate => 'शुरू करने की तारीख';

  @override
  String get privacyDashboardDataRequestEndDate => 'अंतिम तिथि';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'विंडो के उस सिरे को असीमित छोड़ने के लिए किसी भी फ़ील्ड को खाली छोड़ दें।';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'शामिल करने के लिए कम से कम एक तरह की बातचीत चुनें।';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'शुरू होने की तारीख खत्म होने की तारीख से पहले होनी चाहिए।';

  @override
  String get privacyDashboardDataRequestConfirmTitle =>
      'समीक्षा करें और पुष्टि करें';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'हम आपके द्वारा भेजे गए हर मैसेज का एक डाउनलोड करने योग्य संग्रह बनाएंगे और तैयार होने पर आपको ईमेल करेंगे। उस ईमेल में डाउनलोड लिंक 7 दिनों के बाद समाप्त हो जाएगा।';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'हम नीचे दिए गए फ़िल्टर से मेल खाने वाला एक डाउनलोड करने योग्य संग्रह बनाएंगे और तैयार होने पर आपको ईमेल करेंगे। उस ईमेल में डाउनलोड लिंक 7 दिनों के बाद समाप्त हो जाएगा।';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'नीचे दिए गए फ़िल्टर से मेल खाने वाले मैसेज हमेशा के लिए मिटा दें. इसे पहले जैसा नहीं किया जा सकता.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'एक बार शुरू होने के बाद इसे वापस नहीं पाया जा सकता है। पूरा होने पर हम आपको DM करेंगे।';

  @override
  String get privacyDashboardDataRequestRequestExport =>
      'निर्यात का अनुरोध करें';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'मैसेज मिटाएं';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'दायरा';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'बातचीत';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'समुदाय';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'समय सीमा';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'कोई नहीं';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return '$start से';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return '$end तक';
  }

  @override
  String privacyDashboardDataRequestSummaryBetween(String start, String end) {
    return '$start – $end';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildExclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# समुदायों को छोड़कर',
      one: '# समुदाय को छोड़कर',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# कम्युनिटीज़',
      one: '# कम्युनिटी',
    );
    return 'सिर्फ़ $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen => 'खुली सीधी बातचीत';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'बंद किए गए सीधे मैसेज';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'सीधी बातचीत (खुली और बंद)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'ग्रुप DM';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded => 'समुदाय';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# घंटे',
      one: '# घंटा',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# मिनट',
      one: '# मिनट',
    );
    return '$_temp0 और $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# घंटे',
      one: '# घंटा',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# मिनट',
      one: '# मिनट',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# सेकंड',
      one: '# सेकंड',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'गोपनीयता सेटिंग लोड करने में विफल';

  @override
  String get privacyDashboardRetry => 'पुनः प्रयास करें';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'संवेदनशील सामग्री सेटिंग सहेजने में विफल।';

  @override
  String get privacyDashboardDataRequestFailed => 'अनुरोध पूरा करने में विफल।';

  @override
  String get chatMessageDeleteFailed => 'डिलीट किया गया संदेश';

  @override
  String get chatMessageAddReaction => 'प्रतिक्रिया जोड़ें';

  @override
  String get chatMessageEdit => 'संदेश संपादित करें';

  @override
  String get chatMessageReply => 'रिप्लाई करें';

  @override
  String get chatMessageForward => 'फ़ॉरवर्ड करें';

  @override
  String get forwardMessageTitle => 'मैसेज फ़ॉरवर्ड करें';

  @override
  String get forwardSearchHint => 'चैनल या DM खोजें';

  @override
  String get forwardDirectMessagesSection => 'डायरेक्ट मैसेज';

  @override
  String get forwardCommentHint => 'कोई टिप्पणी जोड़ें (वैकल्पिक)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'भेजें ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'कोई चैनल नहीं मिला';

  @override
  String get forwardSuccessToast => 'मैसेज फ़ॉरवर्ड किया गया';

  @override
  String get forwardFailed => 'मैसेज फ़ॉरवर्ड नहीं हो पाया';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'टिप्पणियाँ उपलब्ध नहीं हैं क्योंकि चयनित चैनल में स्लोमोड सक्षम है।';

  @override
  String get forwardSendSlowmodeBlocked =>
      'एक या ज़्यादा चुने गए चैनलों में स्लोमोड के खत्म होने का इंतज़ार किया जा रहा है.';

  @override
  String get slowmodeRateLimitedTitle => 'स्लोमोड सक्रिय है';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'स्लोमोड चालू है — दूसरा मैसेज भेजने से पहले $duration इंतज़ार करें.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'धीमी गति के दौरान डायरेक्ट अपलोड अक्षम है।';

  @override
  String get shareMediaTitle => 'इस पर शेयर करें';

  @override
  String get shareMediaMessageHint => 'एक वैकल्पिक संदेश जोड़ें…';

  @override
  String get shareMediaSendButton => 'भेजें';

  @override
  String get shareMediaSuccessToast => 'मीडिया शेयर किया गया';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return '$count डेस्टिनेशन पर शेयर किया गया';
  }

  @override
  String get shareMediaFailedToast => 'मीडिया शेयर करने में विफल';

  @override
  String get forwardDestinationNoSendPermission =>
      'आप यहाँ संदेश नहीं भेज सकते';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'आप यहाँ लिंक एम्बेड नहीं कर सकते';

  @override
  String get forwardDestinationNoAttachPermission =>
      'आप यहां फ़ाइलें अटैच नहीं कर सकते';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'इस कम्युनिटी में मैसेज भेजना बंद है';

  @override
  String get forwardDestinationTimedOut =>
      'आप इस कम्युनिटी में टाइम आउट पर हैं';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'धीमा मोड - प्रतीक्षा करें $remaining';
  }

  @override
  String get chatMessageCopyText => 'संदेश कॉपी करें';

  @override
  String get chatMessageCopyEmbedText => 'एम्बेड टेक्स्ट कॉपी करें';

  @override
  String get chatMessageTranslate => 'अनुवाद करें';

  @override
  String chatMessageTranslatedFrom(String language) {
    return '$language से अनुवादित';
  }

  @override
  String get chatMessageSeeOriginal => 'मूल देखें';

  @override
  String get chatMessageSeeTranslation => 'अनुवाद देखें';

  @override
  String get chatMessageTranslating => 'अनुवाद हो रहा है…';

  @override
  String get chatMessageTranslateFailed =>
      'इस संदेश का अनुवाद नहीं किया जा सका।';

  @override
  String get chatMessageTranslateUnavailable =>
      'इस डिवाइस पर अनुवाद उपलब्ध नहीं है।';

  @override
  String get chatMessageSpeak => 'मैसेज बोलें';

  @override
  String get chatMessageStopSpeaking => 'बोलना बंद करें';

  @override
  String get chatMessagePin => 'मैसेज पिन करें';

  @override
  String get chatMessageUnpin => 'मैसेज अनपिन करें';

  @override
  String get chatMessageUnpinIt => 'अनपिन करें';

  @override
  String get chatMessageBookmark => 'संदेश को बुकमार्क करें';

  @override
  String get chatMessageRemoveBookmark => 'बुकमार्क हटाएं';

  @override
  String get chatMessageMarkAsUnread => 'अनपढ़ा के रूप में चिह्नित करें';

  @override
  String get chatMessageCopyMessageLink => 'संदेश लिंक कॉपी करें';

  @override
  String get chatMessageOpenLink => 'लिंक खोलें';

  @override
  String get chatMessageCopyLink => 'लिंक कॉपी करें';

  @override
  String get chatMessageCopyMessageId => 'संदेश आईडी कॉपी करें';

  @override
  String get chatMessageViewReactions => 'प्रतिक्रियाएं देखें';

  @override
  String get chatMessageRemoveAllReactions => 'सभी रिएक्शन हटाएँ';

  @override
  String get chatMessageDebug => 'डिबग संदेश';

  @override
  String get chatMessageDebugSheetTitle => 'डीबग मैसेज';

  @override
  String get chatMessageDebugCopyJson => 'JSON कॉपी करें';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'संदेश JSON क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get chatReactionsSheetTitle => 'प्रतिक्रियाएँ';

  @override
  String get chatReactionsSheetEmpty =>
      'अभी तक किसी ने इस पर प्रतिक्रिया नहीं दी है।';

  @override
  String get chatReactionAddFailed => 'प्रतिक्रिया जोड़ने में विफल';

  @override
  String get chatReactionRemoveFailed => 'प्रतिक्रिया हटाने में विफल';

  @override
  String get chatMessageReport => 'संदेश की रिपोर्ट करें';

  @override
  String get iarReportMessageTitle => 'मैसेज की शिकायत करें';

  @override
  String get iarThisUserFallback => 'यह उपयोगकर्ता';

  @override
  String get iarModalDescription =>
      'नियम उल्लंघन की रिपोर्ट करें या संपर्क और प्राथमिकताओं को प्रबंधित करने के लिए टूल ढूंढें।';

  @override
  String get iarPathStepAriaLabel => 'आपको क्या चाहिए?';

  @override
  String get iarCategoryStepTitle => 'किस तरह के नियम का उल्लंघन किया गया था?';

  @override
  String get iarReasonStepTitle => 'कौन सा नियम तोड़ा गया?';

  @override
  String get iarReasonSelectHint => 'एक कारण चुनें';

  @override
  String get iarPickAnOptionToast => 'जारी रखने के लिए एक विकल्प चुनें।';

  @override
  String get iarPickARuleToast => 'नियम चुनें कि किसका उल्लंघन हुआ है।';

  @override
  String get iarPathPlatform => 'प्लेटफ़ॉर्म नियम का उल्लंघन रिपोर्ट करें';

  @override
  String get iarPathCommunity => 'इस समुदाय के मॉडरेटर को रिपोर्ट करें';

  @override
  String get iarPathPreferenceMessage => 'मुझे यह सामग्री पसंद नहीं है';

  @override
  String get iarCategoryTargetedHarmLabel => 'धमकी, उत्पीड़न या हानि';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'धमकाना, धमकियाँ देना, नफ़रत फैलाना, हिंसा, रेड करना या खुद को नुकसान पहुँचाने वाली सामग्री।';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'बच्चों की सुरक्षा या आपत्तिजनक सामग्री';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'नाबालिगों को जोखिम, गलत जगह पर आपत्तिजनक सामग्री या अवांछित आचरण।';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'निजता या प्रतिरूपण';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'डॉक्सिंग, पीछा करना, किसी और का रूप धारण करना या अनुचित प्रोफ़ाइल।';

  @override
  String get iarCategoryDeceptionLabel => 'घोटाले, मैलवेयर या गलत जानकारी';

  @override
  String get iarCategoryDeceptionDescription =>
      'फ़िशिंग, धोखाधड़ी, दुर्भावनापूर्ण लिंक या गलत दावे जिनसे वास्तविक दुनिया को नुकसान हो सकता है।';

  @override
  String get iarCategoryIllegalOtherLabel => 'अवैध गतिविधि या कुछ और';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'अवैध बिक्री, आपराधिक सुविधा, या स्पष्ट नियम उल्लंघन जो ऊपर फिट नहीं बैठता।';

  @override
  String get iarReasonHarassmentLabel => 'उत्पीड़न या धमकियाँ';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'धमकाना, बार-बार अवांछित संपर्क, पीछा करना या लक्षित दुर्व्यवहार।';

  @override
  String get iarReasonHateLabel => 'भड़काऊ भाषण';

  @override
  String get iarReasonHateMessageDescription =>
      'अपमानजनक शब्द, अमानवीय भाषा या संरक्षित समूहों पर हमले।';

  @override
  String get iarReasonViolenceLabel => 'हिंसा या हिंसक धमकियाँ';

  @override
  String get iarReasonViolenceDescription =>
      'विश्वसनीय धमकियाँ, ग्राफिक हिंसा या हिंसा का महिमामंडन।';

  @override
  String get iarReasonMatureContentLabel => 'परिपक्व सामग्री या उत्पीड़न';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'गलत जगह पर अवांछित आचरण या परिपक्व सामग्री।';

  @override
  String get iarReasonChildSafetyLabel =>
      'बच्चों की सुरक्षा या नाबालिगों का शोषण';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'ग्रूमिंग या बाल-शोषण से जुड़ी सामग्री।';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'हानिकारक गलत जानकारी';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'झूठे दावे जिनसे वास्तविक दुनिया में नुकसान होने की संभावना है।';

  @override
  String get iarReasonSpamLabel => 'स्पैम, स्कैम या फ़िशिंग';

  @override
  String get iarReasonSpamMessageDescription =>
      'बल्क स्पैम, धोखाधड़ी, फ़र्ज़ी गिवअवे या अकाउंट का गलत इस्तेमाल।';

  @override
  String get iarReasonMalwareLabel => 'मैलवेयर या खतरनाक लिंक';

  @override
  String get iarReasonMalwareDescription =>
      'मैलवेयर, क्रेडेंशियल चोरी या नुकसान पहुँचाने वाली फ़ाइलें.';

  @override
  String get iarReasonPrivacyLabel => 'निजता का उल्लंघन';

  @override
  String get iarReasonPrivacyDescription =>
      'डॉक्सिंग, निजी जानकारी उजागर करना या पीछा करना.';

  @override
  String get iarReasonImpersonationLabel => 'रूप धारण करना या भ्रामक मीडिया';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'कोई और होने का दिखावा करना, जिसमें धोखे से जनरेट की गई AI सामग्री भी शामिल है.';

  @override
  String get iarReasonIllegalLabel => 'गैर-कानूनी गतिविधि';

  @override
  String get iarReasonIllegalDescription =>
      'अवैध बिक्री, आपराधिक सुविधा या गैरकानूनी गतिविधि।';

  @override
  String get iarReasonSelfHarmLabel => 'खुद को नुकसान पहुँचाना या आत्महत्या';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'आत्म-हानि या खाने के विकारों को बढ़ावा देने या प्रोत्साहित करने वाले निर्देश।';

  @override
  String get iarReasonOtherLabel => 'एक और स्पष्ट नियम उल्लंघन';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'इसका उपयोग तभी करें जब यह स्पष्ट रूप से $productName के नियमों का उल्लंघन करता हो और ऊपर दिए गए विकल्पों में फिट न होता हो।';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'अगर कोई नाबालिग शामिल है, तो इसके बजाय \"$childSafetyReason\" का उपयोग करें।';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'अगर इसमें CSAM या किसी नाबालिग का शोषण शामिल है, तो इसे अभी भेजें और सामग्री को दोबारा शेयर न करें।';

  @override
  String get iarSafetyNoteSelfHarm =>
      'अगर कोई तुरंत खतरे में है, तो अगर आप सुरक्षित रूप से ऐसा कर सकते हैं, तो स्थानीय आपातकालीन सेवाओं से संपर्क करें।';

  @override
  String get iarSafetyNoteViolence =>
      'अगर यह एक विश्वसनीय आसन्न ख़तरा है, तो स्थानीय आपातकालीन सेवाओं से भी संपर्क करें।';

  @override
  String get iarSafetyNoteTerrorism =>
      'अगर यह एक आसन्न आतंकवादी खतरा है, तो स्थानीय आपातकालीन सेवाओं से भी संपर्क करें।';

  @override
  String get iarActionBlockUserTitle => 'इस यूज़र को ब्लॉक करें';

  @override
  String get iarActionBlockUserDescription =>
      'मैसेज और फ्रेंड रिक्वेस्ट रोकें.';

  @override
  String get iarActionBlockUserButton => 'ब्लॉक करें';

  @override
  String get iarActionCopyMessageLinkTitle => 'मैसेज लिंक कॉपी करें';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'कम्युनिटी मॉडरेटर के साथ शेयर करें.';

  @override
  String get iarActionCopyMessageLinkButton => 'कॉपी करें';

  @override
  String get iarActionCloseDmTitle => 'यह DM बंद करें';

  @override
  String get iarActionCloseDmDescription =>
      'ब्लॉक नहीं होगा. आप बाद में फिर से खोल सकते हैं.';

  @override
  String get iarActionCloseDmButton => 'DM बंद करें';

  @override
  String get iarActionLeaveCommunityTitle => 'समुदाय छोड़ें';

  @override
  String get iarActionLeaveCommunityDescription =>
      'इसकी सामग्री और सदस्यों को देखना बंद करें.';

  @override
  String get iarActionLeaveCommunityButton => 'छोड़ें';

  @override
  String get iarActionDmSettingsTitle => 'DM और फ्रेंड रिक्वेस्ट सेटिंग';

  @override
  String get iarActionDmSettingsDescription =>
      'बदलें कि कौन आप तक पहुंच सकता है।';

  @override
  String get iarActionCallSettingsTitle => 'कॉल और ग्रुप चैट सेटिंग्स';

  @override
  String get iarActionCallSettingsDescription =>
      'बदलें कि आपको कौन कॉल या ऐड कर सकता है।';

  @override
  String get iarActionOpenButton => 'खोलें';

  @override
  String get iarActionDeleteMessageTitle => 'यह मैसेज मिटाएँ';

  @override
  String get iarActionDeleteMessageDescription =>
      'इसे चैनल से सभी के लिए हटा दें।';

  @override
  String get iarActionDeleteMessageButton => 'मिटाएँ';

  @override
  String get iarActionDeleteMessageDeletedButton => 'मिटाया गया';

  @override
  String get iarActionDeleteMessageDeletedTooltip =>
      'यह मैसेज पहले ही डिलीट हो चुका है।';

  @override
  String get iarActionBanUserTitle => 'इस यूज़र को बैन करें';

  @override
  String get iarActionBanUserDescription =>
      'इस कम्युनिटी के लिए बैन डायलॉग खोलें।';

  @override
  String get iarActionBanUserButton => 'बैन करें';

  @override
  String get iarActionBanUserBannedButton => 'बैन किया गया';

  @override
  String get iarActionBanUserBannedTooltip =>
      'यह उपयोगकर्ता पहले से ही समुदाय से प्रतिबंधित है।';

  @override
  String get iarCloseDmConfirmTitle => 'DM बंद करें';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return '$name के साथ अपनी वर्तमान DM बंद करें। इससे वे ब्लॉक नहीं होंगे; आप बाद में इसे फिर से खोल सकते हैं।';
  }

  @override
  String get iarSuccessTitle => 'रिपोर्ट भेजी गई';

  @override
  String get iarSuccessBody =>
      'हमारी सुरक्षा टीम इसकी समीक्षा कर रही है। फैसला आने के बाद हम आपको एक DM और ईमेल भेजेंगे।';

  @override
  String get iarAlreadyReportedTitle => 'पहले से रिपोर्ट किया गया';

  @override
  String get iarAlreadyReportedBody =>
      'आपने इस संदेश की पहले ही रिपोर्ट कर दी है। हमारी सुरक्षा टीम इसकी समीक्षा कर रही है।';

  @override
  String get iarBackButton => 'वापस';

  @override
  String get iarContinueButton => 'जारी रखें';

  @override
  String get iarSendReportButton => 'रिपोर्ट भेजें';

  @override
  String get iarDoneButton => 'हो गया';

  @override
  String get iarCouldntSendToast =>
      'रिपोर्ट नहीं भेजी जा सकी। कृपया पुनः प्रयास करें।';

  @override
  String get iarRateLimitedToast =>
      'आप बहुत तेज़ी से रिपोर्ट कर रहे हैं। कृपया कुछ देर प्रतीक्षा करें और पुनः प्रयास करें।';

  @override
  String get iarReportSentToast =>
      'रिपोर्ट भेजी गई। हमारी सुरक्षा टीम इसकी समीक्षा करेगी।';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'क्या आप $name को ब्लॉक करना चाहते हैं? वे आपको मैसेज या फ्रेंड रिक्वेस्ट नहीं भेज पाएंगे। आप उन्हें बाद में अनब्लॉक कर सकते हैं।';
  }

  @override
  String get iarBlockUserFailedToast =>
      'इस उपयोगकर्ता को ब्लॉक नहीं किया जा सका। कृपया पुनः प्रयास करें।';

  @override
  String get iarCloseDmSuccessToast => 'डीएम बंद हो गया।';

  @override
  String get iarCloseDmFailedToast =>
      'इस DM को बंद नहीं किया जा सका। कृपया पुनः प्रयास करें।';

  @override
  String get iarLeaveCommunityFailedToast =>
      'इस समुदाय को छोड़ना संभव नहीं हो सका। कृपया पुनः प्रयास करें।';

  @override
  String get chatMessageSuppressEmbeds => 'एम्बेड छिपाएँ';

  @override
  String get chatMessageUnsuppressEmbeds => 'एम्बेड फिर से दिखाएँ';

  @override
  String get chatMessageDelete => 'संदेश हटाएं';

  @override
  String get chatMessageDeleteConfirmTitle => 'संदेश हटाएं';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'क्या आप वाकई यह संदेश हटाना चाहते हैं?';

  @override
  String get chatMessageDeleteAttachment => 'अटैचमेंट हटाएं';

  @override
  String get chatMessageEditAttachmentAltText => 'ऑल्ट टेक्स्ट संपादित करें';

  @override
  String get chatMessageMore => 'ज़्यादा';

  @override
  String get chatEditingMessage => 'मैसेज एडिट कर रहे हैं';

  @override
  String get chatReplyOriginalDeleted => 'मूल मैसेज मिटा दिया गया था';

  @override
  String get chatReplyOriginalFailedToLoad => 'मूल मैसेज लोड नहीं हो पाया';

  @override
  String get chatReplyAttachedMedia => 'मैसेज में अटैच की गई मीडिया है';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ब्लॉक किए गए संदेश',
      one: '1 ब्लॉक किया गया संदेश',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count संभावित स्पैमर संदेश',
      one: '1 संभावित स्पैमर संदेश',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'जवाब छिपा दिया गया है क्योंकि मूल लेखक ब्लॉक किया गया है।';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'जवाब छिपा दिया गया है क्योंकि मूल लेखक को स्पैमर के तौर पर मार्क किया गया है।';

  @override
  String get devMarkAsSpamLocally =>
      'स्थानीय रूप से स्पैम के रूप में चिह्नित करें';

  @override
  String get devIgnoreSpamFlag => 'स्पैम फ़्लैग को अनदेखा करें';

  @override
  String get chatMessagesLoadError => 'संदेश लोड नहीं हो सके।';

  @override
  String get chatReplyMentionOverrideTitle => 'मेंशन प्राथमिकता बदलें?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname चाहते हैं कि जवाब में उन्हें @मेंशन किया जाए. क्या आप फिर भी बिना मेंशन किए भेजना चाहेंगे?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname को @मेंशन के बिना जवाब देना पसंद है। फिर भी मेंशन के साथ भेजें?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'पसंद को अनदेखा करें';

  @override
  String get chatReplyMentionDisableTooltip =>
      'जिस यूज़र को आप जवाब दे रहे हैं, उसे पिंग करना बंद करने के लिए क्लिक करें.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'जिस यूज़र को आप जवाब दे रहे हैं, उसे पिंग करने के लिए क्लिक करें.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'जवाब दिए गए यूज़र का ज़िक्र करें';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'बंद';

  @override
  String get chatReplyCancel => 'जवाब रद्द करें';

  @override
  String get chatEditMessageHint => 'मैसेज एडिट करें';

  @override
  String get chatEditNoChanges => 'सेव करने के लिए कोई बदलाव नहीं';

  @override
  String get chatChannelNotReady =>
      'यह चैनल अभी तैयार नहीं है। थोड़ी देर में फिर से प्रयास करें।';

  @override
  String get chatMessageEdited => '(संपादित)';

  @override
  String get chatMessageSilent => 'यह एक @silent संदेश था।';

  @override
  String chatMessageTimestampToday(String time) {
    return 'आज $time बजे';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'कल $time बजे';
  }

  @override
  String get mediaViewerImagePreview => 'इमेज प्रीव्यू';

  @override
  String get mediaViewerClose => 'मीडिया व्यूअर बंद करें';

  @override
  String get mediaViewerOpenInBrowser => 'ब्राउज़र में खोलें';

  @override
  String get mediaViewerOptions => 'मीडिया विकल्प';

  @override
  String get mediaViewerCopyLink => 'लिंक कॉपी करें';

  @override
  String get mediaViewerForward => 'फ़ॉरवर्ड करें';

  @override
  String get mediaViewerZoomIn => 'ज़ूम इन करें';

  @override
  String get mediaViewerZoomOut => 'छोटा करें';

  @override
  String get mediaViewerPreviousAttachment => 'पिछला अटैचमेंट';

  @override
  String get mediaViewerNextAttachment => 'अगला अटैचमेंट';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'अटैचमेंट $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'खारिज करें';

  @override
  String get chatAttachmentVideoToggleControls => 'वीडियो कंट्रोल टॉगल करें';

  @override
  String get chatAttachmentVideoMute => 'वीडियो म्यूट करें';

  @override
  String get chatAttachmentVideoUnmute => 'वीडियो म्यूट करें';

  @override
  String get chatAttachmentVideoPlay => 'वीडियो चलाएं';

  @override
  String get chatAttachmentVideoPause => 'वीडियो रोकें';

  @override
  String get chatAttachmentVideoProgress => 'वीडियो प्रगति';

  @override
  String get chatVideoPlaybackFailed => 'यह वीडियो नहीं चलाया जा सका।';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'इस भूमिका वाले उन यूज़र्स को नोटिफ़ाई करें जिनके पास इस चैनल को देखने की अनुमति है.';

  @override
  String get composerAutocompleteSuggestions => 'सुझाव';

  @override
  String get composerAutocompleteCommandsHeading => 'कमांड';

  @override
  String get composerAutocompleteChoicesHeading => 'विकल्प';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => 'वैकल्पिक तर्क';

  @override
  String get composerAutocompleteChannelsHeading => 'चैनल';

  @override
  String get composerAutocompleteMembersHeading => 'सदस्य';

  @override
  String get composerAutocompleteUsersHeading => 'यूज़र';

  @override
  String get composerAutocompleteMentionsHeading => 'मेंशन';

  @override
  String get composerAutocompleteRolesHeading => 'भूमिकाएँ';

  @override
  String get composerAutocompleteMediaHeading => 'मीडिया';

  @override
  String get composerAutocompleteStickersHeading => 'स्टिकर';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'कोई GIF नहीं मिला';

  @override
  String get composerCommandShrugDescription =>
      'आपके मैसेज में ¯\\_(ツ)_/¯ जोड़ता है।';

  @override
  String get composerCommandTableflipDescription =>
      'आपके मैसेज में (╯°□°)╯︵ ┻━┻ जोड़ता है।';

  @override
  String get composerCommandUnflipDescription =>
      'आपके मैसेज में ┬─┬ ノ( ゜-゜ノ) जोड़ता है।';

  @override
  String get composerCommandMeDescription =>
      'एक कार्रवाई संदेश भेजें (इटैलिक में रैप करता है).';

  @override
  String get composerCommandSpoilerDescription =>
      'स्पॉइलर मैसेज भेजें (स्पॉइलर टैग में रैप करता है).';

  @override
  String get composerCommandTtsDescription => 'टेक्स्ट-टू-स्पीच मैसेज भेजें।';

  @override
  String get composerCommandNickDescription =>
      'इस कम्युनिटी में अपना निकनेम बदलें।';

  @override
  String get composerCommandKickDescription =>
      'इस समुदाय से किसी सदस्य को हटाएँ।';

  @override
  String get composerCommandBanDescription =>
      'इस कम्युनिटी से किसी सदस्य को बैन करें।';

  @override
  String get composerCommandMsgDescription => 'किसी यूज़र को सीधा मैसेज भेजें।';

  @override
  String get composerCommandSavedDescription =>
      'सेव किया गया मीडिया आइटम भेजें।';

  @override
  String get composerCommandStickerDescription => 'स्टिकर भेजें।';

  @override
  String get composerCommandGifDescription => 'GIF ढूंढें और भेजें।';

  @override
  String get composerCommandMemberOption => 'सदस्य को लक्षित करें।';

  @override
  String get composerCommandReasonOption => 'कारण (वैकल्पिक)।';

  @override
  String get composerCommandMessageOption => 'संदेश भेजें।';

  @override
  String get composerCommandQueryOption => 'क्या खोजना है।';

  @override
  String get composerCommandNicknameOption =>
      'आपका नया उपनाम, या इसे रीसेट करने के लिए खाली छोड़ दें।';

  @override
  String get composerCommandDeleteMessagesOption =>
      'सदस्य के हालिया संदेश इतिहास का कितना हिस्सा हटाना है।';

  @override
  String get composerCommandDeleteMessagesNone => 'कोई भी डिलीट न करें';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'पिछले $count दिन';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'पिछले 24 घंटे';

  @override
  String get composerCommandOptionRequired =>
      'यह विकल्प आवश्यक है। कृपया एक मान प्रदान करें।';

  @override
  String get composerCommandClear => 'कमांड साफ़ करें';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'आपने इस समुदाय में अपना उपनाम **$previousNickname** से बदलकर **$newNickname** कर लिया है।';
  }

  @override
  String get composerCommandUnknownUser => 'अज्ञात यूज़र';

  @override
  String composerCommandMsgFailed(String username) {
    return '**$username** को संदेश भेजने में विफल। हो सकता है कि उन्होंने DM अक्षम कर दिए हों या आपको ब्लॉक कर दिया हो।';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count और';
  }

  @override
  String get addGuildModalTitle => 'कम्युनिटी जोड़ें';

  @override
  String get addGuildModalLandingDescription =>
      'एक नई कम्युनिटी बनाएँ या किसी मौजूदा कम्युनिटी से जुड़ें।';

  @override
  String get addGuildCreateCommunity => 'कम्युनिटी बनाएँ';

  @override
  String get addGuildJoinCommunity => 'कम्युनिटी में शामिल हों';

  @override
  String get addGuildImportDiscordTemplate => 'डिस्कॉर्ड टेम्प्लेट आयात करें';

  @override
  String get addGuildJoinTitle => 'कम्युनिटी में शामिल हों';

  @override
  String get addGuildJoinDescription =>
      'किसी समुदाय में शामिल होने के लिए आमंत्रण लिंक डालें।';

  @override
  String get addGuildInviteLinkLabel => 'आमंत्रण लिंक';

  @override
  String get addGuildJoinSubmit => 'कम्युनिटी में शामिल हों';

  @override
  String get addGuildInviteInvalid =>
      'यह आमंत्रण अमान्य है या समाप्त हो गया है।';

  @override
  String get addGuildJoinFailed =>
      'समुदाय में शामिल नहीं हो सके। कृपया पुनः प्रयास करें।';

  @override
  String get addGuildCreateTitle => 'कम्युनिटी बनाएं';

  @override
  String get addGuildCreateDescription =>
      'अपने और दोस्तों के चैट करने के लिए एक कम्युनिटी बनाएँ।';

  @override
  String get addGuildCreateNameLabel => 'कम्युनिटी का नाम';

  @override
  String get addGuildCreateSubmit => 'कम्युनिटी बनाएँ';

  @override
  String get addGuildCreateFailed =>
      'समुदाय नहीं बना सका। कृपया पुनः प्रयास करें।';

  @override
  String get addGuildCreateClaimTitle => 'अपना अकाउंट क्लेम करें';

  @override
  String get addGuildCreateClaimDescription =>
      'कम्युनिटी बनाने से पहले आपको अपना अकाउंट क्लेम करना होगा।';

  @override
  String get addGuildCreateVerifyTitle => 'अपना ईमेल वेरिफाई करें';

  @override
  String get addGuildCreateVerifyDescription =>
      'कम्युनिटी बनाने से पहले आपको अपना ईमेल पता वेरिफ़ाई करना होगा।';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'एक नया समुदाय बनाते समय एनिमेटेड आइकन समर्थित नहीं हैं। एक स्थिर छवि का उपयोग करें।';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'समुदाय बनाकर, आप इनका पालन करने और इन्हें बनाए रखने के लिए सहमत होते हैं';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName समुदाय दिशानिर्देश';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'यह इंस्टेंस एक ही समुदाय का है, इसलिए अतिरिक्त समुदाय नहीं बनाए जा सकते।';

  @override
  String get addGuildCreateChangeIcon => 'आइकॉन बदलें';

  @override
  String get addGuildCreateIconLabel => 'कम्युनिटी आइकॉन';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. अधिकतम 10MB. अनुशंसित: 512×512px';

  @override
  String get addGuildImportDescription =>
      'अपने नए समुदाय में संरचना आयात करने के लिए एक डिस्कॉर्ड टेम्प्लेट यूआरएल पेस्ट करें।';

  @override
  String get addGuildImportUrlLabel => 'टेम्पलेट यूआरएल';

  @override
  String get addGuildImportUrlInvalid =>
      'एक मान्य डिस्कॉर्ड टेम्पलेट यूआरएल या कोड दर्ज करें।';

  @override
  String get addGuildImportFetchFailed =>
      'समुदाय टेम्पलेट लाने में विफल। टेम्पलेट मौजूद नहीं हो सकता है या बाहरी सेवा अनुपलब्ध है।';

  @override
  String get addGuildImportInvalidResponse =>
      'यह एक मान्य टेम्प्लेट प्रतिक्रिया नहीं लगती है।';

  @override
  String get addGuildImportTemplateLabel => 'टेम्पलेट';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount टेक्स्ट, $voiceChannelCount वॉइस, $categoryCount कैटेगरी, $roleCount भूमिकाएँ';
  }

  @override
  String get addGuildImportRemoveIcon => 'आइकॉन हटाएँ';

  @override
  String get addGuildImportTemplateInvalid =>
      'समुदाय टेम्पलेट डेटा अमान्य या खराब है।';

  @override
  String get addGuildPackInstalled => 'पैक सफलतापूर्वक इंस्टॉल हो गया।';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'सभी रिएक्शन हटाएँ';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'क्या आप वाकई इस संदेश से सभी प्रतिक्रियाएँ हटाना चाहते हैं?';

  @override
  String get chatMessageUnpinConfirmTitle => 'मैसेज अनपिन करें';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'इस पिन को समय में वापस भेजें?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username ने $messageLink को इस चैनल पर पिन किया। $allPinsLink देखें।';
  }

  @override
  String get systemPinMessageMessageLink => 'एक संदेश';

  @override
  String get systemPinMessageAllPinsLink => 'सभी पिन किए गए संदेश';

  @override
  String get channelPinsEmptyTitle => 'कोई पिन किए गए मैसेज नहीं';

  @override
  String get channelPinsEmptyDescription => 'पिन किए गए मैसेज यहां दिखते हैं।';

  @override
  String get channelDetailsFallbackTitle => 'विवरण';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'ग्रुप डीएम · $count सदस्य';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return '$name के साथ अपनी बातचीत बंद करें?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return '$name को छोड़ें?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'चैनल सेटिंग्ज़';

  @override
  String get channelDetailsGroupSettingsTitle => 'समूह सेटिंग्स';

  @override
  String get channelDetailsDmSettingsTitle => 'DM सेटिंग्स';

  @override
  String get channelDetailsInvitePeople => 'लोगों को आमंत्रित करें';

  @override
  String get channelDetailsCopyLink => 'लिंक कॉपी करें';

  @override
  String get channelMenuCopyChannelLink => 'चैनल लिंक कॉपी करें';

  @override
  String get channelMenuCopyRedirectLink => 'रीडायरेक्ट लिंक कॉपी करें';

  @override
  String get channelDetailsAddFriendsToGroup => 'ग्रुप में दोस्त जोड़ें';

  @override
  String get channelDetailsGroupInvites => 'ग्रुप इनवाइट';

  @override
  String get channelDetailsEditChannel => 'चैनल एडिट करें';

  @override
  String get channelDetailsDeleteChannel => 'चैनल मिटाएँ';

  @override
  String get channelSettingsCategorySettingsTitle => 'श्रेणी सेटिंग्ज़';

  @override
  String get channelSettingsEditCategory => 'श्रेणी संपादित करें';

  @override
  String get channelSettingsTabOverview => 'अवलोकन';

  @override
  String get channelSettingsTabPermissions => 'अनुमतियाँ';

  @override
  String get channelSettingsTabInvites => 'आमंत्रण';

  @override
  String get channelSettingsTabWebhooks => 'वेबहुक';

  @override
  String get channelSettingsDeleteChannel => 'चैनल मिटाएँ';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'क्या आप निश्चित हैं कि आप $channelName को हटाना चाहते हैं? इसे वापस नहीं लाया जा सकता।';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'क्या आप पक्का $categoryName को हटाना चाहते हैं? इसे वापस नहीं लाया जा सकता।';
  }

  @override
  String get channelSettingsDeleteCategory => 'कैटेगरी मिटाएँ';

  @override
  String get channelSettingsChannelUpdated => 'चैनल अपडेट किया गया';

  @override
  String get channelSettingsChannelName => 'चैनल का नाम';

  @override
  String get channelSettingsCategoryName => 'श्रेणी का नाम';

  @override
  String get channelSettingsMyCategory => 'मेरी श्रेणी';

  @override
  String get categoryExpandCategory => 'श्रेणी विस्तृत करें';

  @override
  String get categoryCollapseCategory => 'श्रेणी को छोटा करें';

  @override
  String get categoryExpandAllCategories => 'सभी कैटगरी दिखाएं';

  @override
  String get categoryCollapseAllCategories => 'सभी कैटगरी को छोटा करें';

  @override
  String get categoryMuteCategory => 'श्रेणी म्यूट करें';

  @override
  String get categoryUnmuteCategory => 'श्रेणी को अनम्यूट करें';

  @override
  String get categoryCopyCategoryId => 'श्रेणी आईडी कॉपी करें';

  @override
  String get categoryIdCopied => 'श्रेणी आईडी कॉपी की गई';

  @override
  String get channelSettingsChannelNamePlaceholder => 'सामान्य';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'विषय';

  @override
  String get channelSettingsTopicPlaceholder => 'इस चैनल में कोई विषय जोड़ें';

  @override
  String get channelSettingsInsertEmoji => 'इमोजी डालें';

  @override
  String get channelSettingsTopicTooLongTitle => 'चैनल का विषय बहुत लंबा है।';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'विषय छोटा करें और फिर से कोशिश करें।';

  @override
  String get channelSettingsSlowmode => 'स्लोमोड';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'संदेशों के बीच प्रतीक्षा करें। \"$bypassSlowmodePermissionLabel\" इसे बायपास कर सकता है।';
  }

  @override
  String get channelSettingsSlowmodeOff => 'बंद';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds सेकंड';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes मिनट';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours घंटे';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute मिनट';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour घंटा';
  }

  @override
  String get channelSettingsVoiceQuality => 'आवाज़ की क्वालिटी';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'उच्च बिटरेट = बेहतर गुणवत्ता और अधिक बैंडविड्थ का उपयोग।';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits केबीपीएस';
  }

  @override
  String get channelSettingsParticipantLimit => 'सदस्य सीमा';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'एक बार में शामिल होने वाले सदस्यों की अधिकतम संख्या। 0 का मतलब असीमित है।';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count प्रतिभागी',
      one: '1 प्रतिभागी',
      zero: '∞ कोई सीमा नहीं',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'कनेक्शन सीमा';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'इस चैनल में एक सदस्य अधिकतम कितने सक्रिय कनेक्शन रख सकता है।';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count कनेक्शन',
      one: '1 कनेक्शन',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'वॉयस क्षेत्र';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'इस चैनल के लिए एक वॉयस रीजन चुनें। ऑटोमैटिक सबसे नज़दीकी रीजन का उपयोग करता है।';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'स्वचालित';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'वॉइस क्षेत्र लोड नहीं हो पाए';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'कुछ देर में फिर से कोशिश करें।';

  @override
  String get channelSettingsResetSlider =>
      'स्लाइडर को डिफ़ॉल्ट मान पर रीसेट करें';

  @override
  String get channelSettingsAdvanced => 'एडवांस';

  @override
  String get channelSettingsMatureContentOverride => 'परिपक्व सामग्री ओवरराइड';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'इस चैनल के लिए $scopeLevel-स्तरीय सेटिंग को ओवरराइड करें। परिपक्व सामग्री प्रवेश से पहले एक गेट के पीछे दिखाई जाती है।';
  }

  @override
  String get channelSettingsMatureContentInherit => 'इनहेरिट करें';

  @override
  String get channelSettingsMatureContentOn => 'चालू';

  @override
  String get channelSettingsMatureContentOff => 'बंद';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'इस चैनल को परिपक्व सामग्री के लिए चिह्नित करें।';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'इस चैनल को परिपक्व सामग्री के लिए अनियंत्रित छोड़ दें।';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return '$inheritedSourceLabel से लिया गया: चालू';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return '$inheritedSourceLabel से इनहेरिट किया गया: बंद';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'श्रेणी';

  @override
  String get channelSettingsMatureContentCommunitySource => 'समुदाय';

  @override
  String get channelSettingsMatureContentCategoryScope => 'श्रेणी';

  @override
  String get channelSettingsMatureContentCommunityScope => 'समुदाय';

  @override
  String get channelSettingsContentWarningToggle =>
      'इस चैनल में सामग्री चेतावनी दिखाएं';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'इस चैनल में प्रवेश करने से पहले एक सहमति प्रॉम्प्ट चालू करता है।';

  @override
  String get channelSettingsContentWarningText =>
      'पसंद के मुताबिक चेतावनी टेक्स्ट';

  @override
  String get channelSettingsContentWarningDefault =>
      'इसमें संवेदनशील सामग्री है।';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'इन अनुमतियों को एडिट करने के लिए आपको \"$manageChannelsPermissionLabel\" अनुमति चाहिए।';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'इन अनुमतियों को एडिट करने के लिए आपको \"$manageRolesPermissionLabel\" अनुमति चाहिए।';
  }

  @override
  String get channelSettingsUnknownRole => 'अज्ञात भूमिका';

  @override
  String get channelSettingsUnknownUser => 'अज्ञात यूज़र';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'एक्सेस ओवरराइड';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return '$name के लिए एक्सेस संपादित करें';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'ओवरराइड पर वापस जाएं';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'इस चैनल के लिए मूल एक्सेस कॉन्फ़िगर करें';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'इस भूमिका के लिए ओवरराइड कॉन्फ़िगर करें';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'इस सदस्य के लिए ओवरराइड कॉन्फ़िगर करें';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'अनुमतियां खोजें…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'चैनल ऐक्सेस अपडेट किया गया';

  @override
  String get channelSettingsPermissionsTitle => 'पहुँच नियंत्रण';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'यह चैनल पैरेंट कैटेगरी के साथ सिंक किया गया है';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'यह चैनल पैरेंट कैटेगरी के साथ सिंक नहीं है';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'कैटेगरी के साथ सिंक करें';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'चैनल पैरेंट कैटगरी से सिंक किया गया';

  @override
  String get channelSettingsPermissionsAddOverride => 'ओवरराइड जोड़ें';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'भूमिकाएं या सदस्य खोजें…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'भूमिकाएं और सदस्य';

  @override
  String get channelSettingsDeleteInvite => 'आमंत्रण मिटाएं';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'यह आमंत्रण मिटाएँ? इसे पूर्ववत नहीं किया जा सकता है।';

  @override
  String get channelSettingsCopyInviteCode => 'आमंत्रण कोड कॉपी करें';

  @override
  String get channelSettingsCopyInviteUrl => 'आमंत्रण यूआरएल कॉपी करें';

  @override
  String get channelSettingsWebhookCreated => 'वेबहुक बनाया गया';

  @override
  String get channelSettingsWebhookCreateFailed => 'वेबहुक नहीं बन पाया';

  @override
  String get channelSettingsCreateWebhook => 'वेबहुक बनाएं';

  @override
  String get channelSettingsInvitesDescription =>
      'इस चैनल के लिए आमंत्रण लिंक प्रबंधित करें।';

  @override
  String get channelSettingsInvitesCreate => 'आमंत्रण बनाएं';

  @override
  String get channelSettingsInvitesEmpty => 'कोई आमंत्रण लिंक नहीं';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'इस चैनल में अभी तक कोई आमंत्रण लिंक नहीं है। लोगों को इस चैनल में आमंत्रित करने के लिए एक बनाएं।';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'इस चैनल के लिए आमंत्रण लिंक लोड करने में कोई समस्या आ गई थी। फिर से कोशिश करें।';

  @override
  String get channelSettingsWebhooksDescription =>
      'आने वाले वेबहुक मैनेज करें जो इस चैनल में मैसेज पोस्ट कर सकते हैं।';

  @override
  String get channelSettingsWebhooksEmpty => 'कोई वेबहुक नहीं';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'इस चैनल के लिए कोई वेबहुक कॉन्फ़िगर नहीं किया गया है। बाहरी ऐप्लिकेशन को मैसेज पोस्ट करने की अनुमति देने के लिए एक वेबहुक बनाएँ।';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'यह चैनल वेबहुक को सपोर्ट नहीं करता है।';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'आपको इस चैनल के वेबहुक देखने और संपादित करने के लिए \"$permission\" अनुमति की आवश्यकता है।';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'वेबहुक लोड नहीं हो पाए';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'इस चैनल के लिए वेबहुक लोड करने में कोई समस्या आ गई थी। फिर से कोशिश करें।';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return '$creator द्वारा $date को बनाया गया';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'अज्ञात यूज़र';

  @override
  String get channelSettingsWebhooksAvatar => 'अवतार';

  @override
  String get channelSettingsWebhooksUploadImage => 'इमेज अपलोड करें';

  @override
  String get channelSettingsWebhooksRemove => 'हटाएँ';

  @override
  String get channelSettingsWebhooksName => 'नाम';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'वेबहुक का नाम';

  @override
  String get channelSettingsWebhooksChannel => 'चैनल';

  @override
  String get channelSettingsWebhooksUrl => 'वेबहुक यूआरएल';

  @override
  String get channelSettingsWebhooksCopyUrl => 'वेबहुक यूआरएल कॉपी करें';

  @override
  String get channelSettingsWebhooksDelete => 'वेबहुक मिटाएं';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'इस वेबहुक को हटाया नहीं जा सका';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'इस वेबहुक को हटा दें? इसे वापस नहीं लाया जा सकता।';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'कुछ देर में फिर से कोशिश करें।';

  @override
  String get channelMenuOpenChat => 'चैट खोलें';

  @override
  String get channelMenuDuplicateChannel => 'चैनल डुप्लीकेट करें';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'परिपक्व सामग्री सहमति स्थिति रीसेट करें';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'इस चैनल में अपने मैसेज मिटाएँ?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'इससे इस चैनल में आपके द्वारा भेजे गए सभी मैसेज हमेशा के लिए मिट जाएंगे. इसे पहले जैसा नहीं किया जा सकता है.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'मेरे संदेश हटाएं';

  @override
  String get channelMenuDeletedYourMessages => 'आपके संदेश हटा दिए गए';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'आपके मैसेज मिटाए नहीं जा सके';

  @override
  String get channelDetailsSystemMessage => 'सिस्टम संदेश';

  @override
  String get channelDetailsTextChannel => 'टेक्स्ट चैनल';

  @override
  String get channelDetailsVoiceChannel => 'वॉइस चैनल';

  @override
  String get channelDetailsCategory => 'श्रेणी';

  @override
  String get channelDetailsLinkChannel => 'चैनल लिंक करें';

  @override
  String get channelDetailsGenericChannel => 'चैनल';

  @override
  String get channelDetailsMutedConversation => 'बातचीत म्यूट की गई';

  @override
  String get channelDetailsUnmutedConversation => 'बातचीत अनम्यूट की गई';

  @override
  String get channelDetailsMutedChannel => 'चैनल म्यूट किया गया';

  @override
  String get channelDetailsUnmutedChannel => 'चैनल अनम्यूट किया गया';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'सूचना सेटिंग अपडेट की गईं';

  @override
  String get channelDetailsTabMembers => 'सदस्य';

  @override
  String get channelDetailsTabPins => 'पिन किए गए मैसेज';

  @override
  String get channelDetailsActionMute => 'म्यूट करें';

  @override
  String get channelDetailsActionUnmute => 'अनम्यूट करें';

  @override
  String get channelDetailsActionSearch => 'खोजें';

  @override
  String get channelDetailsActionMore => 'ज़्यादा';

  @override
  String get channelDetailsMembersEmptyTitle => 'कोई सदस्य नहीं';

  @override
  String get channelDetailsMembersEmptyBody =>
      'सदस्य यहाँ तब दिखाई देंगे जब समुदाय का डेटा लोड हो जाएगा।';

  @override
  String get memberListPermissionDeniedTitle => 'आप सदस्य नहीं देख सकते';

  @override
  String get memberListPermissionDeniedBody =>
      'आप इस कम्युनिटी में इस चैनल के सदस्यों को नहीं देख सकते';

  @override
  String get memberListUnavailableTitle => 'सदस्य सूची उपलब्ध नहीं है';

  @override
  String get memberListUnavailableBody =>
      'इस कम्युनिटी में सदस्यों की सूची अभी उपलब्ध नहीं है';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'पिन लोड नहीं हो सके';

  @override
  String get channelDetailsPinsGuildEndHint =>
      '\"Pin Messages\" अनुमति वाले सदस्य संदेशों को पिन कर सकते हैं ताकि सभी देख सकें।';

  @override
  String get channelDetailsPinsDmEndHint =>
      'आप इस बातचीत में संदेशों को पिन कर सकते हैं ताकि सभी देख सकें।';

  @override
  String get channelDetailsPinsEndReached => 'आप अंत तक पहुँच गए हैं';

  @override
  String get channelHeaderOpenDetails => 'चैनल विवरण खोलें';

  @override
  String get channelHeaderPinnedMessages => 'पिन किए गए मैसेज';

  @override
  String get channelHeaderPinnedMessagesUnread => 'अनदेखे पिन किए गए संदेश';

  @override
  String get channelHeaderMemberList => 'सदस्य सूची';

  @override
  String get channelHeaderInbox => 'इनबॉक्स';

  @override
  String get channelHeaderNotificationSettingsMuted => 'सूचना सेटिंग, म्यूट';

  @override
  String get channelDetailsSearchTitle => 'खोजें';

  @override
  String get channelDetailsSearchHint => 'संदेश खोजें';

  @override
  String get channelDetailsSearchFilterFrom => 'प्रेषक';

  @override
  String get channelDetailsSearchFilterHas => 'है';

  @override
  String get channelDetailsSearchFilterIn => 'इसमें';

  @override
  String get channelDetailsSearchFilterMentions => 'मेंशन';

  @override
  String get channelDetailsSearchFilterMore => 'ज़्यादा';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'सक्रिय';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count चैनल';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count उपयोगकर्ता';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'उपयोगकर्ता';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'बॉट';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'वेबहुक';

  @override
  String get channelDetailsSearchFilterByChannel =>
      'चैनल के अनुसार फ़िल्टर करें';

  @override
  String get channelDetailsSearchChannelsHint => 'चैनल खोजें';

  @override
  String get channelDetailsSearchChannelsEmpty => 'कोई चैनल नहीं मिला';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'पिन किया हुआ';

  @override
  String get channelDetailsSearchPinnedTrue => 'केवल पिन किए गए';

  @override
  String get channelDetailsSearchPinnedFalse => 'पिन किए गए को छोड़कर';

  @override
  String get channelDetailsSearchClearFilter => 'मिटाएँ';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'लेखक का प्रकार';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'तारीख';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'तारीख मोड';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'तारीख चुनें';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'लिंक होस्टनाम';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'फ़ाइल नाम में शामिल है';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'फ़ाइल एक्सटेंशन';

  @override
  String get channelDetailsSearchContentPoll => 'पोल';

  @override
  String get channelDetailsSearchContentPollDescription => 'पोल वाले संदेश';

  @override
  String get channelDetailsSearchContentForward => 'फ़ॉरवर्ड करें';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'फॉरवर्ड किए गए संदेश';

  @override
  String get channelDetailsSearchFilterSort => 'क्रमबद्ध करें';

  @override
  String get channelHeaderSearchFiltersTitle => 'खोज फ़िल्टर';

  @override
  String get channelHeaderSearchRecentTitle => 'हाल की खोजें';

  @override
  String get channelHeaderSearchUsersTitle => 'यूज़र';

  @override
  String get channelHeaderSearchChannelsTitle => 'चैनल';

  @override
  String get channelHeaderSearchValuesTitle => 'वैल्यू';

  @override
  String get channelHeaderSearchDatesTitle => 'तारीखें';

  @override
  String get channelHeaderSearchDefaultBadge => 'डिफ़ॉल्ट';

  @override
  String get channelHeaderSearchClearHistory => 'मिटाएँ';

  @override
  String get channelHeaderSearchFilterDescFrom => 'कोई उपयोगकर्ता';

  @override
  String get channelHeaderSearchFilterDescMentions => 'कोई उपयोगकर्ता';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'लिंक, एम्बेड, इमेज, वीडियो, साउंड, फ़ाइल, स्टिकर, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'कोई तारीख या तारीख की सीमा';

  @override
  String get channelHeaderSearchFilterDescOn => 'कोई तारीख या तारीख की सीमा';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'कोई तारीख या तारीख की सीमा';

  @override
  String get channelHeaderSearchFilterDescAfter => 'कोई तारीख या तारीख की सीमा';

  @override
  String get channelHeaderSearchFilterDescIn => 'एक चैनल';

  @override
  String get channelHeaderSearchFilterDescPinned => 'सही या गलत';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'उपयोगकर्ता, बॉट या वेबहुक';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'एक होस्टनाम, जैसे example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'अटैचमेंट फ़ाइल नाम का हिस्सा';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'एक फ़ाइल एक्सटेंशन, जैसे png';

  @override
  String get channelHeaderSearchFilterDescSort => 'टाइमस्टैंप या प्रासंगिकता';

  @override
  String get channelHeaderSearchFilterDescOrder => 'आरोही या अवरोही';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString परिणाम',
      one: '1 परिणाम',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser =>
      'उपयोगकर्ता के अनुसार फ़िल्टर करें';

  @override
  String get channelDetailsSearchFilterByContent =>
      'कंटेंट के हिसाब से फ़िल्टर करें';

  @override
  String get channelDetailsSearchSortBy =>
      'परिणामों को इनके अनुसार क्रमबद्ध करें';

  @override
  String get channelDetailsSearchIn => 'इसमें खोजें';

  @override
  String get channelDetailsSearchEmptyTitle => 'इस बातचीत में खोजें';

  @override
  String get channelDetailsSearchEmptyBody =>
      'संदेश खोजने के लिए टेक्स्ट, लेखक या सामग्री फ़िल्टर दर्ज करें।';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'संदेश इंडेक्स किए जा रहे हैं';

  @override
  String get channelDetailsSearchIndexingBody =>
      'इस दायरे की खोज पूरी होने के बाद थोड़ी देर में फिर से प्रयास करें।';

  @override
  String get channelDetailsSearchNoResultsTitle => 'कोई रिज़ल्ट नहीं';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'अलग-अलग खोज शब्द या फ़िल्टर आज़माएँ।';

  @override
  String get channelDetailsMembersOnline => 'ऑनलाइन';

  @override
  String get channelDetailsMembersOffline => 'ऑफ़लाइन';

  @override
  String get channelDetailsMemberYou => 'आप';

  @override
  String get channelDetailsSearchUsersHint => 'उपयोगकर्ताओं को खोजें';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'सदस्यों को खोजने के लिए टाइप करें';

  @override
  String get channelDetailsSearchUsersEmpty => 'कोई यूज़र नहीं मिला';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'कोई उपयोगकर्ता उपलब्ध नहीं है';

  @override
  String get channelDetailsDone => 'हो गया';

  @override
  String get channelDetailsHasFilterPrompt =>
      'इन संदेशों को दिखाएं जिनमें ये शामिल हैं:';

  @override
  String get channelDetailsRetry => 'पुनः प्रयास करें';

  @override
  String get channelDetailsPinnedMessageTitle => 'पिंड किया गया संदेश';

  @override
  String get channelDetailsSearchResultTitle => 'खोज परिणाम';

  @override
  String get channelDetailsJumpToMessage => 'संदेश पर जाएं';

  @override
  String get channelDetailsUnpinMessage => 'संदेश को अनपिन करें';

  @override
  String get channelDetailsCopyMessageLink => 'संदेश लिंक कॉपी करें';

  @override
  String get channelDetailsCopyMessageId => 'संदेश आईडी कॉपी करें';

  @override
  String get channelDetailsMessageUnpinned => 'मैसेज अनपिन किया गया';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'वर्तमान समुदाय';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'मौजूदा DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'सभी समुदाय';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'सभी डीएम केवल';

  @override
  String get channelDetailsSearchScopeAllDms => 'सभी DM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'सिर्फ़ खुले DM';

  @override
  String get channelDetailsSearchScopeOpenDms => 'ओपन DM';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'सभी डीएम + समुदाय';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'खुले DM + समुदाय';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'सिर्फ़ इसी कम्युनिटी में खोजें';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'सिर्फ़ इस DM में खोजें';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'आपके द्वारा वर्तमान में शामिल की गई सभी कम्युनिटीज़ में';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'सिर्फ़ उन सभी DM में जिनमें आप कभी रहे हैं';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'आपकी सभी DM चैट में';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'आपके द्वारा खोले गए सभी डीएम में';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'आपके द्वारा खोले गए सभी डीएम में';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'आपके द्वारा की गई सभी DMs + आपके द्वारा वर्तमान में शामिल सभी समुदायों में';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'आपके सभी खुले हुए DMs + आपके द्वारा वर्तमान में शामिल सभी समुदायों में';

  @override
  String get channelDetailsSearchSortNewest => 'सबसे नए पहले';

  @override
  String get channelDetailsSearchSortOldest => 'सबसे पुराने पहले';

  @override
  String get channelDetailsSearchSortRelevance => 'सबसे प्रासंगिक';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'सबसे नए मैसेज पहले दिखाएं';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'सबसे पुराने मैसेज पहले दिखाएं';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'सबसे पहले सबसे ज़्यादा प्रासंगिक मैसेज दिखाएं';

  @override
  String get channelDetailsSearchContentImage => 'छवि अपलोड';

  @override
  String get channelDetailsSearchContentVideo => 'वीडियो अपलोड';

  @override
  String get channelDetailsSearchContentAudio => 'ऑडियो अपलोड';

  @override
  String get channelDetailsSearchContentFile => 'फ़ाइल अपलोड';

  @override
  String get channelDetailsSearchContentLink => 'लिंक';

  @override
  String get channelDetailsSearchContentEmbed => 'लिंक प्रीव्यू या एम्बेड';

  @override
  String get channelDetailsSearchContentSticker => 'स्टिकर';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'सिर्फ़ अपलोड की गई इमेज फ़ाइलें';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'केवल अपलोड की गई वीडियो फ़ाइलें';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'सिर्फ़ अपलोड की गई ऑडियो फ़ाइलें';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'कोई भी अपलोड किया गया अटैचमेंट';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'मैसेज टेक्स्ट में टाइप किया गया यूआरएल';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'सुलझाए गए प्रीव्यू और रिच एम्बेड, अपलोड नहीं';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'मैसेज के साथ स्टिकर अटैच किया गया';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count प्रकार';
  }

  @override
  String get personalNotesTitle => 'निजी नोट्स';

  @override
  String get personalNotesSubtitle =>
      'अपने विचारों और रिमाइंडर के लिए आपकी निजी जगह';

  @override
  String groupDmWelcome(String displayName) {
    return '$displayName में आपका स्वागत है। ग्रुप शुरू करने के लिए दोस्तों को जोड़ें।';
  }

  @override
  String get groupDmWelcomeEditGroup => 'ग्रुप एडिट करें';

  @override
  String get groupDmWelcomeAddFriends => 'ग्रुप में दोस्त जोड़ें';

  @override
  String get dmGroupInvites => 'आमंत्रण';

  @override
  String get groupDmEditTitle => 'ग्रुप एडिट करें';

  @override
  String get groupDmEditDetailsTooltip => 'ग्रुप की जानकारी बदलें';

  @override
  String get groupDmGroupName => 'ग्रुप का नाम';

  @override
  String get groupDmMyGroup => 'मेरा ग्रुप';

  @override
  String get groupDmGroupNameMaxLength =>
      'समूह का नाम 100 वर्णों से अधिक नहीं होना चाहिए';

  @override
  String get groupDmGroupIcon => 'ग्रुप आइकॉन';

  @override
  String get groupDmUploadIcon => 'आइकॉन अपलोड करें';

  @override
  String get groupDmChangeIcon => 'आइकॉन बदलें';

  @override
  String get groupDmRemoveIcon => 'आइकॉन हटाएँ';

  @override
  String get groupDmUpdated => 'ग्रुप अपडेट किया गया';

  @override
  String get groupDmUpdateFailed =>
      'समूह को अपडेट नहीं किया जा सका। पुनः प्रयास करें।';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'एनिमेटेड आइकन समर्थित नहीं हैं। एक स्थिर छवि का उपयोग करें।';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'एनिमेटेड आइकॉन समर्थित नहीं हैं';

  @override
  String get groupDmIconFileTooLargeTitle => 'आइकॉन फ़ाइल बहुत बड़ी है';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'आइकन फ़ाइल बहुत बड़ी है। $maxSize से छोटी फ़ाइल चुनें।';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'आइकॉन फ़ॉर्मैट काम नहीं करता';

  @override
  String get groupDmUnsupportedIconFormatBody => 'असमर्थित फ़ाइल प्रकार।';

  @override
  String get groupDmCouldntProcessImage => 'इमेज प्रोसेस नहीं की जा सकी';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'काटी गई इमेज को प्रोसेस नहीं किया जा सका. फिर से कोशिश करें.';

  @override
  String get groupDmInvalidImage => 'अमान्य इमेज';

  @override
  String get groupDmInvalidImageBody =>
      'यह इमेज अमान्य है. कोई दूसरी इमेज आज़माएँ.';

  @override
  String get groupDmAddFriends => 'जोड़ें';

  @override
  String get groupDmOrSendInvite => 'या किसी दोस्त को न्योता भेजें:';

  @override
  String get groupDmGenerateInviteLink => 'आमंत्रण लिंक जनरेट करें';

  @override
  String get groupDmCreateInvite => 'बनाएं';

  @override
  String get groupDmInviteExpires24Hours =>
      'आपका आमंत्रण 24 घंटों में समाप्त हो जाएगा';

  @override
  String get groupDmAddFriendFailed =>
      'इस दोस्त को ग्रुप में नहीं जोड़ा जा सका। कृपया फिर से कोशिश करें।';

  @override
  String get groupDmAddFailed => 'ग्रुप में जोड़ा नहीं जा सका';

  @override
  String get groupDmGroupFull =>
      'यह ग्रुप भरा हुआ है। और लोगों को जोड़ने से पहले किसी को हटाएँ।';

  @override
  String get groupDmRateLimited =>
      'आप बहुत तेज़ी से आगे बढ़ रहे हैं। कुछ देर इंतज़ार करें और फिर से कोशिश करें।';

  @override
  String get groupDmCreateInviteFailed => 'आमंत्रण लिंक नहीं बनाया जा सका';

  @override
  String get groupDmCreateInviteFailedBody =>
      'आमंत्रण लिंक जनरेट नहीं किया जा सका। कृपया फिर से कोशिश करें।';

  @override
  String get guildNavbarCreateInviteFailed =>
      'आमंत्रण लिंक नहीं बना सका। कृपया पुनः प्रयास करें।';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'इस चैनल में आमंत्रण बनाने की आपकी अनुमति नहीं है।';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'यह समुदाय अपनी आमंत्रण सीमा तक पहुँच गया है।';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'इस समुदाय के लिए आमंत्रण बनाना अस्थायी रूप से अक्षम कर दिया गया है।';

  @override
  String get groupDmCopyInviteFailed => 'आमंत्रण लिंक कॉपी नहीं हो पाया';

  @override
  String get groupDmInvitesOwnerOnly =>
      'केवल ग्रुप का मालिक ही इनवाइट मैनेज कर सकता है।';

  @override
  String get groupDmNoInvitesCreated => 'कोई आमंत्रण नहीं बनाया गया';

  @override
  String get groupDmLoadingInvites => 'आमंत्रण लोड हो रहे हैं...';

  @override
  String get groupDmInvitesLoadFailed =>
      'आमंत्रण लोड नहीं हो पाए. फिर से कोशिश करें.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'यह आमंत्रण रद्द करें? इसे पूर्ववत नहीं किया जा सकता।';

  @override
  String get groupDmInviteRevoked => 'आमंत्रण रद्द किया गया';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return '$name द्वारा बनाया गया। $time में समाप्त हो रहा है।';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return '$channelName में आपका स्वागत है';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'शुरुआत में, कुछ भी नहीं था। फिर, आया $channelName। और यह अच्छा था।';
  }

  @override
  String get personalNotesComposerHint => 'खुद को संदेश भेजें';

  @override
  String channelComposerHint(String channelName) {
    return 'संदेश #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return '@$recipientName को संदेश भेजें';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'संदेश $groupName';
  }

  @override
  String get groupDmComposerHint => 'मैसेज ग्रुप';

  @override
  String get composerHint => 'मैसेज करें';

  @override
  String get composerOpenExpressionPicker => 'इमोजी और मीडिया पिकर खोलें';

  @override
  String get composerShowKeyboard => 'कीबोर्ड दिखाएँ';

  @override
  String get composerCloseAttachmentPanel => 'अटैचमेंट पिकर बंद करें';

  @override
  String get chatAttachmentPanelPhotos => 'फ़ोटो';

  @override
  String get chatAttachmentPanelFiles => 'फ़ाइलें';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'फोटो लाइब्रेरी एक्सेस की आवश्यकता है';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'हाल की फ़ोटो और वीडियो देखने और अटैच करने के लिए फ़ोटो लाइब्रेरी एक्सेस की अनुमति दें।';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'सेटिंग खोलें';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', भेज रहा है';

  @override
  String get messageAccessibilityFailedSuffix => ', भेजने में विफल';

  @override
  String get messageAccessibilityAttachmentSummary => 'एक अटैचमेंट';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count अटैचमेंट';
  }

  @override
  String get messageAccessibilityImageSummary => 'एक छवि';

  @override
  String get messageAccessibilityVideoSummary => 'एक वीडियो';

  @override
  String get messageAccessibilityAudioSummary => 'एक ऑडियो फ़ाइल';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'स्टिकर $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'फ़ाइल $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'एक स्पॉइलर अटैचमेंट';

  @override
  String get messageAccessibilityEmbedSummary => 'एक एम्बेड';

  @override
  String get messageAccessibilityEmptySummary => 'एक संदेश';

  @override
  String get personalNotesPrivateSpace => 'आपकी निजी जगह';

  @override
  String get purgePersonalNotes => 'निजी नोट्स मिटाएं';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'यह आपके व्यक्तिगत नोट्स में हर संदेश और अटैचमेंट को स्थायी रूप से हटा देगा। इसे वापस नहीं लाया जा सकता।';

  @override
  String get purgePersonalNotesConfirmButton => 'हटाएँ';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'व्यक्तिगत नोट्स से $count संदेश हटा दिए गए';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'निजी नोट्स पहले से ही खाली थे';

  @override
  String get purgePersonalNotesFailed => 'व्यक्तिगत नोट्स साफ़ नहीं किए जा सके';

  @override
  String get userSettingsGroupYourAccount => 'आपका खाता';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'सेटिंग्स खोजें...';

  @override
  String get userSettingsSearchFieldLabel => 'सेटिंग खोजें';

  @override
  String get userSettingsSearchClear => 'खोज साफ़ करें';

  @override
  String get userSettingsSearchNoResults => 'कोई सेटिंग नहीं मिली';

  @override
  String get userSettingsNavProfile => 'प्रोफ़ाइल';

  @override
  String get userSettingsNavSecurityLogin => 'सुरक्षा और लॉगिन';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'गिफ़्ट';

  @override
  String get giftSettingsClaimAccountTitle => 'अपना अकाउंट क्लेम करें';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Plutonium उपहार कोड को रिडीम करने या प्रबंधित करने के लिए अपना खाता क्लेम करें।';

  @override
  String get giftSettingsRedeemTitle => 'गिफ़्ट रिडीम करें';

  @override
  String get giftSettingsRedeemDescription =>
      'अपने खाते के लिए Plutonium रिडीम करने के लिए एक उपहार कोड दर्ज करें।';

  @override
  String get giftSettingsRedeemPlaceholder => 'गिफ्ट कोड डालें…';

  @override
  String get giftSettingsRedeemButton => 'रिडीम करें';

  @override
  String get giftSettingsRedeemSuccess =>
      'उपहार सफलतापूर्वक रिडीम हो गया. अपने Plutonium का आनंद लें.';

  @override
  String get giftSettingsPurchasedTitle => 'खरीदे गए उपहार';

  @override
  String get giftSettingsPurchasedDescription =>
      'अपने खरीदे गए Plutonium उपहार कोड प्रबंधित करें। उपहार URL किसी खास व्यक्ति के साथ साझा करें या इसे अपने लिए रिडीम करें!';

  @override
  String get giftSettingsEmptyTitle => 'अभी तक कोई उपहार नहीं';

  @override
  String get giftSettingsEmptyDescription =>
      'दोस्तों के साथ साझा करने के लिए Plutonium टैब से Plutonium उपहार खरीदें।';

  @override
  String get giftSettingsGoToPlutonium => 'Plutonium पर जाएँ';

  @override
  String get giftSettingsLoadFailedTitle => 'गिफ्ट इन्वेंट्री लोड नहीं हो पाई';

  @override
  String get giftSettingsLoadFailedDescription => 'बाद में फिर से कोशिश करें।';

  @override
  String get giftSettingsTryAgain => 'फिर से कोशिश करें';

  @override
  String get giftSettingsGiftUrl => 'गिफ़्ट यूआरएल';

  @override
  String get giftSettingsCopy => 'कॉपी करें';

  @override
  String get giftSettingsCopied => 'कॉपी किया गया';

  @override
  String get giftSettingsGiftUrlCopied =>
      'गिफ्ट यूआरएल क्लिपबोर्ड पर कॉपी हो गया!';

  @override
  String get giftSettingsGiftUrlCopyFailed =>
      'उपहार यूआरएल कॉपी नहीं किया जा सका';

  @override
  String giftSettingsPurchasedDate(String date) {
    return '$date को खरीदा गया';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return '$date को रिडीम किया गया';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return '$name द्वारा रिडीम किया गया';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'यह उपहार रिडीम हो चुका है';

  @override
  String get giftSettingsRedeemForYourself => 'अपने लिए रिडीम करें';

  @override
  String get giftSettingsShareWithFriend => 'किसी दोस्त के साथ शेयर करें';

  @override
  String get premiumPlutoniumTagline =>
      'एक स्वतंत्र संचार प्लेटफ़ॉर्म का समर्थन करते हुए उच्च सीमाएं और विशेष सुविधाएं अनलॉक करें।';

  @override
  String get premiumPurchaseMode => 'खरीदने का तरीका';

  @override
  String get premiumForMe => 'मेरे लिए';

  @override
  String get premiumAsAGift => 'उपहार के तौर पर';

  @override
  String get premiumMonthly => 'मासिक';

  @override
  String get premiumYearly => 'सालाना';

  @override
  String get premiumPerMonth => '/माह';

  @override
  String get premiumPerYear => 'प्रति वर्ष';

  @override
  String get premiumOneTimePurchase => 'एक बार की खरीदारी';

  @override
  String get premiumSave17 => '17% बचाएं';

  @override
  String get premiumUpgradeNow => 'अभी अपग्रेड करें';

  @override
  String get premiumBuyGift => 'उपहार खरीदें';

  @override
  String get premiumOneYearGift => '1 साल का उपहार';

  @override
  String get premiumOneMonthGift => '1 महीने का उपहार';

  @override
  String get premiumMostPopular => 'सबसे लोकप्रिय';

  @override
  String get premiumScrollPrompt =>
      'Plutonium के साथ शामिल सभी सुविधाओं को देखने के लिए नीचे स्क्रॉल करें';

  @override
  String get premiumFreeVsPlutonium => 'मुफ़्त बनाम Plutonium';

  @override
  String get premiumFreeColumn => 'मुफ़्त';

  @override
  String get premiumGiftSectionTitle => 'Plutonium उपहार में दें';

  @override
  String get premiumGiftSectionDescription =>
      'अपने दोस्तों के साथ उपहार सदस्यता खरीदकर Plutonium का अनुभव साझा करें।';

  @override
  String get premiumGiftBannerOne =>
      'आपके लिए एक नया उपहार कोड इंतज़ार कर रहा है!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'आपके लिए $count नए उपहार कोड इंतज़ार कर रहे हैं!';
  }

  @override
  String get premiumViewGifts => 'उपहार देखें';

  @override
  String get premiumReadyToUpgrade => 'अपग्रेड करने के लिए तैयार हैं?';

  @override
  String get premiumReadyToBuyGift => 'गिफ़्ट खरीदने के लिए तैयार हैं?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'मासिक $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'सालाना $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 वर्ष $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 महीना $price';
  }

  @override
  String get premiumManageSubscription => 'सदस्यता प्रबंधित करें';

  @override
  String get premiumRedeemGiftCode => 'गिफ्ट कोड रिडीम करें';

  @override
  String get premiumGiftBadge => 'गिफ़्ट';

  @override
  String get premiumCancelSubscriptionTitle => 'सदस्यता रद्द करें?';

  @override
  String get premiumCancelSubscriptionBody =>
      'आपको अपनी अगली नवीनीकरण तिथि तक अपने लाभ मिलते रहेंगे, फिर आपके पास फिर से सदस्यता लेने और अपनी ग्राहक हिस्ट्री बनाए रखने के लिए 3 दिन की मोहलत होगी।';

  @override
  String get premiumCancelSubscriptionConfirm => 'सदस्यता रद्द करें';

  @override
  String get premiumKeepSubscription => 'सदस्यता रखें';

  @override
  String get premiumPurchaseHistoryTitle => 'खरीद इतिहास';

  @override
  String get premiumPurchaseHistoryDescription =>
      'आपकी हाल की इनवॉइस। अपने सब्सक्रिप्शन के लिए भुगतान विधि बदलने के लिए, बिलिंग पोर्टल में एक जोड़ें या चुनें और उसे डिफ़ॉल्ट बनाएं।';

  @override
  String get premiumManagePaymentMethods => 'भुगतान के तरीके प्रबंधित करें';

  @override
  String get premiumBillingHistory => 'बिलिंग इतिहास';

  @override
  String get premiumSelfServeRefundTitle => 'सेल्फ-सर्विस रिफंड';

  @override
  String get premiumSelfServeRefundButton => 'पिछली खरीदारी का रिफ़ंड';

  @override
  String get premiumDisclaimerAgreementPrefix => 'खरीदकर, आप हमारी';

  @override
  String get premiumDisclaimerAgreementPastPrefix => 'खरीदकर, आपने हमारी';

  @override
  String get premiumDisclaimerAgreementMiddle => 'और';

  @override
  String premiumActiveUntil(String date) {
    return '$date तक सक्रिय';
  }

  @override
  String get premiumSubscriptionCanceling => 'रद्द किया जा रहा है';

  @override
  String premiumCancelsOn(String date) {
    return '$date को रद्द हो जाएगा। तब तक लाभ सक्रिय रहेंगे।';
  }

  @override
  String get premiumReactivateSubscription => 'फिर से सक्रिय करें';

  @override
  String premiumGiftedUntil(String date) {
    return '$date तक उपहार में दिया गया। यह स्वतः नवीनीकृत नहीं होता है।';
  }

  @override
  String get premiumComparisonFeatureColumn => 'सुविधा';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'खरीदकर, आप हमारे $terms और $privacy से सहमत हुए।';
  }

  @override
  String get premiumDisclaimerRefund =>
      'भुगतान के 3 दिनों के भीतर, हर 30 दिनों में एक बार, सेल्फ़-सर्व रिफंड उपलब्ध है। सदस्यता वापस करने से वह रद्द हो जाती है। EU/EEA खरीदार तुरंत सामग्री एक्सेस करने के लिए चेकआउट पर 14-दिन के निकासी के अधिकार को छोड़ देते हैं। चार्जबैक के बजाय इन-ऐप रिफंड बटन का उपयोग करें। चार्जबैक आपके खाते को स्थायी रूप से प्रतिबंधित कर सकते हैं। Stripe भुगतान को सुरक्षित रूप से संभालता है। हम आपका पूरा कार्ड नंबर कभी नहीं देखते हैं।';

  @override
  String get premiumTermsOfService => 'सेवा की शर्तें';

  @override
  String get premiumPrivacyPolicy => 'निजता नीति';

  @override
  String get premiumCheckoutStartFailedTitle => 'चेकआउट शुरू नहीं कर पाए';

  @override
  String get premiumCheckoutStartFailedBody =>
      'चेकआउट शुरू करते समय कुछ गड़बड़ हो गई। कृपया कुछ देर में फिर से कोशिश करें।';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'आप अभी गिफ़्ट सदस्यता पर हैं। यह अपने-आप रिन्यू नहीं होगी। आप इसे बढ़ाने के लिए और गिफ़्ट कोड रिडीम कर सकते हैं। गिफ़्ट की अवधि खत्म होने के बाद आप रिकरिंग सदस्यता शुरू कर सकते हैं।';

  @override
  String get premiumPlanUnavailable =>
      'यह प्लान उपलब्ध नहीं है। सहायता से संपर्क करें।';

  @override
  String get premiumCompletePaymentTitle => 'भुगतान पूरा करें';

  @override
  String get premiumCompletePaymentBody =>
      'आप भुगतान पूरा करने के लिए अब स्ट्राइप पर जा रहे हैं। इसे पूरा करने के बाद Fluxer पर वापस आएं।';

  @override
  String get premiumChoosePaymentMethodTitle => 'भुगतान का तरीका चुनें';

  @override
  String get premiumPixPaymentPromptDescription =>
      'अपने ब्राज़ीलियाई बैंक से सीधे आवर्ती शुल्क को अधिकृत करने के लिए Pix ऑटोमैटिको से भुगतान करें। या अगले स्क्रीन पर स्ट्राइप पर क्रेडिट कार्ड दर्ज करने के लिए कार्ड का उपयोग करें।';

  @override
  String get premiumUsePix => 'Pix का उपयोग करें';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'UPI से भुगतान करके अपने भारतीय बैंक से RBI-अनुपालक ई-मैंडेट सेट करें। या स्ट्राइप की अगली स्क्रीन पर क्रेडिट कार्ड डालने के लिए कार्ड का उपयोग करें।';

  @override
  String get premiumUseUpi => 'UPI का उपयोग करें';

  @override
  String get premiumUseCard => 'कार्ड का उपयोग करें';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'बिलिंग पोर्टल नहीं खुल सका';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'बिलिंग पोर्टल खोलते समय कुछ गड़बड़ हो गई। कृपया कुछ देर में फिर से कोशिश करें।';

  @override
  String get premiumAlreadyVisionaryTitle => 'आप पहले से ही विजनरी हैं';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary में पहले से ही परमानेंट ऐक्सेस शामिल है, इसलिए बार-बार सदस्यता लेने की ज़रूरत नहीं है. आप अभी भी दूसरों के लिए गिफ़्ट खरीद सकते हैं.';

  @override
  String get premiumExistingSubscriptionTitle => 'सदस्यता पहले से मौजूद है';

  @override
  String get premiumExistingSubscriptionBody =>
      'हमें इस खाते के लिए एक मौजूदा Fluxer Plutonium सदस्यता मिली है। भुगतान विवरण अपडेट करने या नवीनीकरण की स्थिति जांचने के लिए इसे सुरक्षित बिलिंग पोर्टल में प्रबंधित करें। यदि आपने अभी भुगतान किया है, तो एक मिनट प्रतीक्षा करें और इस पृष्ठ को पुनः खोलें।';

  @override
  String get premiumPurchasesDisabledTitle => 'खरीदारी उपलब्ध नहीं है';

  @override
  String get premiumPurchasesDisabledBody =>
      'इस खाते के लिए खरीदारी अक्षम कर दी गई है। यदि यह गलत लगता है तो support@fluxer.app पर संपर्क करें।';

  @override
  String get premiumClaimAccountToPurchase =>
      'Fluxer Plutonium खरीदने के लिए अपना खाता क्लेम करें।';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Fluxer Plutonium खरीदने से पहले आपको अपना ईमेल वेरिफाई करना होगा।';

  @override
  String get premiumPerkCustomUsernameTag => 'कस्टम यूज़रनेम टैग';

  @override
  String get premiumPerkPerCommunityProfiles => 'हर कम्युनिटी के लिए प्रोफ़ाइल';

  @override
  String get premiumPerkMessageScheduling => 'संदेश शेड्यूलिंग';

  @override
  String get premiumPerkProfileBadge => 'प्रोफ़ाइल बैज';

  @override
  String get premiumPerkCustomVideoBackgrounds =>
      'पसंद के मुताबिक वीडियो बैकग्राउंड';

  @override
  String get premiumPerkEntranceSounds => 'एंट्रेंस साउंड';

  @override
  String get premiumPerkCommunities => 'समुदाय';

  @override
  String get premiumPerkMessageCharacterLimit => 'मैसेज वर्ण सीमा';

  @override
  String get premiumPerkBookmarkedMessages => 'बुकमार्क किए गए मैसेज';

  @override
  String get premiumPerkFileUploadSize => 'फ़ाइल अपलोड का साइज़';

  @override
  String get premiumPerkEmojiStickerPacks => 'इमोजी और स्टिकर पैक';

  @override
  String get premiumPerkSavedMedia => 'सेव की गई मीडिया';

  @override
  String get premiumPerkUseAnimatedEmojis => 'एनिमेटेड इमोजी इस्तेमाल करें';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'ग्लोबल इमोजी और स्टिकर एक्सेस';

  @override
  String get premiumPerkVideoQuality => 'वीडियो क्वालिटी';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'एनिमेटेड अवतार और प्रोफ़ाइल बैनर';

  @override
  String get premiumPerkEarlyAccess => 'नई सुविधाओं का अर्ली एक्सेस';

  @override
  String get premiumPerkCustomThemes => 'पसंद के थीम';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => '4K/60fps तक';

  @override
  String get userSettingsNavPrivacyDashboard => 'निजता डैशबोर्ड';

  @override
  String get userSettingsNavAuthorizedApps => 'अधिकृत ऐप्स';

  @override
  String get userSettingsNavBlockedUsers => 'ब्लॉक किए गए उपयोगकर्ता';

  @override
  String get userSettingsNavLinkedDevices => 'लिंक्ड डिवाइस';

  @override
  String get userSettingsNavConnections => 'कनेक्शन';

  @override
  String get userSettingsNavLookAndFeel => 'रूप और अनुभव';

  @override
  String get userSettingsNavAccessibility => 'अक्सेसिबिलिटी';

  @override
  String get userSettingsNavChat => 'चैट';

  @override
  String get userSettingsNavAudioAndVideo => 'ऑडियो और वीडियो';

  @override
  String get userSettingsNavShortcuts => 'शॉर्टकट';

  @override
  String get audioAndVideoAudioSectionTitle => 'ऑडियो';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'अपने माइक्रोफ़ोन, स्पीकर और वॉयस प्रोसेसिंग को कॉन्फ़िगर करें।';

  @override
  String get audioAndVideoVideoSectionTitle => 'वीडियो';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'अपने कैमरे और स्क्रीन शेयरिंग की क्वालिटी सेट करें।';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'कॉल के दौरान का व्यवहार';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'कॉल के दौरान पुष्टि प्रॉम्प्ट को नियंत्रित करें।';

  @override
  String get audioAndVideoInputDeviceLabel => 'इनपुट डिवाइस';

  @override
  String get audioAndVideoOutputDeviceLabel => 'आउटपुट डिवाइस';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'डिफ़ॉल्ट';

  @override
  String get audioAndVideoUseSpeakerLabel => 'स्पीकर का उपयोग करें';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'जब बंद हो, तो ऑडियो ईयरपीस या कनेक्टेड हेडफ़ोन के माध्यम से चलेगा।';

  @override
  String get audioAndVideoInputVolumeLabel => 'इनपुट वॉल्यूम';

  @override
  String get audioAndVideoOutputVolumeLabel => 'आउटपुट वॉल्यूम';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'आवाज़ प्रोसेसिंग';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'फ़ोकस की गई आवाज़';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'अनुशंसित. स्पष्ट बातचीत के लिए आपके माइक को साफ़ करता है.';

  @override
  String get audioAndVideoDirectInputLabel => 'सीधा इनपुट';

  @override
  String get audioAndVideoDirectInputDescription =>
      'आपकी ऑडियो को बिना किसी बदलाव के भेजता है। यदि आप बाहरी ऑडियो सॉफ़्टवेयर का उपयोग कर रहे हैं तो यह सबसे अच्छा है।';

  @override
  String get audioAndVideoCustomProfileLabel => 'पसंद के मुताबिक';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'प्रत्येक सेटिंग को स्वयं समायोजित करें: शोर दबाना, इको रद्द करना और लाभ।';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'शोर दबाना';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'बेहतर';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'सामान्य';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'कोई नहीं';

  @override
  String get audioAndVideoEchoCancellationLabel => 'इको कैंसलेशन';

  @override
  String get audioAndVideoAutomaticGainControlLabel => 'स्वचालित गेन नियंत्रण';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'यह आपके माइक्रोफ़ोन की आवाज़ को एक समान करता है। जब एन्हांस्ड सप्रेशन चालू होता है तो यह बंद हो जाता है।';

  @override
  String get audioAndVideoMicTestSectionTitle => 'माइक टेस्ट';

  @override
  String get audioAndVideoMicTestStartLabel => 'माइक्रोफ़ोन टेस्ट शुरू करें';

  @override
  String get audioAndVideoMicTestStopLabel => 'माइक्रोफ़ोन टेस्ट रोकें';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName को आपके इनपुट का परीक्षण करने के लिए माइक्रोफ़ोन एक्सेस की आवश्यकता है।';
  }

  @override
  String get audioAndVideoCameraLabel => 'कैमरा';

  @override
  String get audioAndVideoMirrorCameraLabel => 'कैमरा मिरर करें';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'कैमरा क्वालिटी';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'स्क्रीन शेयर क्वालिटी';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'फ़्रेम दर';

  @override
  String get audioAndVideoFrameRate15Label => '15 एफपीएस';

  @override
  String get audioAndVideoFrameRate30Label => '30 एफपीएस';

  @override
  String get audioAndVideoFrameRate60Label => '60 एफपीएस';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p और 60 FPS के लिए $premiumProductName की आवश्यकता है।';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'यह इंस्टेंस वर्तमान में 30 FPS पर 720p तक स्क्रीन शेयर की अनुमति देता है।';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName को आपके डिवाइसों को सूचीबद्ध करने के लिए माइक्रोफ़ोन एक्सेस की आवश्यकता है।';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName को आपके डिवाइसों को सूचीबद्ध करने के लिए कैमरे का ऐक्सेस चाहिए।';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'कैमरा छिपाने पर न पूछें';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'अपनी स्क्रीन शेयर छिपाते समय न पूछें';

  @override
  String get userSettingsNavNotifications => 'सूचनाएं';

  @override
  String get notificationsGeneralSectionTitle => 'सामान्य';

  @override
  String get notificationsEnableNotificationsLabel => 'सूचनाएं चालू करें';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'जब आपको मैसेज मिलें, तब नोटिफ़िकेशन पाएँ। आपको अपनी डिवाइस सेटिंग में $productName के लिए नोटिफ़िकेशन की अनुमति देनी पड़ सकती है। हर चैनल/हर कम्युनिटी के कंट्रोल के लिए, किसी कम्युनिटी के मेन्यू से नोटिफ़िकेशन सेटिंग खोलें।';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'डेस्कटॉप नोटिफ़िकेशन चालू करें';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'OS नोटिफिकेशन सेंटर का उपयोग करता है। प्रति-चैनल/प्रति-कम्युनिटी कंट्रोल के लिए, किसी कम्युनिटी आइकन पर राइट-क्लिक करें और नोटिफिकेशन सेटिंग्स खोलें।';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'ब्राउज़र नोटिफ़िकेशन चालू करें';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'जब आपको मैसेज मिलें, तो नोटिफ़िकेशन पाएं. आपको अपनी ब्राउज़र सेटिंग में नोटिफ़िकेशन की अनुमति देनी पड़ सकती है. हर चैनल/कम्युनिटी के कंट्रोल के लिए, कम्युनिटी आइकॉन पर राइट-क्लिक करें और नोटिफ़िकेशन सेटिंग खोलें.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'पुश नोटिफ़िकेशन निष्क्रिय टाइमआउट';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName आपके कंप्यूटर पर होने पर आपके मोबाइल डिवाइस पर पुश सूचनाएं भेजने से बचता है। चुनें कि आपको डेस्कटॉप पर निष्क्रिय रहने के लिए कितने समय की आवश्यकता है, जिसके बाद आपको पुश सूचनाएं प्राप्त हों।';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute मिनट';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes मिनट';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'मेंशन प्राथमिकता';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'रिप्लाई मेंशन प्राथमिकता';

  @override
  String get notificationsMentionNoPreferenceName => 'कोई प्राथमिकता नहीं';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'भेजने वाले के इरादे का सम्मान करें, @मेंशन टॉगल करने पर कोई चेतावनी नहीं';

  @override
  String get notificationsMentionPreferMentionName =>
      '@मेंशन को प्राथमिकता दें';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'डिफ़ॉल्ट रूप से आपको @मेंशन का जवाब मिलता है, और अगर वे इसे बंद करते हैं, तो भेजने वाले को चेतावनी दें';

  @override
  String get notificationsMentionPreferNoMentionName => '@मेंशन पसंद नहीं';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'डिफ़ॉल्ट रूप से @मेंशन को जवाबों से हटा दें, और अगर भेजने वाला इसे चालू करता है, तो उसे चेतावनी दें';

  @override
  String get notificationsTtsSectionTitle => 'टेक्स्ट-टू-स्पीच सूचनाएं';

  @override
  String get notificationsTtsEnableCommandLabel =>
      '/tts स्पीच प्लेबैक चालू करें';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '/tts को आपका मैसेज ज़ोर से पढ़ने दें। सेटिंग बंद करने पर ये कमांड सामान्य टेक्स्ट के रूप में दिखेंगे।';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'प्लेबैक स्पीड एडजस्ट करें';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'अक्सेसिबिलिटी';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'मैसेज का अपने आप सुनाया जाना';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'आने वाले कॉन्टेंट को स्पीच में बदलता है, भले ही वह /tts से आया हो या नहीं।';

  @override
  String get notificationsTtsModeAllChannelsName => 'हर चैनल';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'हर आने वाले मैसेज को बोलकर सुनाया जाए, चाहे कोई भी चैनल खुला हो।';

  @override
  String get notificationsTtsModeCurrentChannelName => 'केवल सक्रिय चैनल';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'केवल वही चैनल सुनाता है जिसे आप देख रहे हैं। आप चैनलों के बीच स्विच करते हैं, तो भी यह सुनाना जारी रखता है।';

  @override
  String get notificationsTtsModeNeverName => 'कभी भी अपने आप नहीं';

  @override
  String get notificationsTtsModeNeverDescription =>
      'तब तक शांत रहें जब तक कोई मैन्युअल रूप से /tts न चलाए।';

  @override
  String get notificationsTtsModeAriaLabel => 'सभी मैसेज बोलकर सुनाएं';

  @override
  String get notificationsSoundsSectionTitle => 'ध्वनियाँ';

  @override
  String get notificationsMasterVolumeLabel => 'मास्टर वॉल्यूम';

  @override
  String get notificationsMasterVolumeDescription =>
      'हर साउंड इफ़ेक्ट के लिए लेवल सेट करता है. प्रति-साउंड ओवरराइड इसे अनदेखा करते हैं.';

  @override
  String get notificationsResetToDefaultVolume =>
      'डिफ़ॉल्ट वॉल्यूम पर रीसेट करें';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'सभी सूचनाओं की आवाज़ बंद करें';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'आपकी मौजूदा नोटिफ़िकेशन साउंड सेटिंग्स सेव रहेंगी।';

  @override
  String get notificationsShowMoreSoundEffects =>
      'अधिक सामान्य ध्वनि प्रभाव दिखाएं';

  @override
  String get notificationsShowFewerSoundEffects =>
      'कम सामान्य ध्वनि प्रभाव दिखाएं';

  @override
  String get notificationsPreviewSound => 'साउंड का प्रीव्यू करें';

  @override
  String get notificationsPerSoundVolumeTitle => 'हर ध्वनि के लिए वॉल्यूम';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'अलग-अलग आवाज़ों के लिए कस्टम वॉल्यूम सेट करें। जिन आवाज़ों में ओवरराइड नहीं है, वे मास्टर वॉल्यूम के अनुसार होंगी।';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'सक्रिय कस्टम ध्वनि वॉल्यूम ओवरराइड: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'मास्टर का अनुसरण कर रहा है • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '$label को मास्टर वॉल्यूम पर रीसेट करें';
  }

  @override
  String get notificationsResetAllOverrides => 'सभी ओवरराइड रीसेट करें';

  @override
  String notificationsMuteSound(String label) {
    return '$label को म्यूट करें';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '$label को अनम्यूट करें';
  }

  @override
  String get notificationsSoundMessage => 'कम्युनिटी मैसेज की सूचनाएँ';

  @override
  String get notificationsSoundDirectMessage => 'सीधे मैसेज की सूचनाएँ';

  @override
  String get notificationsSoundSameChannelMessage =>
      'मौजूदा चैनल के मैसेज नोटिफ़िकेशन';

  @override
  String get notificationsSoundMute => 'आवाज़ म्यूट करें';

  @override
  String get notificationsSoundUnmute => 'वॉइस अनम्यूट करें';

  @override
  String get notificationsSoundDeaf => 'आवाज़ बंद करें';

  @override
  String get notificationsSoundUndeaf => 'वॉइस अनडिफ़ेन';

  @override
  String get notificationsSoundUserJoin => 'उपयोगकर्ता चैनल में शामिल होता है';

  @override
  String get notificationsSoundUserLeave => 'उपयोगकर्ता चैनल छोड़ता है';

  @override
  String get notificationsSoundUserMove => 'उपयोगकर्ता चैनल में चला गया';

  @override
  String get notificationsSoundViewerJoin => 'दर्शक स्ट्रीम में शामिल हुआ';

  @override
  String get notificationsSoundViewerLeave => 'दर्शक स्ट्रीम छोड़ता है';

  @override
  String get notificationsSoundVoiceDisconnect => 'वॉइस डिसकनेक्ट हो गई';

  @override
  String get notificationsSoundIncomingRing => 'इनकमिंग कॉल';

  @override
  String get notificationsSoundCameraOn => 'कैमरा चालू';

  @override
  String get notificationsSoundCameraOff => 'कैमरा बंद';

  @override
  String get notificationsSoundScreenShareStart => 'स्क्रीन शेयर शुरू करें';

  @override
  String get notificationsSoundScreenShareStop => 'स्क्रीन शेयर बंद करें';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'पुश सूचना टाइमआउट अपडेट नहीं हो सका। पुनः प्रयास करें।';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Mention preference अपडेट नहीं हो सका। दोबारा कोशिश करें।';

  @override
  String get notificationsPermissionDeniedTitle => 'सूचनाएं ब्लॉक की गईं';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'सूचनाएं चालू नहीं की जा सकीं। जारी रखने के लिए सूचना अनुमति दें।';

  @override
  String get userSettingsNavLanguageAndTime => 'भाषा और समय';

  @override
  String get languageAndTimeLanguageSectionTitle => 'इंटरफ़ेस भाषा';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'ऐप में इस्तेमाल की जाने वाली भाषा चुनें';

  @override
  String get languageAndTimeOpenLanguageSettings => 'भाषा सेटिंग खोलें';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'समय फ़ॉर्मैट';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'चुनें कि ऐप में समय कैसे दिखाया जाए';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'समय फ़ॉर्मैट चुनें';

  @override
  String get languageAndTimeTimeFormatAuto => 'ऑटो';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 घंटे';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 घंटे';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'ऐप की भाषा: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'सिस्टम स्थानीय भाषा: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'समय फ़ॉर्मैट के लिए सिस्टम लोकैल का इस्तेमाल करें';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'समय प्रारूप अपडेट करने में विफल';

  @override
  String get userSettingsNavDefaultApps => 'डिफ़ॉल्ट ऐप्स';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'वेब ब्राउज़र';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'वह ब्राउज़र चुनें जो लिंक पर टैप करने पर खुलता है।';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'अगर किसी साइट के लिए कोई ऐप इंस्टॉल किया गया है, तो लिंक पहले उस ऐप में खुलेंगे।';

  @override
  String get defaultAppsWebBrowserInApp => 'इन-ऐप ब्राउज़र';

  @override
  String get defaultAppsWebBrowserExternal => 'बाहरी ब्राउज़र';

  @override
  String get userSettingsNavAdvanced => 'एडवांस';

  @override
  String get advancedPerformanceReportingTitle => 'प्रदर्शन रिपोर्टिंग';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return '$productName को बेहतर बनाने में मदद करें, क्रैश और परफॉरमेंस डेटा को अज्ञात रूप से शेयर करके।';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'क्रैश और परफॉरमेंस रिपोर्ट भेजें';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'सभी रिपोर्ट किया गया डेटा गुमनाम है और केवल $productName की अपनी निगरानी सेवा को भेजा जाता है — किसी तीसरे पक्ष के प्रदाता का उपयोग नहीं किया जाता है।';
  }

  @override
  String get advancedSettingsConfigure => 'कॉन्फ़िगर करें';

  @override
  String get advancedSettingsCategoryPrivacy => 'प्राइवेसी';

  @override
  String get advancedSettingsCategoryAppearance => 'दिखावट';

  @override
  String get advancedSettingsCategoryAccessibility => 'अक्सेसिबिलिटी';

  @override
  String get advancedSettingsCategoryChat => 'चैट';

  @override
  String get advancedSettingsCategoryMedia => 'मीडिया';

  @override
  String get advancedSettingsCategoryVoice => 'वॉइस';

  @override
  String get advancedSettingsCategoryDeveloper => 'डेवलपर';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'टेक्स्ट चुनने की सुविधा चालू करें';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'ऐप में टेक्स्ट चुनने की अनुमति दें।';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'वीडियो सीक थंबनेल सक्षम करें';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'वीडियो स्क्रॉल करते समय थंबनेल या लाइव फ़्रेम';

  @override
  String get advancedSettingHapticFeedbackLabel => 'हैप्टिक फ़ीडबैक';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'टैप और क्रियाओं के लिए कंपन प्रतिक्रिया। डिवाइसों में सिंक नहीं होगी।';

  @override
  String get advancedSettingShowNekoLabel => 'नेको दिखाएं';

  @override
  String get advancedSettingShowNekoDescription =>
      'आपके कर्सर का पीछा करने वाली नेको बिल्ली';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'अपनी चैट इनपुट पर नेको दिखाएं';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'स्प्लैश ज़ूम एनिमेशन';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'स्प्लैश स्क्रीन से बाहर निकलते समय लोगो को ज़ूम आउट करें';

  @override
  String get advancedSettingKeyboardHintsLabel => 'कीबोर्ड हिंट';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'टूलटिप्स में कीबोर्ड शॉर्टकट संकेत।';

  @override
  String get advancedSettingEnableFavoritesLabel => 'पसंदीदा चालू करें';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'पूरे ऐप में पसंदीदा दिखाएं';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'वॉइस चैनल में शामिल होने का तरीका';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'समुदाय वॉइस जॉइन के लिए पुष्टि या डबल-क्लिक करें।';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'वॉयस चैनल से जुड़ने के लिए डबल-क्लिक ज़रूरी है';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'वॉइस चैनल में शामिल होने से पहले पुष्टि करें';

  @override
  String get advancedSettingAutoSendGifsLabel => 'चुनने पर GIF अपने आप भेजें';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'पुष्टि के बिना सीधे पिकर से GIF भेजें';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'GIF पसंदीदा को सेव की गई मीडिया के तौर पर सेव करें';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'चुने कि स्टार किए गए GIF पसंदीदा कैसे स्टोर किए जाते हैं';

  @override
  String get advancedSettingMediaButtonsLabel => 'मीडिया बटन';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'मीडिया अटैचमेंट और एम्बेड पर दिखने वाले बटन और इंडिकेटर को अनुकूलित करें';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'भेजने से पहले अटैचमेंट अपलोड करें';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'संदेश इनपुट में जोड़े जाने के तुरंत बाद अटैचमेंट अपलोड करना शुरू करें';

  @override
  String get advancedSettingStripTrackingLabel =>
      'यूआरएल से ट्रैकिंग पैरामीटर हटाएँ';

  @override
  String get advancedSettingStripTrackingDescription =>
      'आपके भेजे गए मैसेज में URL से ट्रैकिंग पैरामीटर अपने-आप हटाएँ';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'सभी बाहरी लिंक पर भरोसा करें';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'सभी डोमेन के लिए बाहरी लिंक चेतावनी को छोड़ें';

  @override
  String get advancedSettingSearchEnginesLabel => 'सर्च इंजन';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'चयनित टेक्स्ट से उपयोग किए जाने वाले खोज इंजन को कॉन्फ़िगर करें';

  @override
  String get advancedSettingTranslatorsLabel => 'अनुवादक';

  @override
  String get advancedSettingTranslatorsDescription =>
      'चयनित टेक्स्ट से उपयोग किए जाने वाले अनुवादक प्रदाताओं को कॉन्फ़िगर करें';

  @override
  String get advancedSettingReverseImageSearchLabel => 'रिवर्स इमेज सर्च';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'रिवर्स इमेज सर्च प्रदाता';

  @override
  String get advancedSettingMessageActionBarLabel => 'मैसेज एक्शन बार';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'मैसेज पर होवर करने पर दिखने वाले ऐक्शन बार को पसंद के मुताबिक बनाएं';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'संदेश इनपुट में जब आप कोलन टाइप करते हैं, तो क्या दिखाई देता है, यह चुनें';

  @override
  String get advancedSettingInputButtonsLabel => 'मैसेज इनपुट बटन';

  @override
  String get advancedSettingInputButtonsDescription =>
      'संदेश इनपुट में कौन से बटन दिखाई दें, यह चुनें';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'मैसेज भेजने पर सबसे नीचे स्क्रोल करें';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'संदेश भेजने के बाद चैट कैसे आगे बढ़े, यह चुनें';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      '\"सभी पढ़े हुए के रूप में मार्क करें\" पुष्टि को छोड़ें';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'सभी अपठित इनबॉक्स चैनलों को बिना पुष्टि के तुरंत पढ़ा गया के रूप में चिह्नित करें';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'म्यूट किए गए चैनल डिफ़ॉल्ट रूप से छिपाएँ';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'म्यूट किए गए चैनल कम्युनिटी साइडबार से छिपाएं';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'GIF इंडिकेटर दिखाएं';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'अटैचमेंट की समय-सीमा खत्म होने का इंडिकेटर दिखाएं';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'डिलीट बटन दिखाएं';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'डाउनलोड बटन दिखाएं';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'पसंदीदा बटन दिखाएं';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'एम्बेड छिपाने का बटन दिखाएं';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'मैसेज ऐक्शन बार दिखाएं';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'सिर्फ़ और बटन दिखाएं';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'क्विक रिएक्शन दिखाएं';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'शिफ़्ट दबाकर बड़ा करें';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट में डिफ़ॉल्ट इमोजी दिखाएं';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट में कस्टम इमोजी दिखाएं';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट में स्टिकर दिखाएं';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'एक्सप्रेशन ऑटो-कम्प्लीट में सेव किया गया मीडिया दिखाएं';

  @override
  String get advancedSettingShowGifsButtonLabel => 'GIF बटन दिखाएं';

  @override
  String get advancedSettingShowMediaButtonLabel => 'मीडिया बटन दिखाएं';

  @override
  String get advancedSettingShowStickersButtonLabel => 'स्टिकर बटन दिखाएं';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'इमोजी बटन दिखाएं';

  @override
  String get advancedSettingShowSendButtonLabel => 'भेजें बटन दिखाएं';

  @override
  String get advancedSettingNewDeviceAlertsLabel => 'नए डिवाइस अलर्ट दिखाएं';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'नए ऑडियो उपकरणों के लिए संकेत दें';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'कनेक्शन वॉल्यूम नियंत्रण';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'वॉयस मेन्यू में प्रति-डिवाइस पार्टिसिपेंट वॉल्यूम स्लाइडर दिखाएं';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'स्क्रीन शेयर पूर्वावलोकन व्यवहार';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'पूर्वावलोकन, पॉपआउट और स्ट्रीम थंबनेल व्यवहार';

  @override
  String get advancedSettingScreenShareCodecLabel => 'स्क्रीन शेयर कोडेक';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'स्क्रीन साझाकरण के लिए वीडियो कोडेक';

  @override
  String get advancedSettingScreenShareCodecAuto => 'स्वचालित (अनुशंसित)';

  @override
  String get advancedSettingScreenShareCodecAv1 => 'AV1';

  @override
  String get advancedSettingScreenShareCodecH265 => 'H.265';

  @override
  String get advancedSettingScreenShareCodecVp9 => 'VP9';

  @override
  String get advancedSettingScreenShareCodecH264 => 'H.264';

  @override
  String get advancedSettingScreenShareCodecVp8 => 'VP8';

  @override
  String get advancedSettingPauseScreenSharePreviewLabel =>
      'बैकग्राउंड में मेरे स्क्रीन शेयर के प्रीव्यू को रोकें';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'मेरे स्ट्रीम पूर्वावलोकन थंबनेल को छिपाएँ';

  @override
  String get advancedSettingDeveloperModeLabel => 'डेवलपर मोड चालू करें';

  @override
  String get advancedSettingDeveloperModeDescription => 'डेवलपर मोड चालू करें';

  @override
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'बिंग';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'गूगल लेंस';

  @override
  String get advancedSettingSearchEngineTinEye => 'टिनआई';

  @override
  String get advancedSettingTranslatorGoogle => 'Google Translate';

  @override
  String get advancedSettingTranslatorDeepL => 'डीपएल';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'डिफ़ॉल्ट सर्च इंजन';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'चुने गए टेक्स्ट को सर्च करते समय डिफ़ॉल्ट रूप से किस सर्च इंजन का उपयोग किया जाता है, उसे चुनें।';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => 'बिल्ट-इन सर्च इंजन';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'बिल्ट-इन सर्च इंजन को चालू या बंद करें। टेक्स्ट चुने जाने पर चालू किए गए इंजन मैसेज कॉन्टेक्स्ट मेन्यू में दिखते हैं।';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'पसंद के खोज इंजन';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'अपना कस्टम यूआरएल पैटर्न के साथ अपने स्वयं के सर्च इंजन जोड़ें। सर्च टेक्स्ट के लिए प्लेसहोल्डर के रूप में \'$query\' का उपयोग करें।';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'सर्च इंजन जोड़ें';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'कम से कम एक सर्च इंजन चालू करें।';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'सर्च इंजन हटाएँ';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'डिफ़ॉल्ट अनुवादक';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'चुने गए टेक्स्ट का अनुवाद करने के लिए डिफ़ॉल्ट रूप से किस अनुवादक का उपयोग किया जाता है, उसे चुनें।';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'बिल्ट-इन ट्रांसलेटर';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'बिल्ट-इन ट्रांसलेटर चालू या बंद करें. टेक्स्ट चुने जाने पर मैसेज कॉन्टेक्स्ट मेन्यू में चालू ट्रांसलेटर दिखते हैं.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'कस्टम अनुवादक';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'अपने कस्टम यूआरएल पैटर्न के साथ अपने स्वयं के अनुवादक जोड़ें। अनुवाद करने के लिए टेक्स्ट के प्लेसहोल्डर के रूप में \'$query\' का उपयोग करें।';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'अनुवादक जोड़ें';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'कम से कम एक अनुवादक चालू करें।';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'अनुवादक हटाएँ';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'डिफ़ॉल्ट रिवर्स इमेज सर्च';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'चुनें कि इमेज सर्च करने के लिए डिफ़ॉल्ट रूप से किस रिवर्स इमेज सर्च सेवा का उपयोग किया जाता है।';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'इनबिल्ट रिवर्स इमेज सर्च';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'बिल्ट-इन रिवर्स इमेज सर्च प्रोवाइडर को चालू या बंद करें। चालू किए गए प्रोवाइडर इमेज, अवतार, बैनर, स्टिकर और इमोजी के कॉन्टेक्स्ट मेन्यू में दिखेंगे।';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'कस्टम रिवर्स इमेज सर्च';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'अपनी कस्टम यूआरएल पैटर्न के साथ रिवर्स इमेज सर्च प्रोवाइडर जोड़ें। इमेज यूआरएल के लिए प्लेसहोल्डर के रूप में \'$url\' का उपयोग करें।';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'रिवर्स इमेज सर्च जोड़ें';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'कम से कम एक रिवर्स इमेज सर्च प्रोवाइडर को इनेबल करें।';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'रिवर्स इमेज सर्च हटाएँ';

  @override
  String get advancedSettingAddSearchEngineTitle => 'सर्च इंजन जोड़ें';

  @override
  String get advancedSettingEditSearchEngineTitle => 'सर्च इंजन एडिट करें';

  @override
  String get advancedSettingAddTranslatorTitle => 'अनुवाद प्रदाता जोड़ें';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'अनुवाद प्रदाता संपादित करें';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'रिवर्स इमेज सर्च इंजन जोड़ें';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'रिवर्स इमेज सर्च इंजन एडिट करें';

  @override
  String get advancedSettingSearchProviderNameLabel => 'नाम';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'यूआरएल पैटर्न';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'मेरा सर्च इंजन';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'मेरा अनुवादक';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'मेरी रिवर्स इमेज खोज';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return '\'$query\' का उपयोग करें जहाँ खोज टेक्स्ट डाला जाना चाहिए।';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return '\'$query\' का उपयोग करें जहाँ अनुवादित टेक्स्ट डाला जाना चाहिए।';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return '\'$url\' का उपयोग करें जहाँ इमेज का URL डाला जाना चाहिए।';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'नाम ज़रूरी है।';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'यूआरएल पैटर्न ज़रूरी है.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL पैटर्न में \'$query\' होना चाहिए।';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL पैटर्न में \'$url\' होना चाहिए।';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'यूआरएल पैटर्न एक मान्य यूआरएल होना चाहिए।';

  @override
  String get advancedSettingAddSearchProviderAction => 'जोड़ें';

  @override
  String get advancedSettingEditSearchProviderAction => 'बदलाव करें';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'हटाएँ';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'क्या आप वाकई $engineName को हटाना चाहते हैं?';
  }

  @override
  String get userSettingsNavApplications => 'एप्लिकेशन';

  @override
  String get userSettingsNavAppLogs => 'ऐप लॉग';

  @override
  String get userSettingsNavDeveloperTools => 'डेवलपर टूल्स';

  @override
  String get userSettingsNavLimitsConfig => 'सीमाएँ कॉन्फ़िगर करें';

  @override
  String get userSettingsNavFeatureFlags => 'फ़ीचर फ़्लैग';

  @override
  String get userSettingsNavWhatsNew => 'नया क्या है';

  @override
  String get userSettingsJoinFluxerLabs => 'Fluxer लैब्स से जुड़ें';

  @override
  String get userSettingsNavAppLicenses => 'ऐप लाइसेंस';

  @override
  String get userSettingsAppLicensesDescription =>
      'इस ऐप द्वारा उपयोग किया जाने वाला ओपन-सोर्स सॉफ़्टवेयर। यह ऐप फ़्लटर के साथ बनाया गया है।';

  @override
  String get userSettingsAppLicensesLoadError => 'ऐप लाइसेंस लोड नहीं हो सके।';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लाइसेंस',
      one: '1 लाइसेंस',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'लॉग आउट';

  @override
  String get quickSwitcherTabSearch => 'खोजें';

  @override
  String get quickSwitcherTabFriends => 'दोस्त';

  @override
  String get quickSwitcherSearchPlaceholder => 'चैनल, लोग या कम्युनिटी खोजें';

  @override
  String get quickSwitcherSearchFriends => 'दोस्तों को खोजें';

  @override
  String get quickSwitcherNoMatchesFound => 'कोई मिलान नहीं मिला';

  @override
  String get quickSwitcherEmptyHint =>
      'कोई दूसरा नाम आज़माएँ या नतीजों को फ़िल्टर करने के लिए @ / # / ! / * प्रीफ़िक्स का इस्तेमाल करें.';

  @override
  String get quickSwitcherSectionPeople => 'लोग';

  @override
  String get quickSwitcherSectionGroupMessages => 'ग्रुप मैसेज';

  @override
  String get quickSwitcherSectionTextChannels => 'टेक्स्ट चैनल';

  @override
  String get quickSwitcherSectionVoiceChannels => 'वॉइस चैनल';

  @override
  String get quickSwitcherSectionCommunities => 'समुदाय';

  @override
  String get quickSwitcherSectionSettings => 'सेटिंग्स';

  @override
  String get quickSwitcherHomeLabel => 'होम';

  @override
  String get quickSwitcherDirectMessagesLabel => 'डायरेक्ट मैसेज';

  @override
  String get quickSwitcherFavoritesLabel => 'पसंदीदा';

  @override
  String get quickSwitcherUserSettingsLabel => 'उपयोगकर्ता सेटिंग्स';

  @override
  String get quickSwitcherNotificationsLabel => 'सूचनाएं';

  @override
  String get quickSwitcherBookmarksLabel => 'बुकमार्क';

  @override
  String get savedMessagesEmptyTitle => 'कोई बुकमार्क नहीं';

  @override
  String get savedMessagesEmptyBody =>
      'मैसेज को बाद के लिए सेव करने के लिए बुकमार्क करें।';

  @override
  String get savedMessagesEndBody => 'यहां देखने के लिए और कुछ नहीं है।';

  @override
  String get savedMessagesRemoveTooltip => 'बुकमार्क हटाएँ';

  @override
  String get quickSwitcherMentionsLabel => 'मेंशन';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'अभी कोई दोस्त नहीं';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'शुरू करने के लिए किसी दोस्त को जोड़ें।';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'इस खोज से कोई दोस्त मेल नहीं खाता';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'कोई दूसरा नाम आज़माएँ।';

  @override
  String get quickSwitcherSearchAliasUser => 'उपयोगकर्ता';

  @override
  String get quickSwitcherSearchAliasYou => 'आप';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'डीएम';

  @override
  String get quickSwitcherSearchAliasMessages => 'मैसेज';

  @override
  String get quickSwitcherSearchAliasFav => 'पसंदीदा';

  @override
  String get quickSwitcherSearchAliasStarred => 'पसंदीदा';

  @override
  String get quickSwitcherSearchAliasInbox => 'इनबॉक्स';

  @override
  String get quickSwitcherSearchAliasSaved => 'सेव किया गया';

  @override
  String get uiClose => 'बंद करें';

  @override
  String get chatJumpToBottom => 'नीचे पर जाएँ';

  @override
  String get uiConfirm => 'पुष्टि करें';

  @override
  String get uiLoading => 'लोड हो रहा है';

  @override
  String get uiSearch => 'खोजें';

  @override
  String get uiStartCall => 'कॉल शुरू करें';

  @override
  String get uiStartVideoCall => 'वीडियो कॉल शुरू करें';

  @override
  String get uiPlay => 'चलाएँ';

  @override
  String get uiPause => 'रोकें';

  @override
  String get uiDownload => 'डाउनलोड करें';

  @override
  String get uiMoreActions => 'और विकल्प';

  @override
  String get uiUnsavedChanges => 'बदलाव सेव नहीं किए गए';

  @override
  String get uiReset => 'रीसेट करें';

  @override
  String get uiOpenColorPicker => 'कलर पिकर खोलें';

  @override
  String get uiSelectPlaceholder => 'चुनें';

  @override
  String get uiSearchPlaceholder => 'खोजें';

  @override
  String get uiNoOptionsFound => 'कोई विकल्प नहीं मिला';

  @override
  String get uiDismissNotification => 'सूचना बंद करें';

  @override
  String get uiColorPickerTitle => 'रंग चुनें';

  @override
  String get mentionConfirmTitle => 'सभी को मेंशन करें?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'यह $count सदस्यों को सूचित करेगा। जारी रखें?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'यह $count ऑनलाइन सदस्यों को सूचित करेगा। जारी रखें?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'यह $count सदस्यों को $roleName भूमिका के साथ सूचित करेगा। जारी रखें?';
  }

  @override
  String get mentionConfirmButton => 'मेंशन करें';

  @override
  String get composerEmojiUnavailable =>
      'आप यहाँ वह इमोजी इस्तेमाल नहीं कर सकते।';

  @override
  String get instanceUrlLabel => 'इंस्टेंस यूआरएल';

  @override
  String get instanceUrlPlaceholder =>
      'इंस्टेंस यूआरएल दर्ज करें (जैसे fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Fluxer पर रीसेट करें';

  @override
  String get instanceConnect => 'कनेक्ट करें';

  @override
  String get instanceConnecting => 'कनेक्ट हो रहा है…';

  @override
  String get instanceConnectFailed => 'इंस्टेंस से कनेक्ट करने में विफल';

  @override
  String get recentInstances => 'हाल के इंस्टेंस';

  @override
  String removeRecentInstance(String domain) {
    return '$domain को हाल की इंस्टेंस से हटाएँ';
  }

  @override
  String get instanceSheetTitle => 'इंस्टेंस से कनेक्ट करें';

  @override
  String get connectToDifferentInstance => 'किसी दूसरे इंस्टेंस से कनेक्ट करें';

  @override
  String get changeInstance => 'बदलें';

  @override
  String get instanceConnectionRequired =>
      'साइन इन करने के लिए इंस्टेंस से कनेक्ट करें';

  @override
  String get comingSoon => 'जल्द आ रहा है';

  @override
  String get guildNavbarDirectMessages => 'डायरेक्ट मैसेजेस';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'खोजें खोजने योग्य समुदाय';

  @override
  String get discoveryExplore => 'एक्सप्लोर करें';

  @override
  String get discoveryExplorePublicCommunities =>
      'सार्वजनिक समुदायों को एक्सप्लोर करें';

  @override
  String get discoveryListingSubheading =>
      'क्या आप अपना समुदाय यहाँ सूचीबद्ध करना चाहते हैं? यदि आप अपनी कम्युनिटी की सेटिंग्स > डिस्कवरी में आवश्यकताओं को पूरा करते हैं तो आवेदन करें।';

  @override
  String get discoverySearchCommunities => 'कम्युनिटी खोजें';

  @override
  String get discoveryFilterByLanguage => 'भाषा के अनुसार फ़िल्टर करें';

  @override
  String get discoveryAllLanguages => 'सभी भाषाएं';

  @override
  String get discoveryAllCategories => 'सभी';

  @override
  String get discoveryCategoryGaming => 'गेमिंग';

  @override
  String get discoveryCategoryMusic => 'संगीत';

  @override
  String get discoveryCategoryEntertainment => 'मनोरंजन';

  @override
  String get discoveryCategoryEducation => 'शिक्षा';

  @override
  String get discoveryCategoryScienceAndTechnology => 'विज्ञान और प्रौद्योगिकी';

  @override
  String get discoveryCategoryContentCreator => 'कंटेंट क्रिएटर';

  @override
  String get discoveryCategoryAnimeAndManga => 'एनीमे और मंगा';

  @override
  String get discoveryCategoryMoviesAndTv => 'फ़िल्में और टीवी';

  @override
  String get discoveryCategoryOther => 'अन्य';

  @override
  String get discoveryNoCommunitiesMatch => 'कोई कम्युनिटी मेल नहीं खाती।';

  @override
  String get discoveryJoinCommunity => 'कम्युनिटी में शामिल हों';

  @override
  String get discoveryJoined => 'जुड़ गए';

  @override
  String discoveryOnlineCount(String count) {
    return '$count ऑनलाइन';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString सदस्य',
      one: '1 सदस्य',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'कोई विवरण नहीं।';

  @override
  String get discoveryCommunities => 'समुदाय';

  @override
  String get discoveryApps => 'ऐप्स';

  @override
  String get discoveryJoinErrorGenericTitle => 'इस कम्युनिटी से जुड़ नहीं पाए';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'कुछ गलत हो गया। कृपया कुछ देर बाद फिर से कोशिश करें।';

  @override
  String get discoveryJoinErrorFullTitle => 'यह कम्युनिटी भरी हुई है';

  @override
  String get discoveryJoinErrorFullMessage =>
      'इस कम्युनिटी में सदस्यों की संख्या पूरी हो चुकी है, इसलिए आप अभी इसमें शामिल नहीं हो सकते हैं।';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'आप समुदाय की अधिकतम सीमा तक पहुँच गए हैं';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'आप अधिकतम कम्युनिटी में हैं. किसी एक को छोड़कर फिर से कोशिश करें.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'आप इस कम्युनिटी से नहीं जुड़ सकते';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'आपको इस समुदाय से प्रतिबंधित कर दिया गया है।';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'यह कम्युनिटी अब उपलब्ध नहीं है';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'हो सकता है कि यह डिस्कवरी से हट गया हो या इसमें नए सदस्यों के शामिल होने की सुविधा बंद हो गई हो. पेज रीफ़्रेश करें और यह आपको दोबारा नहीं दिखेगा.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'आप बहुत तेज़ जा रहे हैं';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'कृपया कुछ देर प्रतीक्षा करें और फिर से कोशिश करें।';

  @override
  String get guildNavbarAddCommunity => 'समुदाय जोड़ें';

  @override
  String get guildNavbarHelp => 'सहायता';

  @override
  String get scrollIndicatorNew => 'नया';

  @override
  String get scrollIndicatorNewMessage => 'नया संदेश';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderName को छोटा करें';
  }

  @override
  String get guildNavbarGuildSelected => 'चुना गया';

  @override
  String get guildNavbarGuildUnread => 'अपठित';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count उल्लेख',
      one: '1 उल्लेख',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'म्यूट किया गया';

  @override
  String get authShowPassword => 'पासवर्ड दिखाएं';

  @override
  String get authHidePassword => 'पासवर्ड छिपाएं';

  @override
  String get chatLoadingMessages => 'संदेश लोड हो रहे हैं';

  @override
  String get friendsMessageFriend => 'मैसेज करें';

  @override
  String get friendsFriendActions => 'मित्र क्रियाएँ';

  @override
  String get friendsAcceptRequest => 'मित्रता अनुरोध स्वीकार करें';

  @override
  String get friendsDeclineRequest => 'दोस्ती का अनुरोध अस्वीकार करें';

  @override
  String get friendsCancelRequest => 'मित्रता अनुरोध रद्द करें';

  @override
  String get friendsOpenInbox => 'इनबॉक्स';

  @override
  String get profileRemoveFriend => 'दोस्त हटाएँ';

  @override
  String get profileUnblockUser => 'यूज़र को अनब्लॉक करें';

  @override
  String get profileAcceptFriendRequest => 'मित्रता अनुरोध स्वीकार करें';

  @override
  String get profileCancelFriendRequest => 'मित्रता अनुरोध रद्द करें';

  @override
  String get profileSendFriendRequest => 'दोस्त जोड़ें';

  @override
  String get accountOverflowMenu => 'खाता विकल्प';

  @override
  String get navHome => 'होम';

  @override
  String get navNotifications => 'सूचनाएं';

  @override
  String get navYou => 'आप';

  @override
  String get guildFolderSettingsTitle => 'फ़ोल्डर सेटिंग्ज़';

  @override
  String get guildFolderNameLabel => 'फ़ोल्डर का नाम';

  @override
  String get guildFolderColorLabel => 'फ़ोल्डर का रंग';

  @override
  String get guildFolderShowIconWhenCollapsed => 'छोटा करने पर आइकॉन दिखाएं';

  @override
  String get guildFolderIconLabel => 'फ़ोल्डर आइकॉन';

  @override
  String get guildFolderDelete => 'फ़ोल्डर मिटाएँ';

  @override
  String get guildFolderIconFolder => 'फ़ोल्डर';

  @override
  String get guildFolderIconStar => 'स्टार करें';

  @override
  String get guildFolderIconHeart => 'पसंद';

  @override
  String get guildFolderIconBookmark => 'बुकमार्क करें';

  @override
  String get guildFolderIconGameController => 'गेम कंट्रोलर';

  @override
  String get guildFolderIconShield => 'शील्ड';

  @override
  String get guildFolderIconMusicNote => 'म्यूज़िक नोट';

  @override
  String get guildFolderMarkAsRead =>
      'फ़ोल्डर को पढ़ा गया के तौर पर मार्क करें';

  @override
  String get guildBulkMuteCommunities => 'कम्युनिटी को म्यूट करें';

  @override
  String get guildBulkUnmuteCommunities => 'समुदायों को अनम्यूट करें';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'कम्युनिटी नोटिफ़िकेशन सेटिंग्ज़';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'कम्युनिटी प्राइवेसी सेटिंग्स';

  @override
  String get guildBulkAllowEveryoneAndHere =>
      '@everyone और @here की अनुमति दें';

  @override
  String get guildBulkAllowRoleMentions => 'भूमिका के उल्लेख की अनुमति दें';

  @override
  String get guildBulkEnableMobilePush => 'मोबाइल पुश नोटिफ़िकेशन चालू करें';

  @override
  String get guildBulkDisableMobilePush => 'मोबाइल पुश नोटिफ़िकेशन बंद करें';

  @override
  String get guildBulkAllowDirectMessages => 'सीधे मैसेज की अनुमति दें';

  @override
  String get guildBulkBlockDirectMessages => 'सीधे मैसेज ब्लॉक करें';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'बॉट के सीधे मैसेज की अनुमति दें';

  @override
  String get guildBulkBlockBotDirectMessages => 'बॉट के सीधे मैसेज ब्लॉक करें';

  @override
  String get guildNavbarGroupDm => 'ग्रुप DM';

  @override
  String get guildNavbarCreateChannel => 'चैनल बनाएँ';

  @override
  String get guildNavbarChannelType => 'चैनल का प्रकार';

  @override
  String get guildNavbarTextChannel => 'टेक्स्ट चैनल';

  @override
  String get guildNavbarTextChannelDescription =>
      'संदेश, चित्र, GIF और इमोजी भेजें';

  @override
  String get guildNavbarVoiceChannel => 'वॉयस चैनल';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'आवाज़, वीडियो और स्क्रीन शेयर के साथ एक साथ समय बिताएं';

  @override
  String get guildNavbarLinkChannel => 'चैनल लिंक करें';

  @override
  String get guildNavbarLinkChannelDescription =>
      'किसी बाहरी वेबसाइट या संसाधन तक त्वरित पहुँच';

  @override
  String get guildNavbarNameLabel => 'नाम';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'चैनल का प्रकार चुनें';

  @override
  String get guildNavbarCreateCategory => 'कैटेगरी बनाएँ';

  @override
  String get guildNavbarNewCategoryHint => 'नई श्रेणी';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return '$communityName में दोस्तों को आमंत्रित करें';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'प्राप्तकर्ता #$channelName में ले जाए जाएंगे';
  }

  @override
  String get guildNavbarSearchFriends => 'दोस्तों को खोजें';

  @override
  String get guildNavbarNoFriendsYet => 'अभी कोई दोस्त नहीं';

  @override
  String get guildNavbarNoResults => 'कोई रिज़ल्ट नहीं';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'या, किसी दोस्त को इनवाइट लिंक भेजें:';

  @override
  String get guildNavbarInviteLink => 'आमंत्रण लिंक';

  @override
  String get guildNavbarCopy => 'कॉपी करें';

  @override
  String get guildNavbarCopied => 'कॉपी किया गया!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'आपकी आमंत्रण लिंक 7 दिनों में समाप्त हो जाएगी।';

  @override
  String get guildNavbarInviteNeverExpires =>
      'यह आमंत्रण लिंक कभी समाप्त नहीं होगा।';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'आपका आमंत्रण लिंक $duration में समाप्त हो जाएगा।';
  }

  @override
  String get guildNavbarEditInviteLink => 'आमंत्रण लिंक एडिट करें';

  @override
  String get guildNavbarInviteLinkSettings => 'लिंक सेटिंग न्योता दें';

  @override
  String get guildNavbarExpireAfter => 'इसके बाद समाप्त';

  @override
  String get guildNavbarMaxUses => 'अधिकतम उपयोग';

  @override
  String get guildNavbarGrantTemporaryMembership => 'अस्थायी सदस्यता दें';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'सदस्य ऑफ़लाइन होने पर हटा दिए जाएंगे, जब तक कि कोई भूमिका न सौंपी जाए';

  @override
  String get guildNavbarCreateNewLink => 'नया लिंक बनाएँ';

  @override
  String get guildNavbarSent => 'भेजा गया';

  @override
  String get guildNavbarInvite => 'आमंत्रित करें';

  @override
  String get guildNavbarLeaveCommunityTitle => 'समुदाय छोड़ें';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'क्या आप निश्चित हैं कि आप इस समुदाय को छोड़ना चाहते हैं? आप कोई भी संदेश नहीं देख पाएंगे।';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'समुदाय छोड़ें';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'क्या आप इस कम्युनिटी में अपने मैसेज हटाना चाहते हैं?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'आपके द्वारा यहाँ भेजे गए सभी संदेश, हर चैनल में, स्थायी रूप से हटा दिए जाएंगे। इसे वापस नहीं लाया जा सकता।';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'मेरे संदेश हटाएं';

  @override
  String get guildNavbarDeletedYourMessages => 'आपके संदेश हटा दिए गए';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'आपके मैसेज मिटाए नहीं जा सके';

  @override
  String get guildNavbarRemoveOverride => 'ओवरराइड हटाएं';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return '$formattedDate तक म्यूट किया गया';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'केवल $productName के कर्मचारियों के लिए सुलभ';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'इस कम्युनिटी में इनवाइट अभी रोके गए हैं';

  @override
  String get guildNavbarDurationNever => 'कभी नहीं';

  @override
  String get guildNavbarDuration30Minutes => '30 मिनट';

  @override
  String get guildNavbarDuration1Hour => '1 घंटा';

  @override
  String get guildNavbarDuration6Hours => '6 घंटे';

  @override
  String get guildNavbarDuration12Hours => '12 घंटे';

  @override
  String get guildNavbarDuration1Day => '1 दिन';

  @override
  String get guildNavbarDuration7Days => '7 दिन';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count सेकंड';
  }

  @override
  String get guildNavbarNever => 'कभी नहीं';

  @override
  String get guildNavbarNoLimit => 'कोई सीमा नहीं';

  @override
  String get guildNavbarOneUse => '1 उपयोग';

  @override
  String guildNavbarUses(int count) {
    return '$count बार';
  }

  @override
  String get guildMenuMarkAsRead => 'सभी को पढ़ा हुआ के रूप में चिह्नित करें';

  @override
  String get guildPeekMoreOptions => 'अधिक विकल्प';

  @override
  String get guildMenuInviteMembers => 'सदस्यों को आमंत्रित करें';

  @override
  String get guildMenuCommunitySettings => 'सामुदायिक सेटिंग्स';

  @override
  String get guildMenuEditCommunityProfile => 'समुदाय प्रोफ़ाइल संपादित करें';

  @override
  String get guildMenuUnmuteCommunity => 'समुदाय को अनम्यूट करें';

  @override
  String get guildMenuMuteCommunity => 'समुदाय को म्यूट करें';

  @override
  String get guildMenuHideMutedChannels => 'म्यूट किए गए चैनल छिपाएँ';

  @override
  String get guildMenuReportCommunity => 'समुदाय की रिपोर्ट करें';

  @override
  String get guildMenuDebugCommunity => 'समुदाय डीबग करें';

  @override
  String get guildMenuCopyCommunityId => 'कम्युनिटी आईडी कॉपी करें';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return '$formattedTime तक';
  }

  @override
  String get guildMenuSettingsGeneral => 'सामान्य';

  @override
  String get guildMenuSettingsRoles => 'भूमिकाएँ और अनुमतियाँ';

  @override
  String get guildMenuSettingsEmoji => 'इमोजी';

  @override
  String get guildMenuSettingsStickers => 'स्टिकर';

  @override
  String get guildMenuSettingsSafetyModeration => 'सुरक्षा और मॉडरेशन';

  @override
  String get guildMenuSettingsActivityLog => 'गतिविधि लॉग';

  @override
  String get guildMenuSettingsWebhooks => 'वेबहुक';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'कस्टम आमंत्रण यूआरएल';

  @override
  String get guildMenuSettingsDiscovery => 'खोज';

  @override
  String get guildMenuSettingsMembers => 'सदस्य';

  @override
  String get guildMenuSettingsInviteLinks => 'आमंत्रण';

  @override
  String get guildMenuSettingsBans => 'बैन';

  @override
  String get guildMenuSettingsChannels => 'चैनल';

  @override
  String get guildSettingsNoPermission =>
      'आपके पास इस सेटिंग टैब को देखने की अनुमति नहीं है।';

  @override
  String get guildSettingsOverviewIconTitle => 'आइकॉन';

  @override
  String get guildSettingsUploadImage => 'छवि अपलोड करें';

  @override
  String get guildSettingsOverviewBannerTitle => 'बैनर';

  @override
  String get guildSettingsOverviewBannerHint =>
      'अपने सर्वर के लिए एक बैनर अपलोड करें।';

  @override
  String get guildSettingsOverviewNameTitle => 'नाम';

  @override
  String get guildSettingsOverviewNameHint => 'मेरी शानदार कम्युनिटी';

  @override
  String get guildSettingsOverviewStatsTitle => 'आँकड़े';

  @override
  String get guildSettingsOverviewMembers => 'सदस्य';

  @override
  String get guildSettingsOverviewOnline => 'ऑनलाइन';

  @override
  String get guildSettingsRolesDescription =>
      'सदस्यों को समूहित करने और अनुमतियाँ असाइन करने के लिए भूमिकाओं का उपयोग करें।';

  @override
  String get guildSettingsCreateRole => 'भूमिका बनाएँ';

  @override
  String get guildSettingsRolesListTitle => 'भूमिकाएँ';

  @override
  String get guildSettingsRolesNewRole => 'नई भूमिका';

  @override
  String get guildSettingsRolesDeleteRole => 'भूमिका मिटाएँ';

  @override
  String get guildSettingsRolesBackToRoles => 'भूमिकाओं पर वापस जाएँ';

  @override
  String get guildSettingsBackToSettings => 'सेटिंग पर वापस जाएँ';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return '\"$name\" संपादित करें';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'भूमिका की सेटिंग और अनुमतियां कॉन्फ़िगर करें';

  @override
  String get guildSettingsRolesDisplaySection => 'दिखाएँ';

  @override
  String get guildSettingsRolesRoleName => 'भूमिका का नाम';

  @override
  String get guildSettingsRolesRoleColor => 'भूमिका का रंग';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'कोई रंग टाइप करें (हेक्स, आरजीबी(), एचएसएल(), या नाम) या पिकर का उपयोग करें।';

  @override
  String get guildSettingsRolesShowSeparately => 'यह भूमिका अलग से दिखाएं';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'सदस्य सूची में इस भूमिका वाले सदस्यों को उनके अपने सेक्शन में दिखाता है।';

  @override
  String get guildSettingsRolesAllowMentions =>
      'इस भूमिका के लिए उल्लेखों की अनुमति दें';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return '$permission अनुमति वाले सदस्य इस सेटिंग की परवाह किए बिना हमेशा भूमिकाओं का उल्लेख कर सकते हैं।';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'सभी अनुमतियां तुरंत हटाने के लिए इस बटन का उपयोग करें।';

  @override
  String get guildSettingsRolesClearPermissions => 'अनुमतियां साफ़ करें';

  @override
  String get guildSettingsRolesPermissionsSection => 'अनुमतियाँ';

  @override
  String get guildSettingsRolesSearchPermissions => 'अनुमतियां खोजें';

  @override
  String get guildSettingsRolesDenseLayout => 'सघन लेआउट';

  @override
  String get guildSettingsRolesComfyLayout => 'आरामदायक लेआउट';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => 'सघन लेआउट पर स्विच करें';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'आरामदायक लेआउट पर स्विच करें';

  @override
  String get guildSettingsRolesSingleColumn => 'एक कॉलम';

  @override
  String get guildSettingsRolesTwoColumns => 'दो कॉलम';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'एक कॉलम पर स्विच करें';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'दो कॉलम पर स्विच करें';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'कोई अनुमति नहीं मिली';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'कस्टम होइस्ट ऑर्डर';

  @override
  String get guildSettingsRolesHoistOrder => 'होइस्ट क्रम';

  @override
  String get guildSettingsRolesResetHoistOrder => 'डिफ़ॉल्ट पर रीसेट करें';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'सदस्य सूची में भूमिकाओं के दिखने का क्रम बदलने के लिए उन्हें खींचें.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'कोई होइस्टेड भूमिका नहीं। किसी भूमिका को यहां देखने के लिए उस पर \"इस भूमिका को अलग से दिखाएं\" सक्षम करें।';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'आप इस भूमिका को संपादित नहीं कर सकते क्योंकि यह आपकी सबसे ऊँची भूमिका है या आपसे ऊपर है';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'आपको इन अनुमतियों को संपादित करने के लिए \"$permission\" अनुमति की आवश्यकता है';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'आप अपनी सबसे ऊंची भूमिका के बराबर या उससे ऊपर की भूमिका को संपादित नहीं कर सकते';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'आप ऐसी अनुमति नहीं दे सकते जो आपके पास नहीं है';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'आप यह अनुमति नहीं हटा सकते क्योंकि इससे यह आपके लिए भी हट जाएगी';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'भूमिकाएं सफलतापूर्वक अपडेट की गईं';

  @override
  String get guildSettingsRolesCreatedSuccess => 'भूमिका सफलतापूर्वक बन गई';

  @override
  String get guildSettingsRolesDeletedSuccess =>
      'भूमिका सफलतापूर्वक मिटा दी गई';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'होइस्ट ऑर्डर डिफ़ॉल्ट पर रीसेट किया गया';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'भूमिका का नाम आवश्यक है';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'सेव करने से पहले भूमिका को एक नाम दें।';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'भूमिका नहीं बनाई जा सकी';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'भूमिकाएं अपडेट नहीं कर पाए';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'भूमिका को हटाया नहीं जा सका';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" डिलीट नहीं हो सका। कृपया पुनः प्रयास करें।';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'होइस्ट क्रम रीसेट नहीं किया जा सका';

  @override
  String get guildSettingsRolesTryAgainInAMoment =>
      'कुछ देर में फिर से कोशिश करें।';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'क्या आप वाकई $name रोल हटाना चाहते हैं? इस रोल वाले किसी भी सदस्य के पास अब यह नहीं रहेगा।';
  }

  @override
  String get permissionCategoryCommunityWide => 'पूरी कम्युनिटी';

  @override
  String get permissionCategoryMessagesMedia => 'मैसेज और मीडिया';

  @override
  String get permissionCategoryModeration => 'मॉडरेशन';

  @override
  String get permissionCategoryChannelAccess => 'चैनल एक्सेस';

  @override
  String get permissionCategoryChannelManagement => 'चैनल प्रबंधन';

  @override
  String get permissionCategoryAudioVideo => 'ऑडियो और वीडियो';

  @override
  String get permissionUnknown => 'अज्ञात अनुमति';

  @override
  String get permissionAdministrator => 'एडमिनिस्ट्रेटर';

  @override
  String get permissionAdministratorDescription =>
      'सभी अनुमतियाँ देता है और चैनल प्रतिबंधों को बायपास करता है। अत्यधिक संवेदनशील।';

  @override
  String get permissionViewActivityLog => 'गतिविधि लॉग देखें';

  @override
  String get permissionViewActivityLogDescription =>
      'समुदाय के बदलावों और मॉडरेटर कार्रवाइयों का गतिविधि लॉग पढ़ें।';

  @override
  String get permissionManageCommunity => 'कम्युनिटी मैनेज करें';

  @override
  String get permissionManageCommunityDescription =>
      'नाम, विवरण और आइकॉन जैसी ग्लोबल सेटिंग में बदलाव करें।';

  @override
  String get permissionManageRoles => 'भूमिकाएं प्रबंधित करें';

  @override
  String get permissionManageRolesDescription =>
      'अपनी सबसे ऊंची भूमिका के नीचे भूमिकाएं बनाएं, संपादित करें या हटाएं। चैनल अनुमति ओवरराइट संपादित करने की भी अनुमति देता है।';

  @override
  String get permissionManageChannels => 'चैनल प्रबंधित करें';

  @override
  String get permissionManageChannel => 'चैनल प्रबंधित करें';

  @override
  String get permissionManageChannelDescription =>
      'इस चैनल की सेटिंग को नाम बदलें और संपादित करें।';

  @override
  String get permissionManagePermissions => 'अनुमतियां प्रबंधित करें';

  @override
  String get permissionManagePermissionsDescription =>
      'इस चैनल में भूमिकाओं और सदस्यों के लिए ओवरराइट संपादित करें।';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'इस चैनल के लिए वेबहुक बनाएं, एडिट करें या मिटाएं.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'इस चैनल के सदस्यों की सूची देखें।';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'इस चैनल के लिए आमंत्रण लिंक प्रबंधित करें।';

  @override
  String get permissionOverwriteDeny => 'अस्वीकार करें';

  @override
  String get permissionOverwriteInherit => 'तटस्थ (इनहेरिट करें)';

  @override
  String get permissionOverwriteAllow => 'अनुमति दें';

  @override
  String get permissionOverwriteSetAllHelp =>
      'सभी अनुमतियां तुरंत सेट करने के लिए इन बटनों का उपयोग करें.';

  @override
  String get permissionManageChannelsDescription =>
      'चैनल और कैटगरी बनाएँ, एडिट करें या मिटाएँ.';

  @override
  String get permissionKickMembers => 'सदस्यों को हटाएँ';

  @override
  String get permissionBanMembers => 'सदस्यों को बैन करें';

  @override
  String get permissionCreateInviteLinks => 'आमंत्रण लिंक बनाएँ';

  @override
  String get permissionChangeOwnNickname => 'अपना उपनाम बदलें';

  @override
  String get permissionChangeOwnNicknameDescription => 'अपना उपनाम अपडेट करें।';

  @override
  String get permissionManageNicknames => 'उपनाम प्रबंधित करें';

  @override
  String get permissionManageNicknamesDescription =>
      'अन्य सदस्यों के उपनाम बदलें।';

  @override
  String get permissionCreateEmojiStickers => 'इमोजी और स्टिकर बनाएँ';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'नए इमोजी और स्टिकर अपलोड करें, और अपनी बनाई चीज़ें मैनेज करें.';

  @override
  String get permissionManageEmojiStickers => 'इमोजी और स्टिकर मैनेज करें';

  @override
  String get permissionManageEmojiStickersDescription =>
      'दूसरे सदस्यों द्वारा बनाए गए इमोजी और स्टिकर को एडिट या डिलीट करें।';

  @override
  String get permissionManageWebhooks => 'वेबहुक प्रबंधित करें';

  @override
  String get permissionManageWebhooksDescription =>
      'वेबहुक बनाएं, एडिट करें या मिटाएं.';

  @override
  String get permissionSendMessages => 'मैसेज भेजें';

  @override
  String get permissionSendTtsMessages => 'TTS मैसेज भेजें';

  @override
  String get permissionSendTtsMessagesDescription =>
      'टेक्स्ट-टू-स्पीच संदेश भेजें।';

  @override
  String get permissionManageMessages => 'मैसेज प्रबंधित करें';

  @override
  String get permissionManageMessagesDescription =>
      'अन्य सदस्यों के मैसेज मिटाएं. पिन करने की सुविधा अलग से कंट्रोल की जाती है.';

  @override
  String get permissionPinMessages => 'मैसेज पिन करें';

  @override
  String get permissionEmbedLinks => 'लिंक एम्बेड करें';

  @override
  String get permissionAttachFiles => 'फ़ाइलें अटैच करें';

  @override
  String get permissionMentionEveryone =>
      '@everyone/@here और @role का उपयोग करें';

  @override
  String get permissionMentionEveryoneDescription =>
      'सभी को या किसी भी भूमिका को मेंशन करें (भले ही भूमिका मेंशन करने योग्य न हो)।';

  @override
  String get permissionUseExternalEmoji => 'बाहरी इमोजी इस्तेमाल करें';

  @override
  String get permissionUseExternalEmojiDescription =>
      'अन्य कम्युनिटी से इमोजी इस्तेमाल करें।';

  @override
  String get permissionUseExternalStickers => 'बाहरी स्टिकर इस्तेमाल करें';

  @override
  String get permissionAddReactions => 'प्रतिक्रियाएं जोड़ें';

  @override
  String get permissionAddReactionsDescription =>
      'मैसेज में नई रिएक्शन जोड़ें।';

  @override
  String get permissionBypassSlowmode => 'स्लोमोड को बायपास करें';

  @override
  String get permissionBypassSlowmodeDescription =>
      'प्रति-चैनल मैसेज रेट लिमिट को अनदेखा करें।';

  @override
  String get permissionTimeOutMembers => 'सदस्यों को टाइम आउट करें';

  @override
  String get permissionTimeOutMembersDescription =>
      'सदस्यों को एक तय समय के लिए मैसेज भेजने, रिएक्शन देने और वॉइस में शामिल होने से रोकें.';

  @override
  String get permissionViewChannel => 'चैनल देखें';

  @override
  String get permissionViewChannelMembers => 'चैनल के सदस्य देखें';

  @override
  String get permissionViewChannelMembersDescription =>
      'इस कम्युनिटी के चैनलों के लिए सदस्यों की सूची देखें।';

  @override
  String get permissionConnect => 'कनेक्ट करें';

  @override
  String get permissionSpeak => 'बोलें';

  @override
  String get permissionStreamVideo => 'वीडियो स्ट्रीम करें';

  @override
  String get permissionUseVoiceActivity => 'वॉइस गतिविधि का इस्तेमाल करें';

  @override
  String get permissionUseVoiceActivityDescription =>
      'इस अनुमति के बिना, पुश-टू-टॉक ज़रूरी है।';

  @override
  String get permissionPrioritySpeaker => 'प्राथमिकता वाला स्पीकर';

  @override
  String get permissionMuteMembers => 'सदस्यों को म्यूट करें';

  @override
  String get permissionDeafenMembers => 'सदस्यों को डीफ़ेन करें';

  @override
  String get permissionMoveMembers => 'सदस्यों को मूव करें';

  @override
  String get permissionMoveMembersDescription =>
      'उन सदस्यों को उन चैनलों के बीच खींचें जहाँ वे पहुँच सकते हैं।';

  @override
  String get permissionSetVoiceRegion => 'वॉइस क्षेत्र सेट करें';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount स्टैटिक, $animatedCount एनिमेटेड इमोजी स्लॉट उपयोग में';
  }

  @override
  String get guildSettingsEmojiEmpty => 'अभी तक कोई कस्टम इमोजी नहीं है।';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count स्टिकर अपलोड किए गए';
  }

  @override
  String get guildSettingsStickersEmpty => 'अभी तक कोई कस्टम स्टिकर नहीं है।';

  @override
  String get guildSettingsModerationVerificationTitle => 'सदस्य सत्यापन';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'चुनें कि सदस्यों को पोस्ट करने या कम्युनिटी के सदस्यों को DM करने से पहले क्या करना होगा।';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'भूमिकाओं वाले सदस्य इन जाँचों को बायपास कर सकते हैं। सार्वजनिक जगहों के लिए, हम सत्यापन चालू करने की सलाह देते हैं।';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'डिस्कवरी में लिस्ट की गई कम्युनिटी के लिए कम से कम वेरिफ़ाइड ईमेल की ज़रूरत होती है. जब तक डिस्कवरी चालू है, तब तक \'कोई नहीं\' को नहीं चुना जा सकता.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'परिपक्व सामग्री और सामग्री चेतावनियाँ';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'सदस्यों के लिए परिपक्व सामग्री लेबलिंग और वैकल्पिक सामग्री चेतावनियाँ कॉन्फ़िगर करें।';

  @override
  String get guildSettingsModerationMatureToggle => 'वयस्क सामग्री';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'इस समुदाय को परिपक्व सामग्री वाला चिह्नित करें।';

  @override
  String get guildSettingsVerificationNone => 'कोई नहीं';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'किसी सत्यापन की आवश्यकता नहीं है।';

  @override
  String get guildSettingsVerificationLow => 'कम';

  @override
  String get guildSettingsVerificationLowDescription =>
      'एक सत्यापित ईमेल पते की आवश्यकता है।';

  @override
  String get guildSettingsVerificationMedium => 'मध्यम';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'एक सत्यापित ईमेल पते और कम से कम 5 मिनट पुराने खाते की आवश्यकता है।';

  @override
  String get guildSettingsVerificationHigh => 'उच्च';

  @override
  String get guildSettingsVerificationHighDescription =>
      'मीडियम में सब कुछ चाहिए, साथ ही कम से कम 10 मिनट के लिए कम्युनिटी का सदस्य होना ज़रूरी है.';

  @override
  String get guildSettingsVerificationHighest => 'बहुत ज़्यादा';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'एक सत्यापित फ़ोन नंबर की आवश्यकता है।';

  @override
  String get guildSettingsAuditLogDescription =>
      'समुदाय में मॉडरेटर की गतिविधियों को ट्रैक करें।';

  @override
  String get guildSettingsAuditLogEmpty => 'अभी तक कोई लॉग नहीं';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'मॉडरेशन ऐक्शन और कम्युनिटी में किए गए बदलाव यहां दिखेंगे.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'सभी यूज़र';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'सभी कार्रवाइयाँ';

  @override
  String get guildSettingsAuditLogNoReason => 'कोई वजह नहीं बताई गई।';

  @override
  String get guildSettingsAuditLogUnknownUser => 'अज्ञात यूज़र';

  @override
  String get guildSettingsAuditLogLoadError =>
      'गतिविधि लॉग लोड करते समय कुछ गलत हो गया।';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'गतिविधि लॉग लोड करने में असमर्थ';

  @override
  String get guildSettingsAuditLogReason => 'वजह';

  @override
  String get guildSettingsAuditLogSomeone => 'कोई';

  @override
  String get guildSettingsAuditLogSomething => 'कुछ';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'अज्ञात इकाई';

  @override
  String get guildSettingsAuditLogNothing => 'कुछ भी नहीं';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'अज्ञात लक्ष्य';

  @override
  String get auditLogActionGuildUpdate => 'समुदाय अपडेट किया गया';

  @override
  String get auditLogActionChannelCreate => 'चैनल बनाया गया';

  @override
  String get auditLogActionChannelUpdate => 'चैनल अपडेट किया गया';

  @override
  String get auditLogActionChannelDelete => 'चैनल मिटा दिया गया';

  @override
  String get auditLogActionChannelOverwriteCreate => 'चैनल ओवरराइट जोड़ा गया';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'चैनल ओवरराइट अपडेट किया गया';

  @override
  String get auditLogActionChannelOverwriteDelete => 'चैनल ओवरराइट हटाया गया';

  @override
  String get auditLogActionMemberKick => 'सदस्य को हटाया गया';

  @override
  String get auditLogActionMemberPrune => 'सदस्य हटाए गए';

  @override
  String get auditLogActionMemberBanAdd => 'सदस्य प्रतिबंधित किया गया';

  @override
  String get auditLogActionMemberBanRemove => 'सदस्य को अनबैन किया गया';

  @override
  String get auditLogActionMemberUpdate => 'सदस्य अपडेट किया गया';

  @override
  String get auditLogActionMemberRoleUpdate => 'सदस्य भूमिकाएं अपडेट की गईं';

  @override
  String get auditLogActionMemberMove => 'सदस्य को ले जाया गया';

  @override
  String get auditLogActionMemberDisconnect => 'सदस्य डिस्कनेक्ट हो गया';

  @override
  String get auditLogActionBotAdd => 'बॉट जोड़ा गया';

  @override
  String get auditLogActionRoleCreate => 'भूमिका बनाई गई';

  @override
  String get auditLogActionRoleUpdate => 'भूमिका अपडेट की गई';

  @override
  String get auditLogActionRoleDelete => 'भूमिका हटाई गई';

  @override
  String get auditLogActionInviteCreate => 'आमंत्रण बनाया गया';

  @override
  String get auditLogActionInviteUpdate => 'आमंत्रण अपडेट किया गया';

  @override
  String get auditLogActionInviteDelete => 'आमंत्रण हटाया गया';

  @override
  String get auditLogActionWebhookCreate => 'वेबहुक बनाया गया';

  @override
  String get auditLogActionWebhookUpdate => 'वेबहुक अपडेट किया गया';

  @override
  String get auditLogActionWebhookDelete => 'वेबहुक हटा दिया गया';

  @override
  String get auditLogActionEmojiCreate => 'इमोजी बनाया गया';

  @override
  String get auditLogActionEmojiUpdate => 'इमोजी अपडेट किया गया';

  @override
  String get auditLogActionEmojiDelete => 'इमोजी हटाई गई';

  @override
  String get auditLogActionStickerCreate => 'स्टिकर बनाया गया';

  @override
  String get auditLogActionStickerUpdate => 'स्टिकर अपडेट किया गया';

  @override
  String get auditLogActionStickerDelete => 'स्टिकर मिटाया गया';

  @override
  String get auditLogActionMessageDelete => 'मैसेज मिटाया गया';

  @override
  String get auditLogActionMessageBulkDelete => 'मैसेज हटाए गए';

  @override
  String get auditLogActionMessagePin => 'मैसेज पिन किया गया';

  @override
  String get auditLogActionMessageUnpin => 'मैसेज अनपिन किया गया';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor ने कम्युनिटी सेटिंग अपडेट कीं.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor ने चैनल $target बनाया।';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor ने चैनल $target को अपडेट किया।';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor ने चैनल $target हटा दिया।';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor ने $target के लिए चैनल अनुमतियाँ जोड़ीं।';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ने $channel में $target के लिए चैनल अनुमतियाँ जोड़ीं।';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor ने $target के लिए चैनल अनुमतियाँ अपडेट कीं।';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ने $channel में $target के लिए चैनल अनुमतियाँ अपडेट कीं।';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor ने $target के लिए चैनल अनुमतियाँ हटा दीं।';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ने $channel में $target के लिए चैनल अनुमतियाँ हटा दीं।';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor ने $target को किक कर दिया।';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor ने $target को बैन किया।';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor ने $target को अनबैन किया।';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor ने $target को अपडेट किया।';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor ने $target के लिए भूमिकाएँ अपडेट कीं।';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor ने निष्क्रिय सदस्यों को हटा दिया।';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor ने $days दिनों से निष्क्रिय सदस्यों को हटा दिया।';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor ने $target को दूसरे वॉयस चैनल में ले जाया।';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ने $target को $channel में ले जाया।';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor ने $target को वॉयस से डिस्कनेक्ट कर दिया।';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor ने बॉट $target को जोड़ा।';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor ने $target भूमिका बनाई।';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor ने $target की भूमिका अपडेट की।';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor ने $target भूमिका हटा दी।';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor ने $target आमंत्रण बनाया।';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ने $channel के लिए $target आमंत्रण बनाया।';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor ने आमंत्रण $target को अपडेट किया।';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ने $channel के लिए आमंत्रण $target को अपडेट किया।';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor ने $target आमंत्रण हटा दिया।';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ने $channel के लिए $target आमंत्रण हटा दिया।';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor ने वेबहुक $target बनाया।';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor ने वेबहुक $target को अपडेट किया।';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor ने वेबहुक $target हटा दिया।';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor ने $target इमोजी जोड़ा।';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor ने इमोजी $target को अपडेट किया।';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor ने $target इमोजी हटा दिया।';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor ने स्टिकर $target जोड़ा।';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor ने स्टिकर $target को अपडेट किया।';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor ने स्टिकर $target हटा दिया।';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor ने एक संदेश हटा दिया।';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor ने $channel में एक संदेश हटा दिया।';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor ने कई संदेश हटा दिए।';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor ने $count संदेश हटा दिए।';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor ने $channel में कई संदेश हटा दिए।';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor ने $channel में $count संदेश हटा दिए।';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor ने एक संदेश पिन किया।';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor ने $channel में एक संदेश पिन किया।';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor ने एक संदेश अनपिन किया।';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor ने $channel में एक संदेश अनपिन किया।';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor ने $target पर एक ऑडिट कार्रवाई की।';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field को $oldValue से $newValue में अपडेट किया गया।';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '$field को $newValue पर सेट करें।';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field साफ़ किया गया (था $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '$field अपडेट किया गया।';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'समुदाय का नाम बदलकर $name कर दिया गया।';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'कम्युनिटी आइकॉन अपडेट किया गया।';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'चैनल का नाम बदलकर $name कर दिया गया।';
  }

  @override
  String get auditLogChangeClearedTopic => 'विषय साफ़ किया गया।';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return '$topic को अपडेट किया गया।';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'परिपक्व सामग्री सक्षम की गई।';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'परिपक्व सामग्री अक्षम की गई.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'उपनाम को $nickname पर सेट करें।';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return '$nickname निकनेम हटा दिया गया।';
  }

  @override
  String get auditLogChangeMutedMember => 'सदस्य को म्यूट कर दिया गया।';

  @override
  String get auditLogChangeUnmutedMember => 'सदस्य को अनम्यूट किया गया।';

  @override
  String get auditLogChangeDeafenedMember => 'सदस्य को म्यूट कर दिया।';

  @override
  String get auditLogChangeUndeafenedMember => 'सदस्य को अनम्यूट किया गया।';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '$roles जोड़े गए।';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '$roles हटा दिए गए।';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'चैनल: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'मैसेज: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return '$value द्वारा आमंत्रित किया गया।';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# संदेश हटाए गए।',
      one: '# संदेश हटाया गया।',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# सदस्य हटाए गए।',
      one: '# सदस्य हटाया गया।',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'यह आमंत्रण कभी समाप्त नहीं होता है।';

  @override
  String get auditLogOptionTemporaryMembership =>
      'अस्थायी सदस्यता प्रदान करता है।';

  @override
  String get auditLogOptionPermanentMembership =>
      'स्थायी सदस्यता प्रदान करता है।';

  @override
  String get guildSettingsLoadMore => 'और लोड करें';

  @override
  String get guildSettingsLoadingMore => 'लोड हो रहा है...';

  @override
  String get guildSettingsWebhooksDescription =>
      'अपनी कम्युनिटी में कॉन्फ़िगर किए गए सभी वेबहुक देखें और मैनेज करें.';

  @override
  String get guildSettingsWebhooksEmpty => 'कोई वेबहुक नहीं';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'इस समुदाय में अभी तक कोई वेबहुक नहीं है। एक बनाने के लिए $channelSettingsPath पर जाएं।';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'आपको इस समुदाय के वेबहुक देखने और संपादित करने के लिए \"$permission\" अनुमति की आवश्यकता है।';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'वेबहुक लोड नहीं हो पाए';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'वेबहुक लोड करने में कोई समस्या आ गई थी। फिर से कोशिश करें।';

  @override
  String get guildSettingsWebhooksUpdated => 'वेबहुक अपडेट किए गए';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'वेबहुक अपडेट नहीं हो पाए';

  @override
  String get guildSettingsUnknownChannel => 'अज्ञात चैनल';

  @override
  String get guildSettingsCopyUrl => 'URL कॉपी करें';

  @override
  String get guildSettingsCopiedUrl => 'यूआरएल क्लिपबोर्ड पर कॉपी हो गया';

  @override
  String get guildSettingsDeleteWebhook => 'वेबहुक मिटाएं';

  @override
  String get guildSettingsVanityUrlDescription =>
      'अपने सर्वर के लिए एक कस्टम इनवाइट लिंक सेट करें।';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'सेव करें';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'उपयोग';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count उपयोग';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'अपनी कम्युनिटी को डिस्कवरी में लिस्ट करें ताकि दूसरे उसे ढूंढकर जॉइन कर सकें।';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'पर्याप्त सदस्य नहीं हैं';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'आपके समुदाय को डिस्कवरी में सूचीबद्ध होने के लिए कम से कम $count सदस्यों की आवश्यकता है।';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'स्थिति:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'लंबित';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'स्वीकृत';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'खारिज किया गया';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'हटाया गया';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'कारण: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'आपकी कम्युनिटी डिस्कवरी में लिस्ट की गई है। आप नीचे अपनी लिस्टिंग की जानकारी अपडेट कर सकते हैं या इसे हटाने के लिए वापस ले सकते हैं।';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'आपका आवेदन समीक्षा के लिए लंबित है। आप अभी भी अपनी लिस्टिंग का विवरण अपडेट कर सकते हैं या आवेदन वापस ले सकते हैं।';

  @override
  String get guildSettingsDiscoveryCategory => 'श्रेणी';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'वह कैटेगरी चुनें जो आपके समुदाय के लिए सबसे सही हो. आप इसे कभी भी बदल सकते हैं.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'प्राथमिक भाषा';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'आपकी कम्युनिटी के ज़्यादातर लोग जिस भाषा में बात करते हैं. डिस्कवरी के नतीजों को फ़िल्टर करने के लिए इस्तेमाल किया जाता है.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'विवरण';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'बताएं कि आपका समुदाय किस बारे में है';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'विवरण ज़रूरी है।';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'विवरण कम से कम $minLength वर्णों का होना चाहिए।';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'विवरण $maxLength वर्णों से अधिक नहीं होना चाहिए।';
  }

  @override
  String get guildSettingsDiscoveryTags => 'पसंद के टैग';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return '$maxTags टैग आपकी कम्युनिटी को खोजने में लोगों की मदद करते हैं। वे डिस्कवरी सर्च में दिखाई देते हैं।';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'एक टैग जोड़ें और एंटर दबाएँ';

  @override
  String get guildSettingsDiscoveryAddTag => 'जोड़ें';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'टैग हटाएं $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'टैग नहीं जोड़ा जा सका';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'टैग 2 से $maxLength वर्णों के होने चाहिए और उनमें अक्षर और संख्याएँ होनी चाहिए।';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'आप केवल $maxTags टैग तक जोड़ सकते हैं।';
  }

  @override
  String get guildSettingsDiscoveryApply => 'लागू करें';

  @override
  String get guildSettingsDiscoverySave => 'सेव करें';

  @override
  String get guildSettingsDiscoveryWithdraw => 'निकालें';

  @override
  String get guildSettingsDiscoveryApplicationSent => 'डिस्कवरी आवेदन भेजा गया';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'डिस्कवरी लिस्टिंग अपडेट की गई';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'डिस्कवरी आवेदन वापस ले लिया गया';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'आवेदन वापस नहीं लिया जा सका';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'कुछ देर में फिर से कोशिश करें।';

  @override
  String get guildSettingsMembersDescription =>
      'सर्वर के सदस्यों को खोजें और प्रबंधित करें।';

  @override
  String get guildSettingsMembersSearchHint => 'यूज़रनेम या ID से खोजें';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count सदस्य';
  }

  @override
  String get guildMembersRecentTitle => 'हाल के सदस्य';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '$totalCount कुल सदस्यों में से $displayedCount दिखाए जा रहे हैं';
  }

  @override
  String get guildMembersSort => 'क्रमबद्ध करें';

  @override
  String get guildSettingsMembersSortNewest => 'सबसे नया पहले';

  @override
  String get guildMembersSortOldest => 'सबसे पुराना पहले';

  @override
  String get guildMembersColumnName => 'नाम';

  @override
  String get guildMembersColumnMemberSince => 'सदस्य जब से';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return '$productName से जुड़े';
  }

  @override
  String get guildMembersColumnJoinMethod => 'शामिल होने का तरीका';

  @override
  String get guildMembersColumnRoles => 'भूमिकाएँ';

  @override
  String get guildMembersColumnActions => 'कार्यवाहियां';

  @override
  String get guildMembersFilterMemberSince => 'सदस्यता के अनुसार फ़िल्टर करें';

  @override
  String get guildMembersFilterJoinedProduct =>
      'खाता बनाने की तारीख के अनुसार फ़िल्टर करें';

  @override
  String get guildMembersFilterJoinMethod =>
      'शामिल होने के तरीके से फ़िल्टर करें';

  @override
  String get guildMembersFilterRoles => 'भूमिकाओं के अनुसार फ़िल्टर करें';

  @override
  String get guildMembersFilterAll => 'सभी';

  @override
  String get guildMembersFilterPast1Hour => 'पिछले 1 घंटे में';

  @override
  String get guildMembersFilterPast24Hours => 'पिछले 24 घंटे';

  @override
  String get guildMembersFilterPast7Days => 'पिछले 7 दिन';

  @override
  String get guildMembersFilterPast2Weeks => 'पिछले 2 हफ़्ते';

  @override
  String get guildMembersFilterPast3Weeks => 'पिछले 3 हफ़्ते';

  @override
  String get guildMembersFilterPast4Weeks => 'पिछले 4 हफ़्ते';

  @override
  String get guildMembersFilterPast3Months => 'पिछले 3 महीने';

  @override
  String get guildMembersFilterCustomRange => 'कस्टम रेंज...';

  @override
  String get guildMembersDateRangeTitle => 'पसंदीदा तारीख की सीमा';

  @override
  String get guildMembersDateAfter => 'इस तारीख के बाद';

  @override
  String get guildMembersDateBefore => 'इस तारीख से पहले';

  @override
  String get guildMembersClearAll => 'सभी हटाएँ';

  @override
  String get guildMembersRowsPerPage => 'प्रति पेज पंक्तियां';

  @override
  String get guildMembersEmptySearch => 'इस खोज से कोई मेल नहीं खाता।';

  @override
  String get guildMembersLoadError =>
      'सदस्यों को लोड करने में कुछ गड़बड़ हो गई। बाद में फिर से कोशिश करें।';

  @override
  String get guildMembersIndexing => 'सदस्यों को इंडेक्स किया जा रहा है…';

  @override
  String get guildMembersGoToPage => 'पेज पर जाएं';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'पेज $page पर जाएं';
  }

  @override
  String get guildMembersJumpToPage => 'पेज पर जाएं';

  @override
  String get guildMembersJoinSourceCreator => 'कम्युनिटी बनाने वाला';

  @override
  String get guildMembersJoinSourceInvite => 'आमंत्रित करें';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'आमंत्रण ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return '$name द्वारा आमंत्रित';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'वैनिटी यूआरएल';

  @override
  String get guildMembersJoinSourceBotInvite => 'बॉट को आमंत्रित करें';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'प्लेटफ़ॉर्म एडमिन';

  @override
  String get guildMembersJoinSourceDiscovery => 'डिस्कवरी';

  @override
  String get guildMembersJoinMethodUnknown => 'अज्ञात';

  @override
  String get guildMembersCommunityOwner => 'कम्युनिटी मालिक';

  @override
  String get guildMembersViewAllRoles => 'सभी भूमिकाएं देखें';

  @override
  String get guildMembersJoinedJustNow => 'अभी';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count मिनट पहले',
      one: '1 मिनट पहले',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count घंटे पहले',
      one: '1 घंटा पहले',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count दिन पहले',
      one: '1 दिन पहले',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'सदस्य';

  @override
  String get guildMembersChannelListSelected => 'सदस्य, चुने गए';

  @override
  String get guildSettingsInvitesTitle => 'आमंत्रण';

  @override
  String get guildSettingsInvitesDescription =>
      'इस कम्युनिटी के सभी इनवाइट देखें. नया इनवाइट बनाने के लिए, किसी चैनल पर जाएं और इनवाइट बटन का इस्तेमाल करें.';

  @override
  String get guildSettingsInvitesEmpty => 'कोई आमंत्रण लिंक नहीं';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'इस कम्युनिटी में अभी कोई इनवाइट लिंक नहीं है. किसी चैनल पर जाकर लोगों को इनवाइट करने के लिए इनवाइट बनाएं.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'आमंत्रण लोड नहीं हो पाए';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'आमंत्रण लोड करने में कोई त्रुटि हुई थी। फिर से कोशिश करें।';

  @override
  String get guildSettingsInvitesTryAgain => 'फिर से कोशिश करें';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'एक्सपायरी डेट की बजाय बनने की तारीख दिखाएं';

  @override
  String get guildSettingsInvitesPauseInvites => 'आमंत्रण रोकें';

  @override
  String get guildSettingsInvitesEnableInvites => 'आमंत्रण चालू करें';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'इस समुदाय के लिए आमंत्रण रोकें';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'इस कम्युनिटी के लिए इनवाइट चालू करें';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'आमंत्रण रोकें? नए उपयोगकर्ता तब तक आमंत्रण लिंक के ज़रिए शामिल नहीं हो पाएँगे, जब तक आप उन्हें फिर से चालू नहीं करते. मौजूदा सदस्यों पर कोई असर नहीं पड़ेगा.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'आमंत्रण चालू करें? उपयोगकर्ता फिर से आमंत्रण लिंक के ज़रिए इस कम्युनिटी में शामिल हो पाएँगे.';

  @override
  String get guildSettingsInvitesPause => 'रोकें';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'इस कम्युनिटी के लिए इनवाइट रोके गए हैं.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return '$productName द्वारा संभावित रेड का पता लगने के कारण इनवाइट रोक दिए गए हैं। नए यूज़र अभी शामिल नहीं हो सकते हैं।';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'आमंत्रित करने वाला:';

  @override
  String get guildSettingsInvitesLabelChannel => 'चैनल:';

  @override
  String get guildSettingsInvitesLabelCode => 'कोड:';

  @override
  String get guildSettingsInvitesLabelUses => 'उपयोग:';

  @override
  String get guildSettingsInvitesLabelCreated => 'बनाया गया:';

  @override
  String get guildSettingsInvitesLabelExpires => 'समाप्ति:';

  @override
  String get guildSettingsInvitesUnknown => 'अज्ञात';

  @override
  String get guildSettingsInvitesNoCategory => 'कोई श्रेणी नहीं';

  @override
  String get guildSettingsInvitesExpired => 'समय-सीमा समाप्त';

  @override
  String get guildSettingsInvitesNever => 'कभी नहीं';

  @override
  String get guildSettingsInvitesCopyLink => 'आमंत्रण लिंक कॉपी करें';

  @override
  String get guildSettingsInvitesRevoke => 'आमंत्रण रद्द करें';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'आमंत्रण रद्द नहीं किया जा सका';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'लिंक अभी भी काम कर सकता है। कुछ देर में फिर से कोशिश करें।';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses उपयोग';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return '$date को समाप्त हो रहा है';
  }

  @override
  String get guildSettingsBansDescription =>
      'बैन किए गए यूज़र देखें और मैनेज करें.';

  @override
  String get guildSettingsBansSearchHint => 'बैन खोजें';

  @override
  String get guildSettingsBansEmpty => 'कोई प्रतिबंधित उपयोगकर्ता नहीं।';

  @override
  String get guildSettingsBanPermanent => 'स्थायी प्रतिबंध';

  @override
  String guildSettingsBanExpires(String date) {
    return '$date को समाप्त हो रहा है';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'समाप्त होगा';

  @override
  String get guildSettingsUnban => 'अनबैन';

  @override
  String get guildSettingsBansLoading => 'बैन किए गए यूज़र लोड हो रहे हैं';

  @override
  String get guildSettingsBansNoSearchResults =>
      'आपकी खोज से मेल खाने वाले कोई प्रतिबंध नहीं मिले।';

  @override
  String get guildSettingsBanDetailsTitle => 'बैन विवरण';

  @override
  String get guildSettingsBanViewDetails => 'विवरण देखें';

  @override
  String get guildSettingsBannedOn => 'इस पर प्रतिबंधित किया गया';

  @override
  String get guildSettingsBannedBy => 'इनके द्वारा प्रतिबंधित किया गया';

  @override
  String get guildSettingsRevokeBanTitle => 'बैन हटाएँ';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'क्या आप वाकई $displayName का बैन हटाना चाहते हैं? वे समुदाय में फिर से शामिल हो पाएंगे।';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '$displayName के लिए प्रतिबंध हटा दिया गया';
  }

  @override
  String get guildSettingsBansLoadError =>
      'बैन लोड नहीं हो सके। दोबारा कोशिश करें।';

  @override
  String get guildSettingsRevokeBanError =>
      'प्रतिबंध हटाने में असमर्थ। पुनः प्रयास करें।';

  @override
  String get guildSettingsCommunitySettings => 'सामुदायिक सेटिंग्स';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewDescription =>
      'अपने समुदाय की प्रोफ़ाइल, चैनल और डिफ़ॉल्ट सेटिंग प्रबंधित करें।';

  @override
  String get guildSettingsOverviewBrandingTitle => 'ब्रांडिंग';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'अपना आइकॉन, नाम, बैनर और इनवाइट बैकग्राउंड अपडेट करें';

  @override
  String get guildSettingsOverviewBannerUpload => 'बैनर अपलोड करें';

  @override
  String get guildSettingsOverviewIdleTitle => 'निष्क्रियता सेटिंग';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'AFK चैनल और टाइमआउट कॉन्फ़िगर करें';

  @override
  String get guildSettingsOverviewSystemTitle => 'सिस्टम और स्वागत';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'सिस्टम और स्वागत संदेशों के लिए गंतव्य चुनें';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'डिफ़ॉल्ट नोटिफ़िकेशन';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      '250 से ज़्यादा लोगों वाले कम्युनिटी में \"सिर्फ़ मेंशन\" सेटिंग लागू होती है. आपकी ओरिजनल सेटिंग सेव कर ली गई है और कम्युनिटी के सदस्यों की संख्या 250 से कम होने पर उसे वापस लागू कर दिया जाएगा.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'एडवांस';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'टेक्स्ट चैनल के नामों को लचीला रखें';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'कम्युनिटी मालिक का क्राउन छिपाएं';

  @override
  String get guildSettingsOverviewDetachedBanner => 'हटाया गया बैनर';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'समुदाय हेडर के नीचे बैनर को उसके अपने सेक्शन में दिखाता है।';

  @override
  String get guildSettingsOverviewUploadIcon => 'आइकॉन अपलोड करें';

  @override
  String get guildSettingsOverviewRemoveImage => 'हटाएँ';

  @override
  String get guildSettingsOverviewSplashTitle => 'आमंत्रण बैकग्राउंड';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'चैट एम्बेड बैकग्राउंड';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'चैट में आमंत्रण एम्बेड में दिखाया गया।';

  @override
  String get guildSettingsOverviewUploadBackground => 'बैकग्राउंड अपलोड करें';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'कोई कम्युनिटी बैनर नहीं';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'कोई आमंत्रण बैकग्राउंड नहीं';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'प्रीव्यू';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'देखें कि आपका न्योता मेहमानों को कैसा दिखता है.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'टेक्स्ट चैनल के नाम';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'कम्युनिटी मालिक का क्राउन';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'समुदाय के मालिक के बगल में क्राउन आइकन दिखाया जाए या नहीं, इसे कॉन्फ़िगर करें';

  @override
  String get guildSettingsSplashCardAlignment => 'कार्ड संरेखण';

  @override
  String get guildSettingsSplashAlignmentCenter => 'बीच में';

  @override
  String get guildSettingsSplashAlignmentLeft => 'बायां';

  @override
  String get guildSettingsSplashAlignmentRight => 'दाएँ';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'केवल चौड़ी स्क्रीन पर लागू होता है।';

  @override
  String get permissionReadMessageHistory => 'मैसेज हिस्ट्री पढ़ें';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return '$permission के बिना उपयोगकर्ता क्या देख सकते हैं, यह बदलें';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'उन सदस्यों के लिए संदेश इतिहास की सीमा निर्धारित करने के लिए एक समर्पित मोडाल का उपयोग करें जिनके पास $permission अनुमति नहीं है।';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'मैसेज हिस्ट्री थ्रेशोल्ड खोलें';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'मैसेज हिस्ट्री थ्रेशोल्ड';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'मैसेज हिस्ट्री थ्रेशोल्ड चालू करें';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'थ्रेशोल्ड की तारीख';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'इस तारीख के बाद भेजे गए संदेशों को उन सदस्यों द्वारा देखा जा सकता है जिनके पास संदेश इतिहास पढ़ने की अनुमति नहीं है।';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'मैसेज हिस्ट्री थ्रेशोल्ड अपडेट किया गया';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'टेक्स्ट चैनल के नामों में बड़े अक्षरों और स्पेस की अनुमति दें. बंद करने पर नाम केवल हाइफ़न और अंडरस्कोर के साथ छोटे अक्षरों में सीमित हो जाते हैं.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'समुदाय के मालिक के बगल में लगे क्राउन आइकन को सभी जगहों से छिपाता है।';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'एनिमेटेड आइकन के लिए एनिमेटेड आइकन कम्युनिटी फ़ीचर की आवश्यकता होती है।';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'एनिमेटेड बैनर के लिए एनिमेटेड बैनर कम्युनिटी फ़ीचर की आवश्यकता होती है।';

  @override
  String get guildSettingsAfkChannel => 'AFK / निष्क्रिय चैनल';

  @override
  String get guildSettingsAfkChannelHint =>
      'जब सदस्य AFK हों तो उन्हें इस चैनल में ले जाएँ।';

  @override
  String get guildSettingsNoAfkChannel => 'कोई AFK चैनल नहीं';

  @override
  String get guildSettingsAfkTimeout => 'AFK टाइमआउट';

  @override
  String get guildSettingsAfkTimeout1Min => '1 मिनट';

  @override
  String get guildSettingsAfkTimeout5Min => '5 मिनट';

  @override
  String get guildSettingsAfkTimeout15Min => '15 मिनट';

  @override
  String get guildSettingsAfkTimeout30Min => '30 मिनट';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 घंटा';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds सेकंड';
  }

  @override
  String get guildSettingsSystemChannel => 'डेस्टिनेशन चैनल';

  @override
  String get guildSettingsSystemChannelHint =>
      'स्वागत और सिस्टम संदेश यहाँ दिखाई देंगे।';

  @override
  String get guildSettingsNoSystemChannel => 'कोई सिस्टम चैनल नहीं';

  @override
  String get guildSettingsHideJoinMessages => 'शामिल होने के मैसेज छिपाएं';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'गंतव्य चैनल में शामिल होने के संदेशों को दबाता है।';

  @override
  String get guildSettingsDefaultNotifications => 'डिफ़ॉल्ट सूचना सेटिंग';

  @override
  String get guildSettingsNotificationsAll => 'सभी मैसेज';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'सभी संदेशों पर सूचना दें';

  @override
  String get guildSettingsNotificationsMentions => 'सिर्फ़ मेंशन';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'सिर्फ़ मेंशन पर सूचना दें';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. अधिकतम 10MB. न्यूनतम: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. अधिकतम 10MB. न्यूनतम: 960×540px (16:9). चैट में इनवाइट एम्बेड में दिखाया गया है।';

  @override
  String get guildSettingsModerationDescription =>
      'सत्यापन, सामग्री फ़िल्टरिंग और परिपक्व सामग्री सेटिंग्स कॉन्फ़िगर करें।';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'डिस्कवरी में सूचीबद्ध समुदायों के लिए मॉडरेशन के विकल्प सीमित हैं।';

  @override
  String get guildSettingsModerationContentFilterTitle => 'कंटेंट फ़िल्टरिंग';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'परिपक्व सामग्री के लिए चिह्नित नहीं किए गए चैनलों में स्पष्ट सामग्री के लिए संदेशों को स्वचालित रूप से स्क्रीन करें।';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'डिस्कवरी में लिस्ट की गई कम्युनिटी के लिए सभी सदस्यों को स्कैन करना ज़रूरी है. डिस्कवरी चालू होने पर यह सेटिंग बदली नहीं जा सकती.';

  @override
  String get guildSettingsContentFilterOff => 'बंद';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'समुदाय को खुद मॉडरेट करने दें';

  @override
  String get guildSettingsContentFilterNoRole =>
      'बिना भूमिका वाले सदस्यों को फ़िल्टर करें';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'ज़्यादातर कम्युनिटी के लिए सुझाया गया';

  @override
  String get guildSettingsContentFilterAll => 'सभी को फ़िल्टर करें';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'परिवार के अनुकूल जगहों के लिए अधिकतम सुरक्षा';

  @override
  String get guildSettingsModerationMatureOff => 'बंद';

  @override
  String get guildSettingsModerationMatureOn => 'चालू';

  @override
  String get guildSettingsContentWarningToggle => 'कंटेंट की चेतावनी दिखाएं';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'किसी भी चैनल में प्रवेश करने से पहले एक सहमति प्रॉम्प्ट को टॉगल करता है।';

  @override
  String get guildSettingsContentWarningText =>
      'पसंद के मुताबिक चेतावनी टेक्स्ट';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'इसमें संवेदनशील सामग्री है।';

  @override
  String get guildSettingsModeration2faTitle => '2FA ज़रूरी';

  @override
  String get guildSettingsModeration2faDescription =>
      'मॉडरेटर के बैन करने, किक करने, टाइम आउट करने या मैसेज हटाने से पहले उनके लिए दो-फ़ैक्टर ऑथेंटिकेशन ज़रूरी करें.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'मॉडरेशन ऐक्शन के लिए 2FA ज़रूरी करें';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'यह सेटिंग सिर्फ़ कम्युनिटी का मालिक बदल सकता है';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'यह सेटिंग बदलने के लिए अपने अकाउंट पर 2FA एनेबल करें';

  @override
  String get guildSettingsEmojiSearchHint => 'इमोजी खोजें';

  @override
  String get guildSettingsEmojiUploadTitle => 'इमोजी अपलोड करें';

  @override
  String get guildSettingsEmojiSlotsTitle => 'इमोजी स्लॉट';

  @override
  String get guildSettingsEmojiDropZone =>
      'इमोजी फ़ाइलों को यहां खींचें और छोड़ें';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'इमोजी लोड नहीं हो पाए. बाद में फिर से कोशिश करें.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'आपकी खोज से मेल खाने वाले कोई इमोजी नहीं मिले।';

  @override
  String get guildSettingsEmojiNoSlots => 'कोई इमोजी स्लॉट उपलब्ध नहीं';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'आप इमोजी की अधिकतम संख्या तक पहुँच गए हैं। जगह बनाने के लिए कुछ मौजूदा इमोजी हटाएँ।';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'इमोजी नामों में कम से कम 2 अक्षर होने चाहिए और इसमें अक्षर, संख्याएँ और अंडरस्कोर हो सकते हैं। इमोजी $maxSize से कम होने चाहिए। स्थिर छवियों को स्वचालित रूप से 128x128 पिक्सेल आकार में बदला जाता है और संपीड़ित किया जाता है। एनिमेटेड इमोजी और SVG पहले से ही सीमा के भीतर होने चाहिए।';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'इमोजी अपलोड हो रहे हैं';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# इमोजी',
      one: '# इमोजी',
    );
    return '$_temp0 अपलोड हो रहे हैं। इसमें थोड़ा समय लग सकता है।';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'इमोजी अपलोड नहीं हो पाए. फिर से कोशिश करें.';

  @override
  String get guildSettingsEmojiSomeFailedTitle => 'कुछ इमोजी जोड़े नहीं जा सके';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'इन फ़ाइलों की समीक्षा करें और छोटी या सरल छवियों के साथ फिर से कोशिश करें।';

  @override
  String get guildSettingsEmojiRenameTitle => 'इमोजी का नाम बदलें';

  @override
  String get guildSettingsEmojiRenameHint => '2-32 अक्षर, संख्याएं, अंडरस्कोर।';

  @override
  String get guildSettingsEmojiColumnEmoji => 'इमोजी';

  @override
  String get guildSettingsEmojiColumnName => 'नाम';

  @override
  String get guildSettingsEmojiColumnUploader => 'द्वारा अपलोड किया गया';

  @override
  String get guildSettingsEmojiUnknownUploader => 'अज्ञात';

  @override
  String get guildSettingsEmojiDeleteTitle => 'इमोजी मिटाएँ';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'क्या आप :$name: हटाना चाहते हैं? इसे वापस नहीं लाया जा सकता।';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'इस इमोजी को स्टोरेज और CDN से हटाएँ';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'इमोजी का नाम कम से कम 2 वर्णों का होना चाहिए';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'इमोजी का नाम ज़्यादा से ज़्यादा 32 वर्णों का होना चाहिए';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'अमान्य इमोजी नाम';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'इस इमोजी का नाम नहीं बदला जा सका';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'नाम पहले जैसा हो गया है। कृपया कुछ देर बाद फिर से कोशिश करें।';

  @override
  String get guildSettingsEmojiGoneTitle => 'यह इमोजी अब मौजूद नहीं है';

  @override
  String get guildSettingsEmojiGoneBody =>
      'हो सकता है इसे हटा दिया गया हो। नाम को पहले जैसा कर दिया गया है।';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'आप इस इमोजी का नाम नहीं बदल सकते';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'आपके पास इस इमोजी का नाम बदलने की अनुमति नहीं है। नाम को पहले जैसा कर दिया गया है।';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'आप बहुत तेज़ जा रहे हैं';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'कृपया कुछ देर प्रतीक्षा करें और फिर से नाम बदलने का प्रयास करें।';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'यह इमोजी मिटाया नहीं जा सका';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'आप इस इमोजी को हटा नहीं सकते';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'दूसरों को अपने इमोजी क्लोन करने दें';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'चालू होने पर, दूसरे समुदायों के सदस्य आपके कस्टम इमोजी पर इन-ऐप वन-क्लिक \"क्लोन\" शॉर्टकट का इस्तेमाल कर सकते हैं। इससे उन्हें इमेज सेव करने और उसे खुद अपलोड करने से नहीं रोका जा सकता।';

  @override
  String get guildSettingsCloneStickerTitle =>
      'दूसरों को अपने स्टिकर क्लोन करने दें';

  @override
  String get guildSettingsCloneStickerDescription =>
      'चालू होने पर, दूसरे समुदायों के सदस्य आपके कस्टम स्टिकर पर इन-ऐप वन-क्लिक \"क्लोन\" शॉर्टकट का उपयोग कर सकते हैं। यह उन्हें इमेज सेव करने और उसे खुद अपलोड करने से नहीं रोकता है।';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'केवल \"$permission\" अनुमति वाले सदस्य ही इसे बदल सकते हैं।';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'इमोजी क्लोनिंग अपडेट नहीं कर पाए';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'स्टिकर क्लोनिंग अपडेट नहीं कर पाए';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'गैर-एनिमेटेड इमोजी ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'एनिमेटेड इमोजी ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'स्टिकर खोजें';

  @override
  String get guildSettingsStickerSlotsTitle => 'स्टिकर स्लॉट';

  @override
  String get guildSettingsStickerUploadTitle => 'स्टिकर अपलोड करें';

  @override
  String get guildSettingsStickerDropZone =>
      'यहां एक स्टिकर फ़ाइल खींचें और छोड़ें (एक बार में एक)';

  @override
  String get guildSettingsStickerDensity => 'स्टिकर घनत्व';

  @override
  String get guildSettingsStickerDensityCozy => 'आरामदायक';

  @override
  String get guildSettingsStickerDensityCompact => 'छोटा';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'स्टिकर लोड नहीं हो पाए';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'स्टिकर लोड करने में कोई समस्या आ गई थी। फिर से कोशिश करें।';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'आपकी खोज से मेल खाने वाले कोई स्टिकर नहीं मिले।';

  @override
  String get guildSettingsStickersEmptySearch => 'कोई स्टिकर नहीं मिला';

  @override
  String get guildSettingsStickerNoSlots => 'कोई स्टिकर स्लॉट उपलब्ध नहीं हैं';

  @override
  String get guildSettingsStickerSlotsFull =>
      'आप स्टिकर की अधिकतम संख्या तक पहुँच गए हैं। जगह बनाने के लिए कुछ मौजूदा स्टिकर हटाएँ।';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'स्टिकर 320x320 पिक्सेल पर सहेजे जाते हैं और $maxSize से कम होने चाहिए। स्थिर छवियों को स्वचालित रूप से आकार बदला जाता है और संपीड़ित किया जाता है। एनिमेटेड स्टिकर और SVG पहले से ही सीमा के भीतर होने चाहिए।';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'स्टिकर फ़ाइल समर्थित नहीं है';

  @override
  String get guildSettingsStickerAddTitle => 'स्टिकर जोड़ें';

  @override
  String get guildSettingsStickerEditTitle => 'स्टिकर एडिट करें';

  @override
  String get guildSettingsStickerNameLabel => 'नाम';

  @override
  String get guildSettingsStickerNameHint => 'मेरी शानदार स्टिकर';

  @override
  String get guildSettingsStickerDescriptionLabel => 'विवरण';

  @override
  String get guildSettingsStickerDescriptionHint => 'स्टिकर का वर्णन करें';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'टैग ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'टैग जोड़ें';

  @override
  String get guildSettingsStickerTagAdd => 'जोड़ें';

  @override
  String get guildSettingsStickerNameRequired => 'नाम ज़रूरी है';

  @override
  String get guildSettingsStickerNameTooShort =>
      'नाम कम से कम 2 अक्षरों का होना चाहिए';

  @override
  String get guildSettingsStickerNameTooLong =>
      'नाम 30 अक्षरों या उससे कम का होना चाहिए';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'विवरण 500 वर्णों या उससे कम का होना चाहिए';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'यह स्टिकर नहीं बनाया जा सका';

  @override
  String get guildSettingsStickerTooLargeTitle => 'स्टिकर बहुत बड़ा है';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'स्टिकर को पर्याप्त कंप्रेस नहीं किया जा सका';

  @override
  String get guildSettingsStickerDeleteTitle => 'स्टिकर मिटाएं';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '\"$name\" को हटा दें? इसे वापस नहीं लाया जा सकता।';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'इस स्टिकर को स्टोरेज और CDN से हटाएँ';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'इस स्टिकर को डिलीट नहीं किया जा सका';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'आप यह स्टिकर डिलीट नहीं कर सकते';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'वेबहुक बनाने के लिए, $channelSettingsPath खोलें। आप यहां सभी मौजूदा वेबहुक को संपादित और व्यवस्थित कर सकते हैं।';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'जब तक कम से कम एक चैनल सभी के लिए दिखाई न दे, तब तक आपका वैनिटी यूआरएल काम नहीं करेगा।';

  @override
  String get guildSettingsVanityUrlRemove => 'हटाएँ';

  @override
  String get guildSettingsBannedUsersTitle => 'बैन किए गए यूज़र';

  @override
  String get guildSettingsInvitesTableInviter => 'आमंत्रक';

  @override
  String get guildSettingsInvitesTableChannel => 'चैनल';

  @override
  String get guildSettingsInvitesTableCode => 'कोड';

  @override
  String get guildSettingsInvitesTableUses => 'उपयोग करता है';

  @override
  String get guildSettingsInvitesTableCreated => 'बनाया गया';

  @override
  String get guildSettingsInvitesTableExpires => 'समाप्त होगा';

  @override
  String get guildSettingsAuditLogFilterUser =>
      'उपयोगकर्ता के अनुसार फ़िल्टर करें';

  @override
  String get guildSettingsAuditLogFilterAction =>
      'कार्रवाई के अनुसार फ़िल्टर करें';

  @override
  String get createDm => 'DM बनाएँ';

  @override
  String get createGroupDm => 'ग्रुप DM बनाएं';

  @override
  String get createDmNewMessage => 'नया मैसेज';

  @override
  String get createDmSelectFriends => 'दोस्त चुनें';

  @override
  String get createDmChooseFriendsSubtitle =>
      'मैसेज करने के लिए दोस्तों को चुनें.';

  @override
  String get createDmSearchFriends => 'दोस्तों को खोजें';

  @override
  String get createDmNoFriendsFound => 'कोई दोस्त नहीं मिला';

  @override
  String get createDmNoFriendsYet => 'आपके अभी तक कोई दोस्त नहीं हैं';

  @override
  String get createDmClaimToStartDms =>
      'DM शुरू करने के लिए अपना अकाउंट क्लेम करें.';

  @override
  String get createDmVerifyToStartDms =>
      'DM शुरू करने के लिए अपना ईमेल वेरिफ़ाई करें.';

  @override
  String get createDmVerifyYourEmail => 'अपना ईमेल वेरिफाई करें';

  @override
  String get createDmNewGroup => 'नया ग्रुप';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return '$userName के साथ एक नया ग्रुप बनाएं';
  }

  @override
  String get createDmConfirmNewGroup => 'नया ग्रुप कन्फ़र्म करें';

  @override
  String get createDmCreateNewGroup => 'नया ग्रुप बनाएं';

  @override
  String createDmRemoveFriend(String displayName) {
    return '$displayName हटाएं';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'इन यूज़र्स के साथ आपका पहले से एक ग्रुप है. क्या आप सच में एक नया ग्रुप बनाना चाहते हैं? यह भी ठीक है!';

  @override
  String get createDmNoActivityYet => 'अभी कोई गतिविधि नहीं';

  @override
  String get createDmSomeUsersCantBeAdded => 'कुछ यूज़र को जोड़ा नहीं जा सकता';

  @override
  String get createDmCreateWithoutThem => 'उनके बिना बनाएं';

  @override
  String get createDmUnaddableIntro =>
      'इन लोगों को इस ग्रुप DM में नहीं जोड़ा जा सकता:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'शेष $count प्राप्तकर्ता(ओं) के साथ समूह DM बनाएं और बाकी को छोड़ दें?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'ग्रुप DM बनाने के लिए कोई और प्राप्तकर्ता नहीं बचा है।';

  @override
  String get createDmUnaddableUserNotFound => 'उपयोगकर्ता नहीं मिला';

  @override
  String get createDmUnaddableBlocked => 'आप इस यूज़र को मैसेज नहीं कर सकते';

  @override
  String get createDmUnaddableNotFriends => 'आपकी मित्र सूची में नहीं हैं';

  @override
  String get createDmUnaddableGroupDisabled =>
      'ग्रुप DM में शामिल होने की अनुमति नहीं है';

  @override
  String get createDmFailed => 'बातचीत नहीं बना सका। फिर से कोशिश करें।';

  @override
  String get dmListMessagesTitle => 'मैसेज';

  @override
  String get dmListDirectMessagesTitle => 'डायरेक्ट मैसेजेस';

  @override
  String get keybindsSearchShortcuts => 'शॉर्टकट खोजें';

  @override
  String get keybindSectionDefaults => 'डिफ़ॉल्ट';

  @override
  String get keybindSectionMessages => 'मैसेज';

  @override
  String get keybindSectionNavigation => 'नेविगेशन';

  @override
  String get keybindSectionDragAndDrop => 'खींचें और छोड़ें';

  @override
  String get keybindSectionChat => 'चैट';

  @override
  String get keybindSectionVoiceAndVideo => 'वॉइस और वीडियो';

  @override
  String get keybindSectionMisc => 'अन्य';

  @override
  String get keybindActionShowShortcutsList => 'कीबोर्ड शॉर्टकट सूची दिखाएं';

  @override
  String get keybindActionCopyText => 'टेक्स्ट कॉपी करें';

  @override
  String get keybindActionMarkUnread => 'अपठित के रूप में मार्क करें';

  @override
  String get keybindActionFocusTextarea => 'टेक्स्ट एरिया पर फ़ोकस करें';

  @override
  String get keybindActionSwitchCommunities => 'कम्युनिटी के बीच स्विच करें';

  @override
  String get keybindActionSwitchChannels => 'चैनलों के बीच स्विच करें';

  @override
  String get keybindActionHistoryBack => 'देखे गए चैनल इतिहास में पीछे जाएं';

  @override
  String get keybindActionHistoryForward => 'देखे गए चैनल इतिहास में आगे बढ़ें';

  @override
  String get keybindActionJumpUnreadChannels =>
      'न पढ़े हुए चैनलों के बीच स्विच करें';

  @override
  String get keybindActionJumpMentionChannels =>
      'बिना पढ़े चैनलों के बीच स्विच करें जिनमें मेंशन हैं';

  @override
  String get keybindActionJumpCurrentCall => 'मौजूदा कॉल पर जाएं';

  @override
  String get keybindActionToggleLastGuildDms =>
      'पिछली कम्युनिटी और DM के बीच टॉगल करें';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'पिछली कम्युनिटी या DM पर स्विच करें';

  @override
  String get keybindActionNextCommunityOrDms =>
      'अगली कम्युनिटी या DM पर स्विच करें';

  @override
  String get keybindActionGoToDms => 'डायरेक्ट मैसेज पर जाएं';

  @override
  String get keybindActionGoToFirstCommunity => 'पहली कम्युनिटी पर जाएं';

  @override
  String get keybindActionGoToSecondCommunity => 'दूसरी कम्युनिटी पर जाएं';

  @override
  String get keybindActionGoToThirdCommunity => 'तीसरे समुदाय पर जाएं';

  @override
  String get keybindActionGoToFourthCommunity => 'चौथी कम्युनिटी पर जाएं';

  @override
  String get keybindActionGoToFifthCommunity => 'पांचवीं कम्युनिटी पर जाएं';

  @override
  String get keybindActionGoToSixthCommunity => 'छठे समुदाय पर जाएं';

  @override
  String get keybindActionGoToSeventhCommunity => 'सातवीं कम्युनिटी पर जाएं';

  @override
  String get keybindActionGoToEighthCommunity => 'आठवीं कम्युनिटी पर जाएं';

  @override
  String get keybindActionToggleQuickSwitcher => 'क्विक स्विचर टॉगल करें';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'कम्युनिटी बनाएँ या उसमें शामिल हों';

  @override
  String get keybindActionStartDragAndDrop => 'खींचकर छोड़ना शुरू करें';

  @override
  String get keybindActionMove => 'भेजें';

  @override
  String get keybindActionDropItem => 'आइटम छोड़ें';

  @override
  String get keybindActionCancel => 'रद्द करें';

  @override
  String get keybindActionMarkCommunityRead =>
      'कम्युनिटी को पढ़ा गया मार्क करें';

  @override
  String get keybindActionMarkChannelRead => 'चैनल को पढ़ा गया मार्क करें';

  @override
  String get keybindActionStartGroupDm => 'ग्रुप DM शुरू करें';

  @override
  String get keybindActionTogglePinnedMessages => 'पिन किए गए मैसेज टॉगल करें';

  @override
  String get keybindActionToggleInbox => 'इनबॉक्स टॉगल करें';

  @override
  String get keybindActionMarkTopInboxRead =>
      'शीर्ष इनबॉक्स चैनल को पढ़ा गया के रूप में मार्क करें';

  @override
  String get keybindActionMarkAllInboxRead =>
      'सभी इनबॉक्स चैनलों को पढ़ा गया के रूप में मार्क करें';

  @override
  String get keybindActionToggleMemberList =>
      'सदस्य सूची या वॉइस चैट टॉगल करें';

  @override
  String get keybindActionToggleEmojiPicker => 'इमोजी पिकर टॉगल करें';

  @override
  String get keybindActionToggleGifPicker => 'GIF पिकर टॉगल करें';

  @override
  String get keybindActionToggleStickerPicker => 'स्टिकर पिकर टॉगल करें';

  @override
  String get keybindActionScrollChatUp => 'चैट को ऊपर स्क्रोल करें';

  @override
  String get keybindActionScrollChatDown => 'चैट को नीचे स्क्रोल करें';

  @override
  String get keybindActionJumpOldestUnread => 'सबसे पुराने अपठित मैसेज पर जाएं';

  @override
  String get keybindActionFocusComposer => 'टेक्स्ट एरिया पर जाएं';

  @override
  String get keybindActionUploadFile => 'फ़ाइल अपलोड करें';

  @override
  String get keybindActionCopyChannelLink => 'चैनल लिंक कॉपी करें';

  @override
  String get keybindActionToggleSavedMedia => 'सेव की गई मीडिया टॉगल करें';

  @override
  String get keybindActionSendVoiceMessage => 'वॉइस मैसेज भेजें';

  @override
  String get keybindActionAnswerCall => 'इनकमिंग कॉल का जवाब दें';

  @override
  String get keybindActionDeclineCall => 'इनकमिंग कॉल अस्वीकार करें';

  @override
  String get keybindActionStartDmCall => 'किसी DM या ग्रुप में कॉल शुरू करें';

  @override
  String get keybindActionToggleSoundboard => 'साउंडबोर्ड टॉगल करें';

  @override
  String get keybindActionToggleCompactCallView =>
      'कॉम्पैक्ट कॉल व्यू को बड़ा या छोटा करें';

  @override
  String get keybindActionPushToTalkPriority => 'पुश टू टॉक (प्राथमिकता)';

  @override
  String get keybindActionVoiceActivityPriority => 'वॉयस एक्टिविटी प्राथमिकता';

  @override
  String get keybindActionOpenHelp => 'सहायता खोलें';

  @override
  String get keybindActionSearchMessages => 'मैसेज खोजें';

  @override
  String get keybindActionOpenContextMenu => 'संदर्भ मेनू खोलें';

  @override
  String get keybindActionOpenSettings => 'अपनी सेटिंग खोलें';

  @override
  String get keybindActionOpenThemeStudio => 'थीम स्टूडियो पॉपआउट खोलें';

  @override
  String get keybindActionZoomIn => 'ज़ूम इन करें';

  @override
  String get keybindActionZoomOut => 'छोटा करें';

  @override
  String get keybindActionZoomReset => 'ज़ूम रीसेट करें';

  @override
  String get clipboardPasteFailed =>
      'पेस्ट नहीं कर सका। क्लिपबोर्ड खाली था या इस ऐप के लिए ब्लॉक था।';

  @override
  String get homeQuickActionDms => 'DMs';
}
