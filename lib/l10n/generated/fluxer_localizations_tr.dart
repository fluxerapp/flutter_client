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
  String get reconnectingBody => 'Sunucuda bir sorun var.\nBirazdan düzelecek!';

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
  String get nagbarLearnMore => 'Daha fazla bilgi edinin';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Bakım $localizedTime için planlanmıştır. Tahmini süre: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Bakım devam ediyor. Tahmini süre: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Bakım tamamlandı.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Merhaba $displayName, erişiminizi kaybetmemek için hesabınızı sahiplenin.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Merhaba $displayName, lütfen e-posta adresinizi doğrulayın.';
  }

  @override
  String get nagbarOpenSettings => 'Ayarları aç';

  @override
  String get systemPermissionSettingsTitle => 'İzin etkinleştir';

  @override
  String get systemPermissionSettingsOpenSettings => 'Ayarları aç';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName mikrofonunuza erişemiyor. Bunu cihazınızın gizlilik ayarlarından etkinleştirebilirsiniz.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName kameranıza erişemiyor. Bunu cihazınızın gizlilik ayarlarından etkinleştirebilirsiniz.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName fotoğraf kütüphanenize erişemiyor. Bunu cihazınızın gizlilik ayarlarından etkinleştirebilirsiniz.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName bildirim gönderme iznine sahip değil. Bunu cihaz ayarlarından etkinleştirebilirsin.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Aboneliğiniz yenilenemedi ancak $productName ayrıcalıklarından $graceDate tarihine kadar yararlanmaya devam edeceksiniz. Şimdi harekete geçin, yoksa tüm ayrıcalıkları kaybedersiniz.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Aboneliğiniz $productName için sona erdi. Ayrıcalıklarınızı korumak için şimdi yenileyin.';
  }

  @override
  String get nagbarManageSubscription => 'Aboneliği yönet';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return '$productFullName\'e hoş geldiniz. $productName avantajlarınızı keşfedin ve aboneliğinizi yönetin.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return '$productName özelliklerini görüntüle';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Hediye envanterinde seni bekleyen yeni bir hediye kodun var.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Envanterinde $count yeni hediye kodu seni bekliyor.';
  }

  @override
  String get nagbarViewGiftInventory => 'Hediye envanterini görüntüle';

  @override
  String get nagbarVisionaryMfa =>
      'Visionary hesabınızı korumak için iki faktörlü kimlik doğrulamayı etkinleştirin.';

  @override
  String get nagbarEnableMfa => '2FA\'yı etkinleştir';

  @override
  String get nagbarTermsAcceptance =>
      'Şartlarımızı güncelledik. Devam etmek için lütfen inceleyip kabul edin.';

  @override
  String get nagbarReviewTerms => 'Şartları incele';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Ekiple sohbet etmek ve güncel kalmak için $communityName grubuna katılın.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return '$communityName topluluğuna katılın';
  }

  @override
  String get nagbarPushNotification =>
      'Mesajları ve bahsetmeleri kaçırmamak için bildirimleri etkinleştirin.';

  @override
  String get nagbarEnableNotifications => 'Bildirimleri etkinleştir';

  @override
  String get nagbarBillingPortalFailed =>
      'Ödeme portalı açılamadı. Lütfen birazdan tekrar deneyin.';

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
  String get next => 'İleri';

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
      'Hesap isteğin onay bekliyor. Bir yönetici onayladıktan sonra oturum açabilirsin.';

  @override
  String get registerClosed =>
      'Kayıt şu anda kapalı. Hesap oluşturmak için bir yöneticiden aldığın kayıt bağlantısını kullan.';

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
  String get errorServiceUnavailable =>
      'Bu örnek geçici olarak kullanılamıyor. Bir süre sonra tekrar deneyin.';

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
  String get embedInviteJoinGroup => 'Gruba katıl';

  @override
  String get embedInviteAlreadyJoined => 'Zaten katıldı';

  @override
  String get embedInviteDisabled => 'Davetler devre dışı bırakıldı';

  @override
  String get embedInvitePaused => 'Bu topluluk için davetler duraklatıldı.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName olası bir saldırı tespit ettiğinden, yeni kullanıcılar şu anda katılamaz.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Bu topluluk davetleri duraklattı. Daha sonra tekrar deneyebilirsin.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName, bu toplulukta olası bir baskın algıladı. Davetler duraklatıldı, bu nedenle yeni kullanıcılar şu anda katılamaz.';
  }

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
  String get invalidDeepLinkTitle => 'Bağlantı açılamadı';

  @override
  String get invalidDeepLinkDescription =>
      'Bu bağlantı bozuk olabilir, yalnızca web\'de kullanılabilir veya erişiminiz olmayabilir. Bağlantıyı kontrol edin ve tekrar deneyin.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Ana sayfaya git';

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
    return 'Vizyoner (ömür boyu $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$productName için $count gün',
      one: '$productName için 1 gün',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hafta $productName',
      one: '1 hafta $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ay $productName',
      one: '1 ay $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yıl $productName',
      one: '1 yıl $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Kimden: $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Hediyeni almak için dokun!';

  @override
  String get embedGiftAlreadyRedeemed => 'Zaten kullanıldı';

  @override
  String get embedGiftClaimAccountHelp =>
      'Bu hediyeyi kullanmak için hesabını onayla.';

  @override
  String get embedGiftClaim => 'Hediyeyi al';

  @override
  String get embedGiftClaimed => 'Hediye alındı';

  @override
  String get embedGiftClaimAccount => 'Kullanmak için hesabı talep et';

  @override
  String get embedGiftUnknownTitle => 'Bilinmeyen hediye';

  @override
  String get embedGiftUnknownSubtitle =>
      'Bu hediye kodu geçersiz veya zaten kullanılmış.';

  @override
  String get embedGiftUnavailable => 'Hediye mevcut değil';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return '$productName aboneliğini etkinleştirmek için hediyeni talep et!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Bu hediye zaten alınmış.';

  @override
  String get giftAcceptMaybeLater => 'Belki daha sonra';

  @override
  String get giftRedeemedToast => 'Hediye kullanıldı!';

  @override
  String get giftRedeemInvalidTitle => 'Geçersiz hediye kodu';

  @override
  String get giftRedeemInvalidMessage =>
      'Bu kod geçersiz veya zaten kullanılmış.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Hediye zaten kullanıldı';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Bu kod zaten kullanılmış.';

  @override
  String get giftRedeemNotFoundTitle => 'Hediye bulunamadı';

  @override
  String get giftRedeemNotFoundMessage => 'Bu kod mevcut değil.';

  @override
  String get giftRedeemFailedTitle => 'Hediye kullanılamadı';

  @override
  String get giftRedeemFailedMessage =>
      'Bu hediye kullanılamadı. Tekrar deneyin.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Bu hediyeyi kullanamazsın';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Visionary hesapları Plutonium hediyelerini kullanamaz. Bunun yerine bağlantıyı kopyalayıp bir arkadaşınızla paylaşın.';

  @override
  String get giftCopyLink => 'Hediye bağlantısını kopyala';

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
  String get notificationUseCategoryDefault => 'Kategori Varsayılanını Kullan';

  @override
  String get notificationUseCommunityDefault => 'Topluluk Varsayılanını Kullan';

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
      'Bu konuşmadaki mesajlarını silmek istiyor musun?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Bu işlem, bu konuşmada gönderdiğiniz tüm mesajları kalıcı olarak siler. Bu işlem geri alınamaz.';

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
  String get dmEditGroup => 'Grubu düzenle';

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
  String get dmUnnamedGroup => 'İsimsiz grup';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName grubu';
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
      'Arkadaşlık isteği göndermeden önce e-postanızı doğrulayın.';

  @override
  String get addFriendFriendsListFull =>
      'Arkadaş listeniz veya karşı tarafın arkadaş listesi dolu. Birini çıkarıp tekrar deneyin.';

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
    return 'Bu, $productName uygulamasında varsayılan bir emojidir.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Bu emoji bu topluluktan. Her yerde kullanabilirsin.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Bu, bir topluluktan özel bir emojidir.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Bu, bir topluluktan özel bir emojidir. Bu emojiyi kullanmak için yazardan davetiye isteyin.';

  @override
  String get emojiInfoFromHeader => 'Bu emoji şuradan';

  @override
  String get emojiInfoDiscoverableCommunity => 'Keşfedilebilir topluluk';

  @override
  String get emojiInfoPrivateCommunity => 'Özel topluluk';

  @override
  String get emojiInfoVerifiedCommunity => 'Onaylı topluluk';

  @override
  String get emojiInfoAddToFavorites => 'Favorilere ekle';

  @override
  String get emojiInfoRemoveFromFavorites => 'Favorilerden Kaldır';

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
  String get gifPickerFavoritesEmptyTitle => 'Henüz favori GIF yok';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Bir GIF\'i sabitleyerek burada görmesini sağla.';

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
  String externalLinkWarningLeaving(String productName) {
    return '$productName\'dan ayrılmak üzeresiniz';
  }

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
  String profilePreviewMemberSince(String productName) {
    return '$productName Üyeliği';
  }

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
  String securityLoginEmailSectionDescription(String productName) {
    return '$productName\'a giriş yapmak için kullandığın e-posta adresini yönet';
  }

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
      'SMS kodu mevcut olduğunda gönderilecektir. Numaranız hesabınıza bağlı değildir. Yaklaşık 30 gün içinde en fazla 2 doğrulamaya izin vermek için şifrelenmiş bir işaretleyici saklıyoruz, kullanıcı kimliği olmadan.';

  @override
  String get phoneAddSendCode => 'Kodu Gönder';

  @override
  String get phoneVerifyTitle => 'Telefon Numarasını Doğrula';

  @override
  String get phoneVerifyDescription =>
      'Telefon numaranıza gönderilen doğrulama kodunu girin.';

  @override
  String get phoneAddSuccess => 'Telefon numarası doğrulandı';

  @override
  String get phoneCountryLabel => 'Ülke';

  @override
  String get phoneSearchCountries => 'Ülkeleri ara...';

  @override
  String get phoneNumberRequired => 'Telefon numarası gerekli';

  @override
  String get phoneEnterValidNumber =>
      'Geçerli bir cep telefonu numarası girin.';

  @override
  String get phoneCannotBeUsed =>
      'Bu telefon numarası kullanılamıyor. Başka bir mobil numara deneyin veya destekle iletişime geçin.';

  @override
  String get phoneAlreadyUsed =>
      'Bu telefon numarası zaten kullanılmış. Başka bir numara deneyin veya destekle iletişime geçin.';

  @override
  String get phoneCodeDidNotWork =>
      'Bu kod çalışmadı. Kontrol edip tekrar deneyin.';

  @override
  String get phoneTooManyAttempts =>
      'Çok fazla deneme yaptınız. Biraz bekleyip tekrar deneyin.';

  @override
  String get phoneSmsUnavailable =>
      'SMS doğrulaması şu anda kullanılamıyor. Daha sonra tekrar deneyin veya destekle iletişime geçin.';

  @override
  String get phoneNotEligible =>
      'Bu hesap için telefon doğrulaması kullanılamıyor. Başka bir yöntem kullanın veya destek ekibiyle iletişime geçin.';

  @override
  String get phoneCaptchaRequired =>
      'Telefon doğrulamadan önce bir tarayıcı kontrolü gerekiyor. Giriş sayfasından tekrar deneyin veya destekle iletişime geçin.';

  @override
  String get phoneSomethingWentWrong =>
      'Bir şeyler ters gitti. Tekrar deneyin.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Bu telefon numarasına SMS göndermek çok pahalı, bu yüzden bunun yerine bize bir SMS göndermeniz gerekiyor. Bu gereksinimi hesabınızdan kaldırmamız için destek ekibiyle de iletişime geçebilirsiniz.';

  @override
  String get phoneInboundDefaultDescription =>
      'Telefon numaranızı doğrulamak için bize bir SMS göndermeniz gerekiyor.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Telefonunuzun mesajlaşma uygulamasını açın ve yeni bir kısa mesaj oluşturun.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return '$code kodunu $number numarasına gönder.';
  }

  @override
  String get phoneInboundStepWait =>
      'Mesajınızın bize ulaşmasını bekleyin. Bu bir dakika sürebilir.';

  @override
  String get phoneInboundGetNewCode => 'Yeni kod al';

  @override
  String get phoneInboundChallengeCodeLabel => 'Gönderilecek kod';

  @override
  String get phoneInboundOurNumberLabel => 'Şuraya gönder';

  @override
  String get requiredActionTitle => 'Hesap doğrulaması gerekli';

  @override
  String requiredActionIntroGeneric(String productName) {
    return '$productName uygulamasını kullanmaya devam etmek için gerekli doğrulamayı tamamlayın.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Devam etmeden önce kaydınızın ek bir anti-spam kontrolünden geçmesi gerekiyor.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return '$productName uygulamasını kullanmaya devam etmek için e-postanızı veya telefonunuzu doğrulayın.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return '$productName uygulamasını kullanmaya devam etmek için aşağıdaki gerekli e-posta ve telefon doğrulama adımlarını tamamlayın.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Doğrulama yöntemi seçin';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return '$productName uygulamasını kullanmaya devam etmek için aşağıdaki doğrulama yollarından birini tamamlayın.';
  }

  @override
  String get requiredActionUseEmail => 'E-posta kullan';

  @override
  String get requiredActionUsePhone => 'Telefon kullan';

  @override
  String get requiredActionCheckEmailTitle => 'E-postanızı kontrol edin';

  @override
  String get requiredActionCheckEmailDescription =>
      'E-posta adresinize bir doğrulama bağlantısı gönderdik. Devam etmek için açın.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Doğrulama e-postasını yeniden gönder';

  @override
  String get requiredActionVerificationEmailSent =>
      'Doğrulama e-postası gönderildi. Gelen kutunuzu kontrol edin.';

  @override
  String get requiredActionSignOut => 'Çıkış yap';

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
  String get networkErrorMessage =>
      'Bir şeyler ters gitti. Lütfen tekrar deneyin.';

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
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hafta önce',
      one: '1 hafta önce',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dakika içinde',
      one: '1 dakika içinde',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saat içinde',
      one: '1 saat içinde',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün içinde',
      one: '1 gün içinde',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hafta sonra',
      one: '1 hafta sonra',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ay sonra',
      one: '1 ay sonra',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count yıl sonra',
      one: '1 yıl sonra',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'az önce';

  @override
  String get authorizedAppsTitle => 'Yetkili Uygulamalar';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Bu uygulamalara $productName hesabınıza erişim izni verilmiştir.';
  }

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
  String get blockedUsersCopyTag => 'Kullanıcı adını kopyala';

  @override
  String get blockedUsersCopyId => 'Kullanıcı Kimliğini Kopyala';

  @override
  String get userProfileLoadError => 'Profil yüklenemedi';

  @override
  String get userProfileLoading => 'Profil yükleniyor';

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
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName Ekibi';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName Topluluk Ekibi';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName Partner';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return '$productName Hata Avcısı';
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
    return '$productName Plutonium abonesi $date tarihinden beri';
  }

  @override
  String userProfileVisionaryBadgeTooltip(String productName) {
    return '$productName Vizyoner';
  }

  @override
  String userProfileVisionaryBadgeSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Vizyoner $date tarihinden beri';
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
  String get userProfileRoles => 'Roller';

  @override
  String get memberRoleAdd => 'Rol ekle';

  @override
  String memberRoleRemove(String roleName) {
    return '$roleName rolünü kaldır';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Bu kullanıcının bu toplulukta hiçbir rolü yok.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Henüz rol yok. Rolleri $rolesSettingsPath adresinden ekleyin';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Kullanılabilir rol yok';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Şu anda bu toplulukta atayabileceğin rol bulunmuyor ancak yeni bir rolü $rolesSettingsPath adresinde oluşturabilirsin.';
  }

  @override
  String get guildSettingsTitle => 'Topluluk ayarları';

  @override
  String get guildSettingsRolesTab => 'Roller';

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
  String get iarReportGuildTitle => 'Topluluğu bildir';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Bu şikayet bu topluluktaki belirli bir mesajla ilgiliyse, bunun yerine o mesajı şikayet edin. Mesaj şikayetleri, güvenlik ekibimize en net bağlamı sağlar ve yorumlara ayrıntı eklemek, incelememizi hızlandırmamıza yardımcı olabilir. Yalnızca bir mesajı şikayet etmenin daha geniş sorunu kapsamayacağı durumlarda topluluğun tamamını şikayet etmeye devam edin.';

  @override
  String get iarContinueToReportCommunity => 'Topluluğu bildirmeye devam et';

  @override
  String get iarPreviewCommunitySubtitle => 'Topluluk';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Taciz veya hedefli kötüye kullanım';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Topluluk, \"pile-on\" veya hedefli kötüye kullanımı kolaylaştırır.';

  @override
  String get iarReasonHateGuildDescription =>
      'Korumalı gruplara karşı nefreti teşvik eder.';

  @override
  String get iarReasonTerrorismLabel =>
      'Terörizm veya şiddet içeren aşırıcılık';

  @override
  String get iarReasonTerrorismDescription =>
      'Şiddet içeren aşırılık yanlısı faaliyetleri teşvik eder, bu faaliyetler için eleman toplar veya koordine eder.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Yetişkinlere yönelik içerik veya güvenli olmayan kısıtlama';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Uygun filtreleme olmadan yetişkinlere yönelik içerik.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Küçüklere zarar veriyor veya çocuk istismarı içeriği barındırıyor.';

  @override
  String get iarReasonRaidLabel => 'Saldırı koordinasyonu';

  @override
  String get iarReasonRaidDescription =>
      'Kişilere veya topluluklara karşı baskınları, örgütlü tacizi veya tacizi koordine eder.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Topluluk, platformu spam\'lemek, dolandırmak veya kötüye kullanmak için var.';

  @override
  String get iarReasonMalwareGuildLabel => 'Kötü amaçlı yazılım dağıtımı';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Kötü amaçlı yazılım, kimlik bilgisi hırsızlığı veya zararlı dosyalar dağıtır.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Gizlilik ihlali veya doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Kişisel bilgi paylaşıyor, kullanıcıları takip ediyor veya gizlilik ihlallerini koordine ediyor.';

  @override
  String get iarReasonSelfHarmGuildLabel =>
      'Kendine zarar vermeyi teşvik ediyor';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'İntiharı, kendine zarar vermeyi veya yeme bozukluklarını teşvik ediyor.';

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
  String get slowmodeStatusEnabled => 'Yavaş mod etkin';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Yavaş mod etkin ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Yavaş mod $durationLabel olarak ayarlandı, ancak sen muafsın.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Yavaş mod $durationLabel olarak ayarlandı. Başka bir mesaj göndermeden önce bekle.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Bu kanal için yavaş mod $durationLabel olarak ayarlandı.';
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
      'Kaydetmek için basılı tutun. Silmek için sürükleyin, kilitlemek için yukarı kaydırın veya göndermek için bırakın.';

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
  String get voiceMessageSeekForward => 'Sesli mesajı ileri sar';

  @override
  String get voiceMessageSeekBackward => 'Geri sar';

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
  String get chatAttachmentDownloadedToast => 'Fotoğraflara kaydedildi';

  @override
  String get chatAttachmentDownloadFailedToast => 'Ek indirilemedi';

  @override
  String get chatAttachmentExpiredTooltip => 'Dosya süresi doldu';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Genişlet ($count satır)',
      one: 'Genişlet ($count satır)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count satır) Daralt',
      one: '($count satır) Daralt',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count satır) Göster',
      one: '($count satır) Göster',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '($count satır gizle)',
      one: '($count satır gizle)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count satır kaldı)',
      one: '... ($count satır kaldı)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count satır kaldı)',
      one: '... ($count satır kaldı)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Dosyanın tamamını görüntüle';

  @override
  String get chatTextualPreviewChangeLanguage => 'Dili değiştir';

  @override
  String get chatTextualPreviewSearchLanguage => 'Dil ara…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Sözdizimi vurgulama';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Sonuç bulunamadı';

  @override
  String get chatTextualPreviewMoreOptions => 'Diğer seçenekler';

  @override
  String get chatTextualPreviewWrapText => 'Metni kaydır';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Dosya satır içi önizleme için çok büyük (sınır $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Önizleme yüklenemiyor.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Düz metin';

  @override
  String get chatTextualPreviewCopy => 'Kopyala';

  @override
  String get chatAttachmentSourceGallery => 'Galeri';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Dosyalara göz at';

  @override
  String get chatAttachmentPasteTooltip => 'Panodan dosya yapıştır';

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
  String connectionsDescription(String productName) {
    return 'Harici hesapları ve alan adlarını $productName profilinize bağlayın. Doğrulanmış bağlantılar profilinizde başkalarının görebilmesi için görüntülenecektir.';
  }

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
  String get lookAndFeelHdrSectionTitle => 'Yüksek dinamik aralık';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'HDR görüntülerinin HDR özellikli monitörlerde nasıl görüntüleneceğini kontrol edin.';

  @override
  String get lookAndFeelHdrFullName => 'Tam dinamik aralık';

  @override
  String get lookAndFeelHdrFullDescription =>
      'HDR görüntüleri tam parlaklık ve renk aralığında gösterin.';

  @override
  String get lookAndFeelHdrStandardName => 'Standart aralık';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'HDR görüntüleri standart aralığa ton eşleyerek en yüksek parlaklığı azaltın.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Yüksek dinamik aralıklı ekran modu';

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
      'Sohbet yazı tipi ölçeklendirmesi';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Sohbet alanındaki yazı tipi boyutunu ayarlayın.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Sohbet yazı tipi boyutu';

  @override
  String get lookAndFeelAppZoomTitle => 'Uygulama yakınlaştırma düzeyi';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Uygulamanın yakınlaştırma düzeyini ayarla.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Sohbet Duvar Kağıdı';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Sohbet için bir arka plan seçin. Bu, bu cihazda kalır.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Bu ayar bu cihazda kalır';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Sohbet duvar kağıdı yalnızca bu cihazda kaydedilir ve diğer cihazlarla eşitlenmez.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Varsayılan';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Özel resim';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Starfield';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Renk $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradyan $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Duvar kağıdını karart';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Bu görsel duvar kağıdı olarak ayarlanamadı.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Mesajlar';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Sohbet kanallarında mesajların nasıl görüntüleneceğini seçin.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Mesaj grupları arası boşluk';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Mesaj görüntüleme modu';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Rahat';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Mesajlar arasında net görsel ayrım sağlayan geniş düzen.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Yoğun';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Minimum aralıkla görünen mesajları en üst düzeye çıkarır.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Kullanıcı avatarlarını gizle';

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
      'Topluluk geçici olarak kullanılamıyor';

  @override
  String get guildUnavailableDescription =>
      'Bir şeyler ters gitti. Üzerinde çalışıyoruz.';

  @override
  String get guildNotFoundTitle => 'Aradığınız topluluk bu değil.';

  @override
  String get guildNotFoundDescription =>
      'Aradığınız topluluk silinmiş veya erişim izniniz olmayabilir.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName şu anda yalnızca $productName çalışanları tarafından erişilebilir';
  }

  @override
  String get guildNavbarTemporarilyUnavailable =>
      'geçici olarak kullanılamıyor';

  @override
  String get lookAndFeelCollapseDMsLabel => 'DM\'leri Klasöre Daralt';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Etkinleştirildiğinde, sunucu kenar çubuğundaki okunmamış DM\'ler $productName düğmesindeki bir klasöre daraltılır. Klasörü genişletmek veya daraltmak için DM\'ler sayfasındayken $productName düğmesine tıklayın.';
  }

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
  String get favoritesAddToSavedMedia => 'Kaydedilen medyaya ekle';

  @override
  String get favoritesRemoveFromSavedMedia => 'Kaydedilmiş medyadan kaldır';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'URL üzerinden GIF\'lere ekle';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Yalnızca URL\'den kaydedilen GIF favorilerinden kaldır';

  @override
  String get savedMediaAddTitle => 'Kaydedilen medyaya ekle';

  @override
  String get savedMediaFormNameLabel => 'Ad';

  @override
  String get savedMediaFormNameHint => 'Harika medyam';

  @override
  String get savedMediaFormAltTextLabel => 'Alternatif metin';

  @override
  String get savedMediaFormAltTextHint => 'Medyayı açıklayın';

  @override
  String get savedMediaFormTagsLabel => 'Etiketler';

  @override
  String get savedMediaFormTagsHint => 'komik, tepki, iş';

  @override
  String get savedMediaSaveError => 'Kaydedilen medya güncellenemedi.';

  @override
  String get savedMediaNameRequired => 'Ad gerekli.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'GIF favorilerini nasıl kaydetmeliyiz?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Yıldızlı GIF\'leri yalnızca URL olarak favorilere kaydedebilir veya medyaya yükleyebilirsiniz. Kullanımınıza en uygun olanı seçin. Ayarlar > Gelişmiş > Medya bölümünden istediğiniz zaman değiştirebilirsiniz.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'URL tabanlı favoriler (varsayılan): cihazlarınız arasında eşitlenir, yükleme yapmaz, kayıtlı medyalarınızdan sayılmaz. Orijinal medya barındırıcısı tarafından kaldırılırsa kaybolabilir.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Kaydedilen medya: yüklenebilir, etiketlenebilir, aranabilir ve kalıcıdır, ancak kayıtlı medya limitinizden düşülür.';

  @override
  String get gifFavoriteFirstTimeHint => 'Yalnızca bir kez soracağız.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Yalnızca URL kullan (önerilir)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Kaydedilen medyayı kullan';

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
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Doğrudan $productName\'a yüklendiğinde';
  }

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
  String get messagesMediaCameraUploadsSectionTitle => 'Kamera yüklemeleri';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Uygulama içi kamerayla çekilen fotoğraf ve videoların cihazınızda saklanıp saklanmayacağını seçin';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Cihaza kaydet';

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
  String get accessibilityVisualGroupTitle => 'Görsel';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Bağlantıların her zaman altını çiz';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Üstü çizili metni soluklaştır';

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
  String get accessibilityScreenReaderGroupTitle => 'Ekran okuyucu';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Ekran okuyucularla $productName ayarlarını kontrol edin.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Yeni mesajları duyur';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Ekran okuyucuların açık kanala yeni mesajlar geldiğinde bunları duyurmasını sağlayın. Bildirim sesleri etkilenmez.';

  @override
  String get accessibilityTtsGroupTitle => 'Metin okuma';

  @override
  String get accessibilityTtsGroupDescription =>
      'Konuşulan metin için bir hız seçin.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel => 'Konuşma oynatma hızı';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Örnek oynat';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Sessiz örnek';

  @override
  String get accessibilityPreviewButtonLabel => 'Önizleme düğmesi';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Bağlantı önizlemeleri şu şekilde görünür: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Önizleme Kullanıcısı';

  @override
  String get accessibilityKeyboardGroupTitle => 'Klavye';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Sohbet metin alanında odak halkasını göster';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Esc tuşu klavye modundan çıkar';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'İçerik menüsü kısayollarını göster';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Aramaları başlatmadan önce onayla';

  @override
  String get accessibilityAnimationGroupTitle => 'Animasyon';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Azaltılmış hareket açık, bu nedenle içerik animasyonları varsayılan olarak duraklatıldı. Yine de oynatmaya devam etmek için bunlardan herhangi birini tekrar açabilirsiniz.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Hareketli emojileri oynat';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'GIF\'leri otomatik oynat';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return '$productName odaklandığında GIF\'leri otomatik oynat';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Azaltılmış harekete rağmen oynatılıyor.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Azaltılmış hareket nedeniyle duraklatıldı. Animasyonlu emojilerin oynatılmaya devam etmesi için açın.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Azaltılmış hareket nedeniyle duraklatıldı. GIF\'lerin oynatılmaya devam etmesi için açın.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Pil ömrünü ve veri kullanımını korumak için mobil cihazlarda varsayılan olarak kapalıdır.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Çıkartma animasyonları';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Çıkartma animasyonu tercihi';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Her zaman canlandır';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Çıkartmalar her zaman hareketli olur';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Etkileşimde canlandır';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Çıkartmalara bastığınızda hareket ederler';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Üzerine geldiğinizde veya onlarla etkileşim kurduğunuzda çıkartmalar canlanır';

  @override
  String get accessibilityStickerNeverAnimateName => 'Asla hareketlendirme';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Çıkartmalar asla hareket etmez';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Azaltılmış harekete rağmen her zaman animasyonlu.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Azaltılmış hareket, çıkartmaların yalnızca etkileşim üzerine canlanmasını sağlar. Geçersiz kılmak için her zaman canlandır seçeneğini belirleyin.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Pil ömrünü korumak için mobil cihazlarda etkileşimde animasyon varsayılan olarak açıktır.';

  @override
  String get accessibilityMotionGroupTitle => 'Hareket';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Azaltılmış hareket ayarını sistemle senkronize et';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Bu cihazın sistem azaltılmış hareket tercihini kullanın veya aşağıdan özelleştirin.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Hareketi azalt';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Animasyonları ve geçişleri devre dışı bırakın. Şu anda sistem ayarınız tarafından kontrol ediliyor.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Uygulama genelindeki animasyonları ve geçişleri devre dışı bırakın.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Animasyonlu emojiler, GIF\'ler ve çıkartmalar Animasyon sekmesinde kontrolünüz altında kalır.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Arama başlatılsın mı?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Bu aramayı başlatmak istediğinizden emin misiniz?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Aramayı başlat';

  @override
  String get accessibilityTtsSampleDescription =>
      'Seçtiğiniz hızda okunan örnek satırı dinleyin.';

  @override
  String get accessibilityTtsSampleText =>
      'Doktor, ben gelecekten geliyorum. Senin icat ettiğin bir zaman makinesiyle buraya geldim. Şimdi, 1985 yılına geri dönmek için yardımına ihtiyacım var.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Bu cihazda konuşma sentezi kullanılamıyor.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Konuşma oynatılamadı. Tekrar deneyin veya ses çıkışının çalıştığından emin olun.';

  @override
  String get ttsSubstitutionUnknownUser => 'Bilinmeyen kullanıcı';

  @override
  String get ttsSubstitutionUnknownRole => 'bilinmeyen rol';

  @override
  String get ttsSubstitutionUnknownChannel => 'bilinmeyen kanal';

  @override
  String get ttsSubstitutionCodeBlock => 'kod bloğu';

  @override
  String get ttsSubstitutionSpoiler => 'gizli';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '$emojiName emojisi';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '/$commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName dedi ki: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '$replyAuthorName adlı kişiye yanıt olarak, $authorName dedi ki: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'bir çıkartma gönderdi';

  @override
  String get ttsSentAttachment => 'bir ek gönderdi';

  @override
  String ttsSentAttachments(int count) {
    return '$count ek gönderme';
  }

  @override
  String get ttsSentEmbed => 'bir yerleştirme gönderdi';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author $summary gönderdi';
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
  String get systemCallJoinTheCall => 'Aramaya katılın';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username adlı kişi, $duration süren bir çağrı başlattı.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return '$username adlı kişiden gelen ve $duration süren bir aramayı kaçırdınız.';
  }

  @override
  String systemCallMissed(String username) {
    return '$username adlı kişiden gelen çağrıyı kaçırdınız.';
  }

  @override
  String get systemCallDurationFewSeconds => 'birkaç saniye';

  @override
  String get systemCallDurationMinute => 'bir dakika';

  @override
  String get systemCallDurationOneYear => '1 yıl';

  @override
  String get systemCallDurationOneMonth => '1 ay';

  @override
  String get systemCallDurationOneWeek => '1 hafta';

  @override
  String get systemCallDurationOneDay => '1 gün';

  @override
  String get systemCallDurationOneHour => '1 saat';

  @override
  String systemCallDurationYears(int count) {
    return '$count yıl';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count ay';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count hafta';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count gün';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count saat';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count dakika';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Bu mesajı görüntülemek için $productName uygulamasını güncelleyin.';
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
  String get voiceJoinFailedTitle => 'Sesli sohbete katılamadık';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Diğer cihazlarınızla bağlantı kurulamadı. Bir süre sonra tekrar deneyin.';

  @override
  String get voiceChannelEmptyDescription =>
      'Bu bir sesli kanal. Konuşmaya başlamak için bağlanın!';

  @override
  String get voiceChannelJoin => 'Sesli kanala katıl';

  @override
  String get voiceCallJoin => 'Aramaya katıl';

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
  String get voiceInChat => 'Sesli sohbette';

  @override
  String get voiceConnectionFailed => 'Bağlantı başarısız oldu';

  @override
  String get voiceConnectionRetry => 'Tekrar dene';

  @override
  String get voiceConnectionDismiss => 'Kapat';

  @override
  String get voiceConnectionDisconnected => 'Bağlantı kesildi';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => 'Gecikme ölçülüyor...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return '$channelSourceLabel adlı kanala atla';
  }

  @override
  String get voiceConnectionTitle => 'Ses bağlantısı';

  @override
  String get voiceConnectionAdvancedStats => 'Gelişmiş';

  @override
  String get voiceShowCallAvatars => 'Arama avatarlarını göster';

  @override
  String get voiceShowConnectionId => 'Bağlantı kimliğini göster';

  @override
  String get voiceAudioProcessing => 'Ses işleniyor';

  @override
  String get voiceConnectionSessionSection => 'Oturum';

  @override
  String get voiceConnectionDurationLabel => 'Süre';

  @override
  String get voiceConnectionParticipantsLabel => 'Katılımcılar';

  @override
  String get voiceConnectionNetworkSection => 'Ağ';

  @override
  String get voiceConnectionPingLabel => 'Gecikme';

  @override
  String get voiceConnectionJitterLabel => 'Titreşim';

  @override
  String get voiceConnectionSendLabel => 'Gönder';

  @override
  String get voiceConnectionReceiveLabel => 'Alınan';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes dk $seconds sn';
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
  String get userAreaMuteMicrophone => 'Mikrofonu sessize al';

  @override
  String get userAreaUnmuteMicrophone => 'Mikrofonun sesini aç';

  @override
  String get userAreaUserSettings => 'Kullanıcı ayarları';

  @override
  String get voiceParticipantMenuViewProfile => 'Profili görüntüle';

  @override
  String get voiceParticipantMenuFocus => 'Bu kişiye odaklan';

  @override
  String get voiceParticipantMenuUnfocus => 'Odaklanmayı kaldır';

  @override
  String get voiceParticipantMenuCommunityMute => 'Topluluk sessize alma';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Topluluk sağırlaştırması';

  @override
  String get voiceParticipantMenuUserVolume => 'Kullanıcı sesi';

  @override
  String get voiceParticipantMenuStreamVolume => 'Yayın sesi';

  @override
  String get voiceParticipantMenuStopStreaming => 'Akışı durdur';

  @override
  String get voiceParticipantModerationFailed =>
      'Üye güncellenemedi. Lütfen tekrar deneyin.';

  @override
  String get voiceControlChat => 'Sohbet';

  @override
  String get voiceCallViewModeLabel => 'Görüntüle';

  @override
  String get voiceCallViewModeGrid => 'Kare';

  @override
  String get voiceCallViewModeFocus => 'Odaklanma';

  @override
  String get voicePanelSettingsSectionTitle => 'Ses ayarları';

  @override
  String get voicePanelUseEarpieceLabel => 'Ahizeyi kullan';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Yalnızca videoları göster';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Yalnızca kamerası açık olan katılımcıları göster.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Kendi kameramı göster';

  @override
  String get voicePrioritizeSpeakersLabel => 'Konuşmacılara öncelik ver';

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
  String get privacyDashboardProfilePrivacySection => 'Profil gizliliği';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Arkadaşlar ve doğrudan mesajlar';

  @override
  String get privacyDashboardActivitySharingSection => 'Etkinlik paylaşımı';

  @override
  String get privacyDashboardSensitiveContentSection => 'Hassas içerik';

  @override
  String get privacyDashboardDataExportSection => 'Veri dışa aktarma';

  @override
  String get privacyDashboardDataDeletionSection => 'Veri silme';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Profilinizin tamamını kimler görebilir';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Arkadaşlar ve tüm topluluklar';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Profilinizin tamamı arkadaşlarınıza ve topluluklarınızdaki herkese görünür';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Sadece arkadaşlar ve küçük topluluklar';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Profilinizin tamamı arkadaşlarınıza ve 200 veya daha az üyeli topluluklarınızın üyelerine görünür';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Sadece arkadaşlar';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Profilinizin tamamı yalnızca arkadaşlarınıza görünür';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Arkadaşlık istekleri';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Herkes';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Herkesin sana arkadaşlık isteği göndermesine izin ver';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Arkadaşlarının Arkadaşları';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Arkadaşlarınızın arkadaşları size istek göndermesine izin ver';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Topluluk Üyeleri';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Dahil olduğunuz topluluklardaki üyelerin size istek göndermesine izin ver';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Direkt mesajlar';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Topluluk üyelerinden doğrudan mesajlara izin ver';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Dahil olduğunuz topluluklardaki üyelerin size doğrudan mesaj göndermesine izin ver';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Topluluk botlarından doğrudan mesajlara izin ver';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Dahil olduğunuz topluluklardaki botların size özel mesaj göndermesine izin ver';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Arkadaşlık istekleri ve özel mesajlar gönderebilen kişileri kontrol edin';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Kimlerin sizi arayabileceğini ve grup sohbetlerine ekleyebileceğini kontrol edin';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Gelen aramalar';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Kimlerin seni arayabileceğini kontrol et';

  @override
  String get privacyDashboardAllowedCallers => 'İzin verilen arayanlar';

  @override
  String get privacyDashboardIncomingCallNobody => 'Kimse';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Gelen tüm çağrıları engelle';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Yalnızca Arkadaşlar';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Yalnızca arkadaşlarınızın sizi arama yapmasına izin verin (önerilen)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Arkadaşlar + Özel';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Arkadaşlara ve seçtiğiniz ek gruplara izin ver';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Herkes';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Herkesin, yabancıların bile sizi arayabilmesine izin verin';

  @override
  String get privacyDashboardAdditionalGroups => 'Ek Gruplar';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Arkadaşlarınızın arkadaşları size arama yapabilir';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Hem sizin hem de diğer kişilerin bulunduğu topluluklardaki kişiler size arama yapabilir';

  @override
  String get privacyDashboardRingBehavior => 'Halka Davranışı';

  @override
  String get privacyDashboardSilentCalls => 'Herkesten sessiz aramalar';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Tüm aramalar çalmak yerine sessizce bildirim gönderecek. Varsayılan olarak, arkadaşı olmayanlardan gelen aramalar her zaman sessizdir.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Grup Sohbetlerine Kimler Sizi Ekleyebilir';

  @override
  String get privacyDashboardGroupDmDesc =>
      'İzin istemeden sizi grup sohbetlerine kimlerin ekleyebileceğini kontrol edin. Herkes yine de size katılma davet bağlantıları gönderebilir.';

  @override
  String get privacyDashboardAllowedInvites => 'İzin verilen davetler';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Kimsenin sizi sormadan grup sohbetlerine eklemesine izin vermeyin';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Yalnızca arkadaşların sizi sormadan eklemesine izin verin (önerilen)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Arkadaşların ve ek olarak grupların sana eklenmesine izin ver';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Herkesin sizi sormadan grup sohbetlerine eklemesine izin verin';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Arkadaşlarınızın arkadaşları sizi grup sohbetlerine ekleyebilir';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Hem üyesi olduğunuz topluluklardaki kişiler sizi grup sohbetlerine ekleyebilir';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Şimdi aktif\'te ses etkinliği';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Ses etkinliğinizi arkadaşlarınızla paylaşın';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Ses etkinliğini tüm arkadaşlarınla paylaşmak ister misin?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Sesli sohbet etkinliğini tüm arkadaşlarınla paylaşmayı durdurmak istiyor musun?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Ses etkinliğinizi mevcut ve gelecekteki tüm arkadaşlarınızla paylaşmak üzeresiniz. Bu işlem tüm arkadaşlarınıza bir güncelleme gönderir ve 24 saat içinde tekrar değiştirilemez.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Ses etkinliğinizi mevcut ve gelecekteki tüm arkadaşlarınızla paylaşmayı durdurmak üzeresiniz. Bu işlem tüm arkadaşlarınıza bir güncelleme gönderir ve 24 saat içinde tekrar değiştirilemez.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Evet, tüm arkadaşlarımla paylaş';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Evet, paylaşmayı durdur';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Şu kadar süre sonra tekrar kullanılabilir: $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Ses etkinliği paylaşımı güncellendi';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Ses etkinliği paylaşımı şu anda güncellenemedi';

  @override
  String get privacyDashboardDataExportDesc =>
      'Mesajlar ve ek URL\'leri dahil olmak üzere hesap verilerinizin indirilebilir bir arşivini oluşturun. Çoğu kişi her şeyi ister ancak kapsamı aşağıdan daraltabilirsiniz.';

  @override
  String get privacyDashboardExportMyData => 'Verilerimi dışa aktar';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'DM\'ler, grup DM\'leri ve topluluklar genelinde gönderdiğiniz mesajları kalıcı olarak kaldırın. İşlem arka planda çalışır ve tamamlandığında bir DM alırsınız.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Mesajlarımı sil';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Topluluk üyelerinden doğrudan mesajlara izin verilsin mi?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Topluluk üyelerinden gelen direkt mesajları engelle?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Botların size doğrudan mesaj göndermesine izin verilsin mi?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Botların size doğrudan mesaj göndermesini engellemek ister misiniz?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Mevcut topluluklarınızdaki üyelerden gelen direkt mesajlara da izin vermek ister misiniz?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Mevcut topluluklarınızdaki üyelerden gelen doğrudan mesajları da engellemek ister misiniz?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Mevcut topluluklarınızdaki botların size doğrudan mesaj göndermesine de izin vermek ister misiniz?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Mevcut topluluklarınızdaki botları da engellemek ister misiniz?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Topluluk adına bu ayarı değiştirmek için topluluk adına uzun basın ve Gizlilik Ayarları\'nı seçin.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Tüm topluluklara izin ver';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Tüm topluluklar için engelle';

  @override
  String get privacyDashboardDmConfirmSkip => 'Bu adımı atla';

  @override
  String get privacyDashboardDataRequestGoBack => 'Geri dön';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Verilerimi dışa aktar';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Mesajlarımı sil';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Bunu en kısa sürede işleme alacağız. Arşiviniz hazır olduğunda bir e-posta alacaksınız.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Bunu en kısa sürede işleme alacağız. Tamamlandığında bizden bir DM alacaksın.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Neler dahil edilsin';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Her şey';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Gönderdiğiniz tüm mesajları, hesap ayarlarınızı, üyeliklerinizi ve meta verilerinizi dışa aktarın.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Özel seçim';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Arşive hangi sohbet türlerinin, toplulukların ve zaman aralığının dahil edileceğini seçin.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Neleri dahil edeceğinizi seçin';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Hangi tür konuşmaları temizleyeceğini seç.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Artık erişemediğim yerler';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Yalnızca ayrıldığınız veya çıkarıldığınız topluluklardaki ve grup DM\'lerindeki mesajları silin.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Hangi sohbetler';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Dahil edilmesini istediğiniz konuşma türlerini açıp kapatın.';

  @override
  String get privacyDashboardDataRequestKindDms => 'DM\'leri aç';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'Kapatılan DM\'ler';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Grup DM\'leri';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Topluluklar';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Hangi topluluklar';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Topluluk filtresi';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Seçilenler dışındakilerin tümünü dahil et';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Yalnızca seçilenler';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Şu anda hiçbir toplulukta değilsiniz.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Zaman aralığı';

  @override
  String get privacyDashboardDataRequestDateMode => 'Zaman aralığı';

  @override
  String get privacyDashboardDataRequestAllTime => 'Tüm zamanlar';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Özel aralık';

  @override
  String get privacyDashboardDataRequestStartDate => 'Başlangıç tarihi';

  @override
  String get privacyDashboardDataRequestEndDate => 'Bitiş tarihi';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Pencerenin o ucunu sınırsız bırakmak için alanlardan birini boş bırakın.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Lütfen dahil etmek için en az bir sohbet türü seçin.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Başlangıç tarihi bitiş tarihinden önce olmalı.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'İncele ve onayla';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Gönderdiğiniz tüm mesajların indirilebilir bir arşivini oluşturacağız ve hazır olduğunda size e-posta göndereceğiz. Bu e-postadaki indirme bağlantısının süresi 7 gün sonra dolar.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Aşağıdaki filtrelere uygun indirilebilir bir arşiv oluşturacağız ve hazır olduğunda size e-posta göndereceğiz. Bu e-postadaki indirme bağlantısının süresi 7 gün sonra dolar.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Aşağıdaki filtrelerle eşleşen mesajları kalıcı olarak silin. Bu işlem geri alınamaz.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Bu işlem başladıktan sonra geri alınamaz. Tamamlandığında size doğrudan mesaj göndereceğiz.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Dışa aktarma iste';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Mesajları sil';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Kapsam';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Sohbetler';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Topluluklar';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Zaman aralığı';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Yok';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Başlangıç: $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return '$end tarihine kadar';
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
      other: '# topluluk',
      one: '# topluluk',
    );
    return 'Şu $_temp0 hariç hepsi';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# topluluk',
      one: '# topluluk',
    );
    return 'Yalnızca $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Açık direkt mesajlar';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Kapatılan doğrudan mesajlar';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Doğrudan mesajlar (açık ve kapalı)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Grup DM\'leri';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Topluluklar';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# saat',
      one: '# saat',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# dakika',
      one: '# dakika',
    );
    return '$_temp0 ve $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# saat',
      one: '# saat',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# dakika',
      one: '# dakika',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# saniye',
      one: '# saniye',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'Gizlilik ayarları yüklenemedi';

  @override
  String get privacyDashboardRetry => 'Yeniden Dene';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Hassas içerik ayarları kaydedilemedi.';

  @override
  String get privacyDashboardDataRequestFailed => 'İstek tamamlanamadı.';

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
      'Seçilen bir veya daha fazla kanalda yavaş modun süresinin dolması bekleniyor.';

  @override
  String get slowmodeRateLimitedTitle => 'Yavaş mod etkin';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Yavaş mod açık — başka bir mesaj göndermeden önce $duration bekle.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Yavaş mod sırasında doğrudan yükleme devre dışı bırakıldı.';

  @override
  String get shareMediaTitle => 'Şuraya gönder';

  @override
  String get shareMediaMessageHint => 'İsteğe bağlı bir mesaj ekleyin…';

  @override
  String get shareMediaSendButton => 'Gönder';

  @override
  String get shareMediaSuccessToast => 'Medya paylaşıldı';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return '$count hedefe paylaşıldı';
  }

  @override
  String get shareMediaFailedToast => 'Medya paylaşılamadı';

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
  String get chatMessageCopyEmbedText => 'Gömülü Metni Kopyala';

  @override
  String get chatMessageTranslate => 'Çevir';

  @override
  String chatMessageTranslatedFrom(String language) {
    return '$language dilinden çevrildi';
  }

  @override
  String get chatMessageSeeOriginal => 'Orijinalini gör';

  @override
  String get chatMessageSeeTranslation => 'Çeviriyi gör';

  @override
  String get chatMessageTranslating => 'Çevriliyor…';

  @override
  String get chatMessageTranslateFailed => 'Bu mesaj çevrilemedi.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Bu cihazda çeviri kullanılamıyor.';

  @override
  String get chatMessageSpeak => 'Mesajı seslendir';

  @override
  String get chatMessageStopSpeaking => 'Konuşmayı durdur';

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
  String get chatMessageOpenLink => 'Bağlantıyı aç';

  @override
  String get chatMessageCopyLink => 'Bağlantıyı kopyala';

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
  String get chatReactionAddFailed => 'Tepki eklenemedi';

  @override
  String get chatReactionRemoveFailed => 'Tepki kaldırılamadı';

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
  String iarReasonOtherDescription(String productName) {
    return 'Yalnızca $productName\'ın kurallarını açıkça ihlal ediyorsa ve yukarıdakilere uymuyorsa kullanın.';
  }

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
  String get chatMessageDeleteAttachment => 'Ek Sil';

  @override
  String get chatMessageEditAttachmentAltText => 'Alternatif Metni Düzenle';

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
      other: '$count engellenen ileti',
      one: '1 engellenen ileti',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count potansiyel spam mesajı',
      one: '1 potansiyel spam mesajı',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Orijinal yazar engellendiği için yanıt gizlendi.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Orijinal yazar spam gönderen olarak işaretlendiği için yanıt gizlendi.';

  @override
  String get devMarkAsSpamLocally => 'Yerel olarak spam olarak işaretle';

  @override
  String get devIgnoreSpamFlag => 'Spam işaretini yoksay';

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
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

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
  String get mediaViewerOptions => 'Medya seçenekleri';

  @override
  String get mediaViewerCopyLink => 'Bağlantıyı kopyala';

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
    return 'Ek $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Kapat';

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
  String get composerAutocompleteSuggestions => 'Öneriler';

  @override
  String get composerAutocompleteCommandsHeading => 'Komutlar';

  @override
  String get composerAutocompleteChoicesHeading => 'Seçenekler';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'İsteğe bağlı argümanlar';

  @override
  String get composerAutocompleteChannelsHeading => 'Kanallar';

  @override
  String get composerAutocompleteMembersHeading => 'Üyeler';

  @override
  String get composerAutocompleteUsersHeading => 'Kullanıcılar';

  @override
  String get composerAutocompleteMentionsHeading => 'Bahsetmeler';

  @override
  String get composerAutocompleteRolesHeading => 'Roller';

  @override
  String get composerAutocompleteMediaHeading => 'Medya';

  @override
  String get composerAutocompleteStickersHeading => 'Çıkartmalar';

  @override
  String get composerAutocompleteGifsHeading => 'GIF\'ler';

  @override
  String get composerAutocompleteNoGifs => 'GIF bulunamadı';

  @override
  String get composerCommandShrugDescription => 'Mesajınıza ¯\\_(ツ)_/¯ ekler.';

  @override
  String get composerCommandTableflipDescription =>
      'Mesajınıza (╯°□°)╯︵ ┻━┻ ekler.';

  @override
  String get composerCommandUnflipDescription =>
      'Mesajınıza ┬─┬ ノ( ゜-゜ノ) ekler.';

  @override
  String get composerCommandMeDescription =>
      'Bir eylem mesajı gönder (italik olarak gösterilir).';

  @override
  String get composerCommandSpoilerDescription =>
      'Spoiler mesajı gönder (spoiler etiketleriyle sarar).';

  @override
  String get composerCommandTtsDescription => 'Metin okuma mesajı gönder.';

  @override
  String get composerCommandNickDescription =>
      'Bu toplulukta takma adınızı değiştirin.';

  @override
  String get composerCommandKickDescription => 'Bu topluluktan bir üyeyi at.';

  @override
  String get composerCommandBanDescription =>
      'Bu topluluktan bir üyeyi yasakla.';

  @override
  String get composerCommandMsgDescription =>
      'Bir kullanıcıya doğrudan mesaj gönder.';

  @override
  String get composerCommandSavedDescription =>
      'Kaydedilmiş bir medya öğesi gönder.';

  @override
  String get composerCommandStickerDescription => 'Çıkartma gönder.';

  @override
  String get composerCommandGifDescription => 'GIF ara ve gönder.';

  @override
  String get composerCommandMemberOption => 'Hedef üye.';

  @override
  String get composerCommandReasonOption => 'Gerekçe (isteğe bağlı).';

  @override
  String get composerCommandMessageOption => 'Gönderilecek ileti.';

  @override
  String get composerCommandQueryOption => 'Ne arayacağınız.';

  @override
  String get composerCommandNicknameOption =>
      'Yeni takma adınız veya sıfırlamak için boş bırakın.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Üyenin son mesaj geçmişinden ne kadarının silineceği.';

  @override
  String get composerCommandDeleteMessagesNone => 'Hiçbirini silme';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return 'Önceki $count gün';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => 'Son 24 saat';

  @override
  String get composerCommandOptionRequired =>
      'Bu seçenek gerekli. Lütfen bir değer girin.';

  @override
  String get composerCommandClear => 'Komutu temizle';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Bu toplulukta görünen adınızı **$previousNickname** olarak değiştirdiniz. Yeni adınız: **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Bilinmeyen kullanıcı';

  @override
  String composerCommandMsgFailed(String username) {
    return '**$username**\'e mesaj gönderilemedi. DM\'leri devre dışı bırakmış veya sizi engellemiş olabilir.';
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
  String get addGuildImportDescription =>
      'Topluluğunuza yeni bir yapı aktarmak için bir Discord şablonu URL\'si yapıştırın.';

  @override
  String get addGuildImportUrlLabel => 'Şablon URL\'si';

  @override
  String get addGuildImportUrlInvalid =>
      'Geçerli bir Discord şablonu URL\'si veya kodu girin.';

  @override
  String get addGuildImportFetchFailed =>
      'Topluluk şablonu alınamadı. Şablon mevcut olmayabilir veya harici hizmet kullanılamıyor olabilir.';

  @override
  String get addGuildImportInvalidResponse =>
      'Bu geçerli bir şablon yanıtına benzemiyor.';

  @override
  String get addGuildImportTemplateLabel => 'Şablon';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount metin, $voiceChannelCount ses, $categoryCount kategori, $roleCount rol';
  }

  @override
  String get addGuildImportRemoveIcon => 'Simgeyi kaldır';

  @override
  String get addGuildImportTemplateInvalid =>
      'Topluluk şablonu verileri geçersiz veya bozuk.';

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
  String get channelDetailsFallbackTitle => 'Ayrıntılar';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Grup DM · $count üye';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return '$name ile konuşmanı kapat?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return '$name\'dan ayrıl?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Kanal ayarları';

  @override
  String get channelDetailsGroupSettingsTitle => 'Grup Ayarları';

  @override
  String get channelDetailsDmSettingsTitle => 'DM Ayarları';

  @override
  String get channelDetailsInvitePeople => 'İnsan Davet Et';

  @override
  String get channelDetailsCopyLink => 'Bağlantıyı kopyala';

  @override
  String get channelMenuCopyChannelLink => 'Kanal bağlantısını kopyala';

  @override
  String get channelMenuCopyRedirectLink => 'Yönlendirme bağlantısını kopyala';

  @override
  String get channelDetailsAddFriendsToGroup => 'Gruba arkadaş ekle';

  @override
  String get channelDetailsGroupInvites => 'Grup davetleri';

  @override
  String get channelDetailsEditChannel => 'Kanalı düzenle';

  @override
  String get channelDetailsDeleteChannel => 'Kanalı sil';

  @override
  String get channelSettingsCategorySettingsTitle => 'Kategori ayarları';

  @override
  String get channelSettingsEditCategory => 'Kategoriyi düzenle';

  @override
  String get channelSettingsTabOverview => 'Genel Bakış';

  @override
  String get channelSettingsTabPermissions => 'İzinler';

  @override
  String get channelSettingsTabInvites => 'Davetler';

  @override
  String get channelSettingsTabWebhooks => 'Webhook\'lar';

  @override
  String get channelSettingsDeleteChannel => 'Kanalı sil';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return '$channelName kanalını silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return '$categoryName silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Kategoriyi sil';

  @override
  String get channelSettingsChannelUpdated => 'Kanal güncellendi';

  @override
  String get channelSettingsChannelName => 'Kanal adı';

  @override
  String get channelSettingsCategoryName => 'Kategori adı';

  @override
  String get channelSettingsMyCategory => 'Kategorim';

  @override
  String get categoryExpandCategory => 'Kategoriyi genişlet';

  @override
  String get categoryCollapseCategory => 'Kategoriyi daralt';

  @override
  String get categoryExpandAllCategories => 'Tüm kategorileri genişlet';

  @override
  String get categoryCollapseAllCategories => 'Tüm kategorileri daralt';

  @override
  String get categoryMuteCategory => 'Kategoriyi sessize al';

  @override
  String get categoryUnmuteCategory => 'Kategorinin sesini aç';

  @override
  String get categoryCopyCategoryId => 'Kategori kimliğini kopyala';

  @override
  String get categoryIdCopied => 'Kategori kimliği kopyalandı';

  @override
  String get channelSettingsChannelNamePlaceholder => 'genel';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Konu';

  @override
  String get channelSettingsTopicPlaceholder => 'Bu kanala bir konu ekle';

  @override
  String get channelSettingsInsertEmoji => 'Emoji ekle';

  @override
  String get channelSettingsTopicTooLongTitle => 'Kanal konusu çok uzun.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Konuyu kısaltıp tekrar deneyin.';

  @override
  String get channelSettingsSlowmode => 'Yavaş mod';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Mesajlar arasında bekleme süresi. \"$bypassSlowmodePermissionLabel\" bunu geçersiz kılabilir.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Kapalı';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds saniye';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes dakika';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours saat';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute dakika';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour saat';
  }

  @override
  String get channelSettingsVoiceQuality => 'Ses kalitesi';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Daha yüksek bit hızı = daha iyi kalite ve daha yüksek bant genişliği kullanımı.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Katılımcı sınırı';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Aynı anda katılabilecek maksimum üye sayısı. 0 sınırsız anlamına gelir.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count katılımcı',
      one: '1 katılımcı',
      zero: '∞ Sınır yok',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Bağlantı sınırı';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Bu kanalda bir üyenin tutabileceği maksimum aktif bağlantı sayısı.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bağlantı',
      one: '1 bağlantı',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Ses bölgesi';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Bu kanal için bir ses bölgesi seçin. Otomatik, en yakın bölgeyi kullanır.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Otomatik';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Ses bölgeleri yüklenemedi';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Birazdan tekrar deneyin.';

  @override
  String get channelSettingsResetSlider =>
      'Kaydırıcıyı varsayılan değere sıfırla';

  @override
  String get channelSettingsAdvanced => 'Gelişmiş';

  @override
  String get channelSettingsMatureContentOverride =>
      'Yetişkin içeriği geçersiz kılma';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Bu kanal için $scopeLevel düzeyindeki ayarı geçersiz kıl. Olgun içerik, giriş yapmadan önce bir kapının arkasında gösterilir.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Devral';

  @override
  String get channelSettingsMatureContentOn => 'Açık';

  @override
  String get channelSettingsMatureContentOff => 'Kapalı';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Bu kanalı yetişkinlere yönelik içerik olarak işaretler.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Bu kanalı yetişkinlere yönelik içerikler için denetimsiz bırakın.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return '$inheritedSourceLabel\'dan devralındı: açık';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return '$inheritedSourceLabel\'den devralındı: kapalı';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'Kategori';

  @override
  String get channelSettingsMatureContentCommunitySource => 'topluluk';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategori';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Topluluk';

  @override
  String get channelSettingsContentWarningToggle =>
      'Bu kanalda içerik uyarısı göster';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Bu kanala girmeden önce bir onay istemi açar.';

  @override
  String get channelSettingsContentWarningText => 'Özel uyarı metni';

  @override
  String get channelSettingsContentWarningDefault =>
      'Bu hassas içerik barındırıyor.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Bu izinleri düzenlemek için \"$manageChannelsPermissionLabel\" iznine sahip olmanız gerekir.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Bu izinleri düzenlemek için \"$manageRolesPermissionLabel\" iznine sahip olmanız gerekir.';
  }

  @override
  String get channelSettingsUnknownRole => 'Bilinmeyen rol';

  @override
  String get channelSettingsUnknownUser => 'Bilinmeyen kullanıcı';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Erişim geçersiz kılmaları';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return '$name için erişimi düzenle';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Geçersiz kılmalara geri dön';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Bu kanal için temel erişimi yapılandırın';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Bu rol için geçersiz kılmaları yapılandırın';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Bu üye için geçersiz kılmaları yapılandırın';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'İzinleri ara…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Kanal erişimi güncellendi';

  @override
  String get channelSettingsPermissionsTitle => 'Erişim denetimi';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Bu kanal üst kategoriyle senkronize edildi ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Bu kanal üst kategoriyle senkronize değil ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Kategoriyle senkronize et';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kanal üst kategoriyle senkronize edildi';

  @override
  String get channelSettingsPermissionsAddOverride => 'Üye ekle';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Rol veya üye ara…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Roller ve üyeler';

  @override
  String get channelSettingsDeleteInvite => 'Daveti sil';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Bu daveti silmek istiyor musunuz? Geri alınamaz.';

  @override
  String get channelSettingsCopyInviteCode => 'Davet kodunu kopyala';

  @override
  String get channelSettingsCopyInviteUrl => 'Davet bağlantısını kopyala';

  @override
  String get channelSettingsWebhookCreated => 'Webhook oluşturuldu';

  @override
  String get channelSettingsWebhookCreateFailed => 'Webhook oluşturulamadı';

  @override
  String get channelSettingsCreateWebhook => 'Webhook oluştur';

  @override
  String get channelSettingsInvitesDescription =>
      'Bu kanal için davet bağlantılarını yönetin.';

  @override
  String get channelSettingsInvitesCreate => 'Davet oluştur';

  @override
  String get channelSettingsInvitesEmpty => 'Davet bağlantısı yok';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Bu kanalın henüz davet bağlantısı yok. Bu kanala kişi davet etmek için bir tane oluşturun.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Bu kanalın davet bağlantıları yüklenirken bir hata oluştu. Tekrar deneyin.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Bu kanala mesaj gönderebilecek gelen web kancalarını yönetin.';

  @override
  String get channelSettingsWebhooksEmpty => 'Web Kancası yok';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Bu kanal için yapılandırılmış web kancası yok. Harici uygulamaların mesaj göndermesine izin vermek için bir web kancası oluşturun.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Bu kanal web kancalarını desteklemiyor.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Bu kanalın webhook\'larını görüntülemek ve düzenlemek için \"$permission\" iznine sahip olmanız gerekir.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Webhook\'lar yüklenemedi';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Bu kanalın web kancaları yüklenirken bir hata oluştu. Lütfen tekrar deneyin.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return '$creator tarafından $date tarihinde oluşturuldu';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Bilinmeyen kullanıcı';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Görsel yükle';

  @override
  String get channelSettingsWebhooksRemove => 'Kaldır';

  @override
  String get channelSettingsWebhooksName => 'Ad';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Webhook adı';

  @override
  String get channelSettingsWebhooksChannel => 'Kanal';

  @override
  String get channelSettingsWebhooksUrl => 'Webhook URL\'si';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Webhook URL\'sini kopyala';

  @override
  String get channelSettingsWebhooksDelete => 'Webhook\'u sil';

  @override
  String get channelSettingsWebhooksDeleteFailed => 'Bu web kancası silinemedi';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Bu webhook\'u sil? Geri alınamaz.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Birazdan tekrar deneyin.';

  @override
  String get channelMenuOpenChat => 'Sohbeti aç';

  @override
  String get channelMenuDuplicateChannel => 'Kanalı çoğalt';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Yetişkin içeriği anlaşması durumunu sıfırla';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Bu kanaldaki mesajlarınızı silmek istiyor musunuz?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Bu işlem, bu kanalda gönderdiğiniz tüm mesajları kalıcı olarak siler. Bu işlem geri alınamaz.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Mesajlarımı Sil';

  @override
  String get channelMenuDeletedYourMessages => 'Mesajlarını sildin';

  @override
  String get channelMenuCouldNotDeleteYourMessages => 'Mesajlarınız silinemedi';

  @override
  String get channelDetailsSystemMessage => 'Sistem mesajı';

  @override
  String get channelDetailsTextChannel => 'Metin kanalı';

  @override
  String get channelDetailsVoiceChannel => 'Ses kanalı';

  @override
  String get channelDetailsCategory => 'Kategori';

  @override
  String get channelDetailsLinkChannel => 'Kanalı bağla';

  @override
  String get channelDetailsGenericChannel => 'Kanal';

  @override
  String get channelDetailsMutedConversation => 'Sohbet sessize alındı';

  @override
  String get channelDetailsUnmutedConversation => 'Sohbet sessizden çıkarıldı';

  @override
  String get channelDetailsMutedChannel => 'Kanal sessize alındı';

  @override
  String get channelDetailsUnmutedChannel => 'Kanalın sesi açıldı';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Bildirim ayarları güncellendi';

  @override
  String get channelDetailsTabMembers => 'Üyeler';

  @override
  String get channelDetailsTabPins => 'Sabitlenenler';

  @override
  String get channelDetailsActionMute => 'Sessize al';

  @override
  String get channelDetailsActionUnmute => 'Sesi aç';

  @override
  String get channelDetailsActionSearch => 'Ara';

  @override
  String get channelDetailsActionMore => 'Daha fazla';

  @override
  String get channelDetailsMembersEmptyTitle => 'Gösterilecek üye yok';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Üyeler, topluluk verileri yüklendikten sonra burada görünecektir.';

  @override
  String get memberListPermissionDeniedTitle => 'Üyeleri görüntüleyemezsiniz';

  @override
  String get memberListPermissionDeniedBody =>
      'Bu topluluktaki kanal üyelerini görüntüleyemezsiniz';

  @override
  String get memberListUnavailableTitle => 'Üye listesi kullanılamıyor';

  @override
  String get memberListUnavailableBody =>
      'Üye listeleri bu toplulukta geçici olarak kullanılamıyor';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Sabitlenen iletiler yüklenemedi';

  @override
  String get channelDetailsPinsGuildEndHint =>
      '\"Mesajları Sabitle\" iznine sahip üyeler, herkesin görebileceği mesajları sabitleyebilir.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Bu sohbetteki mesajları herkesin görebileceği şekilde sabitleyebilirsiniz.';

  @override
  String get channelDetailsPinsEndReached => 'Sonuna ulaştınız';

  @override
  String get channelHeaderOpenDetails => 'Kanal ayrıntılarını aç';

  @override
  String get channelHeaderPinnedMessages => 'Sabitlenmiş mesajlar';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Sabitlenmiş mesajlar, okunmamış';

  @override
  String get channelHeaderMemberList => 'Üye listesi';

  @override
  String get channelHeaderInbox => 'Gelen Kutusu';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Bildirim ayarları, sessizde';

  @override
  String get channelDetailsSearchTitle => 'Ara';

  @override
  String get channelDetailsSearchHint => 'Mesajlarda ara';

  @override
  String get channelDetailsSearchFilterFrom => 'Kimden';

  @override
  String get channelDetailsSearchFilterHas => 'Var';

  @override
  String get channelDetailsSearchFilterIn => 'İçinde';

  @override
  String get channelDetailsSearchFilterMentions => 'Bahsetmeler';

  @override
  String get channelDetailsSearchFilterMore => 'Daha fazla';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktif';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kanal';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count kullanıcı';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Kullanıcı';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Kanala göre filtrele';

  @override
  String get channelDetailsSearchChannelsHint => 'Kanallarda ara';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Kanal bulunamadı';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Sabitlenmiş';

  @override
  String get channelDetailsSearchPinnedTrue => 'Yalnızca sabitlenmiş';

  @override
  String get channelDetailsSearchPinnedFalse => 'Sabitlenmişleri hariç tut';

  @override
  String get channelDetailsSearchClearFilter => 'Temizle';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Yazar türü';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Tarih';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Tarih modu';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Tarih seçin';

  @override
  String get channelDetailsSearchMoreFiltersLink =>
      'Bağlantı ana bilgisayar adı';

  @override
  String get channelDetailsSearchMoreFiltersFileName =>
      'Dosya adı şunları içeriyor';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Dosya uzantısı';

  @override
  String get channelDetailsSearchContentPoll => 'Anket';

  @override
  String get channelDetailsSearchContentPollDescription => 'Anketli mesajlar';

  @override
  String get channelDetailsSearchContentForward => 'İlet';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'İletilen mesajlar';

  @override
  String get channelDetailsSearchFilterSort => 'Sırala';

  @override
  String get channelHeaderSearchFiltersTitle => 'Arama Filtreleri';

  @override
  String get channelHeaderSearchRecentTitle => 'Son Aramalar';

  @override
  String get channelHeaderSearchUsersTitle => 'Kullanıcılar';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kanallar';

  @override
  String get channelHeaderSearchValuesTitle => 'Değerler';

  @override
  String get channelHeaderSearchDatesTitle => 'Tarihler';

  @override
  String get channelHeaderSearchDefaultBadge => 'Varsayılan';

  @override
  String get channelHeaderSearchClearHistory => 'Temizle';

  @override
  String get channelHeaderSearchFilterDescFrom => 'bir kullanıcı';

  @override
  String get channelHeaderSearchFilterDescMentions => 'bir kullanıcı';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'bağlantı, yerleştirme, resim, video, ses, dosya, çıkartma, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'bir tarih veya tarih aralığı';

  @override
  String get channelHeaderSearchFilterDescOn => 'bir tarih veya tarih aralığı';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'bir tarih veya tarih aralığı';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'bir tarih veya tarih aralığı';

  @override
  String get channelHeaderSearchFilterDescIn => 'bir kanal';

  @override
  String get channelHeaderSearchFilterDescPinned => 'doğru veya yanlış';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'kullanıcı, bot veya webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'bir ana bilgisayar adı, örn. example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'ek dosya adının bir kısmı';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'bir dosya uzantısı, ör. png';

  @override
  String get channelHeaderSearchFilterDescSort =>
      'zaman damgası veya alaka düzeyi';

  @override
  String get channelHeaderSearchFilterDescOrder => 'artan veya azalan';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString Sonuç',
      one: '1 Sonuç',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Kullanıcıya göre filtrele';

  @override
  String get channelDetailsSearchFilterByContent => 'İçeriğe göre filtrele';

  @override
  String get channelDetailsSearchSortBy => 'Sonuçları sıralama ölçütü';

  @override
  String get channelDetailsSearchIn => 'Şurada Ara';

  @override
  String get channelDetailsSearchEmptyTitle => 'Bu konuşmada ara';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Mesajları bulmak için metin, yazar veya içerik filtresi girin.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Mesajlar indeksleniyor';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Bu kapsamın aranması tamamlandıktan kısa bir süre sonra tekrar deneyin.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Sonuç bulunamadı';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Farklı arama terimleri veya filtreler deneyin.';

  @override
  String get channelDetailsMembersOnline => 'Çevrimiçi';

  @override
  String get channelDetailsMembersOffline => 'Çevrimdışı';

  @override
  String get channelDetailsMemberYou => 'Sen';

  @override
  String get channelDetailsSearchUsersHint => 'Kullanıcı ara';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Üyeleri aramak için yazın';

  @override
  String get channelDetailsSearchUsersEmpty => 'Kullanıcı bulunamadı';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'Kullanıcı yok';

  @override
  String get channelDetailsDone => 'Bitti';

  @override
  String get channelDetailsHasFilterPrompt =>
      'Şunları içeren mesajları göster:';

  @override
  String get channelDetailsRetry => 'Yeniden dene';

  @override
  String get channelDetailsPinnedMessageTitle => 'Sabitlenmiş Mesaj';

  @override
  String get channelDetailsSearchResultTitle => 'Arama Sonucu';

  @override
  String get channelDetailsJumpToMessage => 'Mesaja Git';

  @override
  String get channelDetailsUnpinMessage => 'Mesajı sabitlemeyi kaldır';

  @override
  String get channelDetailsCopyMessageLink => 'Mesaj Bağlantısını Kopyala';

  @override
  String get channelDetailsCopyMessageId => 'Mesaj Kimliğini Kopyala';

  @override
  String get channelDetailsMessageUnpinned => 'Mesajın sabitlemesi kaldırıldı';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Mevcut Topluluk';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Mevcut DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Tüm Topluluklar';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Tüm DM\'ler Yalnızca';

  @override
  String get channelDetailsSearchScopeAllDms => 'Tüm DM\'ler';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Yalnızca Açık DM\'ler';

  @override
  String get channelDetailsSearchScopeOpenDms => 'DM\'leri aç';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Tüm DM\'ler + Topluluklar';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Açık DM\'ler + Topluluklar';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Yalnızca bu Toplulukta ara';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Yalnızca bu DM\'de ara';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Şu anda bulunduğun tüm Topluluklarda';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Yalnızca bulunduğun tüm DM\'lerde';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Katıldığınız tüm DM\'lerde';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Açık olan tüm DM\'lerinizde';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Açık olan tüm DM\'lerinde';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Tüm DM\'lerinde + şu anda bulunduğun tüm Topluluklarda';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Açık olan tüm DM\'leriniz + üye olduğunuz tüm Topluluklar';

  @override
  String get channelDetailsSearchSortNewest => 'Önce En Yeni';

  @override
  String get channelDetailsSearchSortOldest => 'En Eski Önce';

  @override
  String get channelDetailsSearchSortRelevance => 'En Son';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'En yeni mesajları önce göster';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Önce en eski mesajları göster';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'En alakalı mesajları önce göster';

  @override
  String get channelDetailsSearchContentImage => 'Resim Yükleme';

  @override
  String get channelDetailsSearchContentVideo => 'Video Yükleme';

  @override
  String get channelDetailsSearchContentAudio => 'Ses Yüklemesi';

  @override
  String get channelDetailsSearchContentFile => 'Dosya Yükleme';

  @override
  String get channelDetailsSearchContentLink => 'Bağlantı';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Bağlantı Önizlemesi veya Gömme';

  @override
  String get channelDetailsSearchContentSticker => 'Çıkartma';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Yalnızca yüklenen görsel dosyaları';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Yalnızca yüklenen video dosyaları';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Yalnızca yüklenen ses dosyaları';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Yüklenen herhangi bir ek';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Mesaj metninde yazılı URL';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Yüklemeler değil, çözümlenmiş önizlemeler ve zengin yerleştirmeler';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Mesaja çıkartma eklendi';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count tür';
  }

  @override
  String get personalNotesTitle => 'Kişisel notlar';

  @override
  String get personalNotesSubtitle =>
      'Düşünceleriniz ve hatırlatıcılarınız için özel alanınız';

  @override
  String groupDmWelcome(String displayName) {
    return '$displayName hoş geldin. Sohbeti başlatmak için arkadaşlarını ekle.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Grubu düzenle';

  @override
  String get groupDmWelcomeAddFriends => 'Gruba arkadaş ekle';

  @override
  String get dmGroupInvites => 'Davetler';

  @override
  String get groupDmEditTitle => 'Grubu düzenle';

  @override
  String get groupDmEditDetailsTooltip => 'Grup ayrıntılarını düzenle';

  @override
  String get groupDmGroupName => 'Grup adı';

  @override
  String get groupDmMyGroup => 'Grubum';

  @override
  String get groupDmGroupNameMaxLength => 'Grup adı 100 karakteri geçmemeli';

  @override
  String get groupDmGroupIcon => 'Grup simgesi';

  @override
  String get groupDmUploadIcon => 'Simge yükle';

  @override
  String get groupDmChangeIcon => 'Simgeyi değiştir';

  @override
  String get groupDmRemoveIcon => 'Simgeyi kaldır';

  @override
  String get groupDmUpdated => 'Grup güncellendi';

  @override
  String get groupDmUpdateFailed =>
      'Grup güncellenemedi. Lütfen tekrar deneyin.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Animasyonlu simgeler desteklenmez. Statik bir resim kullanın.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Hareketli simgeler desteklenmiyor';

  @override
  String get groupDmIconFileTooLargeTitle => 'Simge dosyası çok büyük';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'İkon dosyası çok büyük. $maxSize boyutundan daha küçük bir dosya seçin.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Desteklenmeyen simge biçimi';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Desteklenmeyen dosya türü.';

  @override
  String get groupDmCouldntProcessImage => 'Resim işlenemedi';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Kırpılan görsel işlenemedi. Tekrar deneyin.';

  @override
  String get groupDmInvalidImage => 'Geçersiz görsel';

  @override
  String get groupDmInvalidImageBody =>
      'Bu görsel geçersiz. Başka bir tane dene.';

  @override
  String get groupDmAddFriends => 'Ekle';

  @override
  String get groupDmOrSendInvite => 'veya bir arkadaşına davet gönder:';

  @override
  String get groupDmGenerateInviteLink => 'Davet bağlantısı oluştur';

  @override
  String get groupDmCreateInvite => 'Oluştur';

  @override
  String get groupDmInviteExpires24Hours =>
      'Davetiyeniz 24 saat içinde sona erecek';

  @override
  String get groupDmAddFriendFailed =>
      'Bu arkadaş grubu eklenemedi. Lütfen tekrar deneyin.';

  @override
  String get groupDmAddFailed => 'Gruba eklenemedi';

  @override
  String get groupDmGroupFull =>
      'Bu grup dolu. Daha fazla kişi eklemeden önce birini çıkarın.';

  @override
  String get groupDmRateLimited =>
      'Çok hızlı gidiyorsun. Biraz bekle ve tekrar dene.';

  @override
  String get groupDmCreateInviteFailed => 'Davet bağlantısı oluşturulamadı';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Davet bağlantısı oluşturulamadı. Lütfen tekrar deneyin.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Davet bağlantısı oluşturulamadı. Lütfen tekrar deneyin.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Bu kanalda davet oluşturma iznin yok.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Bu topluluk davet sınırına ulaştı.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Bu topluluk için davet oluşturma geçici olarak devre dışı bırakıldı.';

  @override
  String get groupDmCopyInviteFailed => 'Davet bağlantısı kopyalanamadı';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Yalnızca grup sahibi davetleri yönetebilir.';

  @override
  String get groupDmNoInvitesCreated => 'Henüz davetiye oluşturulmadı';

  @override
  String get groupDmLoadingInvites => 'Davetler yükleniyor...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Davetler yüklenemedi. Tekrar deneyin.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Bu daveti iptal edilsin mi? Geri alınamaz.';

  @override
  String get groupDmInviteRevoked => 'Davet iptal edildi';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return '$name tarafından oluşturuldu. $time sonra sona eriyor.';
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
  String get composerOpenExpressionPicker => 'İfade seçiciyi aç';

  @override
  String get composerShowKeyboard => 'Klavyeyi göster';

  @override
  String get composerCloseAttachmentPanel => 'Ekleri kapat';

  @override
  String get chatAttachmentPanelPhotos => 'Fotoğraflar';

  @override
  String get chatAttachmentPanelFiles => 'Dosyalar';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Fotoğraf kitaplığına erişim gerekiyor';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Son fotoğrafları ve videoları göz atmak ve eklemek için fotoğraf kitaplığına erişime izin ver.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Ayarları aç';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', gönderiliyor';

  @override
  String get messageAccessibilityFailedSuffix => 'gönderilemedi';

  @override
  String get messageAccessibilityAttachmentSummary => 'bir ek';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count ek';
  }

  @override
  String get messageAccessibilityImageSummary => 'bir resim';

  @override
  String get messageAccessibilityVideoSummary => 'bir video';

  @override
  String get messageAccessibilityAudioSummary => 'ses dosyası';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return '$name çıkartması';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'dosya $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => 'gizlenmiş bir ek';

  @override
  String get messageAccessibilityEmbedSummary => 'gömülü içerik';

  @override
  String get messageAccessibilityEmptySummary => 'bir mesaj';

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
  String get userSettingsSearchPlaceholder => 'Ayarlar arasında ara...';

  @override
  String get userSettingsSearchFieldLabel => 'Ayarları ara';

  @override
  String get userSettingsSearchClear => 'Aramayı temizle';

  @override
  String get userSettingsSearchNoResults => 'Ayarlar bulunamadı';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Güvenlik ve Giriş';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Hediyeler';

  @override
  String get giftSettingsClaimAccountTitle => 'Hesabını sahiplen';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Plutonium hediye kodlarını kullanmak veya yönetmek için hesabını doğrula.';

  @override
  String get giftSettingsRedeemTitle => 'Hediye kullan';

  @override
  String get giftSettingsRedeemDescription =>
      'Hesabınız için Plutonium\'u kullanmak üzere bir hediye kodu girin.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Hediye kodunu girin…';

  @override
  String get giftSettingsRedeemButton => 'Kullan';

  @override
  String get giftSettingsRedeemSuccess =>
      'Plutonium\'unuzu keyifle kullanın. Hediye başarıyla kullanıldı.';

  @override
  String get giftSettingsPurchasedTitle => 'Satın alınan hediyeler';

  @override
  String get giftSettingsPurchasedDescription =>
      'Satın aldığınız Plutonium hediye kodlarını yönetin. Hediye URL\'sini özel biriyle paylaşın veya kendiniz kullanın!';

  @override
  String get giftSettingsEmptyTitle => 'Henüz hediye yok';

  @override
  String get giftSettingsEmptyDescription =>
      'Arkadaşlarınla paylaşmak için Plutonium sekmesinden bir Plutonium hediyesi satın al.';

  @override
  String get giftSettingsGoToPlutonium => 'Plutonium\'a git';

  @override
  String get giftSettingsLoadFailedTitle => 'Hediye envanteri yüklenemedi';

  @override
  String get giftSettingsLoadFailedDescription => 'Daha sonra tekrar deneyin.';

  @override
  String get giftSettingsTryAgain => 'Tekrar dene';

  @override
  String get giftSettingsGiftUrl => 'Hediye URL\'si';

  @override
  String get giftSettingsCopy => 'Kopyala';

  @override
  String get giftSettingsCopied => 'Kopyalandı';

  @override
  String get giftSettingsGiftUrlCopied => 'Hediye URL\'si panoya kopyalandı!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Hediye URL\'si kopyalanamadı';

  @override
  String giftSettingsPurchasedDate(String date) {
    return '$date tarihinde satın alındı';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return '$date tarihinde kullanıldı';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return '$name tarafından kullanıldı';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Bu hediye kullanıldı';

  @override
  String get giftSettingsRedeemForYourself => 'Kendin için kullan';

  @override
  String get giftSettingsShareWithFriend => 'Bir arkadaşınla paylaş';

  @override
  String get premiumPlutoniumTagline =>
      'Bağımsız bir iletişim platformunu desteklerken daha yüksek limitlerin ve ayrıcalıklı özelliklerin kilidini açın.';

  @override
  String get premiumPurchaseMode => 'Satın alma modu';

  @override
  String get premiumForMe => 'Bana özel';

  @override
  String get premiumAsAGift => 'Hediye olarak';

  @override
  String get premiumMonthly => 'Aylık';

  @override
  String get premiumYearly => 'Yıllık';

  @override
  String get premiumPerMonth => 'aylık';

  @override
  String get premiumPerYear => 'yıllık';

  @override
  String get premiumOneTimePurchase => 'tek seferlik satın alma';

  @override
  String get premiumSave17 => '%17 tasarruf edin';

  @override
  String get premiumUpgradeNow => 'Şimdi yükselt';

  @override
  String get premiumBuyGift => 'Hediye al';

  @override
  String get premiumOneYearGift => '1 yıllık hediye';

  @override
  String get premiumOneMonthGift => '1 aylık hediye';

  @override
  String get premiumMostPopular => 'En popüler';

  @override
  String get premiumScrollPrompt =>
      'Plutonium\'un sunduğu tüm avantajları görmek için aşağı kaydırın';

  @override
  String get premiumFreeVsPlutonium => 'Ücretsiz ve Plutonium';

  @override
  String get premiumFreeColumn => 'Ücretsiz';

  @override
  String get premiumGiftSectionTitle => 'Plutonium Hediye Et';

  @override
  String get premiumGiftSectionDescription =>
      'Arkadaşlarınızla Plutonium deneyimini hediye abonelik satın alarak paylaşın.';

  @override
  String get premiumGiftBannerOne => 'Yeni bir hediye kodun seni bekliyor!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Size özel $count yeni hediye kodu bekliyor!';
  }

  @override
  String get premiumViewGifts => 'Hediyeleri görüntüle';

  @override
  String get premiumReadyToUpgrade => 'Yükseltmeye hazır mısın?';

  @override
  String get premiumReadyToBuyGift => 'Hediye almaya hazır mısın?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Aylık $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Yıllık $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 yıl $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 ay $price';
  }

  @override
  String get premiumManageSubscription => 'Aboneliği yönet';

  @override
  String get premiumRedeemGiftCode => 'Hediye kodunu kullan';

  @override
  String get premiumGiftBadge => 'Hediye';

  @override
  String get premiumCancelSubscriptionTitle => 'Aboneliği iptal et?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Ayrıcalıklarınız bir sonraki yenileme tarihinize kadar devam eder, ardından yeniden abone olmak ve abone geçmişinizi korumak için 3 günlük bir ödemesiz süreniz olur.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Aboneliği iptal et';

  @override
  String get premiumKeepSubscription => 'Aboneliği sürdür';

  @override
  String get premiumPurchaseHistoryTitle => 'Satın alma geçmişi';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Son faturalarınız. Aboneliğinizin ödeme yöntemini değiştirmek için fatura portalına bir tane ekleyin veya seçin ve varsayılan yapın.';

  @override
  String get premiumManagePaymentMethods => 'Ödeme yöntemlerini yönet';

  @override
  String get premiumBillingHistory => 'Fatura geçmişi';

  @override
  String get premiumSelfServeRefundTitle => 'Kendi kendine iade';

  @override
  String get premiumSelfServeRefundButton => 'Son satın almayı iade et';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Satın alarak şunları kabul etmiş olursunuz ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Satın alarak şunları kabul etmiş olursunuz ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' ve ';

  @override
  String premiumActiveUntil(String date) {
    return '$date tarihine kadar aktif';
  }

  @override
  String get premiumSubscriptionCanceling => 'İptal ediliyor';

  @override
  String premiumCancelsOn(String date) {
    return '$date tarihinde iptal edilir. Ayrıcalıklar o tarihe kadar aktif kalır.';
  }

  @override
  String get premiumReactivateSubscription => 'Yeniden etkinleştir';

  @override
  String premiumGiftedUntil(String date) {
    return '$date tarihine kadar hediye edildi. Otomatik olarak yenilenmez.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Özellik';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Satın alarak $terms ve $privacy kabul etmiş olursunuz.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Ödemeden sonraki 3 gün içinde, 30 günde bir kendi kendine iade yapılabilir. Aboneliği iade etmek, aboneliği iptal eder. AB/AEA alıcıları, içeriğe anında erişmek için ödeme sırasında 14 günlük cayma hakkından feragat eder. Geri ödeme yerine uygulama içi iade düğmesini kullanın. Geri ödemeler hesabınızı kalıcı olarak kısıtlayabilir. Stripe ödemeyi güvenli bir şekilde işler. Tam kart numaranızı asla görmeyiz.';

  @override
  String get premiumTermsOfService => 'Hizmet şartları';

  @override
  String get premiumPrivacyPolicy => 'Gizlilik politikası';

  @override
  String get premiumCheckoutStartFailedTitle => 'Ödeme başlatılamadı';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Ödeme başlatılırken bir sorun oluştu. Lütfen bir süre sonra tekrar deneyin.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Şu anda hediye aboneliğindesiniz. Otomatik olarak yenilenmeyecektir. Süreyi uzatmak için daha fazla hediye kodu kullanabilirsiniz. Hediye süreniz bittikten sonra yinelenen abonelikler başlatılabilir.';

  @override
  String get premiumPlanUnavailable =>
      'Bu plan kullanılamıyor. Destek ile iletişime geçin.';

  @override
  String get premiumCompletePaymentTitle => 'Ödemeyi tamamla';

  @override
  String get premiumCompletePaymentBody =>
      'Ödemeyi tamamlamak için şimdi Stripe\'a yönlendiriliyorsunuz. Tamamladıktan sonra Fluxer\'a geri dönün.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Ödeme yöntemi seçin';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Otomatik Pix ile Brezilya bankanızdan doğrudan yinelenen ödemeleri yetkilendirin. Veya bir sonraki ekranda Stripe\'a kredi kartı bilgilerinizi girmek için kart kullanmayı seçin.';

  @override
  String get premiumUsePix => 'Pix\'i kullan';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Hindistan bankanızdan RBI uyumlu bir e-talimat ayarlamak için UPI ile ödeme yapın. Veya bir sonraki ekranda Stripe\'a kredi kartı bilgilerinizi girmek için kartı kullanmayı seçin.';

  @override
  String get premiumUseUpi => 'UPI ile ödeme yap';

  @override
  String get premiumUseCard => 'Kart kullan';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Faturalandırma portalı açılamadı';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Fatura portalı açılırken bir sorun oluştu. Lütfen bir süre sonra tekrar deneyin.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Zaten Visionary\'sin';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary zaten kalıcı erişim içeriyor, bu yüzden yinelenen bir aboneliğe gerek yok. Başkalarına yine de hediye alabilirsin.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonelik zaten mevcut';

  @override
  String get premiumExistingSubscriptionBody =>
      'Bu hesap için mevcut bir Fluxer Plutonium aboneliği bulduk. Ödeme ayrıntılarını güncellemek veya yenileme durumunu kontrol etmek için güvenli faturalandırma portalında yönetin. Az önce ödeme yaptıysanız, bir dakika bekleyip bu sayfayı yeniden açın.';

  @override
  String get premiumPurchasesDisabledTitle => 'Satın alımlar kullanılamıyor';

  @override
  String get premiumPurchasesDisabledBody =>
      'Bu hesap için satın alımlar devre dışı bırakıldı. Yanlış görünüyorsa support@fluxer.app ile iletişime geçin.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Fluxer Plutonium satın almak için hesabını talep et.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Fluxer Plutonium satın almadan önce e-postanı doğrulaman gerekiyor.';

  @override
  String get premiumPerkCustomUsernameTag => 'Özel kullanıcı adı etiketi';

  @override
  String get premiumPerkPerCommunityProfiles => 'Topluluk başına profiller';

  @override
  String get premiumPerkMessageScheduling => 'Mesaj zamanlama';

  @override
  String get premiumPerkProfileBadge => 'Profil rozeti';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Özel video arka planları';

  @override
  String get premiumPerkEntranceSounds => 'Giriş sesleri';

  @override
  String get premiumPerkCommunities => 'Topluluklar';

  @override
  String get premiumPerkMessageCharacterLimit => 'Mesaj karakter sınırı';

  @override
  String get premiumPerkBookmarkedMessages => 'Yer işaretli mesajlar';

  @override
  String get premiumPerkFileUploadSize => 'Dosya yükleme boyutu';

  @override
  String get premiumPerkEmojiStickerPacks => 'Emoji ve çıkartma paketleri';

  @override
  String get premiumPerkSavedMedia => 'Kaydedilen medya';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Hareketli emojileri kullanın';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Küresel emoji ve çıkartma erişimi';

  @override
  String get premiumPerkVideoQuality => 'Video kalitesi';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Hareketli avatarlar ve profil başlıkları';

  @override
  String get premiumPerkEarlyAccess => 'Yeni özelliklere erken erişim';

  @override
  String get premiumPerkCustomThemes => 'Özel temalar';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => '4K/60fps\'e kadar';

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
  String get userSettingsNavShortcuts => 'Kısayollar';

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
  String get audioAndVideoDefaultDeviceLabel => 'Varsayılan';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Hoparlörü kullan';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Kapalıyken ses, ahizeden veya bağlı kulaklıktan çalınır.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Giriş sesi düzeyi';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Çıkış sesi düzeyi';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Ses işleme';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Odaklanmış ses';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Önerilen. Mikrofonunuzu temizleyerek net konuşma sağlar.';

  @override
  String get audioAndVideoDirectInputLabel => 'Doğrudan giriş';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Sesinizi olduğu gibi gönderir. Harici ses yazılımı kullanıyorsanız en iyisidir.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Özel';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Gürültü engelleme, yankı giderme ve kazanç ayarlarını kendiniz yapın.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Gürültü engelleme';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Gelişmiş';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standart';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Yok';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Yankı engelleme';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Otomatik kazanç kontrolü';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Mikrofon sesini dengeler. Gelişmiş bastırma açıkken kapalıdır.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Mikrofon testi';

  @override
  String get audioAndVideoMicTestStartLabel => 'Mikrofon testini başlat';

  @override
  String get audioAndVideoMicTestStopLabel => 'Mikrofon testini durdur';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName mikrofon erişimine ihtiyaç duyuyor.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Kamerayı yansıt';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kamera kalitesi';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Ekran paylaşım kalitesi';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Kare hızı';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p ve 60 FPS için $premiumProductName gerekir.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Bu örneklem şu anda ekran paylaşımını 30 FPS\'de 720p\'ye kadar desteklemektedir.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return 'Cihazlarınızı listelemek için $productName uygulamasının mikrofon erişimine ihtiyacı var.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName cihazlarınızı listelemek için kamera erişimine ihtiyaç duyar.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Kameramı gizlerken sorma';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Ekran paylaşımımı gizlerken sorma';

  @override
  String get userSettingsNavNotifications => 'Bildirimler';

  @override
  String get notificationsGeneralSectionTitle => 'Genel';

  @override
  String get notificationsEnableNotificationsLabel =>
      'Bildirimleri etkinleştir';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Mesaj aldığınızda bildirim alın. Cihaz ayarlarınızda $productName için bildirimlere izin vermeniz gerekebilir. Kanal/topluluk bazında kontroller için bir topluluğun menüsünden bildirim ayarlarını açın.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Masaüstü bildirimlerini etkinleştir';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'İşletim sistemi bildirim merkezini kullanır. Kanal/topluluk bazında denetimler için bir topluluk simgesine sağ tıklayın ve bildirim ayarlarını açın.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Tarayıcı bildirimlerini etkinleştir';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Mesaj aldığınızda bildirim alın. Tarayıcı ayarlarınızda bildirimlere izin vermeniz gerekebilir. Kanal/topluluk bazında kontrol için bir topluluk simgesine sağ tıklayın ve bildirim ayarlarını açın.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Anlık bildirim etkin değil zaman aşımı';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName, bilgisayarınızdayken mobil cihazlarınıza bildirim göndermeyi engeller. Masaüstünde ne kadar süre hareketsiz kalmanız gerektiğine karar verin, ardından mobil bildirimleri almaya başlayın.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute dakika';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes dakika';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Bahsetme tercihi';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Yanıt bahsetme tercihi';

  @override
  String get notificationsMentionNoPreferenceName => 'Tercih yok';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Gönderenin amacına saygı duyulur, @ bahsetme özelliğini açtıklarında uyarı gösterilmez';

  @override
  String get notificationsMentionPreferMentionName => '@bahsetmeyi tercih et';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Varsayılan olarak size @bahsedilmesine izin verilir ve bu ayarı kapatırlarsa gönderen uyarılır';

  @override
  String get notificationsMentionPreferNoMentionName =>
      '@bahsedilmemeyi tercih et';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Varsayılan olarak @bahsetmeyi yanıtlardan çıkarır ve göndereni etkinleştirmesi halinde uyarır';

  @override
  String get notificationsTtsSectionTitle => 'Metinden konuşmaya bildirimleri';

  @override
  String get notificationsTtsEnableCommandLabel =>
      '/tts konuşma oynatmayı etkinleştir';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '/tts mesajınızı sesli okusun. Bu ayarı devre dışı bırakmak, bu komutları normal metin olarak tutar.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Oynatma hızını şuradan ayarla ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Erişilebilirlik';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle =>
      'Otomatik mesaj seslendirmesi';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      '/tts komutuyla gelip gelmediğine bakılmaksızın gelen içeriği konuşmaya dönüştürür.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Tüm kanallar';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Hangi kanal açık olursa olsun, gelen her mesaj sesli okunsun.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Yalnızca aktif kanal';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Yalnızca görüntülediğiniz kanalı anlatır. Anlatım kanallar arasında sizi takip eder.';

  @override
  String get notificationsTtsModeNeverName => 'Asla otomatik olarak';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Birisi /tts komutunu manuel olarak çalıştırmadıkça sessiz kal.';

  @override
  String get notificationsTtsModeAriaLabel => 'Tüm mesajları sesli oku';

  @override
  String get notificationsSoundsSectionTitle => 'Sesler';

  @override
  String get notificationsMasterVolumeLabel => 'Ana ses düzeyi';

  @override
  String get notificationsMasterVolumeDescription =>
      'Tüm ses efektlerinin düzeyini ayarlar. Sese özel geçersiz kılmalar bunu yok sayar.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Varsayılan ses düzeyine sıfırla';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Tüm bildirim seslerini kapat';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Mevcut bildirim sesi ayarlarınız korunacaktır.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Daha fazla ses efekti göster';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Daha az yaygın ses efektlerini gizle';

  @override
  String get notificationsPreviewSound => 'Sesi önizle';

  @override
  String get notificationsPerSoundVolumeTitle => 'Sese özel ses düzeyi';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Bireysel sesler için özel ses düzeyleri ayarlayın. Geçersiz kılma yapılmayan sesler ana ses düzeyini takip eder.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Etkin özel ses yüksekliği ayarları: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Ana ayarı takip ediyor • %$effectiveValue';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return '$label sesini ana ses düzeyine sıfırla';
  }

  @override
  String get notificationsResetAllOverrides => 'Tüm geçersiz kılmaları sıfırla';

  @override
  String notificationsMuteSound(String label) {
    return '$label\'ı sustur';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '$label\'ın sesini aç';
  }

  @override
  String get notificationsSoundMessage => 'Topluluk mesajı bildirimleri';

  @override
  String get notificationsSoundDirectMessage => 'Direkt mesaj bildirimleri';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Geçerli kanal mesaj bildirimleri';

  @override
  String get notificationsSoundMute => 'Sesli bildirimleri kapat';

  @override
  String get notificationsSoundUnmute => 'Sesli sessizliği aç';

  @override
  String get notificationsSoundDeaf => 'Ses kapatma';

  @override
  String get notificationsSoundUndeaf => 'Sesli sohbetin sesi açıldı';

  @override
  String get notificationsSoundUserJoin => 'Kullanıcı kanala katıldı';

  @override
  String get notificationsSoundUserLeave => 'Kullanıcı kanaldan ayrıldı';

  @override
  String get notificationsSoundUserMove => 'Kullanıcı kanalı taşıdı';

  @override
  String get notificationsSoundViewerJoin => 'İzleyici yayına katıldı';

  @override
  String get notificationsSoundViewerLeave => 'İzleyici yayından ayrıldı';

  @override
  String get notificationsSoundVoiceDisconnect => 'Ses bağlantısı kesildi';

  @override
  String get notificationsSoundIncomingRing => 'Gelen arama';

  @override
  String get notificationsSoundCameraOn => 'Kamera açık';

  @override
  String get notificationsSoundCameraOff => 'Kamera kapalı';

  @override
  String get notificationsSoundScreenShareStart => 'Ekran paylaşımı başlatıldı';

  @override
  String get notificationsSoundScreenShareStop => 'Ekran paylaşımı durduruldu';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Push bildirim zaman aşımı güncellenemedi. Tekrar deneyin.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Bahsetme tercihi güncellenemedi. Tekrar deneyin.';

  @override
  String get notificationsPermissionDeniedTitle => 'Bildirimler engellendi';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Bildirimler etkinleştirilemedi. Devam etmek için bildirim iznine izin verin.';

  @override
  String get userSettingsNavLanguageAndTime => 'Dil ve Saat';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Arayüz dili';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Uygulama genelinde kullanılacak dili seçin';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Dil ayarlarını aç';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Saat biçimi';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Uygulama genelinde saatlerin nasıl görüntüleneceğini seçin';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Saat biçimi seçimi';

  @override
  String get languageAndTimeTimeFormatAuto => 'Otomatik';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 saat';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 saat';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Uygulama dili: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Sistem yerel ayarı: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Saat biçimi için sistem yerel ayarını kullan';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Saat biçimi güncellenemedi';

  @override
  String get userSettingsNavDefaultApps => 'Varsayılan Uygulamalar';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Web Tarayıcısı';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Bir bağlantıya dokunduğunuzda hangi tarayıcının açılacağını seçin.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Bir site için bir uygulama yüklüyse, bağlantılar önce o uygulamada açılır.';

  @override
  String get defaultAppsWebBrowserInApp => 'Uygulama içi tarayıcı';

  @override
  String get defaultAppsWebBrowserExternal => 'Harici tarayıcı';

  @override
  String get userSettingsNavAdvanced => 'Gelişmiş';

  @override
  String get advancedPerformanceReportingTitle => 'Performans raporlaması';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Anonim çökme ve performans verilerini paylaşarak $productName\'ı geliştirmeye yardımcı olun.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Çökme ve performans raporları gönder';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Raporlanan tüm veriler anonimdir ve yalnızca $productName\'ın kendi izleme hizmetine gönderilir — üçüncü taraf sağlayıcı kullanılmaz.';
  }

  @override
  String get advancedSettingsConfigure => 'Yapılandır';

  @override
  String get advancedSettingsCategoryPrivacy => 'Gizlilik';

  @override
  String get advancedSettingsCategoryAppearance => 'Görünüm';

  @override
  String get advancedSettingsCategoryAccessibility => 'Erişilebilirlik';

  @override
  String get advancedSettingsCategoryChat => 'Sohbet';

  @override
  String get advancedSettingsCategoryMedia => 'Medya';

  @override
  String get advancedSettingsCategoryVoice => 'Sesli';

  @override
  String get advancedSettingsCategoryDeveloper => 'Geliştirici';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Metin seçimini etkinleştir';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Uygulamada metin seçimine izin ver';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Video önizleme küçük resimlerini etkinleştir';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Video oynatılırken küçük resim veya canlı kare göster';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Dokunsal geri bildirim';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Dokunma ve eylemler için titreşim geri bildirimi. Cihazlar arasında eşitlenmez.';

  @override
  String get advancedSettingShowNekoLabel => 'Neko\'yu göster';

  @override
  String get advancedSettingShowNekoDescription =>
      'İmlecini takip eden Neko kedi';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Sohbet girişinde Neko\'yu göster';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Sıçrama yakınlaştırma animasyonu';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Splash ekranından çıkarken logoyu küçült';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Klavye ipuçları';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Klavye kısayolu ipuçları (araç ipuçlarında)';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Favorileri etkinleştir';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Uygulama genelinde favorileri göster';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Sesli kanala katılma davranışı';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Topluluk sesli sohbetlerine katılmak için onay veya çift tıklama';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Ses kanallarına katılmak için çift tıklama gerektir';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Sesli kanallara katılmadan önce onayla';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Seçildiğinde GIF\'leri otomatik gönder';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Seçiciden GIF\'leri otomatik olarak onaysız gönder';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'GIF favorilerini kaydedilen medya olarak kaydet';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Yıldızlı GIF favorilerinin nasıl depolanacağını seçin';

  @override
  String get advancedSettingMediaButtonsLabel => 'Medya düğmeleri';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Medya eklerine ve gömülü içeriklere hangi düğmelerin ve göstergelerin ekleneceğini özelleştirin';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Gönderimden önce ekler yükleyin';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Mesaj girişine eklenen dosyalar yüklemeye hemen başlar';

  @override
  String get advancedSettingStripTrackingLabel =>
      'URL\'lerden izleme parametrelerini kaldır';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Gönderdiğiniz mesajlardaki URL\'lerden izleme parametrelerini otomatik olarak kaldırın';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Tüm harici bağlantılara güven';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Tüm alan adları için harici bağlantı uyarısını atla';

  @override
  String get advancedSettingSearchEnginesLabel => 'Arama motorları';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Seçili metinden kullanılacak arama motorlarını yapılandırın';

  @override
  String get advancedSettingTranslatorsLabel => 'Çevirmenler';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Seçilen metinden kullanılan çeviri sağlayıcılarını yapılandırın';

  @override
  String get advancedSettingReverseImageSearchLabel => 'Görselle arama';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Tersine görsel arama sağlayıcıları';

  @override
  String get advancedSettingMessageActionBarLabel => 'Mesaj işlem çubuğu';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Mesajların üzerine gelindiğinde görünen işlem çubuğunu özelleştirin';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'İfade otomatik tamamlama';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Mesaj giriş alanında iki nokta üst üste yazdığınızda neyin görünmesini istediğinizi seçin';

  @override
  String get advancedSettingInputButtonsLabel => 'Mesaj giriş düğmeleri';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Mesaj girişinde hangi düğmelerin gösterileceğini seçin';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Mesaj gönderirken en alta kaydır';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Bir mesaj gönderdikten sonra sohbetin nasıl ilerleyeceğini seçin';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      '\"Tümünü okundu olarak işaretle\" onayını atla';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Tüm okunmamış gelen kutusu kanallarını onay sormadan hemen okundu olarak işaretle';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Sessize alınmış kanalları varsayılan olarak gizle';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Susturduğunuz kanalları topluluk kenar çubuklarından gizleyin';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'GIF göstergesini göster';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Ek süresi dolma göstergesini göster';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Silme düğmesini göster';

  @override
  String get advancedSettingShowMediaDownloadLabel =>
      'İndirme düğmesini göster';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Favori düğmesini göster';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Gömülü içerik gizleme düğmesini göster';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Mesaj işlem çubuğunu göster';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Sadece daha fazla göster düğmesini göster';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Hızlı tepkileri göster';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Genişletmek için Shift\'e basın';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'İfade otomatik tamamlama özelliğinde varsayılan emojileri göster';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'İfade otomatik tamamlama özelliğinde özel emojileri göster';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'İfade otomatik tamamlama özelliğinde çıkartmaları göster';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Kaydedilen medyayı ifade otomatik tamamlamada göster';

  @override
  String get advancedSettingShowGifsButtonLabel => 'GIF düğmesini göster';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Medya düğmesini göster';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Çıkartma düğmesini göster';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Emoji düğmesini göster';

  @override
  String get advancedSettingShowSendButtonLabel => 'Gönder düğmesini göster';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Yeni cihaz uyarılarını göster';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Yeni ses cihazları için istem';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Bağlantı ses seviyesi denetimleri';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Ses menülerinde cihaza özel katılımcı ses seviyesi kaydırıcılarını göster';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Ekran paylaşımı önizleme davranışı';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Önizleme, açılır pencere ve akış küçük resim davranışı';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Ekran paylaşımı kodeği';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Ekran paylaşımı için video kodeği';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Otomatik (önerilen)';

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
      'Arka planda ekran paylaşımı önizlememi duraklat';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Yayın önizleme küçük resmimi gizle';

  @override
  String get advancedSettingDeveloperModeLabel =>
      'Geliştirici modunu etkinleştir';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Geliştirici modunu etkinleştir';

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
  String get advancedSettingTranslatorGoogle => 'Google Çeviri';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Varsayılan arama motoru';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Seçili metni ararken varsayılan olarak hangi arama motorunun kullanılacağını seçin.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Yerleşik arama motorları';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Yerleşik arama motorlarını etkinleştirin veya devre dışı bırakın. Etkin motorlar, metin seçildiğinde mesaj bağlam menüsünde görünür.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Özel arama motorları';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Özel URL deseniyle kendi arama motorlarınızı ekleyin. Arama metni için yer tutucu olarak \'$query\' kullanın.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Arama motoru ekle';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Aşağıdan en az bir arama motorunu etkinleştirin.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Arama motorunu kaldır';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Varsayılan çevirmen';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Seçili metni çevirirken varsayılan olarak hangi çevirmenin kullanılacağını seçin.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Yerleşik çeviriciler';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Yerleşik çeviricileri etkinleştirin veya devre dışı bırakın. Etkinleştirilen çeviriciler, metin seçildiğinde mesaj bağlam menüsünde görünür.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Özel çevirmenler';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Kendi çevirmenlerinizi özel bir URL deseniyle ekleyin. Çevrilecek metin için yer tutucu olarak \'$query\' kullanın.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Çevirmen ekle';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Aşağıdan en az bir çevirmen etkinleştirin.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Çevirmeni kaldır';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Varsayılan görselle arama';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Bir görseli ararken hangi ters görsel arama hizmetinin varsayılan olarak kullanılacağını seçin.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Yerleşik ters görsel arama';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Yerleşik tersine görsel arama sağlayıcılarını etkinleştirin veya devre dışı bırakın. Etkinleştirilen sağlayıcılar, görsellerin, avatarların, başlıkların, çıkartmaların ve emojilerin bağlam menüsünde görünür.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Özel görselle ters arama';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Özel bir URL deseniyle kendi ters görsel arama sağlayıcılarınızı ekleyin. Görsel URL\'si için yer tutucu olarak \'$url\' kullanın.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Ters görsel arama ekle';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Aşağıdan en az bir ters görsel arama sağlayıcısını etkinleştirin.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Görselle tersine aramayı kaldır';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Arama motoru ekle';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Arama motorunu düzenle';

  @override
  String get advancedSettingAddTranslatorTitle => 'Çeviri sağlayıcısı ekle';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Çeviri sağlayıcısını düzenle';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Ters görsel arama motoru ekle';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Görsel arama motorunu düzenle';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Ad';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'URL deseni';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Arama motorum';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Çevirmenim';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Görselle aramam';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return '\'$query\' yerine arama metnini girin.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return '\'$query\' olarak kullanılır';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Görsel URL\'sinin eklenmesi gereken yere \'$url\' ifadesini kullanın.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Ad gerekli.';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'URL deseni gerekli.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'URL deseni \'$query\' içermelidir.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'URL deseni \'$url\' yer tutucusunu içermelidir.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'URL deseni geçerli bir URL olmalıdır.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Ekle';

  @override
  String get advancedSettingEditSearchProviderAction => 'Düzenle';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Kaldır';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return '$engineName kaldırmak istediğinizden emin misiniz?';
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
  String get userSettingsJoinFluxerLabs => 'Fluxer Labs\'a Katıl';

  @override
  String get userSettingsNavAppLicenses => 'Uygulama Lisansları';

  @override
  String get userSettingsAppLicensesDescription =>
      'Bu uygulamada kullanılan açık kaynaklı yazılımlar. Bu uygulama Flutter ile oluşturulmuştur.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Uygulama lisansları yüklenemedi.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lisans',
      one: '1 lisans',
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
  String get savedMessagesEmptyTitle => 'Yer işareti yok';

  @override
  String get savedMessagesEmptyBody =>
      'Mesajları daha sonra görmek için kaydet.';

  @override
  String get savedMessagesEndBody => 'Burada başka gösterilecek bir şey yok.';

  @override
  String get savedMessagesRemoveTooltip => 'Yer işaretini kaldır';

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
  String get uiSearch => 'Ara';

  @override
  String get uiStartCall => 'Aramayı başlat';

  @override
  String get uiStartVideoCall => 'Görüntülü aramayı başlat';

  @override
  String get uiPlay => 'Oynat';

  @override
  String get uiPause => 'Duraklat';

  @override
  String get uiDownload => 'İndir';

  @override
  String get uiMoreActions => 'Diğer işlemler';

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
    return 'Bu işlem, $roleName rolüne sahip $count üyeyi bilgilendirecek. Devam edilsin mi?';
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
  String get guildNavbarGuildSelected => 'Seçildi';

  @override
  String get guildNavbarGuildUnread => 'Okunmadı';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count anma',
      one: '1 anma',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'sessiz';

  @override
  String get authShowPassword => 'Şifreyi göster';

  @override
  String get authHidePassword => 'Şifreyi gizle';

  @override
  String get chatLoadingMessages => 'Mesajlar yükleniyor';

  @override
  String get friendsMessageFriend => 'Mesaj';

  @override
  String get friendsFriendActions => 'Arkadaş eylemleri';

  @override
  String get friendsAcceptRequest => 'Arkadaşlık isteğini kabul et';

  @override
  String get friendsDeclineRequest => 'Arkadaşlık isteğini reddet';

  @override
  String get friendsCancelRequest => 'Arkadaşlık isteğini iptal et';

  @override
  String get friendsOpenInbox => 'Gelen Kutusu';

  @override
  String get profileRemoveFriend => 'Arkadaşlıktan çıkar';

  @override
  String get profileUnblockUser => 'Engellemeyi kaldır';

  @override
  String get profileAcceptFriendRequest => 'Arkadaşlık isteğini kabul et';

  @override
  String get profileCancelFriendRequest => 'Arkadaşlık isteğini iptal et';

  @override
  String get profileSendFriendRequest => 'Arkadaş ekle';

  @override
  String get accountOverflowMenu => 'Hesap seçenekleri';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navNotifications => 'Bildirimler';

  @override
  String get navYou => 'Sen';

  @override
  String get guildFolderSettingsTitle => 'Klasör ayarları';

  @override
  String get guildFolderNameLabel => 'Klasör adı';

  @override
  String get guildFolderColorLabel => 'Klasör rengi';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Daraltıldığında simgeyi göster';

  @override
  String get guildFolderIconLabel => 'Klasör simgesi';

  @override
  String get guildFolderDelete => 'Klasörü sil';

  @override
  String get guildFolderIconFolder => 'Klasör';

  @override
  String get guildFolderIconStar => 'Yıldız';

  @override
  String get guildFolderIconHeart => 'Kalp';

  @override
  String get guildFolderIconBookmark => 'Yer işareti';

  @override
  String get guildFolderIconGameController => 'Oyun kumandası';

  @override
  String get guildFolderIconShield => 'Kalkan';

  @override
  String get guildFolderIconMusicNote => 'Müzik notu';

  @override
  String get guildFolderMarkAsRead => 'Klasörü okundu olarak işaretle';

  @override
  String get guildBulkMuteCommunities => 'Toplulukları sessize al';

  @override
  String get guildBulkUnmuteCommunities => 'Toplulukların sesini aç';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Topluluk bildirim ayarları';

  @override
  String get guildBulkCommunityPrivacySettings => 'Topluluk gizlilik ayarları';

  @override
  String get guildBulkAllowEveryoneAndHere => '@everyone ve @here\'a izin ver';

  @override
  String get guildBulkAllowRoleMentions => 'Rol etiketlerine izin ver';

  @override
  String get guildBulkEnableMobilePush =>
      'Mobil anlık bildirimleri etkinleştir';

  @override
  String get guildBulkDisableMobilePush => 'Mobil anlık bildirimleri kapat';

  @override
  String get guildBulkAllowDirectMessages => 'Doğrudan mesajlara izin ver';

  @override
  String get guildBulkBlockDirectMessages => 'Doğrudan mesajları engelle';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Bot doğrudan mesajlarına izin ver';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Bot doğrudan mesajlarını engelle';

  @override
  String get guildNavbarGroupDm => 'Grup DM';

  @override
  String get guildNavbarCreateChannel => 'Kanal oluştur';

  @override
  String get guildNavbarChannelType => 'Kanal türü';

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
  String get guildNavbarChannelTypeSelection => 'Kanal türü seçimi';

  @override
  String get guildNavbarCreateCategory => 'Kategori oluştur';

  @override
  String get guildNavbarNewCategoryHint => 'Yeni kategori';

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
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Yalnızca $productName personeli tarafından erişilebilir';
  }

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
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Çıkartmalar';

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
  String get guildMenuSettingsInviteLinks => 'Davetler';

  @override
  String get guildMenuSettingsBans => 'Yasaklamalar';

  @override
  String get guildMenuSettingsChannels => 'Kanallar';

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
  String get guildSettingsCreateRole => 'Rol oluştur';

  @override
  String get guildSettingsRolesListTitle => 'Roller';

  @override
  String get guildSettingsRolesNewRole => 'Yeni rol';

  @override
  String get guildSettingsRolesDeleteRole => 'Rolü sil';

  @override
  String get guildSettingsRolesBackToRoles => 'Rollere geri dön';

  @override
  String get guildSettingsBackToSettings => 'Ayarlara geri dön';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return '\"$name\" Düzenle';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Rol ayarlarını ve izinlerini yapılandırın';

  @override
  String get guildSettingsRolesDisplaySection => 'Göster';

  @override
  String get guildSettingsRolesRoleName => 'Rol adı';

  @override
  String get guildSettingsRolesRoleColor => 'Rol rengi';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Bir renk yazın (hex, rgb(), hsl() veya ad) ya da seçiciyi kullanın.';

  @override
  String get guildSettingsRolesShowSeparately => 'Bu rolü ayrı göster';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Bu role sahip üyeleri üye listesinde kendi bölümlerinde listeler.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Bu rol için bahsetmelere izin ver';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Bu ayardan bağımsız olarak, \"$permission\" iznine sahip üyeler rolleri her zaman belirtebilir.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Tüm izinleri hızlıca temizlemek için bu düğmeyi kullanın.';

  @override
  String get guildSettingsRolesClearPermissions => 'İzinleri temizle';

  @override
  String get guildSettingsRolesPermissionsSection => 'İzinler';

  @override
  String get guildSettingsRolesSearchPermissions => 'İzinleri ara';

  @override
  String get guildSettingsRolesDenseLayout => 'Yoğun düzen';

  @override
  String get guildSettingsRolesComfyLayout => 'Rahat düzen';

  @override
  String get guildSettingsRolesSwitchToDenseLayout => 'Yoğun düzene geç';

  @override
  String get guildSettingsRolesSwitchToComfyLayout => 'Rahat düzene geç';

  @override
  String get guildSettingsRolesSingleColumn => 'Tek sütun';

  @override
  String get guildSettingsRolesTwoColumns => 'İki sütun';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'Tek sütuna geç';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'İki sütunlu görünüme geç';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'İzin bulunamadı';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Özel sıralama';

  @override
  String get guildSettingsRolesHoistOrder => 'Sıralamayı yükselt';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Varsayılana sıfırla';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Üye listesinde görünme sıralarını özelleştirmek için rolleri sürükleyin.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Yükseltilmiş rol yok. Bir rolü burada görmek için \"Bu rolü ayrı göster\" seçeneğini etkinleştirin.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Bu rolü düzenleyemezsiniz çünkü bu, sizin en yüksek rolünüz veya sizin üstünüzde bir roldür';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Bu izinleri düzenlemek için \"$permission\" iznine ihtiyacın var';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'En yüksek rolünüzle aynı veya daha üst bir rolü düzenleyemezsiniz';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Sahip olmadığınız bir izni veremezsiniz';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Bu izni kaldıramazsınız çünkü kendinizden de kaldırmış olursunuz';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Roller başarıyla güncellendi';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Rol başarıyla oluşturuldu';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Rol başarıyla silindi';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Yükseltme sırası varsayılana sıfırlandı';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Rol adı gerekli';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Kaydetmeden önce role bir ad verin.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Rol oluşturulamadı';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'Roller güncellenemedi';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Rol silinemedi';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" silinemedi. Tekrar deneyin.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Sıralama düzeni sıfırlanamadı';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Birazdan tekrar deneyin.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return '`$name` rolünü silmek istediğinizden emin misiniz? Bu role sahip olan üyeler artık bu role sahip olmayacak.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Topluluk geneli';

  @override
  String get permissionCategoryMessagesMedia => 'Mesajlar ve medya';

  @override
  String get permissionCategoryModeration => 'Moderasyon';

  @override
  String get permissionCategoryChannelAccess => 'Kanal erişimi';

  @override
  String get permissionCategoryChannelManagement => 'Kanal yönetimi';

  @override
  String get permissionCategoryAudioVideo => 'Ses ve görüntü';

  @override
  String get permissionUnknown => 'Bilinmeyen izin';

  @override
  String get permissionAdministrator => 'Yönetici';

  @override
  String get permissionAdministratorDescription =>
      'Tüm izinleri verir ve kanal kısıtlamalarını atlar. Çok hassastır.';

  @override
  String get permissionViewActivityLog => 'Etkinlik günlüğünü görüntüle';

  @override
  String get permissionViewActivityLogDescription =>
      'Topluluğun değişiklik ve moderasyon eylemleri etkinlik günlüğünü oku.';

  @override
  String get permissionManageCommunity => 'Topluluğu yönet';

  @override
  String get permissionManageCommunityDescription =>
      'Ad, açıklama ve simge gibi genel ayarları düzenleyin.';

  @override
  String get permissionManageRoles => 'Rolleri yönet';

  @override
  String get permissionManageRolesDescription =>
      'Kendi en yüksek rolünüzün altındaki rolleri oluşturun, düzenleyin veya silin. Ayrıca kanal izin geçersiz kılmalarını düzenlemeye de olanak tanır.';

  @override
  String get permissionManageChannels => 'Kanalları yönet';

  @override
  String get permissionManageChannel => 'Kanalı yönet';

  @override
  String get permissionManageChannelDescription =>
      'Bu kanalın ayarlarını düzenle ve yeniden adlandır.';

  @override
  String get permissionManagePermissions => 'İzinleri yönet';

  @override
  String get permissionManagePermissionsDescription =>
      'Bu kanaldaki roller ve üyeler için geçersiz kılmaları düzenle.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Bu kanal için web kancaları oluşturun, düzenleyin veya silin.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Bu kanalın üye listesini gör.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Bu kanal için davet bağlantılarını yönetin.';

  @override
  String get permissionOverwriteDeny => 'Reddet';

  @override
  String get permissionOverwriteInherit => 'Tarafsız (devral)';

  @override
  String get permissionOverwriteAllow => 'İzin ver';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Tüm izinleri hızlıca ayarlamak için bu düğmeleri kullanın.';

  @override
  String get permissionManageChannelsDescription =>
      'Kanalları ve kategorileri oluşturun, düzenleyin veya silin.';

  @override
  String get permissionKickMembers => 'Üyeleri at';

  @override
  String get permissionBanMembers => 'Üyeleri yasakla';

  @override
  String get permissionCreateInviteLinks => 'Davet bağlantıları oluştur';

  @override
  String get permissionChangeOwnNickname => 'Kendi takma adını değiştir';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Kendi takma adını güncelle.';

  @override
  String get permissionManageNicknames => 'Takma adları yönet';

  @override
  String get permissionManageNicknamesDescription =>
      'Diğer üyelerin takma adlarını değiştirin.';

  @override
  String get permissionCreateEmojiStickers => 'Emoji ve çıkartma oluştur';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Yeni emojiler ve çıkartmalar yükle, kendi oluşturduklarını yönet.';

  @override
  String get permissionManageEmojiStickers => 'Emoji ve çıkartmaları yönet';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Diğer üyeler tarafından oluşturulan emojileri ve çıkartmaları düzenleyin veya silin.';

  @override
  String get permissionManageWebhooks => 'Webhook\'ları yönet';

  @override
  String get permissionManageWebhooksDescription =>
      'Webhook\'ları oluşturun, düzenleyin veya silin.';

  @override
  String get permissionSendMessages => 'Mesaj gönder';

  @override
  String get permissionSendTtsMessages => 'TTS mesajları gönder';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Metin-konuşma mesajları gönder.';

  @override
  String get permissionManageMessages => 'Mesajları yönet';

  @override
  String get permissionManageMessagesDescription =>
      'Diğer üyelerin mesajlarını silin. Sabitleme ayrı olarak kontrol edilir.';

  @override
  String get permissionPinMessages => 'Mesajları sabitle';

  @override
  String get permissionEmbedLinks => 'Bağlantıları yerleştir';

  @override
  String get permissionAttachFiles => 'Dosya ekle';

  @override
  String get permissionMentionEveryone => '@everyone/@here ve @rol kullan';

  @override
  String get permissionMentionEveryoneDescription =>
      'Herkese veya herhangi bir role bahset (rolün bahsedilebilir olarak ayarlanmamış olsa bile).';

  @override
  String get permissionUseExternalEmoji => 'Harici emojileri kullan';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Diğer topluluklardaki emojileri kullanın.';

  @override
  String get permissionUseExternalStickers => 'Harici çıkartmaları kullan';

  @override
  String get permissionAddReactions => 'Tepki ekle';

  @override
  String get permissionAddReactionsDescription =>
      'Mesajlara yeni tepkiler ekle.';

  @override
  String get permissionBypassSlowmode => 'Yavaş modu atla';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Kanal başına mesaj gönderme hız limitlerini yok say.';

  @override
  String get permissionTimeOutMembers => 'Üyeleri zaman aşımına uğrat';

  @override
  String get permissionTimeOutMembersDescription =>
      'Üyelerin belirli bir süre boyunca mesaj göndermesini, tepki vermesini ve sesli sohbete katılmasını engelle.';

  @override
  String get permissionViewChannel => 'Kanalı görüntüle';

  @override
  String get permissionViewChannelMembers => 'Kanal üyelerini görüntüle';

  @override
  String get permissionViewChannelMembersDescription =>
      'Bu topluluktaki kanalların üye listesini görün.';

  @override
  String get permissionConnect => 'Bağlan';

  @override
  String get permissionSpeak => 'Konuş';

  @override
  String get permissionStreamVideo => 'Video yayınla';

  @override
  String get permissionUseVoiceActivity => 'Ses etkinliğini kullan';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Bu izin olmadan bas konuş özelliği gerekir.';

  @override
  String get permissionPrioritySpeaker => 'Öncelikli konuşmacı';

  @override
  String get permissionMuteMembers => 'Üyelerin sesini kapat';

  @override
  String get permissionDeafenMembers => 'Üyelerin sesini kapat';

  @override
  String get permissionMoveMembers => 'Üyeleri taşı';

  @override
  String get permissionMoveMembersDescription =>
      'Erişebildikleri kanallar arasında üyeleri sürükleyip bırakın.';

  @override
  String get permissionSetVoiceRegion => 'Ses bölgesini ayarla';

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
      'Topluluğunuzda yapılandırılmış tüm webhook\'ları görüntüleyin ve yönetin.';

  @override
  String get guildSettingsWebhooksEmpty => 'Web Kancası yok';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Bu toplulukta henüz webhook yok. Bir tane oluşturmak için $channelSettingsPath adresine gidin.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Bu topluluğun webhook\'larını görüntülemek ve düzenlemek için \"$permission\" iznine sahip olmanız gerekir.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'Webhook\'lar yüklenemedi';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Webhook\'lar yüklenirken bir hata oluştu. Tekrar deneyin.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhook\'lar güncellendi';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'Webhook\'lar güncellenemedi';

  @override
  String get guildSettingsUnknownChannel => 'Bilinmeyen kanal';

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
      'Topluluğunuzu Keşfet\'te listeleyin, böylece başkaları bulup katılabilsin.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'Yeterli üye yok';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Topluluğunuzun Keşfet\'te listelenebilmesi için en az $count üyeye sahip olması gerekir.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Durum:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Beklemede';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Onaylandı';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Reddedildi';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Kaldırıldı';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Sebep: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Topluluğunuz Keşfet\'te listeleniyor. Aşağıdan liste ayrıntılarınızı güncelleyebilir veya kaldırmak için geri çekebilirsiniz.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Başvurunuz incelenmeyi bekliyor. İlan ayrıntılarınızı yine de güncelleyebilir veya başvuruyu geri çekebilirsiniz.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Topluluğunuzu en iyi tanımlayan kategoriyi seçin. Bunu istediğiniz zaman değiştirebilirsiniz.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Birincil dil';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Topluluğunuzdaki çoğu kişinin konuştuğu dil. Keşfet sonuçlarını filtrelemek için kullanılır.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Açıklama';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Topluluğunuzun ne hakkında olduğunu açıklayın';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Açıklama gerekli.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Açıklama en az $minLength karakter olmalıdır.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Açıklama en fazla $maxLength karakter olabilir.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Özel etiketler';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'En fazla $maxTags etiket, topluluğunuzun bulunmasına yardımcı olur. Keşfet aramalarında görünürler.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint =>
      'Bir etiket ekle ve Enter\'a bas';

  @override
  String get guildSettingsDiscoveryAddTag => 'Ekle';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return '$tag etiketini kaldır';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Etiket eklenemedi';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Etiketler 2 ila $maxLength karakter uzunluğunda ve alfanümerik olmalıdır.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'En fazla $maxTags etiket ekleyebilirsiniz.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Uygula';

  @override
  String get guildSettingsDiscoverySave => 'Kaydet';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Geri Çek';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Keşif başvurusu gönderildi';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Keşfet listesi güncellendi';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Keşif başvurusu geri çekildi';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Başvuru geri çekilemedi';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Birazdan tekrar deneyin.';

  @override
  String get guildSettingsMembersDescription =>
      'Sunucu üyelerini ara ve yönet.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Kullanıcı adına veya kimliğe göre ara';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count üye';
  }

  @override
  String get guildMembersRecentTitle => 'Yeni üyeler';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '$displayedCount / $totalCount toplam üye gösteriliyor';
  }

  @override
  String get guildMembersSort => 'Sırala';

  @override
  String get guildSettingsMembersSortNewest => 'En yeniden önce';

  @override
  String get guildMembersSortOldest => 'Önce en eski';

  @override
  String get guildMembersColumnName => 'Ad';

  @override
  String get guildMembersColumnMemberSince => 'Üye olma tarihi';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return '$productName\'e katılma tarihi';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Katılma yöntemi';

  @override
  String get guildMembersColumnRoles => 'Roller';

  @override
  String get guildMembersColumnActions => 'İşlemler';

  @override
  String get guildMembersFilterMemberSince => 'Üyelik tarihine göre filtrele';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Hesap oluşturma tarihine göre filtrele';

  @override
  String get guildMembersFilterJoinMethod => 'Katılma yöntemine göre filtrele';

  @override
  String get guildMembersFilterRoles => 'Rollere göre filtrele';

  @override
  String get guildMembersFilterAll => 'Tümü';

  @override
  String get guildMembersFilterPast1Hour => 'Son 1 saat';

  @override
  String get guildMembersFilterPast24Hours => 'Son 24 saat';

  @override
  String get guildMembersFilterPast7Days => 'Son 7 gün';

  @override
  String get guildMembersFilterPast2Weeks => 'Son 2 hafta';

  @override
  String get guildMembersFilterPast3Weeks => 'Son 3 hafta';

  @override
  String get guildMembersFilterPast4Weeks => 'Son 4 hafta';

  @override
  String get guildMembersFilterPast3Months => 'Son 3 ay';

  @override
  String get guildMembersFilterCustomRange => 'Özel aralık...';

  @override
  String get guildMembersDateRangeTitle => 'Özel tarih aralığı';

  @override
  String get guildMembersDateAfter => 'Şu tarihten sonra';

  @override
  String get guildMembersDateBefore => 'Şu tarihten önce';

  @override
  String get guildMembersClearAll => 'Tümünü temizle';

  @override
  String get guildMembersRowsPerPage => 'Sayfa başına satır';

  @override
  String get guildMembersEmptySearch => 'Bu aramaya uyan kimse yok.';

  @override
  String get guildMembersLoadError =>
      'Üyeler yüklenirken bir sorun oluştu. Lütfen daha sonra tekrar deneyin.';

  @override
  String get guildMembersIndexing => 'Üyeler yükleniyor…';

  @override
  String get guildMembersGoToPage => 'Sayfaya git';

  @override
  String guildMembersGoToPageItem(int page) {
    return '$page sayfasına git';
  }

  @override
  String get guildMembersJumpToPage => 'Sayfaya atla';

  @override
  String get guildMembersJoinSourceCreator => 'Topluluk yaratıcısı';

  @override
  String get guildMembersJoinSourceInvite => 'Davet et';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Davet ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return '$name tarafından davet edildi';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'Özel URL';

  @override
  String get guildMembersJoinSourceBotInvite => 'Bot daveti';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Platform yöneticisi';

  @override
  String get guildMembersJoinSourceDiscovery => 'Keşfet';

  @override
  String get guildMembersJoinMethodUnknown => 'Bilinmiyor';

  @override
  String get guildMembersCommunityOwner => 'Topluluk sahibi';

  @override
  String get guildMembersViewAllRoles => 'Tüm rolleri görüntüle';

  @override
  String get guildMembersJoinedJustNow => 'Şimdi';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dakika önce',
      one: '1 dakika önce',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saat önce',
      one: '1 saat önce',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count gün önce',
      one: '1 gün önce',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Üyeler';

  @override
  String get guildMembersChannelListSelected => 'Üyeler, seçildi';

  @override
  String get guildSettingsInvitesTitle => 'Davetler';

  @override
  String get guildSettingsInvitesDescription =>
      'Bu topluluğun tüm davetlerini görüntüleyin. Yeni bir davet oluşturmak için bir kanala gidin ve davet et düğmesini kullanın.';

  @override
  String get guildSettingsInvitesEmpty => 'Davet bağlantısı yok';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Bu topluluğun henüz davet bağlantısı yok. Bir kanal oluşturmak ve kişileri davet etmek için bir kanala gidin.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'Davetler yüklenemedi';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Davetiyeler yüklenirken bir hata oluştu. Lütfen tekrar deneyin.';

  @override
  String get guildSettingsInvitesTryAgain => 'Tekrar dene';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Son kullanma tarihi yerine oluşturulma tarihini göster';

  @override
  String get guildSettingsInvitesPauseInvites => 'Davetleri duraklat';

  @override
  String get guildSettingsInvitesEnableInvites => 'Davetleri etkinleştir';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Bu topluluk için davetleri duraklat';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Bu topluluk için davetleri etkinleştir';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Davetleri duraklatılsın mı? Yeniden etkinleştirene kadar yeni kullanıcılar davet bağlantıları aracılığıyla katılamaz. Mevcut üyeler etkilenmez.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Davetleri etkinleştireyim mi? Kullanıcılar bu topluluğa davet bağlantıları aracılığıyla tekrar katılabilecek.';

  @override
  String get guildSettingsInvitesPause => 'Duraklat';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Bu topluluk için davetler duraklatıldı.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Olası bir saldırı algılandığı için davetler $productName tarafından duraklatıldı. Yeni kullanıcılar şu anda katılamaz.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Davet eden:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kod:';

  @override
  String get guildSettingsInvitesLabelUses => 'Kullanır:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Oluşturuldu:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Sona erer:';

  @override
  String get guildSettingsInvitesUnknown => 'Bilinmiyor';

  @override
  String get guildSettingsInvitesNoCategory => 'Kategori yok';

  @override
  String get guildSettingsInvitesExpired => 'Süresi doldu';

  @override
  String get guildSettingsInvitesNever => 'Asla';

  @override
  String get guildSettingsInvitesCopyLink => 'Davet bağlantısını kopyala';

  @override
  String get guildSettingsInvitesRevoke => 'Daveti geri çek';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => 'Davet geri alınamadı';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Bağlantı hâlâ çalışıyor olabilir. Birazdan tekrar deneyin.';

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
  String get guildSettingsEmojiUploadTitle => 'Emoji yükle';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Emoji yuvaları';

  @override
  String get guildSettingsEmojiDropZone =>
      'Emoji dosyalarını buraya sürükleyip bırakın';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Emojiler yüklenemedi. Daha sonra tekrar deneyin.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Aramanızla eşleşen emoji bulunamadı.';

  @override
  String get guildSettingsEmojiNoSlots => 'Kullanılabilir emoji alanı yok';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Maksimum emoji sayısına ulaştınız. Yer açmak için mevcut emojilerden bazılarını silin.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emoji adları en az 2 karakter içermelidir ve harf, sayı ve alt çizgi kullanılabilir. Emojiler $maxSize\'dan küçük olmalıdır. Statik resimler otomatik olarak 128x128 piksele yeniden boyutlandırılır ve sıkıştırılır. Animasyonlu emojiler ve SVG\'lerin zaten limite uygun olması gerekir.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Emojiler yükleniyor';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emoji yükleniyor',
      one: '# emoji yükleniyor',
    );
    return '$_temp0. Bu biraz zaman alabilir.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Emojiler yüklenemedi. Tekrar deneyin.';

  @override
  String get guildSettingsEmojiSomeFailedTitle => 'Bazı emojiler eklenemedi';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Bu dosyaları inceleyin ve daha küçük veya daha basit görsellerle tekrar deneyin.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Emojiyi yeniden adlandır';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 karakter, harf, sayı, alt çizgi.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Ad';

  @override
  String get guildSettingsEmojiColumnUploader => 'Yükleyen';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Bilinmiyor';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Emojiyi sil';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return '$name: silinsin mi? Geri alınamaz.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Bu emojiyi depolama alanından ve CDN\'den temizle';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Emoji adı en az 2 karakter uzunluğunda olmalı';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Emoji adı en fazla 32 karakter uzunluğunda olmalıdır';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Geçersiz emoji adı';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Bu emojinin adı değiştirilemedi';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Ad eski haline döndürüldü. Lütfen bir süre sonra tekrar deneyin.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Bu emoji artık mevcut değil';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Silinmiş olabilir. Adı önceki haline döndürüldü.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Bu emojiyi yeniden adlandıramazsınız';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Bu emojiyi yeniden adlandırma izniniz yok. Ad önceki haline döndürüldü.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Çok hızlı gidiyorsun';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Lütfen bir süre bekleyip yeniden adlandırmayı tekrar deneyin.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => 'Bu emojiyi silemedik';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Bu emojiyi silemezsiniz';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Emojilerinizin kopyalanmasına izin ver';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Etkinleştirildiğinde, diğer toplulukların üyeleri özel emojilerinizde uygulama içi tek tıklamayla \"Klonla\" kısayolunu kullanabilir. Bu, onların görseli kaydedip kendilerinin yüklemesini engellemez.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Çıkartmalarının kopyalanmasına izin ver';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Etkinleştirildiğinde, diğer toplulukların üyeleri özel çıkartmalarınızda uygulama içi tek tıklamayla \"Klonla\" kısayolunu kullanabilir. Bu, onların görseli kaydetmelerini ve kendilerinin yüklemesini engellemez.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Yalnızca \"$permission\" iznine sahip üyeler bunu değiştirebilir.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Emoji kopyalama güncellenemedi';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Çıkartma klonlama güncellenemedi';

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
  String get guildSettingsStickerSlotsTitle => 'Çıkartma yuvaları';

  @override
  String get guildSettingsStickerUploadTitle => 'Çıkartma yükle';

  @override
  String get guildSettingsStickerDropZone =>
      'Bir çıkartma dosyasını buraya sürükleyip bırakın (tek seferde bir tane)';

  @override
  String get guildSettingsStickerDensity => 'Çıkartma yoğunluğu';

  @override
  String get guildSettingsStickerDensityCozy => 'Rahat';

  @override
  String get guildSettingsStickerDensityCompact => 'Sıkı';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'Çıkartmalar yüklenemedi';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Çıkartmalar yüklenirken bir hata oluştu. Tekrar deneyin.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Aramanızla eşleşen çıkartma bulunamadı.';

  @override
  String get guildSettingsStickersEmptySearch => 'Çıkartma bulunamadı';

  @override
  String get guildSettingsStickerNoSlots => 'Kullanılabilir çıkartma alanı yok';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Çıkartma sınırına ulaştınız. Yer açmak için mevcut çıkartmalardan bazılarını silin.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Etiketler 320x320 piksel boyutunda kaydedilir ve $maxSize\'dan küçük olmalıdır. Statik resimler otomatik olarak yeniden boyutlandırılır ve sıkıştırılır. Animasyonlu etiketlerin ve SVG\'lerin zaten limite uygun olması gerekir.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Desteklenmeyen çıkartma dosyası';

  @override
  String get guildSettingsStickerAddTitle => 'Çıkartma ekle';

  @override
  String get guildSettingsStickerEditTitle => 'Çıkartmayı düzenle';

  @override
  String get guildSettingsStickerNameLabel => 'Ad';

  @override
  String get guildSettingsStickerNameHint => 'Harika çıkartmam';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Açıklama';

  @override
  String get guildSettingsStickerDescriptionHint => 'Çıkartmayı tanımla';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Etiketler ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Etiket ekle';

  @override
  String get guildSettingsStickerTagAdd => 'Ekle';

  @override
  String get guildSettingsStickerNameRequired => 'Ad gerekli';

  @override
  String get guildSettingsStickerNameTooShort => 'Ad en az 2 karakter olmalı';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Ad 30 karakter veya daha az olmalı';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Açıklama 500 karakter veya daha az olmalı';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Bu çıkartma oluşturulamadı';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Çıkartma çok büyük';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Çıkartma yeterince sıkıştırılamadı';

  @override
  String get guildSettingsStickerDeleteTitle => 'Çıkartmayı sil';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return '\"$name\" silinsin mi? Geri alınamaz.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Bu çıkartmayı depolama alanından ve CDN\'den temizle';

  @override
  String get guildSettingsStickerDeleteFailedTitle => 'Bu çıkartma silinemedi';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Bu etiketi silemezsin';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Webhook oluşturmak için $channelSettingsPath bölümünü açın. Mevcut tüm webhook\'ları buradan düzenleyebilir ve organize edebilirsiniz.';
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
  String get guildSettingsInvitesTableExpires => 'Süresi doluyor';

  @override
  String get guildSettingsAuditLogFilterUser => 'Kullanıcıya göre filtrele';

  @override
  String get guildSettingsAuditLogFilterAction => 'Eyleme göre filtrele';

  @override
  String get createDm => 'DM oluştur';

  @override
  String get createGroupDm => 'Grup DM oluştur';

  @override
  String get createDmNewMessage => 'Yeni mesaj';

  @override
  String get createDmSelectFriends => 'Arkadaşları seç';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Mesaj göndermek için arkadaş seçin.';

  @override
  String get createDmSearchFriends => 'Arkadaş ara';

  @override
  String get createDmNoFriendsFound => 'Hiç arkadaş bulunamadı';

  @override
  String get createDmNoFriendsYet => 'Henüz hiç arkadaşın yok';

  @override
  String get createDmClaimToStartDms => 'DM başlatmak için hesabını onayla.';

  @override
  String get createDmVerifyToStartDms =>
      'DM başlatmak için e-postanızı doğrulayın.';

  @override
  String get createDmVerifyYourEmail => 'E-postanızı doğrulayın';

  @override
  String get createDmNewGroup => 'Yeni grup';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return '$userName ile yeni bir grup oluştur';
  }

  @override
  String get createDmConfirmNewGroup => 'Yeni grubu onayla';

  @override
  String get createDmCreateNewGroup => 'Yeni grup oluştur';

  @override
  String createDmRemoveFriend(String displayName) {
    return '$displayName adlı kişiyi kaldır';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Bu kullanıcılarla zaten bir grubunuz var. Yeni bir tane oluşturmak istediğinizden emin misiniz? Bu da sorun değil!';

  @override
  String get createDmNoActivityYet => 'Henüz bir etkinlik yok';

  @override
  String get createDmSomeUsersCantBeAdded => 'Bazı kullanıcılar eklenemiyor';

  @override
  String get createDmCreateWithoutThem => 'Onlarsız oluştur';

  @override
  String get createDmUnaddableIntro =>
      'Aşağıdaki kişiler bu grup DM\'ye eklenemiyor:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Kalan $count kişiyi ekleyerek grup DM\'sini oluşturup diğerlerini atla?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Grup DM oluşturmak için başka alıcı kalmadı.';

  @override
  String get createDmUnaddableUserNotFound => 'Kullanıcı bulunamadı';

  @override
  String get createDmUnaddableBlocked => 'Bu kullanıcıya mesaj gönderemezsiniz';

  @override
  String get createDmUnaddableNotFriends => 'Arkadaş listenizde değil';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Grup DM\'lerine eklenmeye izin vermiyor';

  @override
  String get createDmFailed => 'Sohbet oluşturulamadı. Lütfen tekrar deneyin.';

  @override
  String get dmListMessagesTitle => 'Mesajlar';

  @override
  String get dmListDirectMessagesTitle => 'Doğrudan Mesajlar';

  @override
  String get keybindsSearchShortcuts => 'Kısayolları ara';

  @override
  String get keybindSectionDefaults => 'Varsayılanlar';

  @override
  String get keybindSectionMessages => 'Mesajlar';

  @override
  String get keybindSectionNavigation => 'Gezinme';

  @override
  String get keybindSectionDragAndDrop => 'Sürükle ve bırak';

  @override
  String get keybindSectionChat => 'Sohbet';

  @override
  String get keybindSectionVoiceAndVideo => 'Sesli ve görüntülü';

  @override
  String get keybindSectionMisc => 'Çeşitli';

  @override
  String get keybindActionShowShortcutsList =>
      'Klavye kısayolları listesini göster';

  @override
  String get keybindActionCopyText => 'Metni kopyala';

  @override
  String get keybindActionMarkUnread => 'Okunmadı olarak işaretle';

  @override
  String get keybindActionFocusTextarea => 'Metin alanına odaklan';

  @override
  String get keybindActionSwitchCommunities => 'Topluluklar arasında geçiş yap';

  @override
  String get keybindActionSwitchChannels => 'Kanallar arasında geçiş yap';

  @override
  String get keybindActionHistoryBack =>
      'Görüntülenen kanal geçmişinde geriye git';

  @override
  String get keybindActionHistoryForward =>
      'Görüntülenen kanal geçmişinde ileri git';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Okunmamış kanallar arasında geçiş yap';

  @override
  String get keybindActionJumpMentionChannels =>
      'Bahsedildiğiniz okunmamış kanallar arasında geçiş yapın';

  @override
  String get keybindActionJumpCurrentCall => 'Mevcut aramaya atla';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Son topluluk ve DM\'ler arasında geçiş yap';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Önceki topluluğa veya DM\'lere geç';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Sonraki topluluğa veya DM\'lere geç';

  @override
  String get keybindActionGoToDms => 'Doğrudan Mesajlara Git';

  @override
  String get keybindActionGoToFirstCommunity => 'İlk topluluğa git';

  @override
  String get keybindActionGoToSecondCommunity => 'İkinci topluluğa git';

  @override
  String get keybindActionGoToThirdCommunity => 'Üçüncü topluluğa git';

  @override
  String get keybindActionGoToFourthCommunity => 'Dördüncü topluluğa git';

  @override
  String get keybindActionGoToFifthCommunity => 'Beşinci topluluğa git';

  @override
  String get keybindActionGoToSixthCommunity => 'Altıncı topluluğa git';

  @override
  String get keybindActionGoToSeventhCommunity => 'Yedinci topluluğa git';

  @override
  String get keybindActionGoToEighthCommunity => 'Sekizinci topluluğa git';

  @override
  String get keybindActionToggleQuickSwitcher => 'Hızlı değiştiriciyi aç/kapat';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Topluluk oluştur veya topluluğa katıl';

  @override
  String get keybindActionStartDragAndDrop => 'Sürükleyip bırakmayı başlat';

  @override
  String get keybindActionMove => 'Taşı';

  @override
  String get keybindActionDropItem => 'Öğeyi bırak';

  @override
  String get keybindActionCancel => 'İptal';

  @override
  String get keybindActionMarkCommunityRead =>
      'Topluluğu okundu olarak işaretle';

  @override
  String get keybindActionMarkChannelRead => 'Kanalı okundu olarak işaretle';

  @override
  String get keybindActionStartGroupDm => 'Grup DM başlat';

  @override
  String get keybindActionTogglePinnedMessages =>
      'Sabitlenmiş mesajları aç/kapat';

  @override
  String get keybindActionToggleInbox => 'Gelen kutusunu aç/kapat';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Gelen kutusundaki en üstteki kanalı okundu olarak işaretle';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Tüm gelen kutusu kanallarını okundu olarak işaretle';

  @override
  String get keybindActionToggleMemberList =>
      'Üye listesini veya sesli sohbeti aç/kapat';

  @override
  String get keybindActionToggleEmojiPicker => 'Emoji seçiciyi aç/kapat';

  @override
  String get keybindActionToggleGifPicker => 'GIF seçiciyi aç/kapat';

  @override
  String get keybindActionToggleStickerPicker => 'Çıkartma seçiciyi aç/kapat';

  @override
  String get keybindActionScrollChatUp => 'Sohbette yukarı kaydır';

  @override
  String get keybindActionScrollChatDown => 'Sohbeti aşağı kaydır';

  @override
  String get keybindActionJumpOldestUnread => 'En eski okunmamış mesaja atla';

  @override
  String get keybindActionFocusComposer => 'Metin alanına odaklan';

  @override
  String get keybindActionUploadFile => 'Dosya yükle';

  @override
  String get keybindActionCopyChannelLink => 'Kanal bağlantısını kopyala';

  @override
  String get keybindActionToggleSavedMedia => 'Kaydedilen medyayı aç/kapat';

  @override
  String get keybindActionSendVoiceMessage => 'Sesli mesaj gönder';

  @override
  String get keybindActionAnswerCall => 'Gelen aramayı yanıtla';

  @override
  String get keybindActionDeclineCall => 'Gelen aramayı reddet';

  @override
  String get keybindActionStartDmCall => 'DM\'de veya grupta arama başlat';

  @override
  String get keybindActionToggleSoundboard => 'Ses panosunu aç/kapat';

  @override
  String get keybindActionToggleCompactCallView =>
      'Yoğun arama görünümünü genişlet veya daralt';

  @override
  String get keybindActionPushToTalkPriority => 'Bas konuş (öncelikli)';

  @override
  String get keybindActionVoiceActivityPriority => 'Ses etkinliği önceliği';

  @override
  String get keybindActionOpenHelp => 'Yardımı aç';

  @override
  String get keybindActionSearchMessages => 'Mesajları ara';

  @override
  String get keybindActionOpenContextMenu => 'İçerik menüsünü aç';

  @override
  String get keybindActionOpenSettings => 'Ayarlarınızı açın';

  @override
  String get keybindActionOpenThemeStudio =>
      'Tema stüdyosu açılır penceresini aç';

  @override
  String get keybindActionZoomIn => 'Yakınlaştır';

  @override
  String get keybindActionZoomOut => 'Uzaklaştır';

  @override
  String get keybindActionZoomReset => 'Yakınlaştırmayı sıfırla';

  @override
  String get clipboardPasteFailed =>
      'Yapıştıramadık. Panonuz boştu veya bu uygulama için engellenmişti.';

  @override
  String get homeQuickActionDms => 'DM\'ler';
}
