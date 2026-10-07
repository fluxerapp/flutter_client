// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class FluxerLocalizationsId extends FluxerLocalizations {
  FluxerLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get reconnectingTitle => 'Kami salah!';

  @override
  String get reconnectingBody =>
      'Ada yang salah dengan instance ini.\nSeharusnya segera diperbaiki!';

  @override
  String get gatewayReconnectingToast => 'Menyambungkan ulang…';

  @override
  String get gatewayConnectedToast => 'Terhubung';

  @override
  String get sessionExpiredToast =>
      'Sesi Anda telah kedaluwarsa. Silakan masuk lagi.';

  @override
  String splashStartupFailed(String error) {
    return 'Gagal memulai: $error';
  }

  @override
  String get retry => 'Coba lagi';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Koneksi terputus';

  @override
  String get splashViewOnStatusPage => 'Lihat di halaman status';

  @override
  String get splashConnectionIssuesPrompt => 'Ada masalah koneksi?';

  @override
  String get splashStatusPageLink => 'Halaman status';

  @override
  String get splashReadIncident => 'Baca insiden';

  @override
  String get splashIncidentHistory => 'Riwayat insiden';

  @override
  String get nagbarLearnMore => 'Pelajari selengkapnya';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Pemeliharaan terjadwal pada $localizedTime. Perkiraan durasi: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Pemeliharaan sedang berlangsung. Perkiraan durasi: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Pemeliharaan selesai.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Hai $displayName, klaim akunmu agar tidak kehilangan akses.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Hai $displayName, mohon verifikasi alamat emailmu.';
  }

  @override
  String get nagbarOpenSettings => 'Buka pengaturan';

  @override
  String get systemPermissionSettingsTitle => 'Aktifkan izin';

  @override
  String get systemPermissionSettingsOpenSettings => 'Buka pengaturan';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName tidak memiliki akses ke mikrofon Anda. Anda dapat mengaktifkannya di pengaturan privasi perangkat Anda.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName tidak memiliki akses ke kamera Anda. Anda dapat mengaktifkannya di pengaturan privasi perangkat Anda.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName tidak memiliki akses ke pustaka foto Anda. Anda dapat mengaktifkannya di pengaturan privasi perangkat Anda.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName tidak punya izin untuk mengirim notifikasi. Anda bisa mengaktifkannya di pengaturan perangkat Anda.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Langganan Anda gagal diperpanjang, tetapi Anda masih memiliki akses ke keuntungan $productName hingga $graceDate. Ambil tindakan sekarang atau Anda akan kehilangan semua keuntungan.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Langganan $productName Anda telah kedaluwarsa. Perbarui sekarang untuk mempertahankan keuntungan Anda.';
  }

  @override
  String get nagbarManageSubscription => 'Kelola langganan';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Selamat datang di $productFullName. Jelajahi keuntungan $productName Anda dan kelola langganan Anda.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Lihat fitur $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Anda punya kode hadiah baru yang menunggu di inventaris hadiah Anda.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Anda punya $count kode hadiah baru yang menunggu di inventaris hadiah Anda.';
  }

  @override
  String get nagbarViewGiftInventory => 'Lihat inventaris hadiah';

  @override
  String get nagbarVisionaryMfa =>
      'Aktifkan autentikasi dua faktor untuk melindungi akun Visionary Anda.';

  @override
  String get nagbarEnableMfa => 'Aktifkan 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Kami telah memperbarui persyaratan kami. Harap tinjau dan terima untuk melanjutkan.';

  @override
  String get nagbarReviewTerms => 'Tinjau persyaratan';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Gabung ke $communityName untuk mengobrol dengan tim dan mengikuti kabar terbaru.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Gabung ke $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Aktifkan notifikasi agar Anda tidak melewatkan pesan dan sebutan.';

  @override
  String get nagbarEnableNotifications => 'Aktifkan notifikasi';

  @override
  String get nagbarBillingPortalFailed =>
      'Tidak dapat membuka portal penagihan. Coba lagi sebentar lagi.';

  @override
  String get welcomeBack => 'Selamat datang kembali';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Masukkan alamat email yang valid.';

  @override
  String get password => 'Kata sandi';

  @override
  String get forgotPassword => 'Lupa kata sandimu?';

  @override
  String get logIn => 'Masuk';

  @override
  String get logInWithPasskey => 'Masuk dengan passkey';

  @override
  String continueWithSso(String provider) {
    return 'Lanjutkan dengan $provider';
  }

  @override
  String get ssoRequired => 'SSO diperlukan untuk mengakses instance ini.';

  @override
  String get organizationSsoProvider =>
      'Masuk dengan penyedia single sign-on organisasimu.';

  @override
  String get failedToStartSso => 'Gagal memulai SSO';

  @override
  String get ssoCancelled => 'Login SSO dibatalkan';

  @override
  String preferSso(String provider) {
    return 'Lebih suka pakai SSO? Lanjutkan dengan $provider.';
  }

  @override
  String get logInViaBrowser => 'Masuk melalui browser';

  @override
  String get needAccountPrompt => 'Butuh akun? ';

  @override
  String get register => 'Daftar';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => 'Batal';

  @override
  String get ipAuthCheckEmail => 'Cek emailmu';

  @override
  String ipAuthDescription(String email) {
    return 'Kami mengirimkan tautan ke email Anda untuk mengotorisasi login ini. Silakan buka kotak masuk Anda di $email.';
  }

  @override
  String get ipAuthConnectionLost => 'Koneksi terputus';

  @override
  String get ipAuthConnectionLostDescription =>
      'Kami kehilangan koneksi saat menunggu otorisasi. Coba lagi.';

  @override
  String get ipAuthLinkExpired => 'Tautan masuk kedaluwarsa';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Tautan otorisasi ini telah kedaluwarsa. Silakan masuk lagi.';

  @override
  String get ipAuthResendEmail => 'Kirim ulang email';

  @override
  String get ipAuthResent => 'Dikirim ulang';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '${seconds}d';
  }

  @override
  String get back => 'Kembali';

  @override
  String get next => 'Berikutnya';

  @override
  String get mfaTitle => 'Autentikasi dua faktor';

  @override
  String get mfaChooseMethod => 'Pilih metode verifikasi';

  @override
  String get mfaMethodTotp => 'Aplikasi Authenticator';

  @override
  String get mfaMethodWebauthn => 'Kunci keamanan / passkey';

  @override
  String get mfaTotpDescription =>
      'Masukkan kode 6 digit dari aplikasi autentikator Anda atau salah satu kode cadangan Anda.';

  @override
  String get mfaCodeLabel => 'Kode';

  @override
  String get mfaTryAnotherMethod => 'Coba metode lain';

  @override
  String get mfaUseSecurityKey => 'Coba kunci keamanan/passkey saja';

  @override
  String get accountSelectorTitle => 'Pilih akun';

  @override
  String get accountSelectorDescription =>
      'Pilih akun untuk melanjutkan, atau tambahkan akun lain.';

  @override
  String get accountAdd => 'Tambah akun';

  @override
  String get accountRemove => 'Hapus';

  @override
  String accountRemoveTitle(String username) {
    return 'Hapus $username';
  }

  @override
  String get accountRemoveDescription =>
      'Ini akan menghapus sesi tersimpan untuk akun ini.';

  @override
  String get accountRemoveOnlyDescription =>
      'Ini akan menghapus satu-satunya akun yang tersimpan di perangkat ini.';

  @override
  String get accountExpired => 'Kedaluwarsa';

  @override
  String accountSessionExpired(String identifier) {
    return 'Sesi kedaluwarsa untuk $identifier. Silakan masuk lagi.';
  }

  @override
  String get accountManageTitle => 'Kelola akun';

  @override
  String get accountSwitchFailed => 'Tidak dapat beralih akun. Coba lagi.';

  @override
  String get profileTabMenuSwitchAccounts => 'Ganti akun';

  @override
  String get statusChangeSheetTitle => 'Atur status';

  @override
  String get statusOnlineStatusSection => 'Status online';

  @override
  String get statusOnline => 'Online';

  @override
  String get statusIdle => 'Tidak aktif';

  @override
  String get statusDnd => 'Jangan ganggu';

  @override
  String get statusInvisible => 'Tidak terlihat';

  @override
  String get statusOffline => 'Offline';

  @override
  String get statusUntilIChangeIt => 'Sampai saya mengubahnya';

  @override
  String get statusDontClear => 'Jangan hapus';

  @override
  String get statusFor10Seconds => 'Selama 10 detik';

  @override
  String get statusClearAfter10Seconds => '10 detik';

  @override
  String get statusClearAfter15Minutes => '15 menit';

  @override
  String get statusClearAfter30Minutes => '30 menit';

  @override
  String get statusClearAfter1Hour => '1 jam';

  @override
  String get statusClearAfter3Hours => '3 jam';

  @override
  String get statusClearAfter4Hours => '4 jam';

  @override
  String get statusClearAfter8Hours => '8 jam';

  @override
  String get statusClearAfter24Hours => '24 jam';

  @override
  String get statusClearAfter3Days => '3 hari';

  @override
  String get statusDndDescription =>
      'Kamu tidak akan menerima notifikasi di desktop';

  @override
  String get statusInvisibleDescription => 'Kamu akan terlihat offline';

  @override
  String get customStatusSetTitle => 'Atur status kustom';

  @override
  String get customStatusCurrentHint => 'Status kustom';

  @override
  String get customStatusClear => 'Hapus status kustom';

  @override
  String get customStatusPlaceholder => 'Ada apa?';

  @override
  String get customStatusChooseEmoji => 'Pilih emoji';

  @override
  String get customStatusClearAfter => 'Hapus setelah';

  @override
  String get customStatusSave => 'Simpan';

  @override
  String get accountActive => 'Akun aktif';

  @override
  String get signOut => 'Keluar';

  @override
  String get suspendedPermanentTitle => 'Akun Ditangguhkan Permanen';

  @override
  String get suspendedTemporaryTitle => 'Akun Ditangguhkan';

  @override
  String get suspendedPermanentDescription =>
      'Akun Anda telah ditangguhkan secara permanen karena melanggar Ketentuan Layanan kami.';

  @override
  String get suspendedTemporaryDescription =>
      'Akun Anda telah ditangguhkan sementara. Anda akan dapat mengakses akun Anda setelah periode penangguhan berakhir.';

  @override
  String get suspendedIssuedAt => 'Dikeluarkan';

  @override
  String get suspendedEndsAt => 'Berakhir';

  @override
  String get suspendedDuration => 'Durasi';

  @override
  String get suspendedPermanent => 'Permanen';

  @override
  String get suspendedReason => 'Alasan';

  @override
  String get suspendedAppealDeadline => 'Batas Waktu Banding';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Akun Anda dijadwalkan untuk dihapus pada $date.';
  }

  @override
  String get suspendedRecheck => 'Cek pembaruan';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Periksa lagi dalam ${seconds}d';
  }

  @override
  String get suspendedBackToLogin => 'Kembali ke Login';

  @override
  String get suspendedAppealTitle => 'Ajukan banding';

  @override
  String get suspendedAppealHint =>
      'Jelaskan mengapa penangguhan Anda harus dipertimbangkan kembali (minimal 50 karakter)...';

  @override
  String get suspendedAppealSubmit => 'Kirim Banding';

  @override
  String get suspendedAppealPending => 'Menunggu Tinjauan';

  @override
  String get suspendedAppealAccepted => 'Banding Diterima';

  @override
  String get suspendedAppealRejected => 'Banding Ditolak';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Banding Anda telah diterima dan akun Anda telah dipulihkan.';

  @override
  String get suspendedSignIn => 'Masuk ke Akun Anda';

  @override
  String get forgotPasswordTitle => 'Lupa kata sandimu?';

  @override
  String get forgotPasswordDescription =>
      'Masukkan alamat emailmu dan kami akan mengirimkan tautan untuk mengatur ulang kata sandimu.';

  @override
  String get forgotPasswordSubmit => 'Kirim tautan reset';

  @override
  String get forgotPasswordSentTitle => 'Cek emailmu';

  @override
  String get forgotPasswordSentDescription =>
      'Kami telah mengirimkan instruksi pengaturan ulang kata sandi ke alamat email Anda. Silakan periksa kotak masuk Anda dan ikuti tautan untuk mengatur ulang kata sandi Anda.';

  @override
  String get forgotPasswordBackToLogin => 'Kembali ke login';

  @override
  String get resetPasswordTitle => 'Atur kata sandi baru';

  @override
  String get resetPasswordDescription =>
      'Masukkan kata sandi baru Anda di bawah ini untuk menyelesaikan proses pengaturan ulang.';

  @override
  String get resetPasswordNewPassword => 'Kata sandi baru';

  @override
  String get resetPasswordConfirm => 'Konfirmasi kata sandi baru';

  @override
  String get resetPasswordSubmit => 'Setel ulang kata sandi';

  @override
  String get resetPasswordMismatch => 'Kata sandi tidak cocok.';

  @override
  String get recoverAccountTitle => 'Pulihkan akun Anda';

  @override
  String get recoverAccountDescription =>
      'Masukkan nama pengguna dan kunci pemulihan Anda dari kit pemulihan, lalu pilih kata sandi baru.';

  @override
  String get recoverAccountNoKit =>
      'Tidak punya kit pemulihan? Minta tautan pengaturan ulang kata sandi dari admin instance ini.';

  @override
  String get recoveryKitTitle => 'Kit pemulihan Anda';

  @override
  String get recoveryKitCreatedDescription =>
      'Jika Anda lupa kata sandi, kit ini adalah satu-satunya cara untuk kembali ke akun Anda. Simpan di tempat yang aman, seperti pengelola kata sandi atau salinan cetak.';

  @override
  String get recoveryKitReplacedDescription =>
      'Kit pemulihan lama Anda tidak berfungsi lagi. Simpan kit baru ini di tempat yang aman.';

  @override
  String get recoveryKitRecoveredDescription =>
      'Kata sandi Anda telah direset. Kit pemulihan lama Anda tidak lagi berfungsi. Simpan kit baru ini di tempat yang aman.';

  @override
  String get recoveryKitWarning =>
      'Siapa pun yang memiliki kunci ini dapat mengatur ulang sandi Anda. Jangan pernah membagikannya.';

  @override
  String get recoveryKitKeyLabel => 'Kunci pemulihan';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'Kit pemulihan $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'Simpan halaman ini di tempat yang aman. Jika Anda lupa kata sandi, Anda dapat menggunakannya untuk kembali ke akun Anda. Siapa pun yang memiliki kunci pemulihan ini dapat mengatur ulang kata sandi Anda, jadi jangan pernah membagikannya.';

  @override
  String get recoveryKitInstanceLabel => 'Instans';

  @override
  String get recoveryKitCreatedAtLabel => 'Dibuat';

  @override
  String get recoveryKitQrCaption =>
      'Pindai untuk membuka halaman pemulihan dengan detail Anda terisi.';

  @override
  String get recoveryKitStepsTitle => 'Cara memulihkan akun Anda';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'Buka $recoverUrl atau pindai kode QR.';
  }

  @override
  String get recoveryKitStepEnter =>
      'Masukkan nama pengguna Anda dan kunci pemulihan ini.';

  @override
  String get recoveryKitStepPassword =>
      'Pilih kata sandi baru. Anda akan mendapatkan kit pemulihan baru dan yang ini tidak akan berfungsi lagi.';

  @override
  String get recoveryKitBackupCodesTitle => 'Kode cadangan dua faktor';

  @override
  String get recoveryKitBackupCodesNote =>
      'Setiap kode berfungsi sekali sebagai pengganti aplikasi autentikator Anda.';

  @override
  String get recoveryKitBackupCodesFailed =>
      'Tidak dapat memuat kode cadangan Anda.';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'Sertakan kode cadangan autentikasi dua faktor saya di gambar yang disimpan';

  @override
  String get recoveryKitCopy => 'Salin';

  @override
  String get recoveryKitCopied => 'Kunci pemulihan disalin';

  @override
  String get recoveryKitSaveImage => 'Simpan gambar';

  @override
  String get recoveryKitSaved => 'Kit pemulihan disimpan';

  @override
  String get recoveryKitSavedToPhotos => 'Kit pemulihan disimpan ke Foto';

  @override
  String get recoveryKitSaveFailed =>
      'Tidak dapat menyimpan kit pemulihan. Coba lagi atau salin kuncinya saja.';

  @override
  String get recoveryKitAcknowledge =>
      'Saya telah menyimpan kit pemulihan saya di tempat yang aman';

  @override
  String get recoveryKitCreateFailed =>
      'Tidak dapat membuat kit pemulihan Anda. Anda dapat membuatnya nanti di pengaturan akun Anda.';

  @override
  String get recoveryKitSectionTitle => 'Kit pemulihan';

  @override
  String get recoveryKitSectionDescription =>
      'Memungkinkan Anda mengatur ulang sandi jika lupa.';

  @override
  String get recoveryKitNone => 'Anda belum memiliki kit pemulihan';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'Dibuat $time';
  }

  @override
  String get recoveryKitCreate => 'Buat kit pemulihan';

  @override
  String get recoveryKitCreateNew => 'Buat kit baru';

  @override
  String get recoveryKitReplaceTitle => 'Buat kit pemulihan baru?';

  @override
  String get recoveryKitReplaceDescription =>
      'Kit Anda saat ini berhenti berfungsi segera setelah kit baru dibuat.';

  @override
  String get recoveryKitReminderTitle => 'Simpan kit pemulihan';

  @override
  String get recoveryKitReminderBody =>
      'Akun Anda tidak memiliki alamat email. Jika Anda lupa kata sandi, kit pemulihan adalah satu-satunya cara untuk masuk kembali. Hanya perlu semenit.';

  @override
  String get registerUsernameSignInHint =>
      'Anda masuk dengan nama pengguna ini. Pilih salah satu yang akan Anda ingat.';

  @override
  String get registerUsernameTaken => 'Nama pengguna ini sudah digunakan';

  @override
  String get registerUsernameAvailable => 'Nama pengguna ini tersedia';

  @override
  String get claimAccountUsernameDescription =>
      'Klaim akun Anda dengan memilih nama pengguna dan kata sandi. Anda masuk menggunakan keduanya, jadi pilihlah yang akan Anda ingat.';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'Akun Anda belum diklaim. Tanpa nama pengguna dan kata sandi, Anda tidak akan dapat masuk dari perangkat lain dan Anda bisa kehilangan akses ke akun Anda. Klaim akun Anda sekarang untuk mengamankannya.';

  @override
  String get addFriendUsernameOnlyHint => 'Nama pengguna';

  @override
  String get registerTitle => 'Buat akun';

  @override
  String get registerDisplayName => 'Nama tampilan (opsional)';

  @override
  String get registerDisplayNameHint => 'Siapa nama panggilanmu?';

  @override
  String get registerUsername => 'Nama pengguna (opsional)';

  @override
  String get registerUsernameHint => 'Biarkan kosong untuk nama pengguna acak';

  @override
  String get registerUsernameTagHint =>
      'Tag 4 digit akan ditambahkan secara otomatis untuk memastikan keunikan';

  @override
  String get registerDateOfBirth => 'Tanggal lahir';

  @override
  String get registerMonth => 'Bulan';

  @override
  String get registerDay => 'Hari';

  @override
  String get registerYear => 'Tahun';

  @override
  String get registerConsent =>
      'Saya setuju dengan Persyaratan Layanan dan Kebijakan Privasi';

  @override
  String get registerConsentPrefix => 'Saya setuju dengan ';

  @override
  String get registerConsentTerms => 'Ketentuan layanan';

  @override
  String get registerConsentAnd => ' dan ';

  @override
  String get registerConsentPrivacy => 'Kebijakan privasi';

  @override
  String get registerConfirmPassword => 'Konfirmasi kata sandi';

  @override
  String get registerSubmit => 'Buat akun';

  @override
  String get registerHaveAccount => 'Sudah punya akun? ';

  @override
  String get registerPendingApproval =>
      'Permintaan akunmu menunggu persetujuan. Kamu dapat masuk setelah admin menyetujuinya.';

  @override
  String get registerClosed =>
      'Pendaftaran saat ini ditutup. Gunakan tautan pendaftaran dari admin untuk membuat akun.';

  @override
  String get passkeyNoCredentials =>
      'Tidak ada passkey yang ditemukan untuk aplikasi ini. Masuk dengan email dan sandi saja.';

  @override
  String get passkeyDeviceNotSupported =>
      'Passkey tidak didukung di perangkat ini.';

  @override
  String get passkeyDomainNotAssociated =>
      'Passkey belum dikonfigurasi untuk aplikasi ini. Masuk dengan email dan sandi saja.';

  @override
  String get passkeyTimeout =>
      'Autentikasi kunci sandi telah habis waktunya. Silakan coba lagi.';

  @override
  String get passkeyNotAvailable =>
      'Passkey tidak tersedia untuk aplikasi ini. Masuk dengan email dan sandi saja.';

  @override
  String get passkeyFailed => 'Autentikasi kunci sandi gagal. Coba lagi.';

  @override
  String get errorUnableToCreateAccount =>
      'Tidak dapat membuat akun. Silakan coba lagi.';

  @override
  String get errorUnableToSignIn => 'Tidak dapat masuk saat ini. Coba lagi.';

  @override
  String get errorServiceUnavailable =>
      'Instans ini sementara tidak tersedia. Coba lagi sebentar lagi.';

  @override
  String get errorInvalidEmailOrPassword => 'Email atau kata sandi salah.';

  @override
  String get errorInvalidUsernameOrPassword =>
      'Nama pengguna atau kata sandi tidak valid.';

  @override
  String get errorUnableToSendResetLink =>
      'Tidak dapat mengirim tautan pengaturan ulang. Silakan coba lagi.';

  @override
  String get errorUnableToResetPassword =>
      'Tidak dapat mengatur ulang kata sandi. Silakan coba lagi.';

  @override
  String get embedInviteJoin => 'Gabung komunitas';

  @override
  String get embedInviteGoTo => 'Buka komunitas';

  @override
  String embedInviteOnline(String count) {
    return '$count Online';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count Anggota';
  }

  @override
  String get embedInviteUnknownTitle => 'Undangan tidak dikenal';

  @override
  String get embedInviteUnknownSubtitle => 'Coba minta undangan baru.';

  @override
  String get embedInviteUnavailable => 'Undangan tidak tersedia';

  @override
  String get embedInviteJoinGroup => 'Gabung grup';

  @override
  String get embedInviteAlreadyJoined => 'Sudah bergabung';

  @override
  String get embedInviteDisabled => 'Undangan dinonaktifkan';

  @override
  String get embedInvitePaused => 'Undangan dijeda untuk komunitas ini.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName mendeteksi potensi serangan, jadi pengguna baru tidak bisa bergabung sekarang.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Komunitas ini telah menjeda undangan. Kamu bisa coba lagi nanti.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName mendeteksi potensi serangan di komunitas ini. Undangan dijeda, jadi pengguna baru tidak dapat bergabung sekarang.';
  }

  @override
  String get inviteAcceptTitle => 'Kamu diundang untuk bergabung';

  @override
  String get inviteAcceptJoinButton => 'Gabung komunitas';

  @override
  String get inviteAcceptGoToButton => 'Buka komunitas';

  @override
  String get inviteAcceptInvitesPaused => 'Undangan dijeda';

  @override
  String get inviteAcceptNotFoundTitle => 'Undangan Tidak Valid';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Undangan ini mungkin sudah kedaluwarsa atau tidak valid.';

  @override
  String get invalidDeepLinkTitle => 'Tautan tidak dapat dibuka';

  @override
  String get invalidDeepLinkDescription =>
      'Tautan ini mungkin rusak, hanya tersedia di web, atau Anda mungkin tidak memiliki akses. Periksa tautan dan coba lagi.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Ke beranda';

  @override
  String get inviteAcceptJoinGroupButton => 'Gabung grup';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Anda diundang untuk bergabung dengan DM grup oleh $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'seseorang';

  @override
  String get inviteAcceptEmojiPack => 'Paket emoji';

  @override
  String get inviteAcceptStickerPack => 'Paket stiker';

  @override
  String get inviteAcceptInstallEmojiPack => 'Pasang paket emoji';

  @override
  String get inviteAcceptInstallStickerPack => 'Pasang paket stiker';

  @override
  String get inviteAcceptPackInstallNote =>
      'Menerima undangan ini akan menginstal paket secara otomatis.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Akses saluran ditolak';

  @override
  String get channelAccessDeniedDescription =>
      'Kamu tidak memiliki akses ke saluran tempat pesan ini dikirim.';

  @override
  String get messageJumpLinkNoAccess => 'Tidak ada akses';

  @override
  String get okay => 'Oke';

  @override
  String get embedThemeTitle => 'Tema dibagikan';

  @override
  String get embedThemeSubtitle => 'Klien ini tidak mendukung tema kustom.';

  @override
  String get embedThemeUnavailableButton => 'Tema tidak tersedia';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (seumur hidup $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari $productName',
      one: '1 hari $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minggu $productName',
      one: '1 minggu $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bulan $productName',
      one: '1 bulan $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tahun $productName',
      one: '1 tahun $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Dari $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Klik untuk mengklaim hadiahmu!';

  @override
  String get embedGiftAlreadyRedeemed => 'Sudah ditukarkan';

  @override
  String get embedGiftClaimAccountHelp =>
      'Klaim akunmu untuk menukarkan hadiah ini.';

  @override
  String get embedGiftClaim => 'Klaim hadiah';

  @override
  String get embedGiftClaimed => 'Hadiah diklaim';

  @override
  String get embedGiftClaimAccount => 'Klaim akun untuk menukarkan';

  @override
  String get embedGiftUnknownTitle => 'Hadiah tidak dikenal';

  @override
  String get embedGiftUnknownSubtitle =>
      'Kode hadiah ini tidak valid atau sudah diklaim.';

  @override
  String get embedGiftUnavailable => 'Hadiah tidak tersedia';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Klaim hadiah Anda untuk mengaktifkan langganan $productName Anda!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Hadiah ini sudah diklaim.';

  @override
  String get giftAcceptMaybeLater => 'Mungkin nanti';

  @override
  String get giftRedeemedToast => 'Hadiah berhasil ditukarkan!';

  @override
  String get giftRedeemInvalidTitle => 'Kode hadiah tidak valid';

  @override
  String get giftRedeemInvalidMessage =>
      'Kode ini tidak valid atau sudah digunakan.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Hadiah sudah ditukarkan';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Kode ini sudah ditukarkan.';

  @override
  String get giftRedeemNotFoundTitle => 'Hadiah tidak ditemukan';

  @override
  String get giftRedeemNotFoundMessage => 'Kode ini tidak ada.';

  @override
  String get giftRedeemFailedTitle => 'Gagal menukarkan hadiah';

  @override
  String get giftRedeemFailedMessage =>
      'Tidak dapat menukarkan hadiah ini. Coba lagi.';

  @override
  String get giftVisionaryCannotRedeemTitle =>
      'Tidak dapat menukarkan hadiah ini';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Akun Visionary tidak dapat menukarkan hadiah Plutonium. Salin tautannya untuk membagikannya dengan teman saja.';

  @override
  String get giftCopyLink => 'Salin tautan hadiah';

  @override
  String get privacySettings => 'Pengaturan privasi';

  @override
  String get privacyDirectMessages => 'Pesan langsung';

  @override
  String get privacyDirectMessagesDescription =>
      'Izinkan pesan langsung dari anggota lain di komunitas ini';

  @override
  String get privacyBotDirectMessages => 'Pesan langsung bot';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Izinkan bot dari komunitas ini mengirimkan pesan langsung kepada Anda';

  @override
  String get privacyMutualDmsDisabled =>
      'Admin komunitas telah menonaktifkan penerimaan pesan langsung hanya dari anggota bersama di komunitas ini.';

  @override
  String get communityDebug => 'Debug komunitas';

  @override
  String get copiedToClipboard => 'Disalin ke papan klip';

  @override
  String get notificationSettings => 'Pengaturan notifikasi';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Bisukan $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Meredam komunitas akan mencegah indikator belum dibaca dan notifikasi muncul kecuali Anda disebutkan';

  @override
  String get notificationCommunitySettings => 'Pengaturan notifikasi komunitas';

  @override
  String get notificationAllMessages => 'Semua pesan';

  @override
  String get notificationOnlyMentions => 'Hanya sebutan';

  @override
  String get notificationNothing => 'Tidak ada';

  @override
  String get notificationSuppressEveryone => 'Sembunyikan @everyone dan @here';

  @override
  String get notificationSuppressRoles => 'Sembunyikan Semua @penyebutan peran';

  @override
  String get notificationMobilePush => 'Notifikasi push seluler';

  @override
  String get notificationOverrides => 'Penggantian notifikasi';

  @override
  String get notificationSelectChannel => 'Pilih saluran atau kategori';

  @override
  String get notificationOnlyAtMentions => 'Hanya @sebutan';

  @override
  String get notificationMuteChannel => 'Bisukan saluran';

  @override
  String get notificationUnmuteChannel => 'Bunyikan saluran';

  @override
  String get notificationUseCategoryDefault => 'Gunakan default kategori';

  @override
  String get notificationUseCommunityDefault => 'Gunakan Default Komunitas';

  @override
  String get notificationNoCategory => 'Tanpa kategori';

  @override
  String get dmMarkAsRead => 'Tandai sudah dibaca';

  @override
  String get dmMuteConversation => 'Bisukan DM';

  @override
  String get dmUnmuteConversation => 'Bunyikan DM';

  @override
  String get dmPinDm => 'Sematkan DM';

  @override
  String get dmUnpinDm => 'Lepas sematan DM';

  @override
  String get dmAlwaysShowInSidebar => 'Selalu Tampilkan di Bilah Samping';

  @override
  String get dmRemoveFromAlwaysShown => 'Hapus dari Selalu Ditampilkan';

  @override
  String get dmCloseDm => 'Tutup DM';

  @override
  String get dmCloseDmConfirmTitle => 'Tutup DM';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Yakin Anda ingin menutup DM Anda dengan $username? Anda selalu dapat membukanya kembali nanti.';
  }

  @override
  String get dmDeleteMyMessagesTitle => 'Hapus pesanmu di percakapan ini?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Ini akan menghapus secara permanen semua pesan yang pernah kamu kirim di percakapan ini. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get dmCopyChannelId => 'Salin ID saluran';

  @override
  String get dmChannelIdCopied => 'ID saluran disalin';

  @override
  String get dmCopyUserId => 'Salin ID pengguna';

  @override
  String get dmUserIdCopied => 'ID pengguna disalin';

  @override
  String get dmViewProfile => 'Lihat profil';

  @override
  String get dmVoiceCall => 'Mulai panggilan suara';

  @override
  String get incomingVoiceCallTitle => 'Panggilan suara masuk';

  @override
  String get incomingVoiceCallAccept => 'Terima';

  @override
  String get incomingVoiceCallDecline => 'Tolak';

  @override
  String get incomingVoiceCallLabel => 'Panggilan masuk';

  @override
  String get incomingVoiceCallIgnore => 'Abaikan';

  @override
  String get directVoiceCallNotEligible =>
      'Panggilan ini tidak dapat dimulai sekarang. Coba lagi sebentar lagi.';

  @override
  String get voiceJoinCallFailed =>
      'Tidak dapat terhubung ke panggilan ini. Periksa koneksi Anda dan coba lagi.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Tidak dapat bergabung ke panggilan ini. Periksa koneksi Anda dan coba lagi.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Tidak dapat memperbarui panggilan ini di server. Periksa koneksi Anda dan coba lagi.';

  @override
  String get dmAddNote => 'Tambah catatan';

  @override
  String get dmEditGroup => 'Edit grup';

  @override
  String get dmInviteToCommunity => 'Undang ke komunitas';

  @override
  String get dmBlock => 'Blokir';

  @override
  String get dmLeaveGroup => 'Keluar dari grup';

  @override
  String get dmNoCommunitiesAvailable => 'Tidak ada komunitas yang tersedia';

  @override
  String dmGroupMemberCount(int count) {
    return '$count Anggota';
  }

  @override
  String get dmMuteFor15Min => 'Selama 15 menit';

  @override
  String get dmMuteFor30Min => 'Selama 30 menit';

  @override
  String get dmMuteFor1Hour => 'Selama 1 jam';

  @override
  String get dmMuteFor3Hours => 'Selama 3 jam';

  @override
  String get dmMuteFor4Hours => 'Selama 4 jam';

  @override
  String get dmMuteFor8Hours => 'Selama 8 jam';

  @override
  String get dmMuteFor24Hours => 'Selama 24 jam';

  @override
  String get dmMuteFor3Days => 'Selama 3 hari';

  @override
  String get dmMuteForever => 'Sampai saya mengaktifkannya lagi';

  @override
  String get dmPinGroupDm => 'Sematkan DM grup';

  @override
  String get dmUnpinGroupDm => 'Lepas sematan DM grup';

  @override
  String get dmUnnamedGroup => 'Grup tanpa nama';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Grup $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'Tambahkan DM ke favorit';

  @override
  String get dmUnfavoriteDm => 'Hapus DM dari favorit';

  @override
  String get dmFavoriteGroupDm => 'Tambahkan DM grup ke favorit';

  @override
  String get dmUnfavoriteGroupDm => 'Hapus DM grup dari favorit';

  @override
  String get dmChangeFriendNickname => 'Ubah nama panggilan teman';

  @override
  String get dmRemoveFriend => 'Hapus teman';

  @override
  String get dmAddFriend => 'Tambah teman';

  @override
  String get dmAcceptFriendRequest => 'Terima permintaan pertemanan';

  @override
  String get dmIgnoreFriendRequest => 'Abaikan permintaan pertemanan';

  @override
  String get dmFriendRequestSent => 'Permintaan pertemanan terkirim';

  @override
  String get dmUnblock => 'Buka blokir';

  @override
  String get dmDebugUser => 'Debug pengguna';

  @override
  String get dmDebugChannel => 'Saluran debug';

  @override
  String get dmDebugCategory => 'Debug Kategori';

  @override
  String get dmPinned => 'DM tersemat';

  @override
  String get dmUnpinned => 'Sematan DM dilepas';

  @override
  String get dmMuted => 'DM dibisukan';

  @override
  String get dmUnmuted => 'Pesan DM dibuka';

  @override
  String get dmRemoveFriendConfirmTitle => 'Hapus teman';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Apakah Anda yakin ingin menghapus $username dari daftar teman?';
  }

  @override
  String get dmBlockConfirmTitle => 'Blokir pengguna';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Yakin Anda ingin memblokir $username? Mereka tidak akan dapat mengirim pesan atau permintaan pertemanan kepada Anda.';
  }

  @override
  String get dmFriendRequestSentToast => 'Permintaan pertemanan terkirim';

  @override
  String get dmFriendRequestFailed => 'Gagal mengirim permintaan pertemanan';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Gagal menerima permintaan pertemanan';

  @override
  String get dmRemoveFriendFailed => 'Gagal menghapus teman';

  @override
  String get dmBlockFailed => 'Gagal memblokir pengguna';

  @override
  String get dmUnblockFailed => 'Gagal membuka blokir pengguna';

  @override
  String get dmIgnoreFriendRequestFailed =>
      'Gagal mengabaikan permintaan pertemanan';

  @override
  String get dmAddFriends => 'Tambah teman';

  @override
  String get addFriendSheetTitle => 'Tambah teman';

  @override
  String get addFriendUsernameHint => 'Nama pengguna#0000';

  @override
  String get addFriendUsernameLabel => 'Nama pengguna teman';

  @override
  String get addFriendSendRequest => 'Kirim permintaan';

  @override
  String get addFriendNoUserFound =>
      'Tidak ada pengguna yang ditemukan dengan nama pengguna tersebut.';

  @override
  String get addFriendInvalidUsername =>
      'Masukkan nama pengguna yang valid (NamaPengguna#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Permintaan pertemanan terkirim';

  @override
  String get addFriendClaimTitle => 'Klaim akunmu';

  @override
  String get addFriendClaimDescription =>
      'Klaim akunmu untuk mengirim permintaan pertemanan.';

  @override
  String get addFriendVerifyTitle => 'Verifikasi emailmu';

  @override
  String get addFriendVerifyDescription =>
      'Kamu perlu memverifikasi alamat emailmu sebelum bisa mengirim permintaan pertemanan.';

  @override
  String get addFriendVerifyEmail => 'Verifikasi email';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Permintaan pertemanan masuk ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Permintaan pertemanan keluar ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Permintaan pertemanan masuk';

  @override
  String get addFriendOutgoingStatus => 'Permintaan pertemanan terkirim';

  @override
  String get addFriendViewProfile => 'Lihat profil';

  @override
  String get addFriendAccept => 'Terima';

  @override
  String get addFriendIgnore => 'Abaikan';

  @override
  String get addFriendAcceptTitle => 'Terima permintaan pertemanan';

  @override
  String get addFriendIgnoreTitle => 'Abaikan permintaan pertemanan';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Terima permintaan pertemanan dari $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Abaikan permintaan pertemanan dari $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Batalkan permintaan';

  @override
  String get addFriendCancelRequestFailed =>
      'Tidak dapat membatalkan permintaan pertemanan. Coba lagi.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Mereka sedang tidak menerima permintaan pertemanan.';

  @override
  String get addFriendUnblockFirst =>
      'Buka blokir mereka terlebih dahulu untuk mengirim permintaan pertemanan.';

  @override
  String get addFriendCannotSendToSelf =>
      'Kamu tidak bisa mengirim permintaan pertemanan ke diri sendiri.';

  @override
  String get addFriendAlreadyFriends =>
      'Kamu sudah berteman dengan pengguna ini.';

  @override
  String get addFriendClaimToSend =>
      'Selesaikan pendaftaran untuk mengirim permintaan pertemanan.';

  @override
  String get addFriendVerifyToSend =>
      'Verifikasi emailmu sebelum mengirim permintaan pertemanan.';

  @override
  String get addFriendFriendsListFull =>
      'Daftar temanmu atau daftar teman mereka sudah penuh. Hapus seseorang lalu coba lagi.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Sistem';

  @override
  String get emojiSearchPlaceholder => 'Temukan emoji impianmu';

  @override
  String get emojiSearchEmpty =>
      'Tidak ada emoji yang cocok dengan pencarian Anda';

  @override
  String get emojiAutocompleteDefaultLabel => 'Emoji default';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Ini adalah emoji default di $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Emoji ini berasal dari komunitas ini. Anda bisa menggunakannya di mana saja.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Ini adalah emoji kustom dari komunitas.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Ini adalah emoji khusus dari komunitas. Minta penulis untuk mengundang Anda agar bisa menggunakan emoji ini.';

  @override
  String get emojiInfoFromHeader => 'Emoji ini berasal dari';

  @override
  String get emojiInfoDiscoverableCommunity => 'Komunitas yang bisa ditemukan';

  @override
  String get emojiInfoPrivateCommunity => 'Komunitas pribadi';

  @override
  String get emojiInfoVerifiedCommunity => 'Komunitas terverifikasi';

  @override
  String get emojiInfoAddToFavorites => 'Tambahkan ke favorit';

  @override
  String get emojiInfoRemoveFromFavorites => 'Hapus dari favorit';

  @override
  String get emojiFrequentlyUsed => 'Sering digunakan';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'Media';

  @override
  String get emojiTabStickers => 'Stiker';

  @override
  String get emojiTabEmojis => 'Emoji';

  @override
  String get gifPickerSearch => 'Cari GIF';

  @override
  String get gifPickerSearchKlipy => 'Cari KLIPY';

  @override
  String get gifPickerSearchTenor => 'Cari di Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Favorit';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Belum ada GIF favorit';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Beri bintang pada GIF untuk melihatnya di sini.';

  @override
  String get gifPickerTrending => 'GIF populer';

  @override
  String get gifPickerNoResultsTitle => 'Tidak ada hasil pencarian';

  @override
  String get gifPickerNoResultsDescription => 'Coba istilah pencarian lain';

  @override
  String get gifPickerLoadFailedTitle => 'Gagal memuat GIF';

  @override
  String get gifPickerLoadFailedBody => 'Periksa koneksimu dan coba lagi.';

  @override
  String get emojiCategoryPeople => 'Orang';

  @override
  String get emojiCategoryNature => 'Alam';

  @override
  String get emojiCategoryFood => 'Makanan & minuman';

  @override
  String get emojiCategoryActivity => 'Aktivitas';

  @override
  String get emojiCategoryTravel => 'Perjalanan & tempat';

  @override
  String get emojiCategoryObjects => 'Objek';

  @override
  String get emojiCategorySymbols => 'Simbol';

  @override
  String get emojiCategoryFlags => 'Bendera';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Buka $emojiCount dari $communityCount dengan Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Dapatkan Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Jangan tampilkan ini lagi';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count emoji kustom',
      one: '1 emoji kustom',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count komunitas',
      one: '1 komunitas',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Peringatan tautan eksternal';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Kamu akan meninggalkan $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Tautan eksternal bisa berbahaya. Harap berhati-hati.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL tujuan:';

  @override
  String get externalLinksSectionTitle => 'Tautan Eksternal';

  @override
  String get externalLinksSectionDescription =>
      'Atur cara peringatan tautan eksternal ditangani.';

  @override
  String get externalLinkWarningTrustPrefix => 'Selalu percaya ';

  @override
  String get externalLinkWarningTrustSuffix =>
      ' — lewati peringatan ini lain kali';

  @override
  String get externalLinkVisitSite => 'Kunjungi situs';

  @override
  String get externalLinkTrustAllLabel => 'Percayai semua tautan eksternal';

  @override
  String get externalLinkStripTrackingLabel =>
      'Hapus parameter pelacakan dari URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Hapus parameter pelacakan (seperti utm_source, fbclid, gclid) secara otomatis dari URL di pesan yang kamu kirim. Membersihkan tautan sebelum sampai ke orang lain.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Percayai semua tautan eksternal?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Ini akan memercayai semua tautan eksternal dan melewati peringatan untuk setiap domain. Domain tepercayamu yang sudah ada akan diganti. Ini kurang aman.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Percayai semua';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Berhenti memercayai semua tautan?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Peringatan tautan eksternal akan ditampilkan lagi. Kamu perlu menambahkan domain tepercaya satu per satu.';

  @override
  String get externalLinkStopTrustingAllAction => 'Nonaktifkan percaya semua';

  @override
  String get externalLinkTrustedAllDescription =>
      'Semua tautan eksternal tepercaya. Peringatan tidak akan ditampilkan.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Anda memiliki $count domain tepercaya. Tambahkan lebih banyak dengan mencentang kotak saat mengunjungi tautan eksternal.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Saat diaktifkan, tidak ada peringatan tautan eksternal yang akan ditampilkan. Ini kurang aman.';

  @override
  String get imageFileTooLarge =>
      'File gambar terlalu besar. Pilih file yang ukurannya kurang dari 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'Avatar animasi memerlukan Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'Banner animasi memerlukan Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF Animasi Tidak Didukung';

  @override
  String get animatedAvifNotSupportedBody =>
      'Memotong dan memutar file AVIF animasi belum didukung. Jika Anda melanjutkan, file akan diunggah dalam bentuk aslinya.';

  @override
  String get uploadAsIs => 'Unggah Apa Adanya';

  @override
  String get croppingAnimatedNotSupported =>
      'Memotong gambar animasi belum didukung. Unggahan asli akan digunakan.';

  @override
  String get cropAvatar => 'Pangkas avatar';

  @override
  String get cropBanner => 'Pangkas banner';

  @override
  String get skip => 'Lewati';

  @override
  String get crop => 'Pangkas';

  @override
  String get cropTouchHint =>
      'Cubitz untuk memperbesar, seret untuk memposisikan ulang';

  @override
  String get cropMouseHint =>
      'Seret sudut untuk mengubah ukuran, seret bagian dalam untuk memindahkan';

  @override
  String get changeYourFluxerTag => 'Ubah nama penggunamu';

  @override
  String get fluxerTagInputLabel => 'Nama pengguna';

  @override
  String get fluxerTagDescriptionBase =>
      'Nama pengguna hanya bisa berisi huruf (a-z, A-Z), angka (0-9), dan garis bawah. Nama pengguna tidak peka huruf besar/kecil.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Nama pengguna hanya boleh berisi huruf (a-z, A-Z), angka (0-9), dan garis bawah. Nama pengguna tidak peka huruf besar/kecil. Anda dapat memilih tag 4 digit yang tersedia dari #0000 hingga #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Nama pengguna hanya boleh berisi huruf (a-z, A-Z), angka (0-9), dan garis bawah. Nama pengguna tidak peka huruf besar/kecil. Anda dapat memilih tag 4 digit yang tersedia dari #0001 hingga #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Antara $min dan $max karakter';
  }

  @override
  String get validationAllowedChars =>
      'Hanya huruf (a-z, A-Z), angka (0-9), dan garis bawah (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Dapatkan Plutonium untuk menyesuaikan tag Anda atau simpan saat mengubah nama pengguna Anda';

  @override
  String get fluxerTagAlreadyTaken => 'Nama pengguna sudah dipakai';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Nama pengguna $username#$discriminator sudah digunakan. Melanjutkan akan mengganti diskriminator Anda secara otomatis.';
  }

  @override
  String get customTagIsTemporary => 'Tag Kustom Bersifat Sementara';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Tag 4 digit kustom Anda hanya tersedia selama langganan Plutonium Anda aktif. Saat langganan Anda berakhir pada $date, tag Anda akan kembali ke nomor yang ditetapkan secara acak setelah masa tenggang 3 hari.';
  }

  @override
  String get customTagTemporaryBody =>
      'Tag 4 digit kustom Anda hanya tersedia selama langganan Plutonium Anda aktif. Saat langganan Anda berakhir, tag Anda akan kembali ke nomor yang ditetapkan secara acak setelah masa tenggang 3 hari.';

  @override
  String get iUnderstandContinue => 'Saya Mengerti, Lanjutkan';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Jika Anda menyimpan nama pengguna ini, tag 4 digit kustom Anda akan kembali menjadi nomor acak saat langganan Plutonium Anda berakhir. Jika langganan Anda gagal diperpanjang, Anda akan memiliki masa tenggang 3 hari sebelum tag berubah.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Tag 4 digit kustom Anda (#$discriminator) aktif selama langganan Plutonium Anda aktif. Jika langganan Anda berakhir atau gagal diperpanjang setelah masa tenggang 3 hari, tag Anda akan kembali menjadi nomor acak.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Sesuaikan tag 4 digit Anda atau simpan saat mengganti nama pengguna Anda';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Uji coba Plutonium Anda berakhir pada $date. Tingkatkan untuk menyimpan tag kustom Anda dan dapatkan lencana di profil Anda.';
  }

  @override
  String get premiumTrialActive =>
      'Anda sedang dalam uji coba Plutonium. Tingkatkan untuk menyimpan tag kustom Anda dan dapatkan lencana di profil Anda.';

  @override
  String get fluxerTagUpdated => 'Nama pengguna diperbarui';

  @override
  String get fluxerTagUpdateFailed =>
      'Gagal memperbarui nama pengguna. Coba lagi.';

  @override
  String get continueAction => 'Lanjutkan';

  @override
  String get profileCustomizationTitle => 'Kustomisasi profil';

  @override
  String get profileCustomizationDescription =>
      'Edit tampilan profilmu dan lihat pratinjau langsung';

  @override
  String get usernameLabel => 'Nama pengguna';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Klaim akunmu untuk mengubah nama penggunamu';

  @override
  String get changeFluxerTag => 'Ubah nama pengguna';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Sesuaikan tag 4 digit Anda (#$discriminator) sesuka hati dengan Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Ubah nama pengguna dan tag 4 digit Anda';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Tag kustom Anda (#$discriminator) terikat pada langganan Plutonium Anda dan akan kembali menjadi tag acak jika kedaluwarsa.';
  }

  @override
  String get displayNameLabel => 'Nama tampilan';

  @override
  String get pronounsLabel => 'Kata ganti';

  @override
  String get avatarLabel => 'Avatar';

  @override
  String get changeAvatar => 'Ganti avatar';

  @override
  String get removeAvatar => 'Hapus avatar';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Maks 10MB. Rekomendasi: 512×512px';

  @override
  String get bannerLabel => 'Banner';

  @override
  String get changeBanner => 'Ganti banner';

  @override
  String get removeBanner => 'Hapus banner';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Maks 10MB. Minimum: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'Warna aksen';

  @override
  String get accentColorDescription =>
      'Menyesuaikan warna bingkai dan banner di profilmu';

  @override
  String get aboutMeLabel => 'Tentang saya';

  @override
  String get aboutMeHelperText =>
      'Kamu bisa pakai tautan, emoji, dan Markdown.';

  @override
  String get emojiPickerTitle => 'Emoji';

  @override
  String get plutoniumBadgePrivacyTitle => 'Privasi Lencana Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Atur cara lencana Plutonium Anda ditampilkan kepada orang lain';

  @override
  String get hidePlutoniumBadgeLabel =>
      'Sembunyikan lencana Plutonium sepenuhnya';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Sembunyikan lencana Plutonium Anda sepenuhnya dari pengguna lain';

  @override
  String get hidePlutoniumPurchaseDate =>
      'Sembunyikan tanggal pembelian Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Sembunyikan tanggal pembelian Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Hapus saat Anda pertama kali membeli Plutonium dari lencana Anda';

  @override
  String get maskVisionaryAsSubscription =>
      'Samarkan Visionary sebagai langganan';

  @override
  String get maskVisionaryDescription =>
      'Tampilkan Visionary-mu sebagai langganan biasa saja';

  @override
  String get hideVisionaryIdBadge => 'Sembunyikan badge ID Visionary';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Sembunyikan lencana ID Visioner (nomor #$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Hapus lencana ID Visionary milikmu';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Anda sedang dalam uji coba Plutonium — langganan Anda dimulai pada $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Langganan Anda akan dimulai secara otomatis saat uji coba berakhir. Tidak perlu tindakan.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Anda sedang dalam uji coba Plutonium yang berakhir pada $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Anda sedang mencoba Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Maks 10MB. Rekomendasi: 512×512px. Avatar animasi (GIF) memerlukan Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Sesuaikan profil Anda dengan gambar banner statis atau animasi agar profil Anda menonjol.';

  @override
  String get getPlutonium => 'Dapatkan Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Pembelian dalam aplikasi belum tersedia di platform ini. Nantikan — segera hadir!';

  @override
  String get profilePreviewLabel => 'Pratinjau';

  @override
  String get profilePreviewMessage => 'Pesan';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Anggota $productName sejak';
  }

  @override
  String get unclaimedAccountTitle => 'Akun belum diklaim';

  @override
  String get unclaimedAccountDescription =>
      'Akun Anda belum diklaim. Tanpa email dan sandi, Anda bisa kehilangan akses. Klaim akun Anda sekarang untuk mengamankannya.';

  @override
  String get claimAccount => 'Klaim akun';

  @override
  String get profileTypeLabel => 'Jenis profil';

  @override
  String get profileTypeGlobal => 'Profil global';

  @override
  String get profileTypeGuildDescription =>
      'Kamu sedang mengedit profil per-komunitasmu. Profil ini hanya akan terlihat di komunitas ini dan akan menimpa profil globalmu.';

  @override
  String get communityNicknameLabel => 'Nama panggilan komunitas';

  @override
  String get perGuildPremiumUpsellText =>
      'Kustomisasi avatar, banner, warna aksen, dan bio Anda untuk komunitas tertentu memerlukan Plutonium. Nama panggilan dan kata ganti komunitas gratis untuk semua orang.';

  @override
  String get avatarModeInherit => 'Gunakan profil global';

  @override
  String get avatarModeCustom => 'Gunakan gambar khusus';

  @override
  String get avatarModeUnset => 'Jangan tampilkan';

  @override
  String get profileSavedToast => 'Profil diperbarui';

  @override
  String get profileEditButton => 'Edit profil';

  @override
  String get profileNoteLabel => 'Catatan';

  @override
  String get profileNoteVisibility => '(hanya terlihat olehmu)';

  @override
  String get profileNoteEmpty => 'Belum ada catatan.';

  @override
  String get sudoTitle => 'Verifikasi Identitas Anda';

  @override
  String get sudoDescription =>
      'Tindakan ini memerlukan verifikasi untuk melanjutkan.';

  @override
  String get sudoAuthenticatorCode => 'Kode autentikator';

  @override
  String get sudoMethodPassword => 'Kata sandi';

  @override
  String get sudoMethodTotp => 'Autentikator';

  @override
  String get sudoVerificationFailed => 'Verifikasi gagal. Coba lagi.';

  @override
  String get securityAccountTitle => 'Akun';

  @override
  String get securityAccountDescription =>
      'Kelola email, sandi, dan setelan akun Anda';

  @override
  String get securitySectionTitle => 'Keamanan';

  @override
  String get securitySectionDescription =>
      'Lindungi akun Anda dengan autentikasi dua faktor dan passkey';

  @override
  String get securityLoginEmailSectionTitle => 'Pengaturan Email';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Kelola alamat email yang Anda gunakan untuk masuk ke $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Alamat email';

  @override
  String get securityLoginNoEmailSet => 'Tidak ada alamat email yang diatur';

  @override
  String get securityLoginChangeEmail => 'Ubah email';

  @override
  String get securityLoginAddEmail => 'Tambah email';

  @override
  String get securityLoginReveal => 'Tampilkan';

  @override
  String get securityLoginHide => 'Sembunyikan';

  @override
  String get securityLoginPasswordSectionTitle => 'Kata sandi';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Ubah sandi Anda untuk menjaga keamanan akun';

  @override
  String get securityLoginCurrentPasswordLabel => 'Kata Sandi Saat Ini';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Terakhir diubah: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Terakhir diubah: Tidak pernah';

  @override
  String get securityLoginNoPasswordSet => 'Belum ada kata sandi yang diatur';

  @override
  String get securityLoginChangePassword => 'Ubah kata sandi';

  @override
  String get securityLoginSetPassword => 'Atur kata sandi';

  @override
  String get passwordChangeTitle => 'Ubah kata sandi';

  @override
  String get passwordChangeIntroDescription =>
      'Kami akan mengirimkan kode verifikasi ke alamat email Anda untuk mengonfirmasi identitas Anda sebelum mengubah sandi.';

  @override
  String get passwordChangeStart => 'Mulai';

  @override
  String get passwordChangeVerifyTitle => 'Verifikasi emailmu';

  @override
  String get passwordChangeVerifyDescription =>
      'Masukkan kode verifikasi yang dikirim ke alamat email Anda.';

  @override
  String get passwordChangeVerificationCode => 'Kode verifikasi';

  @override
  String get passwordChangeVerify => 'Verifikasi';

  @override
  String get passwordChangeNewPasswordTitle => 'Atur kata sandi baru';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Masukkan kata sandi baru Anda di bawah ini.';

  @override
  String get passwordChangeNewPassword => 'Kata sandi baru';

  @override
  String get passwordChangeConfirmPassword => 'Konfirmasi kata sandi baru';

  @override
  String get passwordChangeSubmit => 'Ubah kata sandi';

  @override
  String get passwordChangeSuccess => 'Kata sandi diubah';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Kata sandi tidak cocok';

  @override
  String get passwordChangeInvalidCode => 'Kode tidak valid atau kedaluwarsa';

  @override
  String get emailChangeTitle => 'Ubah email';

  @override
  String get emailChangeIntroDescription =>
      'Kami akan mengirimkan kode verifikasi untuk memverifikasi identitas Anda sebelum mengubah alamat email Anda.';

  @override
  String get emailChangeStart => 'Mulai';

  @override
  String get emailChangeVerifyOriginalTitle => 'Verifikasi Email Saat Ini';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Masukkan kode verifikasi yang dikirim ke alamat email Anda saat ini.';

  @override
  String get emailChangeNewEmailTitle => 'Masukkan email baru';

  @override
  String get emailChangeNewEmailDescription =>
      'Masukkan alamat email baru yang ingin Anda gunakan.';

  @override
  String get emailChangeNewEmailLabel => 'Email baru';

  @override
  String get emailChangeNewEmailSubmit => 'Kirim kode verifikasi';

  @override
  String get emailChangeVerifyNewTitle => 'Verifikasi Email Baru';

  @override
  String get emailChangeVerifyNewDescription =>
      'Masukkan kode verifikasi yang dikirim ke alamat email baru Anda.';

  @override
  String get emailChangeSuccess => 'Email berhasil diubah';

  @override
  String get emailChangeInvalidCode => 'Kode tidak valid atau kedaluwarsa';

  @override
  String get resend => 'Kirim ulang';

  @override
  String resendCountdown(int seconds) {
    return 'Kirim ulang (${seconds}d)';
  }

  @override
  String get verificationCode => 'Kode verifikasi';

  @override
  String get verify => 'Verifikasi';

  @override
  String get enable => 'Aktifkan';

  @override
  String get disable => 'Nonaktifkan';

  @override
  String get delete => 'Hapus';

  @override
  String get save => 'Simpan';

  @override
  String get securityTfaSectionTitle => 'Autentikasi dua faktor';

  @override
  String get securityTfaSectionDescription =>
      'Tambahkan lapisan keamanan ekstra ke akunmu';

  @override
  String get securityTfaAuthenticatorApp => 'Aplikasi Autentikator';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'Autentikasi dua faktor diaktifkan';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Gunakan aplikasi autentikator untuk membuat kode autentikasi dua faktor';

  @override
  String get securityTfaBackupCodes => 'Kode cadangan';

  @override
  String get securityTfaBackupCodesDescription =>
      'Lihat dan kelola kode cadanganmu untuk pemulihan akun';

  @override
  String get securityTfaViewCodes => 'Lihat kode';

  @override
  String get securityPasskeysSectionTitle => 'Passkey';

  @override
  String get securityPasskeysSectionDescription =>
      'Gunakan kunci sandi untuk masuk tanpa sandi dan autentikasi dua faktor';

  @override
  String get securityPasskeysRegistered => 'Passkey terdaftar';

  @override
  String get securityPasskeysNone => 'Tidak ada passkey yang terdaftar';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return '$count $_temp0 terdaftar (maks 10)';
  }

  @override
  String get securityPasskeysAdd => 'Tambahkan passkey';

  @override
  String securityPasskeysAdded(String date) {
    return 'Ditambahkan: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Terakhir digunakan: $date';
  }

  @override
  String get securityPasskeysRename => 'Ganti nama';

  @override
  String get securityPasskeysDeleteTitle => 'Hapus passkey';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Apakah Anda yakin ingin menghapus passkey \"$name\"?';
  }

  @override
  String get securityPasskeyNameTitle => 'Beri nama passkey';

  @override
  String get securityPasskeyNameLabel => 'Nama passkey';

  @override
  String get securityPasskeyNameHint =>
      'misalnya, YubiKey, iPhone, komputer kantor';

  @override
  String get securityPhoneSectionTitle => 'Nomor telepon';

  @override
  String get securityPhoneSectionDescription => 'Kelola nomor telepon Anda.';

  @override
  String get securityPhoneLabel => 'Nomor telepon';

  @override
  String get securityPhoneNone => 'Nomor telepon belum ditambahkan.';

  @override
  String get securityPhoneAdd => 'Tambah Telepon';

  @override
  String get securityPhoneRemove => 'Hapus';

  @override
  String get securityPhoneRemoveTitle => 'Hapus Nomor Telepon';

  @override
  String get securityPhoneRemoveDescription =>
      'Apakah Anda yakin ingin menghapus nomor telepon Anda?';

  @override
  String get securityPhoneRemoved => 'Nomor telepon dihapus';

  @override
  String get securityClaimTitle => 'Fitur keamanan';

  @override
  String get securityClaimDescription =>
      'Klaim akunmu untuk mengakses fitur keamanan seperti autentikasi dua faktor dan passkey.';

  @override
  String get securityVerifyEmailRequired =>
      'Anda harus memverifikasi alamat email Anda sebelum dapat menyiapkan otentikasi dua faktor, kunci sandi, atau verifikasi SMS.';

  @override
  String get totpEnableTitle => 'Siapkan Aplikasi Authenticator';

  @override
  String get totpEnableDescription =>
      'Pindai kode QR dengan aplikasi autentikator Anda untuk menghasilkan kode autentikasi dua faktor.';

  @override
  String get totpEnableCodeLabel => 'Kode';

  @override
  String get totpEnableCodeHint =>
      'Masukkan kode 6 digit dari aplikasi autentikator Anda';

  @override
  String get totpEnableSuccess => 'Autentikasi dua faktor telah diaktifkan';

  @override
  String get totpDisableTitle => 'Hapus aplikasi autentikator';

  @override
  String get totpDisableDescription =>
      'Masukkan kode 6 digit dari aplikasi autentikator Anda untuk menonaktifkan autentikasi dua faktor.';

  @override
  String get totpDisableSuccess => 'Autentikasi dua faktor dinonaktifkan';

  @override
  String get backupCodesTitle => 'Kode cadangan';

  @override
  String get backupCodesWarning =>
      'Jika Anda kehilangan akses ke aplikasi autentikator dan tidak memiliki kode-kode ini, Anda akan terkunci permanen dari akun Anda. Unduh atau salin sekarang dan simpan di tempat yang aman.';

  @override
  String get backupCodesDownload => 'Unduh';

  @override
  String get backupCodesCopy => 'Salin';

  @override
  String get backupCodesCopied => 'Kode cadangan disalin ke papan klip';

  @override
  String get backupCodesAcknowledge =>
      'Saya telah mengunduh atau menyalin kode cadangan saya dan menyimpannya di tempat yang aman.';

  @override
  String get backupCodesDone => 'Selesai';

  @override
  String get backupCodesViewTitle => 'Lihat kode cadangan';

  @override
  String get backupCodesViewDescription =>
      'Verifikasi mungkin diperlukan sebelum melihat kode cadangan Anda.';

  @override
  String get phoneAddTitle => 'Tambahkan Nomor Telepon';

  @override
  String get phoneAddLabel => 'Nomor telepon';

  @override
  String get phoneAddHint => 'Masukkan nomor teleponmu';

  @override
  String get phoneAddFooter =>
      'Kami akan mengirimkan kode SMS jika tersedia. Nomor Anda tidak ditautkan ke akun Anda. Kami hanya menyimpan penanda terenkripsi, tanpa ID pengguna, untuk mengizinkan maksimal 2 verifikasi dalam waktu sekitar 30 hari.';

  @override
  String get phoneAddSendCode => 'Kirim kode';

  @override
  String get phoneVerifyTitle => 'Verifikasi nomor telepon';

  @override
  String get phoneVerifyDescription =>
      'Masukkan kode verifikasi yang dikirim ke nomor telepon Anda.';

  @override
  String get phoneAddSuccess => 'Nomor telepon terverifikasi';

  @override
  String get phoneCountryLabel => 'Negara';

  @override
  String get phoneSearchCountries => 'Cari negara...';

  @override
  String get phoneNumberRequired => 'Nomor telepon wajib diisi';

  @override
  String get phoneEnterValidNumber => 'Masukkan nomor ponsel yang valid.';

  @override
  String get phoneCannotBeUsed =>
      'Nomor telepon ini tidak dapat digunakan. Coba nomor ponsel lain atau hubungi dukungan.';

  @override
  String get phoneAlreadyUsed =>
      'Nomor telepon ini sudah digunakan. Coba nomor lain atau hubungi dukungan.';

  @override
  String get phoneCodeDidNotWork =>
      'Kode itu tidak berfungsi. Periksa dan coba lagi.';

  @override
  String get phoneTooManyAttempts =>
      'Terlalu banyak percobaan. Tunggu sebentar, lalu coba lagi.';

  @override
  String get phoneSmsUnavailable =>
      'Verifikasi SMS tidak tersedia saat ini. Coba lagi nanti atau hubungi dukungan.';

  @override
  String get phoneNotEligible =>
      'Verifikasi telepon tidak tersedia untuk akun ini. Gunakan metode lain atau hubungi dukungan.';

  @override
  String get phoneSomethingWentWrong => 'Terjadi kesalahan. Coba lagi.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Mengirim SMS ke nomor telepon ini terlalu mahal, jadi kami perlu Anda mengirimkan SMS kepada kami sebagai gantinya. Anda juga dapat menghubungi dukungan untuk meminta kami menghapus persyaratan ini dari akun Anda.';

  @override
  String get phoneInboundDefaultDescription =>
      'Kami perlu Anda mengirim SMS untuk memverifikasi nomor telepon Anda.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Buka aplikasi pesan di ponselmu dan buat pesan teks baru.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Kirim kode $code ke $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Tunggu kami menerima pesan Anda. Ini mungkin memerlukan waktu satu menit.';

  @override
  String get phoneInboundGetNewCode => 'Dapatkan kode baru';

  @override
  String get phoneInboundChallengeCodeLabel => 'Kode yang akan dikirim';

  @override
  String get phoneInboundOurNumberLabel => 'Kirim ke';

  @override
  String get requiredActionTitle => 'Verifikasi akun diperlukan';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Selesaikan verifikasi yang diperlukan untuk terus menggunakan $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Pendaftaranmu memerlukan pemeriksaan anti-spam tambahan sebelum kamu bisa melanjutkan.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Verifikasi email atau teleponmu untuk terus menggunakan $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Selesaikan langkah verifikasi email dan telepon yang diperlukan di bawah untuk terus menggunakan $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Pilih metode verifikasi';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Selesaikan salah satu jalur verifikasi di bawah untuk terus menggunakan $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Gunakan email';

  @override
  String get requiredActionUsePhone => 'Gunakan telepon';

  @override
  String get requiredActionCheckEmailTitle => 'Cek emailmu';

  @override
  String get requiredActionCheckEmailDescription =>
      'Kami mengirimkan tautan verifikasi ke alamat email Anda. Buka tautan tersebut untuk melanjutkan.';

  @override
  String get requiredActionResendVerificationEmail =>
      'Kirim ulang email verifikasi';

  @override
  String get requiredActionVerificationEmailSent =>
      'Email verifikasi telah dikirim. Periksa kotak masukmu.';

  @override
  String get requiredActionSignOut => 'Keluar';

  @override
  String get dangerZoneSectionTitle => 'Zona bahaya';

  @override
  String get dangerZoneSectionDescription =>
      'Tindakan yang tidak dapat diubah dan merusak';

  @override
  String get dangerZoneDisableTitle => 'Nonaktifkan akun';

  @override
  String get dangerZoneDisableDescription =>
      'Nonaktifkan akunmu untuk sementara. Kamu bisa mengaktifkannya lagi nanti dengan masuk kembali.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Menonaktifkan akun Anda akan mengeluarkan Anda dari semua sesi. Anda dapat mengaktifkan kembali akun Anda kapan saja dengan masuk lagi.';

  @override
  String get dangerZoneDeleteTitle => 'Hapus akun';

  @override
  String get dangerZoneDeleteDescription =>
      'Hapus permanen akunmu dan semua data terkait. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Batalkan langganan Plutonium Anda yang aktif di pengaturan Plutonium sebelum menghapus akun Anda.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Tidak bisa menghapus akun';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Kamu tidak dapat menghapus akun selama masih memiliki komunitas. Transfer kepemilikan komunitas berikut terlebih dahulu:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'dan $count lainnya';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Untuk mentransfer kepemilikan, buka $settingsPath dan gunakan opsi transfer kepemilikan.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Yakin ingin menghapus akunmu? Tindakan ini akan menjadwalkan akunmu untuk dihapus secara permanen.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Kamu dapat membatalkan proses penghapusan dalam 14 hari';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Setelah 14 hari, akunmu akan dihapus secara permanen';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Setelah penghapusan diproses, kamu tidak bisa memulihkan akses ke akunmu';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Anda tidak akan bisa menghapus pesan terkirim setelah akun Anda dihapus';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Jika Anda ingin mengekspor data atau menghapus pesan terlebih dahulu, silakan kunjungi bagian Dasbor Privasi di Pengaturan Pengguna sebelum melanjutkan.';

  @override
  String get claimAccountTitle => 'Klaim akunmu';

  @override
  String get claimAccountDescription =>
      'Klaim akunmu dengan menambahkan email dan kata sandi. Kami akan mengirimkan kode verifikasi untuk mengonfirmasi emailmu sebelum selesai.';

  @override
  String get claimAccountEmailLabel => 'Email';

  @override
  String get claimAccountPasswordLabel => 'Kata sandi';

  @override
  String get claimAccountSendCode => 'Kirim kode';

  @override
  String get claimAccountVerifyDescription =>
      'Masukkan kode yang kami kirim ke emailmu untuk memverifikasinya. Kata sandimu akan diatur setelah kode dikonfirmasi.';

  @override
  String get claimAccountSuccess => 'Akun berhasil diklaim';

  @override
  String get importantInformation => 'Informasi penting:';

  @override
  String get genericError => 'Terjadi kesalahan';

  @override
  String get networkErrorMessage => 'Terjadi kesalahan. Coba lagi.';

  @override
  String get invalidCode => 'Kode tidak valid';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tahun lalu',
      one: '1 tahun lalu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bulan lalu',
      one: '1 bulan lalu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari yang lalu',
      one: '1 hari yang lalu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jam yang lalu',
      one: '1 jam yang lalu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menit yang lalu',
      one: '1 menit yang lalu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count minggu lalu',
      one: '1 minggu lalu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count menit',
      one: 'dalam 1 menit',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count jam',
      one: 'dalam 1 jam',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count hari',
      one: 'dalam 1 hari',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count minggu',
      one: 'dalam 1 minggu',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count bulan',
      one: 'dalam 1 bulan',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dalam $count tahun',
      one: 'dalam 1 tahun',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'baru saja';

  @override
  String get authorizedAppsTitle => 'Aplikasi yang diotorisasi';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Aplikasi-aplikasi ini telah diberikan akses ke akun $productName Anda.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Tidak ada aplikasi yang diotorisasi';

  @override
  String get authorizedAppsEmptyDescription =>
      'Kamu belum mengizinkan aplikasi apa pun untuk mengakses akunmu.';

  @override
  String get authorizedAppsLoadError =>
      'Gagal memuat aplikasi yang diotorisasi';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Diizinkan pada $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Izin yang diberikan';

  @override
  String get authorizedAppsRevoke => 'Cabut';

  @override
  String get authorizedAppsRevokeTitle => 'Cabut akses aplikasi';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Apakah Anda yakin ingin mencabut akses untuk $appName? Aplikasi ini tidak akan lagi memiliki akses ke akun Anda.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Akses informasi profil dasarmu (nama pengguna, avatar, dll.)';

  @override
  String get authorizedAppsScopeEmail => 'Lihat alamat emailmu';

  @override
  String get authorizedAppsScopeGuilds =>
      'Lihat komunitas tempat kamu menjadi anggota';

  @override
  String get authorizedAppsScopeConnections => 'Lihat akun terhubungmu';

  @override
  String get authorizedAppsScopeBot =>
      'Tambahkan bot ke komunitas dengan izin yang diminta';

  @override
  String get authorizedAppsScopeAdmin => 'Akses endpoint administratif';

  @override
  String get applicationsTitle => 'Aplikasi';

  @override
  String get applicationsCreate => 'Buat aplikasi';

  @override
  String get applicationsCreateSubmit => 'Buat';

  @override
  String get applicationsCreateClaimTooltip =>
      'Klaim akunmu untuk membuat aplikasi.';

  @override
  String applicationsDocsLink(String domain) {
    return 'Baca dokumentasi ($domain)';
  }

  @override
  String get applicationsLoadError => 'Tidak dapat memuat aplikasi';

  @override
  String get applicationsLoadErrorDescription =>
      'Periksa koneksimu dan coba lagi.';

  @override
  String get applicationsEmptyTitle => 'Belum ada aplikasi';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'Buat aplikasi pertamamu untuk memulai dengan $apiName.';
  }

  @override
  String applicationsCreated(String date) {
    return 'Dibuat $date';
  }

  @override
  String get applicationsName => 'Nama aplikasi';

  @override
  String get applicationsNameHint => 'Aplikasi saya';

  @override
  String get applicationsNameRequired => 'Nama aplikasi wajib diisi';

  @override
  String get applicationsBackToList => 'Kembali ke daftar';

  @override
  String get applicationsDetailLoadError => 'Tidak dapat memuat aplikasi ini';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'Coba lagi atau kembali ke daftar aplikasi.';

  @override
  String get applicationsId => 'ID aplikasi';

  @override
  String get applicationsCopyId => 'Salin ID';

  @override
  String get applicationsSecretsTitle => 'Rahasia & token';

  @override
  String get applicationsSecretsDescription =>
      'Jaga kerahasiaan ini. Membuat ulang akan merusak integrasi yang ada.';

  @override
  String get applicationsClientSecret => 'Rahasia klien';

  @override
  String get applicationsBotToken => 'Token bot';

  @override
  String get applicationsRegenerate => 'Buat ulang';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'Buat ulang rahasia klien?';

  @override
  String get applicationsRegenerateBotTokenTitle => 'Buat ulang token bot?';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'Membuat ulang akan membatalkan rahasia saat ini. Perbarui kode apa pun yang menggunakan nilai lama.';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'Membuat ulang akan membatalkan token saat ini. Perbarui kode apa pun yang menggunakan nilai lama.';

  @override
  String get applicationsClientSecretRegenerated =>
      'Rahasia klien dibuat ulang. Perbarui kode apa pun yang menggunakan rahasia lama.';

  @override
  String get applicationsBotTokenRegenerated =>
      'Token bot berhasil dibuat ulang. Perbarui kode apa pun yang menggunakan token lama.';

  @override
  String get applicationsRegenerateFailed =>
      'Tidak dapat membuat ulang rahasia';

  @override
  String get applicationsInfoTitle => 'Informasi aplikasi';

  @override
  String get applicationsInfoDescription =>
      'Pengaturan dasar dan URI pengalihan yang diizinkan.';

  @override
  String get applicationsPublicBot => 'Bot publik';

  @override
  String get applicationsPublicBotDescription =>
      'Izinkan siapa pun mengundang bot ini ke komunitas mereka.';

  @override
  String get applicationsRequireCodeGrant => 'Wajibkan pemberian kode OAuth2';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'Memerlukan URI pengalihan dan kode otorisasi saat mengundang bot ini.';

  @override
  String get applicationsRedirectUris => 'URI pengalihan';

  @override
  String get applicationsAddRedirect => 'Tambahkan pengalihan';

  @override
  String get applicationsDeleteRedirect => 'Hapus URI pengalihan';

  @override
  String get applicationsBotProfileTitle => 'Profil bot';

  @override
  String get applicationsBotProfileDescription =>
      'Avatar, tag, dan detail profil lengkap untuk botmu.';

  @override
  String get applicationsBotAvatar => 'Avatar bot';

  @override
  String get applicationsUsernameRequired => 'Nama pengguna wajib diisi';

  @override
  String get applicationsUsernameTooLong =>
      'Nama pengguna maksimal 32 karakter';

  @override
  String get applicationsUsernameInvalid =>
      'Nama pengguna hanya bisa berisi huruf, angka, dan garis bawah';

  @override
  String get applicationsBotUsername => 'Nama pengguna bot';

  @override
  String get applicationsDiscriminator => 'Diskriminator';

  @override
  String get applicationsBotBio => 'Bio bot';

  @override
  String get applicationsBotBioHint =>
      'Bot penolong yang bisa melakukan hal-hal menakjubkan!';

  @override
  String get applicationsNoBotBanner => 'Tidak ada banner bot';

  @override
  String get applicationsFriendlyBot => 'Bot ramah';

  @override
  String get applicationsFriendlyBotDescription =>
      'Izinkan pengguna mengirim permintaan pertemanan ke bot ini untuk persetujuan manual.';

  @override
  String get applicationsManualFriendApproval =>
      'Wajibkan persetujuan teman secara manual';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'Permintaan pertemanan ke bot ini memerlukan persetujuan manual.';

  @override
  String get applicationsOauthBuilderTitle => 'Pembuat URL OAuth2';

  @override
  String get applicationsOauthBuilderDescription =>
      'Buat URL otorisasi dengan cakupan dan izin.';

  @override
  String get applicationsScopes => 'Cakupan';

  @override
  String get applicationsRedirectUri => 'URI pengalihan';

  @override
  String get applicationsSelectRedirectUri => 'Pilih URI pengalihan';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'URI pengalihan diperlukan karena bot ini membutuhkan pemberian kode OAuth2.';

  @override
  String get applicationsRedirectRequiredScopes =>
      'URI pengalihan wajib diisi jika tidak hanya menggunakan cakupan bot.';

  @override
  String get applicationsBotPermissions => 'Izin bot';

  @override
  String get applicationsAuthorizeUrl => 'URL otorisasi';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'Pilih cakupan (dan URI pengalihan jika diperlukan)';

  @override
  String get applicationsCopyAuthorizeUrl => 'Salin URL otorisasi';

  @override
  String get applicationsCopiedUrl => 'URL disalin ke papan klip';

  @override
  String get applicationsDangerTitle => 'Zona bahaya';

  @override
  String get applicationsDangerSubtitle =>
      'Tindakan ini tidak dapat dibatalkan. Menghapus aplikasi juga akan menghapus botnya.';

  @override
  String get applicationsDangerHelper =>
      'Setelah dihapus, aplikasi dan kredensialnya akan terhapus secara permanen.';

  @override
  String get applicationsDelete => 'Hapus aplikasi';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'Apakah Anda yakin ingin menghapus $name? Tindakan ini tidak dapat dibatalkan. Semua data terkait, termasuk pengguna bot, akan dihapus secara permanen.';
  }

  @override
  String get applicationsDeleteFailed => 'Tidak dapat menghapus aplikasi';

  @override
  String get applicationsUpdated => 'Aplikasi berhasil diperbarui';

  @override
  String get applicationsNoChanges => 'Tidak ada perubahan untuk disimpan';

  @override
  String get applicationsSearchBots => 'Aplikasi & bot';

  @override
  String get applicationsSearchBotsDescription =>
      'Buat dan kelola aplikasi serta bot untuk akunmu';

  @override
  String get applicationsSearchInfoDescription =>
      'Edit pengaturan dasar aplikasi dan URI pengalihan';

  @override
  String get applicationsSearchBotProfileDescription =>
      'Edit avatar, tag, bio, banner, dan perilaku permintaan pertemanan bot';

  @override
  String get applicationsSearchOauthDescription =>
      'Buat URL otorisasi dengan cakupan, pengalihan, dan izin bot';

  @override
  String get applicationsSearchSecretsDescription =>
      'Lihat dan buat ulang rahasia klien serta token bot';

  @override
  String get applicationsSearchBotsKeyword => 'Bot';

  @override
  String get applicationsSearchDocumentation => 'Dokumentasi';

  @override
  String get privacyPendingDeletionTitle => 'Menunggu Penghapusan';

  @override
  String get blockedUsersTitle => 'Pengguna yang diblokir';

  @override
  String get blockedUsersDescription =>
      'Pengguna yang diblokir tidak bisa mengirim permintaan pertemanan atau mengirimi kamu pesan langsung.';

  @override
  String get blockedUsersEmptyTitle => 'Tidak ada pengguna yang diblokir';

  @override
  String get blockedUsersEmptyDescription => 'Kamu belum memblokir siapa pun.';

  @override
  String get blockedUsersLoadError => 'Gagal Memuat Pengguna yang Diblokir';

  @override
  String get blockedUsersUnblock => 'Buka blokir';

  @override
  String get blockedUsersUnblockTitle => 'Buka blokir pengguna';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Apakah Anda yakin ingin membuka blokir $username?';
  }

  @override
  String get blockedUsersCopyTag => 'Salin nama pengguna';

  @override
  String get blockedUsersCopyId => 'Salin ID pengguna';

  @override
  String get userProfileLoadError => 'Profil tidak dapat dimuat';

  @override
  String get userProfileLoading => 'Memuat profil';

  @override
  String get userProfileRetry => 'Coba lagi';

  @override
  String get userProfileMessage => 'Pesan';

  @override
  String get userProfileVoiceCall => 'Panggilan suara';

  @override
  String get userProfileVideoCall => 'Panggilan video';

  @override
  String get userProfileEditProfile => 'Edit profil';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Staf $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Tim Komunitas $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Mitra $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Pemburu Bug $productName';
  }

  @override
  String userProfilePlutoniumBadgeTooltip(String productName) {
    return 'Plutonium $productName';
  }

  @override
  String userProfilePlutoniumSubscriberSinceTooltip(
    String productName,
    String date,
  ) {
    return '$productName Plutonium pelanggan sejak $date';
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
    return '$productName Visioner sejak $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Visioner #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Teman bersama ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Komunitas bersama ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Teman bersama';

  @override
  String get userProfileMutualCommunitiesTitle => 'Komunitas bersama';

  @override
  String get userProfileNoMutualFriends =>
      'Tidak ada teman bersama yang ditemukan.';

  @override
  String get userProfileNoMutualCommunities =>
      'Tidak ada komunitas bersama yang ditemukan.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Nama panggilan: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Buka DM';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Anda memblokir $username. Anda tidak akan dapat mengirim pesan kecuali Anda membuka blokirnya.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Buka blokir';

  @override
  String get userProfileOpenDm => 'Buka DM';

  @override
  String get userProfileNoteTitle => 'Catatan';

  @override
  String get userProfileNoteVisibility => '(hanya terlihat olehmu)';

  @override
  String get userProfileNoteSave => 'Simpan';

  @override
  String get userProfileNoteDelete => 'Hapus';

  @override
  String get userProfileNoteEmpty => 'Klik untuk menambahkan catatan';

  @override
  String get userProfileMemberSince => 'Anggota sejak';

  @override
  String get userProfileAboutMe => 'Tentang saya';

  @override
  String get userProfileRoles => 'Peran';

  @override
  String get memberRoleAdd => 'Tambah peran';

  @override
  String memberRoleRemove(String roleName) {
    return 'Hapus peran $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Pengguna ini tidak memiliki peran di komunitas ini.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Belum ada peran. Tambahkan peran di $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Tidak ada peran yang tersedia';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Saat ini tidak ada peran yang dapat ditetapkan di komunitas ini, tetapi Anda dapat membuat peran baru di $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Pengaturan komunitas';

  @override
  String get guildSettingsRolesTab => 'Peran';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Waktu setempat';

  @override
  String get profileLocalTimeSettingsTitle => 'Waktu lokal profil';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'Atur zona waktumu sekali agar $productName dapat menjaga selisih UTC kamu tetap akurat saat waktu musim panas berubah. Orang lain hanya dapat melihat selisih UTC kamu, bukan pengenal zona waktu kamu yang persis.';
  }

  @override
  String get profileLocalTimeEditButton => 'Edit waktu lokal profil';

  @override
  String get profileLocalTimeTimezoneLabel => 'Zona waktu';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'Pilih zona waktu yang digunakan $productName untuk menghitung selisih UTC-mu guna menampilkan waktu lokal di profilmu.';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'Cari zona waktu';

  @override
  String get profileLocalTimeNotSet => 'Belum diatur';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'Orang lain hanya bisa melihat selisih UTC-mu saat ini ketika kamu memilih untuk membagikan waktu lokal profil. Mereka tidak melihat pengidentifikasi zona waktu yang tepat, seperti $timezoneIdentifierExample. $productName menyimpan pengidentifikasi itu hanya agar selisihnya bisa diperbarui otomatis ketika waktu musim panas berubah.';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'Semua orang';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'Izinkan siapa pun yang dapat melihat profil lengkapmu untuk melihat waktu lokalmu';

  @override
  String get profileLocalTimePrivacyFriends => 'Teman';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'Izinkan temanmu melihat waktu lokalmu';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'Anggota komunitas';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'Izinkan anggota dari komunitas yang kamu ikuti melihat waktu lokalmu';

  @override
  String get userProfileSameTimeAsYou => 'Sama dengan zona waktumu';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return '$duration lebih cepat darimu';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return '$duration lebih lambat darimu';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours jam',
      one: '1 jam',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes menit',
      one: '1 menit',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours jam',
      one: '1 jam',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes menit',
      one: '1 menit',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Salin nama pengguna';

  @override
  String get userProfileCopyUserId => 'Salin ID pengguna';

  @override
  String get userProfileViewMainProfile => 'Lihat Profil Utama';

  @override
  String get userProfileViewCommunityProfile => 'Lihat profil komunitas';

  @override
  String get userProfileBlockUser => 'Blokir pengguna';

  @override
  String get userProfileUnblockUser => 'Buka blokir pengguna';

  @override
  String get userProfileRemoveFriend => 'Hapus teman';

  @override
  String get userProfileBlockConfirmTitle => 'Blokir pengguna';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Apakah Anda yakin ingin memblokir $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Buka blokir pengguna';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Yakin Anda ingin membuka blokir $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Hapus teman';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Apakah Anda yakin ingin menghapus $username sebagai teman?';
  }

  @override
  String get userProfileFailedOpenDm => 'Gagal membuka DM';

  @override
  String get userProfileFailedSaveNote => 'Gagal menyimpan catatan';

  @override
  String get userProfileActionFailed => 'Tindakan gagal, coba lagi';

  @override
  String get userProfileChangeNickname => 'Ubah nama panggilan';

  @override
  String get userProfileKick => 'Keluarkan';

  @override
  String get userProfileBan => 'Blokir';

  @override
  String get userProfileTimeout => 'Beri batas waktu';

  @override
  String get userProfileRemoveTimeout => 'Hapus batas waktu';

  @override
  String get userProfileTransferOwnership => 'Transfer kepemilikan';

  @override
  String get userProfileReportUser => 'Laporkan pengguna';

  @override
  String get userProfileReportMessage => 'Laporkan pesan';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Keluarkan $username?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Yakin Anda ingin mengeluarkan $username? Mereka dapat bergabung kembali dengan undangan baru.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Hapus batas waktu?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Menghapus batas waktu akan mengizinkan $username untuk mengirim pesan, bereaksi, dan bergabung kembali ke saluran suara.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Transfer kepemilikan?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Pindahkan kepemilikan komunitas ini ke $username? Tindakan ini tidak dapat diubah dan Anda akan kehilangan semua hak pemilik.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Blokir $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Durasi pemblokiran';

  @override
  String get userProfileBanCustomSecondsLabel => 'Durasi kustom (detik)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Nilai apa pun dari $min hingga $max detik';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Hapus riwayat pesan';

  @override
  String get userProfileBanDeleteNone => 'Jangan hapus apa pun';

  @override
  String get userProfileBanDelete24h => '24 jam terakhir';

  @override
  String get userProfileBanDelete7d => '7 hari terakhir';

  @override
  String get userProfileBanReasonLabel => 'Alasan (opsional)';

  @override
  String get userProfileBanReasonHint => 'Masukkan alasan pemblokiran';

  @override
  String get userProfileBanSubmit => 'Blokir anggota';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Beri batas waktu $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Durasi batas waktu';

  @override
  String get userProfileTimeoutSubmit => 'Keluarkan anggota';

  @override
  String get userProfileNicknameLabel => 'Nama panggilan';

  @override
  String get userProfileNicknameHint => 'Masukkan nama panggilan';

  @override
  String get userProfileNicknameSave => 'Simpan';

  @override
  String userProfileKickSuccess(String username) {
    return 'Dikeluarkan $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Diblokir $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Berhasil mengeluarkan $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Menghapus batas waktu untuk $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Nama panggilan diperbarui';

  @override
  String get userProfileTransferSuccess => 'Kepemilikan dialihkan';

  @override
  String get durationPermanent => 'Permanen';

  @override
  String get duration60Seconds => '60 detik';

  @override
  String get duration5Minutes => '5 menit';

  @override
  String get duration10Minutes => '10 menit';

  @override
  String get duration1Hour => '1 jam';

  @override
  String get duration12Hours => '12 jam';

  @override
  String get duration1Day => '1 hari';

  @override
  String get duration3Days => '3 hari';

  @override
  String get duration5Days => '5 hari';

  @override
  String get duration1Week => '1 minggu';

  @override
  String get duration2Weeks => '2 minggu';

  @override
  String get duration1Month => '1 bulan';

  @override
  String get durationCustom => 'Kustom…';

  @override
  String get iarReportUserTitle => 'Laporkan pengguna';

  @override
  String get iarReportGuildTitle => 'Laporkan komunitas';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Jika laporan ini tentang pesan tertentu di komunitas ini, laporkan pesan itu saja. Laporan pesan memberikan konteks yang paling jelas kepada tim keamanan kami, dan menambahkan detail di komentar dapat membantu kami meninjaunya lebih cepat. Lanjutkan melaporkan komunitas secara keseluruhan hanya jika melaporkan pesan tidak akan mencakup masalah yang lebih luas.';

  @override
  String get iarContinueToReportCommunity => 'Lanjutkan melaporkan komunitas';

  @override
  String get iarPreviewCommunitySubtitle => 'Komunitas';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Pelecehan atau penyalahgunaan yang ditargetkan';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Komunitas ini memfasilitasi perundungan beramai-ramai atau pelecehan yang ditargetkan.';

  @override
  String get iarReasonHateGuildDescription =>
      'Mendorong kebencian terhadap kelompok yang dilindungi.';

  @override
  String get iarReasonTerrorismLabel => 'Terorisme atau ekstremisme kekerasan';

  @override
  String get iarReasonTerrorismDescription =>
      'Mempromosikan, merekrut, atau mengoordinasikan aktivitas ekstremisme kekerasan.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Konten dewasa atau pembatasan yang tidak aman';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Konten dewasa tanpa pembatasan yang sesuai.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Membahayakan anak di bawah umur atau berisi konten eksploitasi anak.';

  @override
  String get iarReasonRaidLabel => 'Koordinasi penyerangan';

  @override
  String get iarReasonRaidDescription =>
      'Mengoordinasikan penyerangan, pengeroyokan, atau pelecehan terhadap orang atau komunitas.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Komunitas ini ada untuk mengirim spam, menipu, atau menyalahgunakan platform.';

  @override
  String get iarReasonMalwareGuildLabel => 'Penyebaran malware';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Mendistribusikan malware, pencurian kredensial, atau file berbahaya.';

  @override
  String get iarReasonPrivacyGuildLabel => 'Pelanggaran privasi atau doxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Membagikan info pribadi, menguntit pengguna, atau mengoordinasikan penyalahgunaan privasi.';

  @override
  String get iarReasonSelfHarmGuildLabel =>
      'Mendorong tindakan menyakiti diri sendiri';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Mendorong bunuh diri, menyakiti diri sendiri, atau gangguan makan.';

  @override
  String get iarReasonInappropriateProfile => 'Profil tidak pantas';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Profil pengguna ini berisi konten yang tidak pantas';

  @override
  String typingIndicatorOne(String name) {
    return '$name sedang mengetik...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 dan $name2 sedang mengetik...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2, dan $name3 sedang mengetik...';
  }

  @override
  String get typingIndicatorMultiple => 'Beberapa orang sedang mengetik...';

  @override
  String get typingIndicatorHandful => 'Beberapa orang sedang mengetik...';

  @override
  String get typingIndicatorSymphony => 'Seseorang sedang mengetik...';

  @override
  String get typingIndicatorFiesta =>
      'Ramai sekali yang sedang mengetik di sini';

  @override
  String get typingIndicatorApocalypse => 'Wah, banyak banget yang ngetik';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Senang kamu ada di sini, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Selamat datang, $username! Anggap saja rumah sendiri.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Halo, $username! Senang kamu ada di sini.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Halo, $username! Gabung kapan pun kamu siap.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Hai $username, senang melihatmu di sini!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Hai, $username! Semoga betah ya di sini.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Hai, $username, selamat datang!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Senang kamu berhasil bergabung, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Selamat bergabung, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Selamat datang, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Selamat datang, $username! Kami senang kamu ada di sini.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Selamat datang, $username! Semoga betah di sini.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Selamat datang, $username! Obrolan berikutnya dimulai di sini.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Selamat datang, $username. Senang kamu bergabung di sini.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Senang bertemu denganmu, $username! Selamat datang.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Kamu di sini, $username! Senang kamu bergabung.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Kamu sudah tiba, $username! Ayo mulai.';
  }

  @override
  String get relativeTimeShortNow => 'baru';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}m',
      one: '1m',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jam',
      one: '1 jam',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '${count}j',
      one: '1h',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bln',
      one: '1 bln',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thn',
      one: '1 thn',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Perangkat saya';

  @override
  String get linkedDevicesDescription =>
      'Lihat semua perangkat yang saat ini masuk ke akun Anda. Cabut sesi apa pun yang tidak Anda kenali.';

  @override
  String get linkedDevicesCurrentDevice => 'Perangkat saat ini';

  @override
  String get linkedDevicesOtherDevices => 'Perangkat lain';

  @override
  String get linkedDevicesEnterSelection => 'Masuk Mode Pilihan';

  @override
  String get linkedDevicesExitSelection => 'Keluar dari Mode Pilihan';

  @override
  String get linkedDevicesSelectAll => 'Pilih semua';

  @override
  String get linkedDevicesClearSelection => 'Hapus pilihan';

  @override
  String get linkedDevicesRevokeTooltip => 'Cabut akses perangkat';

  @override
  String get linkedDevicesSignOutAll => 'Keluar dari semua perangkat lain';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Keluar dari $count perangkat',
      one: 'Keluar dari 1 perangkat',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Keluar dari $count perangkat',
      one: 'Keluar dari 1 perangkat',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Keluar dari semua perangkat lain';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Ini akan mengeluarkan perangkat yang dipilih dari akun Anda. Anda perlu masuk lagi di perangkat tersebut.',
      one:
          'Ini akan mengeluarkan perangkat yang dipilih dari akun Anda. Anda perlu masuk lagi di perangkat tersebut.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Ini akan mengeluarkan perangkat yang dipilih dari akun Anda. Anda perlu masuk lagi di perangkat tersebut.';

  @override
  String get linkedDevicesSignOutConfirm => 'Lanjutkan';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Anda harus masuk kembali di semua perangkat yang keluar';

  @override
  String get linkedDevicesLoadErrorTitle => 'Kesalahan jaringan';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Kami mengalami masalah saat terhubung ke ruang-waktu. Periksa koneksi Anda dan coba lagi.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Perangkat dicabut',
      one: 'Perangkat dicabut',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'Tidak dapat keluar. Coba lagi.';

  @override
  String get linkedDevicesUnknownOs => 'OS Tidak Diketahui';

  @override
  String get linkedDevicesUnknownPlatform => 'Platform Tidak Diketahui';

  @override
  String get linkedDevicesViewDetails => 'Lihat detail';

  @override
  String get linkedDevicesDetailsTitle => 'Detail perangkat';

  @override
  String get linkedDevicesDetailsDevice => 'Perangkat';

  @override
  String get linkedDevicesDetailsClient => 'Klien';

  @override
  String get linkedDevicesDetailsLocation => 'Lokasi';

  @override
  String get linkedDevicesDetailsIp => 'Alamat IP';

  @override
  String get linkedDevicesDetailsLastUsed => 'Terakhir digunakan';

  @override
  String get linkedDevicesCurrentSession => 'Sesi saat ini';

  @override
  String get linkedDevicesUnknown => 'Tidak diketahui';

  @override
  String slowmodeLabel(String duration) {
    return '$duration mode lambat';
  }

  @override
  String get slowmodeTooltipActive =>
      'Anda sedang dalam mode lambat. Harap tunggu sebelum mengirim pesan lain.';

  @override
  String get slowmodeTooltipImmune =>
      'Mode lambat diaktifkan, tetapi Anda kebal.';

  @override
  String get slowmodeStatusEnabled => 'Mode lambat diaktifkan';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Mode lambat aktif ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Mode lambat diatur ke $durationLabel, tetapi kamu dikecualikan.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Mode lambat diatur ke $durationLabel. Tunggu sebelum mengirim pesan lagi.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Mode lambat diatur ke $durationLabel untuk saluran ini.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Kamu tidak dapat mengirim pesan di saluran ini.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Pengumuman sistem dari staf $productName. Kamu tidak bisa membalas di sini.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Pengiriman pesan di komunitas ini dijeda sementara.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Kamu sedang diberi batas waktu. Pesan, reaksi, dan suara dijeda sampai batas waktunya berakhir.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Kamu perlu mengklaim akunmu untuk mengirim pesan di komunitas ini.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Kamu perlu memverifikasi email untuk mengirim pesan di komunitas ini.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Akunmu terlalu baru untuk mengirim pesan di komunitas ini.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Kamu belum cukup lama menjadi anggota komunitas ini untuk bisa mengirim pesan.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Kamu perlu memverifikasi nomor telepon untuk mengirim pesan di komunitas ini.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Verifikasi email';

  @override
  String get channelComposerBarrierVerifyPhone => 'Verifikasi telepon';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Terlalu banyak lampiran (maks $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName melebihi batas ukuran ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'File-file tersebut terlalu besar untuk dikirim bersamaan';

  @override
  String get chatAttachmentDropToUpload => 'Jatuhkan file untuk mengunggah';

  @override
  String get chatAttachmentDropToSend => 'Jatuhkan file untuk dikirim sekarang';

  @override
  String get chatAttachmentSendVoiceMessage => 'Kirim pesan suara';

  @override
  String get voiceMessageTitle => 'Pesan suara';

  @override
  String get voiceMessageHoldHint =>
      'Tahan untuk merekam. Seret ke tempat sampah untuk menghapus, geser ke atas untuk mengunci, atau lepas untuk mengirim.';

  @override
  String get voiceMessageDiscard => 'Buang pesan suara';

  @override
  String get voiceMessageSend => 'Kirim pesan suara';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Tidak dapat memulai perekaman. Izinkan akses mikrofon.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Perekaman suara tidak didukung di perangkat ini.';

  @override
  String get voiceMessageMicInUse =>
      'Tinggalkan panggilan suara untuk merekam pesan suara.';

  @override
  String get voiceMessageRecordingFailed => 'Perekaman gagal. Coba lagi.';

  @override
  String get voiceMessageSendFailed =>
      'Tidak dapat mengirim pesan suara. Coba lagi.';

  @override
  String get voiceMessageRecordingHint =>
      'Bicaralah sekarang. Tekan Berhenti setelah selesai — kamu bisa memangkasnya nanti.';

  @override
  String get voiceMessageReviewHint =>
      'Seret gagang untuk memangkas, lalu tekan Kirim.';

  @override
  String get voiceMessageStop => 'Berhenti';

  @override
  String get voiceMessageStartRecording => 'Mulai merekam';

  @override
  String get voiceMessageRerecord => 'Rekam ulang';

  @override
  String get voiceMessagePlay => 'Putar';

  @override
  String get voiceMessagePause => 'Jeda';

  @override
  String get voiceMessageSeekForward => 'Maju';

  @override
  String get voiceMessageSeekBackward => 'Putar mundur';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Durasi pilihan minimal $secondsString detik.';
  }

  @override
  String get chatAttachmentEditTitle => 'Edit lampiran';

  @override
  String get chatAttachmentFilenameLabel => 'Nama file';

  @override
  String get chatAttachmentDescriptionLabel => 'Deskripsi';

  @override
  String get chatAttachmentDescriptionHint => 'Teks alternatif opsional';

  @override
  String get chatAttachmentSpoilerLabel => 'Tandai sebagai spoiler';

  @override
  String get chatAttachmentRemove => 'Hapus lampiran';

  @override
  String get chatAttachmentDownload => 'Unduh';

  @override
  String get chatAttachmentDownloadedToast => 'Tersimpan ke foto';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Tidak dapat mengunduh lampiran';

  @override
  String get chatAttachmentExpiredTooltip => 'Lampiran kedaluwarsa';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Buka ($count baris)',
      one: 'Buka ($count baris)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Tutup ($count baris)',
      one: 'Tutup ($count baris)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Buka ($count baris)',
      one: 'Buka ($count baris)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Ciutkan ($count baris)',
      one: 'Ciutkan ($count baris)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count baris tersisa)',
      one: '... ($count baris tersisa)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... ($count baris tersisa)',
      one: '... ($count baris tersisa)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Lihat seluruh file';

  @override
  String get chatTextualPreviewChangeLanguage => 'Ganti bahasa';

  @override
  String get chatTextualPreviewSearchLanguage => 'Cari bahasa…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Penyorotan sintaks';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Tidak ada hasil';

  @override
  String get chatTextualPreviewMoreOptions => 'Opsi lainnya';

  @override
  String get chatTextualPreviewWrapText => 'Bungkus teks';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Ukuran file terlalu besar untuk pratinjau sebaris (batas $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Tidak dapat memuat pratinjau.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Teks biasa';

  @override
  String get chatTextualPreviewCopy => 'Salin';

  @override
  String get chatAttachmentSourceGallery => 'Galeri';

  @override
  String get chatAttachmentSourceCamera => 'Kamera';

  @override
  String get chatAttachmentSourceBrowse => 'Jelajahi file';

  @override
  String get chatAttachmentPasteTooltip => 'Tempel file dari papan klip';

  @override
  String get chatAttachmentSpoiler => 'Spoiler';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Tampilkan spoiler';

  @override
  String get matureMediaRevealButton => 'Tampilkan';

  @override
  String get matureMediaRevealHint => 'Klik untuk menampilkan';

  @override
  String get matureContentTitle => 'Konten dewasa';

  @override
  String get matureCommunityTitle => 'Komunitas dewasa';

  @override
  String get matureCategoryTitle => 'Kategori dewasa';

  @override
  String get matureChannelTitle => 'Saluran dewasa';

  @override
  String get communityContentWarningTitle => 'Peringatan konten komunitas';

  @override
  String get categoryContentWarningTitle => 'Peringatan konten kategori';

  @override
  String get channelContentWarningTitle => 'Peringatan konten saluran';

  @override
  String get defaultContentWarningBody => 'Ini berisi konten sensitif.';

  @override
  String get matureCommunityBody =>
      'Komunitas ini ditandai untuk konten dewasa dan mungkin berisi materi yang tidak pantas untuk sebagian pengguna.';

  @override
  String get matureCategoryBody =>
      'Kategori ini ditandai untuk konten dewasa dan mungkin berisi materi yang tidak pantas untuk sebagian pengguna.';

  @override
  String get matureChannelBody =>
      'Saluran ini ditandai untuk konten dewasa dan mungkin berisi materi yang tidak pantas untuk sebagian pengguna.';

  @override
  String get matureVoiceChannelBody =>
      'Saluran suara ini ditandai untuk konten dewasa dan mungkin berisi materi yang tidak pantas untuk sebagian pengguna.';

  @override
  String get matureLinkChannelBody =>
      'Saluran tautan ini ditandai untuk konten dewasa dan mungkin membuka materi yang tidak pantas untuk sebagian pengguna.';

  @override
  String get matureCommunityUnavailableBody =>
      'Komunitas dewasa ini tidak tersedia untuk akunmu.';

  @override
  String get matureCategoryUnavailableBody =>
      'Kategori dewasa ini tidak tersedia untuk akunmu.';

  @override
  String get matureChannelUnavailableBody =>
      'Saluran dewasa ini tidak tersedia untuk akunmu.';

  @override
  String get matureContentProceedButton => 'Lanjutkan';

  @override
  String get matureContentUnderstandButton => 'Saya mengerti';

  @override
  String get matureContentOpenLinkButton => 'Buka tautan';

  @override
  String get sensitiveContentSectionTitle => 'Konten sensitif';

  @override
  String get sensitiveContentSectionDescription =>
      'Atur pemfilteran media yang terlalu dewasa atau sensitif di berbagai konteks';

  @override
  String get sensitiveContentFriendDmLabel => 'Pesan langsung dari teman';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Pesan langsung dari orang lain';

  @override
  String get sensitiveContentGuildLabel => 'Pesan di saluran komunitas';

  @override
  String get sensitiveContentFilterShow => 'Tampilkan';

  @override
  String get sensitiveContentFilterBlur => 'Buramkan';

  @override
  String get sensitiveContentFilterBlock => 'Blokir';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Blur media hingga pemindaian keamanan selesai';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Jika diaktifkan, gambar dan video akan diburamkan hingga pemindaian keamanan konten selesai.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Pengaturan ini selalu aktif untuk akun Anda.';

  @override
  String get sensitiveContentResetButton => 'Setel ulang';

  @override
  String get sensitiveContentSaveButton => 'Simpan';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count file',
      one: '1 file',
    );
    return 'Mengunggah $_temp0';
  }

  @override
  String get chatCancelUpload => 'Batalkan unggahan';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Kedaluwarsa pada $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Kedaluwarsa antara $start dan $end';
  }

  @override
  String get connectionsTitle => 'Koneksi';

  @override
  String connectionsDescription(String productName) {
    return 'Tautkan akun dan domain eksternal ke profil $productName Anda. Koneksi yang terverifikasi akan ditampilkan di profil Anda agar orang lain dapat melihatnya.';
  }

  @override
  String get connectionsEmptyTitle => 'Belum ada koneksi';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Tautkan akun Bluesky Anda atau verifikasi kepemilikan domain untuk menampilkannya di profil Anda.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Verifikasi kepemilikan domain untuk menampilkannya di profil Anda.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Domain';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Tambahkan koneksi Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Tambahkan koneksi domain';

  @override
  String get connectionEdit => 'Edit';

  @override
  String get connectionRemove => 'Hapus';

  @override
  String get connectionVerifiedLabel => 'Koneksi ini sudah diverifikasi.';

  @override
  String get connectionUnverifiedLabel => 'Koneksi ini belum diverifikasi.';

  @override
  String get connectionAddTitle => 'Tambah koneksi';

  @override
  String get connectionTypeLabel => 'Jenis koneksi';

  @override
  String get connectionHandleLabel => 'Nama pengguna';

  @override
  String get connectionDomainLabel => 'Domain';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Kamu sudah punya koneksi ini.';

  @override
  String get connectionConnectBluesky => 'Hubungkan dengan Bluesky';

  @override
  String get connectionContinue => 'Lanjutkan';

  @override
  String get connectionVerifyTitle => 'Verifikasi koneksi';

  @override
  String get connectionVerifyInstructions =>
      'Gunakan catatan di bawah ini untuk membuktikan kepemilikan domain.';

  @override
  String get connectionDnsRecordTitle => 'Catatan DNS TXT';

  @override
  String get connectionDnsHostLabel => 'Host';

  @override
  String get connectionDnsValueLabel => 'Nilai';

  @override
  String get connectionCopyHost => 'Salin host';

  @override
  String get connectionCopyValue => 'Salin nilai';

  @override
  String get connectionCopied => 'Tersalin!';

  @override
  String get connectionTokenFileTitle => 'Sajikan file token';

  @override
  String get connectionTokenFileDescription =>
      'Unduh **fluxer-verification** dan letakkan di folder **.well-known** Anda agar kami dapat memvalidasi domain.';

  @override
  String get connectionTokenFileDownload => 'Unduh fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'File ini berisi token verifikasi yang akan kami ambil dari **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Simpan verifikasi fluxer';

  @override
  String get connectionVerifyButton => 'Verifikasi';

  @override
  String get connectionBack => 'Kembali';

  @override
  String get connectionEditTitle => 'Edit koneksi';

  @override
  String get connectionEditDescription =>
      'Pilih siapa yang bisa melihat koneksi ini di profilmu.';

  @override
  String get connectionVisibilityEveryone => 'Semua orang';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Izinkan siapa pun melihat koneksi ini di profilmu';

  @override
  String get connectionVisibilityFriends => 'Teman';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Izinkan temanmu melihat koneksi ini';

  @override
  String get connectionVisibilityCommunityMembers => 'Anggota komunitas';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Izinkan anggota dari komunitas yang kamu ikuti melihat koneksi ini';

  @override
  String get connectionRemoveTitle => 'Hapus koneksi';

  @override
  String get connectionRemoveDescription =>
      'Yakin Anda ingin menghapus koneksi ini? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get connectionRemoveConfirm => 'Hapus';

  @override
  String get connectionsLoadError => 'Gagal memuat koneksi';

  @override
  String get connectionsReorderError => 'Gagal memperbarui urutan';

  @override
  String get connectionInitiateFailed =>
      'Tidak dapat memulai verifikasi. Coba lagi.';

  @override
  String get connectionVerifyFailed =>
      'Tidak dapat memverifikasi. Periksa catatan DNS Anda dan coba lagi.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Otorisasi Bluesky tidak dapat dimulai.';

  @override
  String get connectionUpdateFailed => 'Tidak dapat memperbarui koneksi';

  @override
  String get connectionRemoveFailed => 'Tidak dapat menghapus koneksi';

  @override
  String get connectionTokenSavedToast => 'Fluxer-verifikasi tersimpan';

  @override
  String get connectionTokenSaveFailedToast => 'Gagal menyimpan file';

  @override
  String get connectionEnterHandle => 'Masukkan handle Bluesky.';

  @override
  String get connectionEnterDomain => 'Masukkan domain.';

  @override
  String get lookAndFeelTitle => 'Tampilan & Nuansa';

  @override
  String get lookAndFeelThemeSectionTitle => 'Tema';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Pilih antara tampilan gelap, batu bara, atau terang.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Rentang dinamis tinggi';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Kontrol cara gambar HDR ditampilkan di monitor yang mendukung HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Rentang dinamis penuh';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Tampilkan gambar HDR dengan kecerahan dan rentang warna penuh.';

  @override
  String get lookAndFeelHdrStandardName => 'Rentang standar';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Petakan nada gambar HDR ke rentang standar untuk mengurangi kecerahan puncak.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Mode tampilan rentang dinamis tinggi';

  @override
  String get lookAndFeelThemeDark => 'Tema gelap';

  @override
  String get lookAndFeelThemeDarkLegacy => 'Tema gelap (lama)';

  @override
  String get lookAndFeelThemeCoal => 'Tema batu bara';

  @override
  String get lookAndFeelThemeLight => 'Tema terang';

  @override
  String get lookAndFeelThemeSystem => 'Tema sistem';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Sinkronkan tema di semua perangkat';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Saat diaktifkan, perubahan tema akan disinkronkan ke semua perangkat Anda. Saat dinonaktifkan, perangkat ini akan menggunakan pengaturan tema sendiri.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Tema sistem secara otomatis menonaktifkan sinkronisasi untuk melacak preferensi sistem Anda di perangkat ini.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Tema tidak dapat disinkronkan ke akun Anda. Coba lagi.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Skala font obrolan';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Sesuaikan ukuran font di area obrolan.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Ukuran font obrolan';

  @override
  String get lookAndFeelAppZoomTitle => 'Tingkat zoom aplikasi';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Sesuaikan tingkat zoom aplikasi.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Wallpaper Obrolan';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Pilih latar belakang untuk chat. Ini akan tersimpan di perangkat ini.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'Pengaturan ini tetap di perangkat ini';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Wallpaper chat disimpan hanya di perangkat ini dan tidak disinkronkan ke perangkat lain.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Default';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Gambar kustom';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'Bidang bintang';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Warna $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradien $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Redupkan wallpaper';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Tidak dapat mengatur gambar itu sebagai wallpaper Anda.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Pesan';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Pilih cara pesan ditampilkan di saluran obrolan.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel => 'Jarak antargrup pesan';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Mode tampilan pesan';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Nyaman';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Tata letak lapang dengan pemisahan visual yang jelas antarpesan.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Rapat';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Memaksimalkan pesan yang terlihat dengan spasi minimal.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Sembunyikan avatar pengguna';

  @override
  String get lookAndFeelInterfaceTitle => 'Antarmuka';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Sesuaikan elemen dan perilaku antarmuka.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Indikator mengetik di daftar saluran';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Pilih cara indikator pengetikan muncul di daftar saluran saat seseorang sedang mengetik di saluran.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Indikator mengetik + avatar';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Tampilkan indikator mengetik dengan avatar pengguna di daftar saluran';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Hanya indikator mengetik';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Tampilkan hanya indikator mengetik tanpa avatar';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Tersembunyi';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Jangan tampilkan indikator mengetik di daftar saluran';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Tampilkan pengetikan di saluran yang dipilih';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Saat dinonaktifkan (default), indikator pengetikan tidak akan muncul di saluran yang sedang Anda lihat.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'umum';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Petunjuk keyboard';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Atur apakah petunjuk pintasan keyboard muncul di dalam tooltip.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Sembunyikan petunjuk keyboard di tooltip';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Saat diaktifkan, lencana pintasan disembunyikan di popup tooltip.';

  @override
  String get lookAndFeelNekoTitle => 'Lain-lain';

  @override
  String get lookAndFeelNekoDescription => 'Opsi antarmuka lainnya.';

  @override
  String get lookAndFeelShowNekoLabel => 'Tampilkan Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Saat diaktifkan, Neko akan muncul di dekat bilah input chat.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Perilaku bergabung ke saluran suara';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Atur cara Anda bergabung dengan saluran suara di komunitas.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Wajibkan klik ganda untuk bergabung ke saluran suara';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Saat diaktifkan, Anda perlu mengklik dua kali saluran suara untuk bergabung. Saat dinonaktifkan (default), mengklik sekali akan langsung bergabung ke saluran.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Rubah cokelat cepat melompati anjing malas.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Sidebar guild';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Atur cara bilah sisi guild menampilkan pesan langsung.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count komunitas tidak tersedia sementara karena malfungsi kapasitor fluks.',
      one:
          '1 komunitas tidak tersedia sementara karena malfungsi kapasitor fluks.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Komunitas sementara tidak tersedia';

  @override
  String get guildUnavailableDescription =>
      'Terjadi kesalahan. Kami sedang mengatasinya.';

  @override
  String get guildNotFoundTitle => 'Ini bukan komunitas yang kamu cari.';

  @override
  String get guildNotFoundDescription =>
      'Komunitas yang kamu cari mungkin sudah dihapus atau kamu tidak punya akses ke sana.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return '$communityName saat ini hanya dapat diakses oleh staf $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'sementara tidak tersedia';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Ringkas DM ke Folder';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Jika diaktifkan, DM yang belum dibaca di bilah sisi guild akan diciutkan ke dalam folder pada tombol $productName. Klik tombol $productName saat berada di halaman DM untuk memperluas atau menciutkan folder.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Daftar saluran';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Kontrol perilaku indikator belum dibaca untuk saluran yang dibisukan di daftar saluran.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Tampilkan indikator belum dibaca di saluran yang dibisukan';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Saat diaktifkan, saluran yang dibisukan akan menampilkan indikator belum dibaca yang memudar di sisi kiri. Sebutan tetap muncul terlepas dari pengaturan ini.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Aktif sekarang';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Atur cara \"Sedang Aktif\" ditampilkan di seluruh aplikasi.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Tampilkan status aktif sekarang di layar utama';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Tampilkan status aktif sekarang di layar utama untuk memunculkan teman yang sedang aktif di saluran suara. Kamu akan melihat pratinjau, konteks saluran, siapa saja yang sudah ada di sana, dan cara cepat untuk bergabung.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Favorit';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Atur visibilitas favorit di seluruh aplikasi.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Aktifkan favorit';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Saat diaktifkan, Anda dapat menandai saluran favorit dan saluran tersebut akan muncul di bagian Favorit. Saat dinonaktifkan, semua elemen UI terkait favorit (tombol, item menu) akan disembunyikan. Favorit Anda yang sudah ada akan tetap disimpan.';

  @override
  String get favoritesTitle => 'Favorit';

  @override
  String get favoritesEmptyTitle => 'Belum ada favorit';

  @override
  String get favoritesEmptyDescription =>
      'Tandai saluran dari header chat agar tetap ada di sini.';

  @override
  String get favoritesWelcomeTitle => 'Selamat datang di favorit';

  @override
  String get favoritesWelcomeDescription =>
      'Ruang pribadimu untuk akses cepat ke saluran, DM, dan grup favoritmu. Tekan bintang di saluran mana pun untuk menambahkannya ke sini.';

  @override
  String get favoritesWelcomeTip => 'Bukan untukmu? Nonaktifkan kapan saja.';

  @override
  String get favoritesDisableButton => 'Nonaktifkan favorit';

  @override
  String get favoritesAddedToast => 'Ditambahkan ke favorit';

  @override
  String get favoritesRemovedToast => 'Dihapus dari favorit';

  @override
  String get favoritesHiddenToast => 'Favorit disembunyikan';

  @override
  String get favoritesMute => 'Bisukan favorit';

  @override
  String get favoritesUnmute => 'Bunyikan favorit';

  @override
  String get favoritesHeaderMenu => 'Menu favorit';

  @override
  String get favoritesCreateCategory => 'Buat kategori';

  @override
  String get favoritesCategoryNameLabel => 'Nama kategori';

  @override
  String get favoritesHideMutedChannels => 'Sembunyikan saluran yang dibisukan';

  @override
  String get favoritesShowMutedChannels => 'Tampilkan saluran yang dibisukan';

  @override
  String get favoritesSetNickname => 'Atur nama panggilan';

  @override
  String get favoritesNicknameLabel => 'Nama panggilan';

  @override
  String get favoritesSaveNickname => 'Simpan nama panggilan';

  @override
  String get favoritesMoveToCategory => 'Pindahkan ke kategori';

  @override
  String get favoritesUncategorized => 'Tanpa kategori';

  @override
  String get favoritesOtherCategory => 'Lainnya';

  @override
  String get favoritesRemoveFromFavorites => 'Hapus dari favorit';

  @override
  String get favoritesAddToFavorites => 'Tambahkan ke favorit';

  @override
  String get favoritesAddToSavedMedia => 'Tambahkan ke media tersimpan';

  @override
  String get favoritesRemoveFromSavedMedia => 'Hapus dari media tersimpan';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Tambahkan ke GIF favorit khusus URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Hapus dari GIF favorit khusus URL';

  @override
  String get savedMediaAddTitle => 'Tambahkan ke media tersimpan';

  @override
  String get savedMediaFormNameLabel => 'Nama';

  @override
  String get savedMediaFormNameHint => 'Media saya yang keren';

  @override
  String get savedMediaFormAltTextLabel => 'Teks alternatif';

  @override
  String get savedMediaFormAltTextHint => 'Jelaskan media';

  @override
  String get savedMediaFormTagsLabel => 'Tag';

  @override
  String get savedMediaFormTagsHint => 'lucu, reaksi, kerja';

  @override
  String get savedMediaSaveError => 'Gagal memperbarui media yang disimpan.';

  @override
  String get savedMediaNameRequired => 'Nama wajib diisi.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Bagaimana kami harus menyimpan GIF favorit Anda?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Anda dapat menyimpan GIF favorit sebagai favorit hanya URL atau mengunggahnya ke media tersimpan Anda. Pilih yang sesuai dengan cara Anda menggunakannya. Anda dapat mengubahnya kapan saja di Pengaturan > Lanjutan > Media.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Favorit hanya URL (default): tersinkronisasi di seluruh perangkat Anda, tanpa unggah, tidak terhitung dalam media tersimpan. Media asli dapat hilang jika host-nya menghapusnya.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Media yang disimpan: dapat diunggah, ditandai, dicari, dan persisten, tetapi mengurangi batas media tersimpan Anda.';

  @override
  String get gifFavoriteFirstTimeHint => 'Kami hanya akan bertanya sekali.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Gunakan hanya URL (disarankan)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Gunakan media yang disimpan';

  @override
  String get favoritesHideConfirmTitle => 'Sembunyikan favorit';

  @override
  String get favoritesHideConfirmDescription =>
      'Ini akan menyembunyikan semua elemen UI terkait favorit, termasuk tombol dan item menu. Favorit Anda yang sudah ada akan tetap tersimpan dan dapat diaktifkan kembali kapan saja dari Pengaturan > Lanjutan > Tampilan.';

  @override
  String get favoritesDirectMessageSubtitle => 'Pesan langsung';

  @override
  String get messagesMediaDisplayGroupTitle => 'Tampilan';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Atur cara pesan, media, dan konten lainnya ditampilkan.';

  @override
  String get messagesMediaMediaGroupTitle => 'Media';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Sesuaikan preferensi ukuran media dan tombol.';

  @override
  String get messagesMediaInputGroupTitle => 'Input';

  @override
  String get messagesMediaInputGroupDescription =>
      'Sesuaikan pengaturan input pesan.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Bilah sisi';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Atur tampilan bilah sisi komunitas.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Sembunyikan saluran yang dibisukan secara default';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Sembunyikan saluran yang dibisukan secara otomatis di bilah sisi saat Anda bergabung dengan komunitas baru';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Sembunyikan saluran yang dibisukan secara default?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Komunitas baru yang kamu ikuti akan otomatis menyembunyikan saluran yang dibisukan. Terapkan juga ke semua komunitas yang sudah kamu ikuti?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Berhenti menyembunyikan saluran yang dibisukan secara default?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Komunitas baru yang kamu ikuti tidak akan lagi otomatis menyembunyikan saluran yang dibisukan. Tampilkan juga saluran yang dibisukan di semua komunitas yang sudah kamu ikuti?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Terapkan ke semua komunitas';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Tampilkan di semua komunitas';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Hanya komunitas baru';

  @override
  String get messagesMediaDisplaySectionTitle => 'Tampilan media';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Atur cara gambar, video, dan media lainnya ditampilkan. Semua media akan diubah ukurannya dan dikonversi. File yang sangat besar yang tidak dapat dikompres menjadi pratinjau tidak akan disematkan terlepas dari pengaturan ini.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Saat diposting sebagai tautan ke chat';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Saat diunggah langsung ke $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Pratinjau tautan';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Atur pratinjau tautan situs web di chat';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Tampilkan sematan dan pratinjau tautan situs web';

  @override
  String get messagesMediaReactionsSectionTitle => 'Reaksi';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Atur reaksi emoji pada pesan';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Tampilkan reaksi emoji di pesan';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Konten spoiler';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Atur cara konten spoiler ditampilkan';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Tampilkan konten spoiler';

  @override
  String get messagesMediaSpoilersOnClickName => 'Saat diklik';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Tampilkan konten spoiler saat diklik';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Di saluran yang saya moderasi';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Selalu tampilkan konten spoiler di channel tempat Anda memiliki izin \"Kelola Pesan\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Selalu';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Selalu tampilkan konten spoiler';

  @override
  String get messagesMediaSizeSectionTitle => 'Preferensi Ukuran Media';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Sesuaikan ukuran tampilan maksimum untuk media yang disematkan dan dilampirkan. Ukuran yang lebih kecil menggunakan lebih sedikit ruang layar, sementara ukuran yang lebih besar menampilkan lebih banyak detail.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Media dari tautan (sematan)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Lampiran yang diunggah';

  @override
  String get messagesMediaSizeCompactName => 'Ringkas (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'Ukuran media lebih kecil';

  @override
  String get messagesMediaSizeComfortableName => 'Nyaman (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Ukuran media lebih besar dengan lebih banyak detail';

  @override
  String get messagesMediaGifsSectionTitle => 'Perilaku GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Atur cara GIF dimasukkan ke dalam chat';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Kirim GIF secara otomatis saat dipilih';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Unggahan kamera';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Pilih apakah foto dan video yang diambil dengan kamera dalam aplikasi disimpan di perangkat Anda';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'Simpan ke perangkat';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Otomatisasi ekspresi (otomatisasi titik dua)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Atur apa yang muncul di pelengkapan otomatis ekspresi saat Anda mengetik titik dua. Sesuaikan saran yang muncul agar sesuai dengan preferensi Anda.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Tampilkan emoji default di pelengkapan otomatis ekspresi';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Tampilkan emoji kustom di pelengkapan otomatis ekspresi';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Tampilkan stiker di pelengkapan otomatis ekspresi';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Tampilkan media tersimpan di pelengkapan otomatis ekspresi';

  @override
  String get messagesMediaEditingSectionTitle => 'Edit pesan';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Atur apa yang terjadi pada draf editan Anda saat Anda membatalkan.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Simpan draf suntingan saat batal';

  @override
  String get accessibilitySaturationTitle => 'Saturasi';

  @override
  String get accessibilitySaturationDescription =>
      'Sesuaikan seberapa cerah warna tema muncul di seluruh aplikasi.';

  @override
  String get accessibilityVisualGroupTitle => 'Visual';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Selalu garis bawahi tautan';

  @override
  String get accessibilityShowAltTextOnImagesLabel =>
      'Tampilkan teks alternatif pada gambar';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'Tampilkan teks alternatif di bawah gambar jika tersedia.';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'Redupkan teks coret';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'Pratinjau pesan DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Atur kapan pratinjau pesan ditampilkan di daftar DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Mode pratinjau pesan DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Semua pesan';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Tampilkan pratinjau pesan untuk semua percakapan DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Hanya DM belum dibaca';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Hanya tampilkan pratinjau pesan untuk DM dengan pesan yang belum dibaca';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Tidak ada';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Jangan tampilkan pratinjau pesan di daftar DM';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Pembaca layar';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Atur cara $productName bekerja dengan pembaca layar.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Umumkan pesan baru';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Biarkan pembaca layar mengumumkan pesan baru yang masuk di saluran yang sedang dibuka. Suara notifikasi tidak terpengaruh.';

  @override
  String get accessibilityTtsGroupTitle => 'Teks ke suara';

  @override
  String get accessibilityTtsGroupDescription =>
      'Pilih kecepatan untuk teks yang dibacakan.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Kecepatan putar ucapan';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Putar contoh';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Senyapkan contoh';

  @override
  String get accessibilityPreviewButtonLabel => 'Tombol pratinjau';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Begini tampilan tautan: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Pratinjau Pengguna';

  @override
  String get accessibilityKeyboardGroupTitle => 'Keyboard';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Tampilkan cincin fokus di area teks chat';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Tombol Escape keluar dari mode keyboard';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Tampilkan pintasan menu konteks';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Konfirmasi sebelum memulai panggilan';

  @override
  String get accessibilityAnimationGroupTitle => 'Animasi';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Gerakan yang dikurangi aktif, jadi animasi konten dijeda secara default. Anda masih dapat mengaktifkan kembali salah satu animasi ini agar tetap diputar.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'Putar emoji animasi';

  @override
  String get accessibilityAutoPlayGifsMobileLabel =>
      'Putar GIF secara otomatis';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Putar GIF secara otomatis saat $productName dalam fokus';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Diputar meskipun gerakan dikurangi.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Dijeda karena gerakan dikurangi. Aktifkan untuk tetap memutar emoji animasi.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Dijeda karena gerakan dikurangi. Aktifkan untuk tetap memutar GIF.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Nonaktif secara default di perangkat seluler untuk menghemat baterai dan penggunaan data.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Animasi stiker';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Preferensi animasi stiker';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Selalu animasikan';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Stiker akan selalu bergerak';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Animasikan saat interaksi';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Stiker akan beranimasi saat kamu menekannya';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Stiker akan beranimasi saat kamu mengarahkan kursor atau berinteraksi dengannya';

  @override
  String get accessibilityStickerNeverAnimateName => 'Jangan animasikan';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Stiker tidak akan pernah beranimasi';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Selalu dianimasikan meskipun gerakan dikurangi.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Gerakan yang dikurangi membatasi stiker untuk menganimasikan interaksi. Pilih selalu menganimasikan untuk menimpa.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Defaultnya adalah animasi saat interaksi di perangkat seluler untuk menghemat baterai.';

  @override
  String get accessibilityMotionGroupTitle => 'Gerakan';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Sinkronkan pengaturan kurangi gerakan dengan sistem';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Gunakan preferensi gerakan yang dikurangi dari sistem perangkat ini, atau sesuaikan di bawah.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Kurangi gerakan';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Nonaktifkan animasi dan transisi. Saat ini mengikuti pengaturan sistemmu.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Nonaktifkan animasi dan transisi di seluruh aplikasi.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Emoji animasi, GIF, dan stiker tetap dalam kendalimu di tab Animasi.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Mulai panggilan?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Yakin ingin memulai panggilan ini?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Mulai panggilan';

  @override
  String get accessibilityTtsSampleDescription =>
      'Dengarkan contoh baris yang diucapkan dengan kecepatan pilihan Anda.';

  @override
  String get accessibilityTtsSampleText =>
      'Dok, saya dari masa depan. Saya datang ke sini dengan mesin waktu yang kamu ciptakan. Sekarang, saya butuh bantuanmu untuk kembali ke tahun 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Sintesis ucapan tidak tersedia di perangkat ini.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Pemutaran ucapan gagal. Coba lagi, atau periksa apakah output audio berfungsi.';

  @override
  String get ttsSubstitutionUnknownUser => 'pengguna tidak dikenal';

  @override
  String get ttsSubstitutionUnknownRole => 'peran tidak diketahui';

  @override
  String get ttsSubstitutionUnknownChannel => 'saluran tidak dikenal';

  @override
  String get ttsSubstitutionCodeBlock => 'blok kode';

  @override
  String get ttsSubstitutionSpoiler => 'spoiler';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'emoji $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'garis miring $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName berkata: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Membalas $replyAuthorName, $authorName berkata: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName oleh $description';
  }

  @override
  String get ttsSentSticker => 'mengirim stiker';

  @override
  String get ttsSentAttachment => 'mengirim lampiran';

  @override
  String ttsSentAttachments(int count) {
    return 'terkirim $count lampiran';
  }

  @override
  String get ttsSentEmbed => 'mengirimkan sematan';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author mengirim $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Mengirim lampiran';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username menyematkan pesan ke saluran ini.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username menambahkan $userName ke grup.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username menambahkan seseorang ke grup.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username telah keluar dari grup.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username mengeluarkan $userName dari grup.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username mengeluarkan seseorang dari grup.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username mengubah nama saluran menjadi $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username mengubah nama saluran.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username mengubah ikon saluran.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username memulai panggilan.';
  }

  @override
  String get systemCallJoinTheCall => 'Gabung panggilan';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username memulai panggilan yang berlangsung selama $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Anda melewatkan panggilan dari $username yang berlangsung selama $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Anda melewatkan panggilan dari $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'beberapa detik';

  @override
  String get systemCallDurationMinute => 'satu menit';

  @override
  String get systemCallDurationOneYear => '1 tahun';

  @override
  String get systemCallDurationOneMonth => '1 bulan';

  @override
  String get systemCallDurationOneWeek => '1 minggu';

  @override
  String get systemCallDurationOneDay => '1 hari';

  @override
  String get systemCallDurationOneHour => '1 jam';

  @override
  String systemCallDurationYears(int count) {
    return '$count tahun';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count bulan';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count minggu';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count hari';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count jam';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count menit';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Perbarui $productName untuk melihat pesan ini.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Konfirmasi koneksi suara';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Anda sudah terhubung ke saluran suara ini dari $count perangkat lain. Apa yang ingin Anda lakukan?',
      one:
          'Anda sudah terhubung ke saluran suara ini dari 1 perangkat lain. Apa yang ingin Anda lakukan?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Beralih ke perangkat ini';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Gabung saja (pertahankan koneksi lain)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Jangan lakukan apa pun, saya tidak ingin bergabung';

  @override
  String get voiceJoinFailedTitle => 'Tidak dapat Bergabung ke Suara';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Tidak dapat memutuskan sambungan perangkat Anda yang lain. Coba lagi sebentar lagi.';

  @override
  String get voiceChannelEmptyDescription =>
      'Ini adalah saluran suara. Hubungkan untuk mulai berbicara!';

  @override
  String get voiceChannelJoin => 'Gabung ke saluran suara';

  @override
  String get voiceCallJoin => 'Gabung panggilan';

  @override
  String get voiceChannelJoinConnect => 'Sambungkan ke suara';

  @override
  String get voiceChannelNoConnectPermission =>
      'Kamu tidak memiliki izin untuk bergabung ke saluran suara ini';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Mikrofon, kamera, dan konten berbagi layar dienkripsi ujung ke ujung.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Mikrofon, kamera, dan konten berbagi layar dienkripsi ujung ke ujung.';

  @override
  String get voiceChannelE2eeBroken =>
      'Enkripsi end-to-end tidak tersedia karena ada peserta yang tidak didukung di saluran suara ini.';

  @override
  String get voiceCallE2eeBroken =>
      'Enkripsi end-to-end tidak tersedia karena ada peserta yang tidak didukung dalam panggilan ini.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Klien ini harus diperbarui sebelum bergabung ke panggilan terenkripsi ini.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Mikrofon Anda tidak dapat dimulai. Anda masih dalam panggilan.';

  @override
  String get voiceChannelStatusConnecting => 'Menyambungkan…';

  @override
  String get voiceChannelStatusConnected => 'Terhubung';

  @override
  String get voiceChannelStatusError => 'Terjadi kesalahan';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Perangkat seluler';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Perangkat desktop';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'Komunitas dibisukan';

  @override
  String get voiceParticipantTooltipMuted => 'Dibisukan';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Diredam oleh komunitas';

  @override
  String get voiceParticipantTooltipDeafened => 'Suara masuk dibisukan';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Koneksi: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count peserta',
      one: '1 peserta',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Keluar';

  @override
  String get voiceControlMute => 'Bisukan';

  @override
  String get voiceControlUnmute => 'Buka suara';

  @override
  String get voiceControlDeafen => 'Bisukan suara masuk';

  @override
  String get voiceControlUndeafen => 'Aktifkan suara masuk';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Balik kamera';

  @override
  String get voiceControlScreenShare => 'Berbagi layar';

  @override
  String get voiceScreenShareNotificationText => 'Membagikan layar Anda.';

  @override
  String get voiceControlMore => 'Lainnya';

  @override
  String get voiceControlDisconnect => 'Putuskan sambungan';

  @override
  String get voiceInChat => 'Dalam obrolan suara';

  @override
  String get voiceConnectionFailed => 'Koneksi gagal';

  @override
  String get voiceConnectionRetry => 'Coba lagi';

  @override
  String get voiceConnectionDismiss => 'Tutup';

  @override
  String get voiceConnectionDisconnected => 'Terputus';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'Mengukur latensi...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Lompat ke $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Koneksi suara';

  @override
  String get voiceConnectionAdvancedStats => 'Lanjutan';

  @override
  String get voiceShowCallAvatars => 'Tampilkan avatar panggilan';

  @override
  String get voiceShowConnectionId => 'Tampilkan ID koneksi';

  @override
  String get voiceAudioProcessing => 'Pemrosesan audio';

  @override
  String get voiceConnectionSessionSection => 'Sesi';

  @override
  String get voiceConnectionDurationLabel => 'Durasi';

  @override
  String get voiceConnectionParticipantsLabel => 'Peserta';

  @override
  String get voiceConnectionNetworkSection => 'Jaringan';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Jitter';

  @override
  String get voiceConnectionSendLabel => 'Kirim';

  @override
  String get voiceConnectionReceiveLabel => 'Terima';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes m $seconds d';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency md';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter md';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth kbps';
  }

  @override
  String get userAreaMuteMicrophone => 'Bisukan mikrofon';

  @override
  String get userAreaUnmuteMicrophone => 'Aktifkan mikrofon';

  @override
  String get userAreaUserSettings => 'Pengaturan pengguna';

  @override
  String get voiceParticipantMenuViewProfile => 'Lihat profil';

  @override
  String get voiceParticipantMenuFocus => 'Fokuskan orang ini';

  @override
  String get voiceParticipantMenuUnfocus => 'Batalkan fokus';

  @override
  String get voiceParticipantMenuCommunityMute => 'Bisukan di komunitas';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'Bisukan suara masuk di komunitas';

  @override
  String get voiceParticipantMenuUserVolume => 'Volume pengguna';

  @override
  String get voiceParticipantMenuStreamVolume => 'Volume streaming';

  @override
  String get voiceParticipantMenuStopStreaming => 'Hentikan streaming';

  @override
  String get voiceParticipantModerationFailed =>
      'Tidak dapat memperbarui anggota tersebut. Coba lagi.';

  @override
  String get voiceControlChat => 'Obrolan';

  @override
  String get voiceCallViewModeLabel => 'Lihat';

  @override
  String get voiceCallViewModeGrid => 'Kisi';

  @override
  String get voiceCallViewModeFocus => 'Fokus';

  @override
  String get voicePanelSettingsSectionTitle => 'Pengaturan suara';

  @override
  String get voicePanelUseEarpieceLabel => 'Gunakan gagang telepon';

  @override
  String get voiceOutputRouteSpeaker => 'Speaker';

  @override
  String get voiceOutputRouteEarpiece => 'Gagang telepon';

  @override
  String get voiceOutputRouteHeadset => 'Headphone';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Tampilkan video saja';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Tampilkan hanya peserta yang menyalakan kamera.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Tampilkan kamera saya';

  @override
  String get voicePrioritizeSpeakersLabel => 'Prioritaskan pembicara';

  @override
  String get voiceTextChatShow => 'Tampilkan obrolan';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# pesan belum dibaca',
      one: '# pesan belum dibaca',
    );
    return 'Tampilkan obrolan dengan $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Izin kamera diperlukan untuk video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Tidak dapat memulai berbagi layar. Coba lagi.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Izin berbagi layar ditolak.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Berbagi layar tidak tersedia di perangkat ini.';

  @override
  String get voiceWatchStream => 'Tonton siaran';

  @override
  String get voiceStopWatching => 'Berhenti menonton';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Berhenti menonton stream saat ini';

  @override
  String get voiceOwnScreenShareTitle => 'Anda sedang siaran';

  @override
  String get voiceOwnScreenShareSubtitle => 'Siaran Anda tayang untuk peserta.';

  @override
  String get voiceLiveBadge => 'Langsung';

  @override
  String get dmVoiceViewCall => 'Lihat panggilan';

  @override
  String get dmVoiceCallFullScreen => 'Layar penuh';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Buka panggilan layar penuh';

  @override
  String get dmVoiceStripStatusConnecting => 'Menyambungkan…';

  @override
  String get dmVoiceStripStatusInCall => 'Dalam panggilan';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Panggilan suara';

  @override
  String get dmVoiceCallBarConnecting => 'Menyambungkan…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Panggilan langsung';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Panggilan grup';

  @override
  String get dmVoiceCallBarIssueFallback => 'Masalah suara';

  @override
  String get dmVoiceFullscreenTitle => 'Suara';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Terhubung ke suara';

  @override
  String get notificationsPageTitle => 'Notifikasi';

  @override
  String get notificationsFilterUnreads => 'Belum dibaca';

  @override
  String get notificationsFilterMentions => 'Sebutan';

  @override
  String get notificationsBookmarksTooltip => 'Bookmark';

  @override
  String get notificationsMentionFilterTooltip => 'Filter sebutan';

  @override
  String get notificationsMentionFiltersTitle => 'Filter sebutan';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Sertakan sebutan @everyone dan @here';

  @override
  String get notificationsMentionIncludeRoles => 'Sertakan sebutan peran';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Sertakan semua sebutan komunitas';

  @override
  String get notificationsNoUnreadTitle => 'Tidak ada pesan yang belum dibaca';

  @override
  String get notificationsNoUnreadBody => 'Kamu sudah membaca semuanya.';

  @override
  String get notificationsNoMentionsTitle => 'Tidak ada sebutan terbaru';

  @override
  String get notificationsNoMentionsBody =>
      'Semua @mention Anda akan muncul di sini selama 7 hari.';

  @override
  String get notificationsMentionsEndTitle => 'Kamu sudah mencapai akhir';

  @override
  String get notificationsMentionsEndBody =>
      'Anda telah melihat semua sebutan terbaru Anda. Jangan khawatir, lebih banyak yang akan segera muncul di sini.';

  @override
  String get notificationsJump => 'Lompat';

  @override
  String get notificationsRemoveMentionTooltip => 'Hapus sebutan';

  @override
  String get notificationsViewAllUnread => 'Lihat semua yang belum dibaca';

  @override
  String get notificationsMarkAsRead => 'Tandai sudah dibaca';

  @override
  String get notificationsExpand => 'Perluas';

  @override
  String get notificationsCollapse => 'Ciutkan';

  @override
  String get notificationsMessageUnavailable => 'Pesan ini tidak dapat dimuat.';

  @override
  String characterCounterRemaining(int remaining) {
    return 'Sisa $remaining karakter';
  }

  @override
  String get characterCounterTooLong => 'Pesan terlalu panjang';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining karakter tersisa. Dapatkan $productName untuk menulis hingga $premiumMaxLength karakter.';
  }

  @override
  String get chatMessageFailedToSend => 'Gagal mengirim pesan';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Pesan Anda tidak dapat terkirim. Ini biasanya karena Anda tidak berbagi komunitas dengan penerima atau penerima hanya menerima pesan langsung dari teman. Anda mungkin juga perlu menyesuaikan pengaturan privasi pesan langsung Anda sendiri di $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Pesanmu tidak dapat dikirim. Kamu perlu mengklaim akunmu untuk mengirim pesan langsung.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Pesanmu tidak dapat dikirim. Kamu perlu mengklaim akunmu untuk mengirim pesan.';

  @override
  String get chatSendFailureContentBlocked =>
      'Pesanmu tidak dapat dikirim karena ditandai oleh sistem keamanan kami. Jika menurutmu ini keliru, silakan hubungi dukungan.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Pesan Anda tidak dapat terkirim karena berisi emoji atau stiker dewasa yang tidak diizinkan dalam konteks ini.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Hanya Anda yang dapat melihat pesan ini.';

  @override
  String get chatClientSystemDismiss => 'Tutup';

  @override
  String get privacyDashboardCommunicationSection => 'Komunikasi';

  @override
  String get privacyDashboardProfilePrivacySection => 'Privasi profil';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Teman & pesan langsung';

  @override
  String get privacyDashboardActivitySharingSection => 'Berbagi aktivitas';

  @override
  String get privacyDashboardSensitiveContentSection => 'Konten sensitif';

  @override
  String get privacyDashboardDataExportSection => 'Ekspor data';

  @override
  String get privacyDashboardDataDeletionSection => 'Penghapusan data';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Siapa yang dapat melihat profil lengkapmu';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Teman dan semua komunitas';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Profil lengkapmu bisa dilihat oleh teman dan siapa pun di komunitasmu';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Hanya teman dan komunitas kecil';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Profil lengkapmu bisa dilihat oleh teman dan anggota komunitasmu yang punya 200 anggota atau kurang';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Hanya teman';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Profil lengkapmu hanya bisa dilihat oleh temanmu';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Permintaan pertemanan';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Semua orang';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Izinkan siapa saja mengirim permintaan pertemanan kepada Anda';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Teman dari teman';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Izinkan teman dari teman Anda mengirim permintaan';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Anggota komunitas';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Izinkan anggota dari komunitas yang Anda ikuti untuk mengirim permintaan kepada Anda';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Pesan langsung';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Izinkan pesan langsung dari anggota komunitas';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Izinkan anggota dari komunitas yang Anda ikuti untuk mengirimi Anda pesan langsung';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Izinkan pesan langsung dari bot komunitas';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Izinkan bot dari komunitas Anda untuk mengirim pesan langsung kepada Anda';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Kontrol siapa yang dapat mengirimi Anda permintaan pertemanan dan pesan langsung';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Kontrol siapa yang dapat menelepon Anda dan menambahkan Anda ke obrolan grup';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Panggilan masuk';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Kontrol siapa yang dapat menelepon Anda';

  @override
  String get privacyDashboardAllowedCallers => 'Penelepon yang diizinkan';

  @override
  String get privacyDashboardIncomingCallNobody => 'Tidak ada';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Blokir semua panggilan masuk';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Hanya teman';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Izinkan hanya teman yang menelepon Anda (disarankan)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Teman + Kustom';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Izinkan teman dan grup tambahan yang Anda pilih';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Semua orang';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Izinkan siapa saja menelepon Anda, bahkan orang asing';

  @override
  String get privacyDashboardAdditionalGroups => 'Grup Tambahan';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Teman dari teman Anda dapat menelepon Anda';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Orang dari komunitas yang sama-sama Anda ikuti dapat menelepon Anda';

  @override
  String get privacyDashboardRingBehavior => 'Perilaku dering';

  @override
  String get privacyDashboardSilentCalls => 'Panggilan senyap dari semua orang';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Semua panggilan akan berbunyi senyap alih-alih berdering. Secara default, panggilan dari bukan teman selalu senyap.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Siapa yang bisa menambahkanmu ke obrolan grup';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Atur siapa saja yang dapat menambahkan Anda ke grup tanpa meminta izin. Siapa pun masih dapat mengirimkan tautan undangan untuk bergabung.';

  @override
  String get privacyDashboardAllowedInvites => 'Undangan yang diizinkan';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Jangan biarkan siapa pun menambahkan Anda ke obrolan grup tanpa bertanya';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Izinkan hanya teman untuk menambahkan Anda tanpa meminta (disarankan)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Izinkan teman plus grup tambahan untuk menambahkan Anda';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Izinkan siapa saja menambahkan Anda ke chat grup tanpa bertanya';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Orang yang berteman dengan teman Anda dapat menambahkan Anda ke obrolan grup';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Orang dari komunitas yang sama-sama Anda ikuti dapat menambahkan Anda ke obrolan grup';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Aktivitas suara di Aktif sekarang';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Bagikan aktivitas suaramu dengan teman';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Bagikan aktivitas suara dengan semua teman?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Berhenti membagikan aktivitas suara dengan semua teman?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Kamu akan mulai membagikan aktivitas suaramu dengan semua temanmu, termasuk teman baru nanti. Ini mengirim pembaruan ke mereka semua dan baru bisa diubah lagi setelah 24 jam.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Kamu akan berhenti membagikan aktivitas suaramu dengan semua temanmu, termasuk teman baru nanti. Ini mengirim pembaruan ke mereka semua dan baru bisa diubah lagi setelah 24 jam.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Ya, bagikan dengan semua teman';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm =>
      'Ya, berhenti berbagi';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Tersedia lagi dalam $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Berbagi aktivitas suara telah diperbarui';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Tidak dapat memperbarui berbagi aktivitas suara sekarang';

  @override
  String get privacyDashboardDataExportDesc =>
      'Buat arsip data akunmu yang dapat diunduh, termasuk pesan dan URL lampiran. Kebanyakan orang memilih semuanya, tetapi kamu bisa mempersempit cakupannya di bawah.';

  @override
  String get privacyDashboardExportMyData => 'Ekspor data saya';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Hapus permanen pesan yang kamu kirim di DM, DM grup, dan komunitas. Proses ini berjalan di latar belakang, dan kamu akan menerima DM setelah selesai.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Hapus pesan saya';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Izinkan pesan langsung dari anggota komunitas?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Blokir pesan langsung dari anggota komunitas?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Izinkan bot mengirimimu pesan langsung?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Blokir bot agar tidak mengirimi kamu pesan langsung?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Apakah kamu juga ingin mengizinkan pesan langsung dari anggota komunitas yang sudah kamu ikuti?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Apakah kamu juga ingin memblokir pesan langsung dari anggota komunitas yang sudah kamu ikuti?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Apakah kamu juga ingin mengizinkan bot dari komunitas yang sudah kamu ikuti mengirimimu pesan langsung?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Apakah Anda juga ingin memblokir bot dari komunitas yang ada?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Anda juga dapat mengubah setelan ini per komunitas dengan menekan lama nama komunitas dan memilih Setelan Privasi.';

  @override
  String get privacyDashboardDmConfirmAllowAll =>
      'Izinkan untuk semua komunitas';

  @override
  String get privacyDashboardDmConfirmBlockAll =>
      'Blokir untuk semua komunitas';

  @override
  String get privacyDashboardDmConfirmSkip => 'Lewati langkah ini';

  @override
  String get privacyDashboardDataRequestGoBack => 'Kembali';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Ekspor data saya';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Hapus pesan saya';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Kami akan memproses ini sesegera mungkin. Kamu akan menerima email saat arsipmu siap.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Kami akan memproses ini sesegera mungkin. Kamu akan menerima DM dari kami setelah selesai.';

  @override
  String get privacyDashboardDataRequestScopeTitle =>
      'Apa yang akan disertakan';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Semua';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Ekspor semua pesan yang pernah kamu kirim, ditambah semua pengaturan akun, keanggotaan, dan metadatamu.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Pilihan khusus';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Pilih jenis percakapan, komunitas, dan rentang waktu yang akan disertakan dalam arsip.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Pilih apa yang akan disertakan';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Pilih jenis percakapan yang ingin dibersihkan.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Hanya tempat yang tidak bisa saya akses lagi';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Hanya hapus pesan dari komunitas dan DM grup tempat kamu sudah keluar atau dikeluarkan.';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'Percakapan mana';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Pilih jenis percakapan yang ingin kamu sertakan.';

  @override
  String get privacyDashboardDataRequestKindDms => 'DM terbuka';

  @override
  String get privacyDashboardDataRequestKindDmsClosed => 'DM yang ditutup';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'DM grup';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Komunitas';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Komunitas mana';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Filter komunitas';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Sertakan semua kecuali yang dipilih';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Hanya yang dipilih';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Kamu belum bergabung dengan komunitas mana pun.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Rentang waktu';

  @override
  String get privacyDashboardDataRequestDateMode => 'Rentang waktu';

  @override
  String get privacyDashboardDataRequestAllTime => 'Sepanjang waktu';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Rentang khusus';

  @override
  String get privacyDashboardDataRequestStartDate => 'Tanggal mulai';

  @override
  String get privacyDashboardDataRequestEndDate => 'Tanggal akhir';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Biarkan salah satu kolom kosong agar ujung rentang itu tidak dibatasi.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Pilih setidaknya satu jenis percakapan untuk disertakan.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Tanggal mulai harus sebelum tanggal berakhir.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Tinjau dan konfirmasi';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Kami akan membuat arsip yang dapat diunduh berisi semua pesan yang pernah kamu kirim dan mengirimimu email setelah siap. Tautan unduhan di email tersebut akan kedaluwarsa setelah 7 hari.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Kami akan membuat arsip yang dapat diunduh sesuai filter di bawah dan mengirimimu email setelah siap. Tautan unduhan di email tersebut akan kedaluwarsa setelah 7 hari.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Hapus permanen pesan yang cocok dengan filter di bawah. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Setelah ini dimulai, tidak ada cara untuk memulihkannya. Kami akan mengirimi kamu DM setelah selesai.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Minta ekspor';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Hapus pesan';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Cakupan';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'Percakapan';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Komunitas';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Rentang waktu';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Tidak ada';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Mulai $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Sampai $end';
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
      other: '# komunitas',
      one: '# komunitas',
    );
    return 'Semua kecuali $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# komunitas',
      one: '# komunitas',
    );
    return 'Hanya $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Pesan langsung yang terbuka';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Pesan langsung yang ditutup';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Pesan langsung (terbuka dan tertutup)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'DM grup';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Komunitas';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# jam',
      one: '# jam',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# menit',
      one: '# menit',
    );
    return '$_temp0 dan $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# jam',
      one: '# jam',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# menit',
      one: '# menit',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# detik',
      one: '# detik',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed => 'Gagal memuat setelan privasi';

  @override
  String get privacyDashboardRetry => 'Coba lagi';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Gagal menyimpan setelan konten sensitif.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Gagal menyelesaikan permintaan.';

  @override
  String get chatMessageDeleteFailed => 'Hapus Pesan Gagal';

  @override
  String get chatMessageAddReaction => 'Tambahkan reaksi';

  @override
  String get doubleTapReactionHint =>
      'Ketuk dua kali pesan untuk bereaksi dengan';

  @override
  String get doubleTapReactionEdit => 'Edit';

  @override
  String get doubleTapReactionEditTitle => 'Ubah default';

  @override
  String get doubleTapReactionEditSubtitle => 'Pilih emoji ketuk dua kali';

  @override
  String get chatMessageEdit => 'Edit pesan';

  @override
  String get chatMessageReply => 'Balas';

  @override
  String get notificationReplyPlaceholder => 'Pesan';

  @override
  String get notificationReplyFailed => 'Tidak dapat mengirim balasan';

  @override
  String get chatMessageForward => 'Teruskan';

  @override
  String get forwardMessageTitle => 'Teruskan pesan';

  @override
  String get forwardSearchHint => 'Cari channel atau DM';

  @override
  String get forwardDirectMessagesSection => 'Pesan langsung';

  @override
  String get forwardCommentHint => 'Tambah komentar (opsional)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Kirim ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Tidak ada saluran yang ditemukan';

  @override
  String get forwardSuccessToast => 'Pesan diteruskan';

  @override
  String get forwardFailed => 'Gagal meneruskan pesan';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Komentar tidak tersedia karena saluran yang dipilih mengaktifkan mode lambat.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Menunggu mode lambat di satu atau beberapa saluran yang dipilih berakhir.';

  @override
  String get slowmodeRateLimitedTitle => 'Mode lambat aktif';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Mode lambat aktif — tunggu $duration sebelum mengirim pesan lagi.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Unggah langsung dinonaktifkan selama mode lambat.';

  @override
  String get shareMediaTitle => 'Bagikan ke';

  @override
  String get shareMediaMessageHint => 'Tambahkan pesan opsional…';

  @override
  String get shareMediaSendButton => 'Kirim';

  @override
  String get shareMediaSuccessToast => 'Media dibagikan';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Dibagikan ke $count tujuan';
  }

  @override
  String get shareMediaFailedToast => 'Gagal membagikan media';

  @override
  String get forwardDestinationNoSendPermission =>
      'Anda tidak dapat mengirim pesan di sini';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Anda tidak dapat menyematkan tautan di sini';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Anda tidak dapat melampirkan file di sini';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Pengiriman pesan dinonaktifkan di komunitas ini';

  @override
  String get forwardDestinationTimedOut =>
      'Anda sedang dibisukan di komunitas ini';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Slowmode - tunggu $remaining';
  }

  @override
  String get chatMessageCopyText => 'Salin pesan';

  @override
  String get chatMessageCopyEmbedText => 'Salin Teks Sematan';

  @override
  String get chatMessageTranslate => 'Terjemahkan';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Diterjemahkan dari $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Lihat aslinya';

  @override
  String get chatMessageSeeTranslation => 'Lihat terjemahan';

  @override
  String get chatMessageTranslating => 'Menerjemahkan…';

  @override
  String get chatMessageTranslateFailed =>
      'Tidak dapat menerjemahkan pesan ini.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Terjemahan tidak tersedia di perangkat ini.';

  @override
  String get chatMessageSpeak => 'Ucapkan pesan';

  @override
  String get chatMessageStopSpeaking => 'Hentikan pembacaan';

  @override
  String get chatMessagePin => 'Sematkan pesan';

  @override
  String get chatMessageUnpin => 'Lepas sematan pesan';

  @override
  String get chatMessageUnpinIt => 'Lepas sematan';

  @override
  String get chatMessageBookmark => 'Simpan pesan ke bookmark';

  @override
  String get chatMessageRemoveBookmark => 'Hapus bookmark';

  @override
  String get chatMessageMarkAsUnread => 'Tandai sebagai belum dibaca';

  @override
  String get chatMessageCopyMessageLink => 'Salin tautan pesan';

  @override
  String get chatMessageOpenLink => 'Buka tautan';

  @override
  String get chatMessageCopyLink => 'Salin tautan';

  @override
  String get chatMessageCopyMessageId => 'Salin ID pesan';

  @override
  String get chatMessageViewReactions => 'Lihat reaksi';

  @override
  String get chatMessageRemoveAllReactions => 'Hapus semua reaksi';

  @override
  String get chatMessageDebug => 'Pesan debug';

  @override
  String get chatMessageDebugSheetTitle => 'Pesan debug';

  @override
  String get chatMessageDebugCopyJson => 'Salin JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'JSON pesan disalin ke papan klip';

  @override
  String get chatReactionsSheetTitle => 'Reaksi';

  @override
  String get chatReactionsSheetEmpty => 'Belum ada yang bereaksi dengan ini.';

  @override
  String get chatReactionAddFailed => 'Gagal menambahkan reaksi';

  @override
  String get chatReactionRemoveFailed => 'Gagal menghapus reaksi';

  @override
  String get chatMessageReport => 'Laporkan pesan';

  @override
  String get iarReportMessageTitle => 'Laporkan pesan';

  @override
  String get iarThisUserFallback => 'pengguna ini';

  @override
  String get iarModalDescription =>
      'Laporkan pelanggaran aturan, atau temukan alat untuk mengelola kontak dan preferensi.';

  @override
  String get iarPathStepAriaLabel => 'Apa yang Anda butuhkan?';

  @override
  String get iarCategoryStepTitle => 'Jenis aturan apa yang dilanggar?';

  @override
  String get iarReasonStepTitle => 'Aturan mana yang dilanggar?';

  @override
  String get iarReasonSelectHint => 'Pilih alasan';

  @override
  String get iarPickAnOptionToast => 'Pilih salah satu opsi untuk melanjutkan.';

  @override
  String get iarPickARuleToast => 'Pilih aturan yang dilanggar.';

  @override
  String get iarPathPlatform => 'Laporkan pelanggaran aturan platform';

  @override
  String get iarPathCommunity => 'Laporkan ke moderator komunitas ini';

  @override
  String get iarPathPreferenceMessage => 'Saya tidak suka konten ini';

  @override
  String get iarCategoryTargetedHarmLabel => 'Ancaman, pelecehan, atau bahaya';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Penindasan, ancaman, kebencian, kekerasan, serangan, atau konten yang mendorong tindakan menyakiti diri sendiri.';

  @override
  String get iarCategorySafetyMinorsLabel => 'Keamanan anak atau konten dewasa';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Anak di bawah umur berisiko, konten dewasa di tempat yang salah, atau perilaku yang tidak diinginkan.';

  @override
  String get iarCategoryPrivacyIdentityLabel =>
      'Privasi atau peniruan identitas';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxing, menguntit, menyamar sebagai orang lain, atau profil yang tidak pantas.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Penipuan, malware, atau misinformasi';

  @override
  String get iarCategoryDeceptionDescription =>
      'Phishing, penipuan, tautan berbahaya, atau klaim palsu yang berpotensi menimbulkan kerugian di dunia nyata.';

  @override
  String get iarCategoryIllegalOtherLabel => 'Aktivitas ilegal atau lainnya';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Penjualan ilegal, fasilitasi kriminal, atau pelanggaran aturan yang jelas yang tidak termasuk dalam kategori di atas.';

  @override
  String get iarReasonHarassmentLabel => 'Pelecehan atau ancaman';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Penindasan, kontak yang tidak diinginkan berulang kali, penguntitan, atau pelecehan yang ditargetkan.';

  @override
  String get iarReasonHateLabel => 'Ujaran kebencian';

  @override
  String get iarReasonHateMessageDescription =>
      'Kata-kata hinaan, bahasa yang merendahkan martabat, atau serangan terhadap kelompok yang dilindungi.';

  @override
  String get iarReasonViolenceLabel => 'Kekerasan atau ancaman kekerasan';

  @override
  String get iarReasonViolenceDescription =>
      'Ancaman yang kredibel, kekerasan grafis, atau glorifikasi kekerasan.';

  @override
  String get iarReasonMatureContentLabel => 'Konten dewasa atau pelecehan';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Perilaku yang tidak diinginkan atau konten dewasa di tempat yang salah.';

  @override
  String get iarReasonChildSafetyLabel =>
      'Keamanan anak atau eksploitasi anak di bawah umur';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Konten grooming atau eksploitasi anak.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Misinformasi berbahaya';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Klaim palsu yang kemungkinan menyebabkan kerugian di dunia nyata.';

  @override
  String get iarReasonSpamLabel => 'Spam, penipuan, atau phishing';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam massal, penipuan, giveaway palsu, atau penyalahgunaan akun.';

  @override
  String get iarReasonMalwareLabel => 'Malware atau tautan berbahaya';

  @override
  String get iarReasonMalwareDescription =>
      'Malware, pencurian kredensial, atau file berbahaya.';

  @override
  String get iarReasonPrivacyLabel => 'Pelanggaran privasi';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxing, informasi pribadi yang terekspos, atau penguntitan.';

  @override
  String get iarReasonImpersonationLabel =>
      'Peniruan identitas atau media yang menipu';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Berpura-pura menjadi orang lain, termasuk konten hasil AI yang menipu.';

  @override
  String get iarReasonIllegalLabel => 'Aktivitas ilegal';

  @override
  String get iarReasonIllegalDescription =>
      'Penjualan ilegal, fasilitasi kriminal, atau aktivitas melanggar hukum.';

  @override
  String get iarReasonSelfHarmLabel => 'Melukai diri sendiri atau bunuh diri';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Promosi atau instruksi yang mendorong tindakan menyakiti diri sendiri atau gangguan makan.';

  @override
  String get iarReasonOtherLabel => 'Pelanggaran aturan yang jelas lainnya';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Gunakan hanya jika jelas melanggar aturan $productName dan tidak sesuai dengan pilihan di atas.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Jika melibatkan anak di bawah umur, gunakan \"$childSafetyReason\" sebagai gantinya.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Jika ini melibatkan CSAM atau eksploitasi anak di bawah umur, kirim sekarang dan jangan bagikan materi tersebut lagi.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Jika ada orang yang berada dalam bahaya mendesak, hubungi layanan darurat setempat jika kamu bisa melakukannya dengan aman.';

  @override
  String get iarSafetyNoteViolence =>
      'Jika ini adalah ancaman nyata yang akan segera terjadi, hubungi juga layanan darurat setempat.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Jika ini adalah ancaman teroris yang akan segera terjadi, hubungi juga layanan darurat setempat.';

  @override
  String get iarActionBlockUserTitle => 'Blokir pengguna ini';

  @override
  String get iarActionBlockUserDescription =>
      'Hentikan pesan dan permintaan pertemanan.';

  @override
  String get iarActionBlockUserButton => 'Blokir';

  @override
  String get iarActionCopyMessageLinkTitle => 'Salin tautan pesan';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Bagikan ke moderator komunitas.';

  @override
  String get iarActionCopyMessageLinkButton => 'Salin';

  @override
  String get iarActionCloseDmTitle => 'Tutup DM ini';

  @override
  String get iarActionCloseDmDescription =>
      'Tidak memblokir. Kamu bisa membukanya lagi nanti.';

  @override
  String get iarActionCloseDmButton => 'Tutup DM';

  @override
  String get iarActionLeaveCommunityTitle => 'Keluar dari komunitas';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Berhenti melihat konten dan anggotanya.';

  @override
  String get iarActionLeaveCommunityButton => 'Keluar';

  @override
  String get iarActionDmSettingsTitle =>
      'Pengaturan DM & permintaan pertemanan';

  @override
  String get iarActionDmSettingsDescription =>
      'Ubah siapa yang bisa menghubungimu.';

  @override
  String get iarActionCallSettingsTitle =>
      'Pengaturan panggilan & obrolan grup';

  @override
  String get iarActionCallSettingsDescription =>
      'Ubah siapa yang bisa menelepon atau menambahkanmu.';

  @override
  String get iarActionOpenButton => 'Buka';

  @override
  String get iarActionDeleteMessageTitle => 'Hapus pesan ini';

  @override
  String get iarActionDeleteMessageDescription =>
      'Hapus dari saluran untuk semua orang.';

  @override
  String get iarActionDeleteMessageButton => 'Hapus';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Dihapus';

  @override
  String get iarActionDeleteMessageDeletedTooltip => 'Pesan ini sudah dihapus.';

  @override
  String get iarActionBanUserTitle => 'Blokir pengguna ini';

  @override
  String get iarActionBanUserDescription =>
      'Buka dialog blokir untuk komunitas ini.';

  @override
  String get iarActionBanUserButton => 'Blokir';

  @override
  String get iarActionBanUserBannedButton => 'Diblokir';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Pengguna ini sudah diblokir dari komunitas.';

  @override
  String get iarCloseDmConfirmTitle => 'Tutup DM';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Tutup DM Anda saat ini dengan $name. Ini tidak akan memblokir mereka; Anda dapat membukanya kembali nanti.';
  }

  @override
  String get iarSuccessTitle => 'Laporan terkirim';

  @override
  String get iarSuccessBody =>
      'Tim keamanan kami sedang meninjaunya. Kami akan mengirimimu DM dan email setelah ada keputusan.';

  @override
  String get iarAlreadyReportedTitle => 'Sudah dilaporkan';

  @override
  String get iarAlreadyReportedBody =>
      'Anda sudah melaporkan pesan ini. Tim keamanan kami sedang meninjaunya.';

  @override
  String get iarBackButton => 'Kembali';

  @override
  String get iarContinueButton => 'Lanjutkan';

  @override
  String get iarSendReportButton => 'Kirim laporan';

  @override
  String get iarDoneButton => 'Selesai';

  @override
  String get iarCouldntSendToast =>
      'Laporan tidak dapat dikirim. Coba lagi nanti.';

  @override
  String get iarRateLimitedToast =>
      'Anda terlalu cepat melaporkan. Harap tunggu sebentar dan coba lagi.';

  @override
  String get iarReportSentToast =>
      'Laporan terkirim. Tim keselamatan kami akan meninjaunya.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Blokir $name? Mereka tidak akan bisa mengirim pesan atau permintaan pertemanan kepada Anda. Anda bisa membuka blokir mereka nanti.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Tidak dapat memblokir pengguna ini. Silakan coba lagi.';

  @override
  String get iarCloseDmSuccessToast => 'DM ditutup.';

  @override
  String get iarCloseDmFailedToast => 'Tidak dapat menutup DM ini. Coba lagi.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Gagal meninggalkan komunitas ini. Coba lagi.';

  @override
  String get chatMessageSuppressEmbeds => 'Sembunyikan sematan';

  @override
  String get chatMessageUnsuppressEmbeds => 'Tampilkan sematan';

  @override
  String get chatMessageDelete => 'Hapus pesan';

  @override
  String get chatMessageDeleteConfirmTitle => 'Hapus pesan';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Apakah Anda yakin ingin menghapus pesan ini?';

  @override
  String get chatMessageDeleteAttachment => 'Hapus lampiran';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => 'Edit teks alternatif';

  @override
  String get chatMessageMore => 'Lainnya';

  @override
  String get chatEditingMessage => 'Mengedit pesan';

  @override
  String get chatReplyOriginalDeleted => 'Pesan asli telah dihapus';

  @override
  String get chatReplyOriginalFailedToLoad => 'Pesan asli gagal dimuat';

  @override
  String get chatReplyAttachedMedia => 'Pesan berisi media terlampir';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pesan diblokir',
      one: '1 pesan diblokir',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pesan spam potensial',
      one: '1 pesan spam potensial',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Balasan disembunyikan karena penulis asli diblokir.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Balasan disembunyikan karena penulis asli ditandai sebagai spammer.';

  @override
  String get devMarkAsSpamLocally => 'Tandai sebagai spam secara lokal';

  @override
  String get devIgnoreSpamFlag => 'Abaikan tanda spam';

  @override
  String get chatMessagesLoadError => 'Tidak dapat memuat pesan.';

  @override
  String get chatReplyMentionOverrideTitle => 'Timpa preferensi sebutan?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname lebih suka disebut dengan @sebutan saat dibalas. Tetap kirim tanpa sebutan?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname lebih suka balasan tanpa @sebutan. Tetap kirim dengan sebutan?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Abaikan preferensi';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Klik untuk menonaktifkan notifikasi ke pengguna yang kamu balas.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Klik untuk mengaktifkan notifikasi ke pengguna yang kamu balas.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Sebut pengguna yang dibalas';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'Batalkan balasan';

  @override
  String get chatEditMessageHint => 'Edit pesan';

  @override
  String get chatEditNoChanges => 'Tidak ada perubahan untuk disimpan';

  @override
  String get chatChannelNotReady =>
      'Saluran ini belum siap. Coba lagi sebentar lagi.';

  @override
  String get chatMessageEdited => '(diedit)';

  @override
  String get chatMessageSilent => 'Ini adalah pesan @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Hari ini pukul $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Kemarin pukul $time';
  }

  @override
  String get mediaViewerImagePreview => 'Pratinjau gambar';

  @override
  String get mediaViewerClose => 'Tutup penampil media';

  @override
  String get mediaViewerOpenInBrowser => 'Buka di browser';

  @override
  String get mediaViewerOptions => 'Opsi media';

  @override
  String get mediaViewerCopyLink => 'Salin tautan';

  @override
  String get mediaViewerForward => 'Teruskan';

  @override
  String get mediaViewerZoomIn => 'Perbesar';

  @override
  String get mediaViewerZoomOut => 'Perkecil';

  @override
  String get mediaViewerPreviousAttachment => 'Lampiran sebelumnya';

  @override
  String get mediaViewerNextAttachment => 'Lampiran berikutnya';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Lampiran $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Tutup';

  @override
  String get chatAttachmentVideoToggleControls => 'Beralih kontrol video';

  @override
  String get chatAttachmentVideoMute => 'Bisukan video';

  @override
  String get chatAttachmentVideoUnmute => 'Buka suara video';

  @override
  String get chatAttachmentVideoPlay => 'Putar video';

  @override
  String get chatAttachmentVideoPause => 'Jeda video';

  @override
  String get chatAttachmentVideoProgress => 'Progres video';

  @override
  String get chatVideoPlaybackFailed => 'Tidak dapat memutar video ini.';

  @override
  String get chatImageCouldNotLoad => 'Tidak dapat memuat gambar ini.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Beri tahu pengguna dengan peran ini yang memiliki izin untuk melihat saluran ini.';

  @override
  String get composerAutocompleteSuggestions => 'Saran';

  @override
  String get composerAutocompleteCommandsHeading => 'Perintah';

  @override
  String get composerAutocompleteChoicesHeading => 'Pilihan';

  @override
  String get composerAutocompleteOptionalArgumentsHeading => 'Argumen opsional';

  @override
  String get composerAutocompleteChannelsHeading => 'Saluran';

  @override
  String get composerAutocompleteMembersHeading => 'Anggota';

  @override
  String get composerAutocompleteUsersHeading => 'Pengguna';

  @override
  String get composerAutocompleteMentionsHeading => 'Sebutan';

  @override
  String get composerAutocompleteRolesHeading => 'Peran';

  @override
  String get composerAutocompleteMediaHeading => 'Media';

  @override
  String get composerAutocompleteStickersHeading => 'Stiker';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'Tidak ada GIF yang ditemukan';

  @override
  String get composerCommandShrugDescription =>
      'Menambahkan ¯\\_(ツ)_/¯ ke pesanmu.';

  @override
  String get composerCommandTableflipDescription =>
      'Menambahkan (╯°□°)╯︵ ┻━┻ ke pesanmu.';

  @override
  String get composerCommandUnflipDescription =>
      'Menambahkan ┬─┬ ノ( ゜-゜ノ) ke pesanmu.';

  @override
  String get composerCommandMeDescription =>
      'Kirim pesan tindakan (ditulis miring).';

  @override
  String get composerCommandSpoilerDescription =>
      'Kirim pesan spoiler (dibungkus dalam tag spoiler).';

  @override
  String get composerCommandTtsDescription => 'Kirim pesan text-to-speech.';

  @override
  String get composerCommandNickDescription =>
      'Ubah nama panggilanmu di komunitas ini.';

  @override
  String get composerCommandKickDescription =>
      'Keluarkan anggota dari komunitas ini.';

  @override
  String get composerCommandBanDescription =>
      'Blokir anggota dari komunitas ini.';

  @override
  String get composerCommandMsgDescription =>
      'Kirim pesan langsung ke pengguna.';

  @override
  String get composerCommandSavedDescription => 'Kirim item media tersimpan.';

  @override
  String get composerCommandStickerDescription => 'Kirim stiker.';

  @override
  String get composerCommandGifDescription => 'Cari dan kirim GIF.';

  @override
  String get composerCommandMemberOption => 'Anggota yang dituju.';

  @override
  String get composerCommandReasonOption => 'Alasan (opsional).';

  @override
  String get composerCommandMessageOption => 'Pesan yang akan dikirim.';

  @override
  String get composerCommandQueryOption => 'Apa yang ingin kamu cari.';

  @override
  String get composerCommandNicknameOption =>
      'Nama panggilan barumu, atau kosongkan untuk mengatur ulang.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Berapa banyak riwayat pesan terbaru anggota yang akan dihapus.';

  @override
  String get composerCommandDeleteMessagesNone => 'Jangan hapus apa pun';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return '$count hari sebelumnya';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '24 jam terakhir';

  @override
  String get composerCommandOptionRequired =>
      'Opsi ini wajib diisi. Masukkan nilainya.';

  @override
  String get composerCommandClear => 'Hapus perintah';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Kamu mengubah nama panggilanmu di komunitas ini dari **$previousNickname** menjadi **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Pengguna tidak dikenal';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Gagal mengirim pesan ke **$username**. Mungkin mereka menonaktifkan DM atau Anda diblokir.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count lainnya';
  }

  @override
  String get addGuildModalTitle => 'Tambahkan komunitas';

  @override
  String get addGuildModalLandingDescription =>
      'Buat komunitas baru atau gabung ke komunitas yang sudah ada.';

  @override
  String get addGuildCreateCommunity => 'Buat komunitas';

  @override
  String get addGuildJoinCommunity => 'Gabung komunitas';

  @override
  String get addGuildImportDiscordTemplate => 'Impor template Discord';

  @override
  String get addGuildJoinTitle => 'Gabung komunitas';

  @override
  String get addGuildJoinDescription =>
      'Masukkan tautan undangan untuk bergabung ke komunitas.';

  @override
  String get addGuildInviteLinkLabel => 'Tautan undangan';

  @override
  String get addGuildJoinSubmit => 'Gabung komunitas';

  @override
  String get addGuildInviteInvalid =>
      'Undangan ini tidak valid atau telah kedaluwarsa.';

  @override
  String get addGuildJoinFailed =>
      'Tidak dapat bergabung dengan komunitas. Silakan coba lagi.';

  @override
  String get addGuildCreateTitle => 'Buat komunitas';

  @override
  String get addGuildCreateDescription =>
      'Buat komunitas tempat kamu dan teman-temanmu bisa mengobrol.';

  @override
  String get addGuildCreateNameLabel => 'Nama komunitas';

  @override
  String get addGuildCreateSubmit => 'Buat komunitas';

  @override
  String get addGuildCreateFailed =>
      'Gagal membuat komunitas. Silakan coba lagi.';

  @override
  String get addGuildCreateClaimTitle => 'Klaim akunmu';

  @override
  String get addGuildCreateClaimDescription =>
      'Kamu perlu mengklaim akunmu sebelum bisa membuat komunitas.';

  @override
  String get addGuildCreateVerifyTitle => 'Verifikasi emailmu';

  @override
  String get addGuildCreateVerifyDescription =>
      'Kamu perlu memverifikasi alamat emailmu sebelum bisa membuat komunitas.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Ikon animasi tidak didukung saat membuat komunitas baru. Gunakan gambar statis.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Dengan membuat komunitas, Anda setuju untuk mengikuti dan menjunjung ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Pedoman komunitas $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Instance ini adalah satu komunitas, jadi komunitas tambahan tidak dapat dibuat.';

  @override
  String get addGuildCreateChangeIcon => 'Ubah ikon';

  @override
  String get addGuildCreateIconLabel => 'Ikon komunitas';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Maks 10MB. Rekomendasi: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Tempel URL template Discord untuk mengimpor strukturnya ke komunitas baru.';

  @override
  String get addGuildImportUrlLabel => 'URL template';

  @override
  String get addGuildImportUrlInvalid =>
      'Masukkan URL atau kode template Discord yang valid.';

  @override
  String get addGuildImportFetchFailed =>
      'Gagal mengambil templat komunitas. Templat mungkin tidak ada atau layanan eksternal tidak tersedia.';

  @override
  String get addGuildImportInvalidResponse =>
      'Ini sepertinya bukan respons templat yang valid.';

  @override
  String get addGuildImportTemplateLabel => 'Template';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount teks, $voiceChannelCount suara, $categoryCount kategori, $roleCount peran';
  }

  @override
  String get addGuildImportRemoveIcon => 'Hapus ikon';

  @override
  String get addGuildImportTemplateInvalid =>
      'Data templat komunitas tidak valid atau rusak.';

  @override
  String get addGuildPackInstalled => 'Paket berhasil diinstal.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'Hapus semua reaksi';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Apakah Anda yakin ingin menghapus semua reaksi dari pesan ini?';

  @override
  String get chatMessagePinConfirm => 'Sematkan';

  @override
  String get chatMessagePinConfirmDescription =>
      'Sematkan pesan ini ke saluran agar semua orang bisa melihatnya.';

  @override
  String get chatMessageUnpinConfirmTitle => 'Lepas sematan pesan';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'Kirim sematan ini kembali ke masa lalu?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username menyematkan $messageLink ke saluran ini. Lihat $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'sebuah pesan';

  @override
  String get systemPinMessageAllPinsLink => 'semua pesan yang disematkan';

  @override
  String get channelPinsEmptyTitle => 'Tidak ada pesan tersemat';

  @override
  String get channelPinsEmptyDescription =>
      'Pesan tersemat akan muncul di sini.';

  @override
  String get channelDetailsFallbackTitle => 'Detail';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Grup pribadi · $count anggota';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Tutup percakapan Anda dengan $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Keluar dari $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Pengaturan saluran';

  @override
  String get channelDetailsGroupSettingsTitle => 'Pengaturan grup';

  @override
  String get channelDetailsDmSettingsTitle => 'Pengaturan DM';

  @override
  String get channelDetailsInvitePeople => 'Undang orang';

  @override
  String get channelDetailsCopyLink => 'Salin tautan';

  @override
  String get channelMenuCopyChannelLink => 'Salin tautan saluran';

  @override
  String get channelMenuCopyRedirectLink => 'Salin tautan pengalihan';

  @override
  String get channelDetailsAddFriendsToGroup => 'Tambahkan teman ke grup';

  @override
  String get channelDetailsGroupInvites => 'Undangan grup';

  @override
  String get channelDetailsEditChannel => 'Edit saluran';

  @override
  String get channelDetailsDeleteChannel => 'Hapus saluran';

  @override
  String get channelSettingsCategorySettingsTitle => 'Pengaturan kategori';

  @override
  String get channelSettingsEditCategory => 'Edit kategori';

  @override
  String get channelSettingsTabOverview => 'Ringkasan';

  @override
  String get channelSettingsTabPermissions => 'Izin';

  @override
  String get channelSettingsTabInvites => 'Undangan';

  @override
  String get channelSettingsTabWebhooks => 'Webhook';

  @override
  String get channelSettingsDeleteChannel => 'Hapus saluran';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Apakah Anda yakin ingin menghapus $channelName? Tindakan ini tidak dapat dibatalkan.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Apakah Anda yakin ingin menghapus $categoryName? Tindakan ini tidak dapat dibatalkan.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Hapus kategori';

  @override
  String get channelSettingsChannelUpdated => 'Saluran diperbarui';

  @override
  String get channelSettingsChannelName => 'Nama saluran';

  @override
  String get channelSettingsCategoryName => 'Nama kategori';

  @override
  String get channelSettingsMyCategory => 'Kategori saya';

  @override
  String get categoryExpandCategory => 'Perluas kategori';

  @override
  String get categoryCollapseCategory => 'Ciutkan kategori';

  @override
  String get categoryExpandAllCategories => 'Perluas semua kategori';

  @override
  String get categoryCollapseAllCategories => 'Ciutkan semua kategori';

  @override
  String get categoryMuteCategory => 'Bisukan kategori';

  @override
  String get categoryUnmuteCategory => 'Bunyikan kategori';

  @override
  String get categoryCopyCategoryId => 'Salin ID kategori';

  @override
  String get categoryIdCopied => 'ID kategori disalin';

  @override
  String get channelSettingsChannelNamePlaceholder => 'umum';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Topik';

  @override
  String get channelSettingsTopicPlaceholder =>
      'Tambahkan topik ke saluran ini';

  @override
  String get channelSettingsInsertEmoji => 'Sisipkan emoji';

  @override
  String get channelSettingsTopicTooLongTitle =>
      'Topik saluran terlalu panjang.';

  @override
  String get channelSettingsTopicTooLongMessage =>
      'Persingkat topik dan coba lagi.';

  @override
  String get channelSettingsSlowmode => 'Mode lambat';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Jeda antar pesan. \"$bypassSlowmodePermissionLabel\" dapat melewati ini.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Nonaktif';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds detik';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes menit';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours jam';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute menit';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour jam';
  }

  @override
  String get channelSettingsVoiceQuality => 'Kualitas suara';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Bitrate lebih tinggi = kualitas lebih baik dan penggunaan bandwidth lebih tinggi.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Batas peserta';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Jumlah maksimum anggota yang dapat bergabung sekaligus. 0 berarti tidak terbatas.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count peserta',
      one: '1 peserta',
      zero: '∞ Tanpa batas',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Batas koneksi';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Koneksi aktif maksimum yang dapat dimiliki satu anggota di saluran ini.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count koneksi',
      one: '1 koneksi',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Wilayah suara';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Pilih wilayah suara untuk saluran ini. Otomatis menggunakan wilayah terdekat.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Otomatis';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Tidak dapat memuat wilayah suara';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Coba lagi sebentar lagi.';

  @override
  String get channelSettingsResetSlider =>
      'Setel ulang penggeser ke nilai default';

  @override
  String get channelSettingsAdvanced => 'Lanjutan';

  @override
  String get channelSettingsMatureContentOverride =>
      'Penggantian konten dewasa';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Timpa pengaturan tingkat $scopeLevel untuk saluran ini. Konten dewasa akan ditampilkan di balik gerbang sebelum masuk.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Ikuti pengaturan';

  @override
  String get channelSettingsMatureContentOn => 'Aktif';

  @override
  String get channelSettingsMatureContentOff => 'Nonaktif';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Tandai saluran ini untuk konten dewasa.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Biarkan saluran ini tidak dibatasi untuk konten dewasa.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Diwariskan dari $inheritedSourceLabel: aktif';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Diwariskan dari $inheritedSourceLabel: nonaktif';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'kategori';

  @override
  String get channelSettingsMatureContentCommunitySource => 'komunitas';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Kategori';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Komunitas';

  @override
  String get channelSettingsContentWarningToggle =>
      'Tampilkan peringatan konten di saluran ini';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Menyalakan permintaan persetujuan sebelum memasuki saluran ini.';

  @override
  String get channelSettingsContentWarningText => 'Teks peringatan khusus';

  @override
  String get channelSettingsContentWarningDefault =>
      'Ini berisi konten sensitif.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Kamu memerlukan izin \"$manageChannelsPermissionLabel\" untuk mengedit izin ini.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Kamu memerlukan izin \"$manageRolesPermissionLabel\" untuk mengedit izin ini.';
  }

  @override
  String get channelSettingsUnknownRole => 'Peran tidak diketahui';

  @override
  String get channelSettingsUnknownUser => 'Pengguna tidak dikenal';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides => 'Penggantian akses';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Edit akses untuk $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Kembali ke penggantian';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Konfigurasi akses dasar untuk saluran ini';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Konfigurasi penggantian untuk peran ini';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Konfigurasi penggantian untuk anggota ini';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Cari izin…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Akses saluran diperbarui';

  @override
  String get channelSettingsPermissionsTitle => 'Kontrol akses';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Saluran ini disinkronkan dengan kategori induk ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Saluran ini tidak disinkronkan dengan kategori induk ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Sinkronkan dengan kategori';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Saluran disinkronkan dengan kategori induk';

  @override
  String get channelSettingsPermissionsAddOverride => 'Tambah penggantian';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Cari peran atau anggota…';

  @override
  String get channelSettingsPermissionsRolesAndMembers => 'Peran dan anggota';

  @override
  String get channelSettingsDeleteInvite => 'Hapus undangan';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Hapus undangan ini? Tidak dapat dibatalkan.';

  @override
  String get channelSettingsCopyInviteCode => 'Salin kode undangan';

  @override
  String get channelSettingsCopyInviteUrl => 'Salin URL undangan';

  @override
  String get channelSettingsWebhookCreated => 'Webhook dibuat';

  @override
  String get channelSettingsWebhookCreateFailed => 'Gagal membuat webhook';

  @override
  String get channelSettingsCreateWebhook => 'Buat webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Kelola tautan undangan untuk saluran ini.';

  @override
  String get channelSettingsInvitesCreate => 'Buat undangan';

  @override
  String get channelSettingsInvitesEmpty => 'Tidak ada tautan undangan';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Saluran ini belum memiliki tautan undangan. Buat tautan untuk mengundang orang ke saluran ini.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Terjadi error saat memuat tautan undangan untuk saluran ini. Coba lagi.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Kelola webhook masuk yang dapat mengirim pesan ke saluran ini.';

  @override
  String get channelSettingsWebhooksEmpty => 'Tidak ada webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Tidak ada webhook yang dikonfigurasi untuk saluran ini. Buat webhook agar aplikasi eksternal dapat mengirim pesan.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Saluran ini tidak mendukung webhook.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Anda memerlukan izin \"$permission\" untuk melihat dan mengedit webhook untuk saluran ini.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'Gagal memuat webhook';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Terjadi error saat memuat webhook untuk saluran ini. Coba lagi.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Dibuat oleh $creator pada $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Pengguna tidak dikenal';

  @override
  String get channelSettingsWebhooksAvatar => 'Avatar';

  @override
  String get channelSettingsWebhooksUploadImage => 'Unggah gambar';

  @override
  String get channelSettingsWebhooksRemove => 'Hapus';

  @override
  String get channelSettingsWebhooksName => 'Nama';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Nama webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Saluran';

  @override
  String get channelSettingsWebhooksUrl => 'URL webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Salin URL webhook';

  @override
  String get channelSettingsWebhooksDelete => 'Hapus webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'Tidak dapat menghapus webhook ini';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Hapus webhook ini? Tindakan ini tidak dapat dibatalkan.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'Coba lagi sebentar lagi.';

  @override
  String get channelMenuOpenChat => 'Buka obrolan';

  @override
  String get channelMenuDuplicateChannel => 'Duplikat saluran';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Setel ulang status persetujuan konten dewasa';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Hapus pesanmu di saluran ini?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Ini akan menghapus secara permanen semua pesan yang pernah kamu kirim di saluran ini. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Hapus pesan saya';

  @override
  String get channelMenuDeletedYourMessages => 'Pesan Anda telah dihapus';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Tidak dapat menghapus pesanmu';

  @override
  String get channelDetailsSystemMessage => 'Pesan sistem';

  @override
  String get channelDetailsTextChannel => 'Saluran teks';

  @override
  String get channelDetailsVoiceChannel => 'Saluran suara';

  @override
  String get channelDetailsCategory => 'Kategori';

  @override
  String get channelDetailsLinkChannel => 'Tautkan saluran';

  @override
  String get channelDetailsGenericChannel => 'Saluran';

  @override
  String get channelDetailsMutedConversation => 'Percakapan dibisukan';

  @override
  String get channelDetailsUnmutedConversation =>
      'Percakapan dibuka dari senyap';

  @override
  String get channelDetailsMutedChannel => 'Saluran dibisukan';

  @override
  String get channelDetailsUnmutedChannel => 'Saluran dibuka</div>';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Pengaturan notifikasi diperbarui';

  @override
  String get channelDetailsTabMembers => 'Anggota';

  @override
  String get channelDetailsTabPins => 'Sematan';

  @override
  String get channelDetailsActionMute => 'Bisukan';

  @override
  String get channelDetailsActionUnmute => 'Buka suara';

  @override
  String get channelDetailsActionSearch => 'Cari';

  @override
  String get channelDetailsActionMore => 'Lainnya';

  @override
  String get channelDetailsMembersEmptyTitle =>
      'Tidak ada anggota untuk ditampilkan';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Anggota akan muncul di sini setelah data komunitas dimuat.';

  @override
  String get memberListPermissionDeniedTitle =>
      'Kamu tidak dapat melihat anggota';

  @override
  String get memberListPermissionDeniedBody =>
      'Kamu tidak dapat melihat anggota saluran ini di komunitas ini';

  @override
  String get memberListUnavailableTitle => 'Daftar anggota tidak tersedia';

  @override
  String get memberListUnavailableBody =>
      'Daftar anggota sementara tidak tersedia di komunitas ini';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'Pin tidak dapat dimuat';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Anggota dengan izin \"Sematkan Pesan\" dapat menyematkan pesan agar dapat dilihat semua orang.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Anda dapat menyematkan pesan dalam percakapan ini agar dapat dilihat semua orang.';

  @override
  String get channelDetailsPinsEndReached => 'Kamu sudah mencapai akhir';

  @override
  String get channelHeaderOpenDetails => 'Buka detail saluran';

  @override
  String get channelHeaderPinnedMessages => 'Pesan tersemat';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'Pesan yang disematkan, belum dibaca';

  @override
  String get channelHeaderMemberList => 'Daftar anggota';

  @override
  String get channelHeaderInbox => 'Kotak masuk';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Pengaturan notifikasi, dibisukan';

  @override
  String get channelDetailsSearchTitle => 'Cari';

  @override
  String get channelDetailsSearchHint => 'Cari pesan';

  @override
  String get channelDetailsSearchFilterFrom => 'Dari';

  @override
  String get channelDetailsSearchFilterHas => 'Berisi';

  @override
  String get channelDetailsSearchFilterIn => 'Di';

  @override
  String get channelDetailsSearchFilterMentions => 'Sebutan';

  @override
  String get channelDetailsSearchFilterMore => 'Lainnya';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Aktif';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count channel';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count pengguna';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Pengguna';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel =>
      'Filter berdasarkan saluran';

  @override
  String get channelDetailsSearchChannelsHint => 'Cari saluran';

  @override
  String get channelDetailsSearchChannelsEmpty =>
      'Tidak ada saluran yang ditemukan';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Disematkan';

  @override
  String get channelDetailsSearchPinnedTrue => 'Hanya disematkan';

  @override
  String get channelDetailsSearchPinnedFalse => 'Kecualikan yang disematkan';

  @override
  String get channelDetailsSearchClearFilter => 'Hapus';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Jenis penulis';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Tanggal';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Mode tanggal';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Pilih tanggal';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Nama host link';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Nama file berisi';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Ekstensi file';

  @override
  String get channelDetailsSearchContentPoll => 'Polling';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Pesan dengan jajak pendapat';

  @override
  String get channelDetailsSearchContentForward => 'Teruskan';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Pesan diteruskan';

  @override
  String get channelDetailsSearchFilterSort => 'Urutkan';

  @override
  String get channelHeaderSearchFiltersTitle => 'Filter pencarian';

  @override
  String get channelHeaderSearchRecentTitle => 'Pencarian terbaru';

  @override
  String get channelHeaderSearchUsersTitle => 'Pengguna';

  @override
  String get channelHeaderSearchChannelsTitle => 'Saluran';

  @override
  String get channelHeaderSearchValuesTitle => 'Nilai';

  @override
  String get channelHeaderSearchDatesTitle => 'Tanggal';

  @override
  String get channelHeaderSearchDefaultBadge => 'Default';

  @override
  String get channelHeaderSearchClearHistory => 'Hapus';

  @override
  String get channelHeaderSearchFilterDescFrom => 'pengguna';

  @override
  String get channelHeaderSearchFilterDescMentions => 'pengguna';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'tautan, sematan, gambar, video, suara, file, stiker, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'tanggal atau rentang tanggal';

  @override
  String get channelHeaderSearchFilterDescOn => 'tanggal atau rentang tanggal';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'tanggal atau rentang tanggal';

  @override
  String get channelHeaderSearchFilterDescAfter =>
      'tanggal atau rentang tanggal';

  @override
  String get channelHeaderSearchFilterDescIn => 'saluran';

  @override
  String get channelHeaderSearchFilterDescPinned => 'benar atau salah';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'pengguna, bot, atau webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'nama host, contohnya example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'bagian dari nama file lampiran';

  @override
  String get channelHeaderSearchFilterDescFileType => 'ekstensi file, mis. png';

  @override
  String get channelHeaderSearchFilterDescSort =>
      'stempel waktu atau relevansi';

  @override
  String get channelHeaderSearchFilterDescOrder => 'naik atau turun';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString hasil',
      one: '1 hasil',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Filter berdasarkan pengguna';

  @override
  String get channelDetailsSearchFilterByContent => 'Filter berdasarkan konten';

  @override
  String get channelDetailsSearchSortBy => 'Urutkan hasil berdasarkan';

  @override
  String get channelDetailsSearchIn => 'Cari di';

  @override
  String get channelDetailsSearchEmptyTitle => 'Cari di percakapan ini';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Masukkan teks, penulis, atau filter konten untuk menemukan pesan.';

  @override
  String get channelDetailsSearchIndexingTitle => 'Pesan sedang diindeks';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Coba lagi segera setelah penelusuran selesai mengindeks cakupan ini.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Tidak ada hasil';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Coba istilah atau filter pencarian yang berbeda.';

  @override
  String get channelDetailsMembersOnline => 'Online';

  @override
  String get channelDetailsMembersOffline => 'Offline';

  @override
  String get channelDetailsMemberYou => 'Kamu';

  @override
  String get channelDetailsSearchUsersHint => 'Cari pengguna';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Ketik untuk mencari anggota';

  @override
  String get channelDetailsSearchUsersEmpty =>
      'Tidak ada pengguna yang ditemukan';

  @override
  String get channelDetailsSearchUsersNoAvailable =>
      'Tidak ada pengguna yang tersedia';

  @override
  String get channelDetailsDone => 'Selesai';

  @override
  String get channelDetailsHasFilterPrompt => 'Tampilkan pesan yang berisi:';

  @override
  String get channelDetailsRetry => 'Coba lagi';

  @override
  String get channelDetailsPinnedMessageTitle => 'Pesan yang disematkan';

  @override
  String get channelDetailsSearchResultTitle => 'Hasil Pencarian';

  @override
  String get channelDetailsJumpToMessage => 'Lompat ke pesan';

  @override
  String get channelDetailsUnpinMessage => 'Lepas sematan pesan';

  @override
  String get channelDetailsCopyMessageLink => 'Salin tautan pesan';

  @override
  String get channelDetailsCopyMessageId => 'Salin ID pesan';

  @override
  String get channelDetailsMessageUnpinned => 'Sematan pesan dilepas';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Komunitas saat ini';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'DM saat ini';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Semua komunitas';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Hanya semua DM';

  @override
  String get channelDetailsSearchScopeAllDms => 'Semua DM';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Hanya DM terbuka';

  @override
  String get channelDetailsSearchScopeOpenDms => 'DM terbuka';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Semua DM + komunitas';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'DM terbuka + komunitas';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Cari hanya di komunitas ini';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Cari hanya di DM ini';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Di semua Komunitas yang sedang Anda ikuti';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Hanya di semua DM yang pernah kamu ikuti';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Di semua DM yang pernah kamu ikuti';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Di semua DM yang sedang Anda buka saja';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Di semua DM yang sedang Anda buka';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Di semua DM yang pernah Anda ikuti + semua Komunitas yang sedang Anda ikuti';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Di semua DM yang sedang Anda buka + semua Komunitas yang sedang Anda ikuti';

  @override
  String get channelDetailsSearchSortNewest => 'Terbaru dulu';

  @override
  String get channelDetailsSearchSortOldest => 'Terlama dulu';

  @override
  String get channelDetailsSearchSortRelevance => 'Paling relevan';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Tampilkan pesan terbaru dulu';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Tampilkan pesan terlama dulu';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Tampilkan pesan paling relevan dulu';

  @override
  String get channelDetailsSearchContentImage => 'Unggah gambar';

  @override
  String get channelDetailsSearchContentVideo => 'Unggahan video';

  @override
  String get channelDetailsSearchContentAudio => 'Unggahan audio';

  @override
  String get channelDetailsSearchContentFile => 'Unggahan file';

  @override
  String get channelDetailsSearchContentLink => 'Tautan';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Pratinjau atau sematan tautan';

  @override
  String get channelDetailsSearchContentSticker => 'Stiker';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Hanya file gambar yang diunggah';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Hanya file video yang diunggah';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Hanya file audio yang diunggah';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Lampiran apa pun yang diunggah';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL yang diketik di teks pesan';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Pratinjau tautan dan sematan kaya, bukan unggahan';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Stiker terlampir pada pesan';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count jenis';
  }

  @override
  String get personalNotesTitle => 'Catatan pribadi';

  @override
  String get personalNotesSubtitle =>
      'Ruang pribadimu untuk catatan dan pengingat';

  @override
  String groupDmWelcome(String displayName) {
    return 'Selamat datang di $displayName. Tambahkan teman untuk memulai grup.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Edit grup';

  @override
  String get groupDmWelcomeAddFriends => 'Tambahkan teman ke grup';

  @override
  String get dmGroupInvites => 'Undangan';

  @override
  String get groupDmEditTitle => 'Edit grup';

  @override
  String get groupDmEditDetailsTooltip => 'Edit detail grup';

  @override
  String get groupDmGroupName => 'Nama grup';

  @override
  String get groupDmMyGroup => 'Grup saya';

  @override
  String get groupDmGroupNameMaxLength =>
      'Nama grup tidak boleh lebih dari 100 karakter';

  @override
  String get groupDmGroupIcon => 'Ikon grup';

  @override
  String get groupDmUploadIcon => 'Unggah ikon';

  @override
  String get groupDmChangeIcon => 'Ubah ikon';

  @override
  String get groupDmRemoveIcon => 'Hapus ikon';

  @override
  String get groupDmUpdated => 'Grup diperbarui';

  @override
  String get groupDmUpdateFailed => 'Gagal memperbarui grup. Coba lagi.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Ikon animasi tidak didukung. Gunakan gambar statis.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Ikon animasi tidak didukung';

  @override
  String get groupDmIconFileTooLargeTitle => 'Ukuran file ikon terlalu besar';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'File ikon terlalu besar. Pilih file yang ukurannya kurang dari $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'Format ikon tidak didukung';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Jenis file tidak didukung.';

  @override
  String get groupDmCouldntProcessImage => 'Tidak dapat memproses gambar';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Gagal memproses gambar yang dipotong. Coba lagi.';

  @override
  String get groupDmInvalidImage => 'Gambar tidak valid';

  @override
  String get groupDmInvalidImageBody => 'Gambar tidak valid. Coba gambar lain.';

  @override
  String get groupDmAddFriends => 'Tambah';

  @override
  String get groupDmOrSendInvite => 'atau kirim undangan ke teman:';

  @override
  String get groupDmGenerateInviteLink => 'Buat tautan undangan';

  @override
  String get groupDmCreateInvite => 'Buat';

  @override
  String get groupDmInviteExpires24Hours =>
      'Undanganmu kedaluwarsa dalam 24 jam';

  @override
  String get groupDmAddFriendFailed =>
      'Tidak dapat menambahkan teman ini ke grup. Silakan coba lagi.';

  @override
  String get groupDmAddFailed => 'Tidak dapat menambahkan ke grup';

  @override
  String get groupDmGroupFull =>
      'Grup ini penuh. Keluarkan seseorang sebelum menambahkan orang lain.';

  @override
  String get groupDmRateLimited =>
      'Kamu terlalu cepat. Tunggu sebentar dan coba lagi.';

  @override
  String get groupDmCreateInviteFailed => 'Tidak dapat membuat tautan undangan';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Tidak dapat membuat tautan undangan. Silakan coba lagi.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Gagal membuat tautan undangan. Coba lagi.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Anda tidak punya izin untuk membuat undangan di saluran ini.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Komunitas ini telah mencapai batas undangannya.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Pembuatan undangan untuk komunitas ini dinonaktifkan sementara.';

  @override
  String get groupDmCopyInviteFailed => 'Gagal menyalin tautan undangan';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Hanya pemilik grup yang dapat mengelola undangan.';

  @override
  String get groupDmNoInvitesCreated => 'Belum ada undangan yang dibuat';

  @override
  String get groupDmLoadingInvites => 'Memuat undangan...';

  @override
  String get groupDmInvitesLoadFailed => 'Gagal memuat undangan. Coba lagi.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Cabut undangan ini? Tidak dapat dibatalkan.';

  @override
  String get groupDmInviteRevoked => 'Undangan dicabut';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Dibuat oleh $name. Kedaluwarsa dalam $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Selamat datang di $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Pada mulanya, tidak ada apa-apa. Lalu, ada $channelName. Dan itu baik.';
  }

  @override
  String get personalNotesComposerHint => 'Kirim pesan ke diri Anda sendiri';

  @override
  String channelComposerHint(String channelName) {
    return 'Kirim pesan ke #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Kirim pesan ke @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Kirim pesan ke $groupName';
  }

  @override
  String get groupDmComposerHint => 'Grup pesan';

  @override
  String get composerHint => 'Pesan';

  @override
  String get composerOpenExpressionPicker => 'Buka pemilih ekspresi';

  @override
  String get composerShowKeyboard => 'Tampilkan keyboard';

  @override
  String get composerCloseAttachmentPanel => 'Tutup pemilih lampiran';

  @override
  String get chatAttachmentPanelPhotos => 'Foto';

  @override
  String get chatAttachmentPanelFiles => 'File';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Akses pustaka foto diperlukan';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Izinkan akses pustaka foto untuk menelusuri dan melampirkan foto dan video terbaru.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Buka pengaturan';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', sedang mengirim';

  @override
  String get messageAccessibilityFailedSuffix => ', gagal terkirim';

  @override
  String get messageAccessibilityAttachmentSummary => 'lampiran';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count lampiran';
  }

  @override
  String get messageAccessibilityImageSummary => 'gambar';

  @override
  String get messageAccessibilityVideoSummary => 'video';

  @override
  String get messageAccessibilityAudioSummary => 'file audio';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'stiker $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'file $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary => 'lampiran spoiler';

  @override
  String get messageAccessibilityEmbedSummary => 'sematan';

  @override
  String get messageAccessibilityEmptySummary => 'pesan';

  @override
  String get personalNotesPrivateSpace => 'Ruang pribadimu';

  @override
  String get purgePersonalNotes => 'Hapus catatan pribadi';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Ini akan menghapus permanen setiap pesan dan lampiran di catatan pribadi Anda. Tindakan ini tidak dapat dibatalkan.';

  @override
  String get purgePersonalNotesConfirmButton => 'Hapus';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Pesan $count dihapus dari catatan pribadi';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'Catatan pribadi sudah kosong';

  @override
  String get purgePersonalNotesFailed =>
      'Tidak dapat menghapus catatan pribadi';

  @override
  String get userSettingsGroupYourAccount => 'AKUN ANDA';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Cari setelan...';

  @override
  String get userSettingsSearchFieldLabel => 'Cari pengaturan';

  @override
  String get userSettingsSearchClear => 'Hapus pencarian';

  @override
  String get userSettingsSearchNoResults =>
      'Tidak ada pengaturan yang ditemukan';

  @override
  String get userSettingsNavProfile => 'Profil';

  @override
  String get userSettingsNavSecurityLogin => 'Keamanan & Login';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Hadiah';

  @override
  String get giftSettingsClaimAccountTitle => 'Klaim akunmu';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Klaim akun Anda untuk menukarkan atau mengelola kode hadiah Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Tukarkan hadiah';

  @override
  String get giftSettingsRedeemDescription =>
      'Masukkan kode hadiah untuk menukarkan Plutonium ke akun Anda.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Masukkan kode hadiah…';

  @override
  String get giftSettingsRedeemButton => 'Tukarkan';

  @override
  String get giftSettingsRedeemSuccess =>
      'Hadiah berhasil ditukarkan. Nikmati Plutonium Anda.';

  @override
  String get giftSettingsPurchasedTitle => 'Hadiah yang dibeli';

  @override
  String get giftSettingsPurchasedDescription =>
      'Kelola kode hadiah Plutonium yang telah Anda beli. Bagikan URL hadiah kepada seseorang yang spesial atau tukarkan untuk diri Anda sendiri!';

  @override
  String get giftSettingsEmptyTitle => 'Belum ada hadiah';

  @override
  String get giftSettingsEmptyDescription =>
      'Beli hadiah Plutonium dari tab Plutonium untuk dibagikan kepada teman.';

  @override
  String get giftSettingsGoToPlutonium => 'Buka Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Gagal memuat inventaris hadiah';

  @override
  String get giftSettingsLoadFailedDescription => 'Coba lagi nanti.';

  @override
  String get giftSettingsTryAgain => 'Coba lagi';

  @override
  String get giftSettingsGiftUrl => 'URL hadiah';

  @override
  String get giftSettingsCopy => 'Salin';

  @override
  String get giftSettingsCopied => 'Disalin';

  @override
  String get giftSettingsGiftUrlCopied => 'URL hadiah disalin ke papan klip!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Tidak dapat menyalin URL hadiah';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Dibeli $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Ditebus $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Ditebus oleh $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Hadiah ini sudah ditukarkan';

  @override
  String get giftSettingsRedeemForYourself => 'Tukarkan untuk diri sendiri';

  @override
  String get giftSettingsShareWithFriend => 'Bagikan ke teman';

  @override
  String get premiumPlutoniumTagline =>
      'Dapatkan batas lebih tinggi dan fitur eksklusif sambil mendukung platform komunikasi independen.';

  @override
  String get premiumPurchaseMode => 'Mode pembelian';

  @override
  String get premiumForMe => 'Untuk saya';

  @override
  String get premiumAsAGift => 'Sebagai hadiah';

  @override
  String get premiumMonthly => 'Bulanan';

  @override
  String get premiumYearly => 'Tahunan';

  @override
  String get premiumPerMonth => 'per bulan';

  @override
  String get premiumPerYear => 'per tahun';

  @override
  String get premiumOneTimePurchase => 'pembelian satu kali';

  @override
  String get premiumSave17 => 'Hemat 17%';

  @override
  String get premiumUpgradeNow => 'Upgrade sekarang';

  @override
  String get premiumBuyGift => 'Beli hadiah';

  @override
  String get premiumOneYearGift => 'Hadiah 1 tahun';

  @override
  String get premiumOneMonthGift => 'Hadiah 1 bulan';

  @override
  String get premiumMostPopular => 'Paling populer';

  @override
  String get premiumScrollPrompt =>
      'Gulir ke bawah untuk melihat semua keuntungan yang disertakan dengan Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Gratis vs Plutonium';

  @override
  String get premiumFreeColumn => 'Gratis';

  @override
  String get premiumGiftSectionTitle => 'Hadiah Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Bagikan pengalaman Plutonium dengan teman Anda dengan membeli langganan hadiah.';

  @override
  String get premiumGiftBannerOne =>
      'Anda punya kode hadiah baru yang menunggu!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Anda punya $count kode hadiah baru yang menunggu!';
  }

  @override
  String get premiumViewGifts => 'Lihat hadiah';

  @override
  String get premiumReadyToUpgrade => 'Siap upgrade?';

  @override
  String get premiumReadyToBuyGift => 'Siap membeli hadiah?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Bulanan $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Tahunan $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 tahun $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 bulan $price';
  }

  @override
  String get premiumManageSubscription => 'Kelola langganan';

  @override
  String get premiumRedeemGiftCode => 'Tukarkan kode hadiah';

  @override
  String get premiumGiftBadge => 'Hadiah';

  @override
  String get premiumCancelSubscriptionTitle => 'Batalkan langganan?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Kamu tetap mendapat semua keuntungan hingga tanggal perpanjangan berikutnya, lalu ada masa tenggang 3 hari untuk berlangganan lagi dan mempertahankan riwayat langgananmu.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Batalkan langganan';

  @override
  String get premiumKeepSubscription => 'Tetap berlangganan';

  @override
  String get premiumPurchaseHistoryTitle => 'Riwayat pembelian';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Tagihan terbaru Anda. Untuk mengubah metode pembayaran langganan Anda, tambahkan atau pilih salah satu di portal penagihan dan jadikan itu default.';

  @override
  String get premiumManagePaymentMethods => 'Kelola metode pembayaran';

  @override
  String get premiumBillingHistory => 'Riwayat penagihan';

  @override
  String get premiumSelfServeRefundTitle => 'Pengembalian dana mandiri';

  @override
  String get premiumSelfServeRefundButton => 'Kembalikan pembelian terakhir';

  @override
  String get premiumDisclaimerAgreementPrefix =>
      'Dengan membeli, Anda menyetujui ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Dengan membeli, Anda menyetujui ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' dan ';

  @override
  String premiumActiveUntil(String date) {
    return 'Aktif hingga $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Akan dibatalkan';

  @override
  String premiumCancelsOn(String date) {
    return 'Dibatalkan pada $date. Manfaat tetap aktif hingga saat itu.';
  }

  @override
  String get premiumReactivateSubscription => 'Aktifkan lagi';

  @override
  String premiumGiftedUntil(String date) {
    return 'Hadiah hingga $date. Tidak diperpanjang secara otomatis.';
  }

  @override
  String get premiumGiftGraceEnded =>
      'Waktu gratis Anda telah berakhir. Berlangganan untuk melanjutkan Plutonium.';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'Anda akan dikenakan biaya sekarang. Sisa waktu hadiah Anda ditambahkan setelah periode berbayar Anda, jadi tidak ada yang terbuang.';

  @override
  String get premiumComparisonFeatureColumn => 'Fitur';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Dengan membeli, kamu telah menyetujui $terms dan $privacy kami.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Pengembalian dana mandiri tersedia dalam 3 hari setelah pembayaran, sekali setiap 30 hari. Mengembalikan dana langganan akan membatalkannya. Pembeli di UE/EEA melepaskan hak penarikan 14 hari saat checkout untuk mengakses konten segera. Gunakan tombol pengembalian dana dalam aplikasi, bukan tolak bayar. Tolak bayar dapat membatasi akunmu secara permanen. Stripe menangani pembayaran dengan aman. Kami tidak pernah melihat nomor kartu lengkapmu.';

  @override
  String get premiumTermsOfService => 'Ketentuan layanan';

  @override
  String get premiumPrivacyPolicy => 'Kebijakan privasi';

  @override
  String get premiumCheckoutStartFailedTitle =>
      'Tidak dapat memulai pembayaran';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Terjadi kesalahan saat memulai pembayaran. Silakan coba lagi sebentar lagi.';

  @override
  String get premiumPlanUnavailable =>
      'Paket ini tidak tersedia. Hubungi dukungan.';

  @override
  String get premiumCompletePaymentTitle => 'Selesaikan pembayaran';

  @override
  String get premiumCompletePaymentBody =>
      'Anda sekarang diarahkan ke Stripe untuk menyelesaikan pembayaran. Kembali ke Fluxer setelah selesai.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Pilih metode pembayaran';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Bayar dengan Pix otomatis untuk mengotorisasi tagihan berulang langsung dari bank Brasil Anda. Atau pilih gunakan kartu untuk memasukkan kartu kredit di layar Stripe berikutnya.';

  @override
  String get premiumUsePix => 'Gunakan Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Bayar dengan UPI untuk menyiapkan e-mandat yang patuh pada RBI dari bank India Anda. Atau pilih gunakan kartu untuk memasukkan kartu kredit di layar Stripe berikutnya.';

  @override
  String get premiumUseUpi => 'Gunakan UPI';

  @override
  String get premiumUseCard => 'Gunakan kartu';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Tidak dapat membuka portal penagihan';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Terjadi kesalahan saat membuka portal penagihan. Silakan coba lagi sebentar lagi.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Kamu sudah menjadi Visionary';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary sudah mencakup akses permanen, jadi langganan berulang tidak diperlukan. Kamu masih bisa membeli hadiah untuk orang lain.';

  @override
  String get premiumExistingSubscriptionTitle => 'Langganan sudah ada';

  @override
  String get premiumExistingSubscriptionBody =>
      'Kami menemukan langganan Fluxer Plutonium yang sudah ada untuk akun ini. Kelola di portal penagihan aman untuk memperbarui detail pembayaran atau memeriksa status perpanjangan. Jika baru saja membayar, tunggu sebentar dan buka kembali halaman ini.';

  @override
  String get premiumPurchasesDisabledTitle => 'Pembelian tidak tersedia';

  @override
  String get premiumPurchasesDisabledBody =>
      'Pembelian dinonaktifkan untuk akun ini. Hubungi support@fluxer.app jika ini terlihat salah.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Klaim akun Anda untuk membeli Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Anda perlu memverifikasi email Anda sebelum dapat membeli Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Tag nama pengguna khusus';

  @override
  String get premiumPerkPerCommunityProfiles => 'Profil per komunitas';

  @override
  String get premiumPerkMessageScheduling => 'Penjadwalan pesan';

  @override
  String get premiumPerkProfileBadge => 'Lencana profil';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Latar belakang video khusus';

  @override
  String get premiumPerkEntranceSounds => 'Suara masuk';

  @override
  String get premiumPerkCommunities => 'Komunitas';

  @override
  String get premiumPerkMessageCharacterLimit => 'Batas karakter pesan';

  @override
  String get premiumPerkBookmarkedMessages => 'Pesan di bookmark';

  @override
  String get premiumPerkFileUploadSize => 'Ukuran unggahan file';

  @override
  String get premiumPerkEmojiStickerPacks => 'Paket emoji & stiker';

  @override
  String get premiumPerkSavedMedia => 'Media tersimpan';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Gunakan emoji animasi';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Akses emoji & stiker global';

  @override
  String get premiumPerkVideoQuality => 'Kualitas video';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Avatar & banner profil animasi';

  @override
  String get premiumPerkEarlyAccess => 'Akses awal ke fitur baru';

  @override
  String get premiumPerkCustomThemes => 'Tema kustom';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Hingga 4K/60fps';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly atau $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/bln';

  @override
  String get storePlutoniumYearSuffix => '/thn';

  @override
  String get storePlutoniumPriceOr => 'atau';

  @override
  String get storePlutoniumEmojiTitle => 'Emoji Anda, di mana saja';

  @override
  String get storePlutoniumEmojiBody =>
      'Bawa emoji dan stiker kustom dari komunitas mana pun ke setiap chat dan komunitas tempat Anda berada.';

  @override
  String get storePlutoniumProfileTitle => 'Profil yang menonjol';

  @override
  String get storePlutoniumProfileBody =>
      'Dapatkan avatar dan banner animasi, lencana pelanggan, tag empat digit yang Anda inginkan setelah nama pengguna Anda*, dan profil terpisah untuk setiap komunitas.';

  @override
  String get storePlutoniumFilesTitle => 'Kirim file hingga 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'Bagikan video berdurasi penuh dan file besar tanpa mengecilkannya terlebih dahulu. Akun gratis dapat mengirim hingga 25 MB.';

  @override
  String get storePlutoniumCompareTitle => 'Bandingkan Gratis dan Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'Tidak semua fitur ini ada di aplikasi seluler. Beberapa hanya tersedia di desktop.';

  @override
  String get storePlutoniumNotAvailable => 'Tidak tersedia';

  @override
  String get storePlutoniumAvailable => 'Tersedia';

  @override
  String get storePlutoniumCompareTag =>
      'Pilih 4 digit angka setelah nama pengguna Anda*';

  @override
  String get storePlutoniumCompareProfile =>
      'Profil terpisah untuk setiap komunitas';

  @override
  String get storePlutoniumCompareBadge => 'Lencana pelanggan di profil Anda';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'Latar belakang panggilan video yang bisa Anda simpan';

  @override
  String get storePlutoniumCompareCommunities =>
      'Komunitas yang bisa Anda ikuti';

  @override
  String get storePlutoniumCompareCharacters => 'Karakter dalam satu pesan';

  @override
  String get storePlutoniumCompareBookmarks => 'Pesan yang dapat Anda tandai';

  @override
  String get storePlutoniumCompareUpload =>
      'File terbesar yang dapat Anda unggah';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'Item media yang bisa Anda simpan nanti';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'Gunakan emoji animasi dalam pesan';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'Gunakan emoji dan stiker kustom di komunitas mana pun';

  @override
  String get storePlutoniumCompareVideo =>
      'Kualitas panggilan video dan berbagi layar';

  @override
  String get storePlutoniumCompareAvatar => 'Avatar dan banner profil animasi';

  @override
  String get storePlutoniumCompareEarlyAccess => 'Akses awal ke fitur baru';

  @override
  String get storePlutoniumCompareThemes => 'Tema kustom untuk aplikasi';

  @override
  String get storePlutoniumVideoFree => 'Hingga 720p pada 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'Hingga 4K pada 60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      'Anda hanya dapat memilih tag yang belum dimiliki oleh orang lain dengan nama pengguna yang sama. Nama pengguna tidak peka huruf besar/kecil, jadi Mina#4821 dan mina#4821 dianggap sama. Tag #0000 dicadangkan untuk anggota Fluxer Visionary.';

  @override
  String get storePlutoniumLearnVisionary =>
      'Pelajari lebih lanjut tentang Visionary.';

  @override
  String get storePlutoniumDonatePrompt =>
      'Hanya ingin mendukung pengembangan sumber terbuka Fluxer? ';

  @override
  String get storePlutoniumDonateLink => 'Donasi saja.';

  @override
  String get storePlutoniumHighlightsLead =>
      'Berlangganan mendanai Fluxer dan membuka kunci';

  @override
  String get storePlutoniumHighlightEmoji =>
      'Emoji dan stiker kustom di chat mana pun';

  @override
  String get storePlutoniumHighlightProfile =>
      'Profil animasi, lencana, dan nomor 4 digit kustom';

  @override
  String get storePlutoniumHighlightFiles => 'Unggah hingga 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'Kirim pesan hingga 4.000 karakter';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'Profil terpisah untuk setiap komunitas';

  @override
  String get storePlutoniumHighlightsMore => 'Dan lainnya';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'Diperbarui secara otomatis melalui Google Play sampai Anda membatalkan.';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'Diperbarui secara otomatis melalui App Store sampai Anda membatalkan.';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'Anda sudah memiliki langganan Fluxer Plutonium.';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'Hemat $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'Pembelian diterima. Plutonium akan muncul di sini setelah aktif.';

  @override
  String get storePlutoniumUnavailable =>
      'Langganan dalam aplikasi belum tersedia di perangkat ini.';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary sudah termasuk akses permanen, jadi langganan berulang tidak diperlukan.';

  @override
  String get userSettingsNavPrivacyDashboard => 'Dasbor Privasi';

  @override
  String get userSettingsNavAuthorizedApps => 'Aplikasi yang diotorisasi';

  @override
  String get userSettingsNavBlockedUsers => 'Pengguna yang diblokir';

  @override
  String get userSettingsNavLinkedDevices => 'Perangkat tertaut';

  @override
  String get userSettingsNavConnections => 'Koneksi';

  @override
  String get userSettingsNavLookAndFeel => 'Tampilan & Nuansa';

  @override
  String get userSettingsNavAccessibility => 'Aksesibilitas';

  @override
  String get userSettingsNavChat => 'Obrolan';

  @override
  String get userSettingsNavAudioAndVideo => 'Audio & video';

  @override
  String get userSettingsNavShortcuts => 'Pintasan';

  @override
  String get audioAndVideoAudioSectionTitle => 'Audio';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Atur mikrofon, speaker, dan pemrosesan suara Anda.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Atur kualitas kamera dan berbagi layar Anda.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle =>
      'Perilaku saat panggilan';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Kontrol permintaan konfirmasi selama panggilan suara dan video.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Perangkat input';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Perangkat output';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Default';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Gunakan speaker';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Saat nonaktif, audio akan diputar melalui earpiece atau headphone yang terhubung.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Volume input';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Volume output';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Pemrosesan suara';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Suara terfokus';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Direkomendasikan. Membersihkan mikrofonmu agar suara lebih jernih.';

  @override
  String get audioAndVideoDirectInputLabel => 'Input langsung';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Mengirim audiomu tanpa perubahan. Paling cocok jika kamu menggunakan perangkat lunak audio eksternal.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Kustom';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Sesuaikan sendiri setiap pengaturan: peredam bising, pembatalan gema, dan penguatan.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Peredam bising';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Ditingkatkan';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Standar';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Tidak ada';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Pembatalan gema';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Kontrol penguatan otomatis';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Meratakan volume mikrofon Anda. Mati saat penekanan yang ditingkatkan aktif.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Tes mikrofon';

  @override
  String get audioAndVideoMicTestStartLabel => 'Mulai tes mikrofon';

  @override
  String get audioAndVideoMicTestStopLabel => 'Hentikan tes mikrofon';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName memerlukan akses mikrofon untuk menguji masukan Anda.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Kamera';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Cerminkan kamera';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Kualitas kamera';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Kualitas berbagi layar';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Laju bingkai';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return '1080p dan 60 FPS memerlukan $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Instans ini saat ini mengizinkan berbagi layar hingga 720p pada 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName memerlukan akses mikrofon untuk menampilkan daftar perangkatmu.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName memerlukan akses kamera untuk menampilkan daftar perangkatmu.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Jangan tanya saat menyembunyikan kamera saya';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Jangan tanya saat menyembunyikan berbagi layar saya';

  @override
  String get userSettingsNavNotifications => 'Notifikasi';

  @override
  String get notificationsGeneralSectionTitle => 'Umum';

  @override
  String get notificationsEnableNotificationsLabel => 'Aktifkan notifikasi';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Dapatkan notifikasi saat kamu menerima pesan. Kamu mungkin perlu mengizinkan notifikasi untuk $productName di pengaturan perangkatmu. Untuk kontrol per saluran/per komunitas, buka pengaturan notifikasi dari menu komunitas.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Aktifkan notifikasi desktop';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Menggunakan pusat notifikasi OS. Untuk kontrol per-saluran/per-komunitas, klik kanan ikon komunitas dan buka pengaturan notifikasi.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Aktifkan notifikasi browser';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Dapatkan notifikasi saat kamu menerima pesan. Kamu mungkin perlu mengizinkan notifikasi di pengaturan browsermu. Untuk kontrol per saluran/per komunitas, klik kanan ikon komunitas dan buka pengaturan notifikasi.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Batas waktu tidak aktif untuk notifikasi push';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName menghindari pengiriman notifikasi push ke perangkat selulermu saat kamu sedang di depan komputer. Pilih berapa lama kamu harus tidak aktif di desktop sebelum menerima notifikasi push.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute menit';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes menit';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Preferensi sebutan';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Preferensi sebutan balasan';

  @override
  String get notificationsMentionNoPreferenceName => 'Tidak ada preferensi';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Ikuti keinginan pengirim, tanpa peringatan saat mereka mengaktifkan atau menonaktifkan sebutan @';

  @override
  String get notificationsMentionPreferMentionName => 'Pakai @sebutan';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Balasan secara default menyertakan @sebutan untukmu, dan pengirim akan diperingatkan jika mereka menonaktifkannya';

  @override
  String get notificationsMentionPreferNoMentionName => 'Tanpa @sebutan';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Balasan secara default menghilangkan @sebutan, dan pengirim akan diperingatkan jika mereka mengaktifkannya';

  @override
  String get notificationsTtsSectionTitle => 'Notifikasi teks ke suara';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Aktifkan pemutaran suara /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Biarkan /tts membacakan pesanmu. Menonaktifkan pengaturan ini akan membuat perintah tersebut menjadi teks biasa.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Sesuaikan kecepatan pemutaran di ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Aksesibilitas';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'Narasi pesan otomatis';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Mengubah konten masuk menjadi ucapan, terlepas dari apakah konten tersebut berasal dari /tts.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Setiap saluran';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Biarkan setiap pesan masuk dibacakan, terlepas dari saluran mana yang sedang dibuka.';

  @override
  String get notificationsTtsModeCurrentChannelName => 'Hanya saluran aktif';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Hanya menarasikan saluran yang sedang kamu lihat. Narasi akan mengikuti kamu saat berpindah saluran.';

  @override
  String get notificationsTtsModeNeverName => 'Tidak pernah otomatis';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Tetap diam kecuali seseorang menjalankan /tts secara manual.';

  @override
  String get notificationsTtsModeAriaLabel =>
      'Ucapkan semua pesan dengan lantang';

  @override
  String get notificationsSoundsSectionTitle => 'Suara';

  @override
  String get notificationsMasterVolumeLabel => 'Volume utama';

  @override
  String get notificationsMasterVolumeDescription =>
      'Mengatur level untuk setiap efek suara. Penggantian per suara mengabaikan ini.';

  @override
  String get notificationsResetToDefaultVolume =>
      'Setel ulang ke volume default';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Nonaktifkan semua suara notifikasi';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Pengaturan suara notifikasimu yang sudah ada akan dipertahankan.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Tampilkan lebih banyak efek suara';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Tampilkan lebih sedikit efek suara';

  @override
  String get notificationsPreviewSound => 'Pratinjau suara';

  @override
  String get notificationsPerSoundVolumeTitle => 'Volume per suara';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Atur volume khusus untuk masing-masing suara. Suara yang tidak memiliki pengaturan khusus akan mengikuti volume utama.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Jumlah pengaturan volume suara khusus yang aktif: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Mengikuti master • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Setel ulang $label ke volume utama';
  }

  @override
  String get notificationsResetAllOverrides => 'Setel ulang semua penggantian';

  @override
  String notificationsMuteSound(String label) {
    return 'Bisukan $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Bunyikan $label';
  }

  @override
  String get notificationsSoundMessage => 'Notifikasi pesan komunitas';

  @override
  String get notificationsSoundDirectMessage => 'Notifikasi pesan langsung';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Notifikasi pesan saluran saat ini';

  @override
  String get notificationsSoundMute => 'Bisukan mikrofon';

  @override
  String get notificationsSoundUnmute => 'Aktifkan mikrofon';

  @override
  String get notificationsSoundDeaf => 'Bisukan suara masuk';

  @override
  String get notificationsSoundUndeaf => 'Aktifkan suara masuk';

  @override
  String get notificationsSoundUserJoin => 'Pengguna bergabung ke saluran';

  @override
  String get notificationsSoundUserLeave => 'Pengguna meninggalkan saluran';

  @override
  String get notificationsSoundUserMove => 'Pengguna memindahkan saluran';

  @override
  String get notificationsSoundViewerJoin => 'Penonton bergabung ke siaran';

  @override
  String get notificationsSoundViewerLeave => 'Penonton meninggalkan siaran';

  @override
  String get notificationsSoundVoiceDisconnect => 'Panggilan suara terputus';

  @override
  String get notificationsSoundIncomingRing => 'Panggilan masuk';

  @override
  String get notificationsSoundCameraOn => 'Kamera aktif';

  @override
  String get notificationsSoundCameraOff => 'Kamera mati';

  @override
  String get notificationsSoundScreenShareStart => 'Berbagi layar dimulai';

  @override
  String get notificationsSoundScreenShareStop => 'Berbagi layar berhenti';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Tidak dapat memperbarui batas waktu notifikasi push. Coba lagi.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Tidak dapat memperbarui preferensi sebutan. Coba lagi.';

  @override
  String get notificationsPermissionDeniedTitle => 'Notifikasi diblokir';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Tidak dapat mengaktifkan notifikasi. Izinkan izin notifikasi untuk melanjutkan.';

  @override
  String get notificationsPushRelaySectionTitle => 'Relai notifikasi push';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider hanya mengirim notifikasi push lewat layanannya sendiri, jadi notifikasi untuk perangkat ini melewati relai Fluxer.';
  }

  @override
  String get notificationsPushRelayConsentLabel => 'Gunakan relai push Fluxer';

  @override
  String get notificationsPushRelayConsentDescription =>
      'Menonaktifkan ini menghapus pendaftaran push perangkat ini, sehingga perangkat berhenti menerima notifikasi push.';

  @override
  String get pushRelayConsentTitle => 'Relai notifikasi push';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider hanya mengirim notifikasi push lewat layanannya sendiri, jadi notifikasi untuk perangkat ini melewati relai Fluxer.';
  }

  @override
  String get pushRelayConsentNoticePrefix => 'Setujui ';

  @override
  String get pushRelayConsentNoticeLink => 'pemberitahuan privasi relai push';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' untuk mengaktifkan notifikasi push di perangkat ini. Kamu hanya perlu menyetujui sekali per perangkat.';

  @override
  String get pushRelayConsentAgree => 'Setujui dan lanjutkan';

  @override
  String get pushRelayConsentDecline => 'Nanti saja';

  @override
  String get userSettingsNavLanguageAndTime => 'Bahasa & Waktu';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Bahasa antarmuka';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Pilih bahasa yang digunakan di seluruh aplikasi';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Buka pengaturan bahasa';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Format waktu';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Pilih cara waktu ditampilkan di seluruh aplikasi';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'Pilihan format waktu';

  @override
  String get languageAndTimeTimeFormatAuto => 'Otomatis';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 jam';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 jam';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Format waktu bahasa aplikasi: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Format waktu sistem: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Gunakan lokal sistem untuk format waktu';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Gagal memperbarui format waktu';

  @override
  String get userSettingsNavDefaultApps => 'Aplikasi Default';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Peramban Web';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Pilih peramban yang terbuka saat Anda mengetuk tautan.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Jika sebuah aplikasi terinstal untuk sebuah situs, tautan akan dibuka di aplikasi tersebut terlebih dahulu.';

  @override
  String get defaultAppsWebBrowserInApp => 'Peramban dalam aplikasi';

  @override
  String get defaultAppsWebBrowserExternal => 'Peramban eksternal';

  @override
  String get userSettingsNavAppIcon => 'Ikon aplikasi';

  @override
  String get appIconSectionTitle => 'Ikon aplikasi';

  @override
  String get appIconSectionDescription =>
      'Pilih ikon yang muncul di layar utama Anda.';

  @override
  String get appIconOptionDefault => 'Default';

  @override
  String get appIconOptionStarfield => 'Bidang bintang';

  @override
  String get appIconOptionSweden => 'Swedia';

  @override
  String get appIconUnsupported =>
      'Mengganti ikon aplikasi tidak tersedia di perangkat ini.';

  @override
  String get userSettingsNavAdvanced => 'Lanjutan';

  @override
  String get advancedPerformanceReportingTitle => 'Pelaporan performa';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Bantu tingkatkan $productName dengan membagikan data kerusakan dan performa anonim.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Kirim laporan kerusakan dan performa';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Semua data yang dilaporkan bersifat anonim dan hanya dikirim ke layanan pemantauan $productName sendiri — tidak ada penyedia pihak ketiga yang digunakan.';
  }

  @override
  String get advancedSettingsConfigure => 'Konfigurasi';

  @override
  String get advancedSettingsCategoryPrivacy => 'Privasi';

  @override
  String get advancedSettingsCategoryAppearance => 'Tampilan';

  @override
  String get advancedSettingsCategoryAccessibility => 'Aksesibilitas';

  @override
  String get advancedSettingsCategoryChat => 'Obrolan';

  @override
  String get advancedSettingsCategoryMedia => 'Media';

  @override
  String get advancedSettingsCategoryVoice => 'Suara';

  @override
  String get advancedSettingsCategoryDeveloper => 'Pengembang';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'Aktifkan pemilihan teks';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Izinkan memilih teks di aplikasi';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Aktifkan thumbnail saat menggeser video';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Gambar mini atau bingkai langsung saat menggeser video';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Umpan balik haptik';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Umpan balik getaran untuk ketukan dan tindakan. Tidak akan disinkronkan di seluruh perangkat.';

  @override
  String get advancedSettingShowNekoLabel => 'Tampilkan Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Kucing Neko yang mengejar kursormu';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Tampilkan Neko di input chat Anda';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Animasi zoom splash';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Perkecil logo saat keluar dari layar pembuka';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Petunjuk keyboard';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Petunjuk pintasan keyboard di tooltip';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Aktifkan favorit';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Tampilkan favorit di seluruh aplikasi';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Perilaku bergabung ke saluran suara';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Konfirmasi atau klik dua kali untuk bergabung dengan saluran suara komunitas';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Wajibkan klik ganda untuk bergabung ke saluran suara';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Konfirmasi sebelum bergabung ke saluran suara';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Kirim GIF secara otomatis saat dipilih';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Kirim GIF secara otomatis dari pemilih tanpa konfirmasi';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Simpan GIF favorit sebagai media tersimpan';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Pilih cara favorit GIF berbintang disimpan';

  @override
  String get advancedSettingMediaButtonsLabel => 'Tombol media';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Sesuaikan tombol dan indikator mana yang muncul pada lampiran dan sematan';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Unggah lampiran sebelum mengirim';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Mulai unggah lampiran segera setelah ditambahkan ke kotak pesan';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Hapus parameter pelacakan dari URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Hapus parameter pelacakan secara otomatis dari URL di pesan yang kamu kirim';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Percayai semua tautan eksternal';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Lewati peringatan tautan eksternal untuk semua domain';

  @override
  String get advancedSettingSearchEnginesLabel => 'Mesin pencari';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Konfigurasi mesin pencari yang digunakan dari teks yang dipilih';

  @override
  String get advancedSettingTranslatorsLabel => 'Penerjemah';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Konfigurasi penyedia terjemahan yang digunakan dari teks yang dipilih';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Pencarian gambar terbalik';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Penyedia pencarian gambar terbalik';

  @override
  String get advancedSettingMessageActionBarLabel => 'Bilah tindakan pesan';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Sesuaikan bilah tindakan yang muncul saat mengarahkan kursor ke pesan';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Pelengkapan otomatis ekspresi';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Pilih apa yang muncul saat kamu mengetik titik dua di input pesan';

  @override
  String get advancedSettingInputButtonsLabel => 'Tombol input pesan';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Pilih tombol mana yang ditampilkan di input pesan';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Gulir ke bawah saat mengirim pesan';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Pilih cara obrolan bergulir setelah kamu mengirim pesan';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Lewati konfirmasi \"Tandai semua sudah dibaca\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Langsung tandai semua saluran kotak masuk yang belum dibaca sebagai sudah dibaca, tanpa meminta konfirmasi';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Sembunyikan saluran yang dibisukan secara default';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Sembunyikan saluran yang kamu bisukan dari bilah sisi komunitas';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Tampilkan indikator GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Tampilkan indikator kedaluwarsa lampiran';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Tampilkan tombol hapus';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Tampilkan tombol unduh';

  @override
  String get advancedSettingShowMediaFavoriteLabel =>
      'Tampilkan tombol favorit';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Tampilkan tombol sembunyikan sematan';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Tampilkan bilah tindakan pesan';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel =>
      'Tampilkan hanya tombol lainnya';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Tampilkan reaksi cepat';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'Aktifkan Shift untuk memperluas';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Tampilkan emoji default di pelengkapan otomatis ekspresi';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Tampilkan emoji kustom di pelengkapan otomatis ekspresi';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Tampilkan stiker di pelengkapan otomatis ekspresi';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Tampilkan media tersimpan di pelengkapan otomatis ekspresi';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Tampilkan tombol GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Tampilkan tombol media';

  @override
  String get advancedSettingShowStickersButtonLabel =>
      'Tampilkan tombol stiker';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'Tampilkan tombol emoji';

  @override
  String get advancedSettingShowSendButtonLabel => 'Tampilkan tombol kirim';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Tampilkan peringatan perangkat baru';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Tanya saat ada perangkat audio baru';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Kontrol volume koneksi';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Tampilkan penggeser volume peserta per perangkat di menu suara';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Perilaku pratinjau berbagi layar';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Pratinjau, pop-out, dan perilaku gambar mini streaming';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Codec berbagi layar';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Codec video untuk berbagi layar';

  @override
  String get advancedSettingScreenShareCodecAuto => 'Otomatis (disarankan)';

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
      'Jeda pratinjau berbagi layar saya di latar belakang';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Sembunyikan gambar mini pratinjau streaming saya';

  @override
  String get advancedSettingDeveloperModeLabel => 'Aktifkan mode pengembang';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Aktifkan mode pengembang';

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
  String get advancedSettingTranslatorGoogle => 'Terjemahan Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel => 'Mesin pencari default';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Pilih mesin pencari yang digunakan secara default saat mencari teks yang dipilih.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => 'Mesin pencari bawaan';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Aktifkan atau nonaktifkan mesin pencari bawaan. Mesin yang diaktifkan akan muncul di menu konteks pesan saat teks dipilih.';

  @override
  String get advancedSettingCustomSearchEnginesLabel => 'Mesin pencari khusus';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Tambahkan mesin pencari Anda sendiri dengan pola URL kustom. Gunakan \'$query\' sebagai placeholder untuk teks pencarian.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Tambah mesin pencari';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Aktifkan setidaknya satu mesin pencari di bawah.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Hapus mesin pencari';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Penerjemah default';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Pilih penerjemah yang digunakan secara default saat menerjemahkan teks yang dipilih.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Penerjemah bawaan';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Aktifkan atau nonaktifkan penerjemah bawaan. Penerjemah yang diaktifkan akan muncul di menu konteks pesan saat teks dipilih.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Penerjemah khusus';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Tambahkan penerjemah Anda sendiri dengan pola URL kustom. Gunakan \'$query\' sebagai placeholder untuk teks yang akan diterjemahkan.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Tambah penerjemah';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Aktifkan setidaknya satu penerjemah di bawah.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Hapus penerjemah';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Pencarian gambar terbalik default';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Pilih layanan pencarian gambar terbalik yang digunakan secara default saat mencari gambar.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Pencarian gambar terbalik bawaan';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Aktifkan atau nonaktifkan penyedia pencarian gambar terbalik bawaan. Penyedia yang diaktifkan akan muncul di menu konteks gambar, avatar, banner, stiker, dan emoji.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Pencarian gambar terbalik khusus';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Tambahkan penyedia pencarian gambar terbalik Anda sendiri dengan pola URL kustom. Gunakan \'$url\' sebagai placeholder untuk URL gambar.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Tambahkan pencarian gambar terbalik';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Aktifkan setidaknya satu penyedia pencarian gambar terbalik di bawah.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Hapus pencarian gambar terbalik';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Tambah mesin pencari';

  @override
  String get advancedSettingEditSearchEngineTitle => 'Edit mesin pencari';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Tambahkan penyedia terjemahan';

  @override
  String get advancedSettingEditTranslatorTitle => 'Edit penyedia terjemahan';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Tambahkan mesin pencari gambar terbalik';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Edit mesin pencari gambar terbalik';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Nama';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Pola URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Mesin pencari saya';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Penerjemah saya';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Pencarian gambar terbalik saya';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Gunakan \'$query\' tempat teks penelusuran akan disisipkan.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Gunakan \'$query\' tempat teks yang akan diterjemahkan harus disisipkan.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Gunakan \'$url\' tempat URL gambar akan disisipkan.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Nama wajib diisi.';

  @override
  String get advancedSettingSearchProviderUrlRequired =>
      'Pola URL wajib diisi.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Pola URL harus berisi placeholder \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Pola URL harus berisi placeholder \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Pola URL harus berupa URL yang valid.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Tambah';

  @override
  String get advancedSettingEditSearchProviderAction => 'Edit';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Hapus';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Yakin Anda ingin menghapus $engineName?';
  }

  @override
  String get userSettingsNavApplications => 'Aplikasi';

  @override
  String get userSettingsNavAppLogs => 'Log Aplikasi';

  @override
  String get userSettingsNavDeveloperTools => 'Alat pengembang';

  @override
  String get userSettingsNavLimitsConfig => 'Konfigurasi Batas';

  @override
  String get userSettingsNavFeatureFlags => 'Fitur';

  @override
  String get userSettingsNavWhatsNew => 'Yang baru';

  @override
  String get userSettingsJoinFluxerLabs => 'Gabung Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Lisensi Aplikasi';

  @override
  String get userSettingsAppLicensesDescription =>
      'Perangkat lunak sumber terbuka yang digunakan oleh aplikasi ini. Aplikasi ini dibuat dengan Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Lisensi aplikasi tidak dapat dimuat.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count lisensi',
      one: '1 lisensi',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Keluar';

  @override
  String get userSettingsLogOutConfirmTitle => 'Keluar?';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'Kamu dapat masuk kembali kapan saja.';

  @override
  String get quickSwitcherTabSearch => 'Cari';

  @override
  String get quickSwitcherTabFriends => 'Teman';

  @override
  String get quickSwitcherSearchPlaceholder =>
      'Cari saluran, orang, atau komunitas';

  @override
  String get quickSwitcherSearchFriends => 'Cari teman';

  @override
  String get quickSwitcherNoMatchesFound => 'Tidak ada yang cocok';

  @override
  String get quickSwitcherEmptyHint =>
      'Coba nama lain atau gunakan awalan @ / # / ! / * untuk memfilter hasil.';

  @override
  String get quickSwitcherSectionPeople => 'Orang';

  @override
  String get quickSwitcherSectionGroupMessages => 'Pesan grup';

  @override
  String get quickSwitcherSectionTextChannels => 'Saluran teks';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Saluran suara';

  @override
  String get quickSwitcherSectionCommunities => 'Komunitas';

  @override
  String get quickSwitcherSectionSettings => 'Pengaturan';

  @override
  String get quickSwitcherHomeLabel => 'Beranda';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Pesan langsung';

  @override
  String get quickSwitcherFavoritesLabel => 'Favorit';

  @override
  String get quickSwitcherUserSettingsLabel => 'Pengaturan pengguna';

  @override
  String get quickSwitcherNotificationsLabel => 'Notifikasi';

  @override
  String get quickSwitcherBookmarksLabel => 'Bookmark';

  @override
  String get savedMessagesEmptyTitle => 'Tidak ada bookmark';

  @override
  String get savedMessagesEmptyBody =>
      'Simpan pesan ke bookmark untuk dibaca nanti.';

  @override
  String get savedMessagesEndBody =>
      'Tidak ada lagi yang bisa dilihat di sini.';

  @override
  String get savedMessagesRemoveTooltip => 'Hapus bookmark';

  @override
  String get savedMessagesAddedToast => 'Ditambahkan ke bookmark';

  @override
  String get savedMessagesRemovedToast => 'Dihapus dari bookmark';

  @override
  String get quickSwitcherMentionsLabel => 'Sebutan';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Belum ada teman';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Tambahkan teman untuk memulai.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Tidak ada teman yang cocok dengan pencarian itu';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Coba nama lain.';

  @override
  String get quickSwitcherSearchAliasUser => 'Pengguna';

  @override
  String get quickSwitcherSearchAliasYou => 'Kamu';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Chat pribadi';

  @override
  String get quickSwitcherSearchAliasMessages => 'Pesan';

  @override
  String get quickSwitcherSearchAliasFav => 'Favorit';

  @override
  String get quickSwitcherSearchAliasStarred => 'Ditandai';

  @override
  String get quickSwitcherSearchAliasInbox => 'Kotak masuk';

  @override
  String get quickSwitcherSearchAliasSaved => 'Tersimpan';

  @override
  String get uiClose => 'Tutup';

  @override
  String get chatJumpToBottom => 'Lompat ke bawah';

  @override
  String get uiConfirm => 'Konfirmasi';

  @override
  String get uiLoading => 'Memuat';

  @override
  String get uiSearch => 'Cari';

  @override
  String get uiStartCall => 'Mulai panggilan';

  @override
  String get uiStartVideoCall => 'Mulai panggilan video';

  @override
  String get uiPlay => 'Putar';

  @override
  String get uiPause => 'Jeda';

  @override
  String get uiDownload => 'Unduh';

  @override
  String get uiMoreActions => 'Tindakan lainnya';

  @override
  String get uiUnsavedChanges => 'Perubahan belum disimpan';

  @override
  String get uiReset => 'Setel ulang';

  @override
  String get uiOpenColorPicker => 'Buka pemilih warna';

  @override
  String get uiSelectPlaceholder => 'Pilih';

  @override
  String get uiSearchPlaceholder => 'Cari';

  @override
  String get uiNoOptionsFound => 'Tidak ada opsi yang ditemukan';

  @override
  String get uiDismissNotification => 'Tutup notifikasi';

  @override
  String get uiColorPickerTitle => 'Pemilih warna';

  @override
  String get mentionConfirmTitle => 'Sebut semua orang?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Ini akan memberi tahu $count anggota. Lanjutkan?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Ini akan memberi tahu $count anggota yang sedang online. Lanjutkan?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Ini akan memberi tahu $count anggota dengan peran $roleName. Lanjutkan?';
  }

  @override
  String get mentionConfirmButton => 'Sebut';

  @override
  String get composerEmojiUnavailable =>
      'Anda tidak dapat menggunakan emoji itu di sini.';

  @override
  String get instanceUrlLabel => 'URL Instans';

  @override
  String get instanceUrlPlaceholder =>
      'Masukkan URL instance (contoh: fluxer.app)';

  @override
  String get instanceUrlHelper =>
      'Use fluxer.app for the official instance, or the exact URL of a self-hosted instance.';

  @override
  String get resetToDefaultInstance => 'Atur ulang ke Fluxer';

  @override
  String get instanceConnect => 'Sambungkan';

  @override
  String get instanceConnecting => 'Menyambungkan…';

  @override
  String get instanceConnectFailed => 'Gagal terhubung ke instance';

  @override
  String get recentInstances => 'Instance terbaru';

  @override
  String removeRecentInstance(String domain) {
    return 'Hapus $domain dari instance terbaru';
  }

  @override
  String get instanceSheetTitle => 'Hubungkan ke instance';

  @override
  String get changeInstance => 'Ubah';

  @override
  String get instanceConnectionRequired => 'Hubungkan ke instance untuk masuk';

  @override
  String get comingSoon => 'Segera hadir';

  @override
  String get guildNavbarDirectMessages => 'Pesan langsung';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Jelajahi Komunitas yang Dapat Ditemukan';

  @override
  String get discoveryExplore => 'Jelajahi';

  @override
  String get discoveryExplorePublicCommunities => 'Jelajahi komunitas publik';

  @override
  String get discoveryListingSubheading =>
      'Ingin mendaftarkan komunitas Anda di sini? Ajukan jika Anda memenuhi persyaratan di pengaturan komunitas Anda > Penemuan.';

  @override
  String get discoverySearchCommunities => 'Cari komunitas';

  @override
  String get discoveryFilterByLanguage => 'Filter berdasarkan bahasa';

  @override
  String get discoveryAllLanguages => 'Semua bahasa';

  @override
  String get discoveryAllCategories => 'Semua';

  @override
  String get discoveryCategoryGaming => 'Game';

  @override
  String get discoveryCategoryMusic => 'Musik';

  @override
  String get discoveryCategoryEntertainment => 'Hiburan';

  @override
  String get discoveryCategoryEducation => 'Edukasi';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Sains & teknologi';

  @override
  String get discoveryCategoryContentCreator => 'Kreator konten';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Film & TV';

  @override
  String get discoveryCategoryOther => 'Lainnya';

  @override
  String get discoveryNoCommunitiesMatch => 'Tidak ada komunitas yang cocok.';

  @override
  String get discoveryJoinCommunity => 'Gabung komunitas';

  @override
  String get discoveryJoined => 'Sudah bergabung';

  @override
  String discoveryOnlineCount(String count) {
    return '$count online';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString anggota',
      one: '1 anggota',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Tidak ada deskripsi.';

  @override
  String get discoveryCommunities => 'Komunitas';

  @override
  String get discoveryApps => 'Aplikasi';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Tidak dapat bergabung dengan komunitas ini';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Terjadi kesalahan. Silakan coba lagi sebentar lagi.';

  @override
  String get discoveryJoinErrorFullTitle => 'Komunitas ini sudah penuh';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Komunitas ini telah mencapai batas anggotanya, jadi kamu tidak bisa bergabung sekarang.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Kamu sudah mencapai batas komunitas';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Kamu sudah bergabung dengan jumlah maksimum komunitas. Keluar dari salah satunya lalu coba lagi.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Kamu tidak dapat bergabung dengan komunitas ini';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Kamu telah diblokir dari komunitas ini.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Komunitas ini tidak lagi tersedia';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Mungkin komunitas ini sudah keluar dari Discovery atau tidak lagi menerima anggota baru. Segarkan halaman dan kamu tidak akan melihatnya lagi.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Kamu terlalu cepat';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Harap tunggu sebentar dan coba lagi.';

  @override
  String get guildNavbarAddCommunity => 'Tambahkan komunitas';

  @override
  String get guildNavbarHelp => 'Bantuan';

  @override
  String get scrollIndicatorNew => 'BARU';

  @override
  String get scrollIndicatorNewMessage => 'PESAN BARU';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Ciutkan $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'dipilih';

  @override
  String get guildNavbarGuildUnread => 'belum dibaca';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count sebutan',
      one: '1 sebutan',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'dibisukan';

  @override
  String get authShowPassword => 'Tampilkan kata sandi';

  @override
  String get authHidePassword => 'Sembunyikan kata sandi';

  @override
  String get authCheckStillWorking => 'Masih dikerjakan…';

  @override
  String get authVerificationFailed =>
      'Verifikasi tidak dapat diselesaikan. Coba lagi.';

  @override
  String get chatLoadingMessages => 'Memuat pesan';

  @override
  String get friendsMessageFriend => 'Pesan';

  @override
  String get friendsFriendActions => 'Tindakan teman';

  @override
  String get friendsAcceptRequest => 'Terima permintaan pertemanan';

  @override
  String get friendsDeclineRequest => 'Tolak permintaan pertemanan';

  @override
  String get friendsCancelRequest => 'Batalkan permintaan pertemanan';

  @override
  String get friendsOpenInbox => 'Kotak masuk';

  @override
  String get profileRemoveFriend => 'Hapus teman';

  @override
  String get profileUnblockUser => 'Buka blokir pengguna';

  @override
  String get profileAcceptFriendRequest => 'Terima permintaan pertemanan';

  @override
  String get profileCancelFriendRequest => 'Batalkan permintaan pertemanan';

  @override
  String get profileSendFriendRequest => 'Tambah teman';

  @override
  String get accountOverflowMenu => 'Opsi akun';

  @override
  String get navHome => 'Beranda';

  @override
  String get navNotifications => 'Notifikasi';

  @override
  String get navYou => 'Kamu';

  @override
  String get guildFolderSettingsTitle => 'Pengaturan folder';

  @override
  String get guildFolderNameLabel => 'Nama folder';

  @override
  String get guildFolderColorLabel => 'Warna folder';

  @override
  String get guildFolderShowIconWhenCollapsed =>
      'Tampilkan ikon saat diciutkan';

  @override
  String get guildFolderIconLabel => 'Ikon folder';

  @override
  String get guildFolderDelete => 'Hapus folder';

  @override
  String get guildFolderIconFolder => 'Folder';

  @override
  String get guildFolderIconStar => 'Bintang';

  @override
  String get guildFolderIconHeart => 'Hati';

  @override
  String get guildFolderIconBookmark => 'Bookmark';

  @override
  String get guildFolderIconGameController => 'Pengontrol game';

  @override
  String get guildFolderIconShield => 'Perisai';

  @override
  String get guildFolderIconMusicNote => 'Not musik';

  @override
  String get guildFolderMarkAsRead => 'Tandai folder sebagai sudah dibaca';

  @override
  String get guildBulkMuteCommunities => 'Bisukan komunitas';

  @override
  String get guildBulkUnmuteCommunities => 'Bunyikan komunitas';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Pengaturan notifikasi komunitas';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Pengaturan privasi komunitas';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Izinkan @everyone dan @here';

  @override
  String get guildBulkAllowRoleMentions => 'Izinkan sebutan peran';

  @override
  String get guildBulkEnableMobilePush => 'Aktifkan notifikasi push seluler';

  @override
  String get guildBulkDisableMobilePush =>
      'Nonaktifkan notifikasi push seluler';

  @override
  String get guildBulkAllowDirectMessages => 'Izinkan pesan langsung';

  @override
  String get guildBulkBlockDirectMessages => 'Blokir pesan langsung';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Izinkan pesan langsung dari bot';

  @override
  String get guildBulkBlockBotDirectMessages => 'Blokir pesan langsung bot';

  @override
  String get guildNavbarGroupDm => 'DM grup';

  @override
  String get guildNavbarCreateChannel => 'Buat saluran';

  @override
  String get guildNavbarChannelType => 'Jenis saluran';

  @override
  String get guildNavbarTextChannel => 'Saluran teks';

  @override
  String get guildNavbarTextChannelDescription =>
      'Kirim pesan, gambar, GIF, dan emoji';

  @override
  String get guildNavbarVoiceChannel => 'Saluran suara';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Ngobrol bareng pakai suara, video, dan berbagi layar';

  @override
  String get guildNavbarLinkChannel => 'Tautkan Saluran';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Akses cepat ke situs web atau sumber daya eksternal';

  @override
  String get guildNavbarNameLabel => 'Nama';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Pilih jenis saluran';

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
  String get guildNavbarCreateCategory => 'Buat kategori';

  @override
  String get guildNavbarNewCategoryHint => 'Kategori baru';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Undang teman ke $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Penerima akan dibawa ke #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Cari teman';

  @override
  String get guildNavbarNoFriendsYet => 'Belum ada teman';

  @override
  String get guildNavbarNoResults => 'Tidak ada hasil';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Atau, kirim tautan undangan ke teman:';

  @override
  String get guildNavbarInviteLink => 'Tautan undangan';

  @override
  String get guildNavbarCopy => 'Salin';

  @override
  String get guildNavbarCopied => 'Disalin!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Tautan undangan Anda kedaluwarsa dalam 7 hari.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Tautan undangan ini tidak akan kedaluwarsa.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Tautan undangan Anda kedaluwarsa dalam $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Edit tautan undangan';

  @override
  String get guildNavbarInviteLinkSettings => 'Pengaturan tautan undangan';

  @override
  String get guildNavbarExpireAfter => 'Kedaluwarsa setelah';

  @override
  String get guildNavbarMaxUses => 'Jumlah penggunaan maksimal';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Berikan Keanggotaan Sementara';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Anggota akan dihapus saat offline kecuali peran diberikan';

  @override
  String get guildNavbarCreateNewLink => 'Buat tautan baru';

  @override
  String get guildNavbarSent => 'Terkirim';

  @override
  String get guildNavbarInvite => 'Undang';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Tinggalkan komunitas';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Apakah Anda yakin ingin meninggalkan komunitas ini? Anda tidak akan dapat melihat pesan apa pun lagi.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Tinggalkan komunitas';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Hapus pesanmu di komunitas ini?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Hapus permanen semua pesan yang Anda kirim di sini, di semua saluran. Tidak dapat dibatalkan.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Hapus pesan saya';

  @override
  String get guildNavbarDeletedYourMessages => 'Pesan Anda telah dihapus';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Tidak dapat menghapus pesanmu';

  @override
  String get guildNavbarRemoveOverride => 'Hapus penggantian';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Dibisukan hingga $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Hanya dapat diakses oleh staf $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Undangan saat ini dijeda di komunitas ini';

  @override
  String get guildNavbarDurationNever => 'tidak pernah';

  @override
  String get guildNavbarDuration30Minutes => '30 menit';

  @override
  String get guildNavbarDuration1Hour => '1 jam';

  @override
  String get guildNavbarDuration6Hours => '6 jam';

  @override
  String get guildNavbarDuration12Hours => '12 jam';

  @override
  String get guildNavbarDuration1Day => '1 hari';

  @override
  String get guildNavbarDuration7Days => '7 hari';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count detik';
  }

  @override
  String get guildNavbarNever => 'Tidak pernah';

  @override
  String get guildNavbarNoLimit => 'Tanpa batas';

  @override
  String get guildNavbarOneUse => '1 kali pakai';

  @override
  String guildNavbarUses(int count) {
    return '$count penggunaan';
  }

  @override
  String get guildMenuMarkAsRead => 'Tandai sudah dibaca';

  @override
  String get guildPeekMoreOptions => 'Opsi lainnya';

  @override
  String get guildMenuInviteMembers => 'Undang anggota';

  @override
  String get guildMenuCommunitySettings => 'Pengaturan komunitas';

  @override
  String get guildMenuEditCommunityProfile => 'Edit profil komunitas';

  @override
  String get guildMenuUnmuteCommunity => 'Bunyikan komunitas';

  @override
  String get guildMenuMuteCommunity => 'Bisukan komunitas';

  @override
  String get guildMenuHideMutedChannels => 'Sembunyikan saluran yang dibisukan';

  @override
  String get guildMenuReportCommunity => 'Laporkan komunitas';

  @override
  String get guildMenuDebugCommunity => 'Debug komunitas';

  @override
  String get guildMenuCopyCommunityId => 'Salin ID komunitas';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Hingga $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Umum';

  @override
  String get guildMenuSettingsRoles => 'Peran & Izin';

  @override
  String get guildMenuSettingsEmoji => 'Emoji';

  @override
  String get guildMenuSettingsStickers => 'Stiker';

  @override
  String get guildMenuSettingsSafetyModeration => 'Keamanan & Moderasi';

  @override
  String get guildMenuSettingsActivityLog => 'Log aktivitas';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL Undangan Kustom';

  @override
  String get guildMenuSettingsDiscovery => 'Discovery';

  @override
  String get guildMenuSettingsMembers => 'Anggota';

  @override
  String get guildMenuSettingsInviteLinks => 'Undangan';

  @override
  String get guildMenuSettingsBans => 'Pemblokiran';

  @override
  String get guildMenuSettingsChannels => 'Saluran';

  @override
  String get guildSettingsNoPermission =>
      'Anda tidak punya izin untuk melihat tab pengaturan ini.';

  @override
  String get guildSettingsOverviewIconTitle => 'Ikon';

  @override
  String get guildSettingsUploadImage => 'Unggah gambar';

  @override
  String get guildSettingsOverviewBannerTitle => 'Banner';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Unggah banner untuk server Anda.';

  @override
  String get guildSettingsOverviewNameTitle => 'Nama';

  @override
  String get guildSettingsOverviewNameHint => 'Komunitas saya yang keren';

  @override
  String get guildSettingsOverviewStatsTitle => 'Statistik';

  @override
  String get guildSettingsOverviewMembers => 'Anggota';

  @override
  String get guildSettingsOverviewOnline => 'Online';

  @override
  String get guildSettingsRolesDescription =>
      'Gunakan peran untuk mengelompokkan anggota dan memberikan izin.';

  @override
  String get guildSettingsCreateRole => 'Buat peran';

  @override
  String get guildSettingsRolesListTitle => 'Peran';

  @override
  String get guildSettingsRolesNewRole => 'Peran baru';

  @override
  String get guildSettingsRolesDeleteRole => 'Hapus peran';

  @override
  String get guildSettingsRolesBackToRoles => 'Kembali ke peran';

  @override
  String get guildSettingsBackToSettings => 'Kembali ke pengaturan';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Edit \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Konfigurasi pengaturan dan izin peran';

  @override
  String get guildSettingsRolesDisplaySection => 'Tampilan';

  @override
  String get guildSettingsRolesRoleName => 'Nama peran';

  @override
  String get guildSettingsRolesRoleColor => 'Warna peran';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Ketik warna (hex, rgb(), hsl(), atau nama) atau gunakan pemilih.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Tampilkan peran ini secara terpisah';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Mencantumkan anggota dengan peran ini di bagiannya sendiri dalam daftar anggota.';

  @override
  String get guildSettingsRolesAllowMentions =>
      'Izinkan sebutan untuk peran ini';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Anggota dengan izin \"$permission\" selalu dapat menyebut peran, terlepas dari pengaturan ini.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Gunakan tombol ini untuk menghapus semua izin dengan cepat.';

  @override
  String get guildSettingsRolesClearPermissions => 'Hapus izin';

  @override
  String get guildSettingsRolesPermissionsSection => 'Izin';

  @override
  String get guildSettingsRolesSearchPermissions => 'Cari izin';

  @override
  String get guildSettingsRolesDenseLayout => 'Tata letak rapat';

  @override
  String get guildSettingsRolesComfyLayout => 'Tata letak nyaman';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Beralih ke tata letak rapat';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Beralih ke tata letak nyaman';

  @override
  String get guildSettingsRolesSingleColumn => 'Satu kolom';

  @override
  String get guildSettingsRolesTwoColumns => 'Dua kolom';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'Beralih ke satu kolom';

  @override
  String get guildSettingsRolesSwitchToTwoColumns => 'Beralih ke dua kolom';

  @override
  String get guildSettingsRolesNoPermissionsFound =>
      'Tidak ada izin yang ditemukan';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Urutan hoist khusus';

  @override
  String get guildSettingsRolesHoistOrder => 'Urutan hoist';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Setel ulang ke default';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Seret peran untuk menyesuaikan urutan kemunculannya di daftar anggota.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Tidak ada peran yang ditampilkan terpisah. Aktifkan \"Tampilkan peran ini secara terpisah\" pada sebuah peran untuk melihatnya di sini.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Anda tidak dapat mengedit peran ini karena ini adalah peran tertinggi Anda atau di atas Anda';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Anda memerlukan izin \"$permission\" untuk mengedit izin ini';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Kamu tidak dapat mengedit peran yang setara atau di atas peran tertinggimu';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Kamu tidak dapat memberikan izin yang tidak kamu miliki';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Anda tidak dapat menghapus izin ini karena akan menghapusnya dari diri Anda sendiri';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'Peran berhasil diperbarui';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Peran berhasil dibuat';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Peran berhasil dihapus';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Urutan hoist diatur ulang ke default';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Nama peran wajib diisi';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Beri nama peran sebelum menyimpan.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Tidak dapat membuat peran';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Tidak dapat memperbarui peran';

  @override
  String get guildSettingsRolesDeleteFailedTitle =>
      'Tidak dapat menghapus peran';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" tidak dapat dihapus. Coba lagi.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Tidak dapat mengatur ulang urutan tampilan';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Coba lagi sebentar lagi.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Yakin Anda ingin menghapus peran $name? Anggota mana pun dengan peran ini tidak akan memilikinya lagi.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Seluruh komunitas';

  @override
  String get permissionCategoryMessagesMedia => 'Pesan & media';

  @override
  String get permissionCategoryModeration => 'Moderasi';

  @override
  String get permissionCategoryChannelAccess => 'Akses saluran';

  @override
  String get permissionCategoryChannelManagement => 'Manajemen saluran';

  @override
  String get permissionCategoryAudioVideo => 'Audio & video';

  @override
  String get permissionUnknown => 'Izin tidak dikenal';

  @override
  String get permissionAdministrator => 'Administrator';

  @override
  String get permissionAdministratorDescription =>
      'Memberikan semua izin dan melewati pembatasan saluran. Sangat sensitif.';

  @override
  String get permissionViewActivityLog => 'Lihat log aktivitas';

  @override
  String get permissionViewActivityLogDescription =>
      'Melihat log aktivitas komunitas tentang perubahan dan tindakan moderasi.';

  @override
  String get permissionManageCommunity => 'Kelola komunitas';

  @override
  String get permissionManageCommunityDescription =>
      'Edit pengaturan global seperti nama, deskripsi, dan ikon.';

  @override
  String get permissionManageRoles => 'Kelola peran';

  @override
  String get permissionManageRolesDescription =>
      'Buat, edit, atau hapus peran di bawah peran tertinggimu. Juga memungkinkan pengeditan penimpaan izin saluran.';

  @override
  String get permissionManageChannels => 'Kelola saluran';

  @override
  String get permissionManageChannel => 'Kelola saluran';

  @override
  String get permissionManageChannelDescription =>
      'Ganti nama dan edit pengaturan saluran ini.';

  @override
  String get permissionManagePermissions => 'Kelola izin';

  @override
  String get permissionManagePermissionsDescription =>
      'Edit penimpaan untuk peran dan anggota di saluran ini.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Buat, edit, atau hapus webhook untuk saluran ini.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Lihat daftar anggota untuk saluran ini.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Kelola tautan undangan untuk saluran ini.';

  @override
  String get permissionOverwriteDeny => 'Tolak';

  @override
  String get permissionOverwriteInherit => 'Netral (ikuti pengaturan)';

  @override
  String get permissionOverwriteAllow => 'Izinkan';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Gunakan tombol ini untuk mengatur semua izin dengan cepat.';

  @override
  String get permissionManageChannelsDescription =>
      'Buat, edit, atau hapus saluran dan kategori.';

  @override
  String get permissionKickMembers => 'Keluarkan anggota';

  @override
  String get permissionBanMembers => 'Blokir anggota';

  @override
  String get permissionCreateInviteLinks => 'Buat tautan undangan';

  @override
  String get permissionChangeOwnNickname => 'Ubah nama panggilan sendiri';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Perbarui nama panggilanmu sendiri.';

  @override
  String get permissionManageNicknames => 'Kelola nama panggilan';

  @override
  String get permissionManageNicknamesDescription =>
      'Ubah nama panggilan anggota lain.';

  @override
  String get permissionCreateEmojiStickers => 'Buat emoji & stiker';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Unggah emoji dan stiker baru, serta kelola kreasimu sendiri.';

  @override
  String get permissionManageEmojiStickers => 'Kelola emoji & stiker';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Edit atau hapus emoji dan stiker yang dibuat oleh anggota lain.';

  @override
  String get permissionManageWebhooks => 'Kelola webhook';

  @override
  String get permissionManageWebhooksDescription =>
      'Buat, edit, atau hapus webhook.';

  @override
  String get permissionSendMessages => 'Kirim pesan';

  @override
  String get permissionSendTtsMessages => 'Kirim pesan TTS';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Kirim pesan text-to-speech.';

  @override
  String get permissionManageMessages => 'Kelola pesan';

  @override
  String get permissionManageMessagesDescription =>
      'Hapus pesan anggota lain. Penyematan diatur secara terpisah.';

  @override
  String get permissionPinMessages => 'Sematkan pesan';

  @override
  String get permissionEmbedLinks => 'Sematkan tautan';

  @override
  String get permissionAttachFiles => 'Lampirkan file';

  @override
  String get permissionMentionEveryone => 'Gunakan @everyone/@here dan @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'Sebut semua orang atau peran apa pun (meskipun peran tersebut tidak disetel agar dapat disebut).';

  @override
  String get permissionUseExternalEmoji => 'Gunakan emoji eksternal';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Gunakan emoji dari komunitas lain.';

  @override
  String get permissionUseExternalStickers => 'Gunakan stiker eksternal';

  @override
  String get permissionAddReactions => 'Tambahkan reaksi';

  @override
  String get permissionAddReactionsDescription =>
      'Tambahkan reaksi baru ke pesan.';

  @override
  String get permissionBypassSlowmode => 'Lewati mode lambat';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Abaikan batas laju pesan per saluran.';

  @override
  String get permissionTimeOutMembers => 'Beri batas waktu anggota';

  @override
  String get permissionTimeOutMembersDescription =>
      'Mencegah anggota mengirim pesan, bereaksi, dan bergabung ke saluran suara selama durasi tertentu.';

  @override
  String get permissionViewChannel => 'Lihat saluran';

  @override
  String get permissionViewChannelMembers => 'Lihat anggota saluran';

  @override
  String get permissionViewChannelMembersDescription =>
      'Lihat daftar anggota untuk saluran di komunitas ini.';

  @override
  String get permissionConnect => 'Sambungkan';

  @override
  String get permissionSpeak => 'Bicara';

  @override
  String get permissionStreamVideo => 'Streaming video';

  @override
  String get permissionUseVoiceActivity => 'Gunakan aktivitas suara';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Tanpa izin ini, push-to-talk wajib digunakan.';

  @override
  String get permissionPrioritySpeaker => 'Pembicara prioritas';

  @override
  String get permissionMuteMembers => 'Bisukan anggota';

  @override
  String get permissionDeafenMembers => 'Bisukan suara masuk anggota';

  @override
  String get permissionMoveMembers => 'Pindahkan anggota';

  @override
  String get permissionMoveMembersDescription =>
      'Seret anggota antar saluran yang dapat mereka akses.';

  @override
  String get permissionSetVoiceRegion => 'Atur wilayah suara';

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
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount emoji statis, $animatedCount emoji animasi terpakai';
  }

  @override
  String get guildSettingsEmojiEmpty => 'Belum ada emoji kustom.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count stiker diunggah';
  }

  @override
  String get guildSettingsStickersEmpty => 'Belum ada stiker kustom.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Verifikasi anggota';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Pilih apa yang harus dimiliki anggota sebelum mereka dapat memposting atau mengirim DM ke anggota komunitas.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Anggota dengan peran dapat melewati pemeriksaan ini. Untuk ruang publik, kami sarankan untuk mengaktifkan verifikasi.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Komunitas yang terdaftar di Discovery memerlukan setidaknya email terverifikasi. Tidak ada yang tidak dapat dipilih saat Discovery diaktifkan.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Konten dewasa & peringatan konten';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Konfigurasikan pelabelan konten dewasa dan peringatan konten opsional untuk anggota.';

  @override
  String get guildSettingsModerationMatureToggle => 'Konten dewasa';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Tandai komunitas ini sebagai berisi konten dewasa.';

  @override
  String get guildSettingsVerificationNone => 'Tidak ada';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Tidak perlu verifikasi.';

  @override
  String get guildSettingsVerificationLow => 'Rendah';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Memerlukan alamat email terverifikasi.';

  @override
  String get guildSettingsVerificationMedium => 'Sedang';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Membutuhkan alamat email terverifikasi, dan akun yang berusia minimal 5 menit.';

  @override
  String get guildSettingsVerificationHigh => 'Tinggi';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Memerlukan semua yang ada di tingkat sedang, ditambah menjadi anggota komunitas setidaknya selama 10 menit.';

  @override
  String get guildSettingsVerificationHighest => 'Sangat tinggi';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Memerlukan nomor telepon terverifikasi.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Lacak tindakan moderator di seluruh komunitas.';

  @override
  String get guildSettingsAuditLogEmpty => 'Belum ada log';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Tindakan moderasi dan perubahan komunitas akan muncul di sini.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Semua pengguna';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Semua tindakan';

  @override
  String get guildSettingsAuditLogNoReason =>
      'Tidak ada alasan yang diberikan.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Pengguna tidak dikenal';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Terjadi kesalahan saat memuat log aktivitas.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Tidak dapat memuat log aktivitas';

  @override
  String get guildSettingsAuditLogReason => 'Alasan';

  @override
  String get guildSettingsAuditLogSomeone => 'seseorang';

  @override
  String get guildSettingsAuditLogSomething => 'sesuatu';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'entitas tidak dikenal';

  @override
  String get guildSettingsAuditLogNothing => 'tidak ada';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Target tidak diketahui';

  @override
  String get auditLogActionGuildUpdate => 'Komunitas diperbarui';

  @override
  String get auditLogActionChannelCreate => 'Saluran dibuat';

  @override
  String get auditLogActionChannelUpdate => 'Saluran diperbarui';

  @override
  String get auditLogActionChannelDelete => 'Saluran dihapus';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Timpa saluran ditambahkan';

  @override
  String get auditLogActionChannelOverwriteUpdate =>
      'Timpaan saluran diperbarui';

  @override
  String get auditLogActionChannelOverwriteDelete => 'Timpaan saluran dihapus';

  @override
  String get auditLogActionMemberKick => 'Anggota dikeluarkan';

  @override
  String get auditLogActionMemberPrune => 'Anggota dihapus';

  @override
  String get auditLogActionMemberBanAdd => 'Anggota diblokir';

  @override
  String get auditLogActionMemberBanRemove => 'Pemblokiran anggota dibatalkan';

  @override
  String get auditLogActionMemberUpdate => 'Anggota diperbarui';

  @override
  String get auditLogActionMemberRoleUpdate => 'Peran anggota diperbarui';

  @override
  String get auditLogActionMemberMove => 'Anggota dipindahkan';

  @override
  String get auditLogActionMemberDisconnect => 'Anggota diputus dari suara';

  @override
  String get auditLogActionBotAdd => 'Bot ditambahkan';

  @override
  String get auditLogActionRoleCreate => 'Peran dibuat';

  @override
  String get auditLogActionRoleUpdate => 'Peran diperbarui';

  @override
  String get auditLogActionRoleDelete => 'Peran dihapus';

  @override
  String get auditLogActionInviteCreate => 'Undangan dibuat';

  @override
  String get auditLogActionInviteUpdate => 'Undangan diperbarui';

  @override
  String get auditLogActionInviteDelete => 'Undangan dihapus';

  @override
  String get auditLogActionWebhookCreate => 'Webhook dibuat';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook diperbarui';

  @override
  String get auditLogActionWebhookDelete => 'Webhook dihapus';

  @override
  String get auditLogActionEmojiCreate => 'Emoji dibuat';

  @override
  String get auditLogActionEmojiUpdate => 'Emoji diperbarui';

  @override
  String get auditLogActionEmojiDelete => 'Emoji dihapus';

  @override
  String get auditLogActionStickerCreate => 'Stiker dibuat';

  @override
  String get auditLogActionStickerUpdate => 'Stiker diperbarui';

  @override
  String get auditLogActionStickerDelete => 'Stiker dihapus';

  @override
  String get auditLogActionMessageDelete => 'Pesan dihapus';

  @override
  String get auditLogActionMessageBulkDelete => 'Pesan dihapus';

  @override
  String get auditLogActionMessagePin => 'Pesan disematkan';

  @override
  String get auditLogActionMessageUnpin => 'Sematan pesan dilepas';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor memperbarui pengaturan komunitas.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor membuat saluran $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor memperbarui saluran $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor menghapus saluran $target.';
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
    return '$actor menambahkan izin saluran untuk $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor menambahkan izin saluran untuk $target di $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor memperbarui izin saluran untuk $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor memperbarui izin saluran untuk $target di $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor menghapus izin saluran untuk $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor menghapus izin saluran untuk $target di $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor mengeluarkan $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor memblokir $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor mengeluarkan $target dari daftar blokir.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor memperbarui $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor memperbarui peran untuk $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor membersihkan anggota tidak aktif.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor menghapus anggota yang tidak aktif selama $days hari.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor memindahkan $target ke saluran suara lain.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor memindahkan $target ke $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor memutuskan sambungan $target dari suara.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor menambahkan bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor membuat peran $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor memperbarui peran $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor menghapus peran $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor membuat undangan $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor membuat undangan $target untuk $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor memperbarui undangan $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor memperbarui undangan $target untuk $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor menghapus undangan $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor menghapus undangan $target untuk $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor membuat webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor memperbarui webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor menghapus webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor menambahkan emoji $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor memperbarui emoji $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor menghapus emoji $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor menambahkan stiker $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor memperbarui stiker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor menghapus stiker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor menghapus pesan.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor menghapus pesan di $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor menghapus beberapa pesan.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor menghapus $count pesan.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor menghapus beberapa pesan di $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor menghapus $count pesan di $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor menyematkan pesan.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor menyematkan pesan di $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor mengeluarkan pesan dari sematan.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor menghapus sematan pesan di $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor melakukan tindakan audit pada $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Mengubah $field dari $oldValue ke $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Ubah $field menjadi $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Menghapus $field (sebelumnya $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Diperbarui $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Mengganti nama komunitas menjadi $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Memperbarui ikon komunitas.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Mengganti nama saluran menjadi $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Menghapus topik.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Mengubah topik menjadi $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Konten dewasa diaktifkan.';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'Konten dewasa dinonaktifkan.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Ubah nama panggilan menjadi $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Menghapus nama panggilan $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Membisukan anggota.';

  @override
  String get auditLogChangeUnmutedMember => 'Membatalkan pembungkaman anggota.';

  @override
  String get auditLogChangeDeafenedMember => 'Meredam anggota.';

  @override
  String get auditLogChangeUndeafenedMember =>
      'Membatalkan pembungkaman anggota.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Menambahkan $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Menghapus $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Saluran: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Pesan: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Diundang oleh $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Menghapus # pesan.',
      one: 'Menghapus # pesan.',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Menghapus # anggota.',
      one: 'Menghapus # anggota.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Undangan ini tidak akan kedaluwarsa.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Memberikan keanggotaan sementara.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Memberikan keanggotaan permanen.';

  @override
  String get guildSettingsLoadMore => 'Muat lainnya';

  @override
  String get guildSettingsLoadingMore => 'Memuat...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Lihat dan kelola setiap webhook yang dikonfigurasi di seluruh komunitasmu.';

  @override
  String get guildSettingsWebhooksEmpty => 'Tidak ada webhook';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Komunitas ini belum memiliki webhook. Buka $channelSettingsPath untuk membuatnya.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Anda memerlukan izin \"$permission\" untuk melihat dan mengedit webhook untuk komunitas ini.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'Gagal memuat webhook';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Terjadi error saat memuat webhook. Coba lagi.';

  @override
  String get guildSettingsWebhooksUpdated => 'Webhook diperbarui';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'Gagal memperbarui webhook';

  @override
  String get guildSettingsUnknownChannel => 'Saluran tidak dikenal';

  @override
  String get guildSettingsCopyUrl => 'Salin URL';

  @override
  String get guildSettingsCopiedUrl => 'URL disalin ke papan klip';

  @override
  String get guildSettingsDeleteWebhook => 'Hapus webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Atur tautan undangan kustom untuk server Anda.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Simpan';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Penggunaan';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count penggunaan';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Daftarkan komunitasmu di Discovery agar orang lain dapat menemukannya dan bergabung.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Anggota tidak cukup';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Komunitas Anda harus memiliki setidaknya $count anggota agar dapat terdaftar di Discovery.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Status:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Tertunda';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Disetujui';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Ditolak';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Dihapus';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Alasan: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Komunitasmu terdaftar di Discovery. Kamu bisa memperbarui detail pendaftaranmu di bawah atau menarik pengajuan untuk menghapusnya.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Pengajuanmu sedang ditinjau. Kamu masih bisa memperbarui detail pendaftaranmu atau menarik pengajuannya.';

  @override
  String get guildSettingsDiscoveryCategory => 'Kategori';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Pilih kategori yang paling sesuai dengan komunitasmu. Kamu bisa mengubahnya kapan saja.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Bahasa utama';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Bahasa yang digunakan sebagian besar anggota komunitasmu. Dipakai untuk memfilter hasil Discovery.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Deskripsi';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Jelaskan tentang komunitasmu';

  @override
  String get guildSettingsDiscoveryDescriptionRequired =>
      'Deskripsi wajib diisi.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Deskripsi harus minimal $minLength karakter.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Deskripsi tidak boleh lebih dari $maxLength karakter.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Tag khusus';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Hingga $maxTags tag membantu orang menemukan komunitas Anda. Tag tersebut muncul di penelusuran Discovery.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Tambahkan tag lalu tekan Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Tambah';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Hapus tag $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle =>
      'Tidak dapat menambahkan tag';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Tag harus terdiri dari 2 hingga $maxLength karakter dan alfanumerik.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Kamu hanya dapat menambahkan hingga $maxTags tag.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Terapkan';

  @override
  String get guildSettingsDiscoverySave => 'Simpan';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Tarik pengajuan';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Pengajuan Discovery terkirim';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Pendaftaran Discovery diperbarui';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Pengajuan Discovery ditarik';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Tidak dapat menarik pengajuan';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Coba lagi sebentar lagi.';

  @override
  String get guildSettingsMembersDescription =>
      'Cari dan kelola anggota server.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Cari berdasarkan nama pengguna atau ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count anggota';
  }

  @override
  String get guildMembersRecentTitle => 'Anggota terbaru';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Menampilkan $displayedCount dari $totalCount total anggota';
  }

  @override
  String get guildMembersSort => 'Urutkan';

  @override
  String get guildSettingsMembersSortNewest => 'Terbaru dulu';

  @override
  String get guildMembersSortOldest => 'Terlama dulu';

  @override
  String get guildMembersColumnName => 'Nama';

  @override
  String get guildMembersColumnMemberSince => 'Anggota sejak';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Bergabung dengan $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Metode gabung';

  @override
  String get guildMembersColumnRoles => 'Peran';

  @override
  String get guildMembersColumnActions => 'Tindakan';

  @override
  String get guildMembersFilterMemberSince =>
      'Filter berdasarkan tanggal bergabung';

  @override
  String get guildMembersFilterJoinedProduct =>
      'Filter berdasarkan tanggal pembuatan akun';

  @override
  String get guildMembersFilterJoinMethod => 'Filter berdasarkan metode gabung';

  @override
  String get guildMembersFilterRoles => 'Filter berdasarkan peran';

  @override
  String get guildMembersFilterAll => 'Semua';

  @override
  String get guildMembersFilterPast1Hour => '1 jam terakhir';

  @override
  String get guildMembersFilterPast24Hours => '24 jam terakhir';

  @override
  String get guildMembersFilterPast7Days => '7 hari terakhir';

  @override
  String get guildMembersFilterPast2Weeks => '2 minggu terakhir';

  @override
  String get guildMembersFilterPast3Weeks => '3 minggu terakhir';

  @override
  String get guildMembersFilterPast4Weeks => '4 minggu terakhir';

  @override
  String get guildMembersFilterPast3Months => '3 bulan terakhir';

  @override
  String get guildMembersFilterCustomRange => 'Rentang khusus...';

  @override
  String get guildMembersDateRangeTitle => 'Rentang tanggal khusus';

  @override
  String get guildMembersDateAfter => 'Setelah tanggal';

  @override
  String get guildMembersDateBefore => 'Sebelum tanggal';

  @override
  String get guildMembersClearAll => 'Hapus semua';

  @override
  String get guildMembersRowsPerPage => 'Baris per halaman';

  @override
  String get guildMembersEmptySearch =>
      'Tidak ada yang cocok dengan pencarian itu.';

  @override
  String get guildMembersLoadError =>
      'Terjadi kesalahan saat memuat anggota. Coba lagi nanti.';

  @override
  String get guildMembersIndexing => 'Mengindeks anggota…';

  @override
  String get guildMembersGoToPage => 'Buka halaman';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Buka halaman $page';
  }

  @override
  String get guildMembersJumpToPage => 'Lompat ke halaman';

  @override
  String get guildMembersJoinSourceCreator => 'Pembuat komunitas';

  @override
  String get guildMembersJoinSourceInvite => 'Undang';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Undangan ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Diundang oleh $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL kustom';

  @override
  String get guildMembersJoinSourceBotInvite => 'Undangan bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Admin platform';

  @override
  String get guildMembersJoinSourceDiscovery => 'Discovery';

  @override
  String get guildMembersJoinMethodUnknown => 'Tidak diketahui';

  @override
  String get guildMembersCommunityOwner => 'Pemilik komunitas';

  @override
  String get guildMembersViewAllRoles => 'Lihat semua peran';

  @override
  String get guildMembersJoinedJustNow => 'Baru saja';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menit yang lalu',
      one: '1 menit yang lalu',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count jam yang lalu',
      one: '1 jam yang lalu',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count hari yang lalu',
      one: '1 hari yang lalu',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Anggota';

  @override
  String get guildMembersChannelListSelected => 'Anggota, terpilih';

  @override
  String get guildSettingsInvitesTitle => 'Undangan';

  @override
  String get guildSettingsInvitesDescription =>
      'Lihat semua undangan untuk komunitas ini. Untuk membuat undangan baru, buka saluran dan gunakan tombol undang.';

  @override
  String get guildSettingsInvitesEmpty => 'Tidak ada tautan undangan';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Komunitas ini belum punya tautan undangan. Buka saluran dan buat undangan untuk mengundang orang.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'Gagal memuat undangan';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Terjadi error saat memuat undangan. Coba lagi.';

  @override
  String get guildSettingsInvitesTryAgain => 'Coba lagi';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Tampilkan tanggal pembuatan, bukan tanggal kedaluwarsa';

  @override
  String get guildSettingsInvitesPauseInvites => 'Jeda undangan';

  @override
  String get guildSettingsInvitesEnableInvites => 'Aktifkan undangan';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Jeda undangan untuk komunitas ini';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Aktifkan undangan untuk komunitas ini';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Jeda undangan? Pengguna baru tidak akan bisa bergabung melalui tautan undangan sampai kamu mengaktifkannya lagi. Anggota yang sudah ada tidak akan terpengaruh.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Aktifkan undangan? Pengguna akan dapat bergabung ke komunitas ini melalui tautan undangan lagi.';

  @override
  String get guildSettingsInvitesPause => 'Jeda';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Undangan dijeda untuk komunitas ini.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Undangan dijeda karena $productName mendeteksi potensi serangan. Pengguna baru tidak dapat bergabung sekarang.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Pengundang:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Saluran:';

  @override
  String get guildSettingsInvitesLabelCode => 'Kode:';

  @override
  String get guildSettingsInvitesLabelUses => 'Penggunaan:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Dibuat:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Kedaluwarsa:';

  @override
  String get guildSettingsInvitesUnknown => 'Tidak diketahui';

  @override
  String get guildSettingsInvitesNoCategory => 'Tanpa kategori';

  @override
  String get guildSettingsInvitesExpired => 'Kedaluwarsa';

  @override
  String get guildSettingsInvitesNever => 'Tidak pernah';

  @override
  String get guildSettingsInvitesCopyLink => 'Salin tautan undangan';

  @override
  String get guildSettingsInvitesRevoke => 'Cabut undangan';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Tidak dapat mencabut undangan';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Tautan mungkin masih berfungsi. Coba lagi sebentar lagi.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses kali pakai';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Kedaluwarsa $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Lihat dan kelola pengguna yang diblokir.';

  @override
  String get guildSettingsBansSearchHint => 'Cari pemblokiran';

  @override
  String get guildSettingsBansEmpty => 'Tidak ada pengguna yang diblokir.';

  @override
  String get guildSettingsBanPermanent => 'Larangan permanen';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Kadaluwarsa $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Kedaluwarsa';

  @override
  String get guildSettingsUnban => 'Buka blokir';

  @override
  String get guildSettingsBansLoading => 'Memuat pengguna yang diblokir';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Tidak ada pemblokiran yang cocok dengan pencarianmu.';

  @override
  String get guildSettingsBanDetailsTitle => 'Detail pemblokiran';

  @override
  String get guildSettingsBanViewDetails => 'Lihat detail';

  @override
  String get guildSettingsBannedOn => 'Diblokir pada';

  @override
  String get guildSettingsBannedBy => 'Diblokir oleh';

  @override
  String get guildSettingsRevokeBanTitle => 'Cabut pemblokiran';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Yakin Anda ingin mencabut larangan untuk $displayName? Mereka akan dapat bergabung kembali ke komunitas.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Cabut larangan untuk $displayName';
  }

  @override
  String get guildSettingsBansLoadError =>
      'Tidak dapat memuat daftar larangan. Coba lagi.';

  @override
  String get guildSettingsRevokeBanError =>
      'Tidak dapat mencabut larangan. Coba lagi.';

  @override
  String get guildSettingsCommunitySettings => 'Pengaturan komunitas';

  @override
  String get guildSettingsDeleteCommunity => 'Hapus komunitas';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'Yakin ingin menghapus komunitas ini? Tindakan ini tidak bisa dibatalkan. Semua saluran, pesan, dan pengaturan akan dihapus secara permanen.';

  @override
  String get guildSettingsCommunityDeleted => 'Komunitas dihapus';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'Tidak dapat menghapus komunitas ini';

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
      'Kelola profil, saluran, dan setelan default komunitas Anda.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Merek';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Perbarui ikon, nama, banner, dan latar belakang undangan Anda';

  @override
  String get guildSettingsOverviewBannerUpload => 'Unggah banner';

  @override
  String get guildSettingsOverviewIdleTitle => 'Pengaturan tidak aktif';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Atur saluran AFK dan batas waktu';

  @override
  String get guildSettingsOverviewSystemTitle => 'Sistem & sambutan';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Pilih tujuan untuk pesan sistem dan selamat datang';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Notifikasi default';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Komunitas dengan lebih dari 250 orang akan otomatis menggunakan pengaturan \"Hanya sebutan\". Pengaturan awalmu tetap disimpan dan akan dipulihkan jika jumlah anggota komunitas turun di bawah 250.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Lanjutan';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Izinkan nama saluran teks fleksibel';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Sembunyikan mahkota pemilik komunitas';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Banner terpisah';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Menampilkan banner di bagiannya sendiri di bawah header komunitas.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Unggah ikon';

  @override
  String get guildSettingsOverviewRemoveImage => 'Hapus';

  @override
  String get guildSettingsOverviewSplashTitle => 'Latar belakang undangan';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Latar belakang sematan obrolan';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Ditampilkan di sematan undangan dalam obrolan.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Unggah latar belakang';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Tidak ada banner komunitas';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Tanpa latar belakang undangan';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Pratinjau';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Lihat tampilan undanganmu bagi pengunjung.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Nama saluran teks';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Mahkota pemilik komunitas';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Atur apakah ikon mahkota ditampilkan di sebelah pemilik komunitas';

  @override
  String get guildSettingsSplashCardAlignment => 'Perataan kartu';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Tengah';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Kiri';

  @override
  String get guildSettingsSplashAlignmentRight => 'Kanan';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Hanya berlaku di layar lebar.';

  @override
  String get permissionReadMessageHistory => 'Baca riwayat pesan';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Ubah apa yang dapat dilihat oleh pengguna tanpa \"$permission\"';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Gunakan modal khusus untuk menetapkan tanggal batas riwayat pesan bagi anggota yang tidak memiliki izin $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Buka batas riwayat pesan';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'Batas riwayat pesan';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Aktifkan batas riwayat pesan';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Tanggal batas';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Anggota tanpa Riwayat Baca Pesan dapat melihat pesan yang dikirim setelah tanggal ini.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Batas riwayat pesan diperbarui';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Izinkan huruf kapital dan spasi dalam nama saluran teks. Jika dinonaktifkan, nama akan dibatasi menjadi huruf kecil dengan tanda hubung dan garis bawah.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Menyembunyikan ikon mahkota di sebelah pemilik komunitas di semua tampilan.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Ikon animasi memerlukan fitur komunitas Ikon Animasi.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Banner animasi memerlukan fitur komunitas Banner Animasi.';

  @override
  String get guildSettingsAfkChannel => 'Saluran AFK / tidak aktif';

  @override
  String get guildSettingsAfkChannelHint =>
      'Pindahkan anggota ke saluran ini saat mereka AFK.';

  @override
  String get guildSettingsNoAfkChannel => 'Tidak ada saluran AFK';

  @override
  String get guildSettingsAfkTimeout => 'Batas waktu AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 menit';

  @override
  String get guildSettingsAfkTimeout5Min => '5 menit';

  @override
  String get guildSettingsAfkTimeout15Min => '15 menit';

  @override
  String get guildSettingsAfkTimeout30Min => '30 menit';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 jam';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds detik';
  }

  @override
  String get guildSettingsSystemChannel => 'Saluran tujuan';

  @override
  String get guildSettingsSystemChannelHint =>
      'Pesan selamat datang dan sistem akan muncul di sini.';

  @override
  String get guildSettingsNoSystemChannel => 'Tidak ada saluran sistem';

  @override
  String get guildSettingsHideJoinMessages => 'Sembunyikan pesan bergabung';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Menekan pesan bergabung di saluran tujuan.';

  @override
  String get guildSettingsDefaultNotifications => 'Setelan notifikasi default';

  @override
  String get guildSettingsNotificationsAll => 'Semua pesan';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Beri tahu saya tentang semua pesan';

  @override
  String get guildSettingsNotificationsMentions => 'Hanya sebutan';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Beri tahu hanya saat disebutkan';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks 10MB. Minimum: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Maks 10MB. Minimum: 960×540px (16:9). Ditampilkan di sematan undangan dalam chat.';

  @override
  String get guildSettingsModerationDescription =>
      'Atur pengaturan verifikasi, pemfilteran konten, dan konten dewasa.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Komunitas yang terdaftar di Penemuan memiliki opsi moderasi yang terbatas.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Filter konten';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Saring pesan secara otomatis dari konten eksplisit di saluran yang tidak ditandai sebagai konten dewasa.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Komunitas yang tercantum di Penemuan wajib memindai semua anggota. Pengaturan ini tidak dapat diubah saat Penemuan diaktifkan.';

  @override
  String get guildSettingsContentFilterOff => 'Nonaktif';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Biarkan komunitas memoderasi sendiri';

  @override
  String get guildSettingsContentFilterNoRole => 'Filter anggota tanpa peran';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Disarankan untuk sebagian besar komunitas';

  @override
  String get guildSettingsContentFilterAll => 'Filter semua orang';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Perlindungan maksimal untuk ruang yang ramah keluarga';

  @override
  String get guildSettingsModerationMatureOff => 'Nonaktif';

  @override
  String get guildSettingsModerationMatureOn => 'Aktif';

  @override
  String get guildSettingsContentWarningToggle => 'Tampilkan peringatan konten';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Mengaktifkan permintaan persetujuan sebelum memasuki saluran mana pun.';

  @override
  String get guildSettingsContentWarningText => 'Teks peringatan khusus';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Ini berisi konten sensitif.';

  @override
  String get guildSettingsModeration2faTitle => 'Wajib 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Wajibkan autentikasi dua faktor untuk moderator sebelum mereka dapat memblokir, mengeluarkan, menangguhkan, atau menghapus pesan.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Wajibkan 2FA untuk tindakan moderasi';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Hanya pemilik komunitas yang dapat mengubah pengaturan ini';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Aktifkan 2FA di akunmu untuk mengubah pengaturan ini';

  @override
  String get guildSettingsEmojiSearchHint => 'Cari emoji';

  @override
  String get guildSettingsEmojiUploadTitle => 'Unggah emoji';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Slot emoji';

  @override
  String get guildSettingsEmojiDropZone => 'Seret dan lepas file emoji di sini';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Gagal memuat emoji. Coba lagi nanti.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Tidak ada emoji yang cocok dengan pencarianmu.';

  @override
  String get guildSettingsEmojiNoSlots => 'Tidak ada slot emoji yang tersedia';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Kamu sudah mencapai jumlah emoji maksimum. Hapus beberapa emoji yang ada untuk memberi ruang.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Nama emoji harus memiliki setidaknya 2 karakter dan dapat menggunakan huruf, angka, dan garis bawah. Emoji harus berukuran kurang dari $maxSize. Gambar statis akan diubah ukurannya menjadi 128x128 piksel dan dikompresi secara otomatis. Emoji animasi dan SVG harus sudah sesuai dengan batas ukuran.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle => 'Mengunggah emoji';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# emoji',
      one: '# emoji',
    );
    return 'Mengunggah $_temp0. Ini mungkin memerlukan sedikit waktu.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Gagal mengunggah emoji. Coba lagi.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Beberapa emoji tidak dapat ditambahkan';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Tinjau file ini dan coba lagi dengan gambar yang lebih kecil atau lebih sederhana.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Ganti nama emoji';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 karakter, huruf, angka, garis bawah.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Emoji';

  @override
  String get guildSettingsEmojiColumnName => 'Nama';

  @override
  String get guildSettingsEmojiColumnUploader => 'Diunggah oleh';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Tidak diketahui';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Hapus emoji';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Hapus :$name:? Tindakan ini tidak dapat dibatalkan.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Hapus emoji ini dari penyimpanan dan CDN';

  @override
  String get guildSettingsEmojiNameTooShort => 'Nama emoji minimal 2 karakter';

  @override
  String get guildSettingsEmojiNameTooLong => 'Nama emoji maksimal 32 karakter';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'Nama emoji tidak valid';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Tidak dapat mengganti nama emoji ini';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Nama dikembalikan seperti semula. Silakan coba lagi sebentar lagi.';

  @override
  String get guildSettingsEmojiGoneTitle => 'Emoji ini sudah tidak ada';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Mungkin emoji ini sudah dihapus. Namanya dikembalikan seperti semula.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Kamu tidak dapat mengganti nama emoji ini';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Kamu tidak memiliki izin untuk mengganti nama emoji ini. Nama dikembalikan ke nama sebelumnya.';

  @override
  String get guildSettingsEmojiRateLimitedTitle => 'Kamu terlalu cepat';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Harap tunggu sebentar dan coba ganti nama lagi.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Tidak dapat menghapus emoji ini';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Kamu tidak dapat menghapus emoji ini';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Izinkan orang lain mengkloning emoji Anda';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Saat diaktifkan, anggota komunitas lain dapat menggunakan pintasan \"Kloning\" sekali klik dalam aplikasi pada emoji kustom Anda. Ini tidak mencegah mereka menyimpan gambar dan mengunggahnya sendiri.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Izinkan orang lain mengkloning stiker Anda';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Jika diaktifkan, anggota komunitas lain dapat menggunakan pintasan \"Kloning\" sekali klik dalam aplikasi pada stiker kustom Anda. Ini tidak mencegah mereka menyimpan gambar dan mengunggahnya sendiri.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Hanya anggota dengan izin \"$permission\" yang dapat mengubah ini.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Tidak dapat memperbarui kloning emoji';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Tidak dapat memperbarui kloning stiker';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji non-animasi ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji animasi ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Cari stiker';

  @override
  String get guildSettingsStickerSlotsTitle => 'Slot stiker';

  @override
  String get guildSettingsStickerUploadTitle => 'Unggah stiker';

  @override
  String get guildSettingsStickerDropZone =>
      'Seret dan lepas file stiker di sini (satu per satu)';

  @override
  String get guildSettingsStickerDensity => 'Kepadatan stiker';

  @override
  String get guildSettingsStickerDensityCozy => 'Nyaman';

  @override
  String get guildSettingsStickerDensityCompact => 'Ringkas';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'Gagal memuat stiker';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Terjadi error saat memuat stiker. Coba lagi.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Tidak ada stiker yang cocok dengan pencarianmu.';

  @override
  String get guildSettingsStickersEmptySearch =>
      'Tidak ada stiker yang ditemukan';

  @override
  String get guildSettingsStickerNoSlots =>
      'Tidak ada slot stiker yang tersedia';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Kamu sudah mencapai jumlah stiker maksimum. Hapus beberapa stiker yang ada untuk memberi ruang.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Stiker disimpan pada 320x320 piksel dan harus berukuran kurang dari $maxSize. Gambar statis akan diubah ukurannya dan dikompresi secara otomatis. Stiker animasi dan SVG harus sudah sesuai dengan batas ukuran.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'File stiker tidak didukung';

  @override
  String get guildSettingsStickerAddTitle => 'Tambah stiker';

  @override
  String get guildSettingsStickerEditTitle => 'Edit stiker';

  @override
  String get guildSettingsStickerNameLabel => 'Nama';

  @override
  String get guildSettingsStickerNameHint => 'Stiker saya yang keren';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Deskripsi';

  @override
  String get guildSettingsStickerDescriptionHint => 'Jelaskan stiker';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Tag ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Tambah tag';

  @override
  String get guildSettingsStickerTagAdd => 'Tambah';

  @override
  String get guildSettingsStickerNameRequired => 'Nama wajib diisi';

  @override
  String get guildSettingsStickerNameTooShort => 'Nama minimal 2 karakter';

  @override
  String get guildSettingsStickerNameTooLong =>
      'Nama harus 30 karakter atau kurang';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Deskripsi harus 500 karakter atau kurang';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Tidak dapat membuat stiker ini';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Stiker terlalu besar';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Stiker tidak dapat dikompresi cukup kecil';

  @override
  String get guildSettingsStickerDeleteTitle => 'Hapus stiker';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Hapus \"$name\"? Tindakan ini tidak dapat dibatalkan.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Hapus stiker ini dari penyimpanan dan CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Tidak dapat menghapus stiker ini';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Anda tidak dapat menghapus stiker ini';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Untuk membuat webhook, buka $channelSettingsPath. Anda masih dapat mengedit dan mengatur semua webhook yang ada di sini.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'URL kustom Anda tidak akan berfungsi kecuali setidaknya satu saluran terlihat oleh semua orang.';

  @override
  String get guildSettingsVanityUrlRemove => 'Hapus';

  @override
  String get guildSettingsBannedUsersTitle => 'Pengguna yang diblokir';

  @override
  String get guildSettingsInvitesTableInviter => 'Pengundang';

  @override
  String get guildSettingsInvitesTableChannel => 'Saluran';

  @override
  String get guildSettingsInvitesTableCode => 'Kode';

  @override
  String get guildSettingsInvitesTableUses => 'Penggunaan';

  @override
  String get guildSettingsInvitesTableCreated => 'Dibuat';

  @override
  String get guildSettingsInvitesTableExpires => 'Kedaluwarsa';

  @override
  String get guildSettingsAuditLogFilterUser => 'Filter berdasarkan pengguna';

  @override
  String get guildSettingsAuditLogFilterAction => 'Filter berdasarkan tindakan';

  @override
  String get createDm => 'Buat DM';

  @override
  String get createGroupDm => 'Buat DM grup';

  @override
  String get createDmNewMessage => 'Pesan baru';

  @override
  String get createDmSelectFriends => 'Pilih teman';

  @override
  String get createDmChooseFriendsSubtitle =>
      'Pilih teman untuk dikirimi pesan.';

  @override
  String get createDmSearchFriends => 'Cari teman';

  @override
  String get createDmNoFriendsFound => 'Tidak ada teman yang ditemukan';

  @override
  String get createDmNoFriendsYet => 'Kamu belum punya teman';

  @override
  String get createDmClaimToStartDms => 'Klaim akunmu untuk mulai DM.';

  @override
  String get createDmVerifyToStartDms => 'Verifikasi emailmu untuk memulai DM.';

  @override
  String get createDmVerifyYourEmail => 'Verifikasi emailmu';

  @override
  String get createDmNewGroup => 'Grup baru';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Buat grup baru dengan $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Konfirmasi grup baru';

  @override
  String get createDmCreateNewGroup => 'Buat grup baru';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Hapus $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Kamu sudah punya grup dengan pengguna ini. Kamu yakin mau buat yang baru? Boleh juga kok!';

  @override
  String get createDmNoActivityYet => 'Belum ada aktivitas';

  @override
  String get createDmSomeUsersCantBeAdded =>
      'Beberapa pengguna tidak dapat ditambahkan';

  @override
  String get createDmCreateWithoutThem => 'Buat tanpa mereka';

  @override
  String get createDmUnaddableIntro =>
      'Orang-orang berikut tidak bisa ditambahkan ke DM grup ini:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Buat DM grup dengan sisa penerima $count dan lewati yang lain?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Tidak ada penerima tersisa untuk membuat DM grup.';

  @override
  String get createDmUnaddableUserNotFound => 'Pengguna tidak ditemukan';

  @override
  String get createDmUnaddableBlocked =>
      'Kamu tidak bisa mengirim pesan ke pengguna ini';

  @override
  String get createDmUnaddableNotFriends => 'Tidak ada di daftar temanmu';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Tidak mengizinkan ditambahkan ke DM grup';

  @override
  String get createDmFailed => 'Gagal membuat percakapan. Coba lagi.';

  @override
  String get dmListMessagesTitle => 'Pesan';

  @override
  String get dmListDirectMessagesTitle => 'Pesan langsung';

  @override
  String get keybindsSearchShortcuts => 'Cari pintasan';

  @override
  String get keybindSectionDefaults => 'Bawaan';

  @override
  String get keybindSectionMessages => 'Pesan';

  @override
  String get keybindSectionNavigation => 'Navigasi';

  @override
  String get keybindSectionDragAndDrop => 'Seret dan lepas';

  @override
  String get keybindSectionChat => 'Obrolan';

  @override
  String get keybindSectionVoiceAndVideo => 'Suara dan video';

  @override
  String get keybindSectionMisc => 'Lain-lain';

  @override
  String get keybindActionShowShortcutsList =>
      'Tampilkan daftar pintasan keyboard';

  @override
  String get keybindActionCopyText => 'Salin teks';

  @override
  String get keybindActionMarkUnread => 'Tandai sebagai belum dibaca';

  @override
  String get keybindActionFocusTextarea => 'Fokuskan area teks';

  @override
  String get keybindActionSwitchCommunities => 'Beralih antar komunitas';

  @override
  String get keybindActionSwitchChannels => 'Beralih antar saluran';

  @override
  String get keybindActionHistoryBack =>
      'Mundur melalui riwayat saluran yang dilihat';

  @override
  String get keybindActionHistoryForward =>
      'Maju melalui riwayat saluran yang dilihat';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Lompat antarsaluran yang belum dibaca';

  @override
  String get keybindActionJumpMentionChannels =>
      'Lompat antarsaluran yang belum dibaca dengan sebutan';

  @override
  String get keybindActionJumpCurrentCall => 'Lompat ke panggilan saat ini';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Beralih antara komunitas terakhir dan DM';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Beralih ke komunitas atau DM sebelumnya';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Beralih ke komunitas atau DM berikutnya';

  @override
  String get keybindActionGoToDms => 'Buka pesan langsung';

  @override
  String get keybindActionGoToFirstCommunity => 'Buka komunitas pertama';

  @override
  String get keybindActionGoToSecondCommunity => 'Buka komunitas kedua';

  @override
  String get keybindActionGoToThirdCommunity => 'Buka komunitas ketiga';

  @override
  String get keybindActionGoToFourthCommunity => 'Buka komunitas keempat';

  @override
  String get keybindActionGoToFifthCommunity => 'Buka komunitas kelima';

  @override
  String get keybindActionGoToSixthCommunity => 'Buka komunitas keenam';

  @override
  String get keybindActionGoToSeventhCommunity => 'Buka komunitas ketujuh';

  @override
  String get keybindActionGoToEighthCommunity => 'Buka komunitas kedelapan';

  @override
  String get keybindActionToggleQuickSwitcher => 'Alihkan pengalih cepat';

  @override
  String get keybindActionCreateOrJoinCommunity => 'Buat atau gabung komunitas';

  @override
  String get keybindActionStartDragAndDrop => 'Mulai seret dan lepas';

  @override
  String get keybindActionMove => 'Pindahkan';

  @override
  String get keybindActionDropItem => 'Lepas item';

  @override
  String get keybindActionCancel => 'Batal';

  @override
  String get keybindActionMarkCommunityRead =>
      'Tandai komunitas sebagai sudah dibaca';

  @override
  String get keybindActionMarkChannelRead =>
      'Tandai saluran sebagai sudah dibaca';

  @override
  String get keybindActionStartGroupDm => 'Mulai DM grup';

  @override
  String get keybindActionTogglePinnedMessages => 'Alihkan pesan tersemat';

  @override
  String get keybindActionToggleInbox => 'Alihkan kotak masuk';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Tandai saluran teratas di kotak masuk sebagai sudah dibaca';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Tandai semua saluran kotak masuk sebagai sudah dibaca';

  @override
  String get keybindActionToggleMemberList =>
      'Alihkan daftar anggota atau obrolan suara';

  @override
  String get keybindActionToggleEmojiPicker => 'Alihkan pemilih emoji';

  @override
  String get keybindActionToggleGifPicker => 'Alihkan pemilih GIF';

  @override
  String get keybindActionToggleStickerPicker => 'Alihkan pemilih stiker';

  @override
  String get keybindActionScrollChatUp => 'Gulir obrolan ke atas';

  @override
  String get keybindActionScrollChatDown => 'Gulir obrolan ke bawah';

  @override
  String get keybindActionJumpOldestUnread =>
      'Lompat ke pesan terlama yang belum dibaca';

  @override
  String get keybindActionFocusComposer => 'Fokuskan area teks';

  @override
  String get keybindActionUploadFile => 'Unggah file';

  @override
  String get keybindActionCopyChannelLink => 'Salin tautan saluran';

  @override
  String get keybindActionToggleSavedMedia => 'Alihkan media tersimpan';

  @override
  String get keybindActionSendVoiceMessage => 'Kirim pesan suara';

  @override
  String get keybindActionAnswerCall => 'Jawab panggilan masuk';

  @override
  String get keybindActionDeclineCall => 'Tolak panggilan masuk';

  @override
  String get keybindActionStartDmCall => 'Mulai panggilan di DM atau grup';

  @override
  String get keybindActionToggleSoundboard => 'Alihkan papan suara';

  @override
  String get keybindActionToggleCompactCallView =>
      'Perluas atau ciutkan tampilan panggilan ringkas';

  @override
  String get keybindActionPushToTalkPriority =>
      'Tekan untuk bicara (prioritas)';

  @override
  String get keybindActionVoiceActivityPriority => 'Prioritas aktivitas suara';

  @override
  String get keybindActionOpenHelp => 'Buka bantuan';

  @override
  String get keybindActionSearchMessages => 'Cari pesan';

  @override
  String get keybindActionOpenContextMenu => 'Buka menu konteks';

  @override
  String get keybindActionOpenSettings => 'Buka pengaturanmu';

  @override
  String get keybindActionOpenThemeStudio => 'Buka pop-out studio tema';

  @override
  String get keybindActionZoomIn => 'Perbesar';

  @override
  String get keybindActionZoomOut => 'Perkecil';

  @override
  String get keybindActionZoomReset => 'Setel ulang zoom';

  @override
  String get clipboardPasteFailed =>
      'Tidak dapat menempel. Papan klip kosong atau diblokir untuk aplikasi ini.';

  @override
  String get homeQuickActionDms => 'Pesan Langsung';

  @override
  String get assistantNeedsLogin => 'Buka Fluxer dan masuk terlebih dahulu.';

  @override
  String get assistantNotInVoice => 'Anda tidak sedang dalam panggilan.';

  @override
  String get assistantNotFound => 'Fluxer tidak dapat menemukan itu.';

  @override
  String get assistantDmsDisabled =>
      'Direct messages are disabled on this instance.';

  @override
  String get assistantFailed => 'Fluxer tidak dapat menyelesaikan itu.';

  @override
  String get assistantOkMuted => 'Mikrofon dibisukan.';

  @override
  String get assistantOkUnmuted => 'Mikrofon diaktifkan.';

  @override
  String get assistantOkLeftVoice => 'Keluar dari saluran suara.';

  @override
  String get assistantOkJoinedVoice => 'Bergabung ke saluran suara.';

  @override
  String get assistantOkStartedCall => 'Memulai panggilan.';

  @override
  String assistantOkStatusSet(String status) {
    return 'Status diatur ke $status.';
  }

  @override
  String get assistantOkOpened => 'Membuka Fluxer.';

  @override
  String get assistantOkMessageSent => 'Pesan terkirim.';

  @override
  String get assistantOkCustomStatusSet => 'Status kustom diperbarui.';

  @override
  String get assistantOkCustomStatusCleared => 'Status kustom dihapus.';

  @override
  String get guildNavbarAnnouncementChannel => 'Saluran pengumuman';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'Posting pembaruan yang dapat diikuti komunitas lain ke saluran mereka sendiri';

  @override
  String get channelDetailsAnnouncementChannel => 'Saluran pengumuman';

  @override
  String get channelSettingsAnnouncementChannel => 'Saluran pengumuman';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'Izinkan komunitas lain mengikuti saluran ini dan mendapatkan salinan dari apa yang Anda publikasikan.';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'Berhenti menjadi saluran pengumuman?';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count saluran mengikuti saluran ini. Mengubahnya menjadi saluran teks akan menghapus pengikut tersebut.',
      one:
          '1 saluran mengikuti saluran ini. Mengubahnya menjadi saluran teks akan menghapus pengikut tersebut.',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'Mengubah saluran ini menjadi saluran teks akan membuat semua saluran yang mengikutinya berhenti mengikuti.';

  @override
  String get channelSettingsConvertChannel => 'Konversi';

  @override
  String get channelSettingsConvertFailed =>
      'Tidak dapat mengonversi saluran ini';

  @override
  String get channelSettingsChannelHasFollowers =>
      'Saluran ini masih memiliki pengikut. Hapus pengikut tersebut sebelum mengonversinya.';

  @override
  String get channelMenuFollow => 'Ikuti saluran';

  @override
  String get channelFollowTitle => 'Ikuti saluran ini';

  @override
  String get channelFollowBody =>
      'Pilih tempat pesan yang dipublikasikan akan dikirim. Anda dapat berhenti mengikuti kapan saja di pengaturan Komunitas → Webhook.';

  @override
  String get channelFollowCommunity => 'Komunitas';

  @override
  String get channelFollowChannel => 'Saluran';

  @override
  String get channelFollowSelectCommunity => 'Select a community';

  @override
  String get channelFollowSelectChannel => 'Select a channel';

  @override
  String get channelFollowAgeWarning =>
      'Saluran ini dibatasi usia. Pembaruan hanya dapat dikirim ke saluran yang dibatasi usia.';

  @override
  String get channelFollowContentWarning =>
      'Saluran ini memiliki peringatan konten. Pembaruan hanya dapat dikirim ke saluran dengan peringatan konten atau batasan usia.';

  @override
  String get channelFollowHiddenHint =>
      'Komunitas dan saluran tempat Anda tidak dapat mengelola webhook disembunyikan.';

  @override
  String get channelFollowEmpty =>
      'Anda tidak dapat mengelola webhook di komunitas mana pun. Minta admin untuk mengikuti saluran ini.';

  @override
  String get channelFollowSubmit => 'Ikuti';

  @override
  String get channelFollowFailed => 'Tidak dapat mengikuti saluran ini.';

  @override
  String get channelFollowSuccessTitle => 'Pembaruan sedang dikirim!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'Pesan yang dipublikasikan di $sourceName akan muncul di #$targetName.';
  }

  @override
  String get channelFollowSuccessDismiss => 'Oke!';

  @override
  String get channelFollowBarrier =>
      'Ikuti saluran ini untuk mendapatkan pengumuman ini di saluran pilihan Anda.';

  @override
  String get channelHeaderFollow => 'Ikuti saluran';

  @override
  String get chatMessagePublish => 'Terbitkan';

  @override
  String get chatMessagePublished => 'Dipublikasikan';

  @override
  String get chatMessagePublishConfirmTitle => 'Terbitkan pesan?';

  @override
  String get chatMessagePublishConfirmBody =>
      'Ini akan mengirimkan salinan ke setiap saluran yang mengikuti saluran ini.';

  @override
  String get chatMessagePublishedToast => 'Pesan dipublikasikan';

  @override
  String get chatMessageAlreadyPublished => 'Pesan ini sudah dipublikasikan.';

  @override
  String get chatMessagePublishFailedTitle =>
      'Tidak dapat menerbitkan pesan ini';

  @override
  String get chatMessagePublishFailedBody =>
      'Terjadi kesalahan. Coba lagi sebentar lagi.';

  @override
  String get chatMessagePublishLimitTitle => 'Pelan-pelan';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'Anda dapat menerbitkan lagi dalam $duration.';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'Anda memublikasikan terlalu cepat. Coba lagi sebentar lagi.';

  @override
  String get chatMessageDeletePublished =>
      'Ini juga menghapus salinan yang dikirim ke saluran yang mengikuti saluran ini.';

  @override
  String get chatMessageEditPublishedTitle => 'Edit pesan yang dipublikasikan?';

  @override
  String get chatMessageEditPublishedBody =>
      'Ini akan memperbarui salinan yang dikirim ke saluran-saluran yang mengikuti saluran ini.';

  @override
  String get chatMessageEditPublishedSave => 'Simpan';

  @override
  String get chatMessageEditLimitTitle => 'Pelan-pelan';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'Anda dapat mengedit pesan terbitan ini lagi dalam $duration.';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'Anda mengedit pesan terbitan ini terlalu cepat. Coba lagi sebentar lagi.';

  @override
  String get chatMessageOriginalDeleted => '[Pesan asli dihapus]';

  @override
  String get userTagCommunity => 'Komunitas';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username mengatur saluran ini untuk mengikuti $source. Pesan yang dipublikasikan di sana akan muncul di sini.';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username mengatur saluran ini untuk mengikuti $source.';
  }

  @override
  String get publishNudgeNotSent => 'Belum dikirim ke pengikut.';

  @override
  String get publishNudgeHideForever => 'Jangan tampilkan lagi';

  @override
  String get publishNudgeDismiss => 'Tutup';

  @override
  String get channelSettingsFollowedChannels => 'Saluran yang diikuti';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'Saluran pengumuman yang diikuti saluran ini. Berhenti mengikuti untuk berhenti menerima salinan.';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'Saluran pengumuman yang diikuti oleh saluran di komunitas ini.';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'Dari $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'Pembaruan dijeda karena saluran sumber tidak lagi tersedia.';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'Berhenti mengikuti $name?';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'Saluran ini akan berhenti menerima salinan dari saluran pengumuman tersebut.';

  @override
  String get channelSettingsUnfollow => 'Berhenti mengikuti';

  @override
  String get channelSettingsUnfollowFailed =>
      'Couldn\'t unfollow this channel.';

  @override
  String channelSettingsDeliveredTo(String channelName) {
    return 'Delivered to #$channelName';
  }

  @override
  String get crosspostCommunityTitle => 'Komunitas';

  @override
  String get crosspostGoToCommunity => 'Buka komunitas';

  @override
  String get crosspostJoinCommunity => 'Gabung komunitas';

  @override
  String get crosspostSourceFailed =>
      'Tidak dapat memuat komunitas ini. Coba lagi sebentar lagi.';

  @override
  String get crosspostSourceUnavailable =>
      'This community is no longer available';

  @override
  String crosspostMembers(int count) {
    return '$count anggota';
  }

  @override
  String crosspostOnline(int count) {
    return '$count online';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count menit',
      one: '1 menit',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count detik',
      one: '1 detik',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'Jenis saluran tidak didukung';

  @override
  String get channelUnsupportedBody =>
      'Versi aplikasi ini tidak mendukung jenis saluran ini.';

  @override
  String get channelDetailsUnsupportedChannel => 'Saluran tidak didukung';

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
}
