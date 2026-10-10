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
      'Kurulumda bir sorun var.\nBirazdan düzelecek!';

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
  String get splashConnectionLost => 'Bağlantı kesildi';

  @override
  String get splashViewOnStatusPage => 'Durum sayfasında görüntüle';

  @override
  String get splashConnectionIssuesPrompt =>
      'Bağlantı sorunları mı yaşıyorsunuz?';

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
    return 'Ekiple sohbet etmek ve güncel kalmak için $communityName topluluğuna katılın.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return '$communityName topluluğuna katıl';
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
  String get password => 'Parola';

  @override
  String get forgotPassword => 'Parolanızı mı unuttunuz?';

  @override
  String get logIn => 'Giriş Yap';

  @override
  String get logInWithPasskey => 'Parolana ile giriş yap';

  @override
  String continueWithSso(String provider) {
    return '$provider ile devam et';
  }

  @override
  String get organizationSsoProvider =>
      'Kuruluşunuzun tek oturum açma sağlayıcısıyla oturum açın.';

  @override
  String get failedToStartSso => 'SSO başlatılamadı';

  @override
  String get ssoCancelled => 'SSO oturumu iptal edildi';

  @override
  String preferSso(String provider) {
    return '$provider ile devam ederek SSO\'yu mu tercih ediyorsunuz?';
  }

  @override
  String get needAccountPrompt => 'Hesabınız yok mu? ';

  @override
  String get register => 'Kaydol';

  @override
  String get orDivider => 'OR';

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
  String get ipAuthResendEmail => 'E-postayı tekrar gönder';

  @override
  String get ipAuthResent => 'Tekrar gönderildi';

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
  String get mfaMethodWebauthn => 'Güvenlik anahtarı/geçiş anahtarı';

  @override
  String get mfaTotpDescription =>
      'Kimlik doğrulama uygulamanızdan 6 haneli kodu veya yedek kodlarınızdan birini girin.';

  @override
  String get mfaCodeLabel => 'Kod';

  @override
  String get mfaTryAnotherMethod => 'Başka bir yöntemi dene';

  @override
  String get mfaUseSecurityKey =>
      'Bunun yerine güvenlik anahtarını/geçiş anahtarını dene';

  @override
  String get accountSelectorTitle => 'Bir hesap seçin';

  @override
  String get accountSelectorDescription =>
      'Devam etmek için bir hesap seçin veya farklı bir hesap ekleyin.';

  @override
  String get accountAdd => 'Hesap ekle';

  @override
  String get accountRemoveDescription =>
      'Bu işlem, bu hesap için kayıtlı oturumu kaldıracaktır.';

  @override
  String get accountExpired => 'Süresi doldu';

  @override
  String accountSessionExpired(String identifier) {
    return '$identifier için oturum süresi doldu. Lütfen tekrar giriş yapın.';
  }

  @override
  String get accountManageTitle => 'Hesapları yönet';

  @override
  String get accountSwitchFailed => 'Hesaplar değiştirilemedi. Tekrar deneyin.';

  @override
  String get profileTabMenuSwitchAccounts => 'Hesap değiştir';

  @override
  String get statusChangeSheetTitle => 'Durum ayarla';

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
  String get statusUntilIChangeIt => 'Ben değiştirene kadar';

  @override
  String get statusDontClear => 'Hiç temizleme';

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
  String get statusDndDescription => 'Masaüstünde bildirim almazsınız';

  @override
  String get statusInvisibleDescription => 'Çevrimdışı görünürsünüz';

  @override
  String get customStatusSetTitle => 'Özel durum ayarla';

  @override
  String get customStatusCurrentHint => 'Özel durum';

  @override
  String get customStatusClear => 'Özel durumu temizle';

  @override
  String get customStatusPlaceholder => 'Neler oluyor?';

  @override
  String get customStatusChooseEmoji => 'Bir emoji seçin';

  @override
  String get customStatusClearAfter => 'Şu süreden sonra temizle';

  @override
  String get customStatusSave => 'Kaydet';

  @override
  String get accountActive => 'Aktif hesap';

  @override
  String get signOut => 'Çıkış yap';

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
  String get suspendedRecheck => 'Güncellemeleri kontrol et';

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
  String get forgotPasswordTitle => 'Parolanızı mı unuttunuz?';

  @override
  String get forgotPasswordDescription =>
      'E-posta adresinizi girin, parolanızı sıfırlamanız için size bir bağlantı göndereceğiz.';

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
  String get resetPasswordTitle => 'Yeni parola belirle';

  @override
  String get resetPasswordDescription =>
      'Sıfırlama işlemini tamamlamak için aşağıdaki yeni şifrenizi girin.';

  @override
  String get resetPasswordNewPassword => 'Yeni parola';

  @override
  String get resetPasswordConfirm => 'Yeni parolayı onayla';

  @override
  String get resetPasswordSubmit => 'Parolayı sıfırla';

  @override
  String get resetPasswordMismatch => 'Şifreler eşleşmiyor.';

  @override
  String get recoverAccountTitle => 'Hesabını kurtar';

  @override
  String get recoverAccountDescription =>
      'Kurtarma anahtarınızı ve kurtarma kitinizdeki kurtarma anahtarını girin, ardından yeni bir şifre seçin.';

  @override
  String get recoverAccountNoKit =>
      'Kurtarma kiti yok mu? Parola sıfırlama bağlantısı için bu kurulumun yöneticisinden yardım isteyin.';

  @override
  String get recoveryKitTitle => 'Kurtarma kitiniz';

  @override
  String get recoveryKitCreatedDescription =>
      'Parolanızı unutursanız, bu kit hesabınıza geri dönmenin tek yoludur. Güvenli bir yerde, örneğin bir parola yöneticisinde veya basılı bir kopya olarak saklayın.';

  @override
  String get recoveryKitReplacedDescription =>
      'Eski kurtarma kitiniz artık çalışmıyor. Bu yeni kiti güvenli bir yere saklayın.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Şifreniz sıfırlandı. Eski kurtarma kitiniz artık çalışmıyor. Bu yeni kurtarma kitini güvenli bir yere saklayın.';

  @override
  String get recoveryKitWarning =>
      'Bu anahtara sahip herkes parolanızı sıfırlayabilir. Asla paylaşmayın.';

  @override
  String get recoveryKitKeyLabel => 'Kurtarma anahtarı';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return '$productName kurtarma kiti';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Bu sayfayı güvenli bir yerde saklayın. Parolanızı unutursanız, hesabınıza geri dönmek için kullanabilirsiniz. Bu kurtarma anahtarına sahip herkes parolanızı sıfırlayabilir, bu yüzden asla paylaşmayın.';

  @override
  String get recoveryKitInstanceLabel => 'Kurulum';

  @override
  String get recoveryKitCreatedAtLabel => 'Oluşturuldu';

  @override
  String get recoveryKitQrCaption =>
      'Ayrıntılarınızın doldurulduğu kurtarma sayfasını açmak için tara.';

  @override
  String get recoveryKitStepsTitle => 'Hesabınızı nasıl kurtarabilirsiniz';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return '$recoverUrl adresine gidin veya QR kodu tarayın.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Kullanıcı adınızı ve bu kurtarma anahtarını girin.';

  @override
  String get recoveryKitStepPassword =>
      'Yeni bir şifre seçin. Yeni bir kurtarma kiti alacaksınız ve bu mevcut kitiniz çalışmayı durduracak.';

  @override
  String get recoveryKitBackupCodesTitle => 'İki faktörlü yedek kodları';

  @override
  String get recoveryKitBackupCodesNote =>
      'Her kod, kimlik doğrulama uygulamanızın yerine tek seferlik kullanılabilir.';

  @override
  String get recoveryKitBackupCodesFailed => 'Yedek kodlarınız yüklenemedi.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'İki faktörlü kimlik doğrulama yedek kodlarımı kaydedilen görsele ekle';

  @override
  String get recoveryKitCopy => 'Kopyala';

  @override
  String get recoveryKitCopied => 'Kurtarma anahtarı kopyalandı';

  @override
  String get recoveryKitSaveImage => 'Görseli kaydet';

  @override
  String get recoveryKitSaved => 'Kurtarma kiti kaydedildi';

  @override
  String get recoveryKitSavedToPhotos =>
      'Kurtarma kiti Fotoğraflar\'a kaydedildi';

  @override
  String get recoveryKitSaveFailed =>
      'Kurtarma kiti kaydedilemedi. Tekrar dene veya bunun yerine anahtarı kopyala.';

  @override
  String get recoveryKitAcknowledge =>
      'Kurtarma kitimi güvenli bir yere sakladım';

  @override
  String get recoveryKitCreateFailed =>
      'Kurtarma kitiniz oluşturulamadı. Daha sonra hesap ayarlarınızdan bir tane oluşturabilirsiniz.';

  @override
  String get recoveryKitSectionTitle => 'Kurtarma kiti';

  @override
  String get recoveryKitSectionDescription =>
      'Unutursanız parolanızı sıfırlamanızı sağlar.';

  @override
  String get recoveryKitNone => 'Henüz bir kurtarma kitiniz yok';

  @override
  String recoveryKitCreatedRelative(String time) {
    return '$time tarihinde oluşturuldu';
  }

  @override
  String get recoveryKitCreate => 'Kurtarma kiti oluştur';

  @override
  String get recoveryKitCreateNew => 'Yeni bir kit oluştur';

  @override
  String get recoveryKitReplaceTitle => 'Yeni bir kurtarma kiti oluştursun mu?';

  @override
  String get recoveryKitReplaceDescription =>
      'Yeni kit oluşturulduğunda mevcut kit\'iniz çalışmayı durduracaktır.';

  @override
  String get recoveryKitReminderTitle => 'Kurtarma kiti kaydet';

  @override
  String get recoveryKitReminderBody =>
      'Hesabınızda e-posta adresi yok. Parolanızı unutursanız, kurtarma kiti tek geri dönüş yolunuzdur. Bir dakika sürer.';

  @override
  String get registerUsernameSignInHint =>
      'Bu kullanıcı adıyla oturum açarsınız. Hatırlayacağınız bir tane seçin.';

  @override
  String get registerUsernameTaken => 'Bu kullanıcı adı zaten alınmış';

  @override
  String get registerUsernameAvailable => 'Bu kullanıcı adı kullanılabilir';

  @override
  String get claimAccountUsernameDescription =>
      'Kullanıcı adı ve şifre seçerek hesabınızı talep edin. Bunlarla oturum açacaksınız, bu yüzden hatırlayacağınız bir şeyler seçin.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Hesabınız henüz alınmamış. Kullanıcı adı ve şifre olmadan başka cihazlardan giriş yapamazsınız ve hesabınıza erişimi kaybedebilirsiniz. Hesabınızı güvence altına almak için şimdi alın.';

  @override
  String get addFriendUsernameOnlyHint => 'Kullanıcı adı';

  @override
  String get registerTitle => 'Hesap oluştur';

  @override
  String get registerDisplayName => 'Görünen ad (isteğe bağlı)';

  @override
  String get registerDisplayNameHint => 'Size nasıl hitap edelim?';

  @override
  String get registerUsername => 'Kullanıcı adı (isteğe bağlı)';

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
  String get registerConsentPrefix => 'Kabul ediyorum';

  @override
  String get registerConsentTerms => 'Hizmet Şartları';

  @override
  String get registerConsentAnd => ' ve ';

  @override
  String get registerConsentPrivacy => 'Gizlilik politikası';

  @override
  String get registerConfirmPassword => 'Parolayı onayla';

  @override
  String get registerSubmit => 'Hesap oluştur';

  @override
  String get registerHaveAccount => 'Zaten bir hesabınız var mı? ';

  @override
  String get registerPendingApproval =>
      'Hesap isteğiniz onay bekliyor. Bir yönetici onayladıktan sonra oturum açabilirsiniz.';

  @override
  String get registerClosed =>
      'Kayıt şu anda kapalı. Hesap oluşturmak için bir yöneticiden aldığınız kayıt bağlantısını kullanın.';

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
      'Bu kurulum geçici olarak kullanılamıyor. Bir süre sonra tekrar deneyin.';

  @override
  String get errorInvalidEmailOrPassword => 'Geçersiz e-posta veya parola.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Geçersiz kullanıcı adı veya şifre.';

  @override
  String get errorUnableToSendResetLink =>
      'Sıfırlama bağlantısı gönderilemedi. Lütfen tekrar deneyin.';

  @override
  String get errorUnableToResetPassword =>
      'Parola sıfırlanamadı. Lütfen tekrar deneyin.';

  @override
  String get embedInviteJoin => 'Topluluğa katıl';

  @override
  String get embedInviteGoTo => 'Topluluğa git';

  @override
  String embedInviteOnline(String count) {
    return '$count Çevrimiçi';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Üye';
  }

  @override
  String get embedInviteUnknownTitle => 'Bilinmeyen davet';

  @override
  String get embedInviteUnknownSubtitle => 'Yeni bir davet istemeyi deneyin.';

  @override
  String get embedInviteUnavailable => 'Davet kullanılamıyor';

  @override
  String get embedInviteJoinGroup => 'Gruba katıl';

  @override
  String get embedInviteAlreadyJoined => 'Zaten katıldınız';

  @override
  String get embedInviteDisabled => 'Davetler devre dışı bırakıldı';

  @override
  String get embedInvitePaused => 'Bu topluluk için davetler duraklatıldı.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName olası bir baskın tespit ettiğinden, yeni kullanıcılar şu anda katılamaz.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Bu topluluk davetleri duraklattı. Daha sonra tekrar deneyebilirsiniz.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName, bu toplulukta olası bir baskın algıladı. Davetler duraklatıldı, bu nedenle yeni kullanıcılar şu anda katılamaz.';
  }

  @override
  String get inviteAcceptTitle => 'Katılmaya davet edildiniz';

  @override
  String get inviteAcceptJoinButton => 'Topluluğa katıl';

  @override
  String get inviteAcceptGoToButton => 'Topluluğa git';

  @override
  String get inviteAcceptInvitesPaused => 'Davetler duraklatıldı';

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
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Kanala erişim reddedildi';

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
  String get embedThemeWebOnly =>
      'Temaları yalnızca web veya masaüstünde içe aktarabilirsin.';

  @override
  String get embedThemeImport => 'Temayı içe aktar';

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
  String get embedGiftClaimHelp => 'Hediyenizi almak için tıklayın!';

  @override
  String get embedGiftAlreadyRedeemed => 'Zaten kullanıldı';

  @override
  String get embedGiftClaimAccountHelp =>
      'Bu hediyeyi kullanmak için hesabınızı sahiplenin.';

  @override
  String get embedGiftClaim => 'Hediyeyi al';

  @override
  String get embedGiftClaimed => 'Hediye alındı';

  @override
  String get embedGiftClaimAccount => 'Kullanmak için hesabı sahiplen';

  @override
  String get embedGiftUnknownTitle => 'Bilinmeyen hediye';

  @override
  String get embedGiftUnknownSubtitle =>
      'Bu hediye kodu geçersiz veya zaten alınmış.';

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
  String get privacySettings => 'Gizlilik ayarları';

  @override
  String get privacyDirectMessages => 'Doğrudan mesajlar';

  @override
  String get privacyDirectMessagesDescription =>
      'Bu topluluktaki diğer üyelerden doğrudan mesajlara izin ver';

  @override
  String get privacyBotDirectMessages => 'Bot doğrudan mesajları';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Bu topluluktaki botların size doğrudan mesaj göndermesine izin ver';

  @override
  String get privacyMutualDmsDisabled =>
      'Topluluk yöneticileri, bu toplulukta yalnızca karşılıklı üyelerden doğrudan mesaj alma özelliğini devre dışı bıraktı.';

  @override
  String get communityDebug => 'Topluluk hata ayıklaması';

  @override
  String get copiedToClipboard => 'Panoya kopyalandı';

  @override
  String get notificationSettings => 'Bildirim ayarları';

  @override
  String notificationMuteGuild(String guildName) {
    return '$guildName topluluğunu sessize al';
  }

  @override
  String get notificationMuteDescription =>
      'Bir topluluğu susturmak, siz etiketlenmediğiniz sürece okunmamış göstergelerin ve bildirimlerin görünmesini engeller';

  @override
  String get notificationCommunitySettings => 'Topluluk bildirim ayarları';

  @override
  String get notificationAllMessages => 'Tüm mesajlar';

  @override
  String get notificationOnlyMentions => 'Yalnızca bahsetmeler';

  @override
  String get notificationNothing => 'Hiçbiri';

  @override
  String get notificationSuppressEveryone =>
      '@everyone ve @here etiketlerini bastır';

  @override
  String get notificationSuppressRoles => 'Tüm Rol @bahsetmelerini Engelle';

  @override
  String get notificationMobilePush => 'Mobil anlık bildirimler';

  @override
  String get notificationOverrides => 'Bildirim geçersiz kılmaları';

  @override
  String get notificationSelectChannel => 'Bir kanal veya kategori seçin';

  @override
  String get notificationOnlyAtMentions => 'Yalnızca @bahsetmeler';

  @override
  String get notificationMuteChannel => 'Kanalı sessize al';

  @override
  String get notificationUnmuteChannel => 'Kanalı sessizden çıkar';

  @override
  String get notificationUseCategoryDefault => 'Kategori varsayılanını kullan';

  @override
  String get notificationUseCommunityDefault => 'Topluluk Varsayılanını Kullan';

  @override
  String get notificationNoCategory => 'Kategori yok';

  @override
  String get dmMarkAsRead => 'Okundu olarak işaretle';

  @override
  String get dmMuteConversation => 'DM\'i sessize al';

  @override
  String get dmUnmuteConversation => 'DM\'i sessizden çıkar';

  @override
  String get dmPinDm => 'DM\'i sabitle';

  @override
  String get dmUnpinDm => 'DM\'in sabitlemesini kaldır';

  @override
  String get dmAlwaysShowInSidebar => 'Her Zaman Kenar Çubuğunda Göster';

  @override
  String get dmRemoveFromAlwaysShown => 'Her Zaman Gösterilenden Kaldır';

  @override
  String get dmCloseDm => 'DM\'i kapat';

  @override
  String get dmCloseDmConfirmTitle => 'DM\'i kapat';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return '$username ile DM\'nizi kapatmak istediğinizden emin misiniz? Daha sonra her zaman yeniden açabilirsiniz.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Bu sohbetteki mesajlarınızı silmek istiyor musunuz?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Bu işlem, bu sohbette gönderdiğiniz tüm mesajları kalıcı olarak siler. Bu işlem geri alınamaz.';

  @override
  String get dmCopyChannelId => 'Kanal kimliğini kopyala';

  @override
  String get dmChannelIdCopied => 'Kanal kimliği kopyalandı';

  @override
  String get dmCopyUserId => 'Kullanıcı kimliğini kopyala';

  @override
  String get dmUserIdCopied => 'Kullanıcı kimliği kopyalandı';

  @override
  String get dmViewProfile => 'Profili görüntüle';

  @override
  String get dmVoiceCall => 'Sesli arama başlat';

  @override
  String get incomingVoiceCallTitle => 'Gelen sesli arama';

  @override
  String get incomingVoiceCallAccept => 'Kabul Et';

  @override
  String get incomingVoiceCallDecline => 'Reddet';

  @override
  String get incomingVoiceCallLabel => 'Gelen arama';

  @override
  String get incomingVoiceCallIgnore => 'Yok say';

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
  String get dmAddNote => 'Not ekle';

  @override
  String get dmEditGroup => 'Grubu düzenle';

  @override
  String get dmInviteToCommunity => 'Topluluğa davet et';

  @override
  String get dmBlock => 'Engelle';

  @override
  String get dmLeaveGroup => 'Gruptan ayrıl';

  @override
  String dmInviteSentFor(String communityName) {
    return '$communityName için davet gönderildi';
  }

  @override
  String get dmInviteSendFailed => 'Davet gönderilemedi. Tekrar deneyin.';

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
  String get dmMuteForever => 'Ben tekrar açana kadar';

  @override
  String get dmPinGroupDm => 'Grup DM\'ini sabitle';

  @override
  String get dmUnpinGroupDm => 'Grup DM\'inin sabitlemesini kaldır';

  @override
  String get dmUnnamedGroup => 'Adsız grup';

  @override
  String dmOwnersGroup(String resolvedName) {
    return '$resolvedName grubu';
  }

  @override
  String get dmFavoriteDm => 'DM\'i favorilere ekle';

  @override
  String get dmUnfavoriteDm => 'DM\'i favorilerden kaldır';

  @override
  String get dmFavoriteGroupDm => 'Grup DM\'ini favorilere ekle';

  @override
  String get dmUnfavoriteGroupDm => 'Grup DM\'ini favorilerden kaldır';

  @override
  String get dmChangeFriendNickname => 'Arkadaş takma adını değiştir';

  @override
  String get dmRemoveFriend => 'Arkadaşlıktan çıkar';

  @override
  String get dmAddFriend => 'Arkadaş ekle';

  @override
  String get dmAcceptFriendRequest => 'Arkadaşlık isteğini kabul et';

  @override
  String get dmIgnoreFriendRequest => 'Arkadaşlık isteğini yok say';

  @override
  String get dmFriendRequestSent => 'Arkadaşlık isteği gönderildi';

  @override
  String get dmUnblock => 'Engeli kaldır';

  @override
  String get dmDebugUser => 'Kullanıcıda hata ayıkla';

  @override
  String get dmDebugChannel => 'Kanalda hata ayıkla';

  @override
  String get dmDebugCategory => 'Ayıklama Kategorisi';

  @override
  String get dmPinned => 'DM sabitlendi';

  @override
  String get dmUnpinned => 'DM\'in sabitlemesi kaldırıldı';

  @override
  String get dmMuted => 'Sessize Alınmış DM';

  @override
  String get dmUnmuted => 'Sessizliği Kaldırılmış DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'Arkadaşlıktan çıkar';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return '$username adlı arkadaşını kaldırmak istediğinden emin misin?';
  }

  @override
  String get dmBlockConfirmTitle => 'Kullanıcıyı engelle';

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
  String get dmAddFriends => 'Arkadaş ekle';

  @override
  String get addFriendSheetTitle => 'Arkadaş ekle';

  @override
  String get addFriendUsernameHint => 'KullanıcıAdı#0000';

  @override
  String get addFriendUsernameLabel => 'Arkadaşınızın kullanıcı adı';

  @override
  String get addFriendSendRequest => 'İstek gönder';

  @override
  String get addFriendNoUserFound =>
      'Bu kullanıcı adıyla bir kullanıcı bulunamadı.';

  @override
  String get addFriendInvalidUsername =>
      'Geçerli bir kullanıcı adı girin (KullanıcıAdı#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Arkadaşlık isteği gönderildi';

  @override
  String get addFriendClaimTitle => 'Hesabınızı sahiplenin';

  @override
  String get addFriendClaimDescription =>
      'Arkadaşlık isteği göndermek için hesabınızı sahiplenin.';

  @override
  String get addFriendVerifyTitle => 'E-postanızı doğrulayın';

  @override
  String get addFriendVerifyDescription =>
      'Arkadaşlık isteği göndermeden önce e-posta adresinizi doğrulamanız gerekiyor.';

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
  String get addFriendViewProfile => 'Profili görüntüle';

  @override
  String get addFriendAccept => 'Kabul Et';

  @override
  String get addFriendIgnore => 'Yok say';

  @override
  String get addFriendAcceptTitle => 'Arkadaşlık isteğini kabul et';

  @override
  String get addFriendIgnoreTitle => 'Arkadaşlık isteğini yok say';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return '$userName adlı kişiden gelen arkadaşlık isteği kabul edilsin mi?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return '$displayName adlı kişiden gelen arkadaşlık isteği yok sayılsın mı?';
  }

  @override
  String get addFriendCancelRequest => 'İsteği iptal et';

  @override
  String get addFriendCancelRequestFailed =>
      'Arkadaşlık isteği iptal edilemedi. Tekrar deneyin.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Şu anda arkadaşlık isteği kabul etmiyor.';

  @override
  String get addFriendUnblockFirst =>
      'Arkadaşlık isteği göndermek için önce engeli kaldırın.';

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
  String get emojiSearchPlaceholder => 'Hayallerindeki emojiyi bul';

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
  String get emojiInfoRemoveFromFavorites => 'Favorilerden kaldır';

  @override
  String get emojiFrequentlyUsed => 'Sık kullanılanlar';

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
  String get gifPickerNoResultsTitle => 'Arama sonucu bulunamadı';

  @override
  String get gifPickerNoResultsDescription => 'Başka bir arama terimi deneyin';

  @override
  String get gifPickerLoadFailedTitle => 'GIF\'ler Yüklenemedi';

  @override
  String get gifPickerLoadFailedBody =>
      'Bağlantınızı kontrol edin ve tekrar deneyin.';

  @override
  String get emojiCategoryPeople => 'Kişiler';

  @override
  String get emojiCategoryNature => 'Doğa';

  @override
  String get emojiCategoryFood => 'Yiyecek ve içecek';

  @override
  String get emojiCategoryActivity => 'Etkinlikler';

  @override
  String get emojiCategoryTravel => 'Seyahat ve yerler';

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
  String get emojiPlutoniumUpsellDismiss => 'Bunu bir daha gösterme';

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
  String get externalLinkWarningTitle => 'Harici bağlantı uyarısı';

  @override
  String externalLinkWarningLeaving(String productName) {
    return '$productName uygulamasından ayrılmak üzeresiniz';
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
  String get externalLinkVisitSite => 'Siteyi ziyaret et';

  @override
  String get externalLinkTrustAllLabel => 'Tüm harici bağlantılara güven';

  @override
  String get externalLinkStripTrackingLabel =>
      'URL\'lerden izleme parametrelerini kaldır';

  @override
  String get externalLinkStripTrackingDescription =>
      'Gönderdiğiniz mesajlardaki URL\'lerden izleme parametrelerini (utm_source, fbclid, gclid gibi) otomatik olarak kaldırın. Bağlantıyı başkalarına ulaşmadan önce temizler.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Tüm harici bağlantılara güvenilsin mi?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Bu işlem, tüm harici bağlantılara güvenecek ve her alan adı için uyarıyı atlayacaktır. Mevcut güvenilir alan adlarınız değiştirilecektir. Bu daha az güvenlidir.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Tümüne güven';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Tüm bağlantılara artık güvenilmesin mi?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Harici bağlantı uyarıları tekrar gösterilecek. Güvenilen alan adlarını tek tek eklemeniz gerekecek.';

  @override
  String get externalLinkStopTrustingAllAction => 'Tümüne güvenmeyi kapat';

  @override
  String get externalLinkTrustedAllDescription =>
      'Tüm harici bağlantılar güvenilir kabul edilir. Uyarı gösterilmez.';

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
  String get cropAvatar => 'Avatarı kırp';

  @override
  String get cropBanner => 'Banner\'ı kırp';

  @override
  String get skip => 'Atla';

  @override
  String get crop => 'Kırp';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'Kullanıcı adınızı değiştirin';

  @override
  String get fluxerTagDescriptionBase =>
      'Kullanıcı adları yalnızca harf (a-z, A-Z), rakam (0-9) ve alt çizgi içerebilir. Kullanıcı adlarında büyük/küçük harf duyarlılığı yoktur.';

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
      'Yalnızca harfler (a-z, A-Z), rakamlar (0-9) ve alt çizgi (_)';

  @override
  String get fluxerTagAlreadyTaken => 'Kullanıcı adı zaten alınmış';

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
  String get fluxerTagUpdated => 'Kullanıcı adı güncellendi';

  @override
  String get fluxerTagUpdateFailed =>
      'Kullanıcı Adı güncellenemedi. Lütfen tekrar deneyin.';

  @override
  String get continueAction => 'Devam et';

  @override
  String get profileCustomizationTitle => 'Profil özelleştirme';

  @override
  String get profileCustomizationDescription =>
      'Profil görünümünüzü düzenleyin ve canlı önizlemesini görün';

  @override
  String get usernameLabel => 'Kullanıcı adı';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Kullanıcı adınızı değiştirmek için hesabınızı sahiplenin';

  @override
  String get changeFluxerTag => 'Kullanıcı adını değiştir';

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
  String get displayNameLabel => 'Görünen ad';

  @override
  String get pronounsLabel => 'Zamirler';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Avatarı değiştir';

  @override
  String get removeAvatar => 'Profil fotoğrafını kaldır';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maksimum 10MB. Önerilen: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Banner\'ı değiştir';

  @override
  String get removeBanner => 'Banner\'ı kaldır';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maksimum 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Vurgu rengi';

  @override
  String get accentColorDescription =>
      'Profilinizdeki kenarlık ve banner rengini özelleştirir';

  @override
  String get aboutMeLabel => 'Hakkımda';

  @override
  String get aboutMeHelperText =>
      'Bağlantı, emoji ve Markdown kullanabilirsiniz.';

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
      'Visionary\'yi abonelik olarak maskele';

  @override
  String get maskVisionaryDescription =>
      'Visionary rozetini normal abonelik olarak göster';

  @override
  String get hideVisionaryIdBadge => 'Visionary kimlik rozetini gizle';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Visionary Kimlik Rozetini Gizle (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription =>
      'Visionary kimlik rozetinizi kaldırın';

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
    return '$productName üyeliği başlangıcı';
  }

  @override
  String get unclaimedAccountTitle => 'Sahiplenilmemiş hesap';

  @override
  String get unclaimedAccountDescription =>
      'Hesabın henüz talep edilmedi. E-posta ve şifre olmadan erişimi kaybedebilirsin. Hesabını güvence altına almak için hemen talep et.';

  @override
  String get claimAccount => 'Hesabı sahiplen';

  @override
  String get profileTypeLabel => 'Profil türü';

  @override
  String get profileTypeGlobal => 'Genel profil';

  @override
  String get profileTypeGuildDescription =>
      'Topluluğa özel profilinizi düzenliyorsunuz. Bu profil yalnızca bu toplulukta görünür olacak ve genel profilinizin yerine geçecektir.';

  @override
  String get communityNicknameLabel => 'Topluluk takma adı';

  @override
  String get perGuildPremiumUpsellText =>
      'Toplulukları özelleştirmek için Plutonium gerekir. Topluluk takma adı ve zamirleri herkes için ücretsizdir.';

  @override
  String get avatarModeInherit => 'Genel profili kullan';

  @override
  String get avatarModeCustom => 'Özel görsel kullan';

  @override
  String get avatarModeUnset => 'Gösterme';

  @override
  String get profileSavedToast => 'Profil güncellendi';

  @override
  String get sudoTitle => 'Kimliğini Doğrula';

  @override
  String get sudoDescription =>
      'Bu işlem devam etmek için doğrulama gerektirir.';

  @override
  String get sudoAuthenticatorCode => 'Kimlik doğrulayıcı kodu';

  @override
  String get sudoMethodPassword => 'Parola';

  @override
  String get sudoMethodTotp => 'Kimlik doğrulayıcı';

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
  String get securityLoginEmailAddressLabel => 'E-posta adresi';

  @override
  String get securityLoginNoEmailSet => 'E-posta adresi ayarlanmadı';

  @override
  String get securityLoginChangeEmail => 'E-postayı değiştir';

  @override
  String get securityLoginAddEmail => 'E-posta ekle';

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
  String get securityLoginNoPasswordSet => 'Parola belirlenmedi';

  @override
  String get securityLoginChangePassword => 'Parolayı değiştir';

  @override
  String get securityLoginSetPassword => 'Parola belirle';

  @override
  String get passwordChangeTitle => 'Parolayı değiştir';

  @override
  String get passwordChangeIntroDescription =>
      'Parolanı değiştirmeden önce kimliğini doğrulamak için e-posta adresine bir doğrulama kodu göndereceğiz.';

  @override
  String get passwordChangeStart => 'Başla';

  @override
  String get passwordChangeVerifyTitle => 'E-postanızı doğrulayın';

  @override
  String get passwordChangeVerifyDescription =>
      'E-posta adresine gönderilen doğrulama kodunu gir.';

  @override
  String get passwordChangeVerificationCode => 'Doğrulama kodu';

  @override
  String get passwordChangeVerify => 'Doğrula';

  @override
  String get passwordChangeNewPasswordTitle => 'Yeni parola belirle';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Aşağıya yeni parolanı gir.';

  @override
  String get passwordChangeNewPassword => 'Yeni parola';

  @override
  String get passwordChangeConfirmPassword => 'Yeni parolayı onayla';

  @override
  String get passwordChangeSubmit => 'Parolayı değiştir';

  @override
  String get passwordChangeSuccess => 'Parola değiştirildi';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Parolalar eşleşmiyor';

  @override
  String get passwordChangeInvalidCode => 'Geçersiz veya süresi dolmuş kod';

  @override
  String get emailChangeTitle => 'E-postayı değiştir';

  @override
  String get emailChangeIntroDescription =>
      'E-posta adresinizi değiştirmeden önce kimliğinizi doğrulamak için doğrulama kodları göndereceğiz.';

  @override
  String get emailChangeStart => 'Başla';

  @override
  String get emailChangeVerifyOriginalTitle => 'Mevcut E-postayı Doğrula';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Mevcut e-posta adresinize gönderilen doğrulama kodunu girin.';

  @override
  String get emailChangeNewEmailTitle => 'Yeni e-posta adresini girin';

  @override
  String get emailChangeNewEmailDescription =>
      'Kullanmak istediğiniz yeni e-posta adresini girin.';

  @override
  String get emailChangeNewEmailLabel => 'Yeni e-posta';

  @override
  String get emailChangeNewEmailSubmit => 'Doğrulama kodu gönder';

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
  String get resend => 'Tekrar gönder';

  @override
  String resendCountdown(int seconds) {
    return 'Yeniden Gönder (${seconds}s)';
  }

  @override
  String get verificationCode => 'Doğrulama kodu';

  @override
  String get verify => 'Doğrula';

  @override
  String get enable => 'Etkinleştir';

  @override
  String get disable => 'Devre dışı bırak';

  @override
  String get delete => 'Sil';

  @override
  String get save => 'Kaydet';

  @override
  String get securityTfaSectionTitle => 'İki faktörlü kimlik doğrulama';

  @override
  String get securityTfaSectionDescription =>
      'Hesabınıza ek bir güvenlik katmanı ekleyin';

  @override
  String get securityTfaAuthenticatorApp => 'Kimlik Doğrulama Uygulaması';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'İki faktörlü kimlik doğrulama açık';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'İki faktörlü kimlik doğrulama kodları oluşturmak için bir kimlik doğrulayıcı uygulama kullanın';

  @override
  String get securityTfaBackupCodes => 'Yedek kodlar';

  @override
  String get securityTfaBackupCodesDescription =>
      'Hesap kurtarma yedek kodlarınızı görüntüleyin ve yönetin';

  @override
  String get securityTfaViewCodes => 'Kodları görüntüle';

  @override
  String get securityPasskeysSectionTitle => 'Geçiş anahtarları';

  @override
  String get securityPasskeysSectionDescription =>
      'Parolasız oturum açma ve iki faktörlü kimlik doğrulama için parola anahtarlarını kullanın';

  @override
  String get securityPasskeysRegistered => 'Kayıtlı geçiş anahtarları';

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
  String get securityPasskeysAdd => 'Geçiş anahtarı ekle';

  @override
  String securityPasskeysAdded(String date) {
    return 'Eklendi: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Son kullanma: $date';
  }

  @override
  String get securityPasskeysRename => 'Yeniden adlandır';

  @override
  String get securityPasskeysDeleteTitle => 'Geçiş anahtarını sil';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Parola anahtarı \"$name\"yi silmek istediğinizden emin misiniz?';
  }

  @override
  String get securityPasskeyNameTitle => 'Geçiş anahtarını adlandır';

  @override
  String get securityPasskeyNameLabel => 'Geçiş anahtarı adı';

  @override
  String get securityPasskeyNameHint => 'örn. YubiKey, iPhone, iş bilgisayarı';

  @override
  String get securityClaimTitle => 'Güvenlik özellikleri';

  @override
  String get securityClaimDescription =>
      'İki faktörlü kimlik doğrulama ve geçiş anahtarları gibi güvenlik özelliklerine erişmek için hesabınızı sahiplenin.';

  @override
  String get securityVerifyEmailRequired =>
      'İki faktörlü kimlik doğrulamayı veya parolaları ayarlamadan önce e-posta adresinizi doğrulamanız gerekir.';

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
  String get totpDisableTitle => 'Kimlik doğrulayıcı uygulamayı kaldır';

  @override
  String get totpDisableDescription =>
      'İki faktörlü kimlik doğrulamayı devre dışı bırakmak için kimlik doğrulama uygulamanızdan 6 haneli kodu girin.';

  @override
  String get totpDisableSuccess =>
      'İki faktörlü kimlik doğrulama devre dışı bırakıldı';

  @override
  String get backupCodesTitle => 'Yedek kodlar';

  @override
  String get backupCodesWarning =>
      'Kimlik doğrulama uygulamanıza erişimi kaybederseniz ve bu kodlara sahip değilseniz, hesabınızdan kalıcı olarak engellenirsiniz. Şimdi indirin veya kopyalayın ve güvenli bir yere saklayın.';

  @override
  String get backupCodesCopy => 'Kopyala';

  @override
  String get backupCodesCopied => 'Yedek kodlar panoya kopyalandı';

  @override
  String get backupCodesAcknowledge =>
      'Yedek kodlarımı indirdim veya kopyaladım ve güvenli bir yere sakladım.';

  @override
  String get backupCodesDone => 'Bitti';

  @override
  String get dangerZoneSectionTitle => 'Tehlike bölgesi';

  @override
  String get dangerZoneSectionDescription => 'Geri alınamaz ve yıkıcı eylemler';

  @override
  String get dangerZoneDisableTitle => 'Hesabı devre dışı bırak';

  @override
  String get dangerZoneDisableDescription =>
      'Hesabınızı geçici olarak devre dışı bırakın. Daha sonra tekrar giriş yaparak yeniden etkinleştirebilirsiniz.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Hesabınızı devre dışı bırakmak sizi tüm oturumlardan çıkaracaktır. Tekrar giriş yaparak hesabınızı istediğiniz zaman yeniden etkinleştirebilirsiniz.';

  @override
  String get dangerZoneDeleteTitle => 'Hesabı sil';

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
      'Sahibi olduğunuz topluluklar varken hesabınızı silemezsiniz. Önce aşağıdaki toplulukların sahipliğini devredin:';

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
      'Hesabınızı silmek istediğinizden emin misiniz? Bu işlem, hesabınızın kalıcı olarak silinmesini planlayacaktır.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Silme işlemini 14 gün içinde iptal edebilirsiniz';

  @override
  String get dangerZoneDeleteBullet2 =>
      '14 gün sonra hesabınız kalıcı olarak silinecek';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Silme işlemi tamamlandığında hesabınıza tekrar erişemezsiniz';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Hesabınız silindikten sonra gönderdiğiniz mesajları silemezsiniz';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Verilerinizi dışa aktarmak veya önce mesajlarınızı silmek istiyorsanız, devam etmeden önce Lütfen Kullanıcı Ayarlarındaki Gizlilik Paneli bölümünü ziyaret edin.';

  @override
  String get claimAccountTitle => 'Hesabınızı sahiplenin';

  @override
  String get claimAccountDescription =>
      'E-posta ve parola ekleyerek hesabınızı sahiplenin. Bitirmeden önce e-postanızı onaylamak için bir doğrulama kodu göndereceğiz.';

  @override
  String get claimAccountEmailLabel => 'E-posta';

  @override
  String get claimAccountPasswordLabel => 'Parola';

  @override
  String get claimAccountSendCode => 'Kod gönder';

  @override
  String get claimAccountVerifyDescription =>
      'E-postanızı doğrulamak için size gönderdiğimiz kodu girin. Kod onaylandıktan sonra parolanız ayarlanacaktır.';

  @override
  String get claimAccountSuccess => 'Hesap başarıyla sahiplenildi';

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
  String get authorizedAppsTitle => 'Yetkili uygulamalar';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Bu uygulamalara $productName hesabınıza erişim izni verilmiştir.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Yetkili uygulama yok';

  @override
  String get authorizedAppsEmptyDescription =>
      'Hesabınıza erişmesi için henüz hiçbir uygulamaya yetki vermediniz.';

  @override
  String get authorizedAppsLoadError => 'Yetkili uygulamalar yüklenemedi';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return '$date tarihinde yetkilendirildi';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Verilen izinler';

  @override
  String get authorizedAppsRevoke => 'İptal et';

  @override
  String get authorizedAppsRevokeTitle => 'Uygulama erişimini iptal et';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Bu uygulamanın erişimini iptal etmek istediğinizden emin misiniz $appName? Bu uygulama artık hesabınıza erişemeyecek.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Temel profil bilgilerinize (kullanıcı adı, avatar vb.) erişme';

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
      'İstenen izinlerle bir topluluğa bot ekleme';

  @override
  String get authorizedAppsScopeAdmin => 'Yönetici uç noktalarına erişin';

  @override
  String get applicationsTitle => 'Uygulamalar';

  @override
  String get applicationsCreate => 'Uygulama oluştur';

  @override
  String get applicationsCreateSubmit => 'Oluştur';

  @override
  String get applicationsCreateClaimTooltip =>
      'Uygulama oluşturmak için hesabınızı sahiplenin.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Belgeleri oku ($domain)';
  }

  @override
  String get applicationsLoadError => 'Uygulamalar yüklenemedi';

  @override
  String get applicationsLoadErrorDescription =>
      'Bağlantınızı kontrol edin ve tekrar deneyin.';

  @override
  String get applicationsEmptyTitle => 'Henüz uygulama yok';

  @override
  String applicationsEmptyDescription(String apiName) {
    return '$apiName ile başlamak için ilk uygulamanızı oluşturun.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Oluşturulma tarihi: $date';
  }

  @override
  String get applicationsName => 'Uygulama adı';

  @override
  String get applicationsNameHint => 'Uygulamam';

  @override
  String get applicationsNameRequired => 'Uygulama adı gerekli';

  @override
  String get applicationsBackToList => 'Listeye geri dön';

  @override
  String get applicationsDetailLoadError => 'Bu uygulama yüklenemedi';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Tekrar deneyin veya uygulamalar listesine geri dönün.';

  @override
  String get applicationsId => 'Uygulama kimliği';

  @override
  String get applicationsCopyId => 'Kimliği kopyala';

  @override
  String get applicationsSecretsTitle => 'Gizli anahtarlar ve belirteçler';

  @override
  String get applicationsSecretsDescription =>
      'Bunları güvende tutun. Yeniden oluşturmak mevcut entegrasyonları bozacaktır.';

  @override
  String get applicationsClientSecret => 'İstemci gizli anahtarı';

  @override
  String get applicationsBotToken => 'Bot belirteci';

  @override
  String get applicationsRegenerate => 'Yeniden oluştur';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'İstemci gizli anahtarı yeniden oluşturulsun mu?';

  @override
  String get applicationsRegenerateBotTokenTitle =>
      'Bot belirteci yeniden oluşturulsun mu?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Yeniden oluşturmak mevcut gizli anahtarı geçersiz kılar. Eski değeri kullanan tüm kodları güncelleyin.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Yeniden oluşturmak mevcut belirteci geçersiz kılar. Eski değeri kullanan tüm kodları güncelleyin.';

  @override
  String get applicationsClientSecretRegenerated =>
      'İstemci gizli anahtarı yeniden oluşturuldu. Eski gizli anahtarı kullanan tüm kodları güncelleyin.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Bot belirteci yeniden oluşturuldu. Eski belirteci kullanan tüm kodları güncelleyin.';

  @override
  String get applicationsRegenerateFailed => 'Gizli anahtar yenilenemedi';

  @override
  String get applicationsInfoTitle => 'Uygulama bilgileri';

  @override
  String get applicationsInfoDescription =>
      'Temel ayarlar ve izin verilen yönlendirme URI\'leri.';

  @override
  String get applicationsPublicBot => 'Herkese açık bot';

  @override
  String get applicationsPublicBotDescription =>
      'Herkesin bu botu topluluklarına davet etmesine izin ver.';

  @override
  String get applicationsRequireCodeGrant => 'OAuth2 kod izni gerektir';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Bu botu davet ederken bir yönlendirme URI\'si ve yetkilendirme kodu gerektirir.';

  @override
  String get applicationsRedirectUris => 'Yönlendirme URI\'leri';

  @override
  String get applicationsAddRedirect => 'Yönlendirme ekle';

  @override
  String get applicationsDeleteRedirect => 'Yönlendirme URI\'sini sil';

  @override
  String get applicationsBotProfileTitle => 'Bot profili';

  @override
  String get applicationsBotProfileDescription =>
      'Botunuzun avatarı, etiketi ve zengin profil detayları.';

  @override
  String get applicationsBotAvatar => 'Bot avatarı';

  @override
  String get applicationsUsernameRequired => 'Kullanıcı adı gerekli';

  @override
  String get applicationsUsernameTooLong =>
      'Kullanıcı adı en fazla 32 karakter olmalı';

  @override
  String get applicationsUsernameInvalid =>
      'Kullanıcı adı yalnızca harf, rakam ve alt çizgi içerebilir';

  @override
  String get applicationsBotUsername => 'Bot kullanıcı adı';

  @override
  String get applicationsDiscriminator => 'Etiket';

  @override
  String get applicationsBotBio => 'Bot biyografisi';

  @override
  String get applicationsBotBioHint => 'Harika şeyler yapan yardımcı bir bot!';

  @override
  String get applicationsNoBotBanner => 'Bot afişi yok';

  @override
  String get applicationsFriendlyBot => 'Arkadaş canlısı bot';

  @override
  String get applicationsFriendlyBotDescription =>
      'Kullanıcıların manuel onay için bu bota arkadaşlık isteği göndermesine izin ver.';

  @override
  String get applicationsManualFriendApproval =>
      'Manuel arkadaş onayı gerektir';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Bu bota gelen arkadaşlık isteklerinin manuel olarak onaylanması gerekir.';

  @override
  String get applicationsOauthBuilderTitle => 'OAuth2 URL oluşturucu';

  @override
  String get applicationsOauthBuilderDescription =>
      'Kapsamlar ve izinlerle bir yetkilendirme URL\'si oluşturun.';

  @override
  String get applicationsScopes => 'Kapsamlar';

  @override
  String get applicationsRedirectUri => 'Yönlendirme URI\'si';

  @override
  String get applicationsSelectRedirectUri => 'Yönlendirme URI\'si seçin';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'Bu bot OAuth2 kod izni gerektirdiğinden yönlendirme URI\'si zorunludur.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'Yalnızca bot kapsamı kullanılmadığında yönlendirme URI\'si gereklidir.';

  @override
  String get applicationsBotPermissions => 'Bot izinleri';

  @override
  String get applicationsAuthorizeUrl => 'Yetkilendirme URL\'si';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Kapsamları seçin (ve gerekirse yönlendirme URI\'sini)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Yetkilendirme URL\'sini kopyala';

  @override
  String get applicationsCopiedUrl => 'URL panoya kopyalandı';

  @override
  String get applicationsDangerTitle => 'Tehlike bölgesi';

  @override
  String get applicationsDangerSubtitle =>
      'Bu işlem geri alınamaz. Uygulamayı kaldırmak, botunu da siler.';

  @override
  String get applicationsDangerHelper =>
      'Uygulama ve kimlik bilgileri silindikten sonra kalıcı olarak kaldırılır.';

  @override
  String get applicationsDelete => 'Uygulamayı sil';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return '$name uygulamasını silmek istediğinizden emin misiniz? Bu eylem geri alınamaz. Bot kullanıcısı dahil olmak üzere ilgili tüm veriler kalıcı olarak silinecektir.';
  }

  @override
  String get applicationsDeleteFailed => 'Uygulama silinemedi';

  @override
  String get applicationsUpdated => 'Uygulama başarıyla güncellendi';

  @override
  String get applicationsNoChanges => 'Kaydedilecek değişiklik yok';

  @override
  String get applicationsSearchBots => 'Uygulamalar ve botlar';

  @override
  String get applicationsSearchBotsDescription =>
      'Hesabınız için uygulama ve bot oluşturun ve yönetin';

  @override
  String get applicationsSearchInfoDescription =>
      'Uygulama temel bilgilerini ve yönlendirme URI\'lerini düzenle';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Bot avatarını, etiketini, biyografisini, banner\'ını ve arkadaşlık isteği davranışını düzenle';

  @override
  String get applicationsSearchOauthDescription =>
      'Kapsamlar, yönlendirmeler ve bot izinleriyle bir yetkilendirme URL\'si oluşturun';

  @override
  String get applicationsSearchSecretsDescription =>
      'İstemci gizli anahtarlarını ve bot belirteçlerini görüntüleyin ve yeniden oluşturun';

  @override
  String get applicationsSearchBotsKeyword => 'Botlar';

  @override
  String get applicationsSearchDocumentation => 'Belgeler';

  @override
  String get blockedUsersTitle => 'Engellenen kullanıcılar';

  @override
  String get blockedUsersDescription =>
      'Engellenen kullanıcılar size arkadaşlık isteği gönderemez veya doğrudan mesaj atamaz.';

  @override
  String get blockedUsersEmptyTitle => 'Engellenen kullanıcı yok';

  @override
  String get blockedUsersEmptyDescription => 'Henüz kimseyi engellemediniz.';

  @override
  String get blockedUsersLoadError => 'Engellenen Kullanıcılar Yüklenemedi';

  @override
  String get blockedUsersUnblock => 'Engeli kaldır';

  @override
  String get blockedUsersUnblockTitle => 'Kullanıcının engelini kaldır';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Kullanıcının engelini kaldırmak istediğinizden emin misiniz $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Kullanıcı adını kopyala';

  @override
  String get blockedUsersCopyId => 'Kullanıcı kimliğini kopyala';

  @override
  String get userProfileLoadError => 'Profil yüklenemedi';

  @override
  String get userProfileLoading => 'Profil yükleniyor';

  @override
  String get userProfileRetry => 'Tekrar Dene';

  @override
  String get userProfileMessage => 'Mesaj';

  @override
  String get userProfileVoiceCall => 'Sesli arama';

  @override
  String get userProfileVideoCall => 'Görüntülü arama';

  @override
  String get userProfileEditProfile => 'Profili düzenle';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return '$productName Çalışanı';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return '$productName Topluluk Ekibi';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return '$productName İş Ortağı';
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
    return '$productName Visionary';
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
    return 'Ortak arkadaşlar ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Ortak topluluklar ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Ortak arkadaşlar';

  @override
  String get userProfileMutualCommunitiesTitle => 'Ortak topluluklar';

  @override
  String get userProfileNoMutualFriends => 'Ortak arkadaş bulunamadı.';

  @override
  String get userProfileNoMutualCommunities => 'Ortak topluluk bulunamadı.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Takma ad: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'DM aç';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return '$username kişisini engellediniz. Onları engelini kaldırmadığınız sürece mesaj gönderemezsiniz.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Engeli kaldır';

  @override
  String get userProfileOpenDm => 'DM aç';

  @override
  String get userProfileNoteTitle => 'Not';

  @override
  String get userProfileNoteVisibility => '(yalnızca siz görebilirsiniz)';

  @override
  String get userProfileNoteSave => 'Kaydet';

  @override
  String get userProfileNoteDelete => 'Sil';

  @override
  String get userProfileMemberSince => 'Üye olma tarihi';

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
    return 'Henüz rol yok. Rolleri $rolesSettingsPath bölümünden ekleyin';
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
  String get memberRolesConfirmOk => 'Tamam';

  @override
  String get userProfileLocalTime => 'Yerel saat';

  @override
  String get profileLocalTimeSettingsTitle => 'Profil yerel saati';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Zaman diliminizi bir kez ayarlayın, böylece yaz saati uygulaması değiştiğinde $productName UTC ofsetinizi güncel tutabilsin. Diğer kişiler yalnızca UTC ofsetinizi görebilir, tam zaman dilimi tanımlayıcınızı değil.';
  }

  @override
  String get profileLocalTimeEditButton => 'Profil yerel saatini düzenle';

  @override
  String get profileLocalTimeTimezoneLabel => 'Saat dilimi';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Profil yerel saatiniz için UTC ofsetinizi hesaplarken $productName uygulamasının kullanacağı zaman dilimini seçin.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Saat dilimlerini ara';

  @override
  String get profileLocalTimeNotSet => 'Ayarlanmadı';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Profil yerel saatinizi paylaşmayı seçtiğinizde diğer kişiler yalnızca mevcut UTC ofsetinizi görebilir. $timezoneIdentifierExample gibi tam zaman dilimi tanımlayıcınızı görmezler. $productName, bu tanımlayıcıyı yalnızca yaz saati değiştiğinde ofsetin otomatik olarak güncellenebilmesi için saklar.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Herkes';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Profilinizin tamamını görüntüleyebilen herkesin yerel saatinizi görmesine izin verin';

  @override
  String get profileLocalTimePrivacyFriends => 'Arkadaşlar';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Arkadaşlarınızın yerel saatinizi görmesine izin ver';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Topluluk üyeleri';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Üyesi olduğunuz topluluklardaki üyelerin yerel saatinizi görmesine izin ver';

  @override
  String get userProfileSameTimeAsYou => 'Sizinle aynı saat diliminde';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'Sizden $duration ileride';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'Sizden $duration geride';
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
  String get userProfileCopyUsername => 'Kullanıcı adını kopyala';

  @override
  String get userProfileCopyUserId => 'Kullanıcı kimliğini kopyala';

  @override
  String get userProfileViewMainProfile => 'Ana Profili Görüntüle';

  @override
  String get userProfileViewCommunityProfile => 'Topluluk profilini görüntüle';

  @override
  String get userProfileBlockUser => 'Kullanıcıyı engelle';

  @override
  String get userProfileUnblockUser => 'Kullanıcının engelini kaldır';

  @override
  String get userProfileRemoveFriend => 'Arkadaşlıktan çıkar';

  @override
  String get userProfileBlockConfirmTitle => 'Kullanıcıyı engelle';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return '$username kişisini engellemek istediğinizden emin misiniz?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Kullanıcının engelini kaldır';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return '$username kişisinin engelini kaldırmak istediğinizden emin misiniz?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Arkadaşlıktan çıkar';

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
  String get userProfileTimeout => 'Zaman aşımı uygula';

  @override
  String get userProfileRemoveTimeout => 'Zaman aşımını kaldır';

  @override
  String get userProfileTransferOwnership => 'Sahipliği devret';

  @override
  String get userProfileReportMessage => 'Mesajı bildir';

  @override
  String get userProfileReportUserProfile => 'Profili bildir';

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
  String get userProfileBanDurationLabel => 'Yasaklama süresi';

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
  String get userProfileBanReasonHint => 'Yasaklama nedenini girin';

  @override
  String get userProfileBanSubmit => 'Üyeyi yasakla';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return '$username süresi doldu';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Zaman aşımı süresi';

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
  String get durationCustom => 'Özel…';

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
    return 'Burada olmana sevindik, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Hoş geldin, $username! Kendini evinde hisset.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Merhaba, $username! Aramıza hoş geldin.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Merhaba, $username! Hazır olduğunda katılabilirsin.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Selam $username, seni burada görmek harika!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Selam, $username! Umarız keyifli vakit geçirirsin.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Selam $username, aramıza hoş geldin!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Geldiğine sevindik, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'İçeri buyur, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Hoş geldin, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Hoş geldin, $username! Aramıza katıldığın için mutluyuz.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Hoş geldin, $username! Burada iyi vakit geçirmeni dileriz.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Hoş geldin, $username! Bir sonraki sohbetin burada başlıyor.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Hoş geldin, $username. Seni aramızda görmek güzel.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Seni görmek ne güzel, $username! Hoş geldin.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Buradasın, $username! Aramıza katıldığına sevindik.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Aramıza katıldın, $username! Haydi başlayalım.';
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
  String get linkedDevicesCurrentDevice => 'Mevcut cihaz';

  @override
  String get linkedDevicesOtherDevices => 'Diğer cihazlar';

  @override
  String get linkedDevicesEnterSelection => 'Seçim Moduna Gir';

  @override
  String get linkedDevicesExitSelection => 'Seçim Modundan Çık';

  @override
  String get linkedDevicesSelectAll => 'Tümünü seç';

  @override
  String get linkedDevicesClearSelection => 'Seçimi temizle';

  @override
  String get linkedDevicesRevokeTooltip => 'Cihazın erişimini iptal et';

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
  String get linkedDevicesLoadErrorTitle => 'Ağ hatası';

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
  String get linkedDevicesViewDetails => 'Ayrıntıları görüntüle';

  @override
  String get linkedDevicesDetailsTitle => 'Cihaz ayrıntıları';

  @override
  String get linkedDevicesDetailsDevice => 'Cihaz';

  @override
  String get linkedDevicesDetailsClient => 'İstemci';

  @override
  String get linkedDevicesDetailsLocation => 'Konum';

  @override
  String get linkedDevicesDetailsIp => 'IP adresi';

  @override
  String get linkedDevicesDetailsLastUsed => 'Son kullanım';

  @override
  String get linkedDevicesCurrentSession => 'Mevcut oturum';

  @override
  String get linkedDevicesUnknown => 'Bilinmiyor';

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
    return 'Yavaş mod $durationLabel olarak ayarlandı, ancak siz muafsınız.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Yavaş mod $durationLabel olarak ayarlandı. Başka bir mesaj göndermeden önce bekleyin.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Bu kanal için yavaş mod $durationLabel olarak ayarlandı.';
  }

  @override
  String get channelNoSendPermissionHint => 'Bu kanalda mesaj gönderemezsiniz.';

  @override
  String systemDmComposerBarrier(String productName) {
    return '$productName ekibinden sistem duyuruları. Buradan yanıt veremezsiniz.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Bu toplulukta mesajlaşma geçici olarak duraklatıldı.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Zaman aşımındasınız. Zaman aşımı süresi dolana kadar mesajlaşma, tepkiler ve sesli iletişim duraklatıldı.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Bu toplulukta mesaj göndermek için hesabınızı sahiplenmeniz gerekiyor.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Bu toplulukta mesaj göndermek için e-postanızı doğrulamanız gerekiyor.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Bu toplulukta mesaj göndermek için hesabınız çok yeni.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Mesaj gönderebilmek için bu topluluğa yeterince uzun süredir üye değilsiniz.';

  @override
  String get channelComposerBarrierVerifyEmail => 'E-postayı doğrula';

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
  String get voiceMessageTitle => 'Sesli mesaj';

  @override
  String get voiceMessageHoldHint =>
      'Kaydetmek için basılı tutun. Silmek için sürükleyin, kilitlemek için yukarı kaydırın veya göndermek için bırakın.';

  @override
  String get voiceMessageDiscard => 'Sesli mesajı sil';

  @override
  String get voiceMessageSend => 'Sesli mesaj gönder';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Kayıt başlatılamıyor. Mikrofon erişimine izin verin.';

  @override
  String get voiceMessageMicInUse =>
      'Sesli mesaj kaydetmek için sesli aramadan ayrıl.';

  @override
  String get voiceMessageRecordingFailed =>
      'Kayıt başarısız oldu. Tekrar deneyin.';

  @override
  String get voiceMessageSendFailed =>
      'Sesli mesaj gönderilemedi. Tekrar deneyin.';

  @override
  String get voiceMessagePlay => 'Oynat';

  @override
  String get voiceMessagePause => 'Duraklat';

  @override
  String get voiceMessageSeekForward => 'Sesli mesajı ileri sar';

  @override
  String get voiceMessageSeekBackward => 'Geri sar';

  @override
  String get chatAttachmentEditTitle => 'Eki düzenle';

  @override
  String get chatAttachmentFilenameLabel => 'Dosya adı';

  @override
  String get chatAttachmentDescriptionLabel => 'Açıklama';

  @override
  String get chatAttachmentDescriptionHint => 'İsteğe bağlı alt metin';

  @override
  String get chatAttachmentSpoilerLabel => 'Spoiler olarak işaretle';

  @override
  String get chatAttachmentRemove => 'Eki kaldır';

  @override
  String get chatAttachmentDownload => 'İndir';

  @override
  String get chatAttachmentDownloadedToast => 'Fotoğraflara kaydedildi';

  @override
  String get chatAttachmentDownloadFailedToast => 'Ek indirilemedi';

  @override
  String get chatAttachmentExpiredTooltip => 'Ek sona erdi';

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
  String get chatTextualPreviewLoadError => 'Önizleme yüklenemedi.';

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
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Spoiler\'ı göster';

  @override
  String get matureMediaRevealButton => 'Göster';

  @override
  String get matureMediaRevealHint => 'Görüntülemek için tıklayın';

  @override
  String get matureContentTitle => 'Yetişkinlere uygun içerik';

  @override
  String get matureCommunityTitle => 'Yetişkinlere özel topluluk';

  @override
  String get matureCategoryTitle => 'Yetişkinlere özel kategori';

  @override
  String get matureChannelTitle => 'Yetişkinlere özel kanal';

  @override
  String get communityContentWarningTitle => 'Topluluk içeriği uyarısı';

  @override
  String get categoryContentWarningTitle => 'Kategori içeriği uyarısı';

  @override
  String get channelContentWarningTitle => 'Kanal içeriği uyarısı';

  @override
  String get defaultContentWarningBody => 'Bu hassas içerik barındırıyor.';

  @override
  String get matureCommunityBody =>
      'Bu topluluk yetişkinlere yönelik içerik olarak işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureCategoryBody =>
      'Bu kategori yetişkinlere yönelik içerik olarak işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureChannelBody =>
      'Bu kanal yetişkinlere yönelik içerik olarak işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureVoiceChannelBody =>
      'Bu sesli kanal yetişkinlere yönelik içerik olarak işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureLinkChannelBody =>
      'Bu bağlantı kanalı yetişkinlere yönelik içerik olarak işaretlenmiştir ve bazı kullanıcılar için uygunsuz olabilecek materyaller içerebilir.';

  @override
  String get matureCommunityUnavailableBody =>
      'Bu yetişkinlere özel topluluk hesabınız için kullanılamıyor.';

  @override
  String get matureCategoryUnavailableBody =>
      'Bu yetişkinlere özel kategori hesabınız için kullanılamıyor.';

  @override
  String get matureChannelUnavailableBody =>
      'Bu yetişkinlere özel kanal hesabınız için kullanılamıyor.';

  @override
  String get matureContentProceedButton => 'Devam et';

  @override
  String get matureContentUnderstandButton => 'Anladım';

  @override
  String get matureContentOpenLinkButton => 'Bağlantıyı aç';

  @override
  String get sensitiveContentFriendDmLabel =>
      'Arkadaşlardan gelen doğrudan mesajlar';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Diğerlerinden gelen doğrudan mesajlar';

  @override
  String get sensitiveContentGuildLabel => 'Topluluk kanallarındaki mesajlar';

  @override
  String get sensitiveContentFilterShow => 'Göster';

  @override
  String get sensitiveContentFilterBlur => 'Bulanıklaştır';

  @override
  String get sensitiveContentFilterBlock => 'Engelle';

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
  String get connectionsAddDomain => 'Alan adı';

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
  String get connectionAddTitle => 'Bağlantı ekle';

  @override
  String get connectionTypeLabel => 'Bağlantı türü';

  @override
  String get connectionHandleLabel => 'Kullanıcı adı';

  @override
  String get connectionDomainLabel => 'Alan adı';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Bu bağlantı zaten mevcut.';

  @override
  String get connectionConnectBluesky => 'Bluesky ile Bağlan';

  @override
  String get connectionContinue => 'Devam et';

  @override
  String get connectionVerifyTitle => 'Bağlantıyı doğrula';

  @override
  String get connectionVerifyInstructions =>
      'Alan adı sahipliğini kanıtlamak için aşağıdaki kaydı kullanın.';

  @override
  String get connectionDnsRecordTitle => 'DNS TXT kaydı';

  @override
  String get connectionDnsHostLabel => 'Ana bilgisayar';

  @override
  String get connectionDnsValueLabel => 'Değer';

  @override
  String get connectionCopyHost => 'Sunucuyu kopyala';

  @override
  String get connectionCopyValue => 'Değeri kopyala';

  @override
  String get connectionCopied => 'Kopyalandı!';

  @override
  String get connectionTokenFileTitle => 'Belirteç dosyasını sun';

  @override
  String get connectionTokenFileDescription =>
      '**fluxer-verification** dosyasını indirip **.well-known** klasörünüze yerleştirin, böylece alan adını doğrulayabiliriz.';

  @override
  String get connectionTokenFileDownload =>
      'fluxer-verification dosyasını indir';

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
  String get connectionEditTitle => 'Bağlantıyı düzenle';

  @override
  String get connectionEditDescription =>
      'Bu bağlantıyı profilinizde kimlerin görebileceğini seçin.';

  @override
  String get connectionVisibilityEveryone => 'Herkes';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Bu bağlantıyı profilinizde herkesin görmesine izin ver';

  @override
  String get connectionVisibilityFriends => 'Arkadaşlar';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Arkadaşlarınızın bu bağlantıyı görmesine izin ver';

  @override
  String get connectionVisibilityCommunityMembers => 'Topluluk üyeleri';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Üyesi olduğunuz topluluklardaki üyelerin bu bağlantıyı görmesine izin ver';

  @override
  String get connectionRemoveTitle => 'Bağlantıyı kaldır';

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
  String get lookAndFeelThemeDark => 'Koyu tema';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Koyu (eski) tema';

  @override
  String get lookAndFeelThemeCoal => 'Kömür teması';

  @override
  String get lookAndFeelThemeLight => 'Açık tema';

  @override
  String get lookAndFeelThemeSystem => 'Sistem teması';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Temayı tüm cihazlarda senkronize et';

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
  String get lookAndFeelThemeColorsTitle => 'Theme colors';

  @override
  String get lookAndFeelThemeColorsConfigureDescription =>
      'Customize individual theme colors for this device.';

  @override
  String lookAndFeelThemeColorsEditingMode(String mode) {
    return 'Editing $mode';
  }

  @override
  String get lookAndFeelThemeColorsSyncSectionTitle => 'Theme Studio sync';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioLabel =>
      'Use colors from Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioDescription =>
      'When enabled, color changes from Theme Studio on desktop apply on this device. When disabled, this device keeps its own colors.';

  @override
  String get lookAndFeelThemeColorsSyncToStudioLabel =>
      'Send color changes to Theme Studio';

  @override
  String get lookAndFeelThemeColorsSyncToStudioDescription =>
      'When enabled, colors you change here sync to Theme Studio on your other devices. When disabled, desktop Theme Studio keeps its own colors.';

  @override
  String get lookAndFeelThemeColorsSyncFromStudioOffBanner =>
      'Desktop Theme Studio color changes will not apply on this device.';

  @override
  String get lookAndFeelThemeColorsEssentialSectionTitle => 'Essential colors';

  @override
  String get lookAndFeelThemeColorsChatBackgroundWallpaperNote =>
      'If you have a chat wallpaper set, you won\'t see this color.';

  @override
  String lookAndFeelThemeColorsResetForMode(String mode) {
    return 'Reset all colors for $mode';
  }

  @override
  String get lookAndFeelThemeColorsResetConfirmTitle => 'Reset theme colors?';

  @override
  String lookAndFeelThemeColorsResetConfirmBody(String mode) {
    return 'This removes your custom color overrides for $mode on this device.';
  }

  @override
  String get lookAndFeelThemeColorsGroupBrandButtons => 'Brand & buttons';

  @override
  String get lookAndFeelThemeColorsGroupChatSurfaces => 'Chat & messages';

  @override
  String get lookAndFeelThemeColorsGroupSidebars => 'Sidebars & navigation';

  @override
  String get lookAndFeelThemeColorsGroupText => 'Text';

  @override
  String get lookAndFeelThemeColorsGroupHeaders => 'Headers';

  @override
  String get lookAndFeelThemeColorsGroupStatus => 'Status';

  @override
  String get lookAndFeelThemeColorsGroupEmbedsMarkup => 'Embeds & mentions';

  @override
  String get lookAndFeelThemeColorsGroupAccentsAlerts => 'Accents & alerts';

  @override
  String get lookAndFeelThemeColorsGroupControls => 'Surfaces & controls';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Chat font scaling';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Adjust the font size in the chat area.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Sohbet yazı tipi boyutu';

  @override
  String get lookAndFeelAppZoomTitle => 'Uygulama yakınlaştırma düzeyi';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Uygulamanın yakınlaştırma düzeyini ayarlayın.';

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
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Yıldız alanı';

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
      'Minimum boşlukla görünen mesaj sayısını en üst düzeye çıkarır.';

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
      'Yazıyor göstergesi + avatarlar';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Kanal listesinde kullanıcı avatarlarıyla yazıyor göstergesini göster';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Yalnızca yazıyor göstergesi';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Yalnızca yazıyor göstergesini göster (avatarsız)';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Gizli';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Kanal listesinde yazıyor göstergesini gösterme';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Seçili kanalda yazmayı göster';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Devre dışı bırakıldığında (varsayılan), yazma göstergeleri görüntülemekte olduğunuz kanalda görünmez.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'genel';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Klavye ipuçları';

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
      'Aradığınız topluluk silinmiş olabilir veya erişim izniniz olmayabilir.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName şu anda yalnızca $productName çalışanlarına açık';
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
  String get lookAndFeelChannelListSectionTitle => 'Kanal listesi';

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
  String get lookAndFeelActiveNowSectionTitle => 'Şu an aktif';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Şimdi Aktif\'in uygulama genelinde nasıl görüneceğini kontrol edin.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Ana ekranda şu an aktif bölümünü göster';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Sesli sohbette aktif olan arkadaşları öne çıkarmak için ana ekranda şu an aktif bölümünü gösterin. Bir önizleme, kanal bağlamı, kimlerin zaten orada olduğunu ve hızlıca katılmanın bir yolunu göreceksiniz.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favoriler';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Uygulama genelinde favorilerin görünürlüğünü kontrol edin.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Favorileri etkinleştir';

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
      'Sevdiğiniz kanallara, DM\'lere ve gruplara hızlı erişim için kişisel alanınız. Buraya eklemek için herhangi bir kanaldaki yıldıza basın.';

  @override
  String get favoritesWelcomeTip =>
      'Size göre değil mi? İstediğiniz zaman kapatın.';

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
  String get favoritesUnmute => 'Favorileri sessizden çıkar';

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
  String get favoritesAddToSavedMedia => 'Kayıtlı medyaya ekle';

  @override
  String get favoritesRemoveFromSavedMedia => 'Kayıtlı medyadan kaldır';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Yalnızca URL\'den kaydedilen GIF favorilerine ekle';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Yalnızca URL\'den kaydedilen GIF favorilerinden kaldır';

  @override
  String get savedMediaAddTitle => 'Kayıtlı medyaya ekle';

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
  String get favoritesDirectMessageSubtitle => 'Doğrudan mesaj';

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
  String get messagesMediaInputGroupTitle => 'Giriş';

  @override
  String get messagesMediaInputGroupDescription =>
      'Mesaj girdi ayarlarını özelleştirin.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Kenar çubuğu';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Topluluk kenar çubuğunun nasıl görüntüleneceğini yapılandırın.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Sessize alınmış kanalları varsayılan olarak gizle';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Yeni topluluklara katıldığınızda kenar çubuğundaki sessize alınmış kanalları otomatik olarak gizleyin';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Sessize alınmış kanallar varsayılan olarak gizlensin mi?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Katıldığınız yeni topluluklarda sessize alınmış kanallar otomatik olarak gizlenecek. Bu ayarı mevcut tüm topluluklarınıza da uygulamak ister misiniz?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Sessize alınmış kanallar varsayılan olarak gizlenmesin mi?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Katıldığınız yeni topluluklarda artık sessize alınmış kanallar otomatik olarak gizlenmeyecek. Mevcut tüm topluluklarınızdaki sessize alınmış kanalları da göstermek ister misiniz?';

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
  String get messagesMediaDisplaySectionTitle => 'Medya gösterimi';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Resimlerin, videoların ve diğer medyaların nasıl gösterileceğini kontrol edin. Tüm medya yeniden boyutlandırılır ve dönüştürülür. Önizlemeye sıkıştırılamayan aşırı büyük dosyalar, bu ayarlardan bağımsız olarak yerleştirilmez.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Sohbete bağlantı olarak gönderildiğinde';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Doğrudan $productName uygulamasına yüklendiğinde';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Bağlantı önizlemeleri';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Web sitesi bağlantılarının sohbet içinde nasıl önizleneceğini kontrol edin';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Gömülü içerikleri göster ve web sitesi bağlantılarını önizle';

  @override
  String get messagesMediaReactionsSectionTitle => 'Tepkiler';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Mesajlardaki emoji tepkilerini yapılandırın';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Mesajlarda emoji tepkilerini göster';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Spoiler içeriği';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Gizli içeriğin nasıl görüntüleneceğini kontrol edin';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Gizli içeriği göster';

  @override
  String get messagesMediaSpoilersOnClickName => 'Tıklayınca';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Tıklandığında spoiler içeriğini göster';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'Yönettiğim kanallarda';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      '\"Mesajları Yönet\" izniniz olan kanallarda gizli içeriği her zaman göster';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Her zaman';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Spoiler içeriğini her zaman göster';

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
      'İfade otomatik tamamlama özelliğinde varsayılan emojileri göster';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'İfade otomatik tamamlama özelliğinde özel emojileri göster';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'İfade otomatik tamamlama özelliğinde çıkartmaları göster';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Kayıtlı medyayı ifade otomatik tamamlamada göster';

  @override
  String get accessibilitySaturationTitle => 'Doygunluk';

  @override
  String get accessibilityVisualGroupTitle => 'Görsel';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Bağlantıların her zaman altını çiz';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Görsellerde alternatif metni göster';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Mevcut olduğunda resimlerin altında alternatif metin göster.';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Üstü çizili metni soluklaştır';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'DM mesaj önizlemeleri';

  @override
  String get accessibilityDmMessagePreviewModeLabel => 'DM mesaj önizleme modu';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Tüm mesajlar';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Tüm DM sohbetleri için mesaj önizlemelerini göster';

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
  String get accessibilityTtsSilenceSampleLabel => 'Örneği sustur';

  @override
  String get accessibilityPreviewButtonLabel => 'Önizleme düğmesi';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Bağlantılar şu şekilde görünür: $linkPreviewExampleUrl';
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
      'Bağlam menüsü kısayollarını göster';

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
      'Çıkartmalar, üzerlerine bastığınızda hareket eder';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Çıkartmalar, üzerlerine geldiğinizde veya onlarla etkileşim kurduğunuzda hareket eder';

  @override
  String get accessibilityStickerNeverAnimateName => 'Asla canlandırma';

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
      'Hareketli emojiler, GIF\'ler ve çıkartmalar Animasyon sekmesinde kontrolünüz altında kalır.';

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
  String get ttsSubstitutionUnknownUser => 'bilinmeyen kullanıcı';

  @override
  String get ttsSubstitutionUnknownRole => 'bilinmeyen rol';

  @override
  String get ttsSubstitutionUnknownChannel => 'bilinmeyen kanal';

  @override
  String get ttsSubstitutionCodeBlock => 'kod bloğu';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return '$emojiName emojisi';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return '$commandName komutu';
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
  String get dmListSentAnAttachment => 'Bir ek gönderdi';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username bu kanala bir mesaj sabitledi.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username, $userName kişisini gruba ekledi.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username gruba birini ekledi.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username gruptan ayrıldı.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username, $userName kişisini gruptan çıkardı.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username gruptan birini çıkardı.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username kanalın adını $newName olarak değiştirdi.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username kanal adını değiştirdi.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username kanal simgesini değiştirdi.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username bir arama başlattı.';
  }

  @override
  String get systemCallJoinTheCall => 'Aramaya katıl';

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
  String get voiceConnectionConfirmTitle => 'Ses bağlantısı onayı';

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
  String get voiceConnectionConfirmSwitch => 'Bu cihaza geç';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Sadece katıl (diğer bağlantıları koru)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Hiçbir şey yapma, katılmak istemiyorum';

  @override
  String get voiceJoinFailedTitle => 'Sesli sohbete katılamadık';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Diğer cihazlarınızla bağlantı kurulamadı. Bir süre sonra tekrar deneyin.';

  @override
  String get voiceChannelJoin => 'Sesli kanala katıl';

  @override
  String get voiceCallJoin => 'Aramaya katıl';

  @override
  String get voiceChannelJoinConnect => 'Sese bağlan';

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
      'Bu sesli kanalda desteklenmeyen bir katılımcı olduğu için uçtan uca şifreleme kullanılamıyor.';

  @override
  String get voiceCallE2eeBroken =>
      'Bu aramada desteklenmeyen bir katılımcı olduğu için uçtan uca şifreleme kullanılamıyor.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Bu şifreli aramaya katılmadan önce bu istemci güncellenmelidir.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Mikrofonunuz başlatılamadı. Aramada kalmaya devam ediyorsunuz.';

  @override
  String get voiceChannelStatusConnecting => 'Bağlanıyor…';

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
  String get voiceParticipantTooltipDeafened => 'Sağırlaştırıldı';

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
  String get voiceControlDeafen => 'Sağırlaştır';

  @override
  String get voiceControlUndeafen => 'Sağırlaştırmayı kaldır';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Kamerayı çevir';

  @override
  String get voiceControlScreenShare => 'Ekran paylaşımı';

  @override
  String get voiceScreenShareNotificationText => 'Ekranınızı paylaşıyorsunuz.';

  @override
  String get voiceControlDisconnect => 'Bağlantıyı kes';

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
  String get voiceAudioProcessing => 'Ses işleme';

  @override
  String get voiceConnectionSessionSection => 'Oturum';

  @override
  String get voiceConnectionDurationLabel => 'Süre';

  @override
  String get voiceConnectionParticipantsLabel => 'Katılımcılar';

  @override
  String get voiceConnectionNetworkSection => 'Ağ';

  @override
  String get voiceConnectionPingLabel => 'Ping';

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
  String get userAreaMuteMicrophone => 'Mikrofonun sesini kapat';

  @override
  String get userAreaUnmuteMicrophone => 'Mikrofonun sesini aç';

  @override
  String get userAreaUserSettings => 'Kullanıcı ayarları';

  @override
  String get voiceParticipantMenuViewProfile => 'Profili görüntüle';

  @override
  String get voiceParticipantMenuFocus => 'Bu kişiye odaklan';

  @override
  String get voiceParticipantMenuUnfocus => 'Odağı kaldır';

  @override
  String get voiceParticipantMenuCommunityMute => 'Topluluk sessize alma';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Topluluk sağırlaştırması';

  @override
  String get voiceParticipantMenuUserVolume => 'Kullanıcı sesi';

  @override
  String get voiceParticipantMenuStreamVolume => 'Yayın sesi';

  @override
  String get voiceParticipantMenuStopStreaming => 'Yayını durdur';

  @override
  String get voiceParticipantModerationFailed =>
      'Üye güncellenemedi. Lütfen tekrar deneyin.';

  @override
  String get voiceControlChat => 'Sohbet';

  @override
  String get voiceCallViewModeLabel => 'Görünüm';

  @override
  String get voiceCallViewModeGrid => 'Kare';

  @override
  String get voiceCallViewModeFocus => 'Odak';

  @override
  String get voicePanelSettingsSectionTitle => 'Ses ayarları';

  @override
  String get voicePanelUseEarpieceLabel => 'Ahizeyi kullan';

  @override
  String get voiceOutputRouteSpeaker => 'Hoparlör';

  @override
  String get voiceOutputRouteEarpiece => 'Ahize';

  @override
  String get voiceOutputRouteHeadset => 'Kulaklık';

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
  String get voiceTextChatShow => 'Sohbeti göster';

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
  String get voiceWatchStream => 'Yayını izle';

  @override
  String get voiceStopWatching => 'İzlemeyi durdur';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Mevcut akışı izlemeyi durdur';

  @override
  String get voiceOwnScreenShareTitle => 'Yayın yapıyorsunuz';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Akışınız katılımcılar için yayında.';

  @override
  String get voiceLiveBadge => 'Canlı';

  @override
  String get dmVoiceViewCall => 'Aramayı görüntüle';

  @override
  String get dmVoiceCallFullScreen => 'Tam ekran';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Görüşmeyi tam ekranda aç';

  @override
  String get dmVoiceStripStatusConnecting => 'Bağlanıyor…';

  @override
  String get dmVoiceStripStatusInCall => 'Aramada';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Sesli arama';

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
  String get notificationsFilterMentions => 'Bahsetmeler';

  @override
  String get notificationsBookmarksTooltip => 'Yer işaretleri';

  @override
  String get notificationsMentionFilterTooltip => 'Bahsetmeleri filtrele';

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
      'Tüm topluluk bahsetmelerini dahil et';

  @override
  String get notificationsNoUnreadTitle => 'Okunmamış mesaj yok';

  @override
  String get notificationsNoUnreadBody => 'Her şeyi gördünüz.';

  @override
  String get notificationsNoMentionsTitle => 'Yakın zamanda bahsedilmediniz';

  @override
  String get notificationsNoMentionsBody =>
      'Size yapılan tüm @bahsedilenler burada 7 gün boyunca görünecektir.';

  @override
  String get notificationsMentionsEndTitle => 'Sonuna ulaştınız';

  @override
  String get notificationsMentionsEndBody =>
      'Tüm son bahsedilenlerinizi gördünüz. Endişelenmeyin, yakında burada yenileri görünecektir.';

  @override
  String get notificationsJump => 'Git';

  @override
  String get notificationsRemoveMentionTooltip => 'Bahsetmeyi kaldır';

  @override
  String get notificationsViewAllUnread => 'Tüm okunmamışları gör';

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
      'Mesajınız gönderilemedi. Doğrudan mesaj göndermek için hesabınızı sahiplenmeniz gerekiyor.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Mesajınız gönderilemedi. Mesaj göndermek için hesabınızı sahiplenmeniz gerekiyor.';

  @override
  String get chatSendFailureContentBlocked =>
      'Mesajınız güvenlik sistemlerimiz tarafından işaretlendiği için gönderilemedi. Bunun bir hata olduğunu düşünüyorsanız lütfen destek ekibiyle iletişime geçin.';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'Mesajınız güvenlik sistemlerimiz tarafından işaretlendiği için gönderilemedi. Bunun bir hata olduğunu düşünüyorsanız lütfen bu kurulumun yöneticileriyle iletişime geçin.';

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
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Arkadaşların arkadaşları';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Topluluk üyeleri';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Doğrudan mesajlar';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Topluluk üyelerinden doğrudan mesajlara izin ver';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Topluluk botlarından doğrudan mesajlara izin ver';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Gelen aramalar';

  @override
  String get privacyDashboardAllowedCallers => 'İzin verilen arayanlar';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Tüm gelen aramaları engelle';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Yalnızca arkadaşlarınızın sizi arama yapmasına izin verin (önerilen)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Arkadaşlara ve seçtiğiniz ek gruplara izin ver';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Herkesin, yabancıların bile sizi arayabilmesine izin verin';

  @override
  String get privacyDashboardAdditionalGroups => 'Ek Gruplar';

  @override
  String get privacyDashboardRingBehavior => 'Zil davranışı';

  @override
  String get privacyDashboardSilentCalls => 'Herkesten sessiz aramalar';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Sizi grup sohbetlerine kimler ekleyebilir';

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
  String get privacyDashboardVoiceActivityTitle =>
      'Şu an aktif\'te ses etkinliği';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Ses etkinliğinizi arkadaşlarınızla paylaşın';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Ses etkinliğiniz tüm arkadaşlarınızla paylaşılsın mı?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Ses etkinliğini tüm arkadaşlarınızla paylaşmayı durdurmak istiyor musunuz?';

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
    return '$time sonra tekrar kullanılabilir';
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
      'Topluluk üyelerinden gelen doğrudan mesajları engellemek ister misiniz?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Botların size doğrudan mesaj göndermesine izin verilsin mi?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Botların size doğrudan mesaj göndermesini engellemek ister misiniz?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Mevcut topluluklarınızdaki üyelerden gelen doğrudan mesajlara da izin vermek ister misiniz?';

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
      'Bunu en kısa sürede işleme alacağız. Tamamlandığında bizden bir DM alacaksınız.';

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
      'Hangi tür sohbetlerin temizleneceğini seçin.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Artık erişemediğim yerler';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Yalnızca ayrıldığınız veya çıkarıldığınız topluluklardaki ve grup DM\'lerindeki mesajlar silinir.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Hangi sohbetler';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Dahil edilmesini istediğiniz sohbet türlerini açıp kapatın.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Açık DM\'ler';

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
      'Dahil edilecek en az bir sohbet türü seçin.';

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
      'Bu işlem başladıktan sonra geri alınamaz. Tamamlandığında size DM göndereceğiz.';

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
      'Açık doğrudan mesajlar';

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
  String get doubleTapReactionHint => 'Bir mesaja çift dokunarak tepki ver:';

  @override
  String get doubleTapReactionEdit => 'Düzenle';

  @override
  String get doubleTapReactionEditTitle => 'Varsayılanı düzenle';

  @override
  String get doubleTapReactionEditSubtitle => 'Çift dokunma emojisini seçin';

  @override
  String get messagesMediaGesturesSectionTitle => 'Gestures';

  @override
  String get messagesMediaGesturesSectionDescription =>
      'Configure double tap on messages.';

  @override
  String get messagesMediaGesturesReactionLabel => 'Reaction emoji';

  @override
  String get messagesMediaGesturesReactionDescription =>
      'Used when double tap is set to add a reaction.';

  @override
  String get messagesMediaGesturesDoubleTapActionLabel => 'Double tap action';

  @override
  String get messagesMediaGesturesDoubleTapActionReactName => 'Add reaction';

  @override
  String get messagesMediaGesturesDoubleTapActionReactDescription =>
      'Adds your default double-tap emoji as a reaction.';

  @override
  String get messagesMediaGesturesDoubleTapActionEditName => 'Edit message';

  @override
  String get messagesMediaGesturesDoubleTapActionEditDescription =>
      'Opens the editor on messages you sent. Other messages are unchanged.';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneName => 'Nothing';

  @override
  String get messagesMediaGesturesDoubleTapActionNoneDescription =>
      'Double tap is disabled.';

  @override
  String get chatMessageEdit => 'Mesajı düzenle';

  @override
  String get chatMessageReply => 'Yanıtla';

  @override
  String get notificationReplyPlaceholder => 'Mesaj';

  @override
  String get notificationReplyFailed => 'Yanıt gönderilemedi';

  @override
  String get chatMessageForward => 'İlet';

  @override
  String get forwardMessageTitle => 'Mesajı ilet';

  @override
  String get forwardSearchHint => 'Kanal veya DM ara';

  @override
  String get forwardDirectMessagesSection => 'Doğrudan mesajlar';

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
      'Bu toplulukta mesaj gönderme devre dışı bırakıldı';

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
  String get chatMessageUnpin => 'Mesajın sabitlemesini kaldır';

  @override
  String get chatMessageUnpinIt => 'Sabitlemeyi kaldır';

  @override
  String get chatMessageBookmark => 'Mesajı yer işaretlerine ekle';

  @override
  String get chatMessageRemoveBookmark => 'Yer işaretini kaldır';

  @override
  String get chatMessageMarkAsUnread => 'Okunmadı olarak işaretle';

  @override
  String get chatMessageCopyMessageLink => 'Mesaj bağlantısını kopyala';

  @override
  String get chatMessageOpenLink => 'Bağlantıyı aç';

  @override
  String get chatMessageCopyLink => 'Bağlantıyı kopyala';

  @override
  String get chatMessageCopyMessageId => 'Mesaj kimliğini kopyala';

  @override
  String get chatMessageViewReactions => 'Tepkileri görüntüle';

  @override
  String get chatMessageRemoveAllReactions => 'Tüm tepkileri kaldır';

  @override
  String get chatMessageDebug => 'Mesajda hata ayıkla';

  @override
  String get chatMessageDebugSheetTitle => 'Mesajda hata ayıkla';

  @override
  String get chatMessageDebugCopyJson => 'JSON\'u kopyala';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Mesaj JSON\'u panoya kopyalandı';

  @override
  String get chatReactionsSheetTitle => 'Tepkiler';

  @override
  String get chatReactionsSheetEmpty =>
      'Henüz kimse bu ifadeyle tepki vermedi.';

  @override
  String get chatReactionAddFailed => 'Tepki eklenemedi';

  @override
  String get chatReactionRemoveFailed => 'Tepki kaldırılamadı';

  @override
  String get chatMessageReport => 'Mesajı bildir';

  @override
  String get reportFlowTitleMessage => 'Mesajı bildir';

  @override
  String get reportFlowTitleUserProfile => 'Profili bildir';

  @override
  String get reportFlowSummaryTitle => 'Raporunuzu kontrol edin';

  @override
  String get reportFlowSummarySubtitle =>
      'Göndermeden önce doğru göründüğünden emin olun.';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'Yalnızca kuralları ihlal ettiğine dürüstçe inandığınız şeyleri bildirin. Raporları kötüye kullanmak $guidelines aykırıdır.';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'Topluluk Kurallarımıza';

  @override
  String get reportFlowDisclaimerNoLink =>
      'Yalnızca kuralları ihlal ettiğine dürüstçe inandığınız şeyleri bildirin ve lütfen aynı raporu iki kez göndermeyin.';

  @override
  String get reportFlowSelectedMessage => 'Bildirdiğiniz mesaj';

  @override
  String get reportFlowSelectedUser => 'Bildirdiğiniz profil';

  @override
  String get reportFlowReportCategory => 'Yanıtlarınız';

  @override
  String get reportFlowSubmit => 'Rapor gönder';

  @override
  String get reportFlowBack => 'Geri';

  @override
  String get reportFlowNext => 'İleri';

  @override
  String get reportFlowDone => 'Bitti';

  @override
  String get reportFlowThankYouTitle => 'Rapor gönderildi';

  @override
  String get reportFlowThankYouNoReportTitle =>
      'Bunu bildirdiğiniz için teşekkürler';

  @override
  String reportFlowThankYouBody(String productName) {
    return '$productName güvenlik ekibi raporunuzu inceleyecek. Raporun sizden geldiğini belli etmeyeceğiz.';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'Bize bildirdiğiniz için teşekkür ederiz. Bu tek başına kurallarımızı ihlal etmiyor, bu yüzden rapor göndermedik. Birini hedef alıyorsa veya aşağılayıcı ifadeler içeriyorsa, tekrar bildirin ve “Saldırgan veya zararlı içerik” seçeneğini seçin.';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'Bize bildirdiğiniz için teşekkür ederiz. Bu tek başına kurallarımızı ihlal etmiyor, bu yüzden rapor göndermedik.';

  @override
  String get reportFlowMoreYouCanDo => 'Seçenekleriniz';

  @override
  String reportFlowBlockName(String name) {
    return '$name adlı kullanıcıyı engelle';
  }

  @override
  String get reportFlowBlockDescription =>
      'Mesajlarını gizler ve size mesaj göndermesini engeller';

  @override
  String get reportFlowBlockButton => 'Engelle';

  @override
  String get reportFlowBlockedButton => 'Engellendi';

  @override
  String get reportFlowUrgentBanner =>
      'Biri acil tehlikedeyse önce yerel acil durum servisleriyle iletişime geçin.';

  @override
  String get reportFlowLoadFailed => 'Rapor formu yüklenemedi.';

  @override
  String get reportFlowTryAgain => 'Tekrar dene';

  @override
  String get reportFlowOutdated =>
      'Rapor formu değişti. Lütfen yeniden başlayın.';

  @override
  String get reportFlowAlreadyReported => 'Bu mesajı zaten bildirdiniz.';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'Bu profili bugün zaten bildirdiniz.';

  @override
  String get reportFlowRateLimited =>
      'Çok hızlı rapor gönderiyorsunuz. Daha sonra tekrar deneyin.';

  @override
  String get reportFlowSubmitFailed =>
      'Raporunuz gönderilemedi. Tekrar deneyin.';

  @override
  String get reportFlowAccountSetupRequired =>
      'Hesabınızı sahiplenin ve rapor göndermek için e-postanızı doğrulayın.';

  @override
  String get chatMessageSuppressEmbeds => 'Gömülü içerikleri gizle';

  @override
  String get chatMessageUnsuppressEmbeds => 'Gömülü içerikleri göster';

  @override
  String get chatMessageDelete => 'Mesajı sil';

  @override
  String get chatMessageDeleteConfirmTitle => 'Mesajı sil';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Bu mesajı silmek istediğinden emin misin?';

  @override
  String get chatMessageDeleteAttachment => 'Eki sil';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => 'Alternatif metni düzenle';

  @override
  String get chatMessageMore => 'Daha fazla';

  @override
  String get chatEditingMessage => 'Mesaj düzenleniyor';

  @override
  String get chatReplyOriginalDeleted => 'Orijinal mesaj silindi';

  @override
  String get chatReplyOriginalFailedToLoad => 'Orijinal mesaj yüklenemedi';

  @override
  String get chatReplyAttachedMedia => 'Mesaj ekli medya içeriyor';

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
  String get devMarkAsSpamLocally => 'Spam olarak işaretle (yerel)';

  @override
  String get devIgnoreSpamFlag => 'Spam işaretini yok say';

  @override
  String get chatMessagesLoadError => 'Mesajlar yüklenemedi.';

  @override
  String get chatReplyMentionOverrideTitle =>
      'Bahsetme tercihi geçersiz kılınsın mı?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname, yanıtlarda @bahsedilmeyi tercih ediyor. Yine de bahsetmeden gönderilsin mi?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname, yanıtlarda @bahsetme olmamasını tercih ediyor. Yine de bahsederek gönderilsin mi?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Tercihi yok say';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Yanıtladığınız kullanıcıya bildirim göndermeyi devre dışı bırakmak için tıklayın.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Yanıtladığınız kullanıcıya bildirim göndermeyi etkinleştirmek için tıklayın.';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Yanıtlanan kişiyi etiketle';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Yanıtlamayı iptal et';

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
  String get mediaViewerImagePreview => 'Görsel önizlemesi';

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
  String get chatImageCouldNotLoad => 'Bu görsel yüklenemedi.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Bu role sahip olup bu kanalı görüntüleme izni olan kullanıcıları bilgilendir.';

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
      'Kayıtlı bir medya öğesi gönder.';

  @override
  String get composerCommandStickerDescription => 'Çıkartma gönder.';

  @override
  String get composerCommandGifDescription => 'GIF ara ve gönder.';

  @override
  String get composerCommandMemberOption => 'Hedef üye.';

  @override
  String get composerCommandReasonOption => 'Neden (isteğe bağlı).';

  @override
  String get composerCommandMessageOption => 'Gönderilecek mesaj.';

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
    return 'Bu topluluktaki takma adınızı **$previousNickname** yerine **$newNickname** olarak değiştirdiniz.';
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
  String get addGuildModalTitle => 'Topluluk ekle';

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
      'Sizin ve arkadaşlarınızın sohbet edebileceği bir topluluk oluşturun.';

  @override
  String get addGuildCreateNameLabel => 'Topluluk adı';

  @override
  String get addGuildCreateSubmit => 'Topluluk oluştur';

  @override
  String get addGuildCreateFailed =>
      'Topluluk oluşturulamadı. Lütfen tekrar dene.';

  @override
  String get addGuildCreateClaimTitle => 'Hesabınızı sahiplenin';

  @override
  String get addGuildCreateClaimDescription =>
      'Topluluk oluşturmadan önce hesabınızı sahiplenmeniz gerekiyor.';

  @override
  String get addGuildCreateVerifyTitle => 'E-postanızı doğrulayın';

  @override
  String get addGuildCreateVerifyDescription =>
      'Bir topluluk oluşturmadan önce e-posta adresinizi doğrulamanız gerekiyor.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Yeni bir topluluk oluştururken hareketli simgeler desteklenmez. Statik bir görsel kullanın.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Topluluk oluşturarak, şunlara uymayı ve bunları desteklemeyi kabul etmiş olursun: ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return '$productName topluluk kuralları';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Bu kurulum tek bir toplulukla sınırlıdır, bu nedenle başka topluluklar oluşturulamaz.';

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
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Tüm tepkileri kaldır';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Bu mesajdaki tüm tepkileri kaldırmak istediğinizden emin misiniz?';

  @override
  String get chatMessagePinConfirm => 'Sabitle';

  @override
  String get chatMessagePinConfirmDescription =>
      'Bu mesajı herkesin görmesi için kanala sabitleyin.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Mesajın sabitlemesini kaldır';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Bu sabitlemeyi zamanda geriye gönderelim mi?';

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
  String get channelDetailsGroupSettingsTitle => 'Grup ayarları';

  @override
  String get channelDetailsDmSettingsTitle => 'DM ayarları';

  @override
  String get channelDetailsInvitePeople => 'Kişileri davet et';

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
  String get channelSettingsEditCategory => 'Kategoriyi düzenle';

  @override
  String get channelSettingsTabOverview => 'Genel bakış';

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
  String get categoryUnmuteCategory => 'Kategoriyi sessizden çıkar';

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
  String get channelSettingsPermissionsAddOverride => 'Geçersiz kılma ekle';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Rol veya üye ara…';

  @override
  String get channelSettingsDeleteInvite => 'Daveti sil';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Bu daveti silmek istiyor musunuz? Geri alınamaz.';

  @override
  String get channelSettingsCopyInviteCode => 'Davet kodunu kopyala';

  @override
  String get channelSettingsCopyInviteUrl => 'Davet URL\'sini kopyala';

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
      'Bu kanala mesaj gönderebilen gelen webhook\'ları yönetin.';

  @override
  String get channelSettingsWebhooksEmpty => 'Webhook yok';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Bu kanal için yapılandırılmış webhook yok. Harici uygulamaların mesaj göndermesine izin vermek için bir webhook oluşturun.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Bu kanal webhook\'ları desteklemiyor.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Bu kanalın webhook\'larını görüntülemek ve düzenlemek için \"$permission\" iznine sahip olmanız gerekir.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle =>
      'Webhook\'lar yüklenemedi';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Bu kanalın webhook\'ları yüklenirken bir hata oluştu. Tekrar deneyin.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return '$creator tarafından $date tarihinde oluşturuldu';
  }

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
  String get channelSettingsWebhooksDeleteFailed => 'Bu webhook silinemedi';

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
  String get channelMenuDeleteMyMessagesConfirm => 'Mesajlarımı sil';

  @override
  String get channelMenuDeletedYourMessages => 'Mesajlarını sildin';

  @override
  String get channelMenuCouldNotDeleteYourMessages => 'Mesajlarınız silinemedi';

  @override
  String get channelDetailsSystemMessage => 'Sistem mesajı';

  @override
  String get channelDetailsTextChannel => 'Metin kanalı';

  @override
  String get channelDetailsVoiceChannel => 'Sesli kanal';

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
      'Bu topluluktaki bu kanalın üyelerini görüntüleyemezsiniz';

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
  String get channelHeaderPinnedMessages => 'Sabitlenmiş mesajlar';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Sabitlenmiş mesajlar, okunmamış';

  @override
  String get channelHeaderMemberList => 'Üye listesi';

  @override
  String get channelHeaderInbox => 'Gelen kutusu';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Bildirim ayarları, sessizde';

  @override
  String get channelDetailsSearchTitle => 'Ara';

  @override
  String get channelDetailsSearchHint => 'Mesajları ara';

  @override
  String get channelDetailsSearchFilterFrom => 'Kimden';

  @override
  String get channelDetailsSearchFilterHas => 'İçerir';

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
  String get channelHeaderSearchFiltersTitle => 'Arama filtreleri';

  @override
  String get channelHeaderSearchRecentTitle => 'Son aramalar';

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
      'bir dosya uzantısı, örn. png';

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
  String get channelDetailsSearchIn => 'Şurada ara';

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
  String get channelDetailsJumpToMessage => 'Mesaja atla';

  @override
  String get channelDetailsUnpinMessage => 'Mesajın sabitlemesini kaldır';

  @override
  String get channelDetailsCopyMessageLink => 'Mesaj bağlantısını kopyala';

  @override
  String get channelDetailsCopyMessageId => 'Mesaj kimliğini kopyala';

  @override
  String get channelDetailsMessageUnpinned => 'Mesajın sabitlemesi kaldırıldı';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Mevcut topluluk';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Mevcut DM';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Tüm topluluklar';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Yalnızca tüm DM\'ler';

  @override
  String get channelDetailsSearchScopeAllDms => 'Tüm DM\'ler';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'Yalnızca açık DM\'ler';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Açık DM\'ler';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Tüm DM\'ler + topluluklar';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Açık DM\'ler + topluluklar';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Yalnızca mevcut toplulukta ara';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Yalnızca bu DM\'de ara';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Şu anda bulunduğun tüm Topluluklarda';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Yalnızca bulunduğunuz tüm DM\'lerde';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Bulunduğunuz tüm DM\'lerde';

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
  String get channelDetailsSearchSortNewest => 'Önce en yeni';

  @override
  String get channelDetailsSearchSortOldest => 'Önce en eski';

  @override
  String get channelDetailsSearchSortRelevance => 'En alakalı';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'En yeni mesajları önce göster';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'En eski mesajları önce göster';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'En alakalı mesajları önce göster';

  @override
  String get channelDetailsSearchContentImage => 'Görsel yükleme';

  @override
  String get channelDetailsSearchContentVideo => 'Video yükleme';

  @override
  String get channelDetailsSearchContentAudio => 'Ses yükleme';

  @override
  String get channelDetailsSearchContentFile => 'Dosya yükleme';

  @override
  String get channelDetailsSearchContentLink => 'Bağlantı';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Bağlantı önizlemesi veya gömülü içerik';

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
      'Yüklemeler değil, çözümlenmiş önizlemeler ve zengin gömülü içerikler';

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
      'Hareketli simgeler desteklenmez. Statik bir görsel kullanın.';

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
  String get groupDmInvalidImage => 'Geçersiz görsel';

  @override
  String get groupDmInvalidImageBody =>
      'Bu görsel geçersiz. Başka bir tane deneyin.';

  @override
  String get groupDmAddFriends => 'Ekle';

  @override
  String get groupDmOrSendInvite => 'veya bir arkadaşınıza davet gönderin:';

  @override
  String get groupDmGenerateInviteLink => 'Davet bağlantısı oluştur';

  @override
  String get groupDmCreateInvite => 'Oluştur';

  @override
  String get groupDmInviteExpires24Hours =>
      'Davetiniz 24 saat içinde sona erecek';

  @override
  String get groupDmAddFriendFailed =>
      'Bu arkadaş gruba eklenemedi. Lütfen tekrar deneyin.';

  @override
  String get groupDmGroupFull =>
      'Bu grup dolu. Daha fazla kişi eklemeden önce birini çıkarın.';

  @override
  String get groupDmRateLimited =>
      'Çok hızlı gidiyorsunuz. Biraz bekleyip tekrar deneyin.';

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
  String get groupDmNoInvitesCreated => 'Henüz davet oluşturulmadı';

  @override
  String get groupDmLoadingInvites => 'Davetler yükleniyor...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Davetler yüklenemedi. Tekrar deneyin.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Bu davet iptal edilsin mi? Geri alınamaz.';

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
    return '#$channelName kanalına mesaj gönder';
  }

  @override
  String dmComposerHint(String recipientName) {
    return '@$recipientName kişisine mesaj gönder';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return '$groupName grubuna mesaj gönder';
  }

  @override
  String get groupDmComposerHint => 'Mesaj grubu';

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
  String get userSettingsSearchClear => 'Aramayı temizle';

  @override
  String get userSettingsSearchNoResults => 'Ayar bulunamadı';

  @override
  String get userSettingsCopyLinkToSection => 'Copy link to section';

  @override
  String get userSettingsCopyLinkToPage => 'Copy link to page';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Güvenlik ve Giriş';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Hediyeler';

  @override
  String get giftSettingsClaimAccountTitle => 'Hesabınızı sahiplenin';

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
  String get giftSettingsRedeemForYourself => 'Kendiniz için kullan';

  @override
  String get giftSettingsShareWithFriend => 'Bir arkadaşınızla paylaşın';

  @override
  String get premiumPlutoniumTagline =>
      'Bağımsız bir iletişim platformunu desteklerken daha yüksek limitlerin ve ayrıcalıklı özelliklerin kilidini açın.';

  @override
  String get premiumPurchaseMode => 'Satın alma modu';

  @override
  String get premiumForMe => 'Kendim için';

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
  String get premiumBuyGift => 'Hediye satın al';

  @override
  String get premiumOneYearGift => '1 yıllık hediye';

  @override
  String get premiumOneMonthGift => '1 aylık hediye';

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
  String get premiumReadyToUpgrade => 'Yükseltmeye hazır mısınız?';

  @override
  String get premiumReadyToBuyGift => 'Hediye almaya hazır mısınız?';

  @override
  String get premiumManageSubscription => 'Aboneliği yönet';

  @override
  String get premiumRedeemGiftCode => 'Hediye kodunu kullan';

  @override
  String get premiumGiftBadge => 'Hediye';

  @override
  String get premiumCancelSubscriptionTitle => 'Abonelik iptal edilsin mi?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Avantajlarınız bir sonraki yenileme tarihinize kadar devam eder, ardından yeniden abone olup abone geçmişinizi korumak için 3 günlük ek süreniz olur.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Aboneliği iptal et';

  @override
  String get premiumPurchaseHistoryTitle => 'Satın alma geçmişi';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Son faturalarınız. Aboneliğinizin ödeme yöntemini değiştirmek için fatura portalına bir tane ekleyin veya seçin ve varsayılan yapın.';

  @override
  String get premiumManagePaymentMethods => 'Ödeme yöntemlerini yönet';

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
  String get premiumGiftGraceEnded =>
      'Hediye süreniz sona erdi. Plutonium almaya devam etmek için abone olun.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Şimdi ücretlendirileceksiniz. Hediye sürenizin kalanı, ödeme sürenizin sonuna eklenecek, böylece hiçbiri kaybolmayacak.';

  @override
  String get premiumComparisonFeatureColumn => 'Özellik';

  @override
  String get premiumDisclaimerRefund =>
      'Ödemeden sonraki 3 gün içinde, 30 günde bir olmak üzere iadeyi kendiniz başlatabilirsiniz. Aboneliği iade etmek aboneliği iptal eder. AB/AEA alıcıları, içeriğe hemen erişmek için ödeme sırasında 14 günlük cayma hakkından feragat eder. Ödeme itirazı yerine uygulama içi iade düğmesini kullanın. Ödeme itirazları hesabınızı kalıcı olarak kısıtlayabilir. Stripe ödemeyi güvenli bir şekilde işler. Tam kart numaranızı asla görmeyiz.';

  @override
  String get premiumTermsOfService => 'Hizmet Şartları';

  @override
  String get premiumPrivacyPolicy => 'Gizlilik politikası';

  @override
  String get premiumCheckoutStartFailedTitle => 'Ödeme başlatılamadı';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Ödeme başlatılırken bir sorun oluştu. Lütfen bir süre sonra tekrar deneyin.';

  @override
  String get premiumPlanUnavailable =>
      'Bu plan kullanılamıyor. Destekle iletişime geçin.';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'Bu plan kullanılamıyor. Bu kurulumun yöneticileriyle iletişime geçin.';

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
  String get premiumAlreadyVisionaryTitle => 'Zaten Visionary\'siniz';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary zaten kalıcı erişim içerir, bu yüzden yinelenen bir aboneliğe gerek yok. Yine de başkalarına hediye alabilirsiniz.';

  @override
  String get premiumExistingSubscriptionTitle => 'Abonelik zaten mevcut';

  @override
  String get premiumExistingSubscriptionBody =>
      'Bu hesap için mevcut bir Fluxer Plutonium aboneliği bulduk. Ödeme ayrıntılarını güncellemek veya yenileme durumunu kontrol etmek için güvenli faturalandırma portalında yönetin. Az önce ödeme yaptıysanız, bir dakika bekleyip bu sayfayı yeniden açın.';

  @override
  String get premiumPurchasesDisabledTitle => 'Satın alımlar kullanılamıyor';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'Bu hesap için satın alımlar devre dışı bırakıldı. Yanlış görünüyorsa $supportEmail ile iletişime geçin.';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'Bu hesap için satın alımlar devre dışı bırakıldı. Yanlış görünüyorsa bu kurulumun yöneticileriyle iletişime geçin.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Fluxer Plutonium satın almak için hesabını talep et.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Fluxer Plutonium satın almadan önce e-postanı doğrulaman gerekiyor.';

  @override
  String get premiumPerkCommunities => 'Topluluklar';

  @override
  String get premiumPerkMessageCharacterLimit => 'Mesaj karakter sınırı';

  @override
  String get premiumPerkBookmarkedMessages => 'Yer işaretli mesajlar';

  @override
  String get premiumPerkFileUploadSize => 'Dosya yükleme boyutu';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Hareketli emoji kullanımı';

  @override
  String get premiumPerkVideoQuality => 'Video kalitesi';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Hareketli avatarlar ve profil banner\'ları';

  @override
  String get premiumPerkEarlyAccess => 'Yeni özelliklere erken erişim';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => '4K/60fps\'ye kadar';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly veya $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/ay';

  @override
  String get storePlutoniumYearSuffix => '/yıl';

  @override
  String get storePlutoniumPriceOr => 'veya';

  @override
  String get storePlutoniumEmojiTitle => 'Emojileriniz her yerde';

  @override
  String get storePlutoniumEmojiBody =>
      'Topluluklarınızdaki özel emojileri ve çıkartmaları bulunduğunuz her sohbete ve topluluğa getirin.';

  @override
  String get storePlutoniumProfileTitle => 'Öne çıkan bir profil';

  @override
  String get storePlutoniumProfileBody =>
      'Hareketli bir avatar ve başlık, abone rozeti, kullanıcı adınızdan sonra istediğiniz dört haneli etiket* ve her topluluk için ayrı bir profil edinin.';

  @override
  String get storePlutoniumFilesTitle => '500 MB\'a kadar dosya gönderin';

  @override
  String get storePlutoniumFilesBody =>
      'Videoların ve büyük dosyaların tamamını küçültmeden paylaşın. Ücretsiz hesaplar 25 MB\'a kadar gönderebilir.';

  @override
  String get storePlutoniumCompareTitle =>
      'Ücretsiz ve Plutonium karşılaştırması';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Bu özelliklerin tümü mobil uygulamada bulunmamaktadır. Bazıları yalnızca masaüstünde mevcuttur.';

  @override
  String get storePlutoniumNotAvailable => 'Mevcut değil';

  @override
  String get storePlutoniumAvailable => 'Mevcut';

  @override
  String get storePlutoniumCompareTag =>
      'Kullanıcı adınızdan sonraki 4 haneli sayıyı seçin*';

  @override
  String get storePlutoniumCompareProfile =>
      'Her topluluk için ayrı bir profil';

  @override
  String get storePlutoniumCompareBadge => 'Profilinizdeki abone rozeti';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Kaydedebileceğiniz görüntülü arama arka planları';

  @override
  String get storePlutoniumCompareCommunities =>
      'Katılabileceğiniz topluluklar';

  @override
  String get storePlutoniumCompareCharacters => 'Tek bir mesajdaki karakterler';

  @override
  String get storePlutoniumCompareBookmarks =>
      'Yer işaretlerine ekleyebileceğiniz mesajlar';

  @override
  String get storePlutoniumCompareUpload => 'Yükleyebileceğiniz en büyük dosya';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Daha sonrası için kaydedebileceğiniz medya öğeleri';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Mesajlarda hareketli emojiler kullanın';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Herhangi bir toplulukta özel emojiler ve çıkartmalar kullanın';

  @override
  String get storePlutoniumCompareVideo =>
      'Görüntülü arama ve ekran paylaşımı kalitesi';

  @override
  String get storePlutoniumCompareAvatar =>
      'Animasyonlu avatar ve profil banner\'ı';

  @override
  String get storePlutoniumCompareEarlyAccess =>
      'Yeni özelliklere erken erişim';

  @override
  String get storePlutoniumCompareThemes => 'Uygulama için özel temalar';

  @override
  String get storePlutoniumVideoFree => '30 FPS ile 720p\'ye kadar';

  @override
  String get storePlutoniumVideoPlutonium => '60 FPS ile 4K\'ya kadar';

  @override
  String get storePlutoniumTagFootnote =>
      'Aynı kullanıcı adına sahip başka kimsenin kullanmadığı bir etiket seçebilirsiniz. Kullanıcı adları büyük/küçük harfe duyarlı değildir, bu nedenle Mina#4821 ve mina#4821 aynı kabul edilir. #0000 etiketi Fluxer Visionary üyeleri için ayrılmıştır.';

  @override
  String get storePlutoniumLearnVisionary =>
      'Visionary hakkında daha fazla bilgi edinin.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Sadece Fluxer\'ın açık kaynak geliştirmesini mi desteklemek istiyorsunuz? ';

  @override
  String get storePlutoniumDonateLink => 'Bunun yerine bağış yapın.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Abone olmak Fluxer\'ı finanse eder ve şunların kilidini açar';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Tüm sohbetlerde özel emojiler ve çıkartmalar';

  @override
  String get storePlutoniumHighlightProfile =>
      'Hareketli profil, rozet ve özel 4 haneli numara';

  @override
  String get storePlutoniumHighlightFiles => '500 MB\'a kadar yükleme';

  @override
  String get storePlutoniumHighlightMessages =>
      '4.000 karaktere kadar mesaj gönderin';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Her topluluk için ayrı bir profil';

  @override
  String get storePlutoniumHighlightsMore => 'Ve daha fazlası';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'İptal edene kadar Google Play üzerinden otomatik olarak yenilenir.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Siz iptal edene kadar App Store üzerinden otomatik olarak yenilenir.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Zaten bir Fluxer Plutonium aboneliğiniz var.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return '% $percent tasarruf edin';
  }

  @override
  String get storePlutoniumWaiting =>
      'Satın alma işlemi alındı. Plutonium etkinleştirildiğinde burada görünecektir.';

  @override
  String get storePlutoniumUnavailable =>
      'Uygulama içi abonelikler bu cihazda henüz kullanılamıyor.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary zaten kalıcı erişim içerdiği için yinelenen bir aboneliğe gerek yok.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Gizlilik Paneli';

  @override
  String get userSettingsNavAuthorizedApps => 'Yetkili uygulamalar';

  @override
  String get userSettingsNavBlockedUsers => 'Engellenen kullanıcılar';

  @override
  String get userSettingsNavLinkedDevices => 'Bağlı cihazlar';

  @override
  String get userSettingsNavConnections => 'Bağlantılar';

  @override
  String get userSettingsNavLookAndFeel => 'Görünüm';

  @override
  String get userSettingsNavAccessibility => 'Erişilebilirlik';

  @override
  String get userSettingsNavChat => 'Sohbet';

  @override
  String get userSettingsNavAudioAndVideo => 'Ses ve görüntü';

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
  String get audioAndVideoOutputDeviceLabel => 'Çıkış cihazı';

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
      'Ekran paylaşımı kalitesi';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Kare hızı';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Bu kurulum şu anda ekran paylaşımını 30 FPS\'de 720p\'ye kadar desteklemektedir.';

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
  String get notificationsPushInactiveTimeoutLabel =>
      'Anlık bildirim hareketsizlik süresi';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName, bilgisayarınızın başındayken mobil cihazlarınıza anlık bildirim göndermemeye çalışır. Anlık bildirim almadan önce masaüstünde ne kadar süre hareketsiz kalmanız gerektiğini seçin.';
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
  String get notificationsMentionPreferMentionName => '@bahsedilmeyi tercih et';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Yanıtlar varsayılan olarak sizden @bahseder, gönderen bunu kapatırsa uyarılır';

  @override
  String get notificationsMentionPreferNoMentionName =>
      '@bahsedilmemeyi tercih et';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Yanıtlar varsayılan olarak @bahsetmeyi atlar, gönderen bunu açarsa uyarılır';

  @override
  String get notificationsTtsSectionTitle => 'Metin okuma bildirimleri';

  @override
  String get notificationsTtsEnableCommandLabel =>
      '/tts konuşma oynatmayı etkinleştir';

  @override
  String get notificationsTtsEnableCommandDescription =>
      '/tts mesajınızı sesli okusun. Bu ayar kapalıyken bu komutlar normal metin olarak kalır.';

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
      'Yalnızca görüntülediğiniz kanalı seslendirir. Seslendirme kanallar arasında sizi takip eder.';

  @override
  String get notificationsTtsModeNeverName => 'Asla otomatik değil';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Birisi /tts komutunu manuel olarak çalıştırmadıkça sessiz kalır.';

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
  String get notificationsShowFewerSoundEffects => 'Daha az ses efekti göster';

  @override
  String get notificationsPreviewSound => 'Sesi önizle';

  @override
  String get notificationsPerSoundVolumeTitle => 'Sese özel ses düzeyi';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Bireysel sesler için özel ses düzeyleri ayarlayın. Geçersiz kılma yapılmayan sesler ana ses düzeyini takip eder.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Etkin özel ses düzeyi geçersiz kılmaları: $overrideCount.';
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
    return '$label sesini kapat';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return '$label sesini aç';
  }

  @override
  String get notificationsSoundMessage => 'Topluluk mesajı bildirimleri';

  @override
  String get notificationsSoundDirectMessage => 'Doğrudan mesaj bildirimleri';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Mevcut kanal mesaj bildirimleri';

  @override
  String get notificationsSoundMute => 'Mikrofon kapatıldı';

  @override
  String get notificationsSoundUnmute => 'Mikrofon açıldı';

  @override
  String get notificationsSoundDeaf => 'Sağırlaştırıldı';

  @override
  String get notificationsSoundUndeaf => 'Sağırlaştırma kaldırıldı';

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
  String get notificationsPushRelaySectionTitle => 'Anlık bildirim aktarıcısı';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider anlık bildirimleri yalnızca kendi hizmeti üzerinden iletir, bu yüzden bu cihazın bildirimleri Fluxer aktarıcısından geçer.';
  }

  @override
  String get notificationsPushRelayConsentLabel =>
      'Fluxer anlık bildirim aktarıcısını kullan';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Bunu kapatırsan bu cihazın bildirim kaydı silinir ve cihaz anlık bildirim almayı bırakır.';

  @override
  String get pushRelayConsentTitle => 'Anlık bildirim aktarıcısı';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider anlık bildirimleri yalnızca kendi hizmeti üzerinden iletir, bu yüzden bu cihazın bildirimleri Fluxer aktarıcısından geçer.';
  }

  @override
  String get pushRelayConsentNoticePrefix =>
      'Bu cihazda anlık bildirimleri açmak için ';

  @override
  String get pushRelayConsentNoticeLink =>
      'anlık bildirim aktarıcısı gizlilik bildirimini';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' kabul et. Cihaz başına yalnızca bir kez kabul etmen yeterli.';

  @override
  String get pushRelayConsentAgree => 'Kabul et ve devam et';

  @override
  String get pushRelayConsentDecline => 'Şimdi değil';

  @override
  String get userSettingsNavLanguageAndTime => 'Dil ve Saat';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Arayüz dili';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Uygulama genelinde kullanılacak dili seçin';

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
    return 'Uygulama dilinin saat biçimi: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Sistemin saat biçimi: $format';
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
  String get userSettingsNavAppIcon => 'Uygulama simgesi';

  @override
  String get appIconSectionTitle => 'Uygulama simgesi';

  @override
  String get appIconSectionDescription =>
      'Ana ekranınızda hangi simgenin görüneceğini seçin.';

  @override
  String get appIconOptionDefault => 'Varsayılan';

  @override
  String get appIconOptionStarfield => 'Yıldız alanı';

  @override
  String get appIconOptionSweden => 'İsveç';

  @override
  String get appIconOptionGreyscale => 'Greyscale';

  @override
  String get appIconOptionRainbow => 'Rainbow';

  @override
  String get appIconOptionWaves => 'Waves';

  @override
  String get appIconOptionChromaticAberration => 'Chromatic aberration';

  @override
  String get appIconOptionDefaultBrutalist => 'Brutalist';

  @override
  String get appIconOptionGreyscaleBrutalist => 'Greyscale brutalist';

  @override
  String get appIconUnsupported =>
      'Uygulama simgesini değiştirme bu cihazda kullanılamıyor.';

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
      'Videoyu sararken küçük resim veya canlı kare göster';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Dokunsal geri bildirim';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Dokunma ve eylemler için titreşim geri bildirimi. Cihazlar arasında eşitlenmez.';

  @override
  String get advancedSettingShowNekoLabel => 'Neko\'yu göster';

  @override
  String get advancedSettingShowNekoDescription =>
      'İmlecinizi takip eden Neko kedisi';

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
      'Araç ipuçlarında klavye kısayolu ipuçları';

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
      'Topluluk sesli kanallarına katılmak için onay veya çift tıklama';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Sesli kanallara katılmak için çift tıklama gerektir';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Sesli kanallara katılmadan önce onayla';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Seçildiğinde GIF\'leri otomatik gönder';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'GIF\'leri seçiciden onay almadan otomatik olarak gönderin';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'GIF favorilerini kayıtlı medya olarak kaydet';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Yıldızlı GIF favorilerinin nasıl depolanacağını seçin';

  @override
  String get advancedSettingMediaButtonsLabel => 'Medya düğmeleri';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Medya eklerinde ve gömülü içeriklerde hangi düğmelerin ve göstergelerin görüneceğini özelleştirin';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Göndermeden önce ekleri yükle';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Ekler, mesaj girişine eklenir eklenmez yüklenmeye başlar';

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
  String get advancedSettingReverseImageSearchLabel => 'Ters görsel arama';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Ters görsel arama sağlayıcıları';

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
      'Sessize aldığınız kanalları topluluk kenar çubuklarından gizleyin';

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
      'Shift ile genişletmeyi etkinleştir';

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
      'Kayıtlı medyayı ifade otomatik tamamlamada göster';

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
      'Yeni ses cihazı bağlandığında sor';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Bağlantı sesi düzeyi denetimleri';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Ses menülerinde cihaza özel katılımcı ses seviyesi kaydırıcılarını göster';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Ekran paylaşımı önizleme davranışı';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Önizleme, açılır pencere ve yayın küçük resmi davranışı';

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
  String get advancedSettingBuiltInTranslatorsLabel => 'Yerleşik çevirmenler';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Yerleşik çevirmenleri etkinleştirin veya devre dışı bırakın. Etkinleştirilen çevirmenler, metin seçildiğinde mesaj bağlam menüsünde görünür.';

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
      'Aşağıdan en az bir çeviri sağlayıcısını etkinleştirin.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Çevirmeni kaldır';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Varsayılan ters görsel arama';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Bir görseli ararken hangi ters görsel arama hizmetinin varsayılan olarak kullanılacağını seçin.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Yerleşik ters görsel arama';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Yerleşik tersine görsel arama sağlayıcılarını etkinleştirin veya devre dışı bırakın. Etkinleştirilen sağlayıcılar, görsellerin, avatarların, banner\'ların, çıkartmaların ve emojilerin bağlam menüsünde görünür.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Özel ters görsel arama';

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
      'Ters görsel aramayı kaldır';

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
      'Ters görsel arama motorunu düzenle';

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
      'Ters görsel aramam';

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
  String get userSettingsNavDeveloperTools => 'Geliştirici araçları';

  @override
  String get userSettingsNavLimitsConfig => 'Limitler Yapılandırması';

  @override
  String get userSettingsNavFeatureFlags => 'Özellik Bayrakları';

  @override
  String get userSettingsNavWhatsNew => 'Yenilikler';

  @override
  String get userSettingsJoinFluxerLabs => 'Fluxer Labs\'a Katıl';

  @override
  String get userSettingsGiveFeedback => 'Give feedback';

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
  String get userSettingsNavLogOut => 'Çıkış yap';

  @override
  String get userSettingsLogOutConfirmTitle => 'Çıkış yapılsın mı?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'İstediğiniz zaman tekrar giriş yapabilirsiniz.';

  @override
  String get quickSwitcherTabSearch => 'Ara';

  @override
  String get quickSwitcherTabFriends => 'Arkadaşlar';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Kanallarda, kişilerde veya topluluklarda ara';

  @override
  String get quickSwitcherSearchFriends => 'Arkadaş ara';

  @override
  String get quickSwitcherNoMatchesFound => 'Eşleşme bulunamadı';

  @override
  String get quickSwitcherEmptyHint =>
      'Farklı bir ad deneyin veya sonuçları filtrelemek için @ / # / ! / * ön eklerini kullanın.';

  @override
  String get quickSwitcherSectionPeople => 'Kişiler';

  @override
  String get quickSwitcherSectionGroupMessages => 'Grup mesajları';

  @override
  String get quickSwitcherSectionTextChannels => 'Metin kanalları';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Sesli kanallar';

  @override
  String get quickSwitcherSectionCommunities => 'Topluluklar';

  @override
  String get quickSwitcherSectionSettings => 'Ayarlar';

  @override
  String get quickSwitcherHomeLabel => 'Giriş';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Doğrudan mesajlar';

  @override
  String get quickSwitcherFavoritesLabel => 'Favoriler';

  @override
  String get quickSwitcherUserSettingsLabel => 'Kullanıcı ayarları';

  @override
  String get quickSwitcherNotificationsLabel => 'Bildirimler';

  @override
  String get quickSwitcherBookmarksLabel => 'Yer işaretleri';

  @override
  String get savedMessagesEmptyTitle => 'Yer işareti yok';

  @override
  String get savedMessagesEmptyBody =>
      'Mesajları daha sonra görmek için yer işaretlerine ekleyin.';

  @override
  String get savedMessagesEndBody => 'Burada başka gösterilecek bir şey yok.';

  @override
  String get savedMessagesRemoveTooltip => 'Yer işaretini kaldır';

  @override
  String get savedMessagesAddedToast => 'Yer işaretlerine eklendi';

  @override
  String get savedMessagesRemovedToast => 'Yer işaretlerinden kaldırıldı';

  @override
  String get quickSwitcherMentionsLabel => 'Bahsetmeler';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Henüz arkadaş yok';

  @override
  String get quickSwitcherFriendsEmptyHint =>
      'Başlamak için bir arkadaş ekleyin.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Bu aramaya uyan arkadaş bulunamadı';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Farklı bir ad deneyin.';

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
  String get quickSwitcherSearchAliasInbox => 'Gelen kutusu';

  @override
  String get quickSwitcherSearchAliasSaved => 'Kaydedildi';

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
  String get uiStartVideoCall => 'Görüntülü arama başlat';

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
  String get mentionConfirmButton => 'Bahset';

  @override
  String get composerEmojiUnavailable => 'Bu emojiyi burada kullanamazsın.';

  @override
  String get instanceUrlLabel => 'Kurulum URL\'si';

  @override
  String get instanceUrlPlaceholder =>
      'Kurulum URL\'sini girin (ör. fluxer.app)';

  @override
  String get instanceUrlHelper =>
      'Resmi kurulum için fluxer.app\'i veya kendi barındırdığınız bir kurulumun tam URL\'sini kullanın.';

  @override
  String get resetToDefaultInstance => 'Fluxer\'a sıfırla';

  @override
  String get instanceConnect => 'Bağlan';

  @override
  String get instanceConnecting => 'Bağlanıyor…';

  @override
  String get instanceConnectFailed => 'Kuruluma bağlanılamadı';

  @override
  String get instanceInvalidDiscoveryResponse =>
      'This client cannot connect to this instance. The instance is likely out of date. If the instance is up to date, try updating this app.';

  @override
  String get recentInstances => 'Son kurulumlar';

  @override
  String removeRecentInstance(String domain) {
    return '$domain kurulumunu son kurulumlardan kaldır';
  }

  @override
  String get instanceSheetTitle => 'Kuruluma bağlan';

  @override
  String get changeInstance => 'Değiştir';

  @override
  String get instanceConnectionRequired =>
      'Giriş yapmak için kuruluma bağlanın';

  @override
  String get comingSoon => 'Çok yakında';

  @override
  String get guildNavbarDirectMessages => 'Doğrudan mesajlar';

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
  String get discoveryCategoryScienceAndTechnology => 'Bilim ve teknoloji';

  @override
  String get discoveryCategoryContentCreator => 'İçerik üreticisi';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime ve manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Filmler ve TV';

  @override
  String get discoveryCategoryOther => 'Diğer';

  @override
  String get discoveryNoCommunitiesMatch => 'Hiçbir topluluk eşleşmiyor.';

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
  String get discoveryJoinErrorGenericTitle => 'Bu topluluğa katılamadınız';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Bir şeyler ters gitti. Lütfen birazdan tekrar deneyin.';

  @override
  String get discoveryJoinErrorFullTitle => 'Bu topluluk dolu';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Bu topluluk üye sınırına ulaştı, bu yüzden şu anda katılamazsınız.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle => 'Topluluk sınırına ulaştınız';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Katılabileceğiniz en fazla topluluk sayısına ulaştınız. Birinden ayrılıp tekrar deneyin.';

  @override
  String get discoveryJoinErrorBannedTitle => 'Bu topluluğa katılamazsınız';

  @override
  String get discoveryJoinErrorBannedMessage => 'Bu topluluktan yasaklandınız.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Bu topluluk artık kullanılamıyor';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Keşfet\'ten kaldırılmış veya yeni katılımları kapatmış olabilir. Sayfayı yenilediğinizde bir daha görmezsiniz.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Çok hızlı gidiyorsunuz';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Lütfen bir süre bekleyip tekrar deneyin.';

  @override
  String get guildNavbarAddCommunity => 'Topluluk ekle';

  @override
  String get guildNavbarHelp => 'Yardım';

  @override
  String get scrollIndicatorNew => 'YENİ';

  @override
  String get scrollIndicatorNewMessage => 'YENİ MESAJ';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return '$folderName klasörünü daralt';
  }

  @override
  String get guildNavbarGuildSelected => 'seçildi';

  @override
  String get guildNavbarGuildUnread => 'okunmadı';

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
  String get navigationItemMuted => 'sessize alındı';

  @override
  String get authShowPassword => 'Parolayı göster';

  @override
  String get authHidePassword => 'Parolayı gizle';

  @override
  String get authCheckStillWorking => 'Hâlâ çalışıyor…';

  @override
  String get authVerificationFailed =>
      'Doğrulama tamamlanamadı. Tekrar deneyin.';

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
  String get friendsOpenInbox => 'Gelen kutusu';

  @override
  String get profileRemoveFriend => 'Arkadaşlıktan çıkar';

  @override
  String get profileUnblockUser => 'Kullanıcının engelini kaldır';

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
  String get guildBulkUnmuteCommunities => 'Toplulukları sessizden çıkar';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Topluluk bildirim ayarları';

  @override
  String get guildBulkCommunityPrivacySettings => 'Topluluk gizlilik ayarları';

  @override
  String get guildBulkAllowEveryoneAndHere => '@everyone ve @here\'a izin ver';

  @override
  String get guildBulkAllowRoleMentions => 'Rol bahsetmelerine izin ver';

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
      'Botlardan doğrudan mesajlara izin ver';

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
  String get guildNavbarTextChannel => 'Metin kanalı';

  @override
  String get guildNavbarTextChannelDescription =>
      'Mesaj, resim, GIF ve emoji gönderin';

  @override
  String get guildNavbarVoiceChannel => 'Sesli kanal';

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
  String get guildNavbarPrivateChannel => 'Private channel';

  @override
  String get guildNavbarPrivateChannelDescription =>
      'Only selected members and roles will be able to view this channel.';

  @override
  String get guildNavbarAddMembersOrRoles => 'Add members or roles';

  @override
  String get guildNavbarAddMembersOrRolesHint => 'Search members or roles';

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
  String get guildNavbarNoResults => 'Sonuç bulunamadı';

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
      'Bu davet bağlantısının süresi hiç dolmaz.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Davet bağlantınız $duration içinde sona erer.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Davet bağlantısını düzenle';

  @override
  String get guildNavbarInviteLinkSettings => 'Davet bağlantısı ayarları';

  @override
  String get guildNavbarExpireAfter => 'Sona erme süresi';

  @override
  String get guildNavbarMaxUses => 'Maksimum kullanım sayısı';

  @override
  String get guildNavbarGrantTemporaryMembership => 'Geçici Üyelik Ver';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Rol atanmadığı sürece üyeler çevrimdışı olduklarında kaldırılacaktır';

  @override
  String get guildNavbarCreateNewLink => 'Yeni bağlantı oluştur';

  @override
  String get guildNavbarSent => 'Gönderildi';

  @override
  String get guildNavbarInvite => 'Davet Et';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Topluluktan ayrıl';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Bu topluluktan ayrılmak istediğinizden emin misiniz? Artık hiçbir mesajı göremeyeceksiniz.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Topluluktan ayrıl';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Bu topluluktaki mesajlarınızı silmek istiyor musunuz?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Burada, her kanalda gönderdiğiniz her mesajı kalıcı olarak silin. Geri alınamaz.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Mesajlarımı sil';

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
  String get guildNavbarNoLimit => 'Sınır yok';

  @override
  String get guildNavbarOneUse => '1 kullanım';

  @override
  String guildNavbarUses(int count) {
    return '$count kullanım';
  }

  @override
  String get guildMenuMarkAsRead => 'Okundu olarak işaretle';

  @override
  String get guildPeekMoreOptions => 'Diğer seçenekler';

  @override
  String get guildMenuInviteMembers => 'Üye davet et';

  @override
  String get guildMenuCommunitySettings => 'Topluluk ayarları';

  @override
  String get guildMenuEditCommunityProfile => 'Topluluk profilini düzenle';

  @override
  String get guildMenuUnmuteCommunity => 'Topluluğu sessizden çıkar';

  @override
  String get guildMenuMuteCommunity => 'Topluluğu sessize al';

  @override
  String get guildMenuHideMutedChannels => 'Sessize alınmış kanalları gizle';

  @override
  String get guildMenuDebugCommunity => 'Toplulukta hata ayıkla';

  @override
  String get guildMenuCopyCommunityId => 'Topluluk kimliğini kopyala';

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
  String get guildMenuSettingsActivityLog => 'Etkinlik günlüğü';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook\'lar';

  @override
  String get guildMenuSettingsDiscovery => 'Keşfet';

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
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewNameTitle => 'Ad';

  @override
  String get guildSettingsOverviewNameHint => 'Harika topluluğum';

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
      'Bu rolden bahsedilmesine izin ver';

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
  String get guildSettingsRolesSingleColumn => 'Tek sütun';

  @override
  String get guildSettingsRolesTwoColumns => 'İki sütun';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'İzin bulunamadı';

  @override
  String get guildSettingsRolesHoistOrder => 'Yükseltme sırası';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Varsayılana sıfırla';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Üye listesinde görünme sıralarını özelleştirmek için rolleri sürükleyin.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Yükseltilmiş rol yok. Bir rolü burada görmek için \"Bu rolü ayrı göster\" seçeneğini etkinleştirin.';

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
      'Yükseltme sırası sıfırlanamadı';

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
  String get permissionAdministrator => 'Yönetici';

  @override
  String get permissionAdministratorDescription =>
      'Tüm izinleri verir ve kanal kısıtlamalarını atlar. Çok hassastır.';

  @override
  String get permissionViewActivityLog => 'Etkinlik günlüğünü görüntüle';

  @override
  String get permissionViewActivityLogDescription =>
      'Topluluğun değişiklikleri ve moderasyon eylemlerini içeren etkinlik günlüğünü okuyun.';

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
      'Bu kanalı yeniden adlandırın ve ayarlarını düzenleyin.';

  @override
  String get permissionManagePermissions => 'İzinleri yönet';

  @override
  String get permissionManagePermissionsDescription =>
      'Bu kanaldaki roller ve üyeler için geçersiz kılmaları düzenleyin.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Bu kanal için webhook\'lar oluşturun, düzenleyin veya silin.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Bu kanalın üye listesini görün.';

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
      'Kendi takma adınızı güncelleyin.';

  @override
  String get permissionManageNicknames => 'Takma adları yönet';

  @override
  String get permissionManageNicknamesDescription =>
      'Diğer üyelerin takma adlarını değiştirin.';

  @override
  String get permissionCreateEmojiStickers => 'Emoji ve çıkartma oluştur';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Yeni emoji ve çıkartmalar yükleyin, kendi oluşturduklarınızı yönetin.';

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
      'Diğer üyelerin mesajlarını silin. Sabitleme ayrı olarak yönetilir.';

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
      'Herkesten veya herhangi bir rolden bahset (rol bahsedilebilir olarak ayarlanmamış olsa bile).';

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
      'Mesajlara yeni tepkiler ekleyin.';

  @override
  String get permissionBypassSlowmode => 'Yavaş modu atla';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Kanal başına mesaj gönderme hız limitlerini yok sayın.';

  @override
  String get permissionTimeOutMembers => 'Üyelere zaman aşımı uygula';

  @override
  String get permissionTimeOutMembersDescription =>
      'Üyelerin belirli bir süre boyunca mesaj göndermesini, tepki vermesini ve sesli sohbete katılmasını engelleyin.';

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
  String get permissionDeafenMembers => 'Üyeleri sağırlaştır';

  @override
  String get permissionMoveMembers => 'Üyeleri taşı';

  @override
  String get permissionMoveMembersDescription =>
      'Erişebildikleri kanallar arasında üyeleri sürükleyip bırakın.';

  @override
  String get permissionSetVoiceRegion => 'Ses bölgesini ayarla';

  @override
  String get permissionManageThreads => 'Manage threads';

  @override
  String get permissionManageThreadsDescription =>
      'Rename, archive, lock and delete threads, set their slowmode, and view private threads.';

  @override
  String get permissionCreatePublicThreads => 'Create public threads';

  @override
  String get permissionCreatePublicThreadsDescription =>
      'Start threads that everyone who can view the channel can see.';

  @override
  String get permissionCreatePrivateThreads => 'Create private threads';

  @override
  String get permissionCreatePrivateThreadsDescription =>
      'Start invite-only threads.';

  @override
  String get permissionSendMessagesInThreads => 'Send messages in threads';

  @override
  String get permissionSendMessagesInThreadsDescription =>
      'Send messages in threads and forum posts.';

  @override
  String get threadErrorArchived => 'This thread is archived.';

  @override
  String get threadErrorLocked =>
      'This thread is locked. Only moderators can post or reopen it.';

  @override
  String get threadErrorAlreadyCreated =>
      'A thread already exists for this message.';

  @override
  String get threadErrorMaxActiveThreads =>
      'This community has reached its limit of active threads.';

  @override
  String get threadErrorMaxMembers =>
      'This thread has reached its member limit.';

  @override
  String get threadErrorMaxPinnedPosts =>
      'Only one post can be pinned in this forum.';

  @override
  String get threadErrorMaxForumTags => 'A forum can have at most 20 tags.';

  @override
  String get threadErrorTagNamesUnique => 'Tag names must be unique.';

  @override
  String get threadErrorNoTagsForEveryone =>
      'Add a tag everyone can use before requiring tags.';

  @override
  String get threadErrorTagRequired => 'Pick at least one tag for this post.';

  @override
  String get threadErrorUnknownTag =>
      'One of the selected tags no longer exists.';

  @override
  String get threadErrorInvalidNotificationSettings =>
      'Those notification settings are not valid for a thread.';

  @override
  String get threadErrorSearchIndexNotReady =>
      'Posts are still being indexed. Try again in a moment.';

  @override
  String get threadErrorInvalidChannelType =>
      'This action is not available in this channel.';

  @override
  String get threadCreate => 'Create thread';

  @override
  String get threadName => 'Thread name';

  @override
  String get threadNameRequired => 'Give the thread a name.';

  @override
  String get threadNewThreadPlaceholder => 'New thread';

  @override
  String get threadPrivate => 'Private thread';

  @override
  String get threadPrivateDescription =>
      'Only people you invite and moderators can see this thread.';

  @override
  String get threadStarterMessage => 'Message';

  @override
  String get threadStarterMessagePlaceholder =>
      'Enter a message to start the conversation!';

  @override
  String threadCreateCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can start another thread in $seconds seconds.',
      one: 'You can start another thread in 1 second.',
    );
    return '$_temp0';
  }

  @override
  String threadCreateFailed(String detail) {
    return 'Could not start the thread: $detail';
  }

  @override
  String get threadBrowserTitle => 'Threads';

  @override
  String get threadBrowserActive => 'Active';

  @override
  String get threadBrowserArchived => 'Closed';

  @override
  String get threadBrowserJoined => 'Joined';

  @override
  String get threadBrowserOtherActive => 'Other active threads';

  @override
  String get threadBrowserPublic => 'Public threads';

  @override
  String get threadBrowserPrivate => 'Private threads';

  @override
  String get threadBrowserEmpty =>
      'There are no threads. Stay focused on a conversation with a thread, a temporary text channel.';

  @override
  String get threadBrowserArchivedEmpty => 'There are no closed threads.';

  @override
  String get threadBrowserLoadMore => 'Load more';

  @override
  String get threadBrowserSearch => 'Search threads';

  @override
  String get threadBrowserSearchEmpty => 'No threads match';

  @override
  String get threadBrowserSearchEmptyHint =>
      'Try a different name or check the other tab.';

  @override
  String get threadBrowserSearchFailed =>
      'Couldn\'t search threads. Try again later.';

  @override
  String get threadBrowserSearchIndexing =>
      'Search is getting ready for this community. Trying again shortly...';

  @override
  String threadMessageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count messages',
      one: '1 message',
    );
    return '$_temp0';
  }

  @override
  String get threadFailedToMentionSomeRoles =>
      'Some mentioned roles were not added to this thread.';

  @override
  String get threadMembers => 'Thread members';

  @override
  String threadMembersCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count members',
      one: '1 member',
    );
    return '$_temp0';
  }

  @override
  String get threadMembersEmpty => 'Nobody has joined this thread yet.';

  @override
  String threadRemoveMember(String name) {
    return 'Remove $name from thread';
  }

  @override
  String get threadJoin => 'Join thread';

  @override
  String get threadLeave => 'Leave thread';

  @override
  String get threadJoinNotice =>
      'Join this thread to follow it in your channel list and get notifications.';

  @override
  String get threadArchivedNotice =>
      'This thread is closed. Sending a message will open it again.';

  @override
  String get threadLockedNotice =>
      'This thread is locked. Only moderators can send messages.';

  @override
  String get threadArchive => 'Close thread';

  @override
  String get threadUnarchive => 'Open thread again';

  @override
  String get threadLock => 'Lock thread';

  @override
  String get threadUnlock => 'Unlock thread';

  @override
  String get threadDelete => 'Delete thread';

  @override
  String threadDeleteConfirm(String threadName) {
    return 'Are you sure you want to delete $threadName? This cannot be undone.';
  }

  @override
  String get threadDeleted => 'Thread deleted';

  @override
  String get threadMarkAsRead => 'Mark as read';

  @override
  String get threadMute => 'Mute thread';

  @override
  String get threadUnmute => 'Unmute thread';

  @override
  String get threadMuted => 'Thread muted';

  @override
  String get threadUnmuted => 'Thread unmuted';

  @override
  String get threadNotificationSettings => 'Notification settings';

  @override
  String get threadNotificationParentDefault => 'Use channel default';

  @override
  String get threadCopyLink => 'Copy link';

  @override
  String get threadCopyId => 'Copy thread ID';

  @override
  String get threadMoreOptions => 'More options';

  @override
  String get threadSettings => 'Thread settings';

  @override
  String get threadSettingsSaved => 'Thread settings saved';

  @override
  String get threadAutoArchive => 'Hide after inactivity';

  @override
  String get threadAutoArchiveDescription =>
      'The thread stops showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultAutoArchive => 'Default hide after inactivity';

  @override
  String get threadDefaultAutoArchiveDescription =>
      'New threads stop showing in the channel list after this period of inactivity.';

  @override
  String get threadDefaultSlowmode => 'Default thread slowmode';

  @override
  String get threadAutoArchiveOneHour => '1 Hour';

  @override
  String get threadAutoArchiveOneDay => '24 Hours';

  @override
  String get threadAutoArchiveThreeDays => '3 Days';

  @override
  String get threadAutoArchiveOneWeek => '1 Week';

  @override
  String get threadInvitable => 'Allow anyone to invite';

  @override
  String get threadInvitableDescription =>
      'Members of this private thread can add other people.';

  @override
  String threadStartedBy(String name) {
    return 'Started by $name';
  }

  @override
  String get threadStarterDeleted => 'Original message was deleted.';

  @override
  String systemThreadCreated(
    String username,
    String threadLink,
    String allThreadsLink,
  ) {
    return '$username started a thread: $threadLink. See $allThreadsLink.';
  }

  @override
  String get systemThreadCreatedAllThreadsLink => 'all threads';

  @override
  String get systemThreadCreatedThreadFallback => 'a thread';

  @override
  String systemPreviewThreadCreated(String username) {
    return '$username started a thread.';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Henüz özel emoji yok.';

  @override
  String get guildSettingsStickersEmpty => 'Henüz özel çıkartma yok.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Üye doğrulama';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Üyelerin mesaj gönderebilmek veya topluluk üyelerine DM gönderebilmek için nelere sahip olması gerektiğini seçin.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Rolü olan üyeler bu kontrolleri atlayabilir. Herkese açık alanlar için doğrulamayı etkinleştirmenizi öneririz.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Keşfet\'te listelenen toplulukların en azından doğrulanmış bir e-postaya sahip olması gerekir. Keşfet etkinleştirildiğinde Hiçbiri seçilemez.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Yetişkinlere uygun içerik ve içerik uyarıları';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Üyeler için müstehcen içerik etiketlemesini ve isteğe bağlı içerik uyarılarını yapılandırın.';

  @override
  String get guildSettingsModerationMatureToggle => 'Yetişkinlere uygun içerik';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Bu topluluğu müstehcen içerik barındırıyor olarak işaretleyin.';

  @override
  String get guildSettingsVerificationNone => 'Yok';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Doğrulama gerekmiyor.';

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
      'Orta seviyedeki her şeye ek olarak, topluluğun en az 10 dakikadır üyesi olmayı gerektirir.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Topluluk genelindeki moderatör eylemlerini takip edin.';

  @override
  String get guildSettingsAuditLogEmpty => 'Henüz kayıt yok';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Moderasyon işlemleri ve topluluk değişiklikleri burada görünecektir.';

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
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

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
  String get auditLogActionMemberBanRemove => 'Üyenin yasağı kaldırıldı';

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
  String get auditLogActionMessageUnpin => 'Mesajın sabitlemesi kaldırıldı';

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
  String auditLogSummaryThreadCreate(String actor, String target) {
    return '$actor started the thread $target.';
  }

  @override
  String auditLogSummaryThreadUpdate(String actor, String target) {
    return '$actor updated the thread $target.';
  }

  @override
  String auditLogSummaryThreadDelete(String actor, String target) {
    return '$actor deleted the thread $target.';
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
  String get guildSettingsWebhooksDescription =>
      'Topluluğunuzda yapılandırılmış tüm webhook\'ları görüntüleyin ve yönetin.';

  @override
  String get guildSettingsWebhooksEmpty => 'Webhook yok';

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
  String get guildSettingsCopiedUrl => 'URL panoya kopyalandı';

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
      'Topluluğunuz Keşfet\'te listeleniyor. Aşağıdan ilan ayrıntılarınızı güncelleyebilir veya kaldırmak için geri çekebilirsiniz.';

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
      'Topluluğunuzun neyle ilgili olduğunu açıklayın';

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
      'Bir etiket ekleyip Enter\'a basın';

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
  String get guildSettingsDiscoveryWithdraw => 'Geri çek';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Keşfet başvurusu gönderildi';

  @override
  String get guildSettingsDiscoveryListingUpdated => 'Keşfet ilanı güncellendi';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Keşfet başvurusu geri çekildi';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Başvuru geri çekilemedi';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Birazdan tekrar deneyin.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Kullanıcı adına veya kimliğe göre ara';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count üye';
  }

  @override
  String get guildMembersRecentTitle => 'Son katılan üyeler';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return '$displayedCount / $totalCount toplam üye gösteriliyor';
  }

  @override
  String get guildMembersSort => 'Sırala';

  @override
  String get guildSettingsMembersSortNewest => 'Önce en yeni';

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
  String get guildMembersJoinSourceCreator => 'Topluluk kurucusu';

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
  String get guildMembersChannelListLabel => 'Üyeler';

  @override
  String get guildSettingsInvitesTitle => 'Davetler';

  @override
  String get guildSettingsInvitesDescription =>
      'Bu topluluğun tüm davetlerini görüntüleyin. Yeni bir davet oluşturmak için bir kanala gidin ve davet düğmesini kullanın.';

  @override
  String get guildSettingsInvitesEmpty => 'Davet bağlantısı yok';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Bu topluluğun henüz davet bağlantısı yok. Kişileri davet etmek için bir kanala gidip davet oluşturun.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'Davetler yüklenemedi';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Davetler yüklenirken bir hata oluştu. Tekrar deneyin.';

  @override
  String get guildSettingsInvitesTryAgain => 'Tekrar dene';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Sona erme tarihi yerine oluşturulma tarihini göster';

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
      'Davetler duraklatılsın mı? Yeniden etkinleştirene kadar yeni kullanıcılar davet bağlantılarıyla katılamaz. Mevcut üyeler etkilenmez.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Davetler etkinleştirilsin mi? Kullanıcılar bu topluluğa davet bağlantıları aracılığıyla tekrar katılabilecek.';

  @override
  String get guildSettingsInvitesPause => 'Duraklat';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Bu topluluk için davetler duraklatıldı.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return '$productName olası bir baskın algıladığı için davetler duraklatıldı. Yeni kullanıcılar şu anda katılamaz.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Davet eden:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kanal:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kod:';

  @override
  String get guildSettingsInvitesLabelUses => 'Kullanım:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Oluşturuldu:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Sona eriyor:';

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
  String get guildSettingsInvitesRevoke => 'Daveti iptal et';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => 'Davet geri alınamadı';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Bağlantı hâlâ çalışıyor olabilir. Birazdan tekrar deneyin.';

  @override
  String get guildSettingsBansDescription =>
      'Yasaklı kullanıcıları görüntüle ve yönet.';

  @override
  String get guildSettingsBansSearchHint => 'Yasaklıları ara';

  @override
  String get guildSettingsBansEmpty => 'Yasaklanmış kullanıcı yok.';

  @override
  String get guildSettingsBanExpiresLabel => 'Sona eriyor';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Aramanızla eşleşen yasaklama bulunamadı.';

  @override
  String get guildSettingsBanDetailsTitle => 'Yasaklama ayrıntıları';

  @override
  String get guildSettingsBanViewDetails => 'Ayrıntıları görüntüle';

  @override
  String get guildSettingsBannedOn => 'Yasaklanma tarihi';

  @override
  String get guildSettingsBannedBy => 'Yasaklayan';

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
  String get guildSettingsRevokeBanError =>
      'Yasaklama kaldırılamadı. Tekrar deneyin.';

  @override
  String get guildSettingsCommunitySettings => 'Topluluk ayarları';

  @override
  String get guildSettingsDeleteCommunity => 'Topluluğu sil';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Bu topluluğu silmek istediğinizden emin misiniz? Bu işlem geri alınamaz. Tüm kanallar, mesajlar ve ayarlar kalıcı olarak silinecektir.';

  @override
  String get guildSettingsCommunityDeleted => 'Topluluk silindi';

  @override
  String get guildSettingsDeleteCommunityFailed => 'Bu topluluk silinemedi';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Marka';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Simgesini, adını, banner\'ını ve davet arka planını güncelle';

  @override
  String get guildSettingsOverviewBannerUpload => 'Banner yükle';

  @override
  String get guildSettingsOverviewIdleTitle => 'Boşta kalma ayarları';

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
      '250\'den fazla kişiye sahip topluluklar \"yalnızca bahsetmeler\" ayarına zorlanır. Orijinal ayarınız korunur ve topluluk 250 üyenin altına düşerse geri yüklenir.';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Esnek metin kanalı adlarına izin ver';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Topluluk sahibi tacını gizle';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Ayrılmış başlık';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Banner\'ı topluluk başlığının altındaki kendi bölümünde gösterir.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Simge yükle';

  @override
  String get guildSettingsOverviewRemoveImage => 'Kaldır';

  @override
  String get guildSettingsOverviewSplashTitle => 'Davet arka planı';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Sohbet gömülü içerik arka planı';

  @override
  String get guildSettingsOverviewUploadBackground => 'Arka plan yükle';

  @override
  String get guildSettingsOverviewNoCommunityBanner => 'Topluluk afişi yok';

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
      'Mesaj geçmişi eşiği ayarlarını aç';

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
      'Metin kanalı adlarında büyük harflere ve boşluklara izin ver. Kapalı olduğunda adlar küçük harflerle, kısa çizgi ve alt çizgiyle sınırlanır.';

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
  String get guildSettingsModerationContentFilterTitle => 'İçerik filtreleme';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Yetişkinlere yönelik içerik olarak işaretlenmemiş kanallardaki mesajları müstehcen içeriğe karşı otomatik olarak tarar.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Keşfedilen toplulukların tüm üyeleri taraması zorunludur. Keşif etkinleştirildiğinde bu ayar değiştirilemez.';

  @override
  String get guildSettingsContentFilterOff => 'Kapalı';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Topluluğun kendi kendini denetlemesine izin ver';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Rolü olmayan üyeleri filtrele';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Çoğu topluluk için önerilir';

  @override
  String get guildSettingsContentFilterAll => 'Herkese filtre uygula';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Aile dostu alanlar için maksimum koruma';

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
  String get guildSettingsModeration2faTitle => '2FA gereksinimi';

  @override
  String get guildSettingsModeration2faDescription =>
      'Yöneticilerin yasaklama, atma, zaman aşımına uğratma veya mesaj silme işlemlerini gerçekleştirebilmeleri için iki faktörlü kimlik doğrulama gerektir.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Moderasyon işlemleri için 2FA zorunlu kıl';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Bu ayarı değiştirmek için hesabınızda 2FA\'yı etkinleştirin';

  @override
  String get guildSettingsEmojiSearchHint => 'Emojileri ara';

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
  String get guildSettingsEmojiSlotsFull =>
      'Maksimum emoji sayısına ulaştınız. Yer açmak için mevcut emojilerden bazılarını silin.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Emoji adları en az 2 karakter olmalıdır ve harf, rakam ve alt çizgi içerebilir. Emojiler $maxSize boyutunun altında olmalıdır. Statik görseller otomatik olarak 128x128 piksele yeniden boyutlandırılır ve sıkıştırılır. Hareketli emojiler ve SVG\'ler bu sınıra baştan uymalıdır.';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle => 'Bazı emojiler eklenemedi';

  @override
  String get guildSettingsEmojiRenameTitle => 'Emojiyi yeniden adlandır';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 karakter, harf, sayı, alt çizgi.';

  @override
  String get guildSettingsEmojiColumnName => 'Ad';

  @override
  String get guildSettingsEmojiColumnUploader => 'Yükleyen';

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
      'Emoji adı en az 2 karakter uzunluğunda olmalıdır';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Emoji adı en fazla 32 karakter uzunluğunda olmalıdır';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Geçersiz emoji adı';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Bu emojinin adı değiştirilemedi';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => 'Bu emoji silinemedi';

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
      'Çıkartma kopyalama güncellenemedi';

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
  String get guildSettingsStickerDensityCompact => 'Kompakt';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'Çıkartmalar yüklenemedi';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Çıkartmalar yüklenirken bir hata oluştu. Tekrar deneyin.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Aramanızla eşleşen çıkartma bulunamadı.';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Çıkartma sınırına ulaştınız. Yer açmak için mevcut çıkartmalardan bazılarını silin.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Çıkartmalar 320x320 piksel boyutunda kaydedilir ve $maxSize boyutundan küçük olmalıdır. Statik görseller otomatik olarak yeniden boyutlandırılır ve sıkıştırılır. Animasyonlu çıkartmaların ve SVG\'lerin zaten bu sınıra uyması gerekir.';
  }

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
  String get guildSettingsStickerDescriptionHint => 'Çıkartmayı açıklayın';

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
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Webhook oluşturmak için $channelSettingsPath bölümünü açın. Mevcut tüm webhook\'ları buradan düzenleyebilir ve organize edebilirsiniz.';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'Yasaklı kullanıcılar';

  @override
  String get guildSettingsInvitesTableInviter => 'Davet eden';

  @override
  String get guildSettingsInvitesTableChannel => 'Kanal';

  @override
  String get guildSettingsInvitesTableCode => 'Kod';

  @override
  String get guildSettingsInvitesTableUses => 'Kullanım';

  @override
  String get guildSettingsInvitesTableCreated => 'Oluşturuldu';

  @override
  String get guildSettingsInvitesTableExpires => 'Sona eriyor';

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
  String get createDmNoFriendsYet => 'Henüz hiç arkadaşınız yok';

  @override
  String get createDmClaimToStartDms =>
      'DM başlatmak için hesabınızı sahiplenin.';

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
      'Aşağıdaki kişiler bu grup DM\'ine eklenemiyor:';

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
  String get dmListDirectMessagesTitle => 'Doğrudan mesajlar';

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
  String get keybindSectionVoiceAndVideo => 'Ses ve video';

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
      'Bahsedildiğiniz okunmamış kanallar arasında geçiş yap';

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
  String get keybindActionGoToDms => 'Doğrudan mesajlara git';

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
  String get keybindActionToggleQuickSwitcher => 'Hızlı geçişi aç/kapat';

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
  String get keybindActionScrollChatUp => 'Sohbeti yukarı kaydır';

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
  String get keybindActionToggleSavedMedia => 'Kayıtlı medyayı aç/kapat';

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
      'Kompakt arama görünümünü genişlet veya daralt';

  @override
  String get keybindActionPushToTalkPriority => 'Bas konuş (öncelikli)';

  @override
  String get keybindActionVoiceActivityPriority => 'Ses etkinliği önceliği';

  @override
  String get keybindActionOpenHelp => 'Yardımı aç';

  @override
  String get keybindActionSearchMessages => 'Mesajları ara';

  @override
  String get keybindActionOpenContextMenu => 'Bağlam menüsünü aç';

  @override
  String get keybindActionOpenSettings => 'Ayarları aç';

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

  @override
  String get assistantNeedsLogin => 'Önce Fluxer\'ı açın ve oturum açın.';

  @override
  String get assistantNotInVoice => 'Bir aramada değilsiniz.';

  @override
  String get assistantNotFound => 'Fluxer bunu bulamadı.';

  @override
  String get assistantDmsDisabled =>
      'Bu kurulumda doğrudan mesajlar devre dışı bırakıldı.';

  @override
  String get assistantFailed => 'Fluxer bunu tamamlayamadı.';

  @override
  String get assistantOkMuted => 'Mikrofon kapatıldı.';

  @override
  String get assistantOkUnmuted => 'Mikrofon açıldı.';

  @override
  String get assistantOkLeftVoice => 'Sesli kanaldan ayrıldınız.';

  @override
  String get assistantOkJoinedVoice => 'Sesli kanala katılınıyor.';

  @override
  String get assistantOkStartedCall => 'Arama başlatılıyor.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Durum $status olarak ayarlandı.';
  }

  @override
  String get assistantOkOpened => 'Fluxer açılıyor.';

  @override
  String get assistantOkMessageSent => 'Mesaj gönderildi.';

  @override
  String get assistantOkCustomStatusSet => 'Özel durum güncellendi.';

  @override
  String get assistantOkCustomStatusCleared => 'Özel durum temizlendi.';

  @override
  String get guildNavbarAnnouncementChannel => 'Duyuru kanalı';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Diğer toplulukların kendi kanallarında takip edebileceği güncellemeler yayınla';

  @override
  String get channelDetailsAnnouncementChannel => 'Duyuru kanalı';

  @override
  String get channelSettingsAnnouncementChannel => 'Duyuru kanalı';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Diğer toplulukların bu kanalı takip etmesini ve yayınladıklarınızın kopyalarını almasını sağlar.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Duyuru kanalı olmaktan çıkılsın mı?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count kanal bu kanalı takip ediyor. Bu kanalı bir metin kanalına dönüştürmek, bu takipleri kaldırır.',
      one:
          '1 kanal bu kanalı takip ediyor. Bu kanalı bir metin kanalına dönüştürmek, bu takibi kaldırır.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Bu kanalı bir metin kanalına dönüştürürseniz onu takip eden tüm kanalların takibi kaldırılır.';

  @override
  String get channelSettingsConvertChannel => 'Dönüştür';

  @override
  String get channelSettingsConvertFailed => 'Bu kanal dönüştürülemedi';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Bu kanalı hâlâ başka kanallar takip ediyor. Dönüştürmeden önce bu takipleri kaldırın.';

  @override
  String get channelMenuFollow => 'Kanalı takip et';

  @override
  String get channelFollowTitle => 'Bu kanalı takip et';

  @override
  String get channelFollowBody =>
      'Yayınlanan mesajlarının nereye gideceğini seçin. Topluluk ayarları → Webhook\'lar bölümünden istediğiniz zaman takibi bırakabilirsiniz.';

  @override
  String get channelFollowCommunity => 'Topluluk';

  @override
  String get channelFollowChannel => 'Kanal';

  @override
  String get channelFollowAgeWarning =>
      'Bu, yaş kısıtlamalı bir kanaldır. Güncellemeler yalnızca yaş kısıtlamalı kanallara gidebilir.';

  @override
  String get channelFollowContentWarning =>
      'Bu kanalda içerik uyarısı var. Güncellemeler yalnızca içerik uyarısı veya yaş kısıtlaması olan kanallara gidebilir.';

  @override
  String get channelFollowHiddenHint =>
      'Webhook\'ları yönetemediğiniz topluluklar ve kanallar gizlenir.';

  @override
  String get channelFollowEmpty =>
      'Hiçbir toplulukta webhook\'ları yönetemiyorsunuz. Bu kanalı takip etmesi için bir yöneticiden yardım isteyin.';

  @override
  String get channelFollowSubmit => 'Takip et';

  @override
  String get channelFollowFailed => 'Bu kanal takip edilemedi.';

  @override
  String get channelFollowSuccessTitle => 'Güncellemeler yolda!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return '$sourceName kanalında yayınlanan mesajlar #$targetName kanalında görünecek.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Tamamdır!';

  @override
  String get channelFollowBarrier =>
      'Bu duyuruları seçtiğiniz bir kanalda almak için bu kanalı takip edin.';

  @override
  String get channelHeaderFollow => 'Kanalı takip et';

  @override
  String get chatMessagePublish => 'Yayınla';

  @override
  String get chatMessagePublished => 'Yayınlandı';

  @override
  String get chatMessagePublishConfirmTitle => 'Mesaj yayınlansın mı?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Bu, bu kanalı takip eden her kanala bir kopya gönderir.';

  @override
  String get chatMessagePublishedToast => 'Mesaj yayınlandı';

  @override
  String get chatMessageAlreadyPublished => 'Bu mesaj zaten yayınlandı.';

  @override
  String get chatMessagePublishFailedTitle => 'Bu mesaj yayınlanamadı';

  @override
  String get chatMessagePublishFailedBody =>
      'Bir sorun oluştu. Lütfen birazdan tekrar deneyin.';

  @override
  String get chatMessagePublishLimitTitle => 'Yavaşlayın';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return '$duration sonra tekrar yayınlayabilirsiniz.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Çok hızlı yayın yapıyorsunuz. Birazdan tekrar deneyin.';

  @override
  String get chatMessageDeletePublished =>
      'Bu işlem, bu kanalı takip eden kanallara gönderilen kopyaları da kaldırır.';

  @override
  String get chatMessageEditPublishedTitle =>
      'Yayınlanan mesaj düzenlensin mi?';

  @override
  String get chatMessageEditPublishedBody =>
      'Bu işlem, bu kanalı takip eden kanallara gönderilen kopyaları günceller.';

  @override
  String get chatMessageEditPublishedSave => 'Kaydet';

  @override
  String get chatMessageEditLimitTitle => 'Yavaşlayın';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Bu yayınlanmış mesajı $duration içinde tekrar düzenleyebilirsiniz.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Bu yayınlanmış mesajı çok hızlı düzenliyorsunuz. Lütfen bir süre sonra tekrar deneyin.';

  @override
  String get chatMessageOriginalDeleted => '[Orijinal mesaj silindi]';

  @override
  String get userTagCommunity => 'Topluluk';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username, bu kanalı $source kanalını takip edecek şekilde ayarladı. Orada yayınlanan mesajlar burada görünecek.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username, bu kanalı $source kanalını takip edecek şekilde ayarladı.';
  }

  @override
  String get publishNudgeNotSent => 'Henüz takipçilere gönderilmedi.';

  @override
  String get publishNudgeHideForever => 'Bir daha gösterme';

  @override
  String get publishNudgeDismiss => 'Kapat';

  @override
  String get channelSettingsFollowedChannels => 'Takip edilen kanallar';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Bu kanalın takip ettiği duyuru kanalları. Kopya almayı durdurmak için takibi bırakın.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Bu topluluktaki kanallar tarafından takip edilen duyuru kanalları.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'Kaynak: $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Kaynak kanal artık kullanılamadığı için güncellemeler duraklatıldı.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return '$name takibi bırakılsın mı?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Bu kanal, o duyuru kanalından kopya almayı durduracak.';

  @override
  String get channelSettingsUnfollow => 'Takibi bırak';

  @override
  String get crosspostCommunityTitle => 'Topluluk';

  @override
  String get crosspostGoToCommunity => 'Topluluğa git';

  @override
  String get crosspostJoinCommunity => 'Topluluğa katıl';

  @override
  String get crosspostSourceFailed =>
      'Bu topluluk yüklenemedi. Bir süre sonra tekrar deneyin.';

  @override
  String crosspostMembers(int count) {
    return '$count üye';
  }

  @override
  String crosspostOnline(int count) {
    return '$count çevrimiçi';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count dakika',
      one: '1 dakika',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count saniye',
      one: '1 saniye',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Desteklenmeyen kanal türü';

  @override
  String get channelUnsupportedBody =>
      'Uygulamanın bu sürümü bu kanal türünü desteklemiyor.';

  @override
  String get channelDetailsUnsupportedChannel => 'Desteklenmeyen kanal';

  @override
  String get forumChannelTypeForum => 'Forum';

  @override
  String get forumChannelTypeForumDescription =>
      'Posts organized by topic and tags';

  @override
  String get forumChannelTypeMedia => 'Media';

  @override
  String get forumChannelTypeMediaDescription =>
      'Posts built around images and videos';

  @override
  String get forumNewPost => 'New post';

  @override
  String get forumNewMediaPost => 'New media post';

  @override
  String get forumSearchPosts => 'Search posts';

  @override
  String get forumViewOptions => 'Sort and view';

  @override
  String get forumSearchIndexing =>
      'Search is still being prepared for this community. Posts appear here as soon as it is ready.';

  @override
  String get forumNoPosts => 'There are no posts yet';

  @override
  String get forumNoPostsHint => 'Be the first to start a conversation here.';

  @override
  String get forumNoSearchResults => 'No posts match your search';

  @override
  String get forumNoSearchResultsHint =>
      'Try different words or clear the tag filter.';

  @override
  String get forumCreateFirstPost => 'Create the first post';

  @override
  String get forumOlderPosts => 'Older posts';

  @override
  String get forumPostsLoadFailed => 'Posts could not be loaded.';

  @override
  String get forumRetry => 'Try again';

  @override
  String get forumPostPinned => 'Pinned';

  @override
  String get forumPostLocked => 'Locked';

  @override
  String get forumPostArchived => 'Archived';

  @override
  String get forumPostNewBadge => 'NEW';

  @override
  String get forumPostStarterDeleted => 'The original message was deleted.';

  @override
  String forumPostSnippet(String author, String content) {
    return '$author: $content';
  }

  @override
  String forumPostNewMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count new messages',
      one: '1 new message',
    );
    return '$_temp0';
  }

  @override
  String get forumPostReact => 'Add the default reaction';

  @override
  String get forumOpenPost => 'Open post';

  @override
  String get forumEditTags => 'Edit tags';

  @override
  String get forumSaveTags => 'Save tags';

  @override
  String forumTagsLimitHint(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Pick up to $count tags.',
      one: 'Pick up to 1 tag.',
    );
    return '$_temp0';
  }

  @override
  String get forumPinPost => 'Pin post';

  @override
  String get forumUnpinPost => 'Unpin post';

  @override
  String get forumMarkPostRead => 'Mark as read';

  @override
  String get forumCopyPostLink => 'Copy link';

  @override
  String get forumPostGuidelines => 'Post guidelines';

  @override
  String get forumGuidelinesPlaceholder =>
      'Tell people what to post here and how to post it.';

  @override
  String get forumPostTitle => 'Title';

  @override
  String get forumPostMessage => 'Message';

  @override
  String get forumPostMessagePlaceholder =>
      'Write the first message of your post';

  @override
  String get forumPostMediaPlaceholder => 'Add a caption';

  @override
  String get forumPostTags => 'Tags';

  @override
  String get forumPostTagsRequired => 'Tags (required)';

  @override
  String get forumPostAddMedia => 'Add media';

  @override
  String get forumPostAddFile => 'Add file';

  @override
  String get forumPostRemoveAttachment => 'Remove attachment';

  @override
  String get forumPostSubmit => 'Post';

  @override
  String get forumPostTitleRequired => 'Give your post a title.';

  @override
  String get forumPostMediaRequired =>
      'Add at least one image or video to post here.';

  @override
  String get forumPostContentRequired => 'Write a message or add a file.';

  @override
  String get forumSortLatestActivity => 'Recently active';

  @override
  String get forumSortCreationTime => 'Date posted';

  @override
  String get forumLayoutList => 'List view';

  @override
  String get forumLayoutGallery => 'Gallery view';

  @override
  String get forumNewPostsUnread => 'Show unread for new posts';

  @override
  String get forumNewPostsUnreadDescription =>
      'Mark this channel unread when someone creates a post.';

  @override
  String get forumPostSlowmode => 'Post slowmode';

  @override
  String forumPostSlowmodeDescription(String bypassSlowmodePermissionLabel) {
    return 'Wait between creating posts. \"$bypassSlowmodePermissionLabel\" can bypass it.';
  }

  @override
  String get forumMessageSlowmode => 'Message slowmode in posts';

  @override
  String get forumMessageSlowmodeDescription =>
      'Slowmode applied to messages in new posts.';

  @override
  String get forumDefaultAutoArchive => 'Hide after inactivity';

  @override
  String get forumDefaultAutoArchiveDescription =>
      'New posts are archived after this long without activity.';

  @override
  String get forumDefaultReaction => 'Default reaction';

  @override
  String get forumSetDefaultReaction => 'Pick an emoji';

  @override
  String get forumChangeDefaultReaction => 'Change';

  @override
  String get forumRemoveDefaultReaction => 'Remove';

  @override
  String get forumDefaultSortOrder => 'Default sort order';

  @override
  String get forumDefaultLayout => 'Default layout';

  @override
  String get forumTagMatchSetting => 'Tag filter';

  @override
  String get forumTagMatchSome => 'Match any selected tag';

  @override
  String get forumTagMatchAll => 'Match all selected tags';

  @override
  String get forumRequireTag => 'Require tags';

  @override
  String get forumRequireTagDescription =>
      'People must pick at least one tag when they create a post.';

  @override
  String get forumHideMediaDownloads => 'Hide media download options';

  @override
  String get forumHideMediaDownloadsDescription =>
      'Hide download, open in browser and copy link for images and videos in posts.';

  @override
  String forumTagsTitle(int count, int max) {
    return 'Tags ($count/$max)';
  }

  @override
  String get forumTagsDescription =>
      'Tags help people find and filter posts. Only moderators can apply moderated tags.';

  @override
  String get forumCreateTag => 'Create tag';

  @override
  String get forumEditTag => 'Edit tag';

  @override
  String get forumSaveTag => 'Save tag';

  @override
  String get forumDeleteTag => 'Delete tag';

  @override
  String get forumTagName => 'Tag name';

  @override
  String get forumTagEmoji => 'Emoji';

  @override
  String get forumTagRemoveEmoji => 'Remove emoji';

  @override
  String get forumTagModerated => 'Only moderators can apply';

  @override
  String get forumTagModeratedDescription =>
      'Only members who can manage threads can apply or remove this tag.';

  @override
  String get forumTagModeratedBadge => 'Moderated';

  @override
  String forumPostCooldown(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: 'You can post again in $seconds seconds.',
      one: 'You can post again in 1 second.',
    );
    return '$_temp0';
  }

  @override
  String get voiceP2pStartTitle => 'Start in P2P mode?';

  @override
  String voiceP2pStartDescription(int maxParticipants) {
    return 'Audio and video go directly between participants, with lower latency. Other participants can see your IP address. Up to $maxParticipants people can take part. Anyone who cannot connect directly cannot take part until someone switches to a standard call.';
  }

  @override
  String get voiceP2pStartConfirm => 'Start in P2P mode';

  @override
  String get voiceP2pStartStandard => 'Start standard call';

  @override
  String get voiceP2pJoinTitle => 'Join a P2P call?';

  @override
  String voiceP2pJoinDescription(int maxParticipants) {
    return 'This call connects participants directly. Other participants can see your IP address. Up to $maxParticipants people can take part. If you cannot connect directly, you cannot take part until someone switches to a standard call.';
  }

  @override
  String voiceP2pPinnedJoinDescription(int maxParticipants) {
    return 'This channel only allows P2P calls. Participants connect directly and can see your IP address. Up to $maxParticipants people can take part. If you cannot connect directly, you cannot take part.';
  }

  @override
  String get voiceP2pJoinConfirm => 'Join';

  @override
  String get voiceP2pAlwaysAgreeLabel => 'Do not ask again, always agree';

  @override
  String get voiceP2pAlwaysAgreeSettingLabel =>
      'Always agree to join P2P calls';

  @override
  String get voiceP2pAlwaysAgreeSettingDescription =>
      'Join P2P calls without asking. Other participants can see your IP address.';

  @override
  String get voiceP2pIndicatorLabel => 'P2P';

  @override
  String get voiceP2pIndicatorDescription =>
      'Direct connection. Media is encrypted between participants.';

  @override
  String get voiceP2pSwitchToStandard => 'Switch to standard call';

  @override
  String get voiceP2pSwitchToStandardDescription =>
      'Everyone in the call moves to a standard call through the server.';

  @override
  String get voiceP2pPeerFailedDescription =>
      'A direct connection could not be made. Leave the call or switch everyone to a standard call.';

  @override
  String get voiceP2pUnavailableError => 'P2P calls are unavailable right now.';

  @override
  String get voiceP2pConsentRequiredError =>
      'This call is P2P and needs your agreement to join.';

  @override
  String get voiceChannelFullError => 'This call is full.';

  @override
  String get voiceP2pScreenShareUnavailable =>
      'Screen sharing from this device is not available in P2P calls.';

  @override
  String get channelMenuJoinP2p => 'Start P2P call';

  @override
  String get channelSettingsRtcP2pLabel => 'P2P calls only';

  @override
  String channelSettingsRtcP2pDescription(int maxParticipants) {
    return 'Participants connect directly and can see each other\'s IP addresses. Everyone must agree before joining. Up to $maxParticipants people can take part.';
  }

  @override
  String voiceP2pPeerFailedTitle(String name) {
    return 'Cannot connect directly to $name';
  }
}
