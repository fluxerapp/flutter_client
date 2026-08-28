// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class FluxerLocalizationsTr extends FluxerLocalizations {
  FluxerLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get reconnectingTitle => 'Bir şeyler ters gitti!';

  @override
  String get reconnectingBody =>
      'Sunucularda bir sorun var.\nBirazdan düzelir!';

  @override
  String get gatewayReconnectingToast => 'Yeniden bağlanılıyor…';

  @override
  String get gatewayConnectedToast => 'Bağlandı';

  @override
  String get sessionExpiredToast =>
      'Oturum süreniz doldu. Lütfen tekrar giriş yapın.';

  @override
  String splashStartupFailed(String error) {
    return 'Başlatma başarısız: $error';
  }

  @override
  String get retry => 'Tekrar Dene';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Bağlantı kesildi';

  @override
  String get splashViewOnStatusPage => 'Durum sayfasında görüntüle';

  @override
  String get splashConnectionIssuesPrompt => 'Bağlantı sorunları mı var?';

  @override
  String get splashStatusPageLink => 'Durum sayfası';

  @override
  String get splashReadIncident => 'Olayı oku';

  @override
  String get splashIncidentHistory => 'Olay geçmişi';

  @override
  String get nagbarLearnMore => 'Learn more';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Maintenance is scheduled for $localizedTime. Expected duration: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Maintenance is in progress. Expected duration: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Maintenance is complete.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hey $displayName, claim your account to prevent losing access.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hey $displayName, please verify your email address.';
  }

  @override
  String get nagbarOpenSettings => 'Open settings';

  @override
  String get systemPermissionSettingsTitle => 'Enable permission';

  @override
  String get systemPermissionSettingsOpenSettings => 'Open settings';

  @override
  String get systemPermissionMicrophoneMessage =>
      'Fluxer doesn\'t have access to your microphone. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionCameraMessage =>
      'Fluxer doesn\'t have access to your camera. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionPhotosMessage =>
      'Fluxer doesn\'t have access to your photo library. You can enable it in your device privacy settings.';

  @override
  String get systemPermissionNotificationsMessage =>
      'Fluxer doesn\'t have permission to send notifications. You can enable it in your device settings.';

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Your subscription failed to renew, but you still have access to $productName perks until $graceDate. Take action now or you\'ll lose all perks.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Your $productName subscription has expired. Renew now to keep your perks.';
  }

  @override
  String get nagbarManageSubscription => 'Manage subscription';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Welcome to $productFullName. Explore your $productName perks and manage your subscription.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'View $productName features';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'You have a new gift code waiting in your gift inventory.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'You have $count new gift codes waiting in your gift inventory.';
  }

  @override
  String get nagbarViewGiftInventory => 'View gift inventory';

  @override
  String get nagbarVisionaryMfa =>
      'Enable two-factor authentication to protect your Visionary account.';

  @override
  String get nagbarEnableMfa => 'Enable 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'We\'ve updated our terms. Please review and accept them to continue.';

  @override
  String get nagbarReviewTerms => 'Review terms';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Join $communityName to chat with the team and stay up to date.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Join $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Enable notifications so you don\'t miss messages and mentions.';

  @override
  String get nagbarEnableNotifications => 'Enable notifications';

  @override
  String get nagbarBillingPortalFailed =>
      'Couldn\'t open the billing portal. Please try again in a moment.';

  @override
  String get welcomeBack => 'Tekrar hoş geldiniz';

  @override
  String get email => 'E-posta';

  @override
  String get emailInvalid => 'Lütfen geçerli bir e-posta adresi girin.';

  @override
  String get password => 'Şifre';

  @override
  String get forgotPassword => 'Şifrenizi mi unuttunuz?';

  @override
  String get logIn => 'Giriş Yap';

  @override
  String get logInWithPasskey => 'Parolana ile giriş yap';

  @override
  String continueWithSso(String provider) {
    return '$provider ile devam et';
  }

  @override
  String get ssoRequired => 'Bu örneğe erişmek için SSO gereklidir.';

  @override
  String get organizationSsoProvider =>
      'Kuruluşunuzun tek oturum açma sağlayıcısıyla giriş yapın.';

  @override
  String get failedToStartSso => 'SSO başlatılamadı';

  @override
  String get ssoCancelled => 'SSO oturumu iptal edildi';

  @override
  String preferSso(String provider) {
    return '$provider ile devam ederek SSO\'yu mu tercih ediyorsunuz?';
  }

  @override
  String get logInViaBrowser => 'Tarayıcı ile giriş yap';

  @override
  String get needAccountPrompt => 'Hesabınız yok mu? ';

  @override
  String get register => 'Kayıt Ol';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'İnsan olduğunuzu doğrulayın';

  @override
  String get captchaDescription =>
      'Bot olmadığınızdan emin olmamız gerekiyor. Lütfen aşağıdaki doğrulamayı tamamlayın.';

  @override
  String get captchaSwitchToHcaptcha =>
      'Sorun mu yaşıyorsunuz? Bunun yerine hCaptcha\'yı deneyin';

  @override
  String get captchaSwitchToTurnstile => 'Bunun yerine Turnstile\'ı deneyin';

  @override
  String get cancel => 'İptal';

  @override
  String get ipAuthCheckEmail => 'E-postanızı kontrol edin';

  @override
  String ipAuthDescription(String email) {
    return 'Bu oturum açmayı yetkilendirmek için bir bağlantı e-postası gönderdik. Lütfen gelen kutunuzu $email için açın.';
  }

  @override
  String get ipAuthConnectionLost => 'Bağlantı kesildi';

  @override
  String get ipAuthConnectionLostDescription =>
      'Yetkilendirme beklenirken bağlantıyı kaybettik. Lütfen tekrar deneyin.';

  @override
  String get ipAuthLinkExpired => 'Oturum açma bağlantısı süresi doldu';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Bu yetkilendirme bağlantısının süresi doldu. Lütfen tekrar giriş yapın.';

  @override
  String get ipAuthResendEmail => 'E-postayı yeniden gönder';

  @override
  String get ipAuthResent => 'Yeniden gönderildi';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}sn';
  }

  @override
  String get back => 'Geri';

  @override
  String get mfaTitle => 'İki faktörlü kimlik doğrulama';

  @override
  String get mfaChooseMethod => 'Bir doğrulama yöntemi seçin';

  @override
  String get mfaMethodTotp => 'Kimlik doğrulama Uygulaması';

  @override
  String get mfaMethodWebauthn => 'Güvenlik Anahtarı / Parolana';

  @override
  String get mfaTotpDescription =>
      'Kimlik doğrulama uygulamanızdan 6 haneli kodu veya yedek kodlarınızdan birini girin.';

  @override
  String get mfaCodeLabel => 'Kod';

  @override
  String get mfaTryAnotherMethod => 'Başka bir yöntemi dene';

  @override
  String get mfaUseSecurityKey =>
      'Bunun yerine güvenlik anahtarı / geçiş anahtarı deneyin';

  @override
  String get accountSelectorTitle => 'Bir hesap seçin';

  @override
  String get accountSelectorDescription =>
      'Devam etmek için bir hesap seçin veya farklı bir tane ekleyin.';

  @override
  String get accountAdd => 'Hesap ekle';

  @override
  String get accountRemove => 'Kaldır';

  @override
  String accountRemoveTitle(String username) {
    return '$username kaldırılıyor';
  }

  @override
  String get accountRemoveDescription =>
      'Bu, bu hesap için kaydedilen oturumu kaldıracaktır.';

  @override
  String get accountRemoveOnlyDescription =>
      'Bu, bu cihazdaki tek kayıtlı hesabı kaldıracaktır.';

  @override
  String get accountExpired => 'Süresi doldu';

  @override
  String accountSessionExpired(String identifier) {
    return '$identifier için oturum süresi doldu. Lütfen tekrar giriş yapın.';
  }

  @override
  String get accountManageTitle => 'Hesapları yönet';

  @override
  String get accountSwitchFailed =>
      'Hesaplar arasında geçiş yapılamadı. Tekrar deneyin.';

  @override
  String get profileTabMenuSwitchAccounts => 'Hesap değiştir';

  @override
  String get statusChangeSheetTitle => 'Durumu ayarla';

  @override
  String get statusOnlineStatusSection => 'Çevrimiçi durumu';

  @override
  String get statusOnline => 'Çevrimiçi';

  @override
  String get statusIdle => 'Boşta';

  @override
  String get statusDnd => 'Rahatsız etmeyin';

  @override
  String get statusInvisible => 'Görünmez';

  @override
  String get statusOffline => 'Çevrimdışı';

  @override
  String get statusUntilIChangeIt => 'Değiştirene kadar';

  @override
  String get statusDontClear => 'Temizleme';

  @override
  String get statusFor10Seconds => '10 saniye boyunca';

  @override
  String get statusClearAfter10Seconds => '10 saniye';

  @override
  String get statusClearAfter15Minutes => '15 dakika';

  @override
  String get statusClearAfter30Minutes => '30 dakika';

  @override
  String get statusClearAfter1Hour => '1 saat';

  @override
  String get statusClearAfter3Hours => '3 saat';

  @override
  String get statusClearAfter4Hours => '4 saat';

  @override
  String get statusClearAfter8Hours => '8 saat';

  @override
  String get statusClearAfter24Hours => '24 saat';

  @override
  String get statusClearAfter3Days => '3 gün';

  @override
  String get statusDndDescription => 'Masaüstünde bildirim almayacaksınız';

  @override
  String get statusInvisibleDescription => 'Çevrimdışı görüneceksiniz';

  @override
  String get customStatusSetTitle => 'Özel durum ayarla';

  @override
  String get customStatusCurrentHint => 'Özel durum';

  @override
  String get customStatusClear => 'Özel durumu temizle';

  @override
  String get customStatusPlaceholder => 'Neler oluyor?';

  @override
  String get customStatusChooseEmoji => 'Emoji seçin';

  @override
  String get customStatusClearAfter => 'Sonra temizle';

  @override
  String get customStatusSave => 'Kaydet';

  @override
  String get accountActive => 'Aktif hesap';

  @override
  String get signOut => 'Oturumu kapat';

  @override
  String get suspendedPermanentTitle => 'Hesap Kalıcı Olarak Askıya Alındı';

  @override
  String get suspendedTemporaryTitle => 'Hesap Askıya Alındı';

  @override
  String get suspendedPermanentDescription =>
      'Hizmet Şartlarımızı ihlal ettiğiniz için hesabınız kalıcı olarak askıya alındı.';

  @override
  String get suspendedTemporaryDescription =>
      'Hesabınız geçici olarak askıya alındı. Askı süresi sona erdiğinde hesabınıza erişebileceksiniz.';

  @override
  String get suspendedIssuedAt => 'Yayınlandı';

  @override
  String get suspendedEndsAt => 'Bitiş';

  @override
  String get suspendedDuration => 'Süre';

  @override
  String get suspendedPermanent => 'Kalıcı';

  @override
  String get suspendedReason => 'Neden';

  @override
  String get suspendedAppealDeadline => 'İtiraz Süresi Sonu';

  @override
  String suspendedDeletionWarning(String date) {
    return '$date tarihinde hesabınızın silinmesi planlanıyor.';
  }

  @override
  String get suspendedRecheck => 'Güncellemeleri Kontrol Et';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return '${seconds}sn Sonra Tekrar Dene';
  }

  @override
  String get suspendedBackToLogin => 'Girişe Dön';

  @override
  String get suspendedAppealTitle => 'İtiraz';

  @override
  String get suspendedAppealHint =>
      'Askıya alınmanızın neden yeniden değerlendirilmesi gerektiğini açıklayın (en az 50 karakter)...';

  @override
  String get suspendedAppealSubmit => 'İtiraz Gönder';

  @override
  String get suspendedAppealPending => 'İncelemede';

  @override
  String get suspendedAppealAccepted => 'İtiraz Kabul Edildi';

  @override
  String get suspendedAppealRejected => 'İtiraz Reddedildi';

  @override
  String get suspendedAppealAcceptedDescription =>
      'İtirazınız kabul edildi ve hesabınız yeniden etkinleştirildi.';

  @override
  String get suspendedSignIn => 'Hesabınıza Giriş Yapın';

  @override
  String get forgotPasswordTitle => 'Şifrenizi mi unuttunuz?';

  @override
  String get forgotPasswordDescription =>
      'E-posta adresinizi girin, size şifrenizi sıfırlamanız için bir bağlantı göndereceğiz.';

  @override
  String get forgotPasswordSubmit => 'Sıfırlama bağlantısı gönder';

  @override
  String get forgotPasswordSentTitle => 'E-postanızı kontrol edin';

  @override
  String get forgotPasswordSentDescription =>
      'E-posta adresinize şifre sıfırlama talimatları gönderdik. Lütfen gelen kutunuzu kontrol edin ve şifrenizi sıfırlamak için bağlantıyı izleyin.';

  @override
  String get forgotPasswordBackToLogin => 'Girişe dön';

  @override
  String get resetPasswordTitle => 'Yeni şifre belirleyin';

  @override
  String get resetPasswordDescription =>
      'Sıfırlama işlemini tamamlamak için aşağıdaki yeni şifrenizi girin.';

  @override
  String get resetPasswordNewPassword => 'Yeni şifre';

  @override
  String get resetPasswordConfirm => 'Yeni şifreyi onayla';

  @override
  String get resetPasswordSubmit => 'Şifreyi sıfırla';

  @override
  String get resetPasswordMismatch => 'Şifreler eşleşmiyor.';

  @override
  String get registerTitle => 'Hesap oluştur';

  @override
  String get registerDisplayName => 'Görünen Ad (İsteğe Bağlı)';

  @override
  String get registerDisplayNameHint => 'İnsanlar size ne diye hitap etmeli?';

  @override
  String get registerUsername => 'Kullanıcı Adı (İsteğe Bağlı)';

  @override
  String get registerUsernameHint =>
      'Rastgele bir kullanıcı adı için boş bırakın';

  @override
  String get registerUsernameTagHint =>
      'Benzersizliği sağlamak için otomatik olarak 4 haneli bir etiket eklenecektir';

  @override
  String get registerDateOfBirth => 'Doğum tarihi';

  @override
  String get registerMonth => 'Ay';

  @override
  String get registerDay => 'Gün';

  @override
  String get registerYear => 'Yıl';

  @override
  String get registerConsent =>
      'Hizmet Şartları ve Gizlilik Politikasını kabul ediyorum';

  @override
  String get registerConsentPrefix => 'Kabul ediyorum';

  @override
  String get registerConsentTerms => 'Hizmet Şartları';

  @override
  String get registerConsentAnd => ' ve ';

  @override
  String get registerConsentPrivacy => 'Gizlilik Politikası';

  @override
  String get registerConfirmPassword => 'Şifreyi Onayla';

  @override
  String get registerSubmit => 'Hesap oluştur';

  @override
  String get registerHaveAccount => 'Zaten hesabınız var mı? ';

  @override
  String get registerPendingApproval =>
      'Your account request is pending approval. You can sign in after an admin approves it.';

  @override
  String get registerClosed =>
      'Registration is currently closed. Use a registration link from an admin to create an account.';

  @override
  String get passkeyNoCredentials =>
      'Bu uygulama için kayıtlı parola anahtarı bulunamadı. Bunun yerine e-posta ve şifre ile giriş yapın.';

  @override
  String get passkeyDeviceNotSupported =>
      'Parola anahtarları bu cihazda desteklenmiyor.';

  @override
  String get passkeyDomainNotAssociated =>
      'Bu uygulama için parola anahtarları yapılandırılmamış. Bunun yerine e-posta ve şifre ile giriş yapın.';

  @override
  String get passkeyTimeout =>
      'Parola anahtarı kimlik doğrulaması zaman aşımına uğradı. Lütfen tekrar deneyin.';

  @override
  String get passkeyNotAvailable =>
      'Bu uygulama için parola anahtarları mevcut değil. Bunun yerine e-posta ve şifre ile giriş yapın.';

  @override
  String get passkeyFailed =>
      'Parola anahtarı kimlik doğrulaması başarısız oldu. Lütfen tekrar deneyin.';

  @override
  String get errorUnableToCreateAccount =>
      'Hesap oluşturulamadı. Lütfen tekrar deneyin.';

  @override
  String get errorUnableToSignIn =>
      'Şu anda giriş yapılamıyor. Lütfen tekrar deneyin.';

  @override
  String get errorInvalidEmailOrPassword => 'Geçersiz e-posta veya parola.';

  @override
  String get errorUnableToSendResetLink =>
      'Sıfırlama bağlantısı gönderilemedi. Lütfen tekrar deneyin.';

  @override
  String get errorUnableToResetPassword =>
      'Parola sıfırlanamadı. Lütfen tekrar deneyin.';

  @override
  String get embedInviteJoin => 'Topluluğa Katıl';

  @override
  String get embedInviteGoTo => 'Topluluğa Git';

  @override
  String embedInviteOnline(String count) {
    return '$count Çevrimiçi';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Üye';
  }

  @override
  String get embedInviteUnknownTitle => 'Bilinmeyen Davetiye';

  @override
  String get embedInviteUnknownSubtitle =>
      'Yeni bir davetiye istemeyi deneyin.';

  @override
  String get embedInviteUnavailable => 'Davetiye Kullanılamıyor';

  @override
  String get embedInviteJoinGroup => 'Join group';

  @override
  String get embedInviteAlreadyJoined => 'Already joined';

  @override
  String get inviteAcceptTitle => 'Katılmaya davet edildiniz';

  @override
  String get inviteAcceptJoinButton => 'Topluluğa Katıl';

  @override
  String get inviteAcceptGoToButton => 'Topluluğa Git';

  @override
  String get inviteAcceptInvitesPaused => 'Davetiyeler Duraklatıldı';

  @override
  String get inviteAcceptNotFoundTitle => 'Davetiye Geçersiz';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Bu davetiye süresi dolmuş veya geçersiz olabilir.';

  @override
  String get invalidDeepLinkTitle => 'Link couldn\'t be opened';

  @override
  String get invalidDeepLinkDescription =>
      'This link may be broken, only available on the web, or you might not have access. Check the link and try again.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Go to home';

  @override
  String get inviteAcceptJoinGroupButton => 'Gruba katıl';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return '$inviterName tarafından bir grup DM\'sine katılmaya davet edildiniz';
  }

  @override
  String get inviteAcceptSomeone => 'biri';

  @override
  String get inviteAcceptEmojiPack => 'Emoji paketi';

  @override
  String get inviteAcceptStickerPack => 'Çıkartma paketi';

  @override
  String get inviteAcceptInstallEmojiPack => 'Emoji paketini yükle';

  @override
  String get inviteAcceptInstallStickerPack => 'Çıkartma paketini yükle';

  @override
  String get inviteAcceptPackInstallNote =>
      'Bu davetiyeyi kabul etmek paketi otomatik olarak yükler.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Kanal Erişimi Reddedildi';

  @override
  String get channelAccessDeniedDescription =>
      'Bu mesajın gönderildiği kanala erişiminiz yok.';

  @override
  String get messageJumpLinkNoAccess => 'Erişim yok';

  @override
  String get okay => 'Tamam';

  @override
  String get embedThemeTitle => 'Paylaşılan tema';

  @override
  String get embedThemeSubtitle => 'Bu istemci özel temaları desteklemiyor.';

  @override
  String get embedThemeUnavailableButton => 'Temalar kullanılamıyor';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (lifetime $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days of $productName',
      one: '1 day of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count weeks of $productName',
      one: '1 week of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months of $productName',
      one: '1 month of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years of $productName',
      one: '1 year of $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'From $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Click to claim your gift!';

  @override
  String get embedGiftAlreadyRedeemed => 'Already redeemed';

  @override
  String get embedGiftClaimAccountHelp =>
      'Claim your account to redeem this gift.';

  @override
  String get embedGiftClaim => 'Claim gift';

  @override
  String get embedGiftClaimed => 'Gift claimed';

  @override
  String get embedGiftClaimAccount => 'Claim account to redeem';

  @override
  String get embedGiftUnknownTitle => 'Unknown gift';

  @override
  String get embedGiftUnknownSubtitle =>
      'This gift code is invalid or already claimed.';

  @override
  String get embedGiftUnavailable => 'Gift unavailable';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Claim your gift to activate your $productName subscription!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'This gift has already been claimed.';

  @override
  String get giftAcceptMaybeLater => 'Maybe later';

  @override
  String get giftRedeemedToast => 'Gift redeemed!';

  @override
  String get giftRedeemInvalidTitle => 'Invalid gift code';

  @override
  String get giftRedeemInvalidMessage =>
      'This code is invalid or already used.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Gift already redeemed';

  @override
  String get giftRedeemAlreadyRedeemedMessage =>
      'This code was already redeemed.';

  @override
  String get giftRedeemNotFoundTitle => 'Gift not found';

  @override
  String get giftRedeemNotFoundMessage => 'This code doesn\'t exist.';

  @override
  String get giftRedeemFailedTitle => 'Failed to redeem gift';

  @override
  String get giftRedeemFailedMessage =>
      'Couldn\'t redeem this gift. Try again.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Can\'t redeem this gift';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary accounts can\'t redeem Plutonium gifts. Copy the link to share it with a friend instead.';

  @override
  String get giftCopyLink => 'Copy gift link';

  @override
  String get privacySettings => 'Gizlilik Ayarları';

  @override
  String get privacyDirectMessages => 'Doğrudan Mesajlar';

  @override
  String get privacyDirectMessagesDescription =>
      'Bu topluluktaki diğer üyelerden doğrudan mesajlara izin ver';

  @override
  String get privacyBotDirectMessages => 'Bot Doğrudan Mesajları';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Bu topluluktaki botların size doğrudan mesaj göndermesine izin ver';

  @override
  String get privacyMutualDmsDisabled =>
      'Topluluk yöneticileri, bu toplulukta yalnızca karşılıklı üyelerden doğrudan mesaj alma özelliğini devre dışı bıraktı.';

  @override
  String get communityDebug => 'Topluluk Hata Ayıklama';

  @override
  String get copiedToClipboard => 'Panoya kopyalandı';

  @override
  String get notificationSettings => 'Bildirim Ayarları';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName Sustur';
  }

  @override
  String get notificationMuteDescription =>
      'Bir topluluğu susturmak, siz etiketlenmediğiniz sürece okunmamış göstergelerin ve bildirimlerin görünmesini engeller';

  @override
  String get notificationCommunitySettings => 'Topluluk Bildirim Ayarları';

  @override
  String get notificationAllMessages => 'Tüm Mesajlar';

  @override
  String get notificationOnlyMentions => 'Yalnızca Bahsedilenler';

  @override
  String get notificationNothing => 'Hiçbir şey';

  @override
  String get notificationSuppressEveryone =>
      '@everyone ve @here etiketlerini bastır';

  @override
  String get notificationSuppressRoles => 'Tüm Rol @bahsetmelerini Engelle';

  @override
  String get notificationMobilePush => 'Mobil Anlık Bildirimler';

  @override
  String get notificationOverrides => 'Bildirim Geçersiz Kılmaları';

  @override
  String get notificationSelectChannel => 'Kanal veya kategori seçin';

  @override
  String get notificationOnlyAtMentions => 'Yalnızca @bahsetmeler';

  @override
  String get notificationMuteChannel => 'Kanalı Sessize Al';

  @override
  String get notificationUnmuteChannel => 'Kanalın Sessizliğini Kaldır';

  @override
  String get notificationUseCategoryDefault => 'Use Category Default';

  @override
  String get notificationUseCommunityDefault => 'Use Community Default';

  @override
  String get notificationNoCategory => 'Kategori Yok';

  @override
  String get dmMarkAsRead => 'Okundu Olarak İşaretle';

  @override
  String get dmMuteConversation => 'DM\'yi Sessize Al';

  @override
  String get dmUnmuteConversation => 'DM\'nin Sessizliğini Kaldır';

  @override
  String get dmPinDm => 'DM\'yi Sabitle';

  @override
  String get dmUnpinDm => 'DM\'nin Sabitlenmesini Kaldır';

  @override
  String get dmAlwaysShowInSidebar => 'Her Zaman Kenar Çubuğunda Göster';

  @override
  String get dmRemoveFromAlwaysShown => 'Her Zaman Gösterilenden Kaldır';

  @override
  String get dmCloseDm => 'DM\'yi Kapat';

  @override
  String get dmCloseDmConfirmTitle => 'DM\'yi Kapat';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '$username ile DM\'nizi kapatmak istediğinizden emin misiniz? Daha sonra her zaman yeniden açabilirsiniz.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Delete your messages in this conversation?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this conversation. This cannot be undone.';

  @override
  String get dmCopyChannelId => 'Kanal Kimliğini Kopyala';

  @override
  String get dmChannelIdCopied => 'Kanal kimliği kopyalandı';

  @override
  String get dmCopyUserId => 'Kullanıcı Kimliğini Kopyala';

  @override
  String get dmUserIdCopied => 'Kullanıcı kimliği kopyalandı';

  @override
  String get dmViewProfile => 'Profili Görüntüle';

  @override
  String get dmVoiceCall => 'Sesli Arama Başlat';

  @override
  String get incomingVoiceCallTitle => 'Gelen sesli arama';

  @override
  String get incomingVoiceCallAccept => 'Kabul Et';

  @override
  String get incomingVoiceCallDecline => 'Reddet';

  @override
  String get incomingVoiceCallLabel => 'Gelen arama';

  @override
  String get incomingVoiceCallIgnore => 'Yoksay';

  @override
  String get directVoiceCallNotEligible =>
      'Bu arama şu anda başlatılamıyor. Bir süre sonra tekrar deneyin.';

  @override
  String get voiceJoinCallFailed =>
      'Bu aramaya bağlanamadık. Bağlantınızı kontrol edin ve tekrar deneyin.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Bu aramaya katılamadık. Bağlantınızı kontrol edin ve tekrar deneyin.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Bu arama sunucuda güncellenemedi. Bağlantınızı kontrol edin ve tekrar deneyin.';

  @override
  String get dmAddNote => 'Not Ekle';

  @override
  String get dmEditGroup => 'Grubu Düzenle';

  @override
  String get dmInviteToCommunity => 'Topluluğa Davet Et';

  @override
  String get dmBlock => 'Engelle';

  @override
  String get dmLeaveGroup => 'Gruptan Ayrıl';

  @override
  String get dmNoCommunitiesAvailable => 'Topluluk mevcut değil';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Üye';
  }

  @override
  String get dmMuteFor15Min => '15 dakika boyunca';

  @override
  String get dmMuteFor30Min => '30 dakika boyunca';

  @override
  String get dmMuteFor1Hour => '1 saat boyunca';

  @override
  String get dmMuteFor3Hours => '3 saat boyunca';

  @override
  String get dmMuteFor4Hours => '4 saat boyunca';

  @override
  String get dmMuteFor8Hours => '8 saat boyunca';

  @override
  String get dmMuteFor24Hours => '24 saat boyunca';

  @override
  String get dmMuteFor3Days => '3 gün boyunca';

  @override
  String get dmMuteForever => 'Tekrar açana kadar';

  @override
  String get dmPinGroupDm => 'Grup DM\'sini Sabitle';

  @override
  String get dmUnpinGroupDm => 'Grup DM\'yi Sabitlemeyi Kaldır';

  @override
  String get dmUnnamedGroup => 'Unnamed group';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName\'s group';
  }

  @override
  String get dmFavoriteDm => 'DM\'yi Favorilere Ekle';

  @override
  String get dmUnfavoriteDm => 'DM\'yi Favorilerden Çıkar';

  @override
  String get dmFavoriteGroupDm => 'Grup DM\'yi Favorilere Ekle';

  @override
  String get dmUnfavoriteGroupDm => 'Grup DM\'yi Favorilerden Çıkar';

  @override
  String get dmChangeFriendNickname => 'Arkadaş Takma Adını Değiştir';

  @override
  String get dmRemoveFriend => 'Arkadaşı Kaldır';

  @override
  String get dmAddFriend => 'Arkadaş Ekle';

  @override
  String get dmAcceptFriendRequest => 'Arkadaşlık İsteğini Kabul Et';

  @override
  String get dmIgnoreFriendRequest => 'Arkadaşlık İsteğini Yoksay';

  @override
  String get dmFriendRequestSent => 'Arkadaşlık İsteği Gönderildi';

  @override
  String get dmUnblock => 'Engellemeyi Kaldır';

  @override
  String get dmDebugUser => 'Kullanıcıyı Hata Ayıkla';

  @override
  String get dmDebugChannel => 'Kanalı Hata Ayıkla';

  @override
  String get dmDebugCategory => 'Ayıklama Kategorisi';

  @override
  String get dmPinned => 'Sabitlenmiş DM';

  @override
  String get dmUnpinned => 'Sabitlenmemiş DM';

  @override
  String get dmMuted => 'Sessize Alınmış DM';

  @override
  String get dmUnmuted => 'Sessizliği Kaldırılmış DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Arkadaşı Kaldır';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '$username adlı arkadaşını kaldırmak istediğinden emin misin?';
  }

  @override
  String get dmBlockConfirmTitle => 'Kullanıcıyı Engelle';

  @override
  String dmBlockConfirmDescription(String username) {
    return '$username adlı kullanıcıyı engellemek istediğinden emin misin? Sana mesaj gönderemeyecek veya arkadaşlık isteği yollayamayacak.';
  }

  @override
  String get dmFriendRequestSentToast => 'Arkadaşlık isteği gönderildi';

  @override
  String get dmFriendRequestFailed => 'Arkadaşlık isteği gönderilemedi';

  @override
  String get dmAcceptFriendRequestFailed => 'Arkadaşlık isteği kabul edilemedi';

  @override
  String get dmRemoveFriendFailed => 'Arkadaş kaldırılamadı';

  @override
  String get dmBlockFailed => 'Kullanıcı engellenemedi';

  @override
  String get dmUnblockFailed => 'Kullanıcının engellemesi kaldırılamadı';

  @override
  String get dmIgnoreFriendRequestFailed => 'Arkadaşlık isteği yoksayılamadı';

  @override
  String get dmAddFriends => 'Arkadaş Ekle';

  @override
  String get addFriendSheetTitle => 'Arkadaş Ekle';

  @override
  String get addFriendUsernameHint => 'KullanıcıAdı#0000';

  @override
  String get addFriendUsernameLabel => 'Arkadaşının kullanıcı adı';

  @override
  String get addFriendSendRequest => 'İstek Gönder';

  @override
  String get addFriendNoUserFound =>
      'Bu kullanıcı adıyla kullanıcı bulunamadı.';

  @override
  String get addFriendInvalidUsername =>
      'Geçerli bir kullanıcı adı girin (KullanıcıAdı#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Arkadaşlık isteği gönderildi';

  @override
  String get addFriendClaimTitle => 'Hesabını doğrula';

  @override
  String get addFriendClaimDescription =>
      'Arkadaşlık isteği göndermek için hesabını doğrula.';

  @override
  String get addFriendVerifyTitle => 'E-postanı doğrula';

  @override
  String get addFriendVerifyDescription =>
      'Arkadaşlık isteği göndermeden önce e-posta adresini doğrulaman gerekiyor.';

  @override
  String get addFriendVerifyEmail => 'E-postayı doğrula';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Gelen arkadaşlık istekleri ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Giden arkadaşlık istekleri ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Gelen arkadaşlık isteği';

  @override
  String get addFriendOutgoingStatus => 'Arkadaşlık isteği gönderildi';

  @override
  String get addFriendViewProfile => 'Profili Görüntüle';

  @override
  String get addFriendAccept => 'Kabul Et';

  @override
  String get addFriendIgnore => 'Yoksay';

  @override
  String get addFriendAcceptTitle => 'Arkadaşlık isteğini kabul et';

  @override
  String get addFriendIgnoreTitle => 'Arkadaşlık isteğini reddet';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '$userName kişisinin arkadaşlık isteğini kabul et?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '$displayName kişisinin arkadaşlık isteğini reddet?';
  }

  @override
  String get addFriendCancelRequest => 'İsteği iptal et';

  @override
  String get addFriendCancelRequestFailed =>
      'Arkadaşlık isteği iptal edilemedi. Lütfen tekrar deneyin.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Şu anda arkadaşlık isteği kabul etmiyor.';

  @override
  String get addFriendUnblockFirst =>
      'Arkadaşlık isteği göndermek için önce engellemeyi kaldırın.';

  @override
  String get addFriendCannotSendToSelf =>
      'Kendinize arkadaşlık isteği gönderemezsiniz.';

  @override
  String get addFriendAlreadyFriends => 'Bu kullanıcıyla zaten arkadaşsınız.';

  @override
  String get addFriendClaimToSend =>
      'Arkadaşlık isteği göndermek için kaydınızı tamamlayın.';

  @override
  String get addFriendVerifyToSend =>
      'Verify your email before sending friend requests.';

  @override
  String get addFriendFriendsListFull =>
      'Your friends list is full, or theirs is. Remove someone and try again.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistem';

  @override
  String get emojiSearchPlaceholder => 'Hayalinizdeki emojiyi bulun';

  @override
  String get emojiSearchEmpty => 'Aradığınız emojiler bulunamadı';

  @override
  String get emojiAutocompleteDefaultLabel => 'Varsayılan emoji';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'This is a default emoji on $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'This emoji is from this community. You can use it everywhere.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'This is a custom emoji from a community.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'This is a custom emoji from a community. Ask the author for an invite to use this emoji.';

  @override
  String get emojiInfoFromHeader => 'This emoji is from';

  @override
  String get emojiInfoDiscoverableCommunity => 'Discoverable community';

  @override
  String get emojiInfoPrivateCommunity => 'Private community';

  @override
  String get emojiInfoVerifiedCommunity => 'Verified community';

  @override
  String get emojiInfoAddToFavorites => 'Add to Favorites';

  @override
  String get emojiInfoRemoveFromFavorites => 'Remove from Favorites';

  @override
  String get emojiFrequentlyUsed => 'Sık Kullanılanlar';

  @override
  String get emojiTabGifs => 'GIF\'ler';

  @override
  String get emojiTabMedia => 'Medya';

  @override
  String get emojiTabStickers => 'Çıkartmalar';

  @override
  String get emojiTabEmojis => 'Emojiler';

  @override
  String get gifPickerSearch => 'GIF ara';

  @override
  String get gifPickerSearchKlipy => 'KLIPY\'de ara';

  @override
  String get gifPickerSearchTenor => 'Tenor\'da ara';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favoriler';

  @override
  String get gifPickerTrending => 'Popüler GIF\'ler';

  @override
  String get gifPickerNoResultsTitle => 'Arama Sonucu Yok';

  @override
  String get gifPickerNoResultsDescription => 'Farklı bir arama terimi deneyin';

  @override
  String get gifPickerLoadFailedTitle => 'GIF\'ler Yüklenemedi';

  @override
  String get gifPickerLoadFailedBody =>
      'Bağlantınızı kontrol edin ve tekrar deneyin.';

  @override
  String get emojiCategoryPeople => 'İnsanlar';

  @override
  String get emojiCategoryNature => 'Doğa';

  @override
  String get emojiCategoryFood => 'Yiyecek & İçecek';

  @override
  String get emojiCategoryActivity => 'Aktiviteler';

  @override
  String get emojiCategoryTravel => 'Seyahat & Yerler';

  @override
  String get emojiCategoryObjects => 'Nesneler';

  @override
  String get emojiCategorySymbols => 'Semboller';

  @override
  String get emojiCategoryFlags => 'Bayraklar';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Plutonium ile $communityCount adet topluluktan $emojiCount adet kilidini açın.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Plutonium Al';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Bunu tekrar gösterme';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count özel emoji',
      one: '1 özel emoji',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count topluluk',
      one: '1 topluluk',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Harici Bağlantı Uyarısı';

  @override
  String get externalLinkWarningLeaving => 'Fluxer\'dan ayrılmak üzeresiniz';

  @override
  String get externalLinkWarningDescription =>
      'Harici bağlantılar tehlikeli olabilir. Lütfen dikkatli olun.';

  @override
  String get externalLinkWarningDestinationUrl => 'Hedef URL:';

  @override
  String get externalLinksSectionTitle => 'Harici Bağlantılar';

  @override
  String get externalLinksSectionDescription =>
      'Harici bağlantı uyarılarının nasıl ele alınacağını yapılandırın.';

  @override
  String get externalLinkWarningTrustPrefix => 'Her zaman güven ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — bu uyarıyı bir dahaki sefere atla';

  @override
  String get externalLinkVisitSite => 'Siteyi Ziyaret Et';

  @override
  String get externalLinkTrustAllLabel => 'Tüm harici bağlantılara güven';

  @override
  String get externalLinkStripTrackingLabel =>
      'URL\'lerden izleme parametrelerini kaldır';

  @override
  String get externalLinkStripTrackingDescription =>
      'Gönderdiğiniz mesajlardaki URL\'lerden izleme parametrelerini (utm_source, fbclid, gclid gibi) otomatik olarak kaldırın. Bağlantıyı başkalarına ulaşmadan temizler.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Tüm harici bağlantılara güvenilsin mi?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Bu, tüm harici bağlantılara güvenecek ve her alan adı için uyarıyı atlayacaktır. Mevcut güvenilen alan adlarınız değiştirilecektir. Bu daha az güvenlidir.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Hepsine Güven';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Tüm bağlantılara güvenilmesin mi?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Harici bağlantı uyarıları tekrar gösterilecektir. Alan adlarını tek tek eklemeniz gerekecektir.';

  @override
  String get externalLinkStopTrustingAllAction =>
      'Tüm Güvenliği Devre Dışı Bırak';

  @override
  String get externalLinkTrustedAllDescription =>
      'Tüm harici bağlantılara güveniliyor. Uyarılar gösterilmeyecektir.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return '$count güvenilen alan adınız var. Harici bağlantıları ziyaret ederken kutuyu işaretleyerek daha fazlasını ekleyin.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Etkinleştirildiğinde, harici bağlantı uyarısı gösterilmeyecektir. Bu daha az güvenlidir.';

  @override
  String get imageFileTooLarge =>
      'Görüntü dosyası çok büyük. Lütfen 10 MB\'tan küçük bir dosya seçin.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Animasyonlu avatarlar Plutonium gerektirir';

  @override
  String get animatedBannersRequirePlutonium =>
      'Animasyonlu bannerlar Plutonium gerektirir';

  @override
  String get animatedAvifNotSupported => 'Animasyonlu AVIF Desteklenmiyor';

  @override
  String get animatedAvifNotSupportedBody =>
      'Animasyonlu AVIF dosyalarını kırpma ve döndürme henüz desteklenmiyor. Devam ederseniz, orijinal biçiminde yüklenecektir.';

  @override
  String get uploadAsIs => 'Olduğu Gibi Yükle';

  @override
  String get croppingAnimatedNotSupported =>
      'Animasyonlu görüntüleri kırpma henüz desteklenmiyor. Orijinal yükleme kullanılacaktır.';

  @override
  String get cropAvatar => 'Avatarı Kırp';

  @override
  String get cropBanner => 'Bannerı Kırp';

  @override
  String get skip => 'Atla';

  @override
  String get crop => 'Kırp';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Kullanıcı Adı\'inizi Değiştirin';

  @override
  String get fluxerTagInputLabel => 'Kullanıcı Adı';

  @override
  String get fluxerTagDescriptionBase =>
      'Kullanıcı adları yalnızca harfleri (a-z, A-Z), sayıları (0-9) ve alt çizgileri içerebilir. Kullanıcı adları büyük/küçük harfe duyarlı değildir.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Kullanıcı adları yalnızca harfleri (a-z, A-Z), sayıları (0-9) ve alt çizgileri içerebilir. Kullanıcı adları büyük/küçük harfe duyarlı değildir. #0000 ile #9999 arasında istediğiniz 4 haneli bir etiket seçebilirsiniz.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Kullanıcı adları yalnızca harfleri (a-z, A-Z), sayıları (0-9) ve alt çizgileri içerebilir. Kullanıcı adları büyük/küçük harfe duyarlı değildir. #0001 ile #9999 arasında istediğiniz 4 haneli bir etiket seçebilirsiniz.';

  @override
  String validationLengthRange(int min, int max) {
    return '$min ile $max karakter arasında';
  }

  @override
  String get validationAllowedChars =>
      'Yalnızca harfler (a-z, A-Z), sayılar (0-9) ve alt çizgiler (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Etiketinizi özelleştirmek veya kullanıcı adınızı değiştirirken onu korumak için Plutonium edinin';

  @override
  String get fluxerTagAlreadyTaken => 'Kullanıcı Adı Zaten Alınmış';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Kullanıcı Adı $username#$discriminator zaten alınmış. Devam etmek, ayırt edicinizi otomatik olarak yeniden oluşturacaktır.';
  }

  @override
  String get customTagIsTemporary => 'Özel Etiket Geçicidir';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Özel 4 haneli etiketiniz yalnızca Plutonium aboneliğiniz aktifken kullanılabilir. Aboneliğiniz $date tarihinde sona erdiğinde, 3 günlük bir ek süreden sonra etiketiniz rastgele atanmış bir sayıya geri dönecektir.';
  }

  @override
  String get customTagTemporaryBody =>
      'Özel 4 haneli etiketiniz yalnızca Plutonium aboneliğiniz aktifken kullanılabilir. Aboneliğiniz sona erdiğinde, 3 günlük bir ek süreden sonra etiketiniz rastgele atanmış bir sayıya geri dönecektir.';

  @override
  String get iUnderstandContinue => 'Anladım, Devam Et';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Bu Kullanıcı Adı\'i kaydederseniz, Plutonium aboneliğiniz sona erdiğinde özel 4 haneli etiketiniz rastgele bir sayıya geri dönecektir. Aboneliğiniz yenilenmezse, etiketin değişmesinden önce 3 günlük bir ek süreniz olacaktır.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Özel 4 haneli etiketiniz (#$discriminator) Plutonium aboneliğiniz aktifken aktiftir. Aboneliğiniz sona ererse veya 3 günlük bir ek süreden sonra yenilenmezse, etiketiniz rastgele bir sayıya geri dönecektir.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      '4 haneli etiketini özelleştir veya kullanıcı adını değiştirirken onu koru';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Plutonium denemeniz $date tarihinde sona eriyor. Özel etiketini korumak ve profilinde bir rozet kazanmak için yükseltme yap.';
  }

  @override
  String get premiumTrialActive =>
      'Plutonium denemesindesiniz. Özel etiketini korumak ve profilinde bir rozet kazanmak için yükseltme yap.';

  @override
  String get fluxerTagUpdated => 'Kullanıcı Adı güncellendi';

  @override
  String get fluxerTagUpdateFailed =>
      'Kullanıcı Adı güncellenemedi. Lütfen tekrar deneyin.';

  @override
  String get continueAction => 'Devam Et';

  @override
  String get profileCustomizationTitle => 'Profil Özelleştirme';

  @override
  String get profileCustomizationDescription =>
      'Profil görünümünüzü düzenleyin ve canlı bir önizleme görün';

  @override
  String get usernameLabel => 'Kullanıcı Adı';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Kullanıcı Adı\'inizi değiştirmek için hesabınızı talep edin';

  @override
  String get changeFluxerTag => 'Kullanıcı Adı\'i Değiştir';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return '4 haneli etiketini (#$discriminator) Plutonium ile istediğin gibi özelleştir';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Kullanıcı adını ve 4 haneli etiketini değiştir';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Özel etiketiniz (#$discriminator), Plutonium aboneliğinize bağlıdır ve süresi dolarsa rastgele bir etikete geri dönecektir.';
  }

  @override
  String get displayNameLabel => 'Görünen Ad';

  @override
  String get pronounsLabel => 'Zamirler';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Avatarı Değiştir';

  @override
  String get removeAvatar => 'Avatarı Kaldır';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maksimum 10MB. Önerilen: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Bannerı Değiştir';

  @override
  String get removeBanner => 'Bannerı Kaldır';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maksimum 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Vurgu Rengi';

  @override
  String get accentColorDescription =>
      'Profilindeki kenarlık ve banner rengini özelleştirir';

  @override
  String get aboutMeLabel => 'Hakkımda';

  @override
  String get aboutMeHelperText =>
      'Bağlantılar, emojiler ve Markdown kullanabilirsin.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Plutonium Rozeti Gizliliği';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Plutonium rozetinin başkalarına nasıl gösterileceğini kontrol et';

  @override
  String get hidePlutoniumBadgeLabel => 'Plutonium rozetini tamamen gizle';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Plutonium rozetini diğer kullanıcılardan tamamen gizle';

  @override
  String get hidePlutoniumPurchaseDate => 'Plutonium satın alma tarihini gizle';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Plutonium satın alma tarihini gizle ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Plutonium\'u ilk satın aldığın tarihi rozetinden kaldır';

  @override
  String get maskVisionaryAsSubscription =>
      'Visionary\'yi abonelik olarak gizle';

  @override
  String get maskVisionaryDescription =>
      'Visionary\'ni normal bir abonelik olarak göster';

  @override
  String get hideVisionaryIdBadge => 'Visionary Kimlik Rozetini Gizle';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Visionary Kimlik Rozetini Gizle (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Visionary Kimlik rozetini kaldır';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Plutonium deneme sürümündesin — aboneliğin $date tarihinde başlıyor';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Deneme sürümün sona erdiğinde aboneliğin otomatik olarak başlayacaktır. İşlem yapmana gerek yok.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Plutonium deneme sürümündesin ve $date tarihinde sona eriyor';
  }

  @override
  String get premiumTrialActiveProfile => 'Plutonium deneme sürümündesin';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maksimum 10MB. Önerilen: 512×512px. Animasyonlu avatarlar (GIF) Plutonium gerektirir.';

  @override
  String get bannerPlutoniumUpsell =>
      'Profilini öne çıkarmak için statik veya animasyonlu bir banner görseliyle özelleştir.';

  @override
  String get getPlutonium => 'Plutonium Al';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Bu platformda henüz uygulama içi satın alımlar mevcut değil. Takipte kalın — yakında!';

  @override
  String get profilePreviewLabel => 'Önizleme';

  @override
  String get profilePreviewMessage => 'Mesaj';

  @override
  String get profilePreviewMemberSince => 'Fluxer Üyeliği';

  @override
  String get unclaimedAccountTitle => 'Talep Edilmemiş Hesap';

  @override
  String get unclaimedAccountDescription =>
      'Hesabın henüz talep edilmedi. E-posta ve şifre olmadan erişimi kaybedebilirsin. Hesabını güvence altına almak için hemen talep et.';

  @override
  String get claimAccount => 'Hesabı Talep Et';

  @override
  String get profileTypeLabel => 'Profil Türü';

  @override
  String get profileTypeGlobal => 'Genel Profil';

  @override
  String get profileTypeGuildDescription =>
      'Topluluğa özel profilini düzenliyorsun. Bu profil yalnızca bu toplulukta görünecek ve genel profilini geçersiz kılacaktır.';

  @override
  String get communityNicknameLabel => 'Topluluk Takma Adı';

  @override
  String get perGuildPremiumUpsellText =>
      'Toplulukları özelleştirmek için Plutonium gerekir. Topluluk takma adı ve zamirleri herkes için ücretsizdir.';

  @override
  String get avatarModeInherit => 'Genel Profilden Kullan';

  @override
  String get avatarModeCustom => 'Özel Görsel Kullan';

  @override
  String get avatarModeUnset => 'Gösterme';

  @override
  String get profileSavedToast => 'Profil güncellendi';

  @override
  String get profileEditButton => 'Profili Düzenle';

  @override
  String get profileNoteLabel => 'Not';

  @override
  String get profileNoteVisibility => '(yalnızca sana görünür)';

  @override
  String get profileNoteEmpty => 'Henüz not yok.';

  @override
  String get sudoTitle => 'Kimliğini Doğrula';

  @override
  String get sudoDescription =>
      'Bu işlem devam etmek için doğrulama gerektirir.';

  @override
  String get sudoAuthenticatorCode => 'Kimlik Doğrulama Kodu';

  @override
  String get sudoMethodPassword => 'Parola';

  @override
  String get sudoMethodTotp => 'Kimlik Doğrulayıcı';

  @override
  String get sudoVerificationFailed =>
      'Doğrulama başarısız. Lütfen tekrar deneyin.';

  @override
  String get securityAccountTitle => 'Hesap';

  @override
  String get securityAccountDescription =>
      'E-posta, parola ve hesap ayarlarını yönet';

  @override
  String get securitySectionTitle => 'Güvenlik';

  @override
  String get securitySectionDescription =>
      'Hesabını iki faktörlü kimlik doğrulama ve parolalarla koru';

  @override
  String get securityLoginEmailSectionTitle => 'E-posta Ayarları';

  @override
  String get securityLoginEmailSectionDescription =>
      'Fluxer\'a giriş yapmak için kullandığın e-posta adresini yönet';

  @override
  String get securityLoginEmailAddressLabel => 'E-posta Adresi';

  @override
  String get securityLoginNoEmailSet => 'E-posta adresi ayarlanmamış';

  @override
  String get securityLoginChangeEmail => 'E-postayı Değiştir';

  @override
  String get securityLoginAddEmail => 'E-posta Ekle';

  @override
  String get securityLoginReveal => 'Göster';

  @override
  String get securityLoginHide => 'Gizle';

  @override
  String get securityLoginPasswordSectionTitle => 'Parola';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Hesabını güvende tutmak için parolanı değiştir';

  @override
  String get securityLoginCurrentPasswordLabel => 'Mevcut Parola';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Son değiştirilme: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Son değiştirilme: Hiçbir zaman';

  @override
  String get securityLoginNoPasswordSet => 'Parola ayarlanmamış';

  @override
  String get securityLoginChangePassword => 'Parolayı Değiştir';

  @override
  String get securityLoginSetPassword => 'Parola Ayarla';

  @override
  String get passwordChangeTitle => 'Parolayı Değiştir';

  @override
  String get passwordChangeIntroDescription =>
      'Parolanı değiştirmeden önce kimliğini doğrulamak için e-posta adresine bir doğrulama kodu göndereceğiz.';

  @override
  String get passwordChangeStart => 'Başlat';

  @override
  String get passwordChangeVerifyTitle => 'E-postanı Doğrula';

  @override
  String get passwordChangeVerifyDescription =>
      'E-posta adresine gönderilen doğrulama kodunu gir.';

  @override
  String get passwordChangeVerificationCode => 'Doğrulama Kodu';

  @override
  String get passwordChangeVerify => 'Doğrula';

  @override
  String get passwordChangeNewPasswordTitle => 'Yeni Parola Ayarla';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Aşağıya yeni parolanı gir.';

  @override
  String get passwordChangeNewPassword => 'Yeni Parola';

  @override
  String get passwordChangeConfirmPassword => 'Yeni Parolayı Onayla';

  @override
  String get passwordChangeSubmit => 'Parolayı Değiştir';

  @override
  String get passwordChangeSuccess => 'Parola değiştirildi';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Parolalar eşleşmiyor';

  @override
  String get passwordChangeInvalidCode => 'Geçersiz veya süresi dolmuş kod';

  @override
  String get emailChangeTitle => 'E-posta Değiştir';

  @override
  String get emailChangeIntroDescription =>
      'E-posta adresinizi değiştirmeden önce kimliğinizi doğrulamak için doğrulama kodları göndereceğiz.';

  @override
  String get emailChangeStart => 'Başlat';

  @override
  String get emailChangeVerifyOriginalTitle => 'Mevcut E-postayı Doğrula';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Mevcut e-posta adresinize gönderilen doğrulama kodunu girin.';

  @override
  String get emailChangeNewEmailTitle => 'Yeni E-posta Gir';

  @override
  String get emailChangeNewEmailDescription =>
      'Kullanmak istediğiniz yeni e-posta adresini girin.';

  @override
  String get emailChangeNewEmailLabel => 'Yeni E-posta';

  @override
  String get emailChangeNewEmailSubmit => 'Doğrulama Kodu Gönder';

  @override
  String get emailChangeVerifyNewTitle => 'Yeni E-postayı Doğrula';

  @override
  String get emailChangeVerifyNewDescription =>
      'Yeni e-posta adresinize gönderilen doğrulama kodunu girin.';

  @override
  String get emailChangeSuccess => 'E-posta değiştirildi';

  @override
  String get emailChangeInvalidCode => 'Geçersiz veya süresi dolmuş kod';

  @override
  String get resend => 'Yeniden Gönder';

  @override
  String resendCountdown(int seconds) {
    return 'Yeniden Gönder (${seconds}s)';
  }

  @override
  String get verificationCode => 'Doğrulama Kodu';

  @override
  String get verify => 'Doğrula';

  @override
  String get enable => 'Etkinleştir';

  @override
  String get disable => 'Devre Dışı Bırak';

  @override
  String get delete => 'Sil';

  @override
  String get save => 'Kaydet';

  @override
  String get securityTfaSectionTitle => 'İki Faktörlü Kimlik Doğrulama';

  @override
  String get securityTfaSectionDescription =>
      'Hesabınıza ek bir güvenlik katmanı ekleyin';

  @override
  String get securityTfaAuthenticatorApp => 'Kimlik Doğrulama Uygulaması';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'İki faktörlü kimlik doğrulama etkinleştirildi';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'İki faktörlü kimlik doğrulama için kod üretmek üzere bir kimlik doğrulama uygulaması kullanın';

  @override
  String get securityTfaBackupCodes => 'Yedek Kodlar';

  @override
  String get securityTfaBackupCodesDescription =>
      'Hesap kurtarma için yedek kodlarınızı görüntüleyin ve yönetin';

  @override
  String get securityTfaViewCodes => 'Kodları Görüntüle';

  @override
  String get securityPasskeysSectionTitle => 'Parola Anahtarları';

  @override
  String get securityPasskeysSectionDescription =>
      'Parolasız oturum açma ve iki faktörlü kimlik doğrulama için parola anahtarlarını kullanın';

  @override
  String get securityPasskeysRegistered => 'Kayıtlı Parola Anahtarları';

  @override
  String get securityPasskeysNone => 'Hiçbir parola anahtarı kayıtlı değil';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'parola anahtarı',
      one: 'parola anahtarı',
    );
    return '$count $_temp0 kayıtlı (en fazla 10)';
  }

  @override
  String get securityPasskeysAdd => 'Parola Anahtarı Ekle';

  @override
  String securityPasskeysAdded(String date) {
    return 'Eklendi: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Son kullanma: $date';
  }

  @override
  String get securityPasskeysRename => 'Yeniden Adlandır';

  @override
  String get securityPasskeysDeleteTitle => 'Parola Anahtarını Sil';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Parola anahtarı \"$name\"yi silmek istediğinizden emin misiniz?';
  }

  @override
  String get securityPasskeyNameTitle => 'Parola Anahtarını Adlandır';

  @override
  String get securityPasskeyNameLabel => 'Parola Anahtarı Adı';

  @override
  String get securityPasskeyNameHint => 'Örn: YubiKey, iPhone, İş Bilgisayarı';

  @override
  String get securityPhoneSectionTitle => 'Telefon Numarası';

  @override
  String get securityPhoneSectionDescription => 'Telefon numaranızı yönetin.';

  @override
  String get securityPhoneLabel => 'Telefon Numarası';

  @override
  String get securityPhoneNone => 'Telefon numarası eklenmemiş.';

  @override
  String get securityPhoneAdd => 'Telefon Ekle';

  @override
  String get securityPhoneRemove => 'Kaldır';

  @override
  String get securityPhoneRemoveTitle => 'Telefon Numarasını Kaldır';

  @override
  String get securityPhoneRemoveDescription =>
      'Telefon numaranızı kaldırmak istediğinizden emin misiniz?';

  @override
  String get securityPhoneRemoved => 'Telefon numarası kaldırıldı';

  @override
  String get securityClaimTitle => 'Güvenlik Özellikleri';

  @override
  String get securityClaimDescription =>
      'İki faktörlü kimlik doğrulama ve parolalar gibi güvenlik özelliklerine erişmek için hesabınızı talep edin.';

  @override
  String get securityVerifyEmailRequired =>
      'İki faktörlü kimlik doğrulama, parolalar veya SMS doğrulaması ayarlamadan önce e-posta adresinizi doğrulamanız gerekir.';

  @override
  String get totpEnableTitle => 'Kimlik Doğrulama Uygulaması Kurulumu';

  @override
  String get totpEnableDescription =>
      'İki faktörlü kimlik doğrulama kodları oluşturmak için QR kodunu kimlik doğrulama uygulamanızla tarayın.';

  @override
  String get totpEnableCodeLabel => 'Kod';

  @override
  String get totpEnableCodeHint =>
      'Kimlik doğrulama uygulamanızdan 6 haneli kodu girin';

  @override
  String get totpEnableSuccess =>
      'İki faktörlü kimlik doğrulama etkinleştirildi';

  @override
  String get totpDisableTitle => 'Kimlik Doğrulama Uygulamasını Kaldır';

  @override
  String get totpDisableDescription =>
      'İki faktörlü kimlik doğrulamayı devre dışı bırakmak için kimlik doğrulama uygulamanızdan 6 haneli kodu girin.';

  @override
  String get totpDisableSuccess =>
      'İki faktörlü kimlik doğrulama devre dışı bırakıldı';

  @override
  String get backupCodesTitle => 'Yedek Kodlar';

  @override
  String get backupCodesWarning =>
      'Kimlik doğrulama uygulamanıza erişimi kaybederseniz ve bu kodlara sahip değilseniz, hesabınızdan kalıcı olarak engellenirsiniz. Şimdi indirin veya kopyalayın ve güvenli bir yere saklayın.';

  @override
  String get backupCodesDownload => 'İndir';

  @override
  String get backupCodesCopy => 'Kopyala';

  @override
  String get backupCodesCopied => 'Yedek kodlar panoya kopyalandı';

  @override
  String get backupCodesAcknowledge =>
      'Yedek kodlarımı indirdim veya kopyaladım ve güvenli bir yere sakladım.';

  @override
  String get backupCodesDone => 'Tamamlandı';

  @override
  String get backupCodesViewTitle => 'Yedek Kodları Görüntüle';

  @override
  String get backupCodesViewDescription =>
      'Yedek kodlarınızı görüntülemeden önce doğrulama gerekebilir.';

  @override
  String get phoneAddTitle => 'Telefon Numarası Ekle';

  @override
  String get phoneAddLabel => 'Telefon Numarası';

  @override
  String get phoneAddHint => 'Telefon numaranızı girin';

  @override
  String get phoneAddFooter =>
      'Telefon numaranızı girin. SMS ile bir doğrulama kodu göndereceğiz.';

  @override
  String get phoneAddSendCode => 'Kodu Gönder';

  @override
  String get phoneVerifyTitle => 'Telefon Numarasını Doğrula';

  @override
  String get phoneVerifyDescription =>
      'Telefon numaranıza gönderilen doğrulama kodunu girin.';

  @override
  String get phoneAddSuccess => 'Telefon numarası eklendi';

  @override
  String get phoneCountryLabel => 'Country';

  @override
  String get phoneSearchCountries => 'Search countries...';

  @override
  String get phoneNumberRequired => 'Phone number is required';

  @override
  String get phoneEnterValidNumber => 'Enter a valid mobile phone number.';

  @override
  String get phoneCannotBeUsed =>
      'This phone number cannot be used. Try another mobile number or contact support.';

  @override
  String get phoneAlreadyUsed =>
      'This phone number has already been used. Try another number or contact support.';

  @override
  String get phoneCodeDidNotWork =>
      'That code didn\'t work. Check it and try again.';

  @override
  String get phoneTooManyAttempts =>
      'Too many attempts. Wait a bit, then try again.';

  @override
  String get phoneSmsUnavailable =>
      'SMS verification is unavailable right now. Try again later or contact support.';

  @override
  String get phoneNotEligible =>
      'Phone verification is not available for this account. Use another method or contact support.';

  @override
  String get phoneCaptchaRequired =>
      'A browser check is required before phone verification. Try again from the sign-in page or contact support.';

  @override
  String get phoneSomethingWentWrong => 'Something went wrong. Try again.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Sending an SMS to this phone number is too expensive, so we need you to send us an SMS instead. You can also contact support to have us lift this requirement from your account.';

  @override
  String get phoneInboundDefaultDescription =>
      'We need you to send us an SMS to verify your phone number.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Open your phone\'s messaging app and create a new text message.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Send the code $code to $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Wait for us to receive your message. This can take a minute.';

  @override
  String get phoneInboundGetNewCode => 'Get new code';

  @override
  String get phoneInboundChallengeCodeLabel => 'Code to send';

  @override
  String get phoneInboundOurNumberLabel => 'Send to';

  @override
  String get requiredActionTitle => 'Account verification required';

  @override
  String get requiredActionIntroGeneric =>
      'Complete the required verification to continue using Fluxer.';

  @override
  String get requiredActionIntroPhone =>
      'Your registration needs an extra anti-spam check before you can continue.';

  @override
  String get requiredActionIntroEmailOrPhone =>
      'Verify your email or phone to continue using Fluxer.';

  @override
  String get requiredActionIntroEmailAndPhone =>
      'Complete the required email and phone verification steps below to continue using Fluxer.';

  @override
  String get requiredActionChooseMethodTitle => 'Choose a verification method';

  @override
  String get requiredActionChooseMethodDescription =>
      'Complete one of the verification paths below to continue using Fluxer.';

  @override
  String get requiredActionUseEmail => 'Use email';

  @override
  String get requiredActionUsePhone => 'Use phone';

  @override
  String get requiredActionCheckEmailTitle => 'Check your email';

  @override
  String get requiredActionCheckEmailDescription =>
      'We sent a verification link to your email address. Open it to continue.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Resend verification email';

  @override
  String get requiredActionVerificationEmailSent =>
      'Verification email sent. Check your inbox.';

  @override
  String get requiredActionSignOut => 'Sign out';

  @override
  String get dangerZoneSectionTitle => 'Tehlike Bölgesi';

  @override
  String get dangerZoneSectionDescription => 'Geri alınamaz ve yıkıcı eylemler';

  @override
  String get dangerZoneDisableTitle => 'Hesabı Devre Dışı Bırak';

  @override
  String get dangerZoneDisableDescription =>
      'Hesabınızı geçici olarak devre dışı bırakın. Daha sonra tekrar giriş yaparak yeniden etkinleştirebilirsiniz.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Hesabınızı devre dışı bırakmak sizi tüm oturumlardan çıkaracaktır. Tekrar giriş yaparak hesabınızı istediğiniz zaman yeniden etkinleştirebilirsiniz.';

  @override
  String get dangerZoneDeleteTitle => 'Hesabı Sil';

  @override
  String get dangerZoneDeleteDescription =>
      'Hesabınızı ve ilgili tüm verileri kalıcı olarak silin. Bu işlem geri alınamaz.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Hesabınızı silmeden önce Plutonium ayarlarından aktif Plutonium aboneliğinizi iptal edin.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Hesap silinemiyor';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Topluluk sahibi olduğunuz sürece hesabınızı silemezsiniz. Önce aşağıdaki toplulukların sahipliğini devredin:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 've $count tane daha';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Sahipliği devretmek için $settingsPath bölümüne gidin ve sahipliği devretme seçeneğini kullanın.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Hesabınızı silmek istediğinizden emin misiniz? Bu işlem hesabınızın kalıcı olarak silinmesini planlayacaktır.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Silme işlemini 14 gün içinde iptal edebilirsiniz';

  @override
  String get dangerZoneDeleteBullet2 =>
      '14 gün sonra hesabınız kalıcı olarak silinecektir';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Silme işlemi tamamlandıktan sonra hesabınıza erişimi geri alamazsınız';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Hesabınız silindikten sonra gönderdiğiniz mesajları silemezsiniz';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Verilerinizi dışa aktarmak veya önce mesajlarınızı silmek istiyorsanız, devam etmeden önce Lütfen Kullanıcı Ayarlarındaki Gizlilik Paneli bölümünü ziyaret edin.';

  @override
  String get claimAccountTitle => 'Hesabınızı Talep Edin';

  @override
  String get claimAccountDescription =>
      'Bir e-posta ve şifre ekleyerek hesabınızı talep edin. Tamamlamadan önce e-postanızı doğrulamak için bir doğrulama kodu göndereceğiz.';

  @override
  String get claimAccountEmailLabel => 'E-posta';

  @override
  String get claimAccountPasswordLabel => 'Parola';

  @override
  String get claimAccountSendCode => 'Kod Gönder';

  @override
  String get claimAccountVerifyDescription =>
      'Doğrulama için gönderdiğimiz kodu e-postanıza girin. Kod onaylandıktan sonra parolanız ayarlanacaktır.';

  @override
  String get claimAccountSuccess => 'Hesap başarıyla alındı';

  @override
  String get importantInformation => 'Önemli bilgiler:';

  @override
  String get genericError => 'Bir hata oluştu';

  @override
  String get networkErrorMessage => 'Something went wrong. Please try again.';

  @override
  String get invalidCode => 'Geçersiz kod';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yıl önce',
      one: '1 yıl önce',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ay önce',
      one: '1 ay önce',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün önce',
      one: '1 gün önce',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saat önce',
      one: '1 saat önce',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dakika önce',
      one: '1 dakika önce',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'az önce';

  @override
  String get authorizedAppsTitle => 'Yetkili Uygulamalar';

  @override
  String get authorizedAppsDescription =>
      'Bu uygulamalara Fluxer hesabınıza erişim izni verilmiştir.';

  @override
  String get authorizedAppsEmptyTitle => 'Yetkili Uygulama Yok';

  @override
  String get authorizedAppsEmptyDescription =>
      'Hesabınıza erişim izni verdiğiniz herhangi bir uygulama bulunmuyor.';

  @override
  String get authorizedAppsLoadError => 'Yetkili Uygulamalar Yüklenemedi';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return '$date tarihinde yetkilendirildi';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Verilen izinler';

  @override
  String get authorizedAppsRevoke => 'İptal Et';

  @override
  String get authorizedAppsRevokeTitle => 'Uygulama erişimini iptal et';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Bu uygulamanın erişimini iptal etmek istediğinizden emin misiniz $appName? Bu uygulama artık hesabınıza erişemeyecek.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Temel profil bilgilerinize (kullanıcı adı, avatar vb.) erişin';

  @override
  String get authorizedAppsScopeEmail => 'E-posta adresinizi görüntüleyin';

  @override
  String get authorizedAppsScopeGuilds =>
      'Üyesi olduğunuz toplulukları görüntüleyin';

  @override
  String get authorizedAppsScopeConnections =>
      'Bağlı hesaplarınızı görüntüleyin';

  @override
  String get authorizedAppsScopeBot =>
      'İstenen izinlerle bir topluluğa bot ekleyin';

  @override
  String get authorizedAppsScopeAdmin => 'Yönetici uç noktalarına erişin';

  @override
  String get privacyPendingDeletionTitle => 'Silme Bekliyor';

  @override
  String get blockedUsersTitle => 'Engellenen Kullanıcılar';

  @override
  String get blockedUsersDescription =>
      'Engellenen kullanıcılar size arkadaşlık isteği gönderemez veya doğrudan mesaj atamaz.';

  @override
  String get blockedUsersEmptyTitle => 'Engellenen Kullanıcı Yok';

  @override
  String get blockedUsersEmptyDescription => 'Henüz kimseyi engellemediniz.';

  @override
  String get blockedUsersLoadError => 'Engellenen Kullanıcılar Yüklenemedi';

  @override
  String get blockedUsersUnblock => 'Engellemeyi Kaldır';

  @override
  String get blockedUsersUnblockTitle => 'Kullanıcı Engellemesini Kaldır';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Kullanıcının engelini kaldırmak istediğinizden emin misiniz $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Fluxer Etiketi Kopyala';

  @override
  String get blockedUsersCopyId => 'Kullanıcı Kimliğini Kopyala';

  @override
  String get userProfileLoadError => 'Profil yüklenemedi';

  @override
  String get userProfileLoading => 'Loading profile';

  @override
  String get userProfileRetry => 'Tekrar Dene';

  @override
  String get userProfileMessage => 'Mesaj';

  @override
  String get userProfileVoiceCall => 'Sesli Arama';

  @override
  String get userProfileVideoCall => 'Görüntülü Arama';

  @override
  String get userProfileEditProfile => 'Profili Düzenle';

  @override
  String get userProfileStaffBadgeTooltip => 'Fluxer Ekibi';

  @override
  String get userProfileCtpBadgeTooltip => 'Fluxer Topluluk Ekibi';

  @override
  String get userProfilePartnerBadgeTooltip => 'Fluxer Partner';

  @override
  String get userProfileBugHunterBadgeTooltip => 'Fluxer Hata Avcısı';

  @override
  String get userProfilePlutoniumBadgeTooltip => 'Fluxer Plutonium';

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(String date) {
    return 'Fluxer Plutonium abonesi $date tarihinden beri';
  }

  @override
  String get userProfileVisionaryBadgeTooltip => 'Fluxer Vizyoner';

  @override
  String userProfileVisionaryBadgeSinceTooltip(String date) {
    return 'Fluxer Vizyoner $date tarihinden beri';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Vizyoner Kimliği #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Ortak Arkadaşlar ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Ortak Topluluklar ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Ortak Arkadaşlar';

  @override
  String get userProfileMutualCommunitiesTitle => 'Ortak Topluluklar';

  @override
  String get userProfileNoMutualFriends => 'Ortak arkadaş bulunamadı.';

  @override
  String get userProfileNoMutualCommunities => 'Ortak topluluk bulunamadı.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Takma ad: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Özel Mesaj Aç';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return '$username kişisini engellediniz. Onları engelini kaldırmadığınız sürece mesaj gönderemezsiniz.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Engeli Kaldır';

  @override
  String get userProfileOpenDm => 'Özel Mesaj Aç';

  @override
  String get userProfileNoteTitle => 'Not';

  @override
  String get userProfileNoteVisibility => '(yalnızca size görünür)';

  @override
  String get userProfileNoteSave => 'Kaydet';

  @override
  String get userProfileNoteDelete => 'Sil';

  @override
  String get userProfileNoteEmpty => 'Not eklemek için tıklayın';

  @override
  String get userProfileMemberSince => 'Üyelik Tarihi';

  @override
  String get userProfileAboutMe => 'Hakkımda';

  @override
  String get userProfileRoles => 'Roles';

  @override
  String get memberRoleAdd => 'Add role';

  @override
  String memberRoleRemove(String roleName) {
    return 'Remove role $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'This user has no roles in this community.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'No roles yet. Add roles in $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'No roles available';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'There are no roles to assign in this community at this time, but you can create a new role in $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Community settings';

  @override
  String get guildSettingsRolesTab => 'Roles';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Yerel Saat';

  @override
  String get userProfileSameTimeAsYou => 'Seninle aynı saat diliminde';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'Senden $duration ileride';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'Senden $duration geride';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours saat',
      one: '1 saat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes dakika',
      one: '1 dakika',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours saat',
      one: '1 saat',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes dakika',
      one: '1 dakika',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Kullanıcı Adını Kopyala';

  @override
  String get userProfileCopyUserId => 'Kullanıcı Kimliğini Kopyala';

  @override
  String get userProfileViewMainProfile => 'Ana Profili Görüntüle';

  @override
  String get userProfileViewCommunityProfile => 'Topluluk Profilini Görüntüle';

  @override
  String get userProfileBlockUser => 'Kullanıcıyı Engelle';

  @override
  String get userProfileUnblockUser => 'Kullanıcının Engelini Kaldır';

  @override
  String get userProfileRemoveFriend => 'Arkadaşlıktan Çıkar';

  @override
  String get userProfileBlockConfirmTitle => 'Kullanıcıyı Engelle';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '$username kişisini engellemek istediğinizden emin misiniz?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Kullanıcının Engelini Kaldır';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '$username kişisinin engelini kaldırmak istediğinizden emin misiniz?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Arkadaşlıktan Çıkar';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return '$username kişisini arkadaşlıktan çıkarmak istediğinizden emin misiniz?';
  }

  @override
  String get userProfileFailedOpenDm => 'Özel Mesaj Açılamadı';

  @override
  String get userProfileFailedSaveNote => 'Not kaydedilemedi';

  @override
  String get userProfileActionFailed =>
      'İşlem başarısız oldu, lütfen tekrar deneyin';

  @override
  String get userProfileChangeNickname => 'Takma adı değiştir';

  @override
  String get userProfileKick => 'At';

  @override
  String get userProfileBan => 'Yasakla';

  @override
  String get userProfileTimeout => 'Süre Aşımı';

  @override
  String get userProfileRemoveTimeout => 'Süre aşımını kaldır';

  @override
  String get userProfileTransferOwnership => 'Sahipliği devret';

  @override
  String get userProfileReportUser => 'Kullanıcıyı Bildir';

  @override
  String get userProfileReportMessage => 'Mesajı Bildir';

  @override
  String userProfileKickConfirmTitle(String username) {
    return '$username kişisini mi atıyorsun?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return '$username kişisini atmak istediğinizden emin misiniz? Yeni bir davetle tekrar katılabilir.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle =>
      'Sürenin kaldırılmasını onayla?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Süreyi kaldırmak, $username kullanıcısının tekrar mesaj göndermesine, tepki vermesine ve sesli kanallara katılmasına izin verecektir.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Sahipliği devret?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Bu topluluğun sahipliğini $username kullanıcısına mı devrediyorsunuz? Bu geri alınamaz ve tüm sahip ayrıcalıklarınızı kaybedersiniz.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return '$username engelle';
  }

  @override
  String get userProfileBanDurationLabel => 'Engelleme süresi';

  @override
  String get userProfileBanCustomSecondsLabel => 'Özel süre (saniye)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return '$min ile $max saniye arasında herhangi bir değer';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Mesaj geçmişini sil';

  @override
  String get userProfileBanDeleteNone => 'Hiçbirini silme';

  @override
  String get userProfileBanDelete24h => 'Son 24 saat';

  @override
  String get userProfileBanDelete7d => 'Son 7 gün';

  @override
  String get userProfileBanReasonLabel => 'Neden (isteğe bağlı)';

  @override
  String get userProfileBanReasonHint => 'Engelleme nedeni girin';

  @override
  String get userProfileBanSubmit => 'Üyeyi engelle';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$username süresi doldu';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Süre dolumu süresi';

  @override
  String get userProfileTimeoutSubmit => 'Üyenin süresini doldur';

  @override
  String get userProfileNicknameLabel => 'Takma ad';

  @override
  String get userProfileNicknameHint => 'Takma ad girin';

  @override
  String get userProfileNicknameSave => 'Kaydet';

  @override
  String userProfileKickSuccess(String username) {
    return '$username atıldı';
  }

  @override
  String userProfileBanSuccess(String username) {
    return '$username engellendi';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return '$username süresi doldu';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return '$username için süre kaldırıldı';
  }

  @override
  String get userProfileNicknameSuccess => 'Takma ad güncellendi';

  @override
  String get userProfileTransferSuccess => 'Sahiplik devredildi';

  @override
  String get durationPermanent => 'Kalıcı';

  @override
  String get duration60Seconds => '60 saniye';

  @override
  String get duration5Minutes => '5 dakika';

  @override
  String get duration10Minutes => '10 dakika';

  @override
  String get duration1Hour => '1 saat';

  @override
  String get duration12Hours => '12 saat';

  @override
  String get duration1Day => '1 gün';

  @override
  String get duration3Days => '3 gün';

  @override
  String get duration5Days => '5 gün';

  @override
  String get duration1Week => '1 hafta';

  @override
  String get duration2Weeks => '2 hafta';

  @override
  String get duration1Month => '1 ay';

  @override
  String get durationCustom => 'Özel...';

  @override
  String get iarReportUserTitle => 'Kullanıcıyı bildir';

  @override
  String get iarReportGuildTitle => 'Report community';

  @override
  String get iarReportGuildPreconfirmBody =>
      'If this report is about a specific message in this community, report that message instead. Message reports give our safety team the clearest context, and adding details in the comments can help us review it faster. Only continue with reporting the community as a whole if reporting a message would not capture the broader issue.';

  @override
  String get iarContinueToReportCommunity => 'Continue to report community';

  @override
  String get iarPreviewCommunitySubtitle => 'Community';

  @override
  String get iarReasonHarassmentGuildLabel => 'Harassment or targeted abuse';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Community facilitates pile-ons or targeted abuse.';

  @override
  String get iarReasonHateGuildDescription =>
      'Promotes hatred against protected groups.';

  @override
  String get iarReasonTerrorismLabel => 'Terrorism or violent extremism';

  @override
  String get iarReasonTerrorismDescription =>
      'Promotes, recruits for, or coordinates violent extremist activity.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Mature content or unsafe gating';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Mature content without proper gating.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Endangers minors or hosts child-exploitation content.';

  @override
  String get iarReasonRaidLabel => 'Raid coordination';

  @override
  String get iarReasonRaidDescription =>
      'Coordinates raids, brigading, or harassment against people or communities.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Community exists to spam, scam, or abuse the platform.';

  @override
  String get iarReasonMalwareGuildLabel => 'Malware distribution';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Distributes malware, credential theft, or harmful files.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Privacy violation or doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Shares personal info, stalks users, or coordinates privacy abuse.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Encourages self-harm';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Encourages suicide, self-harm, or eating disorders.';

  @override
  String get iarReasonInappropriateProfile => 'Uygunsuz profil';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Bu kullanıcının profilinde uygunsuz içerik var';

  @override
  String typingIndicatorOne(String name) {
    return '$name yazıyor...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 ve $name2 yazıyor...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 ve $name3 yazıyor...';
  }

  @override
  String get typingIndicatorMultiple => 'Birkaç kişi yazıyor...';

  @override
  String get typingIndicatorHandful =>
      'Bir avuç klavye savaşçısı toplanıyor...';

  @override
  String get typingIndicatorSymphony =>
      'Bir tuş tıkırtısı senfonisi başlıyor...';

  @override
  String get typingIndicatorFiesta => 'Burada tam bir yazma şenliği var';

  @override
  String get typingIndicatorApocalypse =>
      'Vay canına, bir yazma kıyameti yaşanıyor';

  @override
  String systemJoinGladYoureHere(String username) {
    return '$username, burada olduğun için mutluyuz!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Hoş geldin, $username! Kendine ait hisset.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Merhaba, $username! Burada olman güzel.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Merhaba, $username! Hazır olduğunda sohbete katılabilirsin.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hey $username, seni burada görmek harika!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hey $username! Umarım burada kalışından keyif alırsın.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hey, $username, aramıza hoş geldin!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Geldiğine sevindik, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Hoş geldin, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Hoş geldin, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Hoş geldin, $username! Burada olmandan mutluyuz.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Hoş geldin, $username! Umarım burada geçireceğin zamandan keyif alırsın.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Hoş geldin, $username! Bir sonraki sohbetin burada başlıyor.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Hoş geldin, $username. Burada olmandan mutluyuz.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Seni görmek harika, $username! Hoş geldin.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Buradasın, $username! Seninle birlikte olmamız güzel.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Geldin, $username! Başlayalım.';
  }

  @override
  String get relativeTimeShortNow => 'şimdi';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}d',
      one: '1d',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}s',
      one: '1s',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}g',
      one: '1g',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}a',
      one: '1a',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}y',
      one: '1y',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Cihazlarım';

  @override
  String get linkedDevicesDescription =>
      'Hesabına giriş yapmış tüm cihazları gör. Tanımadığın oturumları kapat.';

  @override
  String get linkedDevicesCurrentDevice => 'Mevcut Cihaz';

  @override
  String get linkedDevicesOtherDevices => 'Diğer Cihazlar';

  @override
  String get linkedDevicesEnterSelection => 'Seçim Moduna Gir';

  @override
  String get linkedDevicesExitSelection => 'Seçim Modundan Çık';

  @override
  String get linkedDevicesSelectAll => 'Tümünü Seç';

  @override
  String get linkedDevicesClearSelection => 'Seçimi Temizle';

  @override
  String get linkedDevicesRevokeTooltip => 'Cihazı kapat';

  @override
  String get linkedDevicesSignOutAll => 'Diğer tüm cihazlardan çıkış yap';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cihazdan çıkış yap',
      one: '1 cihazdan çıkış yap',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cihazdan çıkış yap',
      one: '1 cihazdan çıkış yap',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Diğer tüm cihazlardan çıkış yap';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bu, seçilen cihazları hesabından çıkaracaktır. O cihazlarda tekrar giriş yapman gerekecek.',
      one:
          'Bu, seçilen cihazı hesabından çıkaracaktır. O cihazda tekrar giriş yapman gerekecek.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Bu, seçilen cihazları hesabından çıkaracaktır. O cihazlarda tekrar giriş yapman gerekecek.';

  @override
  String get linkedDevicesSignOutConfirm => 'Devam et';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Çıkış yapılan tüm cihazlarda tekrar oturum açman gerekecek';

  @override
  String get linkedDevicesLoadErrorTitle => 'Ağ Hatası';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Zaman-mekan sürekliliğine bağlanmakta sorun yaşıyoruz. Lütfen bağlantını kontrol et ve tekrar dene.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Cihazlar kapatıldı',
      one: 'Cihaz kapatıldı',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Çıkış yapılamadı. Tekrar dene.';

  @override
  String get linkedDevicesUnknownOs => 'Bilinmeyen İşletim Sistemi';

  @override
  String get linkedDevicesUnknownPlatform => 'Bilinmeyen Platform';

  @override
  String slowmodeLabel(String duration) {
    return '$duration yavaş mod';
  }

  @override
  String get slowmodeTooltipActive =>
      'Yavaş moddasın. Lütfen başka bir mesaj göndermeden önce bekle.';

  @override
  String get slowmodeTooltipImmune => 'Yavaş mod etkin, ancak muafiyetin var.';

  @override
  String get slowmodeStatusEnabled => 'Slowmode is enabled';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Slowmode is active ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Slowmode is set to $durationLabel, but you are immune.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Slowmode is set to $durationLabel. Wait before sending another message.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Slowmode is set to $durationLabel for this channel.';
  }

  @override
  String get channelNoSendPermissionHint => 'Bu kanala mesaj gönderemezsin.';

  @override
  String systemDmComposerBarrier(String productName) {
    return '$productName personelinden sistem duyuruları. Buraya yanıt veremezsin.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Bu toplulukta mesajlaşma geçici olarak duraklatıldı.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Süren doldu. Süren dolana kadar mesajlaşma, tepkiler ve sesli iletişim duraklatıldı.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Bu toplulukta mesaj göndermek için hesabını doğrulaman gerekiyor.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Bu toplulukta mesaj göndermek için e-postanı doğrulaman gerekiyor.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Bu toplulukta mesaj göndermek için hesabın çok yeni.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Mesaj gönderebilmek için bu topluluğun üyesi olalı yeterli süre geçmedi.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Bu toplulukta mesaj göndermek için bir telefon numarası doğrulaman gerekiyor.';

  @override
  String get channelComposerBarrierVerifyEmail => 'E-postayı doğrula';

  @override
  String get channelComposerBarrierVerifyPhone => 'Telefonu doğrula';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Çok fazla dosya (en fazla $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName boyut sınırını aşıyor ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Bu dosyalar birlikte gönderilemeyecek kadar büyük';

  @override
  String get chatAttachmentDropToUpload =>
      'Yüklemek için dosyaları buraya sürükle';

  @override
  String get chatAttachmentDropToSend =>
      'Şimdi göndermek için dosyaları buraya sürükle';

  @override
  String get chatAttachmentSendVoiceMessage => 'Sesli mesaj gönder';

  @override
  String get voiceMessageTitle => 'Sesli mesaj';

  @override
  String get voiceMessageHoldHint =>
      'Kaydetmek için basılı tut. Kilitlemek için yukarı sürükle veya göndermek için bırak.';

  @override
  String get voiceMessageDiscard => 'Sesli mesajı at';

  @override
  String get voiceMessageSend => 'Sesli mesaj gönder';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Kayıt başlatılamıyor. Mikrofon erişimine izin ver.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Bu cihazda sesli kayıt desteklenmiyor.';

  @override
  String get voiceMessageMicInUse =>
      'Sesli mesaj kaydetmek için sesli aramadan ayrıl.';

  @override
  String get voiceMessageRecordingFailed =>
      'Kayıt başarısız oldu. Tekrar dene.';

  @override
  String get voiceMessageSendFailed =>
      'Sesli mesaj gönderilemedi. Tekrar dene.';

  @override
  String get voiceMessageRecordingHint =>
      'Şimdi konuş. İşin bittiğinde Dur\'a bas — sonradan düzenleyebilirsin.';

  @override
  String get voiceMessageReviewHint =>
      'Kırpmak için tutamaçları sürükle, sonra Gönder\'e bas.';

  @override
  String get voiceMessageStop => 'Durdur';

  @override
  String get voiceMessageStartRecording => 'Kaydı başlat';

  @override
  String get voiceMessageRerecord => 'Re-record';

  @override
  String get voiceMessagePlay => 'Oynat';

  @override
  String get voiceMessagePause => 'Duraklat';

  @override
  String get voiceMessageSeekForward => 'Seek forward';

  @override
  String get voiceMessageSeekBackward => 'Seek backward';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Seçim en az ${secondsString}sn olmalı.';
  }

  @override
  String get chatAttachmentEditTitle => 'Dosyayı düzenle';

  @override
  String get chatAttachmentFilenameLabel => 'Dosya adı';

  @override
  String get chatAttachmentDescriptionLabel => 'Açıklama';

  @override
  String get chatAttachmentDescriptionHint => 'İsteğe bağlı alt metin';

  @override
  String get chatAttachmentSpoilerLabel => 'Spoiler olarak işaretle';

  @override
  String get chatAttachmentRemove => 'Dosyayı kaldır';

  @override
  String get chatAttachmentDownload => 'İndir';

  @override
  String get chatAttachmentDownloadedToast => 'Saved to photos';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Couldn\'t download attachment';

  @override
  String get chatAttachmentExpiredTooltip => 'Dosya süresi doldu';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count lines)',
      one: 'Expand ($count line)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Collapse ($count lines)',
      one: 'Collapse ($count line)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Expand ($count rows)',
      one: 'Expand ($count row)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Collapse ($count rows)',
      one: 'Collapse ($count row)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count lines left)',
      one: '... ($count line left)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count rows left)',
      one: '... ($count row left)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'View whole file';

  @override
  String get chatTextualPreviewChangeLanguage => 'Change language';

  @override
  String get chatTextualPreviewSearchLanguage => 'Search language…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Syntax highlighting';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'No results found';

  @override
  String get chatTextualPreviewMoreOptions => 'More options';

  @override
  String get chatTextualPreviewWrapText => 'Wrap text';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'File is too large for inline preview (limit $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Unable to load preview.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Plain text';

  @override
  String get chatTextualPreviewCopy => 'Copy';

  @override
  String get chatAttachmentSourceGallery => 'Galeri';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Dosyalara göz at';

  @override
  String get chatAttachmentPasteTooltip => 'Panodan resmi yapıştır';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Spoileri göster';

  @override
  String get matureMediaRevealButton => 'Göster';

  @override
  String get matureMediaRevealHint => 'Göster';

  @override
  String get matureContentTitle => 'Müstehcen içerik';

  @override
  String get matureCommunityTitle => 'Hassas içerikli topluluk';

  @override
  String get matureCategoryTitle => 'Hassas içerikli kategori';

  @override
  String get matureChannelTitle => 'Hassas içerikli kanal';

  @override
  String get communityContentWarningTitle => 'Topluluk içerik uyarısı';

  @override
  String get categoryContentWarningTitle => 'Kategori içerik uyarısı';

  @override
  String get channelContentWarningTitle => 'Kanal içerik uyarısı';

  @override
  String get defaultContentWarningBody => 'Bu hassas içerik barındırıyor.';

  @override
  String get matureCommunityBody =>
      'Bu topluluk hassas içerik için işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureCategoryBody =>
      'Bu kategori hassas içerik için işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureChannelBody =>
      'Bu kanal hassas içerik için işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureVoiceChannelBody =>
      'Bu sesli kanal hassas içerik için işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureLinkChannelBody =>
      'Bu bağlantı kanalı hassas içerik için işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller açabilir.';

  @override
  String get matureCommunityUnavailableBody =>
      'Bu hassas içerikli topluluk hesabınız için mevcut değil.';

  @override
  String get matureCategoryUnavailableBody =>
      'Bu hassas içerikli kategori hesabınız için mevcut değil.';

  @override
  String get matureChannelUnavailableBody =>
      'Bu hassas içerikli kanal hesabınız için mevcut değil.';

  @override
  String get matureContentProceedButton => 'Devam et';

  @override
  String get matureContentUnderstandButton => 'Anladım';

  @override
  String get matureContentOpenLinkButton => 'Bağlantıyı aç';

  @override
  String get sensitiveContentSectionTitle => 'Hassas içerik';

  @override
  String get sensitiveContentSectionDescription =>
      'Hassas veya yetişkinlere yönelik medyanın farklı bağlamlarda nasıl filtreleneceğini kontrol edin';

  @override
  String get sensitiveContentFriendDmLabel =>
      'Arkadaşlardan gelen özel mesajlar';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Diğerlerinden gelen özel mesajlar';

  @override
  String get sensitiveContentGuildLabel => 'Topluluk kanallarındaki mesajlar';

  @override
  String get sensitiveContentFilterShow => 'Göster';

  @override
  String get sensitiveContentFilterBlur => 'Bulanıklaştır';

  @override
  String get sensitiveContentFilterBlock => 'Engelle';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Güvenlik taraması tamamlanana kadar medyayı bulanıklaştır';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Etkinleştirildiğinde, içerik güvenlik taraması bitene kadar resimler ve videolar bulanıklaştırılır.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Bu ayar hesabınız için her zaman açıktır.';

  @override
  String get sensitiveContentResetButton => 'Sıfırla';

  @override
  String get sensitiveContentSaveButton => 'Kaydet';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dosya yükleniyor',
      one: '1 dosya yükleniyor',
    );
    return '$_temp0';
  }

  @override
  String get chatCancelUpload => 'Yüklemeyi iptal et';

  @override
  String chatAttachmentExpiresOn(String date) {
    return '$date tarihinde sona eriyor';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return '$start ile $end arasında sona eriyor';
  }

  @override
  String get connectionsTitle => 'Bağlantılar';

  @override
  String get connectionsDescription =>
      'Harici hesapları ve alan adlarını Fluxer profilinize bağlayın. Doğrulanmış bağlantılar profilinizde başkalarının görebilmesi için görüntülenecektir.';

  @override
  String get connectionsEmptyTitle => 'Henüz bağlantı yok';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Bluesky hesabınızı bağlayın veya alan adı sahipliğini doğrulayın, böylece profilinizde görüntülenebilir.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Alan adı sahipliğini doğrulayın, böylece profilinizde görüntülenebilir.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Alan Adı';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Bluesky bağlantısı ekle';

  @override
  String get connectionsAddDomainAriaLabel => 'Alan adı bağlantısı ekle';

  @override
  String get connectionEdit => 'Düzenle';

  @override
  String get connectionRemove => 'Kaldır';

  @override
  String get connectionVerifiedLabel => 'Bu bağlantı doğrulandı.';

  @override
  String get connectionUnverifiedLabel => 'Bu bağlantı doğrulanmadı.';

  @override
  String get connectionAddTitle => 'Bağlantı Ekle';

  @override
  String get connectionTypeLabel => 'Bağlantı Türü';

  @override
  String get connectionHandleLabel => 'Kullanıcı Adı';

  @override
  String get connectionDomainLabel => 'Alan Adı';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Bu bağlantı zaten mevcut.';

  @override
  String get connectionConnectBluesky => 'Bluesky ile Bağlan';

  @override
  String get connectionContinue => 'Devam Et';

  @override
  String get connectionVerifyTitle => 'Bağlantıyı Doğrula';

  @override
  String get connectionVerifyInstructions =>
      'Alan adı sahipliğini kanıtlamak için aşağıdaki kaydı kullanın.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT kaydı';

  @override
  String get connectionDnsHostLabel => 'Sunucu Adı';

  @override
  String get connectionDnsValueLabel => 'Değer';

  @override
  String get connectionCopyHost => 'Sunucu adını kopyala';

  @override
  String get connectionCopyValue => 'Değeri kopyala';

  @override
  String get connectionCopied => 'Kopyalandı!';

  @override
  String get connectionTokenFileTitle => 'Token dosyasını sun';

  @override
  String get connectionTokenFileDescription =>
      '**fluxer-verification** dosyasını indirip **.well-known** klasörünüze yerleştirin, böylece alan adını doğrulayabiliriz.';

  @override
  String get connectionTokenFileDownload => 'fluxer-verification\'ı indir';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Dosya, **$dnsUrl** adresinden alacağımız doğrulama token\'ını içerir.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'fluxer-verification\'ı kaydet';

  @override
  String get connectionVerifyButton => 'Doğrula';

  @override
  String get connectionBack => 'Geri';

  @override
  String get connectionEditTitle => 'Bağlantıyı Düzenle';

  @override
  String get connectionEditDescription =>
      'Bu bağlantıyı profilinizde kimlerin görebileceğini seçin.';

  @override
  String get connectionVisibilityEveryone => 'Herkes';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Bu bağlantıyı profilinizde herkesin görmesine izin verin';

  @override
  String get connectionVisibilityFriends => 'Arkadaşlar';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Arkadaşlarınızın bu bağlantıyı görmesine izin verin';

  @override
  String get connectionVisibilityCommunityMembers => 'Topluluk Üyeleri';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Katıldığınız topluluklardaki üyelerin bu bağlantıyı görmesine izin verin';

  @override
  String get connectionRemoveTitle => 'Bağlantıyı Kaldır';

  @override
  String get connectionRemoveDescription =>
      'Bu bağlantıyı kaldırmak istediğinizden emin misiniz? Bu işlem geri alınamaz.';

  @override
  String get connectionRemoveConfirm => 'Kaldır';

  @override
  String get connectionsLoadError => 'Bağlantılar yüklenemedi';

  @override
  String get connectionsReorderError => 'Sıralama güncellenemedi';

  @override
  String get connectionInitiateFailed =>
      'Doğrulama başlatılamadı. Tekrar deneyin.';

  @override
  String get connectionVerifyFailed =>
      'Doğrulanamadı. DNS kaydınızı kontrol edin ve tekrar deneyin.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Bluesky yetkilendirmesi başlatılamadı.';

  @override
  String get connectionUpdateFailed => 'Bağlantı güncellenemedi';

  @override
  String get connectionRemoveFailed => 'Bağlantı kaldırılamadı';

  @override
  String get connectionTokenSavedToast => 'fluxer-verification kaydedildi';

  @override
  String get connectionTokenSaveFailedToast => 'Dosya kaydedilemedi';

  @override
  String get connectionEnterHandle => 'Bir Bluesky kullanıcı adı girin.';

  @override
  String get connectionEnterDomain => 'Bir alan adı girin.';

  @override
  String get lookAndFeelTitle => 'Görünüm';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Koyu, kömür veya açık görünüm arasında seçim yapın.';

  @override
  String get lookAndFeelHdrSectionTitle => 'High dynamic range';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Control how HDR images are displayed on HDR-capable monitors.';

  @override
  String get lookAndFeelHdrFullName => 'Full dynamic range';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Display HDR images at full brightness and color range.';

  @override
  String get lookAndFeelHdrStandardName => 'Standard range';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Tone-map HDR images to standard range, reducing peak brightness.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'High dynamic range display mode';

  @override
  String get lookAndFeelThemeDark => 'Koyu Tema';

  @override
  String get lookAndFeelThemeCoal => 'Kömür Teması';

  @override
  String get lookAndFeelThemeLight => 'Açık Tema';

  @override
  String get lookAndFeelThemeSystem => 'Sistem Teması';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Temayı cihazlar arasında eşitle';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Etkinleştirildiğinde, tema değişiklikleri tüm cihazlarınıza eşitlenir. Devre dışı bırakıldığında, bu cihaz kendi tema ayarını kullanır.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Sistem teması, bu cihazdaki sistem tercihlerinizi izlemek için eşitlemeyi otomatik olarak devre dışı bırakır.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Tema hesabınıza eşitlenemedi. Lütfen tekrar deneyin.';

  @override
  String get lookAndFeelChatFontScalingTitle =>
      'Sohbet Yazı Tipi Boyutlandırma';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Sohbet alanındaki yazı tipi boyutunu ayarlayın.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Chat font size';

  @override
  String get lookAndFeelAppZoomTitle => 'App zoom level';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Adjust the application\'s zoom level.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Messages';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Choose how messages are displayed in chat channels.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Space between message groups';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Message display mode';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Comfy';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Spacious layout with clear visual separation between messages.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Dense';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Maximizes visible messages with minimal spacing.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Hide user avatars';

  @override
  String get lookAndFeelInterfaceTitle => 'Arayüz';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Arayüz öğelerini ve davranışlarını özelleştirin.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Kanal listesi yazma göstergeleri';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Bir kanalda biri yazarken kanal listesinde yazma göstergelerinin nasıl görüneceğini seçin.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Yazma Göstergesi + Avatarlar';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Kanal listesinde kullanıcı avatarlarıyla yazma göstergesini göster';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Yalnızca Yazma Göstergesi';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Yalnızca yazma göstergesini avatarlar olmadan göster';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Gizli';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Kanal listesinde yazma göstergelerini gösterme';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Seçili kanalda yazmayı göster';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Devre dışı bırakıldığında (varsayılan), yazma göstergeleri görüntülemekte olduğunuz kanalda görünmez.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'genel';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Klavye İpuçları';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Klavye kısayolu ipuçlarının araç ipuçlarında görünüp görünmeyeceğini kontrol edin.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Araç ipuçlarında klavye ipuçlarını gizle';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Etkinleştirildiğinde, kısayol rozetleri araç ipucu açılır pencerelerinde gizlenir.';

  @override
  String get lookAndFeelNekoTitle => 'Çeşitli';

  @override
  String get lookAndFeelNekoDescription => 'Çeşitli arayüz seçenekleri.';

  @override
  String get lookAndFeelShowNekoLabel => 'Neko\'yu Göster';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Etkinleştirildiğinde, Neko sohbet giriş çubuğunun yakınında görünür.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Sesli kanal katılma davranışı';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Topluluklardaki sesli kanallara nasıl katılacağınızı kontrol edin.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Sesli kanallara katılmak için çift tıklama gerektir';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Etkinleştirildiğinde, sesli kanallara katılmak için çift tıklamanız gerekir. Devre dışı bırakıldığında (varsayılan), tek tıklama kanala hemen katılacaktır.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Hızlı kahverengi tilki tembel köpeğin üzerinden atlar.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Sunucu kenar çubuğu';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Doğrudan mesajların sunucu kenar çubuğunda nasıl görüntüleneceğini yapılandırın.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count topluluk, akı kapasitörü arızası nedeniyle geçici olarak kullanılamıyor.',
      one:
          '1 topluluk, akı kapasitörü arızası nedeniyle geçici olarak kullanılamıyor.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Community temporarily unavailable';

  @override
  String get guildUnavailableDescription =>
      'Something went wrong. We\'re working on it.';

  @override
  String get guildNotFoundTitle =>
      'This is not the community you\'re looking for.';

  @override
  String get guildNotFoundDescription =>
      'The community you\'re looking for may have been deleted or you may not have access to it.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName is currently only accessible to $productName staff members';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'temporarily unavailable';

  @override
  String get lookAndFeelCollapseDMsLabel => 'DM\'leri Klasöre Daralt';

  @override
  String get lookAndFeelCollapseDMsDescription =>
      'Etkinleştirildiğinde, sunucu kenar çubuğundaki okunmamış DM\'ler Fluxer düğmesindeki bir klasöre daraltılır. Klasörü genişletmek veya daraltmak için DM\'ler sayfasındayken Fluxer düğmesine tıklayın.';

  @override
  String get lookAndFeelChannelListSectionTitle => 'Kanal Listesi';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Kanal listelerindeki sessize alınmış kanallar için okunmamış gösterge davranışını kontrol edin.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Sessize alınmış kanallarda okunmamış göstergesini göster';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Etkinleştirildiğinde, sessize alınmış kanallar sol tarafta soluk bir okunmamış göstergesi gösterir. Bahsedilenler bu ayardan bağımsız olarak görünmeye devam eder.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Şimdi Aktif';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Şimdi Aktif\'in uygulama genelinde nasıl görüneceğini kontrol edin.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Ana ekranda Şimdi Aktif\'i göster';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Arkadaşların sesli olarak aktif olduğunu göstermek için ana ekranda Şimdi Aktif\'i gösterin. Bir önizleme, kanal bağlamı, zaten kimlerin orada olduğu ve katılmak için hızlı bir yol göreceksiniz.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoriler';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Uygulama genelinde favorilerin görünürlüğünü kontrol edin.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Favorileri Etkinleştir';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Etkinleştirildiğinde, kanalları favorilerinize ekleyebilir ve bunlar Favoriler bölümünde görünür. Devre dışı bırakıldığında, favorilerle ilgili tüm kullanıcı arayüzü öğeleri (düğmeler, menü öğeleri) gizlenir. Mevcut favorileriniz korunacaktır.';

  @override
  String get favoritesTitle => 'Favoriler';

  @override
  String get favoritesEmptyTitle => 'Henüz favori yok';

  @override
  String get favoritesEmptyDescription =>
      'Kanalları sohbet başlığından yıldızlayarak burada tutun.';

  @override
  String get favoritesWelcomeTitle => 'Favorilere hoş geldiniz';

  @override
  String get favoritesWelcomeDescription =>
      'Sevdiğiniz kanallar, DM\'ler ve gruplara hızlı erişim için kişisel alanınız. Bir kanalı buraya eklemek için üzerindeki yıldıza basın.';

  @override
  String get favoritesWelcomeTip =>
      'Sizin için değil mi? İstediğiniz zaman kapatabilirsiniz.';

  @override
  String get favoritesDisableButton => 'Favorileri devre dışı bırak';

  @override
  String get favoritesAddedToast => 'Favorilere eklendi';

  @override
  String get favoritesRemovedToast => 'Favorilerden kaldırıldı';

  @override
  String get favoritesHiddenToast => 'Favoriler gizlendi';

  @override
  String get favoritesMute => 'Favorileri sessize al';

  @override
  String get favoritesUnmute => 'Favorilerin sessizliğini aç';

  @override
  String get favoritesHeaderMenu => 'Favoriler menüsü';

  @override
  String get favoritesCreateCategory => 'Kategori oluştur';

  @override
  String get favoritesCategoryNameLabel => 'Kategori adı';

  @override
  String get favoritesHideMutedChannels => 'Sessize alınmış kanalları gizle';

  @override
  String get favoritesShowMutedChannels => 'Sessize alınmış kanalları göster';

  @override
  String get favoritesSetNickname => 'Takma ad belirle';

  @override
  String get favoritesNicknameLabel => 'Takma ad';

  @override
  String get favoritesSaveNickname => 'Takma adı kaydet';

  @override
  String get favoritesMoveToCategory => 'Kategoriye taşı';

  @override
  String get favoritesUncategorized => 'Kategorisiz';

  @override
  String get favoritesOtherCategory => 'Diğer';

  @override
  String get favoritesRemoveFromFavorites => 'Favorilerden kaldır';

  @override
  String get favoritesAddToFavorites => 'Favorilere ekle';

  @override
  String get favoritesAddToSavedMedia => 'Add to saved media';

  @override
  String get favoritesRemoveFromSavedMedia => 'Remove from saved media';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Add to URL-only GIF favorites';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Remove from URL-only GIF favorites';

  @override
  String get savedMediaAddTitle => 'Add to saved media';

  @override
  String get savedMediaFormNameLabel => 'Name';

  @override
  String get savedMediaFormNameHint => 'My awesome media';

  @override
  String get savedMediaFormAltTextLabel => 'Alt text';

  @override
  String get savedMediaFormAltTextHint => 'Describe the media';

  @override
  String get savedMediaFormTagsLabel => 'Tags';

  @override
  String get savedMediaFormTagsHint => 'funny, reaction, work';

  @override
  String get savedMediaSaveError => 'Could not update saved media.';

  @override
  String get savedMediaNameRequired => 'Name is required.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'How should we save your GIF favorites?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'You can store starred GIFs as URL-only favorites or upload them to your saved media. Pick the one that fits how you use them. You can change it any time in Settings > Advanced > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL-only favorites (default): synced across your devices, no upload, doesn\'t count against saved media. The original media may disappear if its host removes it.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Saved media: uploaded, taggable, searchable, and persistent, but counts against your saved media limit.';

  @override
  String get gifFavoriteFirstTimeHint => 'We\'ll only ask once.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Use URL-only (recommended)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Use saved media';

  @override
  String get favoritesHideConfirmTitle => 'Favorileri gizle';

  @override
  String get favoritesHideConfirmDescription =>
      'Bu işlem, düğmeler ve menü öğeleri dahil olmak üzere favorilerle ilgili tüm kullanıcı arayüzü öğelerini gizleyecektir. Mevcut favorileriniz korunacak ve Ayarlar > Gelişmiş > Görünüm\'den istediğiniz zaman yeniden etkinleştirilebilecektir.';

  @override
  String get favoritesDirectMessageSubtitle => 'Doğrudan Mesaj';

  @override
  String get messagesMediaDisplayGroupTitle => 'Görüntüleme';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Mesajların, medyaların ve diğer içeriklerin nasıl görüntüleneceğini kontrol edin.';

  @override
  String get messagesMediaMediaGroupTitle => 'Medya';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Medya boyutu tercihlerini ve düğmelerini özelleştirin.';

  @override
  String get messagesMediaInputGroupTitle => 'Girdi';

  @override
  String get messagesMediaInputGroupDescription =>
      'Mesaj girdi ayarlarını özelleştirin.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Kenar Çubuğu';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Topluluk kenar çubuğunun nasıl görüntüleneceğini yapılandırın.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Varsayılan olarak sessize alınmış kanalları gizle';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Yeni topluluklara katıldığınızda kenar çubuğundaki sessize alınmış kanalları otomatik olarak gizleyin';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Varsayılan olarak sessize alınmış kanalları gizlensin mi?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Katılacağınız yeni topluluklarda sessize alınmış kanallar otomatik olarak gizlenecektir. Mevcut tüm topluluklarınız için de bu ayarı uygulamak ister misiniz?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Varsayılan olarak sessize alınmış kanalları gizlemeyi durdur?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Katılacağınız yeni topluluklarda sessize alınmış kanallar artık otomatik olarak gizlenmeyecektir. Mevcut tüm topluluklarınızda sessize alınmış kanalları göstermek ister misiniz?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Tüm topluluklara uygula';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Tüm topluluklarda göster';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Yalnızca yeni topluluklar';

  @override
  String get messagesMediaDisplaySectionTitle => 'Medya Görüntüleme';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Resimlerin, videoların ve diğer medyaların nasıl gösterileceğini kontrol edin. Tüm medya yeniden boyutlandırılır ve dönüştürülür. Önizlemeye sıkıştırılamayan aşırı büyük dosyalar, bu ayarlardan bağımsız olarak yerleştirilmez.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Sohbete bağlantı olarak gönderildiğinde';

  @override
  String get messagesMediaDisplayInlineAttachmentLabel =>
      'Doğrudan Fluxer\'a yüklendiğinde';

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Bağlantı Önizlemeleri';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Web sitesi bağlantılarının sohbet içinde nasıl önizleneceğini kontrol edin';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Bağlantı yerleştirmelerini ve önizleme web sitesi bağlantılarını göster';

  @override
  String get messagesMediaReactionsSectionTitle => 'Tepkiler';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Mesajlardaki emoji tepkilerini yapılandırın';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mesajlarda emoji tepkilerini göster';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Gizli İçerik';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Gizli içeriğin nasıl görüntüleneceğini kontrol edin';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Gizli içeriği göster';

  @override
  String get messagesMediaSpoilersOnClickName => 'Tıklandığında';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Tıklandığında gizli içeriği göster';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'Yönettiğim kanallarda';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      '\"Mesajları Yönet\" izniniz olan kanallarda gizli içeriği her zaman göster';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Her zaman';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Gizli içeriği her zaman göster';

  @override
  String get messagesMediaSizeSectionTitle => 'Medya Boyutu Tercihleri';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Gömülü ve eklenmiş medyanın maksimum görüntüleme boyutunu özelleştirin. Daha küçük boyutlar daha az ekran alanı kullanırken, daha büyük boyutlar daha fazla ayrıntı gösterir.';

  @override
  String get messagesMediaSizeEmbedLabel =>
      'Bağlantılardan gelen medya (gömülü)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Yüklenen ekler';

  @override
  String get messagesMediaSizeCompactName => 'Kompakt (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Daha küçük medya boyutu';

  @override
  String get messagesMediaSizeComfortableName => 'Rahat (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Daha fazla ayrıntıya sahip daha büyük medya boyutu';

  @override
  String get messagesMediaGifsSectionTitle => 'GIF Davranışı';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Sohbete GIF\'lerin nasıl ekleneceğini kontrol edin';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Seçildiğinde GIF\'leri otomatik gönder';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Camera uploads';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Choose whether photos and videos taken with the in-app camera are kept on your device';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Save to device';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'İfade otomatik tamamlama (iki nokta üst üste otomatik tamamlama)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'İki nokta üst üste yazdığınızda ifade otomatik tamamlama\'da neyin görüneceğini kontrol edin. Tercihlerinize uyacak şekilde hangi önerilerin görüneceğini özelleştirin.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'İfade otomatik tamamlama\'da varsayılan emojileri göster';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'İfade otomatik tamamlama\'da özel emojileri göster';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'İfade otomatik tamamlama\'da çıkartmaları göster';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'İfade otomatik tamamlama\'da kaydedilen medyayı göster';

  @override
  String get messagesMediaEditingSectionTitle => 'Mesaj Düzenleme';

  @override
  String get messagesMediaEditingSectionDescription =>
      'İptal ettiğinizde düzenleme taslağınıza ne olacağını kontrol edin.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'İptal edildiğinde düzenleme taslağını koru';

  @override
  String get accessibilitySaturationTitle => 'Doygunluk';

  @override
  String get accessibilitySaturationDescription =>
      'Uygulama genelindeki tema renklerinin canlılığını ayarlayın.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'Always underline links';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Dim strikethrough text';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM mesaj önizlemeleri';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'DM listesinde mesaj önizlemelerinin ne zaman gösterileceğini kontrol edin.';

  @override
  String get accessibilityDmMessagePreviewModeLabel => 'DM mesaj önizleme modu';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Tüm mesajlar';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Tüm DM konuşmaları için mesaj önizlemelerini göster';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Yalnızca okunmamış DM\'ler';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Yalnızca okunmamış mesajları olan DM\'ler için mesaj önizlemelerini göster';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Yok';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'DM listesinde mesaj önizlemelerini gösterme';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Screen reader';

  @override
  String get accessibilityScreenReaderGroupDescription =>
      'Control how Fluxer works with screen readers.';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Announce new messages';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Let screen readers announce new messages as they arrive in the open channel. Notification sounds are unaffected.';

  @override
  String get accessibilityTtsGroupTitle => 'Text-to-speech';

  @override
  String get accessibilityTtsGroupDescription =>
      'Choose a speed for spoken text.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Speech playback speed';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Play sample';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Silence sample';

  @override
  String get accessibilityPreviewButtonLabel => 'Preview button';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'This shows how links appear: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Preview User';

  @override
  String get accessibilityKeyboardGroupTitle => 'Keyboard';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Show focus ring on chat textarea';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Escape key exits keyboard mode';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Show context menu shortcuts';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Confirm before starting calls';

  @override
  String get accessibilityAnimationGroupTitle => 'Animation';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Reduced motion is on, so content animations are paused by default. You can still turn any of these back on to keep it playing.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Play animated emojis';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'Automatically play GIFs';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Automatically play GIFs when $productName is focused';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Playing despite reduced motion.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Paused by reduced motion. Turn on to keep animated emojis playing.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Paused by reduced motion. Turn on to keep GIFs playing.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Defaults to off on mobile to preserve battery life and data usage.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Sticker animations';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Sticker animation preference';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Always animate';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Stickers will always animate';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animate on interaction';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Stickers will animate when you press them';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Stickers will animate when you hover or interact with them';

  @override
  String get accessibilityStickerNeverAnimateName => 'Never animate';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Stickers will never animate';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Always animating despite reduced motion.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Reduced motion limits stickers to animate on interaction. Choose always animate to override.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Defaults to animate on interaction on mobile to preserve battery life.';

  @override
  String get accessibilityMotionGroupTitle => 'Motion';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sync reduced motion setting with system';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Use this device\'s system reduced motion preference, or customize it below.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Reduce motion';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Disable animations and transitions. Currently controlled by your system setting.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Disable animations and transitions throughout the app.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animated emojis, GIFs and stickers stay under your control in the Animation tab.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Start call?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Are you sure you want to start this call?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Start call';

  @override
  String get accessibilityTtsSampleDescription =>
      'Hear the sample line spoken with your chosen speed.';

  @override
  String get accessibilityTtsSampleText =>
      'Doc, I\'m from the future. I came here in a time machine that you invented. Now, I need your help to get back to the year 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Speech synthesis is unavailable on this device.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Speech playback failed. Try again, or check that audio output is working.';

  @override
  String get ttsSubstitutionUnknownUser => 'unknown user';

  @override
  String get ttsSubstitutionUnknownRole => 'unknown role';

  @override
  String get ttsSubstitutionUnknownChannel => 'unknown channel';

  @override
  String get ttsSubstitutionCodeBlock => 'code block';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'slash $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName said: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Replying to $replyAuthorName, $authorName said: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'sent a sticker';

  @override
  String get ttsSentAttachment => 'sent an attachment';

  @override
  String ttsSentAttachments(int count) {
    return 'sent $count attachments';
  }

  @override
  String get ttsSentEmbed => 'sent an embed';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author sent $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Bir ek gönderildi';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username bu kanala bir mesaj sabitledi.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username, $userName\'ı gruba ekledi.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username birini gruba ekledi.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username gruptan ayrıldı.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username kişisini gruptan $userName çıkardı.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username birini gruptan çıkardı.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username, kanalın adını $newName olarak değiştirdi.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username, kanalın adını değiştirdi.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username, kanal simgesini değiştirdi.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username bir arama başlattı.';
  }

  @override
  String get systemCallJoinTheCall => 'Join the call';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username started a call that lasted $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'You missed a call from $username that lasted $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'You missed a call from $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'a few seconds';

  @override
  String get systemCallDurationMinute => 'a minute';

  @override
  String get systemCallDurationOneYear => '1 year';

  @override
  String get systemCallDurationOneMonth => '1 month';

  @override
  String get systemCallDurationOneWeek => '1 week';

  @override
  String get systemCallDurationOneDay => '1 day';

  @override
  String get systemCallDurationOneHour => '1 hour';

  @override
  String systemCallDurationYears(int count) {
    return '$count years';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count months';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count weeks';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count days';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count hours';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count minutes';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Update $productName to view this message.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Sesli Bağlantı Onayı';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bu sesli kanala zaten $count başka cihazdan bağlısınız. Ne yapmak istersiniz?',
      one:
          'Bu sesli kanala zaten 1 başka cihazdan bağlısınız. Ne yapmak istersiniz?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Bu Cihaza Geç';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Sadece Katıl (Diğer Bağlantıları Koru)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Hiçbir şey yapma, katılmak istemiyorum';

  @override
  String get voiceJoinFailedTitle => 'Couldn\'t Join Voice';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Couldn\'t disconnect your other devices. Try again in a moment.';

  @override
  String get voiceChannelEmptyDescription =>
      'Bu bir sesli kanal. Konuşmaya başlamak için bağlanın!';

  @override
  String get voiceChannelJoin => 'Sesli Kanala Katıl';

  @override
  String get voiceCallJoin => 'Join call';

  @override
  String get voiceChannelJoinConnect => 'Sese Bağlan';

  @override
  String get voiceChannelNoConnectPermission =>
      'Bu sesli kanala katılma izniniz yok';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon, kamera ve ekran paylaşımı içeriği uçtan uca şifrelenmiştir.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon, kamera ve ekran paylaşımı içeriği uçtan uca şifrelenmiştir.';

  @override
  String get voiceChannelE2eeBroken =>
      'Desteklenmeyen bir katılımcı bu sesli kanalda olduğu için uçtan uca şifreleme kullanılamıyor.';

  @override
  String get voiceCallE2eeBroken =>
      'Desteklenmeyen bir katılımcı bu aramada olduğu için uçtan uca şifreleme kullanılamıyor.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Bu şifreli aramaya katılmadan önce bu istemci güncellenmelidir.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Mikrofonunuz başlatılamadı. Aramada kalmaya devam ediyorsunuz.';

  @override
  String get voiceChannelStatusConnecting => 'Bağlanıyor…';

  @override
  String get voiceChannelStatusConnected => 'Bağlandı';

  @override
  String get voiceChannelStatusError => 'Hata';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Mobil cihaz';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Masaüstü cihaz';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Topluluk tarafından sessize alındı';

  @override
  String get voiceParticipantTooltipMuted => 'Sessize alındı';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Topluluk tarafından sesi kapatıldı';

  @override
  String get voiceParticipantTooltipDeafened => 'Sesi kapatıldı';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Bağlantı: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count katılımcı',
      one: '1 katılımcı',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Ayrıl';

  @override
  String get voiceControlMute => 'Sesi Kapat';

  @override
  String get voiceControlUnmute => 'Sesi Aç';

  @override
  String get voiceControlDeafen => 'Sesi Tamamen Kapat';

  @override
  String get voiceControlUndeafen => 'Sesi Tamamen Aç';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Kamerayı çevir';

  @override
  String get voiceControlScreenShare => 'Ekran Paylaşımı';

  @override
  String get voiceScreenShareNotificationText => 'Ekranınızı paylaşıyorsunuz.';

  @override
  String get voiceControlMore => 'Daha Fazla';

  @override
  String get voiceControlDisconnect => 'Bağlantıyı Kes';

  @override
  String get voiceInChat => 'In voice chat';

  @override
  String get voiceConnectionFailed => 'Connection failed';

  @override
  String get voiceConnectionRetry => 'Try again';

  @override
  String get voiceConnectionDismiss => 'Dismiss';

  @override
  String get voiceConnectionDisconnected => 'Disconnected';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => 'Measuring latency...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Jump to $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Voice connection';

  @override
  String get voiceConnectionAdvancedStats => 'Advanced';

  @override
  String get voiceShowCallAvatars => 'Show call avatars';

  @override
  String get voiceShowConnectionId => 'Show connection ID';

  @override
  String get voiceAudioProcessing => 'Audio processing';

  @override
  String get voiceConnectionSessionSection => 'Session';

  @override
  String get voiceConnectionDurationLabel => 'Duration';

  @override
  String get voiceConnectionParticipantsLabel => 'Participants';

  @override
  String get voiceConnectionNetworkSection => 'Network';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Send';

  @override
  String get voiceConnectionReceiveLabel => 'Receive';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '${minutes}m ${seconds}s';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency ms';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter ms';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => 'Mute microphone';

  @override
  String get userAreaUnmuteMicrophone => 'Unmute microphone';

  @override
  String get userAreaUserSettings => 'User settings';

  @override
  String get voiceParticipantMenuViewProfile => 'View profile';

  @override
  String get voiceParticipantMenuFocus => 'Focus this person';

  @override
  String get voiceParticipantMenuUnfocus => 'Unfocus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Community mute';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Community deafen';

  @override
  String get voiceParticipantMenuUserVolume => 'User volume';

  @override
  String get voiceParticipantMenuStreamVolume => 'Stream volume';

  @override
  String get voiceParticipantModerationFailed =>
      'Couldn\'t update that member. Please try again.';

  @override
  String get voiceControlChat => 'Sohbet';

  @override
  String get voicePanelSettingsSectionTitle => 'Voice settings';

  @override
  String get voicePanelUseEarpieceLabel => 'Use earpiece';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Only show videos';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Only show participants who have their camera on.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Show my own camera';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioritize speakers';

  @override
  String get voiceTextChatShow => 'Sohbeti Göster';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# okunmamış mesaj',
      one: '# okunmamış mesaj',
    );
    return '$_temp0 ile sohbeti göster';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Video için kamera izni gereklidir.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Ekran paylaşımı başlatılamadı. Lütfen tekrar deneyin.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Ekran paylaşımı izni reddedildi.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Bu cihazda ekran paylaşımı mevcut değil.';

  @override
  String get voiceWatchStream => 'Akışı İzle';

  @override
  String get voiceStopWatching => 'İzlemeyi Durdur';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Mevcut akışı izlemeyi durdur';

  @override
  String get voiceOwnScreenShareTitle => 'Yayın yapıyorsunuz';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Akışınız katılımcılar için yayında.';

  @override
  String get voiceLiveBadge => 'CANLI';

  @override
  String get dmVoiceViewCall => 'Görüşmeyi Görüntüle';

  @override
  String get dmVoiceCallFullScreen => 'Tam ekran';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Görüşmeyi tam ekranda aç';

  @override
  String get dmVoiceStripStatusConnecting => 'Bağlanıyor…';

  @override
  String get dmVoiceStripStatusInCall => 'Görüşmede';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Sesli görüşme';

  @override
  String get dmVoiceCallBarConnecting => 'Bağlanıyor…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Doğrudan görüşme';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Grup görüşmesi';

  @override
  String get dmVoiceCallBarIssueFallback => 'Ses sorunu';

  @override
  String get dmVoiceFullscreenTitle => 'Sesli';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Ses bağlandı';

  @override
  String get notificationsPageTitle => 'Bildirimler';

  @override
  String get notificationsFilterUnreads => 'Okunmamışlar';

  @override
  String get notificationsFilterMentions => 'Bahsedilenler';

  @override
  String get notificationsBookmarksTooltip => 'Yer imleri';

  @override
  String get notificationsMentionFilterTooltip => 'Bahsedilenleri filtrele';

  @override
  String get notificationsMentionFiltersTitle => 'Bahsedilen filtreleri';

  @override
  String get notificationsMentionIncludeEveryone =>
      '@herkes ve @burada bahsedilenleri dahil et';

  @override
  String get notificationsMentionIncludeRoles =>
      'Rol bahsedilenlerini dahil et';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Tüm topluluk bahsedilenlerini dahil et';

  @override
  String get notificationsNoUnreadTitle => 'Okunmamış Mesaj Yok';

  @override
  String get notificationsNoUnreadBody => 'Her şey güncel.';

  @override
  String get notificationsNoMentionsTitle => 'Yakın Zamanda Bahsedilen Yok';

  @override
  String get notificationsNoMentionsBody =>
      'Size yapılan tüm @bahsedilenler burada 7 gün boyunca görünecektir.';

  @override
  String get notificationsMentionsEndTitle => 'Sona ulaştınız';

  @override
  String get notificationsMentionsEndBody =>
      'Tüm son bahsedilenlerinizi gördünüz. Endişelenmeyin, yakında burada yenileri görünecektir.';

  @override
  String get notificationsJump => 'Atla';

  @override
  String get notificationsRemoveMentionTooltip => 'Bahsedileni kaldır';

  @override
  String get notificationsViewAllUnread => 'Tüm okunmamışları görüntüle';

  @override
  String get notificationsMarkAsRead => 'Okundu olarak işaretle';

  @override
  String get notificationsExpand => 'Genişlet';

  @override
  String get notificationsCollapse => 'Daralt';

  @override
  String get notificationsMessageUnavailable => 'Bu mesaj yüklenemedi.';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining karakter kaldı';
  }

  @override
  String get characterCounterTooLong => 'Mesaj çok uzun';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining karakter kaldı. $premiumMaxLength karaktere kadar yazmak için $productName\'ı edinin.';
  }

  @override
  String get chatMessageFailedToSend => 'Mesaj gönderilemedi';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Mesajınız teslim edilemedi. Bunun nedeni genellikle alıcıyla bir topluluğu paylaşmamanız veya alıcının yalnızca arkadaşlardan gelen doğrudan mesajları kabul etmesidir. Ayrıca doğrudan mesaj gizlilik ayarlarınızı $settingsPath konumunda düzenlemeniz gerekebilir.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Mesajınız teslim edilemedi. Doğrudan mesaj göndermek için hesabınızı doğrulamanız gerekir.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Mesajınız teslim edilemedi. Mesaj göndermek için hesabınızı doğrulamanız gerekir.';

  @override
  String get chatSendFailureContentBlocked =>
      'Mesajınız güvenlik sistemlerimiz tarafından işaretlendiği için teslim edilemedi. Bunun bir hata olduğunu düşünüyorsanız lütfen destek ile iletişime geçin.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Mesajınız, bu bağlamda izin verilmeyen yetişkinlere yönelik emojiler veya çıkartmalar içerdiği için teslim edilemedi.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Bu mesajı yalnızca siz görebilirsiniz.';

  @override
  String get chatClientSystemDismiss => 'Kapat';

  @override
  String get privacyDashboardCommunicationSection => 'İletişim';

  @override
  String get privacyDashboardProfilePrivacySection => 'Profile privacy';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Friends & direct messages';

  @override
  String get privacyDashboardActivitySharingSection => 'Activity sharing';

  @override
  String get privacyDashboardSensitiveContentSection => 'Sensitive content';

  @override
  String get privacyDashboardDataExportSection => 'Data export';

  @override
  String get privacyDashboardDataDeletionSection => 'Data deletion';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Who can see your full profile';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Friends and all communities';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Your full profile is visible to friends and to anyone in your communities';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Friends and small communities only';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Your full profile is visible to friends and members of your communities with 200 or fewer members';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Friends only';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Your full profile is only visible to your friends';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Friend requests';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Everyone';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Allow anyone to send you friend requests';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Friends of Friends';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Allow friends of your friends to send you requests';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Community Members';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Allow members from communities you\'re in to send you requests';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direct messages';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Allow direct messages from community members';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Allow members from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Allow direct messages from community bots';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Allow bots from communities you\'re in to send you direct messages';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Control who can send you friend requests and direct messages';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Control who can call you and add you to group chats';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Incoming calls';

  @override
  String get privacyDashboardIncomingCallsDesc => 'Control who can call you';

  @override
  String get privacyDashboardAllowedCallers => 'Allowed callers';

  @override
  String get privacyDashboardIncomingCallNobody => 'Nobody';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Block all incoming calls';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Friends Only';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Only allow friends to call you (recommended)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Friends + Custom';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Allow friends plus additional groups you choose';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Everyone';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Allow anyone to call you, even strangers';

  @override
  String get privacyDashboardAdditionalGroups => 'Additional Groups';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'People who are friends with your friends can call you';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'People from communities you\'re both in can call you';

  @override
  String get privacyDashboardRingBehavior => 'Ring Behavior';

  @override
  String get privacyDashboardSilentCalls => 'Silent calls from everyone';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'All calls will notify silently instead of ringing. By default, calls from non-friends are always silent.';

  @override
  String get privacyDashboardGroupDmTitle => 'Who Can Add You to Group Chats';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Control who can add you to group chats without asking. Anyone can still send you invite links to join.';

  @override
  String get privacyDashboardAllowedInvites => 'Allowed invites';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Don\'t let anyone add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Only allow friends to add you without asking (recommended)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Allow friends plus additional groups to add you';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Allow anyone to add you to group chats without asking';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'People who are friends with your friends can add you to group chats';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'People from communities you\'re both in can add you to group chats';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Voice activity on active now';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Share your voice activity with friends';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Share voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Stop sharing voice activity with all friends?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'You\'re about to start sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'You\'re about to stop sharing your voice activity with every friend you have, including future ones. This sends an update to all of them and can only be changed again in 24 hours.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Yes, share with all friends';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Yes, stop sharing';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Available again in $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Voice activity sharing updated';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Couldn\'t update voice activity sharing right now';

  @override
  String get privacyDashboardDataExportDesc =>
      'Build a downloadable archive of your account data, including messages and attachment URLs. Most people want everything, but you can narrow the scope below.';

  @override
  String get privacyDashboardExportMyData => 'Export my data';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Permanently remove messages you have sent across DMs, group DMs, and communities. The work runs in the background, and you will get a DM when it finishes.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Delete my messages';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Allow direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Block direct messages from community members?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Allow bots to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Block bots from sending you direct messages?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Do you also want to allow direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Do you also want to block direct messages from members of your existing communities?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Do you also want to allow bots from your existing communities to send you direct messages?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Do you also want to block bots from your existing communities?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'You can also change this setting per-community by long-pressing the community name and selecting Privacy Settings.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Allow for all communities';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Block for all communities';

  @override
  String get privacyDashboardDmConfirmSkip => 'Skip this step';

  @override
  String get privacyDashboardDataRequestGoBack => 'Go back';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Export my data';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Delete my messages';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'We\'ll process this as soon as possible. You\'ll get an email when your archive is ready.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'We\'ll process this as soon as possible. You\'ll get a DM from us when it\'s done.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'What to include';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Everything';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Export every message you have ever sent, plus all of your account settings, memberships, and metadata.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Custom selection';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Choose which conversation kinds, communities, and time window to include in the archive.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Choose what to include';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Pick which kinds of conversations to clean up.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Only places I can\'t access anymore';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Only delete messages from communities and group DMs you have left or been removed from.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Which conversations';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Toggle the kinds of conversations you want included.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Open DMs';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Closed DMs';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Which communities';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Community filter';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Include all except selected';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Only the selected ones';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'You aren\'t in any communities right now.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Time range';

  @override
  String get privacyDashboardDataRequestDateMode => 'Time range';

  @override
  String get privacyDashboardDataRequestAllTime => 'All time';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Custom range';

  @override
  String get privacyDashboardDataRequestStartDate => 'Start date';

  @override
  String get privacyDashboardDataRequestEndDate => 'End date';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Leave either field blank to leave that end of the window unbounded.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Pick at least one kind of conversation to include.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Start date must be earlier than end date.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Review and confirm';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'We\'ll build a downloadable archive of every message you have ever sent and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'We\'ll build a downloadable archive that matches the filters below and email you when it\'s ready. The download link in that email expires after 7 days.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Permanently delete the messages that match the filters below. This cannot be undone.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'There is no recovery once this starts. We will DM you when it finishes.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Request export';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Delete messages';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Scope';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Conversations';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Communities';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Time range';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'None';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'From $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Until $end';
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
      other: '# communities',
      one: '# community',
    );
    return 'All except $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# communities',
      one: '# community',
    );
    return 'Only $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Open direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Closed direct messages';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Direct messages (open and closed)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Group DMs';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Communities';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0 and $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# hours',
      one: '# hour',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# minutes',
      one: '# minute',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# seconds',
      one: '# second',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'Failed to load privacy settings';

  @override
  String get privacyDashboardRetry => 'Retry';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Failed to save sensitive content settings.';

  @override
  String get privacyDashboardDataRequestFailed => 'Failed to complete request.';

  @override
  String get chatMessageDeleteFailed => 'Mesaj silme başarısız';

  @override
  String get chatMessageAddReaction => 'Tepki ekle';

  @override
  String get chatMessageEdit => 'Mesajı düzenle';

  @override
  String get chatMessageReply => 'Yanıtla';

  @override
  String get chatMessageForward => 'İlet';

  @override
  String get forwardMessageTitle => 'Mesajı ilet';

  @override
  String get forwardSearchHint => 'Kanal veya DM ara';

  @override
  String get forwardDirectMessagesSection => 'Doğrudan Mesajlar';

  @override
  String get forwardCommentHint => 'Yorum ekle (isteğe bağlı)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Gönder ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Kanal bulunamadı';

  @override
  String get forwardSuccessToast => 'Mesaj iletildi';

  @override
  String get forwardFailed => 'Mesaj iletilemedi';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Seçilen bir kanalda yavaş mod etkin olduğundan yorumlar kullanılamıyor.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Waiting for slowmode in one or more selected channels to expire.';

  @override
  String get slowmodeRateLimitedTitle => 'Slowmode active';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Slowmode is on — wait $duration before sending another.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Direct upload is disabled during slowmode.';

  @override
  String get shareMediaTitle => 'Share to';

  @override
  String get shareMediaMessageHint => 'Add an optional message…';

  @override
  String get shareMediaSendButton => 'Send';

  @override
  String get shareMediaSuccessToast => 'Media shared';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Shared to $count destinations';
  }

  @override
  String get shareMediaFailedToast => 'Failed to share media';

  @override
  String get forwardDestinationNoSendPermission => 'Buraya mesaj gönderemezsin';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Buraya bağlantı ekleyemezsin';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Buraya dosya ekleyemezsin';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Bu toplulukta mesaj gönderme devre dışı';

  @override
  String get forwardDestinationTimedOut => 'Bu toplulukta zaman aşımındasın';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Yavaş mod - $remaining bekle';
  }

  @override
  String get chatMessageCopyText => 'Mesajı kopyala';

  @override
  String get chatMessageTranslate => 'Translate';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Translated from $language';
  }

  @override
  String get chatMessageSeeOriginal => 'See original';

  @override
  String get chatMessageSeeTranslation => 'See translation';

  @override
  String get chatMessageTranslating => 'Translating…';

  @override
  String get chatMessageTranslateFailed => 'Couldn\'t translate this message.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Translation isn\'t available on this device.';

  @override
  String get chatMessageSpeak => 'Speak message';

  @override
  String get chatMessageStopSpeaking => 'Stop speaking';

  @override
  String get chatMessagePin => 'Mesajı sabitle';

  @override
  String get chatMessageUnpin => 'Mesajı sabitlemeyi kaldır';

  @override
  String get chatMessageUnpinIt => 'Sabitlemeyi kaldır';

  @override
  String get chatMessageBookmark => 'Mesajı yer imlerine ekle';

  @override
  String get chatMessageRemoveBookmark => 'Yer işaretini kaldır';

  @override
  String get chatMessageMarkAsUnread => 'Okunmadı olarak işaretle';

  @override
  String get chatMessageCopyMessageLink => 'Mesaj Bağlantısını Kopyala';

  @override
  String get chatMessageCopyMessageId => 'Mesaj Kimliğini Kopyala';

  @override
  String get chatMessageViewReactions => 'Tepkilere bak';

  @override
  String get chatMessageRemoveAllReactions => 'Tüm tepkileri kaldır';

  @override
  String get chatMessageDebug => 'Mesajı Ayıkla';

  @override
  String get chatMessageDebugSheetTitle => 'Mesajı ayıkla';

  @override
  String get chatMessageDebugCopyJson => 'JSON\'u kopyala';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Mesaj JSON\'u panoya kopyalandı';

  @override
  String get chatReactionsSheetTitle => 'Tepkiler';

  @override
  String get chatReactionsSheetEmpty => 'Henüz kimse tepki vermedi.';

  @override
  String get chatReactionAddFailed => 'Failed to add reaction';

  @override
  String get chatReactionRemoveFailed => 'Failed to remove reaction';

  @override
  String get chatMessageReport => 'Mesajı Bildir';

  @override
  String get iarReportMessageTitle => 'Mesajı bildir';

  @override
  String get iarThisUserFallback => 'bu kullanıcı';

  @override
  String get iarModalDescription =>
      'Kural ihlalini bildir veya iletişim ve tercihleri yönetme araçlarını bul.';

  @override
  String get iarPathStepAriaLabel => 'Neye ihtiyacın var?';

  @override
  String get iarCategoryStepTitle => 'Hangi tür kural ihlal edildi?';

  @override
  String get iarReasonStepTitle => 'Hangi kural ihlal edildi?';

  @override
  String get iarReasonSelectHint => 'Bir neden seç';

  @override
  String get iarPickAnOptionToast => 'Devam etmek için bir seçenek belirleyin.';

  @override
  String get iarPickARuleToast => 'İhlal edilen kuralı seçin.';

  @override
  String get iarPathPlatform => 'Platform kuralı ihlalini bildir';

  @override
  String get iarPathCommunity => 'Bu topluluğun moderatörlerine bildir';

  @override
  String get iarPathPreferenceMessage => 'Bu içeriği beğenmedim';

  @override
  String get iarCategoryTargetedHarmLabel => 'Tehdit, taciz veya zarar';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Zorbalık, tehdit, nefret söylemi, şiddet, baskınlar veya kendine zarar vermeyi teşvik eden içerik.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'Çocuk güvenliği veya yetişkinlere yönelik içerik';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Risk altındaki reşit olmayanlar, yanlış yerde bulunan yetişkinlere yönelik içerik veya istenmeyen davranışlar.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Gizlilik veya kimlik taklidi';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, takip, başkası gibi davranma veya uygunsuz profil.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Dolandırıcılık, kötü amaçlı yazılım veya yanlış bilgilendirme';

  @override
  String get iarCategoryDeceptionDescription =>
      'Kimlik avı, dolandırıcılık, kötü amaçlı bağlantılar veya gerçek dünyada zarara neden olma olasılığı yüksek yanlış iddialar.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Yasa dışı faaliyet veya başka bir şey';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Yasa dışı satışlar, suç teşkil eden eylemlere yardım etme veya yukarıdakilere uymayan bariz bir kural ihlali.';

  @override
  String get iarReasonHarassmentLabel => 'Taciz veya tehditler';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Zorbalık, tekrarlanan istenmeyen iletişim, takip veya hedefli taciz.';

  @override
  String get iarReasonHateLabel => 'Nefret söylemi';

  @override
  String get iarReasonHateMessageDescription =>
      'Aşağılayıcı ifadeler, insanlıktan çıkarma dili veya korunan gruplara yönelik saldırılar.';

  @override
  String get iarReasonViolenceLabel => 'Şiddet veya şiddet tehditleri';

  @override
  String get iarReasonViolenceDescription =>
      'Güvenilir tehditler, grafik şiddet veya şiddetin yüceltilmesi.';

  @override
  String get iarReasonMatureContentLabel =>
      'Yetişkinlere yönelik içerik veya taciz';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Yanlış yerde bulunan yetişkinlere yönelik içerik veya istenmeyen davranış.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Çocuk güvenliği veya reşit olmayanların istismarı';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Reşit olmayanları kandırma veya istismar etme içeriği.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Zararlı yanlış bilgilendirme';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Gerçek dünyada zarara neden olma olasılığı yüksek yanlış iddialar.';

  @override
  String get iarReasonSpamLabel => 'Spam, dolandırıcılık veya kimlik avı';

  @override
  String get iarReasonSpamMessageDescription =>
      'Toplu spam, dolandırıcılık, sahte çekilişler veya hesap kötüye kullanımı.';

  @override
  String get iarReasonMalwareLabel =>
      'Kötü amaçlı yazılım veya tehlikeli bağlantılar';

  @override
  String get iarReasonMalwareDescription =>
      'Kötü amaçlı yazılım, kimlik bilgisi hırsızlığı veya zararlı dosyalar.';

  @override
  String get iarReasonPrivacyLabel => 'Gizlilik ihlali';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, ifşa edilmiş özel bilgiler veya takip.';

  @override
  String get iarReasonImpersonationLabel =>
      'Kimlik taklidi veya aldatıcı medya';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Aldatıcı yapay zeka tarafından oluşturulmuş içerik dahil, başkası gibi davranma.';

  @override
  String get iarReasonIllegalLabel => 'Yasa dışı faaliyet';

  @override
  String get iarReasonIllegalDescription =>
      'Yasa dışı satışlar, suç teşkil eden eylemlere yardım etme veya yasa dışı faaliyet.';

  @override
  String get iarReasonSelfHarmLabel => 'Kendine zarar verme veya intihar';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Kendine zarar vermeyi veya yeme bozukluklarını teşvik eden öneriler veya talimatlar.';

  @override
  String get iarReasonOtherLabel => 'Başka bariz bir kural ihlali';

  @override
  String get iarReasonOtherDescription =>
      'Yalnızca Fluxer\'ın kurallarını açıkça ihlal ediyorsa ve yukarıdakilere uymuyorsa kullanın.';

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Eğer bir reşit olmayan dahilse, bunun yerine \"$childSafetyReason\" kullanın.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Bu, CSAM veya bir reşit olmayanın istismarını içeriyorsa, bunu hemen gönderin ve materyali yeniden paylaşmayın.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Birisi acil tehlikede olabilirse, güvenli bir şekilde yapabiliyorsanız yerel acil durum servisleriyle iletişime geçin.';

  @override
  String get iarSafetyNoteViolence =>
      'Bu güvenilir ve acil bir tehditse, yerel acil durum servisleriyle de iletişime geçin.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Bu acil bir terör tehdidi ise, yerel acil durum servisleriyle de iletişime geçin.';

  @override
  String get iarActionBlockUserTitle => 'Bu kullanıcıyı engelle';

  @override
  String get iarActionBlockUserDescription =>
      'Mesajları ve arkadaşlık isteklerini durdur.';

  @override
  String get iarActionBlockUserButton => 'Engelle';

  @override
  String get iarActionCopyMessageLinkTitle => 'Mesaj bağlantısını kopyala';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Topluluk yöneticileriyle paylaşın.';

  @override
  String get iarActionCopyMessageLinkButton => 'Kopyala';

  @override
  String get iarActionCloseDmTitle => 'Bu DM\'yi kapat';

  @override
  String get iarActionCloseDmDescription =>
      'Engellemez. Daha sonra yeniden açabilirsiniz.';

  @override
  String get iarActionCloseDmButton => 'DM\'yi Kapat';

  @override
  String get iarActionLeaveCommunityTitle => 'Topluluktan Ayrıl';

  @override
  String get iarActionLeaveCommunityDescription =>
      'İçeriğini ve üyelerini görmeyi bırak.';

  @override
  String get iarActionLeaveCommunityButton => 'Ayrıl';

  @override
  String get iarActionDmSettingsTitle => 'DM ve Arkadaş İsteği Ayarları';

  @override
  String get iarActionDmSettingsDescription =>
      'Sana kimlerin ulaşabileceğini değiştir.';

  @override
  String get iarActionCallSettingsTitle => 'Arama ve Grup Sohbeti Ayarları';

  @override
  String get iarActionCallSettingsDescription =>
      'Seni kimlerin arayabileceğini veya ekleyebileceğini değiştir.';

  @override
  String get iarActionOpenButton => 'Aç';

  @override
  String get iarActionDeleteMessageTitle => 'Bu Mesajı Sil';

  @override
  String get iarActionDeleteMessageDescription =>
      'Herkes için kanaldan kaldır.';

  @override
  String get iarActionDeleteMessageButton => 'Sil';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Silindi';

  @override
  String get iarActionDeleteMessageDeletedTooltip => 'Bu mesaj zaten silindi.';

  @override
  String get iarActionBanUserTitle => 'Bu Kullanıcıyı Engelle';

  @override
  String get iarActionBanUserDescription =>
      'Bu topluluk için engelleme iletişim kutusunu aç.';

  @override
  String get iarActionBanUserButton => 'Engelle';

  @override
  String get iarActionBanUserBannedButton => 'Engellendi';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Bu kullanıcı topluluktan zaten engellenmiş.';

  @override
  String get iarCloseDmConfirmTitle => 'DM\'yi Kapat';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return '$name ile mevcut DM\'ni kapat. Bu onları engellemez; daha sonra yeniden açabilirsin.';
  }

  @override
  String get iarSuccessTitle => 'Rapor Gönderildi';

  @override
  String get iarSuccessBody =>
      'Güvenlik ekibimiz inceliyor. Bir karara vardıktan sonra sana DM ve e-posta göndereceğiz.';

  @override
  String get iarAlreadyReportedTitle => 'Zaten Raporlandı';

  @override
  String get iarAlreadyReportedBody =>
      'Bu mesajı zaten bildirdin. Güvenlik ekibimiz inceliyor.';

  @override
  String get iarBackButton => 'Geri';

  @override
  String get iarContinueButton => 'Devam Et';

  @override
  String get iarSendReportButton => 'Rapor Gönder';

  @override
  String get iarDoneButton => 'Tamamlandı';

  @override
  String get iarCouldntSendToast =>
      'Rapor gönderilemedi. Lütfen tekrar deneyin.';

  @override
  String get iarRateLimitedToast =>
      'Çok hızlı raporlama yapıyorsun. Lütfen biraz bekle ve tekrar dene.';

  @override
  String get iarReportSentToast =>
      'Rapor gönderildi. Güvenlik ekibimiz inceleyecek.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return '$name engellensin mi? Sana mesaj gönderemeyecek veya arkadaşlık isteği yollayamayacak. Daha sonra engelini kaldırabilirsin.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Bu kullanıcı engellenemedi. Lütfen tekrar deneyin.';

  @override
  String get iarCloseDmSuccessToast => 'DM kapatıldı.';

  @override
  String get iarCloseDmFailedToast =>
      'Bu DM kapatılamadı. Lütfen tekrar deneyin.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Bu topluluktan ayrılamadı. Lütfen tekrar deneyin.';

  @override
  String get chatMessageSuppressEmbeds => 'Gömülmeleri Gizle';

  @override
  String get chatMessageUnsuppressEmbeds => 'Gömülmeleri Göster';

  @override
  String get chatMessageDelete => 'Mesajı Sil';

  @override
  String get chatMessageDeleteConfirmTitle => 'Mesajı Sil';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Bu mesajı silmek istediğinden emin misin?';

  @override
  String get chatMessageDeleteAttachment => 'Delete Attachment';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit Alt Text';

  @override
  String get chatMessageMore => 'Daha Fazla';

  @override
  String get chatEditingMessage => 'Mesaj Düzenleniyor';

  @override
  String get chatReplyOriginalDeleted => 'Orijinal mesaj silindi';

  @override
  String get chatReplyOriginalFailedToLoad => 'Orijinal mesaj yüklenemedi';

  @override
  String get chatReplyAttachedMedia => 'Mesajda medya eklentisi var';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count blocked messages',
      one: '1 blocked message',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potential spammer messages',
      one: '1 potential spammer message',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Reply hidden because the original author is blocked.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Reply hidden because the original author is marked as a spammer.';

  @override
  String get devMarkAsSpamLocally => 'Mark as spam locally';

  @override
  String get devIgnoreSpamFlag => 'Ignore spam flag';

  @override
  String get chatMessagesLoadError => 'Mesajlar yüklenemedi.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Bahsetme tercihini geçersiz kıl?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname, yanıtlarda @bahsedilmeyi tercih ediyor. Yine de bahsetmeden gönderilsin mi?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname, yanıtlarda @bahsetme tercih etmiyor. Yine de bahsetmeyle gönderilsin mi?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Tercihi yoksay';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Yanıtladığınız kişiyi etiketlemeyi devre dışı bırakmak için tıklayın.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Yanıtladığınız kişiyi etiketlemeyi etkinleştirmek için tıklayın.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Yanıtlanan kişiyi etiketle';

  @override
  String get chatReplyMentionOn => 'Açık';

  @override
  String get chatReplyMentionOff => 'Kapalı';

  @override
  String get chatReplyCancel => 'Yanıtı iptal et';

  @override
  String get chatEditMessageHint => 'Mesajı düzenle';

  @override
  String get chatEditNoChanges => 'Kaydedilecek değişiklik yok';

  @override
  String get chatChannelNotReady =>
      'Bu kanal henüz hazır değil. Bir süre sonra tekrar deneyin.';

  @override
  String get chatMessageEdited => '(düzenlendi)';

  @override
  String get chatMessageSilent => 'Bu @sessiz bir mesajdı.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Bugün saat $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Dün saat $time';
  }

  @override
  String get mediaViewerImagePreview => 'Görüntü önizlemesi';

  @override
  String get mediaViewerClose => 'Medya görüntüleyiciyi kapat';

  @override
  String get mediaViewerOpenInBrowser => 'Tarayıcıda aç';

  @override
  String get mediaViewerOptions => 'Media options';

  @override
  String get mediaViewerCopyLink => 'Copy link';

  @override
  String get mediaViewerForward => 'İlet';

  @override
  String get mediaViewerZoomIn => 'Yakınlaştır';

  @override
  String get mediaViewerZoomOut => 'Uzaklaştır';

  @override
  String get mediaViewerPreviousAttachment => 'Önceki ek';

  @override
  String get mediaViewerNextAttachment => 'Sonraki ek';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Attachment $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Dismiss';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Video kontrollerini değiştir';

  @override
  String get chatAttachmentVideoMute => 'Videoyu sessize al';

  @override
  String get chatAttachmentVideoUnmute => 'Videoyu sesi aç';

  @override
  String get chatAttachmentVideoPlay => 'Videoyu oynat';

  @override
  String get chatAttachmentVideoPause => 'Videoyu duraklat';

  @override
  String get chatAttachmentVideoProgress => 'Video ilerlemesi';

  @override
  String get chatVideoPlaybackFailed => 'Bu video oynatılamadı.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Bu role sahip ve bu kanalı görüntüleme izni olan kullanıcıları bilgilendir.';

  @override
  String get composerAutocompleteSuggestions => 'Suggestions';

  @override
  String get composerAutocompleteCommandsHeading => 'Commands';

  @override
  String get composerAutocompleteChoicesHeading => 'Choices';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Optional arguments';

  @override
  String get composerAutocompleteChannelsHeading => 'Channels';

  @override
  String get composerAutocompleteMembersHeading => 'Members';

  @override
  String get composerAutocompleteUsersHeading => 'Users';

  @override
  String get composerAutocompleteMentionsHeading => 'Mentions';

  @override
  String get composerAutocompleteRolesHeading => 'Roles';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Stickers';

  @override
  String get composerAutocompleteGifsHeading => 'GIFs';

  @override
  String get composerAutocompleteNoGifs => 'No GIFs found';

  @override
  String get composerCommandShrugDescription =>
      'Appends ¯\\_(ツ)_/¯ to your message.';

  @override
  String get composerCommandTableflipDescription =>
      'Appends (╯°□°)╯︵ ┻━┻ to your message.';

  @override
  String get composerCommandUnflipDescription =>
      'Appends ┬─┬ ノ( ゜-゜ノ) to your message.';

  @override
  String get composerCommandMeDescription =>
      'Send an action message (wraps in italics).';

  @override
  String get composerCommandSpoilerDescription =>
      'Send a spoiler message (wraps in spoiler tags).';

  @override
  String get composerCommandTtsDescription => 'Send a text-to-speech message.';

  @override
  String get composerCommandNickDescription =>
      'Change your nickname in this community.';

  @override
  String get composerCommandKickDescription =>
      'Kick a member from this community.';

  @override
  String get composerCommandBanDescription =>
      'Ban a member from this community.';

  @override
  String get composerCommandMsgDescription =>
      'Send a direct message to a user.';

  @override
  String get composerCommandSavedDescription => 'Send a saved media item.';

  @override
  String get composerCommandStickerDescription => 'Send a sticker.';

  @override
  String get composerCommandGifDescription => 'Search for and send a GIF.';

  @override
  String get composerCommandMemberOption => 'The member to target.';

  @override
  String get composerCommandReasonOption => 'Reason (optional).';

  @override
  String get composerCommandMessageOption => 'The message to send.';

  @override
  String get composerCommandQueryOption => 'What to search for.';

  @override
  String get composerCommandNicknameOption =>
      'Your new nickname, or leave blank to reset it.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'How much of the member\'s recent message history to delete.';

  @override
  String get composerCommandDeleteMessagesNone => 'Don\'t delete any';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Previous $count days';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Previous 24 hours';

  @override
  String get composerCommandOptionRequired =>
      'This option is required. Please provide a value.';

  @override
  String get composerCommandClear => 'Clear command';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'You changed your nickname in this community from **$previousNickname** to **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Unknown user';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Failed to send a message to **$username**. They may have DMs disabled or you may be blocked.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count more';
  }

  @override
  String get addGuildModalTitle => 'Bir topluluk ekle';

  @override
  String get addGuildModalLandingDescription =>
      'Yeni bir topluluk oluşturun veya mevcut bir topluluğa katılın.';

  @override
  String get addGuildCreateCommunity => 'Topluluk oluştur';

  @override
  String get addGuildJoinCommunity => 'Topluluğa katıl';

  @override
  String get addGuildImportDiscordTemplate => 'Discord şablonunu içe aktar';

  @override
  String get addGuildJoinTitle => 'Bir topluluğa katıl';

  @override
  String get addGuildJoinDescription =>
      'Bir topluluğa katılmak için davet bağlantısını girin.';

  @override
  String get addGuildInviteLinkLabel => 'Davet bağlantısı';

  @override
  String get addGuildJoinSubmit => 'Topluluğa katıl';

  @override
  String get addGuildInviteInvalid => 'Bu davet geçersiz veya süresi dolmuş.';

  @override
  String get addGuildJoinFailed =>
      'Topluluğa katılım sağlanamadı. Lütfen tekrar deneyin.';

  @override
  String get addGuildCreateTitle => 'Topluluk oluştur';

  @override
  String get addGuildCreateDescription =>
      'Sen ve arkadaşların için sohbet edebileceğiniz bir topluluk oluştur.';

  @override
  String get addGuildCreateNameLabel => 'Topluluk adı';

  @override
  String get addGuildCreateSubmit => 'Topluluk oluştur';

  @override
  String get addGuildCreateFailed =>
      'Topluluk oluşturulamadı. Lütfen tekrar dene.';

  @override
  String get addGuildCreateClaimTitle => 'Hesabını onayla';

  @override
  String get addGuildCreateClaimDescription =>
      'Topluluk oluşturabilmek için önce hesabını onaylaman gerekiyor.';

  @override
  String get addGuildCreateVerifyTitle => 'E-postanı doğrula';

  @override
  String get addGuildCreateVerifyDescription =>
      'Topluluk oluşturabilmek için önce e-posta adresini doğrulaman gerekiyor.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Yeni bir topluluk oluştururken hareketli simgeler desteklenmiyor. Sabit bir görsel kullan.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Topluluk oluşturarak, şunlara uymayı ve bunları desteklemeyi kabul etmiş olursun: ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName topluluk kuralları';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Bu sunucu tek bir toplulukla sınırlıdır, bu nedenle başka topluluklar oluşturulamaz.';

  @override
  String get addGuildCreateChangeIcon => 'Simgeyi değiştir';

  @override
  String get addGuildCreateIconLabel => 'Topluluk simgesi';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Maks. 10MB. Önerilen: 512×512 piksel';

  @override
  String get addGuildPackInstalled => 'Paket başarıyla yüklendi.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Tüm Tepkileri Kaldır';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Bu mesajdaki tüm tepkileri kaldırmak istediğinizden emin misiniz?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Mesajı sabitlemeyi kaldır';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Bu sabitlemeyi geçmişe mi göndereceksin?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username, $messageLink mesajını bu kanala sabitledi. $allPinsLink görüntüleyin.';
  }

  @override
  String get systemPinMessageMessageLink => 'bir mesaj';

  @override
  String get systemPinMessageAllPinsLink => 'tüm sabitlenmiş mesajları';

  @override
  String get channelPinsEmptyTitle => 'Sabitlenmiş mesaj yok';

  @override
  String get channelPinsEmptyDescription =>
      'Sabitlenmiş mesajlar burada görünür.';

  @override
  String get channelDetailsFallbackTitle => 'Details';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Group DM · $count members';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Close your conversation with $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Leave $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Channel settings';

  @override
  String get channelDetailsGroupSettingsTitle => 'Group Settings';

  @override
  String get channelDetailsDmSettingsTitle => 'DM Settings';

  @override
  String get channelDetailsInvitePeople => 'Invite People';

  @override
  String get channelDetailsCopyLink => 'Copy Link';

  @override
  String get channelMenuCopyChannelLink => 'Copy channel link';

  @override
  String get channelMenuCopyRedirectLink => 'Copy redirect link';

  @override
  String get channelDetailsAddFriendsToGroup => 'Add friends to group';

  @override
  String get channelDetailsGroupInvites => 'Group invites';

  @override
  String get channelDetailsEditChannel => 'Edit channel';

  @override
  String get channelDetailsDeleteChannel => 'Delete channel';

  @override
  String get channelSettingsCategorySettingsTitle => 'Category settings';

  @override
  String get channelSettingsEditCategory => 'Edit category';

  @override
  String get channelSettingsTabOverview => 'Overview';

  @override
  String get channelSettingsTabPermissions => 'Permissions';

  @override
  String get channelSettingsTabInvites => 'Invites';

  @override
  String get channelSettingsTabWebhooks => 'Webhooks';

  @override
  String get channelSettingsDeleteChannel => 'Delete channel';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Are you sure you want to delete $channelName? This cannot be undone.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Are you sure you want to delete $categoryName? This cannot be undone.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Delete category';

  @override
  String get channelSettingsChannelUpdated => 'Channel updated';

  @override
  String get channelSettingsChannelName => 'Channel name';

  @override
  String get channelSettingsCategoryName => 'Category name';

  @override
  String get channelSettingsMyCategory => 'My category';

  @override
  String get categoryExpandCategory => 'Expand category';

  @override
  String get categoryCollapseCategory => 'Collapse category';

  @override
  String get categoryExpandAllCategories => 'Expand all categories';

  @override
  String get categoryCollapseAllCategories => 'Collapse all categories';

  @override
  String get categoryMuteCategory => 'Mute category';

  @override
  String get categoryUnmuteCategory => 'Unmute category';

  @override
  String get categoryCopyCategoryId => 'Copy category ID';

  @override
  String get categoryIdCopied => 'Category ID copied';

  @override
  String get channelSettingsChannelNamePlaceholder => 'general';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Topic';

  @override
  String get channelSettingsTopicPlaceholder => 'Add a topic to this channel';

  @override
  String get channelSettingsInsertEmoji => 'Insert emoji';

  @override
  String get channelSettingsTopicTooLongTitle => 'Channel topic is too long.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Shorten the topic and try again.';

  @override
  String get channelSettingsSlowmode => 'Slowmode';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Wait between messages. \"$bypassSlowmodePermissionLabel\" can bypass it.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Off';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds seconds';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes minutes';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours hours';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute minute';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour hour';
  }

  @override
  String get channelSettingsVoiceQuality => 'Voice quality';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Higher bitrate = better quality and higher bandwidth usage.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Participant limit';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Maximum members who can join at once. 0 means unlimited.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count participants',
      one: '1 participant',
      zero: '∞ No limit',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Connection limit';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Maximum active connections one member can keep in this channel.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count connections',
      one: '1 connection',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Voice region';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Select a voice region for this channel. Automatic uses the closest region.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Automatic';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Couldn\'t load voice regions';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Try again in a moment.';

  @override
  String get channelSettingsResetSlider => 'Reset slider to default value';

  @override
  String get channelSettingsAdvanced => 'Advanced';

  @override
  String get channelSettingsMatureContentOverride => 'Mature content override';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Override the $scopeLevel-level setting for this channel. Mature content is shown behind a gate before entry.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Inherit';

  @override
  String get channelSettingsMatureContentOn => 'On';

  @override
  String get channelSettingsMatureContentOff => 'Off';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Marks this channel for mature content.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Leave this channel ungated for mature content.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Inherited from $inheritedSourceLabel: on';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Inherited from $inheritedSourceLabel: off';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'category';

  @override
  String get channelSettingsMatureContentCommunitySource => 'community';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Category';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Community';

  @override
  String get channelSettingsContentWarningToggle =>
      'Show a content warning in this channel';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Turns on a consent prompt before entering this channel.';

  @override
  String get channelSettingsContentWarningText => 'Custom warning text';

  @override
  String get channelSettingsContentWarningDefault =>
      'This contains sensitive content.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'You need the \"$manageChannelsPermissionLabel\" permission to edit these permissions.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'You need the \"$manageRolesPermissionLabel\" permission to edit these permissions.';
  }

  @override
  String get channelSettingsUnknownRole => 'Unknown role';

  @override
  String get channelSettingsUnknownUser => 'Unknown user';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'Access overrides';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Edit access for $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides => 'Back to overrides';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Configure base access for this channel';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Configure overrides for this role';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Configure overrides for this member';

  @override
  String get channelSettingsPermissionsSearchPlaceholder =>
      'Search permissions…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Channel access updated';

  @override
  String get channelSettingsPermissionsTitle => 'Access control';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'This channel is synced with the parent category ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'This channel is not synced with the parent category ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => 'Sync with category';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Channel synced with parent category';

  @override
  String get channelSettingsPermissionsAddOverride => 'Add override';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Search roles or members…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roles and members';

  @override
  String get channelSettingsDeleteInvite => 'Delete invite';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Delete this invite? Can\'t be undone.';

  @override
  String get channelSettingsCopyInviteCode => 'Copy invite code';

  @override
  String get channelSettingsCopyInviteUrl => 'Copy invite URL';

  @override
  String get channelSettingsWebhookCreated => 'Webhook created';

  @override
  String get channelSettingsWebhookCreateFailed => 'Failed to create webhook';

  @override
  String get channelSettingsCreateWebhook => 'Create webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Manage invite links for this channel.';

  @override
  String get channelSettingsInvitesCreate => 'Create invite';

  @override
  String get channelSettingsInvitesEmpty => 'No invite links';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'This channel doesn\'t have any invite links yet. Create one to invite people to this channel.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'There was an error loading the invite links for this channel. Try again.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Manage incoming webhooks that can post messages into this channel.';

  @override
  String get channelSettingsWebhooksEmpty => 'No webhooks';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'There are no webhooks configured for this channel. Create a webhook to allow external applications to post messages.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'This channel does not support webhooks.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'You need the \"$permission\" permission to view and edit webhooks for this channel.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Failed to load webhooks';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'There was an error loading the webhooks for this channel. Try again.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Created by $creator on $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Unknown user';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Upload image';

  @override
  String get channelSettingsWebhooksRemove => 'Remove';

  @override
  String get channelSettingsWebhooksName => 'Name';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook name';

  @override
  String get channelSettingsWebhooksChannel => 'Channel';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook URL';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Copy webhook URL';

  @override
  String get channelSettingsWebhooksDelete => 'Delete webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Couldn\'t delete this webhook';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Delete this webhook? Can\'t be undone.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Try again in a moment.';

  @override
  String get channelMenuOpenChat => 'Open chat';

  @override
  String get channelMenuDuplicateChannel => 'Duplicate channel';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Reset mature content agreement state';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Delete your messages in this channel?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'This will permanently delete every message you have ever sent in this channel. This cannot be undone.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Delete My Messages';

  @override
  String get channelMenuDeletedYourMessages => 'Deleted your messages';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Couldn\'t delete your messages';

  @override
  String get channelDetailsSystemMessage => 'System message';

  @override
  String get channelDetailsTextChannel => 'Text channel';

  @override
  String get channelDetailsVoiceChannel => 'Voice channel';

  @override
  String get channelDetailsCategory => 'Category';

  @override
  String get channelDetailsLinkChannel => 'Link channel';

  @override
  String get channelDetailsGenericChannel => 'Channel';

  @override
  String get channelDetailsMutedConversation => 'Muted conversation';

  @override
  String get channelDetailsUnmutedConversation => 'Unmuted conversation';

  @override
  String get channelDetailsMutedChannel => 'Muted channel';

  @override
  String get channelDetailsUnmutedChannel => 'Unmuted channel';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Notification settings updated';

  @override
  String get channelDetailsTabMembers => 'Members';

  @override
  String get channelDetailsTabPins => 'Pins';

  @override
  String get channelDetailsActionMute => 'Mute';

  @override
  String get channelDetailsActionUnmute => 'Unmute';

  @override
  String get channelDetailsActionSearch => 'Search';

  @override
  String get channelDetailsActionMore => 'More';

  @override
  String get channelDetailsMembersEmptyTitle => 'No members to show';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Members will appear here once the community data is loaded.';

  @override
  String get memberListPermissionDeniedTitle => 'You can\'t view members';

  @override
  String get memberListPermissionDeniedBody =>
      'You can\'t view the members of this channel in this community';

  @override
  String get memberListUnavailableTitle => 'Member list unavailable';

  @override
  String get memberListUnavailableBody =>
      'Member lists are temporarily unavailable in this community';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'Pins could not be loaded';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Members with the \"Pin Messages\" permission can pin messages for everyone to see.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'You can pin messages in this conversation for everyone to see.';

  @override
  String get channelDetailsPinsEndReached => 'You\'ve reached the end';

  @override
  String get channelHeaderOpenDetails => 'Open channel details';

  @override
  String get channelHeaderPinnedMessages => 'Pinned messages';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Pinned messages, unread';

  @override
  String get channelHeaderMemberList => 'Member list';

  @override
  String get channelHeaderInbox => 'Inbox';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Notification settings, muted';

  @override
  String get channelDetailsSearchTitle => 'Search';

  @override
  String get channelDetailsSearchHint => 'Search Messages';

  @override
  String get channelDetailsSearchFilterFrom => 'From';

  @override
  String get channelDetailsSearchFilterHas => 'Has';

  @override
  String get channelDetailsSearchFilterIn => 'In';

  @override
  String get channelDetailsSearchFilterMentions => 'Mentions';

  @override
  String get channelDetailsSearchFilterMore => 'More';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Active';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count channels';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count users';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'User';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Filter by channel';

  @override
  String get channelDetailsSearchChannelsHint => 'Search channels';

  @override
  String get channelDetailsSearchChannelsEmpty => 'No channels found';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Pinned';

  @override
  String get channelDetailsSearchPinnedTrue => 'Pinned only';

  @override
  String get channelDetailsSearchPinnedFalse => 'Exclude pinned';

  @override
  String get channelDetailsSearchClearFilter => 'Clear';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Author type';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Date';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Date mode';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Pick a date';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Link hostname';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Filename contains';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'File extension';

  @override
  String get channelDetailsSearchContentPoll => 'Poll';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Messages with a poll';

  @override
  String get channelDetailsSearchContentForward => 'Forward';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Forwarded messages';

  @override
  String get channelDetailsSearchFilterSort => 'Sort';

  @override
  String get channelHeaderSearchFiltersTitle => 'Search Filters';

  @override
  String get channelHeaderSearchRecentTitle => 'Recent Searches';

  @override
  String get channelHeaderSearchUsersTitle => 'Users';

  @override
  String get channelHeaderSearchChannelsTitle => 'Channels';

  @override
  String get channelHeaderSearchValuesTitle => 'Values';

  @override
  String get channelHeaderSearchDatesTitle => 'Dates';

  @override
  String get channelHeaderSearchDefaultBadge => 'Default';

  @override
  String get channelHeaderSearchClearHistory => 'Clear';

  @override
  String get channelHeaderSearchFilterDescFrom => 'a user';

  @override
  String get channelHeaderSearchFilterDescMentions => 'a user';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'link, embed, image, video, sound, file, sticker, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'a date or date range';

  @override
  String get channelHeaderSearchFilterDescOn => 'a date or date range';

  @override
  String get channelHeaderSearchFilterDescDuring => 'a date or date range';

  @override
  String get channelHeaderSearchFilterDescAfter => 'a date or date range';

  @override
  String get channelHeaderSearchFilterDescIn => 'a channel';

  @override
  String get channelHeaderSearchFilterDescPinned => 'true or false';

  @override
  String get channelHeaderSearchFilterDescAuthorType => 'user, bot, or webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'a hostname, e.g. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'part of an attachment filename';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'a file extension, e.g. png';

  @override
  String get channelHeaderSearchFilterDescSort => 'timestamp or relevance';

  @override
  String get channelHeaderSearchFilterDescOrder => 'asc or desc';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Results',
      one: '1 Result',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filter by user';

  @override
  String get channelDetailsSearchFilterByContent => 'Filter by content';

  @override
  String get channelDetailsSearchSortBy => 'Sort results by';

  @override
  String get channelDetailsSearchIn => 'Search In';

  @override
  String get channelDetailsSearchEmptyTitle => 'Search this conversation';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Enter text, an author, or a content filter to find messages.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Messages are indexing';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Try again shortly once search finishes indexing this scope.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'No results';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Try different search terms or filters.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'You';

  @override
  String get channelDetailsSearchUsersHint => 'Search users';

  @override
  String get channelDetailsSearchUsersTypeToSearch => 'Type to search members';

  @override
  String get channelDetailsSearchUsersEmpty => 'No users found';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'No users available';

  @override
  String get channelDetailsDone => 'Done';

  @override
  String get channelDetailsHasFilterPrompt => 'Show messages that contain:';

  @override
  String get channelDetailsRetry => 'Retry';

  @override
  String get channelDetailsPinnedMessageTitle => 'Pinned Message';

  @override
  String get channelDetailsSearchResultTitle => 'Search Result';

  @override
  String get channelDetailsJumpToMessage => 'Jump to Message';

  @override
  String get channelDetailsUnpinMessage => 'Unpin Message';

  @override
  String get channelDetailsCopyMessageLink => 'Copy Message Link';

  @override
  String get channelDetailsCopyMessageId => 'Copy Message ID';

  @override
  String get channelDetailsMessageUnpinned => 'Message unpinned';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Current Community';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Current DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'All Communities';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'All DMs Only';

  @override
  String get channelDetailsSearchScopeAllDms => 'All DMs';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Open DMs Only';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Open DMs';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'All DMs + Communities';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Open DMs + Communities';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Search only in the current Community';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Search only in the current DM';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Across all Communities you\'re currently in';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Across all DMs you\'ve ever been in only';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Across all DMs you\'ve ever been in';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Across all DMs you currently have open only';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Across all DMs you currently have open';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Across all DMs you\'ve ever been in + all Communities you\'re currently in';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Across all DMs you currently have open + all Communities you\'re currently in';

  @override
  String get channelDetailsSearchSortNewest => 'Newest First';

  @override
  String get channelDetailsSearchSortOldest => 'Oldest First';

  @override
  String get channelDetailsSearchSortRelevance => 'Most Relevant';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Show most recent messages first';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Show oldest messages first';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Show most relevant messages first';

  @override
  String get channelDetailsSearchContentImage => 'Image Upload';

  @override
  String get channelDetailsSearchContentVideo => 'Video Upload';

  @override
  String get channelDetailsSearchContentAudio => 'Audio Upload';

  @override
  String get channelDetailsSearchContentFile => 'File Upload';

  @override
  String get channelDetailsSearchContentLink => 'Link';

  @override
  String get channelDetailsSearchContentEmbed => 'Link Preview or Embed';

  @override
  String get channelDetailsSearchContentSticker => 'Sticker';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Uploaded image files only';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Uploaded video files only';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Uploaded audio files only';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Any uploaded attachment';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Typed URL in the message text';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Resolved previews and rich embeds, not uploads';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker attached to the message';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count types';
  }

  @override
  String get personalNotesTitle => 'Kişisel notlar';

  @override
  String get personalNotesSubtitle =>
      'Düşünceleriniz ve hatırlatıcılarınız için özel alanınız';

  @override
  String groupDmWelcome(String displayName) {
    return 'Welcome to $displayName. Add friends to get the group going.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Edit group';

  @override
  String get groupDmWelcomeAddFriends => 'Add friends to group';

  @override
  String get dmGroupInvites => 'Invites';

  @override
  String get groupDmEditTitle => 'Edit group';

  @override
  String get groupDmEditDetailsTooltip => 'Edit group details';

  @override
  String get groupDmGroupName => 'Group name';

  @override
  String get groupDmMyGroup => 'My group';

  @override
  String get groupDmGroupNameMaxLength =>
      'Group name must not exceed 100 characters';

  @override
  String get groupDmGroupIcon => 'Group icon';

  @override
  String get groupDmUploadIcon => 'Upload icon';

  @override
  String get groupDmChangeIcon => 'Change icon';

  @override
  String get groupDmRemoveIcon => 'Remove icon';

  @override
  String get groupDmUpdated => 'Group updated';

  @override
  String get groupDmUpdateFailed => 'Couldn\'t update group. Try again.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animated icons are not supported. Use a static image.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Animated icons are not supported';

  @override
  String get groupDmIconFileTooLargeTitle => 'Icon file is too large';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Icon file is too large. Choose a file smaller than $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Unsupported icon format';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Unsupported file type.';

  @override
  String get groupDmCouldntProcessImage => 'Couldn\'t process image';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Failed to process the cropped image. Try again.';

  @override
  String get groupDmInvalidImage => 'Invalid image';

  @override
  String get groupDmInvalidImageBody =>
      'That image is invalid. Try another one.';

  @override
  String get groupDmAddFriends => 'Add';

  @override
  String get groupDmOrSendInvite => 'or send an invite to a friend:';

  @override
  String get groupDmGenerateInviteLink => 'Generate invite link';

  @override
  String get groupDmCreateInvite => 'Create';

  @override
  String get groupDmInviteExpires24Hours => 'Your invite expires in 24 hours';

  @override
  String get groupDmAddFriendFailed =>
      'Couldn\'t add this friend to the group. Please try again.';

  @override
  String get groupDmAddFailed => 'Couldn\'t add to group';

  @override
  String get groupDmGroupFull =>
      'This group is full. Remove someone before adding more people.';

  @override
  String get groupDmRateLimited =>
      'You\'re going too fast. Wait a moment and try again.';

  @override
  String get groupDmCreateInviteFailed => 'Couldn\'t create invite link';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Couldn\'t generate an invite link. Please try again.';

  @override
  String get groupDmCopyInviteFailed => 'Failed to copy invite link';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Only the group owner can manage invites.';

  @override
  String get groupDmNoInvitesCreated => 'No invites created';

  @override
  String get groupDmLoadingInvites => 'Loading invites...';

  @override
  String get groupDmInvitesLoadFailed => 'Failed to load invites. Try again.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Revoke this invite? Can\'t be undone.';

  @override
  String get groupDmInviteRevoked => 'Invite revoked';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Created by $name. Expires in $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return '$channelName kanalına hoş geldiniz';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Başlangıçta hiçbir şey yoktu. Sonra $channelName oldu. Ve iyiydi.';
  }

  @override
  String get personalNotesComposerHint => 'Kendine mesaj gönder';

  @override
  String channelComposerHint(String channelName) {
    return 'Message #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Message @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Message $groupName';
  }

  @override
  String get groupDmComposerHint => 'Message group';

  @override
  String get composerHint => 'Message';

  @override
  String get composerOpenExpressionPicker => 'Open expression picker';

  @override
  String get composerShowKeyboard => 'Show keyboard';

  @override
  String get composerCloseAttachmentPanel => 'Close attachment picker';

  @override
  String get chatAttachmentPanelPhotos => 'Photos';

  @override
  String get chatAttachmentPanelFiles => 'Files';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Photo library access needed';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Allow photo library access to browse and attach recent photos and videos.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Open settings';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', sending';

  @override
  String get messageAccessibilityFailedSuffix => ', failed to send';

  @override
  String get messageAccessibilityAttachmentSummary => 'an attachment';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count attachments';
  }

  @override
  String get messageAccessibilityImageSummary => 'an image';

  @override
  String get messageAccessibilityVideoSummary => 'a video';

  @override
  String get messageAccessibilityAudioSummary => 'an audio file';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'sticker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'file $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'a spoiler attachment';

  @override
  String get messageAccessibilityEmbedSummary => 'an embed';

  @override
  String get messageAccessibilityEmptySummary => 'a message';

  @override
  String get personalNotesPrivateSpace => 'Özel alanınız';

  @override
  String get purgePersonalNotes => 'Kişisel notları temizle';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Bu işlem, kişisel notlarınızdaki her mesajı ve eki kalıcı olarak silecektir. Bu geri alınamaz.';

  @override
  String get purgePersonalNotesConfirmButton => 'Temizle';

  @override
  String purgePersonalNotesSuccess(int count) {
    return '$count mesaj kişisel notlardan temizlendi';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'Kişisel notlar zaten boştu';

  @override
  String get purgePersonalNotesFailed => 'Kişisel notlar temizlenemedi';

  @override
  String get userSettingsGroupYourAccount => 'HESABINIZ';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Search settings...';

  @override
  String get userSettingsSearchFieldLabel => 'Search settings';

  @override
  String get userSettingsSearchClear => 'Clear search';

  @override
  String get userSettingsSearchNoResults => 'No settings found';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Güvenlik ve Giriş';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Hediyeler ve Kodlar';

  @override
  String get giftSettingsClaimAccountTitle => 'Claim your account';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Claim your account to redeem or manage Plutonium gift codes.';

  @override
  String get giftSettingsRedeemTitle => 'Redeem a gift';

  @override
  String get giftSettingsRedeemDescription =>
      'Enter a gift code to redeem Plutonium for your account.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Enter gift code…';

  @override
  String get giftSettingsRedeemButton => 'Redeem';

  @override
  String get giftSettingsRedeemSuccess =>
      'Gift redeemed successfully. Enjoy your Plutonium.';

  @override
  String get giftSettingsPurchasedTitle => 'Purchased gifts';

  @override
  String get giftSettingsPurchasedDescription =>
      'Manage your purchased Plutonium gift codes. Share the gift URL with someone special or redeem it for yourself!';

  @override
  String get giftSettingsEmptyTitle => 'No gifts yet';

  @override
  String get giftSettingsEmptyDescription =>
      'Buy a Plutonium gift from the Plutonium tab to share with friends.';

  @override
  String get giftSettingsGoToPlutonium => 'Go to Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Failed to load gift inventory';

  @override
  String get giftSettingsLoadFailedDescription => 'Try again later.';

  @override
  String get giftSettingsTryAgain => 'Try again';

  @override
  String get giftSettingsGiftUrl => 'Gift URL';

  @override
  String get giftSettingsCopy => 'Copy';

  @override
  String get giftSettingsCopied => 'Copied';

  @override
  String get giftSettingsGiftUrlCopied => 'Gift URL copied to clipboard!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Couldn\'t copy gift URL';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Purchased $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Redeemed $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Redeemed by $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'This gift has been redeemed';

  @override
  String get giftSettingsRedeemForYourself => 'Redeem for yourself';

  @override
  String get giftSettingsShareWithFriend => 'Share with a friend';

  @override
  String get premiumPlutoniumTagline =>
      'Unlock higher limits and exclusive features while supporting an independent communication platform.';

  @override
  String get premiumPurchaseMode => 'Purchase mode';

  @override
  String get premiumForMe => 'For me';

  @override
  String get premiumAsAGift => 'As a gift';

  @override
  String get premiumMonthly => 'Monthly';

  @override
  String get premiumYearly => 'Yearly';

  @override
  String get premiumPerMonth => 'per month';

  @override
  String get premiumPerYear => 'per year';

  @override
  String get premiumOneTimePurchase => 'one-time purchase';

  @override
  String get premiumSave17 => 'Save 17%';

  @override
  String get premiumUpgradeNow => 'Upgrade now';

  @override
  String get premiumBuyGift => 'Buy gift';

  @override
  String get premiumOneYearGift => '1 year gift';

  @override
  String get premiumOneMonthGift => '1 month gift';

  @override
  String get premiumMostPopular => 'Most popular';

  @override
  String get premiumScrollPrompt =>
      'Scroll down to view all the perks included with Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Free vs Plutonium';

  @override
  String get premiumFreeColumn => 'Free';

  @override
  String get premiumGiftSectionTitle => 'Gift Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Share the Plutonium experience with your friends by purchasing a gift subscription.';

  @override
  String get premiumGiftBannerOne =>
      'You have a new gift code waiting for you!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'You have $count new gift codes waiting for you!';
  }

  @override
  String get premiumViewGifts => 'View gifts';

  @override
  String get premiumReadyToUpgrade => 'Ready to upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Ready to buy a gift?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Monthly $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Yearly $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 year $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 month $price';
  }

  @override
  String get premiumManageSubscription => 'Manage subscription';

  @override
  String get premiumRedeemGiftCode => 'Redeem gift code';

  @override
  String get premiumGiftBadge => 'Gift';

  @override
  String get premiumCancelSubscriptionTitle => 'Cancel subscription?';

  @override
  String get premiumCancelSubscriptionBody =>
      'You keep your perks until your next renewal date, then have a 3-day grace period to resubscribe and keep your subscriber history.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Cancel subscription';

  @override
  String get premiumKeepSubscription => 'Keep subscription';

  @override
  String get premiumPurchaseHistoryTitle => 'Purchase history';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Your recent invoices. To change the payment method for your subscription, add or choose one in the billing portal and make it the default.';

  @override
  String get premiumManagePaymentMethods => 'Manage payment methods';

  @override
  String get premiumBillingHistory => 'Billing history';

  @override
  String get premiumSelfServeRefundTitle => 'Self-serve refund';

  @override
  String get premiumSelfServeRefundButton => 'Refund latest purchase';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'By purchasing, you agree to our ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'By purchasing, you agreed to our ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' and ';

  @override
  String premiumActiveUntil(String date) {
    return 'Active until $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Canceling';

  @override
  String premiumCancelsOn(String date) {
    return 'Cancels on $date. Perks remain active until then.';
  }

  @override
  String get premiumReactivateSubscription => 'Reactivate';

  @override
  String premiumGiftedUntil(String date) {
    return 'Gifted until $date. Does not renew automatically.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Feature';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'By purchasing, you agreed to our $terms and $privacy.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Self-serve refunds available within 3 days of payment, once every 30 days. Refunding a subscription cancels it. EU/EEA buyers waive the 14-day right of withdrawal at checkout to access content immediately. Use the in-app refund button instead of a chargeback. Chargebacks can permanently restrict your account. Stripe handles payment securely. We never see your full card number.';

  @override
  String get premiumTermsOfService => 'Terms of service';

  @override
  String get premiumPrivacyPolicy => 'Privacy policy';

  @override
  String get premiumCheckoutStartFailedTitle => 'Couldn\'t start checkout';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Something went wrong while starting checkout. Please try again in a moment.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'You\'re currently on a gift subscription. It won\'t renew. You can redeem more gift codes to extend it. Recurring subscriptions can be started after your gift time ends.';

  @override
  String get premiumPlanUnavailable =>
      'This plan isn\'t available. Contact support.';

  @override
  String get premiumCompletePaymentTitle => 'Complete payment';

  @override
  String get premiumCompletePaymentBody =>
      'You are now navigating to Stripe to complete the payment. Return to Fluxer once you\'ve completed it.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Choose payment method';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Pay with Pix automático to authorize recurring charges directly from your Brazilian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUsePix => 'Use Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Pay with UPI to set up an RBI-compliant e-mandate from your Indian bank. Or choose use card to enter a credit card on Stripe\'s next screen.';

  @override
  String get premiumUseUpi => 'Use UPI';

  @override
  String get premiumUseCard => 'Use card';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Couldn\'t open the billing portal';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Something went wrong while opening the billing portal. Please try again in a moment.';

  @override
  String get premiumAlreadyVisionaryTitle => 'You\'re already Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary already includes permanent access, so a recurring subscription isn\'t needed. You can still buy gifts for others.';

  @override
  String get premiumExistingSubscriptionTitle => 'Subscription already exists';

  @override
  String get premiumExistingSubscriptionBody =>
      'We found an existing Fluxer Plutonium subscription for this account. Manage it in the secure billing portal to update payment details or check renewal status. If you just paid, wait a minute and reopen this page.';

  @override
  String get premiumPurchasesDisabledTitle => 'Purchases unavailable';

  @override
  String get premiumPurchasesDisabledBody =>
      'Purchases are disabled for this account. Contact support@fluxer.app if this looks wrong.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Claim your account to purchase Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'You need to verify your email before you can purchase Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Custom username tag';

  @override
  String get premiumPerkPerCommunityProfiles => 'Per-community profiles';

  @override
  String get premiumPerkMessageScheduling => 'Message scheduling';

  @override
  String get premiumPerkProfileBadge => 'Profile badge';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Custom video backgrounds';

  @override
  String get premiumPerkEntranceSounds => 'Entrance sounds';

  @override
  String get premiumPerkCommunities => 'Communities';

  @override
  String get premiumPerkMessageCharacterLimit => 'Message character limit';

  @override
  String get premiumPerkBookmarkedMessages => 'Bookmarked messages';

  @override
  String get premiumPerkFileUploadSize => 'File upload size';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji & sticker packs';

  @override
  String get premiumPerkSavedMedia => 'Saved media';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Use animated emojis';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Global emoji & sticker access';

  @override
  String get premiumPerkVideoQuality => 'Video quality';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Animated avatars & profile banners';

  @override
  String get premiumPerkEarlyAccess => 'Early access to new features';

  @override
  String get premiumPerkCustomThemes => 'Custom themes';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Up to 4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard => 'Gizlilik Paneli';

  @override
  String get userSettingsNavAuthorizedApps => 'Yetkili Uygulamalar';

  @override
  String get userSettingsNavBlockedUsers => 'Engellenen Kullanıcılar';

  @override
  String get userSettingsNavLinkedDevices => 'Bağlı Cihazlar';

  @override
  String get userSettingsNavConnections => 'Bağlantılar';

  @override
  String get userSettingsNavLookAndFeel => 'Görünüm';

  @override
  String get userSettingsNavAccessibility => 'Erişilebilirlik';

  @override
  String get userSettingsNavChat => 'Mesajlar ve Medya';

  @override
  String get userSettingsNavAudioAndVideo => 'Ses ve Görüntü';

  @override
  String get userSettingsNavShortcuts => 'Shortcuts';

  @override
  String get audioAndVideoAudioSectionTitle => 'Ses';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Mikrofonunu, hoparlörlerini ve ses işleme ayarlarını yapılandır.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Kameranı ve ekran paylaşımı kaliteni yapılandır.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'Arama içi davranış';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Sesli ve görüntülü aramalardaki onay uyarılarını yönet.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Giriş aygıtı';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Çıkış aygıtı';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Default';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Use speaker';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'When off, audio plays through the earpiece or connected headphones.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Input volume';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Output volume';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Voice processing';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Focused voice';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Recommended. Cleans up your mic for clear speech.';

  @override
  String get audioAndVideoDirectInputLabel => 'Direct input';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Sends your audio untouched. Best if you\'re using external audio software.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Custom';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Adjust each setting yourself: noise suppression, echo cancellation, and gain.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Noise suppression';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Enhanced';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standard';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'None';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Echo cancellation';

  @override
  String get audioAndVideoAutomaticGainControlLabel => 'Automatic gain control';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Evens out your mic volume. Off when enhanced suppression is on.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mic test';

  @override
  String get audioAndVideoMicTestStartLabel => 'Start mic test';

  @override
  String get audioAndVideoMicTestStopLabel => 'Stop mic test';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName needs microphone access to test your input.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Camera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Mirror camera';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Camera quality';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Screen share quality';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Frame rate';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p and 60 FPS require $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'This instance currently allows screen share up to 720p at 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName needs microphone access to list your devices.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName needs camera access to list your devices.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Don\'t ask when hiding my camera';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Don\'t ask when hiding my screen share';

  @override
  String get userSettingsNavNotifications => 'Notifications';

  @override
  String get notificationsGeneralSectionTitle => 'General';

  @override
  String get notificationsEnableNotificationsLabel => 'Enable notifications';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Get notified when you receive messages. You may need to allow notifications for $productName in your device settings. For per-channel/per-community controls, open notification settings from a community\'s menu.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Enable desktop notifications';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Uses the OS notification center. For per-channel/per-community controls, right-click a community icon and open notification settings.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Enable browser notifications';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Get notified when you receive messages. You may need to allow notifications in your browser settings. For per-channel/per-community controls, right-click a community icon and open notification settings.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Push notification inactive timeout';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName avoids sending push notifications to your mobile devices when you are at your computer. Choose how long you need to be inactive on desktop before you receive push notifications.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute minute';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes minutes';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Mention preference';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Reply mention preference';

  @override
  String get notificationsMentionNoPreferenceName => 'No preference';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Respect the sender\'s intent, with no warning when they toggle the @ mention';

  @override
  String get notificationsMentionPreferMentionName => 'Prefer @mention';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Default replies to @mention you, and warn the sender if they disable it';

  @override
  String get notificationsMentionPreferNoMentionName => 'Prefer no @mention';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Default replies to omit the @mention, and warn the sender if they enable it';

  @override
  String get notificationsTtsSectionTitle => 'Text-to-speech notifications';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Enable /tts speech playback';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Let /tts read your message aloud. Disabling the setting keeps those commands as regular text.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Adjust playback speed in ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Accessibility';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Automatic message narration';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Converts incoming content to speech, regardless of whether it came from /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Every channel';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Let every incoming message be spoken, regardless of which channel is open.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Active channel only';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Narrates only the channel you\'re viewing. Narration follows you between channels.';

  @override
  String get notificationsTtsModeNeverName => 'Never automatically';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Remain silent unless someone runs /tts manually.';

  @override
  String get notificationsTtsModeAriaLabel => 'Speak all messages out loud';

  @override
  String get notificationsSoundsSectionTitle => 'Sounds';

  @override
  String get notificationsMasterVolumeLabel => 'Master volume';

  @override
  String get notificationsMasterVolumeDescription =>
      'Sets the level for every sound effect. Per-sound overrides ignore this.';

  @override
  String get notificationsResetToDefaultVolume => 'Reset to default volume';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Disable all notification sounds';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Your existing notification sound settings will be preserved.';

  @override
  String get notificationsShowMoreSoundEffects => 'Show more sound effects';

  @override
  String get notificationsShowFewerSoundEffects => 'Show fewer sound effects';

  @override
  String get notificationsPreviewSound => 'Preview sound';

  @override
  String get notificationsPerSoundVolumeTitle => 'Per-sound volume';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Set custom volumes for individual sounds. Sounds without an override follow the master volume.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Active custom sound volume overrides: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Following master • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Reset $label to master volume';
  }

  @override
  String get notificationsResetAllOverrides => 'Reset all overrides';

  @override
  String notificationsMuteSound(String label) {
    return 'Mute $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Unmute $label';
  }

  @override
  String get notificationsSoundMessage => 'Community message notifications';

  @override
  String get notificationsSoundDirectMessage => 'Direct message notifications';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Current channel message notifications';

  @override
  String get notificationsSoundMute => 'Voice mute';

  @override
  String get notificationsSoundUnmute => 'Voice unmute';

  @override
  String get notificationsSoundDeaf => 'Voice deafen';

  @override
  String get notificationsSoundUndeaf => 'Voice undeafen';

  @override
  String get notificationsSoundUserJoin => 'User joins channel';

  @override
  String get notificationsSoundUserLeave => 'User leaves channel';

  @override
  String get notificationsSoundUserMove => 'User moved channel';

  @override
  String get notificationsSoundViewerJoin => 'Viewer joins stream';

  @override
  String get notificationsSoundViewerLeave => 'Viewer leaves stream';

  @override
  String get notificationsSoundVoiceDisconnect => 'Voice disconnected';

  @override
  String get notificationsSoundIncomingRing => 'Incoming call';

  @override
  String get notificationsSoundCameraOn => 'Camera on';

  @override
  String get notificationsSoundCameraOff => 'Camera off';

  @override
  String get notificationsSoundScreenShareStart => 'Screen share start';

  @override
  String get notificationsSoundScreenShareStop => 'Screen share stop';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Couldn\'t update push notification timeout. Try again.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Couldn\'t update mention preference. Try again.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notifications blocked';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Couldn\'t enable notifications. Allow notification permission to continue.';

  @override
  String get userSettingsNavLanguageAndTime => 'Dil ve Saat';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Interface language';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Choose the language used throughout the app';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Open language settings';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Time format';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Choose how times are displayed throughout the app';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Time format selection';

  @override
  String get languageAndTimeTimeFormatAuto => 'Auto';

  @override
  String get languageAndTimeTimeFormat12Hour => '12-hour';

  @override
  String get languageAndTimeTimeFormat24Hour => '24-hour';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'App language: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'System locale: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Use system locale for time format';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Failed to update time format';

  @override
  String get userSettingsNavDefaultApps => 'Default Apps';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Web Browser';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Choose which browser opens when you tap a link.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'If an app is installed for a site, links will open in that app first.';

  @override
  String get defaultAppsWebBrowserInApp => 'In-app browser';

  @override
  String get defaultAppsWebBrowserExternal => 'External browser';

  @override
  String get userSettingsNavAdvanced => 'Gelişmiş';

  @override
  String get advancedPerformanceReportingTitle => 'Performans raporlaması';

  @override
  String get advancedPerformanceReportingSectionDescription =>
      'Anonim çökme ve performans verilerini paylaşarak Fluxer\'ı geliştirmeye yardımcı olun.';

  @override
  String get advancedPerformanceReportingLabel =>
      'Çökme ve performans raporları gönder';

  @override
  String get advancedPerformanceReportingDescription =>
      'Raporlanan tüm veriler anonimdir ve yalnızca Fluxer\'ın kendi izleme hizmetine gönderilir — üçüncü taraf sağlayıcı kullanılmaz.';

  @override
  String get advancedSettingsConfigure => 'Configure';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privacy';

  @override
  String get advancedSettingsCategoryAppearance => 'Appearance';

  @override
  String get advancedSettingsCategoryAccessibility => 'Accessibility';

  @override
  String get advancedSettingsCategoryChat => 'Chat';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Voice';

  @override
  String get advancedSettingsCategoryDeveloper => 'Developer';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Enable text selection';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Allow selecting text in the app';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Enable video seek thumbnails';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Thumbnail or live frame while scrubbing video';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Haptic feedback';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Vibration feedback for taps and actions. Won\'t sync across devices.';

  @override
  String get advancedSettingShowNekoLabel => 'Show Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Neko cat that chases your cursor';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Show Neko on your chat input';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Splash zoom animation';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Zoom the logo out when leaving the splash screen';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Keyboard hints';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Keyboard shortcut hints in tooltips';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Enable favorites';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Show favorites throughout the app';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Voice channel join behavior';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Confirmation or double-click for community voice joins';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Require double-click to join voice channels';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Confirm before joining voice channels';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Automatically send GIFs when selected';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Automatically send GIFs from the picker without confirmation';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Save GIF favorites as saved media';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Choose how starred GIF favorites are stored';

  @override
  String get advancedSettingMediaButtonsLabel => 'Media buttons';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Customize which buttons and indicators appear on media attachments and embeds';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Upload attachments before sending';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Start uploading attachments as soon as they are added to the message input';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Strip tracking parameters from URLs';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Automatically remove tracking parameters from URLs in messages you send';

  @override
  String get advancedSettingTrustAllLinksLabel => 'Trust all external links';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Skip the external link warning for all domains';

  @override
  String get advancedSettingSearchEnginesLabel => 'Search engines';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Configure search engines used from selected text';

  @override
  String get advancedSettingTranslatorsLabel => 'Translators';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Configure translator providers used from selected text';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Reverse image search';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Reverse image search providers';

  @override
  String get advancedSettingMessageActionBarLabel => 'Message action bar';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Customize the action bar that appears when hovering over messages';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Expression autocomplete';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Pick what appears when you type a colon in the message input';

  @override
  String get advancedSettingInputButtonsLabel => 'Message input buttons';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Pick which buttons show in the message input';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Scroll to bottom when sending a message';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Choose how chat moves after you send a message';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Skip \"Mark all as read\" confirmation';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Mark all unread inbox channels as read immediately, without asking to confirm';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Hide muted channels by default';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Hide channels you\'ve muted from community sidebars';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Show GIF indicator';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Show attachment expiry indicator';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Show delete button';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Show download button';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Show favorite button';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Show suppress embeds button';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Show message action bar';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Show only more button';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Show quick reactions';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Enable Shift to expand';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Show default emojis in expression autocomplete';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Show custom emojis in expression autocomplete';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Show stickers in expression autocomplete';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Show saved media in expression autocomplete';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Show GIFs button';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Show media button';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Show stickers button';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Show emoji button';

  @override
  String get advancedSettingShowSendButtonLabel => 'Show send button';

  @override
  String get advancedSettingNewDeviceAlertsLabel => 'Show new device alerts';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Prompt for new audio devices';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Connection volume controls';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Show per-device participant volume sliders in voice menus';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Screen share preview behavior';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Preview, popout, and stream thumbnail behavior';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Screen share codec';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Video codec for screen sharing';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Automatic (recommended)';

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
      'Pause my screen share preview in the background';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Hide my stream preview thumbnail';

  @override
  String get advancedSettingDeveloperModeLabel => 'Enable developer mode';

  @override
  String get advancedSettingDeveloperModeDescription => 'Enable developer mode';

  @override
  String get advancedSettingSearchEngineGoogle => 'Google';

  @override
  String get advancedSettingSearchEngineDuckDuckGo => 'DuckDuckGo';

  @override
  String get advancedSettingSearchEngineBing => 'Bing';

  @override
  String get advancedSettingSearchEngineGoogleLens => 'Google Lens';

  @override
  String get advancedSettingSearchEngineTinEye => 'TinEye';

  @override
  String get advancedSettingTranslatorGoogle => 'Google Translate';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Default search engine';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Choose which search engine is used by default when searching selected text.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Built-in search engines';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Enable or disable built-in search engines. Enabled engines appear in the message context menu when text is selected.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Custom search engines';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Add your own search engines with a custom URL pattern. Use \'$query\' as a placeholder for the search text.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Add search engine';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Enable at least one search engine below.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Remove search engine';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Default translator';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Choose which translator is used by default when translating selected text.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Built-in translators';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Enable or disable built-in translators. Enabled translators appear in the message context menu when text is selected.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Custom translators';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Add your own translators with a custom URL pattern. Use \'$query\' as a placeholder for the text to translate.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Add translator';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Enable at least one translator below.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Remove translator';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Default reverse image search';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Choose which reverse image search service is used by default when searching an image.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Built-in reverse image search';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Enable or disable built-in reverse image search providers. Enabled providers appear in the context menu of images, avatars, banners, stickers, and emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Custom reverse image search';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Add your own reverse image search providers with a custom URL pattern. Use \'$url\' as a placeholder for the image URL.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Add reverse image search';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Enable at least one reverse image search provider below.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Remove reverse image search';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Add search engine';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Edit search engine';

  @override
  String get advancedSettingAddTranslatorTitle => 'Add translation provider';

  @override
  String get advancedSettingEditTranslatorTitle => 'Edit translation provider';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Add reverse image search engine';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Edit reverse image search engine';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Name';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL pattern';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'My search engine';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'My translator';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'My reverse image search';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Use \'$query\' where the search text should be inserted.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Use \'$query\' where the text to translate should be inserted.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Use \'$url\' where the image URL should be inserted.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Name is required.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'URL pattern is required.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL pattern must contain \'$query\' placeholder.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL pattern must contain \'$url\' placeholder.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL pattern must be a valid URL.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Add';

  @override
  String get advancedSettingEditSearchProviderAction => 'Edit';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Remove';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Are you sure you want to remove $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Uygulamalar';

  @override
  String get userSettingsNavAppLogs => 'Uygulama Günlükleri';

  @override
  String get userSettingsNavDeveloperTools => 'Geliştirici Araçları';

  @override
  String get userSettingsNavLimitsConfig => 'Limitler Yapılandırması';

  @override
  String get userSettingsNavFeatureFlags => 'Özellik Bayrakları';

  @override
  String get userSettingsNavWhatsNew => 'Yenilikler';

  @override
  String get userSettingsJoinFluxerLabs => 'Join Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'App Licenses';

  @override
  String get userSettingsAppLicensesDescription =>
      'Open-source software used by this app. This app is built with Flutter.';

  @override
  String get userSettingsAppLicensesLoadError => 'Could not load app licenses.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count licenses',
      one: '1 license',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Oturumu Kapat';

  @override
  String get quickSwitcherTabSearch => 'Ara';

  @override
  String get quickSwitcherTabFriends => 'Arkadaşlar';

  @override
  String get quickSwitcherSearchPlaceholder => 'Kanal, kişi veya topluluk ara';

  @override
  String get quickSwitcherSearchFriends => 'Arkadaş ara';

  @override
  String get quickSwitcherNoMatchesFound => 'Eşleşme bulunamadı';

  @override
  String get quickSwitcherEmptyHint =>
      'Farklı bir ad dene veya sonuçları filtrelemek için @ / # / ! / * öneklerini kullan.';

  @override
  String get quickSwitcherSectionPeople => 'Kişiler';

  @override
  String get quickSwitcherSectionGroupMessages => 'Grup mesajları';

  @override
  String get quickSwitcherSectionTextChannels => 'Metin kanalları';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Sesli kanallar';

  @override
  String get quickSwitcherSectionCommunities => 'Topluluklar';

  @override
  String get quickSwitcherSectionSettings => 'Ayarlar';

  @override
  String get quickSwitcherHomeLabel => 'Giriş';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Doğrudan Mesajlar';

  @override
  String get quickSwitcherFavoritesLabel => 'Sık Kullanılanlar';

  @override
  String get quickSwitcherUserSettingsLabel => 'Kullanıcı Ayarları';

  @override
  String get quickSwitcherNotificationsLabel => 'Bildirimler';

  @override
  String get quickSwitcherBookmarksLabel => 'Yer İşaretleri';

  @override
  String get savedMessagesEmptyTitle => 'No bookmarks';

  @override
  String get savedMessagesEmptyBody =>
      'Bookmark messages to save them for later.';

  @override
  String get savedMessagesEndBody => 'There\'s nothing more to see here.';

  @override
  String get savedMessagesRemoveTooltip => 'Remove bookmark';

  @override
  String get quickSwitcherMentionsLabel => 'Bahsedilenler';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Henüz arkadaş yok';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Başlamak için bir arkadaş ekle.';

  @override
  String get quickSwitcherFriendsNoMatchTitle => 'Bu aramaya uyan arkadaş yok';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Farklı bir ad dene.';

  @override
  String get quickSwitcherSearchAliasUser => 'Kullanıcı';

  @override
  String get quickSwitcherSearchAliasYou => 'Sen';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'DM\'ler';

  @override
  String get quickSwitcherSearchAliasMessages => 'Mesajlar';

  @override
  String get quickSwitcherSearchAliasFav => 'Favoriler';

  @override
  String get quickSwitcherSearchAliasStarred => 'Yıldızlı';

  @override
  String get quickSwitcherSearchAliasInbox => 'Gelen Kutusu';

  @override
  String get quickSwitcherSearchAliasSaved => 'Kaydedilenler';

  @override
  String get uiClose => 'Kapat';

  @override
  String get chatJumpToBottom => 'Aşağıya atla';

  @override
  String get uiConfirm => 'Onayla';

  @override
  String get uiLoading => 'Yükleniyor';

  @override
  String get uiUnsavedChanges => 'Kaydedilmemiş değişiklikler';

  @override
  String get uiReset => 'Sıfırla';

  @override
  String get uiOpenColorPicker => 'Renk seçiciyi aç';

  @override
  String get uiSelectPlaceholder => 'Seç';

  @override
  String get uiSearchPlaceholder => 'Ara';

  @override
  String get uiNoOptionsFound => 'Seçenek bulunamadı';

  @override
  String get uiDismissNotification => 'Bildirimi kapat';

  @override
  String get uiColorPickerTitle => 'Renk seçici';

  @override
  String get mentionConfirmTitle => 'Herkesi etiketle?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return '$count üye bilgilendirilecek. Devam edilsin mi?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return '$count çevrimiçi üye bilgilendirilecek. Devam edilsin mi?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'This will notify $count members with the $roleName role. Continue?';
  }

  @override
  String get mentionConfirmButton => 'Etiketle';

  @override
  String get composerEmojiUnavailable => 'Bu emojiyi burada kullanamazsın.';

  @override
  String get instanceUrlLabel => 'Sunucu URL\'si';

  @override
  String get instanceUrlPlaceholder =>
      'Sunucu URL\'sini girin (ör. fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Fluxer\'a sıfırla';

  @override
  String get instanceConnect => 'Bağlan';

  @override
  String get instanceConnecting => 'Bağlanıyor…';

  @override
  String get instanceConnectFailed => 'Sunucuya bağlanılamadı';

  @override
  String get recentInstances => 'Son sunucular';

  @override
  String removeRecentInstance(String domain) {
    return '$domain sunucusunu son sunuculardan kaldır';
  }

  @override
  String get instanceSheetTitle => 'Sunucuya bağlan';

  @override
  String get connectToDifferentInstance => 'Farklı bir sunucuya bağlan';

  @override
  String get changeInstance => 'Değiştir';

  @override
  String get instanceConnectionRequired =>
      'Giriş yapmak için sunucuya bağlanın';

  @override
  String get comingSoon => 'Çok yakında';

  @override
  String get guildNavbarDirectMessages => 'Doğrudan Mesajlar';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Keşfedilebilir Toplulukları Keşfet';

  @override
  String get discoveryExplore => 'Keşfet';

  @override
  String get discoveryExplorePublicCommunities =>
      'Herkese açık toplulukları keşfedin';

  @override
  String get discoveryListingSubheading =>
      'Topluluğunuzu buraya mı listelemek istiyorsunuz? Topluluğunuzun ayarları > Keşfet bölümündeki gereksinimleri karşılıyorsanız başvurun.';

  @override
  String get discoverySearchCommunities => 'Toplulukları ara';

  @override
  String get discoveryFilterByLanguage => 'Dile göre filtrele';

  @override
  String get discoveryAllLanguages => 'Tüm diller';

  @override
  String get discoveryAllCategories => 'Tümü';

  @override
  String get discoveryCategoryGaming => 'Oyun';

  @override
  String get discoveryCategoryMusic => 'Müzik';

  @override
  String get discoveryCategoryEntertainment => 'Eğlence';

  @override
  String get discoveryCategoryEducation => 'Eğitim';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Bilim ve Teknoloji';

  @override
  String get discoveryCategoryContentCreator => 'İçerik Üreticisi';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime ve Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Film ve TV';

  @override
  String get discoveryCategoryOther => 'Diğer';

  @override
  String get discoveryNoCommunitiesMatch => 'Eşleşen topluluk yok.';

  @override
  String get discoveryJoinCommunity => 'Topluluğa katıl';

  @override
  String get discoveryJoined => 'Katılundu';

  @override
  String discoveryOnlineCount(String count) {
    return '$count çevrimiçi';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString üye',
      one: '1 üye',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Açıklama yok.';

  @override
  String get discoveryCommunities => 'Topluluklar';

  @override
  String get discoveryApps => 'Uygulamalar';

  @override
  String get discoveryJoinErrorGenericTitle => 'Bu topluluğa katılamadık';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Bir şeyler ters gitti. Lütfen birazdan tekrar deneyin.';

  @override
  String get discoveryJoinErrorFullTitle => 'Bu topluluk dolu';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Bu topluluk üye sınırına ulaştığı için şu anda katılamazsınız.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Topluluk sınırına ulaştınız';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Maksimum sayıda topluluktaki bulunuyorsunuz. Birinden ayrılın ve tekrar deneyin.';

  @override
  String get discoveryJoinErrorBannedTitle => 'Bu topluluğa katılamazsınız';

  @override
  String get discoveryJoinErrorBannedMessage => 'Bu topluluktan yasaklandınız.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Bu topluluk artık mevcut değil';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Keşfet\'ten ayrılmış veya yeni katılımları kapatmış olabilir. Sayfayı yenileyin ve bir daha görmeyeceksiniz.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Çok hızlısınız';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Lütfen bir saniye bekleyin ve tekrar deneyin.';

  @override
  String get guildNavbarAddCommunity => 'Topluluk Ekle';

  @override
  String get guildNavbarHelp => 'Yardım';

  @override
  String get scrollIndicatorNew => 'NEW';

  @override
  String get scrollIndicatorNewMessage => 'YENİ MESAJ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderName klasörünü daralt';
  }

  @override
  String get guildNavbarGuildSelected => 'selected';

  @override
  String get guildNavbarGuildUnread => 'unread';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mentions',
      one: '1 mention',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'muted';

  @override
  String get authShowPassword => 'Show password';

  @override
  String get authHidePassword => 'Hide password';

  @override
  String get chatLoadingMessages => 'Loading messages';

  @override
  String get friendsMessageFriend => 'Message';

  @override
  String get friendsFriendActions => 'Friend actions';

  @override
  String get friendsAcceptRequest => 'Accept friend request';

  @override
  String get friendsDeclineRequest => 'Decline friend request';

  @override
  String get friendsCancelRequest => 'Cancel friend request';

  @override
  String get friendsOpenInbox => 'Inbox';

  @override
  String get profileRemoveFriend => 'Remove friend';

  @override
  String get profileUnblockUser => 'Unblock user';

  @override
  String get profileAcceptFriendRequest => 'Accept friend request';

  @override
  String get profileCancelFriendRequest => 'Cancel friend request';

  @override
  String get profileSendFriendRequest => 'Add friend';

  @override
  String get accountOverflowMenu => 'Account options';

  @override
  String get navHome => 'Home';

  @override
  String get navNotifications => 'Notifications';

  @override
  String get navYou => 'You';

  @override
  String get guildFolderSettingsTitle => 'Folder settings';

  @override
  String get guildFolderNameLabel => 'Folder name';

  @override
  String get guildFolderColorLabel => 'Folder color';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Show icon when collapsed';

  @override
  String get guildFolderIconLabel => 'Folder icon';

  @override
  String get guildFolderDelete => 'Delete folder';

  @override
  String get guildFolderIconFolder => 'Folder';

  @override
  String get guildFolderIconStar => 'Star';

  @override
  String get guildFolderIconHeart => 'Heart';

  @override
  String get guildFolderIconBookmark => 'Bookmark';

  @override
  String get guildFolderIconGameController => 'Game controller';

  @override
  String get guildFolderIconShield => 'Shield';

  @override
  String get guildFolderIconMusicNote => 'Music note';

  @override
  String get guildFolderMarkAsRead => 'Mark folder as read';

  @override
  String get guildBulkMuteCommunities => 'Mute communities';

  @override
  String get guildBulkUnmuteCommunities => 'Unmute communities';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Community notification settings';

  @override
  String get guildBulkCommunityPrivacySettings => 'Community privacy settings';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Allow @everyone and @here';

  @override
  String get guildBulkAllowRoleMentions => 'Allow role mentions';

  @override
  String get guildBulkEnableMobilePush => 'Enable mobile push notifications';

  @override
  String get guildBulkDisableMobilePush => 'Disable mobile push notifications';

  @override
  String get guildBulkAllowDirectMessages => 'Allow direct messages';

  @override
  String get guildBulkBlockDirectMessages => 'Block direct messages';

  @override
  String get guildBulkAllowBotDirectMessages => 'Allow bot direct messages';

  @override
  String get guildBulkBlockBotDirectMessages => 'Block bot direct messages';

  @override
  String get guildNavbarGroupDm => 'Grup DM';

  @override
  String get guildNavbarCreateChannel => 'Kanal Oluştur';

  @override
  String get guildNavbarChannelType => 'Kanal Türü';

  @override
  String get guildNavbarTextChannel => 'Metin Kanalı';

  @override
  String get guildNavbarTextChannelDescription =>
      'Mesaj, resim, GIF ve emoji gönderin';

  @override
  String get guildNavbarVoiceChannel => 'Sesli Kanal';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Sesli, görüntülü ve ekran paylaşımıyla birlikte takılın';

  @override
  String get guildNavbarLinkChannel => 'Bağlantı Kanalı';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Harici bir web sitesine veya kaynağa hızlı erişim';

  @override
  String get guildNavbarNameLabel => 'Ad';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Channel type selection';

  @override
  String get guildNavbarCreateCategory => 'Kategori Oluştur';

  @override
  String get guildNavbarNewCategoryHint => 'Yeni Kategori';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return '$communityName davet et';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Alıcılar #$channelName kanalına yönlendirilecek';
  }

  @override
  String get guildNavbarSearchFriends => 'Arkadaş ara';

  @override
  String get guildNavbarNoFriendsYet => 'Henüz arkadaş yok';

  @override
  String get guildNavbarNoResults => 'Sonuç yok';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Veya bir arkadaşınıza davet bağlantısı gönderin:';

  @override
  String get guildNavbarInviteLink => 'Davet bağlantısı';

  @override
  String get guildNavbarCopy => 'Kopyala';

  @override
  String get guildNavbarCopied => 'Kopyalandı!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Davet bağlantınız 7 gün içinde sona erer.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Bu davet bağlantısı asla sona ermez.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Davet bağlantınız $duration içinde sona erer.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Davet bağlantısını düzenle';

  @override
  String get guildNavbarInviteLinkSettings => 'Davet bağlantısı ayarları';

  @override
  String get guildNavbarExpireAfter => 'Sonra Erir';

  @override
  String get guildNavbarMaxUses => 'Maksimum Kullanım Sayısı';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Geçici Üyelik Ver';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Rol atanmadığı sürece üyeler çevrimdışı olduklarında kaldırılacaktır';

  @override
  String get guildNavbarCreateNewLink => 'Yeni Bağlantı Oluştur';

  @override
  String get guildNavbarSent => 'Gönderildi';

  @override
  String get guildNavbarInvite => 'Davet Et';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Topluluktan Ayrıl';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Bu topluluktan ayrılmak istediğinizden emin misiniz? Artık hiçbir mesajı göremeyeceksiniz.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Topluluktan Ayrıl';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Bu topluluktaki mesajlarınızı sil?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Burada, her kanalda gönderdiğiniz her mesajı kalıcı olarak silin. Geri alınamaz.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Mesajlarımı Sil';

  @override
  String get guildNavbarDeletedYourMessages => 'Mesajlarınız silindi';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => 'Mesajlarınız silinemedi';

  @override
  String get guildNavbarRemoveOverride => 'Geçersiz kılmayı kaldır';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return '$formattedDate tarihine kadar sessize alındı';
  }

  @override
  String get guildNavbarStaffOnlyAccessible =>
      'Yalnızca Fluxer personeli tarafından erişilebilir';

  @override
  String get guildNavbarInvitesPaused =>
      'Bu toplulukta davetler şu anda duraklatıldı';

  @override
  String get guildNavbarDurationNever => 'asla';

  @override
  String get guildNavbarDuration30Minutes => '30 dakika';

  @override
  String get guildNavbarDuration1Hour => '1 saat';

  @override
  String get guildNavbarDuration6Hours => '6 saat';

  @override
  String get guildNavbarDuration12Hours => '12 saat';

  @override
  String get guildNavbarDuration1Day => '1 gün';

  @override
  String get guildNavbarDuration7Days => '7 gün';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count saniye';
  }

  @override
  String get guildNavbarNever => 'Asla';

  @override
  String get guildNavbarNoLimit => 'Sınırsız';

  @override
  String get guildNavbarOneUse => '1 kullanım';

  @override
  String guildNavbarUses(int count) {
    return '$count kullanım';
  }

  @override
  String get guildMenuMarkAsRead => 'Okundu Olarak İşaretle';

  @override
  String get guildPeekMoreOptions => 'Diğer Seçenekler';

  @override
  String get guildMenuInviteMembers => 'Üye Davet Et';

  @override
  String get guildMenuCommunitySettings => 'Topluluk Ayarları';

  @override
  String get guildMenuEditCommunityProfile => 'Topluluk Profilini Düzenle';

  @override
  String get guildMenuUnmuteCommunity => 'Topluluğun Sesini Aç';

  @override
  String get guildMenuMuteCommunity => 'Topluluğu Sessize Al';

  @override
  String get guildMenuHideMutedChannels => 'Sessize Alınan Kanalları Gizle';

  @override
  String get guildMenuReportCommunity => 'Topluluğu Bildir';

  @override
  String get guildMenuDebugCommunity => 'Topluluğu Ayıkla';

  @override
  String get guildMenuCopyCommunityId => 'Topluluk Kimliğini Kopyala';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return '$formattedTime kadar';
  }

  @override
  String get guildMenuSettingsGeneral => 'Genel';

  @override
  String get guildMenuSettingsRoles => 'Roller ve İzinler';

  @override
  String get guildMenuSettingsEmoji => 'Özel Emojiler';

  @override
  String get guildMenuSettingsStickers => 'Özel Çıkartmalar';

  @override
  String get guildMenuSettingsSafetyModeration => 'Güvenlik ve Moderasyon';

  @override
  String get guildMenuSettingsActivityLog => 'Etkinlik Günlüğü';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook\'lar';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'Özel Davet URL\'si';

  @override
  String get guildMenuSettingsDiscovery => 'Keşif';

  @override
  String get guildMenuSettingsMembers => 'Üyeler';

  @override
  String get guildMenuSettingsInviteLinks => 'Davet Bağlantıları';

  @override
  String get guildMenuSettingsBans => 'Yasaklamalar';

  @override
  String get guildMenuSettingsChannels => 'Channels';

  @override
  String get guildSettingsNoPermission =>
      'Bu ayarlar sekmesini görüntüleme izniniz yok.';

  @override
  String get guildSettingsOverviewIconTitle => 'Simge';

  @override
  String get guildSettingsUploadImage => 'Resim Yükle';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Sunucunuz için bir banner yükleyin.';

  @override
  String get guildSettingsOverviewNameTitle => 'Ad';

  @override
  String get guildSettingsOverviewNameHint => 'Harika topluluğum';

  @override
  String get guildSettingsOverviewStatsTitle => 'İstatistikler';

  @override
  String get guildSettingsOverviewMembers => 'Üyeler';

  @override
  String get guildSettingsOverviewOnline => 'Çevrimiçi';

  @override
  String get guildSettingsRolesDescription =>
      'Üyeleri gruplamak ve izinler atamak için rolleri kullanın.';

  @override
  String get guildSettingsCreateRole => 'Rol Oluştur';

  @override
  String get guildSettingsRolesListTitle => 'Roller';

  @override
  String get guildSettingsRolesNewRole => 'New role';

  @override
  String get guildSettingsRolesDeleteRole => 'Delete role';

  @override
  String get guildSettingsRolesBackToRoles => 'Back to roles';

  @override
  String get guildSettingsBackToSettings => 'Back to settings';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Edit \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Configure role settings and permissions';

  @override
  String get guildSettingsRolesDisplaySection => 'Display';

  @override
  String get guildSettingsRolesRoleName => 'Role name';

  @override
  String get guildSettingsRolesRoleColor => 'Role color';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Type a color (hex, rgb(), hsl(), or name) or use the picker.';

  @override
  String get guildSettingsRolesShowSeparately => 'Show this role separately';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Lists members with this role in their own section in the member list.';

  @override
  String get guildSettingsRolesAllowMentions => 'Allow mentions for this role';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Members with the \"$permission\" permission can always mention roles, regardless of this setting.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Use this button to quickly clear all permissions.';

  @override
  String get guildSettingsRolesClearPermissions => 'Clear permissions';

  @override
  String get guildSettingsRolesPermissionsSection => 'Permissions';

  @override
  String get guildSettingsRolesSearchPermissions => 'Search permissions';

  @override
  String get guildSettingsRolesDenseLayout => 'Dense layout';

  @override
  String get guildSettingsRolesComfyLayout => 'Comfy layout';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => 'Switch to dense layout';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => 'Switch to comfy layout';

  @override
  String get guildSettingsRolesSingleColumn => 'Single column';

  @override
  String get guildSettingsRolesTwoColumns => 'Two columns';

  @override
  String get guildSettingsRolesSwitchToSingleColumn =>
      'Switch to single column';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Switch to two columns';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'No permissions found';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Custom hoist order';

  @override
  String get guildSettingsRolesHoistOrder => 'Hoist order';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Reset to default';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Drag roles to customize the order they appear in the member list.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'No hoisted roles. Enable \"Show this role separately\" on a role to see it here.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'You cannot edit this role because it is your highest role or above you';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'You need the \"$permission\" permission to edit these permissions';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'You cannot edit a role at or above your highest role';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'You cannot grant a permission you don\'t have';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'You cannot remove this permission because it would remove it from yourself';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Roles updated successfully';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Role created successfully';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Role deleted successfully';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Hoist order reset to default';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Role name is required';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Give the role a name before saving.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Couldn\'t create role';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'Couldn\'t update roles';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Couldn\'t delete role';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" wouldn\'t delete. Try again.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Couldn\'t reset hoist order';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Try again in a moment.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Are you sure you want to delete the $name role? Any members with this role will no longer have it.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Community-wide';

  @override
  String get permissionCategoryMessagesMedia => 'Messages & media';

  @override
  String get permissionCategoryModeration => 'Moderation';

  @override
  String get permissionCategoryChannelAccess => 'Channel access';

  @override
  String get permissionCategoryChannelManagement => 'Channel management';

  @override
  String get permissionCategoryAudioVideo => 'Audio & video';

  @override
  String get permissionUnknown => 'Unknown permission';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Grants all permissions and bypasses channel restrictions. Highly sensitive.';

  @override
  String get permissionViewActivityLog => 'View activity log';

  @override
  String get permissionViewActivityLogDescription =>
      'Read the community\'s activity log of changes and moderation actions.';

  @override
  String get permissionManageCommunity => 'Manage community';

  @override
  String get permissionManageCommunityDescription =>
      'Edit global settings like name, description, and icon.';

  @override
  String get permissionManageRoles => 'Manage roles';

  @override
  String get permissionManageRolesDescription =>
      'Create, edit, or delete roles below your highest role. Also allows editing channel permission overwrites.';

  @override
  String get permissionManageChannels => 'Manage channels';

  @override
  String get permissionManageChannel => 'Manage channel';

  @override
  String get permissionManageChannelDescription =>
      'Rename and edit this channel\'s settings.';

  @override
  String get permissionManagePermissions => 'Manage permissions';

  @override
  String get permissionManagePermissionsDescription =>
      'Edit overwrites for roles and members in this channel.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Create, edit, or delete webhooks for this channel.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'See the member list for this channel.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Manage invite links for this channel.';

  @override
  String get permissionOverwriteDeny => 'Deny';

  @override
  String get permissionOverwriteInherit => 'Neutral (inherit)';

  @override
  String get permissionOverwriteAllow => 'Allow';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Use these buttons to quickly set all permissions.';

  @override
  String get permissionManageChannelsDescription =>
      'Create, edit, or delete channels and categories.';

  @override
  String get permissionKickMembers => 'Kick members';

  @override
  String get permissionBanMembers => 'Ban members';

  @override
  String get permissionCreateInviteLinks => 'Create invite links';

  @override
  String get permissionChangeOwnNickname => 'Change own nickname';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Update your own nickname.';

  @override
  String get permissionManageNicknames => 'Manage nicknames';

  @override
  String get permissionManageNicknamesDescription =>
      'Change other members\' nicknames.';

  @override
  String get permissionCreateEmojiStickers => 'Create emoji & stickers';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Upload new emoji and stickers, and manage your own creations.';

  @override
  String get permissionManageEmojiStickers => 'Manage emoji & stickers';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Edit or delete emoji and stickers created by other members.';

  @override
  String get permissionManageWebhooks => 'Manage webhooks';

  @override
  String get permissionManageWebhooksDescription =>
      'Create, edit, or delete webhooks.';

  @override
  String get permissionSendMessages => 'Send messages';

  @override
  String get permissionSendTtsMessages => 'Send TTS messages';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Send text-to-speech messages.';

  @override
  String get permissionManageMessages => 'Manage messages';

  @override
  String get permissionManageMessagesDescription =>
      'Delete other members\' messages. Pinning is controlled separately.';

  @override
  String get permissionPinMessages => 'Pin messages';

  @override
  String get permissionEmbedLinks => 'Embed links';

  @override
  String get permissionAttachFiles => 'Attach files';

  @override
  String get permissionMentionEveryone => 'Use @everyone/@here and @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'Mention everyone or any role (even if the role isn\'t set to be mentionable).';

  @override
  String get permissionUseExternalEmoji => 'Use external emoji';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Use emoji from other communities.';

  @override
  String get permissionUseExternalStickers => 'Use external stickers';

  @override
  String get permissionAddReactions => 'Add reactions';

  @override
  String get permissionAddReactionsDescription =>
      'Add new reactions to messages.';

  @override
  String get permissionBypassSlowmode => 'Bypass slowmode';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Ignore per-channel message rate limits.';

  @override
  String get permissionTimeOutMembers => 'Time out members';

  @override
  String get permissionTimeOutMembersDescription =>
      'Prevent members from sending messages, reacting, and joining voice for a duration.';

  @override
  String get permissionViewChannel => 'View channel';

  @override
  String get permissionViewChannelMembers => 'View channel members';

  @override
  String get permissionViewChannelMembersDescription =>
      'See the member list for channels in this community.';

  @override
  String get permissionConnect => 'Connect';

  @override
  String get permissionSpeak => 'Speak';

  @override
  String get permissionStreamVideo => 'Stream video';

  @override
  String get permissionUseVoiceActivity => 'Use voice activity';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Without this permission, push-to-talk is required.';

  @override
  String get permissionPrioritySpeaker => 'Priority speaker';

  @override
  String get permissionMuteMembers => 'Mute members';

  @override
  String get permissionDeafenMembers => 'Deafen members';

  @override
  String get permissionMoveMembers => 'Move members';

  @override
  String get permissionMoveMembersDescription =>
      'Drag members between channels they can access.';

  @override
  String get permissionSetVoiceRegion => 'Set voice region';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount statik, $animatedCount animasyonlu emoji yuvası kullanıldı';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Henüz özel emoji yok.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count çıkartma yüklendi';
  }

  @override
  String get guildSettingsStickersEmpty => 'Henüz özel çıkartma yok.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Üye doğrulaması';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Topluluk üyelerinin mesaj göndermeden veya topluluk üyelerine özel mesaj atmadan önce sahip olması gerekenleri seçin.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Rolleri olan üyeler bu kontrolleri atlayabilir. Genel alanlar için doğrulamayı etkinleştirmenizi öneririz.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Keşfet\'te listelenen toplulukların en azından doğrulanmış bir e-postaya sahip olması gerekir. Keşfet etkinleştirildiğinde Hiçbiri seçilemez.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Müstehcen içerik ve içerik uyarıları';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Üyeler için müstehcen içerik etiketlemesini ve isteğe bağlı içerik uyarılarını yapılandırın.';

  @override
  String get guildSettingsModerationMatureToggle => 'Müstehcen içerik';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Bu topluluğu müstehcen içerik barındırıyor olarak işaretleyin.';

  @override
  String get guildSettingsVerificationNone => 'Hiçbiri';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Herhangi bir doğrulama gerekmez.';

  @override
  String get guildSettingsVerificationLow => 'Düşük';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Doğrulanmış bir e-posta adresi gerektirir.';

  @override
  String get guildSettingsVerificationMedium => 'Orta';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Doğrulanmış bir e-posta adresi ve en az 5 dakika önce oluşturulmuş bir hesap gerektirir.';

  @override
  String get guildSettingsVerificationHigh => 'Yüksek';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Ortadaki her şeyi gerektirir, artı topluluğun üyesi olmanın üzerinden en az 10 dakika geçmiş olması.';

  @override
  String get guildSettingsVerificationHighest => 'Çok yüksek';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Doğrulanmış bir telefon numarası gerektirir.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Topluluk genelindeki moderatör eylemlerini izleyin.';

  @override
  String get guildSettingsAuditLogEmpty => 'Henüz kayıt yok';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Gösterilecek kayıt girişi olmadığında etkinlik günlüğü sekmesindeki boş durum başlığı.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Tüm kullanıcılar';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Tüm eylemler';

  @override
  String get guildSettingsAuditLogNoReason =>
      'Herhangi bir neden belirtilmedi.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Bilinmeyen kullanıcı';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Etkinlik günlüğü yüklenirken bir şeyler ters gitti.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Etkinlik günlükleri yüklenemiyor';

  @override
  String get guildSettingsAuditLogReason => 'Neden';

  @override
  String get guildSettingsAuditLogSomeone => 'birisi';

  @override
  String get guildSettingsAuditLogSomething => 'bir şey';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'bilinmeyen varlık';

  @override
  String get guildSettingsAuditLogNothing => 'hiçbir şey';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Bilinmeyen hedef';

  @override
  String get auditLogActionGuildUpdate => 'Topluluk güncellendi';

  @override
  String get auditLogActionChannelCreate => 'Kanal oluşturuldu';

  @override
  String get auditLogActionChannelUpdate => 'Kanal güncellendi';

  @override
  String get auditLogActionChannelDelete => 'Kanal silindi';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Kanal geçersiz kılma eklendi';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Kanal geçersiz kılma güncellendi';

  @override
  String get auditLogActionChannelOverwriteDelete =>
      'Kanal geçersiz kılma kaldırıldı';

  @override
  String get auditLogActionMemberKick => 'Üye atıldı';

  @override
  String get auditLogActionMemberPrune => 'Üyeler temizlendi';

  @override
  String get auditLogActionMemberBanAdd => 'Üye yasaklandı';

  @override
  String get auditLogActionMemberBanRemove => 'Üye yasaklaması kaldırıldı';

  @override
  String get auditLogActionMemberUpdate => 'Üye güncellendi';

  @override
  String get auditLogActionMemberRoleUpdate => 'Üye rolleri güncellendi';

  @override
  String get auditLogActionMemberMove => 'Üye taşındı';

  @override
  String get auditLogActionMemberDisconnect => 'Üye bağlantısı kesildi';

  @override
  String get auditLogActionBotAdd => 'Bot eklendi';

  @override
  String get auditLogActionRoleCreate => 'Rol oluşturuldu';

  @override
  String get auditLogActionRoleUpdate => 'Rol güncellendi';

  @override
  String get auditLogActionRoleDelete => 'Rol silindi';

  @override
  String get auditLogActionInviteCreate => 'Davet oluşturuldu';

  @override
  String get auditLogActionInviteUpdate => 'Davet güncellendi';

  @override
  String get auditLogActionInviteDelete => 'Davet silindi';

  @override
  String get auditLogActionWebhookCreate => 'Webhook oluşturuldu';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook güncellendi';

  @override
  String get auditLogActionWebhookDelete => 'Webhook silindi';

  @override
  String get auditLogActionEmojiCreate => 'Emoji oluşturuldu';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji güncellendi';

  @override
  String get auditLogActionEmojiDelete => 'Emoji silindi';

  @override
  String get auditLogActionStickerCreate => 'Çıkartma oluşturuldu';

  @override
  String get auditLogActionStickerUpdate => 'Çıkartma güncellendi';

  @override
  String get auditLogActionStickerDelete => 'Çıkartma silindi';

  @override
  String get auditLogActionMessageDelete => 'Mesaj silindi';

  @override
  String get auditLogActionMessageBulkDelete => 'Mesajlar silindi';

  @override
  String get auditLogActionMessagePin => 'Mesaj sabitlendi';

  @override
  String get auditLogActionMessageUnpin => 'Mesaj sabitlenmesi kaldırıldı';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor topluluk ayarlarını güncelledi.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor $target kanalını oluşturdu.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor $target kanalını güncelledi.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor $target kanalını sildi.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor, $target için kanal izinleri ekledi.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor, $channel kanalında $target için kanal izinleri ekledi.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor, $target için kanal izinlerini güncelledi.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor, $channel kanalında $target için kanal izinlerini güncelledi.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor, $target için kanal izinlerini kaldırdı.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor, $channel kanalında $target için kanal izinlerini kaldırdı.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor, $target kişisini attı.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor, $target kişisini yasakladı.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor, $target kişisinin yasağını kaldırdı.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor, $target kişisini güncelledi.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor, $target kişisinin rollerini güncelledi.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor, aktif olmayan üyeleri temizledi.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor, $days gündür aktif olmayan üyeleri temizledi.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor, $target kişisini başka bir sesli kanala taşıdı.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor, $target kişisini $channel kanalına taşıdı.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor, $target kişisini sesten ayırdı.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor, $target botunu ekledi.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor, $target rolünü oluşturdu.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor, $target rolünü güncelledi.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor, $target rolünü sildi.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor, $target davetini oluşturdu.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor, $channel kanalı için $target davetini oluşturdu.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor, $target davetini güncelledi.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor, $channel kanalı için $target davetini güncelledi.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor, $target davetini sildi.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor, $channel kanalı için $target davetini sildi.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor, $target webhook\'unu oluşturdu.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor, $target webhook\'unu güncelledi.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor, $target webhook\'unu sildi.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor, $target emojisini ekledi.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor, $target emojisini güncelledi.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor, $target emojisini sildi.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor, $target çıkartmasını ekledi.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor, $target çıkartmasını güncelledi.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor, $target çıkartmasını sildi.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor bir mesaj sildi.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor, $channel kanalında bir mesaj sildi.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor birden fazla mesaj sildi.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor, $count mesaj sildi.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor, $channel kanalında birden fazla mesaj sildi.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor, $channel kanalında $count mesaj sildi.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor bir mesajı sabitledi.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor, $channel kanalında bir mesajı sabitledi.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor bir mesajın sabitlemesini kaldırdı.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor, $channel kanalında bir mesajın sabitlemesini kaldırdı.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor, $target üzerinde bir denetim işlemi gerçekleştirdi.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return '$field, $oldValue değerinden $newValue değerine güncellendi.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return '$field, $newValue olarak ayarlandı.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return '$field temizlendi (önceki değer: $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return '$field güncellendi.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Topluluk $name olarak yeniden adlandırıldı.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Topluluk simgesi güncellendi.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Kanal $name olarak yeniden adlandırıldı.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Konu temizlendi.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Konuyu $topic olarak güncelledi.';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'Müstehcen içeriği etkinleştirdi.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Müstehcen içeriği devre dışı bıraktı.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return '$nickname olarak ayarlandı.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return '$nickname takma adı kaldırıldı.';
  }

  @override
  String get auditLogChangeMutedMember => 'Üyeyi susturdu.';

  @override
  String get auditLogChangeUnmutedMember => 'Üyenin susturmasını kaldırdı.';

  @override
  String get auditLogChangeDeafenedMember => 'Üyeyi sağırlaştırdı.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Üyenin sağırlaştırmasını kaldırdı.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return '$roles eklendi.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return '$roles kaldırıldı.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kanal: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Mesaj: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return '$value tarafından davet edildi.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# mesaj silindi.',
      one: '# mesaj silindi.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# üye kaldırıldı.',
      one: '# üye kaldırıldı.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'Bu davet asla sona ermez.';

  @override
  String get auditLogOptionTemporaryMembership => 'Geçici üyelik verir.';

  @override
  String get auditLogOptionPermanentMembership => 'Kalıcı üyelik verir.';

  @override
  String get guildSettingsLoadMore => 'Daha fazla yükle';

  @override
  String get guildSettingsLoadingMore => 'Loading...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Kanallara mesaj gönderen webhook\'ları yönetin.';

  @override
  String get guildSettingsWebhooksEmpty => 'Yapılandırılmış webhook yok.';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'This community doesn\'t have any webhooks yet. Go to $channelSettingsPath to create one.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'You need the \"$permission\" permission to view and edit webhooks for this community.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'Failed to load webhooks';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'There was an error loading the webhooks. Try again.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhooks updated';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'Failed to update webhooks';

  @override
  String get guildSettingsUnknownChannel => 'Unknown channel';

  @override
  String get guildSettingsCopyUrl => 'URL\'yi kopyala';

  @override
  String get guildSettingsCopiedUrl => 'URL panoya kopyalandı';

  @override
  String get guildSettingsDeleteWebhook => 'Webhook\'u sil';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Sunucunuz için özel bir davet bağlantısı ayarlayın.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Kaydet';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Kullanım';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count kullanım';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Sunucu keşfetme listesinde yer almak için başvurun.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Not enough members';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Başvurmak için en az $count üyeye sahip olmanız gerekir.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Pending';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Approved';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Rejected';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Removed';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Reason: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Your community is listed in Discovery. You can update your listing details below or withdraw to remove it.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Your application is pending review. You can still update your listing details or withdraw the application.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Choose the category that best describes your community. You can change this any time.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Primary language';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'The language most of your community speaks. Used to filter Discovery results.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Açıklama';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Describe what your community is about';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'A description is required.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Description must be at least $minLength characters.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Description must be no more than $maxLength characters.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Etiketler';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Up to $maxTags tags help people find your community. They show up in Discovery search.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'oyun, sanat, müzik';

  @override
  String get guildSettingsDiscoveryAddTag => 'Add';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Remove tag $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Couldn\'t add tag';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tags must be 2 to $maxLength characters and alphanumeric.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'You can only add up to $maxTags tags.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Başvuruyu Gönder';

  @override
  String get guildSettingsDiscoverySave => 'Save';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Geri Çek';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Discovery application sent';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Discovery listing updated';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Discovery application withdrawn';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Couldn\'t withdraw application';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Try again in a moment.';

  @override
  String get guildSettingsMembersDescription =>
      'Sunucu üyelerini ara ve yönet.';

  @override
  String get guildSettingsMembersSearchHint => 'Üyeleri ara';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count üye';
  }

  @override
  String get guildMembersRecentTitle => 'Recent members';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Showing $displayedCount of $totalCount total members';
  }

  @override
  String get guildMembersSort => 'Sort';

  @override
  String get guildSettingsMembersSortNewest => 'En yeniden önce';

  @override
  String get guildMembersSortOldest => 'Oldest first';

  @override
  String get guildMembersColumnName => 'Name';

  @override
  String get guildMembersColumnMemberSince => 'Member since';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Joined $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Join method';

  @override
  String get guildMembersColumnRoles => 'Roles';

  @override
  String get guildMembersColumnActions => 'Actions';

  @override
  String get guildMembersFilterMemberSince => 'Filter by member since';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filter by account creation date';

  @override
  String get guildMembersFilterJoinMethod => 'Filter by join method';

  @override
  String get guildMembersFilterRoles => 'Filter by roles';

  @override
  String get guildMembersFilterAll => 'All';

  @override
  String get guildMembersFilterPast1Hour => 'Past 1 hour';

  @override
  String get guildMembersFilterPast24Hours => 'Past 24 hours';

  @override
  String get guildMembersFilterPast7Days => 'Past 7 days';

  @override
  String get guildMembersFilterPast2Weeks => 'Past 2 weeks';

  @override
  String get guildMembersFilterPast3Weeks => 'Past 3 weeks';

  @override
  String get guildMembersFilterPast4Weeks => 'Past 4 weeks';

  @override
  String get guildMembersFilterPast3Months => 'Past 3 months';

  @override
  String get guildMembersFilterCustomRange => 'Custom range...';

  @override
  String get guildMembersDateRangeTitle => 'Custom date range';

  @override
  String get guildMembersDateAfter => 'After date';

  @override
  String get guildMembersDateBefore => 'Before date';

  @override
  String get guildMembersClearAll => 'Clear all';

  @override
  String get guildMembersRowsPerPage => 'Rows per page';

  @override
  String get guildMembersEmptySearch => 'Nobody matches that search.';

  @override
  String get guildMembersLoadError =>
      'Something went wrong loading members. Try again later.';

  @override
  String get guildMembersIndexing => 'Indexing members…';

  @override
  String get guildMembersGoToPage => 'Go to page';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Go to page $page';
  }

  @override
  String get guildMembersJumpToPage => 'Jump to page';

  @override
  String get guildMembersJoinSourceCreator => 'Community creator';

  @override
  String get guildMembersJoinSourceInvite => 'Invite';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Invite ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Invited by $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Vanity URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bot invite';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Platform admin';

  @override
  String get guildMembersJoinSourceDiscovery => 'Discovery';

  @override
  String get guildMembersJoinMethodUnknown => 'Unknown';

  @override
  String get guildMembersCommunityOwner => 'Community owner';

  @override
  String get guildMembersViewAllRoles => 'View all roles';

  @override
  String get guildMembersJoinedJustNow => 'Just now';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minutes ago',
      one: '1 minute ago',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hours ago',
      one: '1 hour ago',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count days ago',
      one: '1 day ago',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Members';

  @override
  String get guildMembersChannelListSelected => 'Members, selected';

  @override
  String get guildSettingsInvitesTitle => 'Invites';

  @override
  String get guildSettingsInvitesDescription =>
      'Aktif davet bağlantılarını görüntüleyin ve geri alın.';

  @override
  String get guildSettingsInvitesEmpty => 'Aktif davet yok.';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'This community doesn\'t have any invite links yet. Go to a channel and create an invite to invite people.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'Failed to load invites';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'There was an error loading the invites. Try again.';

  @override
  String get guildSettingsInvitesTryAgain => 'Try again';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Show creation date instead of expiration date';

  @override
  String get guildSettingsInvitesPauseInvites => 'Pause invites';

  @override
  String get guildSettingsInvitesEnableInvites => 'Enable invites';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Pause invites for this community';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Enable invites for this community';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Pause invites? New users won\'t be able to join through invite links until you re-enable them. Existing members won\'t be affected.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Enable invites? Users will be able to join this community through invite links again.';

  @override
  String get guildSettingsInvitesPause => 'Pause';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Invites are paused for this community.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Invites are paused because $productName detected a potential raid. New users can\'t join right now.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Inviter:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Channel:';

  @override
  String get guildSettingsInvitesLabelCode => 'Code:';

  @override
  String get guildSettingsInvitesLabelUses => 'Uses:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Created:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Expires:';

  @override
  String get guildSettingsInvitesUnknown => 'Unknown';

  @override
  String get guildSettingsInvitesNoCategory => 'No category';

  @override
  String get guildSettingsInvitesExpired => 'Expired';

  @override
  String get guildSettingsInvitesNever => 'Never';

  @override
  String get guildSettingsInvitesCopyLink => 'Copy invite link';

  @override
  String get guildSettingsInvitesRevoke => 'Revoke invite';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => 'Couldn\'t revoke invite';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'The link may still work. Try again in a moment.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses kullanım';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return '$date tarihinde sona eriyor';
  }

  @override
  String get guildSettingsBansDescription =>
      'Yasaklanmış kullanıcıları görüntüleyin ve yönetin.';

  @override
  String get guildSettingsBansSearchHint => 'Yasaklamaları ara';

  @override
  String get guildSettingsBansEmpty => 'Yasaklanmış kullanıcı yok.';

  @override
  String get guildSettingsBanPermanent => 'Kalıcı yasaklama';

  @override
  String guildSettingsBanExpires(String date) {
    return '$date tarihinde sona eriyor';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Sona erme';

  @override
  String get guildSettingsUnban => 'Yasağı Kaldır';

  @override
  String get guildSettingsBansLoading => 'Yasaklanmış kullanıcılar yükleniyor';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Aradığınızla eşleşen yasaklama bulunamadı.';

  @override
  String get guildSettingsBanDetailsTitle => 'Yasaklama ayrıntıları';

  @override
  String get guildSettingsBanViewDetails => 'Ayrıntıları görüntüle';

  @override
  String get guildSettingsBannedOn => 'Yasaklanma tarihi';

  @override
  String get guildSettingsBannedBy => 'Yasaklayan kişi';

  @override
  String get guildSettingsRevokeBanTitle => 'Yasağı kaldır';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Yasaklamayı $displayName için kaldırmak istediğinizden emin misiniz? Topluluğa yeniden katılabilirler.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return '$displayName için yasak kaldırıldı';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Yasaklamalar yüklenemedi. Tekrar deneyin.';

  @override
  String get guildSettingsRevokeBanError =>
      'Yasaklama kaldırılamadı. Tekrar deneyin.';

  @override
  String get guildSettingsCommunitySettings => 'Topluluk Ayarları';

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
      'Topluluğunuzun profilini, kanallarını ve varsayılan ayarlarını yönetin.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Markalaşma';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Simgesini, adını, banner\'ını ve davet arka planını güncelle';

  @override
  String get guildSettingsOverviewBannerUpload => 'Banner yükle';

  @override
  String get guildSettingsOverviewIdleTitle => 'Boşta ayarları';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'AFK kanalı ve zaman aşımını yapılandırın';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistem ve karşılama';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Sistem ve karşılama mesajları için hedefi seçin';

  @override
  String get guildSettingsOverviewNotificationsTitle =>
      'Varsayılan bildirimler';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      '250\'den fazla üyeye sahip topluluklar \"yalnızca bahsetmeler\" ayarlarına zorlanır. Orijinal ayarınız korunur ve topluluk 250 üyenin altına düşerse geri yüklenir.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Gelişmiş';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Metin kanalı adlarında esnekliğe izin ver';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Topluluk sahibi tacını gizle';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Ayrılmış banner';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Bannerı topluluk başlığının altındaki kendi bölümünde gösterir.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Simge yükle';

  @override
  String get guildSettingsOverviewRemoveImage => 'Kaldır';

  @override
  String get guildSettingsOverviewSplashTitle => 'Davet arka planı';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Sohbet yerleştirme arka planı';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Sohbetteki davet yerleştirmelerinde gösterilir.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Arka plan yükle';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Topluluk banneri yok';

  @override
  String get guildSettingsOverviewNoInviteBackground => 'Davet arka planı yok';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Önizleme';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Davetinizin ziyaretçilere nasıl göründüğünü görün.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle =>
      'Metin kanalı adları';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'Topluluk sahibi tacı';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Topluluk sahibinin yanındaki taç simgesinin gösterilip gösterilmeyeceğini yapılandırın';

  @override
  String get guildSettingsSplashCardAlignment => 'Kart hizalaması';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Orta';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Sol';

  @override
  String get guildSettingsSplashAlignmentRight => 'Sağ';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Yalnızca geniş ekranlarda geçerlidir.';

  @override
  String get permissionReadMessageHistory => 'Mesaj geçmişini oku';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return '\"$permission\" izni olmayanların görebileceklerini değiştirin';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Sahip olmayan üyeler için bir mesaj geçmişi eşik tarihi belirlemek üzere özel bir pencere kullanın $permission izni.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Mesaj geçmişi eşiğini aç';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'Mesaj geçmişi eşiği';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Mesaj geçmişi eşiğini etkinleştir';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Eşik tarihi';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Mesaj Geçmişini Oku izni olmayan üyeler bu tarihten sonra gönderilen mesajları görüntüleyebilir.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Mesaj geçmişi eşiği güncellendi';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Metin kanalı adlarında büyük harf ve boşluk kullanımına izin verin. Kapalı olduğunda adlar küçük harf, tire ve alt çizgi ile sınırlıdır.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Topluluk sahibinin yanındaki taç simgesini tüm yüzeylerde gizler.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Animasyonlu simgeler Animasyonlu Simge topluluk özelliğini gerektirir.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Animasyonlu bannerlar Animasyonlu Banner topluluk özelliğini gerektirir.';

  @override
  String get guildSettingsAfkChannel => 'AFK / boşta kanalı';

  @override
  String get guildSettingsAfkChannelHint =>
      'Üyeler AFK olduğunda bu kanala taşı.';

  @override
  String get guildSettingsNoAfkChannel => 'AFK kanalı yok';

  @override
  String get guildSettingsAfkTimeout => 'AFK zaman aşımı';

  @override
  String get guildSettingsAfkTimeout1Min => '1 dakika';

  @override
  String get guildSettingsAfkTimeout5Min => '5 dakika';

  @override
  String get guildSettingsAfkTimeout15Min => '15 dakika';

  @override
  String get guildSettingsAfkTimeout30Min => '30 dakika';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 saat';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds saniye';
  }

  @override
  String get guildSettingsSystemChannel => 'Hedef kanal';

  @override
  String get guildSettingsSystemChannelHint =>
      'Hoş geldin ve sistem mesajları burada görünecektir.';

  @override
  String get guildSettingsNoSystemChannel => 'Sistem kanalı yok';

  @override
  String get guildSettingsHideJoinMessages => 'Katılma mesajlarını gizle';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Katılma mesajlarını hedef kanalda gizler.';

  @override
  String get guildSettingsDefaultNotifications =>
      'Varsayılan bildirim ayarları';

  @override
  String get guildSettingsNotificationsAll => 'Tüm mesajlar';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Tüm mesajlarda bildir';

  @override
  String get guildSettingsNotificationsMentions => 'Yalnızca bahsetmeler';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Yalnızca bahsetmelerde bildir';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maksimum 10MB. Minimum: 960×540 piksel (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maksimum 10MB. Minimum: 960×540 piksel (16:9). Sohbet davet gömmelerinde gösterilir.';

  @override
  String get guildSettingsModerationDescription =>
      'Doğrulama, içerik filtreleme ve yetişkinlere yönelik içerik ayarlarını yapılandırın.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Keşfedilen toplulukların sınırlı moderasyon seçenekleri vardır.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'İçerik filtreleme';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Yetişkinlere yönelik olarak işaretlenmemiş kanallardaki mesajları otomatik olarak tarayın.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Keşfedilen toplulukların tüm üyeleri taraması zorunludur. Keşif etkinleştirildiğinde bu ayar değiştirilemez.';

  @override
  String get guildSettingsContentFilterOff => 'Kapalı';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Topluluğun kendi kendini yönetmesine izin ver';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Rolü olmayan üyeleri filtrele';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Çoğu topluluk için önerilir';

  @override
  String get guildSettingsContentFilterAll => 'Herkesi filtrele';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Aile dostu alanlar için maksimum koruma';

  @override
  String get guildSettingsModerationMatureOff => 'Kapalı';

  @override
  String get guildSettingsModerationMatureOn => 'Açık';

  @override
  String get guildSettingsContentWarningToggle => 'İçerik uyarısı göster';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Herhangi bir kanala girmeden önce bir onay istemini açıp kapatır.';

  @override
  String get guildSettingsContentWarningText => 'Özel uyarı metni';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Bu hassas içerik barındırıyor.';

  @override
  String get guildSettingsModeration2faTitle =>
      'İki faktörlü kimlik doğrulama gereksinimi';

  @override
  String get guildSettingsModeration2faDescription =>
      'Yöneticilerin yasaklama, atma, zaman aşımına uğratma veya mesaj silme işlemlerini gerçekleştirebilmeleri için iki faktörlü kimlik doğrulama gerektir.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Moderasyon işlemleri için iki faktörlü kimlik doğrulaması gerektir';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Bu ayarı yalnızca topluluk sahibi değiştirebilir';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Bu ayarı değiştirmek için hesabınızda iki faktörlü kimlik doğrulamayı etkinleştirin';

  @override
  String get guildSettingsEmojiSearchHint => 'Emoji ara';

  @override
  String get guildSettingsEmojiUploadTitle => 'Emoji Yükle';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Emoji slots';

  @override
  String get guildSettingsEmojiDropZone => 'Drag and drop emoji files here';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Failed to load emojis. Try again later.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'No emojis found matching your search.';

  @override
  String get guildSettingsEmojiNoSlots => 'No emoji slots available';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'You\'ve reached the maximum number of emojis. Delete some existing emojis to make room.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emoji names need at least 2 characters and can use letters, numbers, and underscores. Emojis must be under $maxSize. Static images are resized to 128x128 pixels and compressed automatically. Animated emojis and SVGs must already fit the limit.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Uploading emojis';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emojis',
      one: '# emoji',
    );
    return 'Uploading $_temp0. This may take a little while.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Failed to upload emojis. Try again.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Some emojis couldn\'t be added';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Review these files and try again with smaller or simpler images.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Rename emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 characters, letters, numbers, underscores.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Name';

  @override
  String get guildSettingsEmojiColumnUploader => 'Uploaded by';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Unknown';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Delete emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Delete :$name:? Can\'t be undone.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Purge this emoji from storage and CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Emoji name must be at least 2 characters long';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Emoji name must be at most 32 characters long';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Invalid emoji name';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Couldn\'t rename this emoji';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'The name was reverted to what it was before. Please try again in a moment.';

  @override
  String get guildSettingsEmojiGoneTitle => 'This emoji no longer exists';

  @override
  String get guildSettingsEmojiGoneBody =>
      'It may have been deleted. The name was reverted to what it was before.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'You can\'t rename this emoji';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'You don\'t have permission to rename this emoji. The name was reverted to what it was before.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'You\'re going too fast';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Please wait a moment and try renaming again.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Couldn\'t delete this emoji';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'You can\'t delete this emoji';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Allow others to clone your emojis';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'When enabled, members of other communities can use the in-app one-click \"Clone\" shortcut on your custom emojis. This does not prevent them from saving the image and uploading it themselves.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Allow others to clone your stickers';

  @override
  String get guildSettingsCloneStickerDescription =>
      'When enabled, members of other communities can use the in-app one-click \"Clone\" shortcut on your custom stickers. This does not prevent them from saving the image and uploading it themselves.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Only members with the \"$permission\" permission can change this.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Couldn\'t update emoji cloning';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Couldn\'t update sticker cloning';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Animasyonsuz emoji ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Animasyonlu emoji ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Çıkartma ara';

  @override
  String get guildSettingsStickerSlotsTitle => 'Sticker slots';

  @override
  String get guildSettingsStickerUploadTitle => 'Upload sticker';

  @override
  String get guildSettingsStickerDropZone =>
      'Drag and drop a sticker file here (one at a time)';

  @override
  String get guildSettingsStickerDensity => 'Sticker density';

  @override
  String get guildSettingsStickerDensityCozy => 'Cozy';

  @override
  String get guildSettingsStickerDensityCompact => 'Compact';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'Failed to load stickers';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'There was an error loading the stickers. Try again.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'No stickers found matching your search.';

  @override
  String get guildSettingsStickersEmptySearch => 'No stickers found';

  @override
  String get guildSettingsStickerNoSlots => 'No sticker slots available';

  @override
  String get guildSettingsStickerSlotsFull =>
      'You\'ve reached the maximum number of stickers. Delete some existing stickers to make room.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Stickers are saved at 320x320 pixels and must be under $maxSize. Static images are resized and compressed automatically. Animated stickers and SVGs must already fit the limit.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle => 'Unsupported sticker file';

  @override
  String get guildSettingsStickerAddTitle => 'Add sticker';

  @override
  String get guildSettingsStickerEditTitle => 'Edit sticker';

  @override
  String get guildSettingsStickerNameLabel => 'Name';

  @override
  String get guildSettingsStickerNameHint => 'My awesome sticker';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Description';

  @override
  String get guildSettingsStickerDescriptionHint => 'Describe the sticker';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tags ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Add a tag';

  @override
  String get guildSettingsStickerTagAdd => 'Add';

  @override
  String get guildSettingsStickerNameRequired => 'Name is required';

  @override
  String get guildSettingsStickerNameTooShort =>
      'Name must be at least 2 characters';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Name must be 30 characters or less';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Description must be 500 characters or less';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Couldn\'t create this sticker';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Sticker is too large';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Sticker couldn\'t be compressed enough';

  @override
  String get guildSettingsStickerDeleteTitle => 'Delete sticker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Delete \"$name\"? Can\'t be undone.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Purge this sticker from storage and CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Couldn\'t delete this sticker';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'You can\'t delete this sticker';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Kanal ayarlarından webhook\'lar oluşturun. Bunları buradan düzenleyin.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'Vanity URL\'niz, en az bir kanal herkese açık olmadıkça çalışmaz.';

  @override
  String get guildSettingsVanityUrlRemove => 'Kaldır';

  @override
  String get guildSettingsBannedUsersTitle => 'Yasaklanan kullanıcılar';

  @override
  String get guildSettingsInvitesTableInviter => 'Davet Eden';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Kod';

  @override
  String get guildSettingsInvitesTableUses => 'Kullanımlar';

  @override
  String get guildSettingsInvitesTableCreated => 'Oluşturuldu';

  @override
  String get guildSettingsInvitesTableExpires => 'Expires';

  @override
  String get guildSettingsAuditLogFilterUser => 'Kullanıcıya göre filtrele';

  @override
  String get guildSettingsAuditLogFilterAction => 'Eyleme göre filtrele';

  @override
  String get createDm => 'Create DM';

  @override
  String get createGroupDm => 'Create group DM';

  @override
  String get createDmNewMessage => 'New message';

  @override
  String get createDmSelectFriends => 'Select friends';

  @override
  String get createDmChooseFriendsSubtitle => 'Choose friends to message.';

  @override
  String get createDmSearchFriends => 'Search friends';

  @override
  String get createDmNoFriendsFound => 'No friends found';

  @override
  String get createDmNoFriendsYet => 'You have no friends yet';

  @override
  String get createDmClaimToStartDms => 'Claim your account to start DMs.';

  @override
  String get createDmVerifyToStartDms => 'Verify your email to start DMs.';

  @override
  String get createDmVerifyYourEmail => 'Verify your email';

  @override
  String get createDmNewGroup => 'New group';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Create a new group with $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Confirm new group';

  @override
  String get createDmCreateNewGroup => 'Create new group';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Remove $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'You already have a group with these users. Do you really want to create a new one? That\'s fine too!';

  @override
  String get createDmNoActivityYet => 'No activity yet';

  @override
  String get createDmSomeUsersCantBeAdded => 'Some users can\'t be added';

  @override
  String get createDmCreateWithoutThem => 'Create without them';

  @override
  String get createDmUnaddableIntro =>
      'The following people can\'t be added to this group DM:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Create the group DM with the remaining $count recipient(s) and skip the others?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'No remaining recipients to create a group DM with.';

  @override
  String get createDmUnaddableUserNotFound => 'User not found';

  @override
  String get createDmUnaddableBlocked => 'You can\'t message this user';

  @override
  String get createDmUnaddableNotFriends => 'Not on your friends list';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Doesn\'t allow being added to group DMs';

  @override
  String get createDmFailed => 'Couldn\'t create the conversation. Try again.';

  @override
  String get dmListMessagesTitle => 'Messages';

  @override
  String get dmListDirectMessagesTitle => 'Direct Messages';

  @override
  String get keybindsSearchShortcuts => 'Search shortcuts';

  @override
  String get keybindSectionDefaults => 'Defaults';

  @override
  String get keybindSectionMessages => 'Messages';

  @override
  String get keybindSectionNavigation => 'Navigation';

  @override
  String get keybindSectionDragAndDrop => 'Drag and drop';

  @override
  String get keybindSectionChat => 'Chat';

  @override
  String get keybindSectionVoiceAndVideo => 'Voice and video';

  @override
  String get keybindSectionMisc => 'Miscellaneous';

  @override
  String get keybindActionShowShortcutsList => 'Show keyboard shortcuts list';

  @override
  String get keybindActionCopyText => 'Copy text';

  @override
  String get keybindActionMarkUnread => 'Mark as unread';

  @override
  String get keybindActionFocusTextarea => 'Focus text area';

  @override
  String get keybindActionSwitchCommunities => 'Switch between communities';

  @override
  String get keybindActionSwitchChannels => 'Switch between channels';

  @override
  String get keybindActionHistoryBack =>
      'Move back through viewed channel history';

  @override
  String get keybindActionHistoryForward =>
      'Move forward through viewed channel history';

  @override
  String get keybindActionJumpUnreadChannels => 'Jump between unread channels';

  @override
  String get keybindActionJumpMentionChannels =>
      'Jump between unread channels with mentions';

  @override
  String get keybindActionJumpCurrentCall => 'Jump to the current call';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Toggle between last community and DMs';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Switch to previous community or DMs';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Switch to next community or DMs';

  @override
  String get keybindActionGoToDms => 'Go to Direct Messages';

  @override
  String get keybindActionGoToFirstCommunity => 'Go to first community';

  @override
  String get keybindActionGoToSecondCommunity => 'Go to second community';

  @override
  String get keybindActionGoToThirdCommunity => 'Go to third community';

  @override
  String get keybindActionGoToFourthCommunity => 'Go to fourth community';

  @override
  String get keybindActionGoToFifthCommunity => 'Go to fifth community';

  @override
  String get keybindActionGoToSixthCommunity => 'Go to sixth community';

  @override
  String get keybindActionGoToSeventhCommunity => 'Go to seventh community';

  @override
  String get keybindActionGoToEighthCommunity => 'Go to eighth community';

  @override
  String get keybindActionToggleQuickSwitcher => 'Toggle quick switcher';

  @override
  String get keybindActionCreateOrJoinCommunity => 'Create or join a community';

  @override
  String get keybindActionStartDragAndDrop => 'Start drag and drop';

  @override
  String get keybindActionMove => 'Move';

  @override
  String get keybindActionDropItem => 'Drop item';

  @override
  String get keybindActionCancel => 'Cancel';

  @override
  String get keybindActionMarkCommunityRead => 'Mark community as read';

  @override
  String get keybindActionMarkChannelRead => 'Mark channel as read';

  @override
  String get keybindActionStartGroupDm => 'Start a group DM';

  @override
  String get keybindActionTogglePinnedMessages => 'Toggle pinned messages';

  @override
  String get keybindActionToggleInbox => 'Toggle the inbox';

  @override
  String get keybindActionMarkTopInboxRead => 'Mark top inbox channel as read';

  @override
  String get keybindActionMarkAllInboxRead => 'Mark all inbox channels as read';

  @override
  String get keybindActionToggleMemberList =>
      'Toggle the member list or voice chat';

  @override
  String get keybindActionToggleEmojiPicker => 'Toggle the emoji picker';

  @override
  String get keybindActionToggleGifPicker => 'Toggle the GIF picker';

  @override
  String get keybindActionToggleStickerPicker => 'Toggle the sticker picker';

  @override
  String get keybindActionScrollChatUp => 'Scroll chat up';

  @override
  String get keybindActionScrollChatDown => 'Scroll chat down';

  @override
  String get keybindActionJumpOldestUnread =>
      'Jump to the oldest unread message';

  @override
  String get keybindActionFocusComposer => 'Focus the text area';

  @override
  String get keybindActionUploadFile => 'Upload a file';

  @override
  String get keybindActionCopyChannelLink => 'Copy channel link';

  @override
  String get keybindActionToggleSavedMedia => 'Toggle saved media';

  @override
  String get keybindActionSendVoiceMessage => 'Send voice message';

  @override
  String get keybindActionAnswerCall => 'Answer the incoming call';

  @override
  String get keybindActionDeclineCall => 'Decline the incoming call';

  @override
  String get keybindActionStartDmCall => 'Start a call in a DM or group';

  @override
  String get keybindActionToggleSoundboard => 'Toggle the soundboard';

  @override
  String get keybindActionToggleCompactCallView =>
      'Expand or collapse compact call view';

  @override
  String get keybindActionPushToTalkPriority => 'Push to talk (priority)';

  @override
  String get keybindActionVoiceActivityPriority => 'Voice activity priority';

  @override
  String get keybindActionOpenHelp => 'Open help';

  @override
  String get keybindActionSearchMessages => 'Search messages';

  @override
  String get keybindActionOpenContextMenu => 'Open the context menu';

  @override
  String get keybindActionOpenSettings => 'Open your settings';

  @override
  String get keybindActionOpenThemeStudio => 'Open theme studio popout';

  @override
  String get keybindActionZoomIn => 'Zoom in';

  @override
  String get keybindActionZoomOut => 'Zoom out';

  @override
  String get keybindActionZoomReset => 'Reset zoom';

  @override
  String get clipboardPasteFailed =>
      'Couldn\'t paste. The clipboard was empty or blocked for this app.';
}
