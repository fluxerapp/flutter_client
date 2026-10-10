// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class FluxerLocalizationsTh extends FluxerLocalizations {
  FluxerLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get reconnectingTitle => 'เรามีปัญหา!';

  @override
  String get reconnectingBody =>
      'มีบางอย่างผิดปกติกับอินสแตนซ์\nน่าจะแก้ไขได้ในเร็วๆ นี้!';

  @override
  String get gatewayReconnectingToast => 'กำลังเชื่อมต่อใหม่…';

  @override
  String get gatewayConnectedToast => 'เชื่อมต่อแล้ว';

  @override
  String get sessionExpiredToast =>
      'เซสชันของคุณหมดอายุแล้ว โปรดลงชื่อเข้าใช้อีกครั้ง';

  @override
  String splashStartupFailed(String error) {
    return 'เริ่มทำงานไม่สำเร็จ: $error';
  }

  @override
  String get retry => 'ลองอีกครั้ง';

  @override
  String get splashConnectionLost => 'การเชื่อมต่อขาดหาย';

  @override
  String get splashViewOnStatusPage => 'ดูที่หน้าสถานะ';

  @override
  String get splashConnectionIssuesPrompt => 'มีปัญหาการเชื่อมต่อใช่ไหม';

  @override
  String get splashStatusPageLink => 'หน้าสถานะ';

  @override
  String get splashReadIncident => 'อ่านรายละเอียดเหตุการณ์';

  @override
  String get splashIncidentHistory => 'ประวัติเหตุการณ์';

  @override
  String get nagbarLearnMore => 'ดูเพิ่มเติม';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'มีกำหนดการบำรุงรักษาในเวลา $localizedTime คาดว่าจะใช้เวลา: $duration';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'กำลังอยู่ระหว่างการบำรุงรักษา คาดว่าจะใช้เวลา: $duration';
  }

  @override
  String get nagbarMaintenanceComplete => 'การบำรุงรักษาเสร็จสมบูรณ์แล้ว';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'สวัสดี $displayName โปรดยืนยันบัญชีของคุณเพื่อป้องกันการสูญเสียสิทธิ์เข้าถึง';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'สวัสดี $displayName โปรดยืนยันที่อยู่อีเมลของคุณ';
  }

  @override
  String get nagbarOpenSettings => 'เปิดการตั้งค่า';

  @override
  String get systemPermissionSettingsTitle => 'เปิดใช้งานสิทธิ์';

  @override
  String get systemPermissionSettingsOpenSettings => 'เปิดการตั้งค่า';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName ไม่สามารถเข้าถึงไมโครโฟนของคุณได้ คุณสามารถเปิดใช้งานได้ในการตั้งค่าความเป็นส่วนตัวของอุปกรณ์';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName ไม่สามารถเข้าถึงกล้องของคุณได้ คุณสามารถเปิดใช้งานได้ในการตั้งค่าความเป็นส่วนตัวของอุปกรณ์';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName ไม่สามารถเข้าถึงคลังรูปภาพของคุณได้ คุณสามารถเปิดใช้งานได้ในการตั้งค่าความเป็นส่วนตัวของอุปกรณ์';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName ไม่มีสิทธิ์ส่งการแจ้งเตือน คุณสามารถเปิดใช้งานได้ในการตั้งค่าอุปกรณ์ของคุณ';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'การสมัครสมาชิกของคุณต่ออายุไม่สำเร็จ แต่คุณยังคงเข้าถึงสิทธิประโยชน์ของ $productName ได้จนถึงวันที่ $graceDate ดำเนินการทันที มิฉะนั้นคุณจะสูญเสียสิทธิประโยชน์ทั้งหมด';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'การสมัครสมาชิก $productName ของคุณหมดอายุแล้ว ต่ออายุตอนนี้เพื่อรับสิทธิประโยชน์ของคุณ';
  }

  @override
  String get nagbarManageSubscription => 'จัดการการสมัครสมาชิก';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'ยินดีต้อนรับสู่ $productFullName สำรวจสิทธิประโยชน์ของ $productName ของคุณ และจัดการการสมัครสมาชิกของคุณ';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'ดูฟีเจอร์ $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'คุณมีรหัสของขวัญใหม่รออยู่ในคลังของขวัญของคุณ';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'คุณมีโค้ดของขวัญใหม่ที่ยังไม่ได้เปิดอีก $count รายการในคลังของขวัญของคุณ';
  }

  @override
  String get nagbarViewGiftInventory => 'ดูคลังของขวัญ';

  @override
  String get nagbarVisionaryMfa =>
      'เปิดใช้งานการยืนยันตัวตนสองปัจจัยเพื่อปกป้องบัญชี Visionary ของคุณ';

  @override
  String get nagbarEnableMfa => 'เปิดใช้งาน 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'เราได้อัปเดตข้อกำหนดแล้ว โปรดตรวจสอบและยอมรับเพื่อดำเนินการต่อ';

  @override
  String get nagbarReviewTerms => 'ตรวจสอบข้อกำหนด';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'เข้าร่วม $communityName เพื่อแชทกับทีมและติดตามข่าวสารล่าสุด';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'เข้าร่วม $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'เปิดการแจ้งเตือนเพื่อไม่ให้พลาดข้อความและการกล่าวถึง';

  @override
  String get nagbarEnableNotifications => 'เปิดการแจ้งเตือน';

  @override
  String get nagbarBillingPortalFailed =>
      'ไม่สามารถเปิดหน้าชำระเงินได้ โปรดลองอีกครั้งในสักครู่';

  @override
  String get welcomeBack => 'ยินดีต้อนรับกลับมา';

  @override
  String get email => 'อีเมล';

  @override
  String get emailInvalid => 'โปรดป้อนที่อยู่อีเมลที่ถูกต้อง';

  @override
  String get password => 'รหัสผ่าน';

  @override
  String get forgotPassword => 'ลืมรหัสผ่านใช่ไหม';

  @override
  String get logIn => 'เข้าสู่ระบบ';

  @override
  String get logInWithPasskey => 'เข้าสู่ระบบด้วย Passkey';

  @override
  String continueWithSso(String provider) {
    return 'ดำเนินการต่อด้วย $provider';
  }

  @override
  String get organizationSsoProvider =>
      'ลงชื่อเข้าใช้ด้วยผู้ให้บริการ Single Sign-On ขององค์กรคุณ';

  @override
  String get failedToStartSso => 'เริ่ม SSO ไม่สำเร็จ';

  @override
  String get ssoCancelled => 'ยกเลิกการเข้าสู่ระบบ SSO แล้ว';

  @override
  String preferSso(String provider) {
    return 'ต้องการใช้ SSO ไหม? ดำเนินการต่อด้วย $provider';
  }

  @override
  String get needAccountPrompt => 'ยังไม่มีบัญชีใช่ไหม ';

  @override
  String get register => 'ลงทะเบียน';

  @override
  String get orDivider => 'OR';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get ipAuthCheckEmail => 'ตรวจสอบอีเมลของคุณ';

  @override
  String ipAuthDescription(String email) {
    return 'เราได้ส่งลิงก์เพื่ออนุญาตการเข้าสู่ระบบนี้ทางอีเมล โปรดเปิดกล่องจดหมายของคุณสำหรับ $email';
  }

  @override
  String get ipAuthConnectionLost => 'การเชื่อมต่อขาดหาย';

  @override
  String get ipAuthConnectionLostDescription =>
      'เราสูญเสียการเชื่อมต่อขณะรอการอนุมัติ โปรดลองอีกครั้ง';

  @override
  String get ipAuthLinkExpired => 'ลิงก์ลงชื่อเข้าใช้หมดอายุแล้ว';

  @override
  String get ipAuthLinkExpiredDescription =>
      'ลิงก์การอนุญาตนี้หมดอายุแล้ว โปรดลงชื่อเข้าใช้อีกครั้ง';

  @override
  String get ipAuthResendEmail => 'ส่งอีเมลอีกครั้ง';

  @override
  String get ipAuthResent => 'ส่งอีกครั้งแล้ว';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$secondsวินาที';
  }

  @override
  String get back => 'ย้อนกลับ';

  @override
  String get next => 'ถัดไป';

  @override
  String get mfaTitle => 'การยืนยันตัวตนแบบสองชั้น';

  @override
  String get mfaChooseMethod => 'เลือกวิธีการยืนยัน';

  @override
  String get mfaMethodTotp => 'แอป Authenticator';

  @override
  String get mfaMethodWebauthn => 'คีย์ความปลอดภัย / พาสคีย์';

  @override
  String get mfaTotpDescription =>
      'ป้อนรหัส 6 หลักจากแอป Authenticator ของคุณ หรือรหัสสำรองของคุณ';

  @override
  String get mfaCodeLabel => 'รหัส';

  @override
  String get mfaTryAnotherMethod => 'ลองวิธีอื่น';

  @override
  String get mfaUseSecurityKey => 'ลองใช้คีย์ความปลอดภัย/พาสคีย์แทน';

  @override
  String get accountSelectorTitle => 'เลือกบัญชี';

  @override
  String get accountSelectorDescription =>
      'เลือกบัญชีเพื่อดำเนินการต่อ หรือเพิ่มบัญชีอื่น';

  @override
  String get accountAdd => 'เพิ่มบัญชี';

  @override
  String get accountRemoveDescription =>
      'การดำเนินการนี้จะลบเซสชันที่บันทึกไว้สำหรับบัญชีนี้';

  @override
  String get accountExpired => 'หมดอายุแล้ว';

  @override
  String accountSessionExpired(String identifier) {
    return 'เซสชันหมดอายุสำหรับ $identifier โปรดเข้าสู่ระบบอีกครั้ง';
  }

  @override
  String get accountManageTitle => 'จัดการบัญชี';

  @override
  String get accountSwitchFailed => 'สลับบัญชีไม่ได้ โปรดลองอีกครั้ง';

  @override
  String get profileTabMenuSwitchAccounts => 'สลับบัญชี';

  @override
  String get statusChangeSheetTitle => 'ตั้งสถานะ';

  @override
  String get statusOnlineStatusSection => 'สถานะออนไลน์';

  @override
  String get statusOnline => 'ออนไลน์';

  @override
  String get statusIdle => 'ไม่ได้ใช้งาน';

  @override
  String get statusDnd => 'ห้ามรบกวน';

  @override
  String get statusInvisible => 'ซ่อนตัว';

  @override
  String get statusOffline => 'ออฟไลน์';

  @override
  String get statusUntilIChangeIt => 'จนกว่าฉันจะเปลี่ยนเอง';

  @override
  String get statusDontClear => 'ไม่ล้าง';

  @override
  String get statusFor10Seconds => 'เป็นเวลา 10 วินาที';

  @override
  String get statusClearAfter10Seconds => '10 วินาที';

  @override
  String get statusClearAfter15Minutes => '15 นาที';

  @override
  String get statusClearAfter30Minutes => '30 นาที';

  @override
  String get statusClearAfter1Hour => '1 ชั่วโมง';

  @override
  String get statusClearAfter3Hours => '3 ชั่วโมง';

  @override
  String get statusClearAfter4Hours => '4 ชั่วโมง';

  @override
  String get statusClearAfter8Hours => '8 ชั่วโมง';

  @override
  String get statusClearAfter24Hours => '24 ชั่วโมง';

  @override
  String get statusClearAfter3Days => '3 วัน';

  @override
  String get statusDndDescription => 'คุณจะไม่ได้รับการแจ้งเตือนบนเดสก์ท็อป';

  @override
  String get statusInvisibleDescription => 'คุณจะแสดงสถานะเป็นออฟไลน์';

  @override
  String get customStatusSetTitle => 'ตั้งสถานะกำหนดเอง';

  @override
  String get customStatusCurrentHint => 'สถานะกำหนดเอง';

  @override
  String get customStatusClear => 'ล้างสถานะที่กำหนดเอง';

  @override
  String get customStatusPlaceholder => 'เป็นไงบ้าง?';

  @override
  String get customStatusChooseEmoji => 'เลือกอิโมจิ';

  @override
  String get customStatusClearAfter => 'ล้างสถานะหลังจาก';

  @override
  String get customStatusSave => 'บันทึก';

  @override
  String get accountActive => 'บัญชีที่ใช้งานอยู่';

  @override
  String get signOut => 'ออกจากระบบ';

  @override
  String get suspendedPermanentTitle => 'บัญชีถูกระงับถาวร';

  @override
  String get suspendedTemporaryTitle => 'บัญชีถูกระงับ';

  @override
  String get suspendedPermanentDescription =>
      'บัญชีของคุณถูกระงับถาวรเนื่องจากการละเมิดข้อกำหนดในการให้บริการของเรา';

  @override
  String get suspendedTemporaryDescription =>
      'บัญชีของคุณถูกระงับชั่วคราว คุณจะสามารถเข้าถึงบัญชีของคุณได้เมื่อช่วงเวลาการระงับสิ้นสุดลง';

  @override
  String get suspendedIssuedAt => 'ออกเมื่อ';

  @override
  String get suspendedEndsAt => 'สิ้นสุด';

  @override
  String get suspendedDuration => 'ระยะเวลา';

  @override
  String get suspendedPermanent => 'ถาวร';

  @override
  String get suspendedReason => 'เหตุผล';

  @override
  String get suspendedAppealDeadline => 'กำหนดเวลายื่นอุทธรณ์';

  @override
  String suspendedDeletionWarning(String date) {
    return 'บัญชีของคุณมีกำหนดจะถูกลบในวันที่ $date';
  }

  @override
  String get suspendedRecheck => 'ตรวจหาอัปเดต';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'ลองอีกครั้งใน $seconds วินาที';
  }

  @override
  String get suspendedBackToLogin => 'กลับสู่หน้าเข้าสู่ระบบ';

  @override
  String get suspendedAppealTitle => 'ยื่นอุทธรณ์';

  @override
  String get suspendedAppealHint =>
      'อธิบายว่าทำไมการระงับบัญชีของคุณควรได้รับการพิจารณาใหม่ (อย่างน้อย 50 ตัวอักษร)...';

  @override
  String get suspendedAppealSubmit => 'ส่งคำร้อง';

  @override
  String get suspendedAppealPending => 'รอการตรวจสอบ';

  @override
  String get suspendedAppealAccepted => 'คำร้องได้รับการยอมรับ';

  @override
  String get suspendedAppealRejected => 'คำร้องถูกปฏิเสธ';

  @override
  String get suspendedAppealAcceptedDescription =>
      'คำร้องของคุณได้รับการยอมรับและบัญชีของคุณได้รับการกู้คืนแล้ว';

  @override
  String get suspendedSignIn => 'เข้าสู่ระบบบัญชีของคุณ';

  @override
  String get forgotPasswordTitle => 'ลืมรหัสผ่านใช่ไหม';

  @override
  String get forgotPasswordDescription =>
      'ป้อนอีเมลของคุณ แล้วเราจะส่งลิงก์สำหรับรีเซ็ตรหัสผ่านให้';

  @override
  String get forgotPasswordSubmit => 'ส่งลิงก์รีเซ็ต';

  @override
  String get forgotPasswordSentTitle => 'ตรวจสอบอีเมลของคุณ';

  @override
  String get forgotPasswordSentDescription =>
      'เราได้ส่งคำแนะนำในการรีเซ็ตรหัสผ่านไปยังที่อยู่อีเมลของคุณแล้ว โปรดตรวจสอบกล่องจดหมายของคุณและคลิกลิงก์เพื่อรีเซ็ตรหัสผ่าน';

  @override
  String get forgotPasswordBackToLogin => 'กลับสู่หน้าเข้าสู่ระบบ';

  @override
  String get resetPasswordTitle => 'ตั้งรหัสผ่านใหม่';

  @override
  String get resetPasswordDescription =>
      'กรอกรหัสผ่านใหม่ของคุณด้านล่างเพื่อดำเนินการรีเซ็ตรหัสผ่านให้เสร็จสมบูรณ์';

  @override
  String get resetPasswordNewPassword => 'รหัสผ่านใหม่';

  @override
  String get resetPasswordConfirm => 'ยืนยันรหัสผ่านใหม่';

  @override
  String get resetPasswordSubmit => 'รีเซ็ตรหัสผ่าน';

  @override
  String get resetPasswordMismatch => 'รหัสผ่านไม่ตรงกัน';

  @override
  String get recoverAccountTitle => 'กู้คืนบัญชีของคุณ';

  @override
  String get recoverAccountDescription =>
      'กรอกชื่อผู้ใช้และคีย์กู้คืนจากชุดกู้คืนของคุณ จากนั้นเลือกรหัสผ่านใหม่';

  @override
  String get recoverAccountNoKit =>
      'ไม่มีชุดกู้คืน? ขอลิงก์รีเซ็ตรหัสผ่านจากผู้ดูแลของอินสแตนซ์นี้';

  @override
  String get recoveryKitTitle => 'ชุดกู้คืนของคุณ';

  @override
  String get recoveryKitCreatedDescription =>
      'หากคุณลืมรหัสผ่าน ชุดกู้คืนนี้จะเป็นวิธีเดียวที่จะกลับเข้าสู่บัญชีของคุณได้ โปรดเก็บไว้ในที่ปลอดภัย เช่น ตัวจัดการรหัสผ่าน หรือพิมพ์ออกมา';

  @override
  String get recoveryKitReplacedDescription =>
      'ชุดกู้คืนเก่าของคุณใช้ไม่ได้แล้ว โปรดเก็บชุดใหม่นี้ไว้ในที่ปลอดภัย';

  @override
  String get recoveryKitRecoveredDescription =>
      'รีเซ็ต‌รหัสผ่านของคุณแล้ว ชุดกู้คืนเก่าของคุณใช้ไม่ได้อีกต่อไป เก็บชุดใหม่นี้ไว้ในที่ปลอดภัย';

  @override
  String get recoveryKitWarning =>
      'ใครก็ตามที่มีคีย์นี้สามารถรีเซ็ตรหัสผ่านของคุณได้ ห้ามแชร์เด็ดขาด';

  @override
  String get recoveryKitKeyLabel => 'คีย์การกู้คืน';

  @override
  String recoveryKitDocumentTitle(String productName) {
    return 'ชุดกู้คืน $productName';
  }

  @override
  String get recoveryKitDocumentIntro =>
      'เก็บหน้านี้ไว้ในที่ปลอดภัย หากคุณลืมรหัสผ่าน คุณสามารถใช้หน้านี้เพื่อกลับเข้าสู่บัญชีของคุณได้ ใครก็ตามที่มีคีย์การกู้คืนนี้สามารถรีเซ็ตรหัสผ่านของคุณได้ ดังนั้นอย่าแชร์ให้ใคร';

  @override
  String get recoveryKitInstanceLabel => 'อินสแตนซ์';

  @override
  String get recoveryKitCreatedAtLabel => 'สร้างเมื่อ';

  @override
  String get recoveryKitQrCaption =>
      'สแกนเพื่อเปิดหน้ากู้คืนพร้อมรายละเอียดของคุณที่กรอกไว้แล้ว';

  @override
  String get recoveryKitStepsTitle => 'วิธีเรียกคืนบัญชีของคุณ';

  @override
  String recoveryKitStepOpen(String recoverUrl) {
    return 'ไปที่ $recoverUrl หรือสแกนคิวอาร์โค้ด';
  }

  @override
  String get recoveryKitStepEnter => 'กรอกชื่อผู้ใช้และคีย์การกู้คืนนี้';

  @override
  String get recoveryKitStepPassword =>
      'เลือก รหัสผ่าน ใหม่ คุณจะได้รับชุดกู้คืนใหม่ และชุดนี้จะหยุดทำงาน';

  @override
  String get recoveryKitBackupCodesTitle =>
      'รหัสสำรองสำหรับการยืนยันสองขั้นตอน';

  @override
  String get recoveryKitBackupCodesNote =>
      'แต่ละรหัสใช้ได้ครั้งเดียวแทนแอปยืนยันตัวตนของคุณ';

  @override
  String get recoveryKitBackupCodesFailed => 'ไม่สามารถโหลดรหัสสำรองของคุณได้';

  @override
  String get recoveryKitIncludeBackupCodes =>
      'รวมรหัสสำรองการยืนยันตัวตนแบบสองขั้นตอนของฉันไว้ในรูปภาพที่บันทึก';

  @override
  String get recoveryKitCopy => 'คัดลอก';

  @override
  String get recoveryKitCopied => 'คัดลอกคีย์กู้คืนแล้ว';

  @override
  String get recoveryKitSaveImage => 'บันทึกรูปภาพ';

  @override
  String get recoveryKitSaved => 'บันทึกชุดกู้คืนแล้ว';

  @override
  String get recoveryKitSavedToPhotos => 'บันทึกชุดกู้คืนลงในรูปภาพแล้ว';

  @override
  String get recoveryKitSaveFailed =>
      'ไม่สามารถบันทึกชุดกู้คืนได้ ลองอีกครั้งหรือคัดลอกคีย์แทน';

  @override
  String get recoveryKitAcknowledge => 'ฉันได้เก็บชุดกู้คืนไว้ในที่ปลอดภัยแล้ว';

  @override
  String get recoveryKitCreateFailed =>
      'ไม่สามารถสร้างชุดกู้คืนของคุณได้ คุณสามารถสร้างได้ในภายหลังในการตั้งค่าบัญชีของคุณ';

  @override
  String get recoveryKitSectionTitle => 'ชุดกู้คืน';

  @override
  String get recoveryKitSectionDescription =>
      'ช่วยให้คุณรีเซ็ตรหัสผ่านได้หากคุณลืม';

  @override
  String get recoveryKitNone => 'คุณยังไม่มีชุดกู้คืน';

  @override
  String recoveryKitCreatedRelative(String time) {
    return 'สร้างเมื่อ $time';
  }

  @override
  String get recoveryKitCreate => 'สร้างชุดกู้คืน';

  @override
  String get recoveryKitCreateNew => 'สร้างชุดใหม่';

  @override
  String get recoveryKitReplaceTitle => 'สร้างชุดกู้คืนใหม่หรือไม่';

  @override
  String get recoveryKitReplaceDescription =>
      'ชุดข้อมูลปัจจุบันของคุณจะหยุดทำงานทันทีที่มีการสร้างชุดข้อมูลใหม่';

  @override
  String get recoveryKitReminderTitle => 'บันทึกชุดกู้คืน';

  @override
  String get recoveryKitReminderBody =>
      'บัญชีของคุณไม่มีที่อยู่อีเมล หากคุณลืมรหัสผ่าน ชุดกู้คืนจะเป็นวิธีเดียวที่จะกลับเข้าสู่ระบบได้ ใช้เวลาเพียงนาทีเดียว';

  @override
  String get registerUsernameSignInHint =>
      'คุณจะใช้ชื่อผู้ใช้นี้ในการลงชื่อเข้าใช้ เลือกชื่อที่คุณจะจำได้';

  @override
  String get registerUsernameTaken => 'ชื่อผู้ใช้นี้มีคนใช้แล้ว';

  @override
  String get registerUsernameAvailable => 'ชื่อผู้ใช้นี้ว่างอยู่';

  @override
  String get claimAccountUsernameDescription =>
      'ยืนยันบัญชีของคุณด้วยการเลือกชื่อผู้ใช้และรหัสผ่าน คุณจะใช้สิ่งเหล่านี้ในการลงชื่อเข้าใช้ ดังนั้นโปรดเลือกสิ่งที่จำได้ง่าย';

  @override
  String get unclaimedAccountDescriptionUsername =>
      'บัญชีของคุณยังไม่ได้รับการยืนยัน หากไม่มีชื่อผู้ใช้และรหัสผ่าน คุณจะไม่สามารถลงชื่อเข้าใช้จากอุปกรณ์อื่นได้ และอาจสูญเสียการเข้าถึงบัญชีของคุณ ยืนยันบัญชีของคุณตอนนี้เพื่อรักษาความปลอดภัย';

  @override
  String get addFriendUsernameOnlyHint => 'ชื่อผู้ใช้';

  @override
  String get registerTitle => 'สร้างบัญชี';

  @override
  String get registerDisplayName => 'ชื่อที่แสดง (ไม่บังคับ)';

  @override
  String get registerDisplayNameHint => 'ให้คนอื่นเรียกคุณว่าอะไรดี?';

  @override
  String get registerUsername => 'ชื่อผู้ใช้ (ไม่บังคับ)';

  @override
  String get registerUsernameHint => 'เว้นว่างไว้เพื่อสุ่มชื่อผู้ใช้';

  @override
  String get registerUsernameTagHint =>
      'จะมีการเพิ่มแท็ก 4 หลักโดยอัตโนมัติเพื่อให้แน่ใจว่าไม่ซ้ำกัน';

  @override
  String get registerDateOfBirth => 'วันเกิด';

  @override
  String get registerMonth => 'เดือน';

  @override
  String get registerDay => 'วัน';

  @override
  String get registerYear => 'ปี';

  @override
  String get registerConsentPrefix => 'ฉันยอมรับ ';

  @override
  String get registerConsentTerms => 'ข้อกำหนดในการให้บริการ';

  @override
  String get registerConsentAnd => ' และ ';

  @override
  String get registerConsentPrivacy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get registerConfirmPassword => 'ยืนยันรหัสผ่าน';

  @override
  String get registerSubmit => 'สร้างบัญชี';

  @override
  String get registerHaveAccount => 'มีบัญชีอยู่แล้วใช่ไหม ';

  @override
  String get registerPendingApproval =>
      'คำขอบัญชีของคุณกำลังรอการอนุมัติ คุณจะลงชื่อเข้าใช้ได้หลังจากผู้ดูแลระบบอนุมัติแล้ว';

  @override
  String get registerClosed =>
      'ขณะนี้ปิดการลงทะเบียนอยู่ ใช้ลิงก์ลงทะเบียนจากผู้ดูแลระบบเพื่อสร้างบัญชี';

  @override
  String get passkeyNoCredentials =>
      'ไม่พบ passkey สำหรับแอปนี้ โปรดเข้าสู่ระบบด้วยอีเมลและรหัสผ่านแทน';

  @override
  String get passkeyDeviceNotSupported => 'อุปกรณ์นี้ไม่รองรับ passkey';

  @override
  String get passkeyDomainNotAssociated =>
      'ไม่ได้กำหนดค่า passkey สำหรับแอปนี้ โปรดเข้าสู่ระบบด้วยอีเมลและรหัสผ่านแทน';

  @override
  String get passkeyTimeout =>
      'การยืนยันตัวตนด้วย passkey หมดเวลา โปรดลองอีกครั้ง';

  @override
  String get passkeyFailed => 'การยืนยันด้วยรหัสผ่านล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get errorUnableToCreateAccount =>
      'ไม่สามารถสร้างบัญชีได้ โปรดลองอีกครั้ง';

  @override
  String get errorUnableToSignIn =>
      'ไม่สามารถลงชื่อเข้าใช้ได้ในขณะนี้ โปรดลองอีกครั้ง';

  @override
  String get errorServiceUnavailable =>
      'อินสแตนซ์นี้ไม่พร้อมใช้งานชั่วคราว โปรดลองอีกครั้งในอีกสักครู่';

  @override
  String get errorInvalidEmailOrPassword => 'อีเมลหรือรหัสผ่านไม่ถูกต้อง';

  @override
  String get errorInvalidUsernameOrPassword =>
      'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง';

  @override
  String get errorUnableToSendResetLink =>
      'ไม่สามารถส่งลิงก์รีเซ็ตได้ โปรดลองอีกครั้ง';

  @override
  String get errorUnableToResetPassword =>
      'ไม่สามารถรีเซ็ตรหัสผ่านได้ โปรดลองอีกครั้ง';

  @override
  String get embedInviteJoin => 'เข้าร่วมคอมมูนิตี้';

  @override
  String get embedInviteGoTo => 'ไปที่คอมมูนิตี้';

  @override
  String embedInviteOnline(String count) {
    return '$count ออนไลน์';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count สมาชิก';
  }

  @override
  String get embedInviteUnknownTitle => 'คำเชิญที่ไม่รู้จัก';

  @override
  String get embedInviteUnknownSubtitle => 'ลองขอคำเชิญใหม่';

  @override
  String get embedInviteUnavailable => 'คำเชิญไม่พร้อมใช้งาน';

  @override
  String get embedInviteJoinGroup => 'เข้าร่วมกลุ่ม';

  @override
  String get embedInviteAlreadyJoined => 'เข้าร่วมแล้ว';

  @override
  String get embedInviteDisabled => 'ปิดใช้งานคำเชิญแล้ว';

  @override
  String get embedInvitePaused => 'ปิดรับคำเชิญสำหรับคอมมูนิตี้นี้ชั่วคราว';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName ตรวจพบการโจมตีที่อาจเกิดขึ้น ผู้ใช้ใหม่จึงไม่สามารถเข้าร่วมได้ในขณะนี้';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'คอมมูนิตี้นี้หยุดรับคำเชิญชั่วคราว ลองใหม่อีกครั้งในภายหลังได้เลย';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName ตรวจพบการโจมตีที่อาจเกิดขึ้นในคอมมูนิตี้นี้ คำเชิญถูกหยุดชั่วคราว ผู้ใช้ใหม่จึงไม่สามารถเข้าร่วมได้ในขณะนี้';
  }

  @override
  String get inviteAcceptTitle => 'คุณได้รับเชิญให้เข้าร่วม';

  @override
  String get inviteAcceptJoinButton => 'เข้าร่วมคอมมูนิตี้';

  @override
  String get inviteAcceptGoToButton => 'ไปที่คอมมูนิตี้';

  @override
  String get inviteAcceptInvitesPaused => 'ปิดรับคำเชิญชั่วคราว';

  @override
  String get inviteAcceptNotFoundTitle => 'คำเชิญไม่ถูกต้อง';

  @override
  String get inviteAcceptNotFoundDescription =>
      'คำเชิญนี้อาจหมดอายุหรือไม่ถูกต้อง';

  @override
  String get invalidDeepLinkTitle => 'ลิงก์เปิดไม่ได้';

  @override
  String get invalidDeepLinkDescription =>
      'ลิงก์นี้อาจเสีย, ใช้งานได้เฉพาะบนเว็บ, หรือคุณอาจไม่มีสิทธิ์เข้าถึง โปรดตรวจสอบลิงก์แล้วลองอีกครั้ง';

  @override
  String get invalidDeepLinkGoHomeButton => 'กลับหน้าหลัก';

  @override
  String get inviteAcceptJoinGroupButton => 'เข้าร่วมกลุ่ม';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'คุณได้รับเชิญให้เข้าร่วมกลุ่ม DM โดย $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'ใครบางคน';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'ไม่สามารถเข้าถึงช่องได้';

  @override
  String get channelAccessDeniedDescription =>
      'คุณไม่มีสิทธิ์เข้าถึงช่องที่มีการส่งข้อความนี้';

  @override
  String get messageJumpLinkNoAccess => 'ไม่สามารถเข้าถึงได้';

  @override
  String get okay => 'ตกลง';

  @override
  String get embedThemeTitle => 'ธีมที่แชร์';

  @override
  String get embedThemeWebOnly =>
      'นำเข้าธีมได้เฉพาะบนเว็บหรือเดสก์ท็อปเท่านั้น';

  @override
  String get embedThemeImport => 'นำเข้าธีม';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (ตลอดชีพ $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วันของ $productName',
      one: '1 วันของ $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count สัปดาห์ของ $productName',
      one: '1 สัปดาห์ของ $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count เดือนสำหรับ $productName',
      one: '1 เดือนสำหรับ $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ปีของ $productName',
      one: '1 ปีของ $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'จาก $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'คลิกเพื่อรับของขวัญของคุณ!';

  @override
  String get embedGiftAlreadyRedeemed => 'แลกไปแล้ว';

  @override
  String get embedGiftClaimAccountHelp => 'ยืนยันบัญชีเพื่อรับของขวัญนี้';

  @override
  String get embedGiftClaim => 'รับของขวัญ';

  @override
  String get embedGiftClaimed => 'รับของขวัญแล้ว';

  @override
  String get embedGiftClaimAccount => 'ยืนยันบัญชีเพื่อรับของขวัญ';

  @override
  String get embedGiftUnknownTitle => 'ของขวัญที่ไม่รู้จัก';

  @override
  String get embedGiftUnknownSubtitle =>
      'รหัสของขวัญนี้ไม่ถูกต้องหรือถูกรับไปแล้ว';

  @override
  String get embedGiftUnavailable => 'ของขวัญไม่พร้อมใช้งาน';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'รับของขวัญของคุณเพื่อเปิดใช้งานการสมัครสมาชิก $productName ของคุณ!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'ของขวัญชิ้นนี้ถูกรับไปแล้ว';

  @override
  String get giftAcceptMaybeLater => 'ไว้ทีหลัง';

  @override
  String get giftRedeemedToast => 'แลกของขวัญแล้ว!';

  @override
  String get giftRedeemInvalidTitle => 'รหัสของขวัญไม่ถูกต้อง';

  @override
  String get giftRedeemInvalidMessage => 'รหัสนี้ไม่ถูกต้องหรือถูกใช้ไปแล้ว';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'ของขวัญถูกแลกไปแล้ว';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'รหัสนี้ถูกแลกไปแล้ว';

  @override
  String get giftRedeemNotFoundTitle => 'ไม่พบของขวัญ';

  @override
  String get giftRedeemNotFoundMessage => 'รหัสนี้ไม่มีอยู่จริง';

  @override
  String get giftRedeemFailedTitle => 'ไม่สามารถแลกของขวัญได้';

  @override
  String get giftRedeemFailedMessage => 'แลกของขวัญนี้ไม่ได้ ลองอีกครั้ง';

  @override
  String get giftVisionaryCannotRedeemTitle => 'ไม่สามารถแลกของขวัญชิ้นนี้ได้';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'บัญชี Visionary ไม่สามารถแลกรับ Plutonium ได้ คัดลอกลิงก์เพื่อแชร์กับเพื่อนแทน';

  @override
  String get giftCopyLink => 'คัดลอกลิงก์ของขวัญ';

  @override
  String get privacySettings => 'การตั้งค่าความเป็นส่วนตัว';

  @override
  String get privacyDirectMessages => 'ข้อความส่วนตัว';

  @override
  String get privacyDirectMessagesDescription =>
      'อนุญาตข้อความส่วนตัวจากสมาชิกคนอื่นในชุมชนนี้';

  @override
  String get privacyBotDirectMessages => 'ข้อความส่วนตัวจากบอท';

  @override
  String get privacyBotDirectMessagesDescription =>
      'อนุญาตให้บอทจากชุมชนนี้ส่งข้อความส่วนตัวถึงคุณ';

  @override
  String get privacyMutualDmsDisabled =>
      'ผู้ดูแลชุมชนได้ปิดใช้งานการรับข้อความส่วนตัวจากสมาชิกที่ติดต่อกันในชุมชนนี้เท่านั้น';

  @override
  String get communityDebug => 'แก้ไขข้อผิดพลาดของคอมมูนิตี้';

  @override
  String get copiedToClipboard => 'คัดลอกไปยังคลิปบอร์ดแล้ว';

  @override
  String get notificationSettings => 'การตั้งค่าการแจ้งเตือน';

  @override
  String notificationMuteGuild(String guildName) {
    return 'ปิดเสียง $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'การปิดเสียงชุมชนจะป้องกันไม่ให้ตัวบ่งชี้ที่ยังไม่ได้อ่านและการแจ้งเตือนปรากฏขึ้น เว้นแต่คุณจะถูกกล่าวถึง';

  @override
  String get notificationCommunitySettings =>
      'การตั้งค่าการแจ้งเตือนของคอมมูนิตี้';

  @override
  String get notificationAllMessages => 'ข้อความทั้งหมด';

  @override
  String get notificationOnlyMentions => 'เฉพาะการกล่าวถึง';

  @override
  String get notificationNothing => 'ไม่แจ้งเตือน';

  @override
  String get notificationSuppressEveryone => 'ระงับ @everyone และ @here';

  @override
  String get notificationSuppressRoles => 'ปิดเสียงการกล่าวถึงบทบาททั้งหมด';

  @override
  String get notificationMobilePush => 'การแจ้งเตือนบนมือถือ';

  @override
  String get notificationOverrides => 'การตั้งค่าการแจ้งเตือนเฉพาะกลุ่ม';

  @override
  String get notificationSelectChannel => 'เลือกช่องหรือหมวดหมู่';

  @override
  String get notificationOnlyAtMentions => 'เฉพาะการกล่าวถึงเท่านั้น';

  @override
  String get notificationMuteChannel => 'ปิดเสียงช่อง';

  @override
  String get notificationUnmuteChannel => 'เลิกปิดเสียงช่อง';

  @override
  String get notificationUseCategoryDefault => 'ใช้ค่าเริ่มต้นของหมวดหมู่';

  @override
  String get notificationUseCommunityDefault => 'ใช้ค่าเริ่มต้นของชุมชน';

  @override
  String get notificationNoCategory => 'ไม่มีหมวดหมู่';

  @override
  String get dmMarkAsRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get dmMuteConversation => 'ปิดเสียงข้อความส่วนตัวนี้';

  @override
  String get dmUnmuteConversation => 'เลิกปิดเสียงข้อความส่วนตัวนี้';

  @override
  String get dmPinDm => 'ปักหมุดข้อความส่วนตัว';

  @override
  String get dmUnpinDm => 'เลิกปักหมุดข้อความส่วนตัว';

  @override
  String get dmAlwaysShowInSidebar => 'แสดงในแถบด้านข้างเสมอ';

  @override
  String get dmRemoveFromAlwaysShown => 'นำออกจากรายการที่แสดงเสมอ';

  @override
  String get dmCloseDm => 'ปิดข้อความส่วนตัว';

  @override
  String get dmCloseDmConfirmTitle => 'ปิดข้อความส่วนตัว';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการปิด DM กับ $username? คุณสามารถเปิดใหม่ได้ตลอดเวลา';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'ลบข้อความของคุณในการสนทนานี้ใช่หรือไม่';

  @override
  String get dmDeleteMyMessagesDescription =>
      'ข้อความทั้งหมดที่คุณเคยส่งในการสนทนานี้จะถูกลบอย่างถาวร การดำเนินการนี้ไม่สามารถเลิกทำได้';

  @override
  String get dmCopyChannelId => 'คัดลอก ID ช่อง';

  @override
  String get dmChannelIdCopied => 'คัดลอก ID ช่องแล้ว';

  @override
  String get dmCopyUserId => 'คัดลอก ID ผู้ใช้';

  @override
  String get dmUserIdCopied => 'คัดลอก ID ผู้ใช้แล้ว';

  @override
  String get dmViewProfile => 'ดูโปรไฟล์';

  @override
  String get dmVoiceCall => 'เริ่มโทรด้วยเสียง';

  @override
  String get incomingVoiceCallTitle => 'สายเรียกเข้า';

  @override
  String get incomingVoiceCallAccept => 'รับสาย';

  @override
  String get incomingVoiceCallDecline => 'ปฏิเสธ';

  @override
  String get incomingVoiceCallLabel => 'สายเรียกเข้า';

  @override
  String get incomingVoiceCallIgnore => 'ไม่สนใจ';

  @override
  String get directVoiceCallNotEligible =>
      'ไม่สามารถเริ่มการโทรนี้ได้ในขณะนี้ โปรดลองอีกครั้งในภายหลัง';

  @override
  String get voiceJoinCallFailed =>
      'ไม่สามารถเชื่อมต่อกับสายนี้ได้ โปรดตรวจสอบการเชื่อมต่อของคุณและลองอีกครั้ง';

  @override
  String get voiceJoinIncomingCallFailed =>
      'ไม่สามารถเข้าร่วมสายนี้ได้ โปรดตรวจสอบการเชื่อมต่อของคุณและลองอีกครั้ง';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'ไม่สามารถอัปเดตสายนี้บนเซิร์ฟเวอร์ได้ โปรดตรวจสอบการเชื่อมต่อของคุณและลองอีกครั้ง';

  @override
  String get dmAddNote => 'เพิ่มโน้ต';

  @override
  String get dmEditGroup => 'แก้ไขกลุ่ม';

  @override
  String get dmInviteToCommunity => 'เชิญเข้าคอมมูนิตี้';

  @override
  String get dmBlock => 'บล็อก';

  @override
  String get dmLeaveGroup => 'ออกจากกลุ่ม';

  @override
  String dmInviteSentFor(String communityName) {
    return 'ส่งคำเชิญเข้าร่วม $communityName แล้ว';
  }

  @override
  String get dmInviteSendFailed => 'ส่งคำเชิญไม่ได้ ลองอีกครั้ง';

  @override
  String dmGroupMemberCount(int count) {
    return '$count คน';
  }

  @override
  String get dmMuteFor15Min => 'เป็นเวลา 15 นาที';

  @override
  String get dmMuteFor30Min => 'เป็นเวลา 30 นาที';

  @override
  String get dmMuteFor1Hour => 'เป็นเวลา 1 ชั่วโมง';

  @override
  String get dmMuteFor3Hours => 'เป็นเวลา 3 ชั่วโมง';

  @override
  String get dmMuteFor4Hours => 'เป็นเวลา 4 ชั่วโมง';

  @override
  String get dmMuteFor8Hours => 'เป็นเวลา 8 ชั่วโมง';

  @override
  String get dmMuteFor24Hours => 'เป็นเวลา 24 ชั่วโมง';

  @override
  String get dmMuteFor3Days => 'เป็นเวลา 3 วัน';

  @override
  String get dmMuteForever => 'จนกว่าฉันจะเปิดอีกครั้ง';

  @override
  String get dmPinGroupDm => 'ปักหมุดแชทกลุ่ม';

  @override
  String get dmUnpinGroupDm => 'เลิกปักหมุดแชทกลุ่ม';

  @override
  String get dmUnnamedGroup => 'กลุ่มที่ไม่มีชื่อ';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'กลุ่มของ$resolvedName';
  }

  @override
  String get dmFavoriteDm => 'เพิ่มข้อความส่วนตัวในรายการโปรด';

  @override
  String get dmUnfavoriteDm => 'นำข้อความส่วนตัวออกจากรายการโปรด';

  @override
  String get dmFavoriteGroupDm => 'เพิ่มแชทกลุ่มในรายการโปรด';

  @override
  String get dmUnfavoriteGroupDm => 'นำแชทกลุ่มออกจากรายการโปรด';

  @override
  String get dmChangeFriendNickname => 'เปลี่ยนชื่อเล่นเพื่อน';

  @override
  String get dmRemoveFriend => 'ลบเพื่อน';

  @override
  String get dmAddFriend => 'เพิ่มเพื่อน';

  @override
  String get dmAcceptFriendRequest => 'ตอบรับคำขอเป็นเพื่อน';

  @override
  String get dmIgnoreFriendRequest => 'ไม่สนใจคำขอเป็นเพื่อน';

  @override
  String get dmFriendRequestSent => 'ส่งคำขอเป็นเพื่อนแล้ว';

  @override
  String get dmUnblock => 'เลิกบล็อก';

  @override
  String get dmDebugUser => 'ดีบักผู้ใช้';

  @override
  String get dmDebugChannel => 'ดีบักช่อง';

  @override
  String get dmDebugCategory => 'ดีบักหมวดหมู่';

  @override
  String get dmPinned => 'ปักหมุดข้อความส่วนตัวแล้ว';

  @override
  String get dmUnpinned => 'เลิกปักหมุดข้อความส่วนตัวแล้ว';

  @override
  String get dmMuted => 'ปิดเสียง DM';

  @override
  String get dmUnmuted => 'เปิดเสียง DM';

  @override
  String get dmRemoveFriendConfirmTitle => 'ลบเพื่อน';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $username ออกจากการเป็นเพื่อน?';
  }

  @override
  String get dmBlockConfirmTitle => 'บล็อกผู้ใช้';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการบล็อก $username? เขา/เธอจะไม่สามารถส่งข้อความหรือส่งคำขอเป็นเพื่อนถึงคุณได้';
  }

  @override
  String get dmFriendRequestSentToast => 'ส่งคำขอเป็นเพื่อนแล้ว';

  @override
  String get dmFriendRequestFailed => 'ส่งคำขอเป็นเพื่อนไม่สำเร็จ';

  @override
  String get dmAcceptFriendRequestFailed => 'ยอมรับคำขอเป็นเพื่อนไม่สำเร็จ';

  @override
  String get dmRemoveFriendFailed => 'ลบเพื่อนไม่สำเร็จ';

  @override
  String get dmBlockFailed => 'บล็อกผู้ใช้ไม่สำเร็จ';

  @override
  String get dmUnblockFailed => 'เลิกบล็อกผู้ใช้ไม่สำเร็จ';

  @override
  String get dmIgnoreFriendRequestFailed => 'เพิกเฉยต่อคำขอเป็นเพื่อนไม่สำเร็จ';

  @override
  String get dmAddFriends => 'เพิ่มเพื่อน';

  @override
  String get addFriendSheetTitle => 'เพิ่มเพื่อน';

  @override
  String get addFriendUsernameHint => 'ชื่อผู้ใช้#0000';

  @override
  String get addFriendUsernameLabel => 'ชื่อผู้ใช้ของเพื่อน';

  @override
  String get addFriendSendRequest => 'ส่งคำขอ';

  @override
  String get addFriendNoUserFound => 'ไม่พบผู้ใช้ที่มีชื่อผู้ใช้นี้';

  @override
  String get addFriendInvalidUsername =>
      'ป้อนชื่อผู้ใช้ที่ถูกต้อง (ชื่อผู้ใช้#0000)';

  @override
  String get addFriendOutgoingSuccess => 'ส่งคำขอเป็นเพื่อนแล้ว';

  @override
  String get addFriendClaimTitle => 'ยืนยันบัญชีของคุณ';

  @override
  String get addFriendClaimDescription => 'ยืนยันบัญชีเพื่อส่งคำขอเป็นเพื่อน';

  @override
  String get addFriendVerifyTitle => 'ยืนยันอีเมลของคุณ';

  @override
  String get addFriendVerifyDescription =>
      'คุณต้องยืนยันอีเมลก่อนจึงจะส่งคำขอเป็นเพื่อนได้';

  @override
  String get addFriendVerifyEmail => 'ยืนยันอีเมล';

  @override
  String addFriendIncomingRequests(int count) {
    return 'คำขอเป็นเพื่อนที่เข้ามา ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'คำขอเป็นเพื่อนที่ส่งออก ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'คำขอเป็นเพื่อนที่ได้รับ';

  @override
  String get addFriendOutgoingStatus => 'ส่งคำขอเป็นเพื่อนแล้ว';

  @override
  String get addFriendViewProfile => 'ดูโปรไฟล์';

  @override
  String get addFriendAccept => 'ยอมรับ';

  @override
  String get addFriendIgnore => 'ไม่สนใจ';

  @override
  String get addFriendAcceptTitle => 'ตอบรับคำขอเป็นเพื่อน';

  @override
  String get addFriendIgnoreTitle => 'ไม่สนใจคำขอเป็นเพื่อน';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'ยอมรับคำขอเป็นเพื่อนจาก $userName หรือไม่';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'ไม่สนใจคำขอเป็นเพื่อนจาก $displayName ใช่ไหม';
  }

  @override
  String get addFriendCancelRequest => 'ยกเลิกคำขอ';

  @override
  String get addFriendCancelRequestFailed =>
      'ยกเลิกคำขอเป็นเพื่อนไม่ได้ ลองอีกครั้ง';

  @override
  String get addFriendNotAcceptingRequests =>
      'ขณะนี้พวกเขาไม่รับคำขอเป็นเพื่อน';

  @override
  String get addFriendUnblockFirst =>
      'หากต้องการส่งคำขอเป็นเพื่อน ให้เลิกบล็อกผู้ใช้รายนี้ก่อน';

  @override
  String get addFriendCannotSendToSelf =>
      'คุณไม่สามารถส่งคำขอเป็นเพื่อนให้ตัวเองได้';

  @override
  String get addFriendAlreadyFriends => 'คุณเป็นเพื่อนกับผู้ใช้นี้อยู่แล้ว';

  @override
  String get addFriendClaimToSend =>
      'ลงทะเบียนให้เสร็จสิ้นเพื่อส่งคำขอเป็นเพื่อน';

  @override
  String get addFriendVerifyToSend => 'ยืนยันอีเมลของคุณก่อนส่งคำขอเป็นเพื่อน';

  @override
  String get addFriendFriendsListFull =>
      'รายชื่อเพื่อนของคุณหรือของอีกฝ่ายเต็มแล้ว ลบเพื่อนบางคนออกแล้วลองอีกครั้ง';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'ระบบ';

  @override
  String get emojiSearchPlaceholder => 'ค้นหาอิโมจิที่คุณชอบ';

  @override
  String get emojiSearchEmpty => 'ไม่มีอิโมจิที่ตรงกับการค้นหาของคุณ';

  @override
  String get emojiAutocompleteDefaultLabel => 'อิโมจิเริ่มต้น';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'นี่คืออิโมจิเริ่มต้นบน $productName';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'อิโมจินี้มาจากชุมชนนี้ คุณสามารถใช้ได้ทุกที่';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'นี่คืออิโมจิที่กำหนดเองจากคอมมูนิตี้';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'นี่คืออิโมจิที่กำหนดเองจากชุมชน ลองขอให้ผู้สร้างเชิญคุณเพื่อใช้อิโมจินี้';

  @override
  String get emojiInfoFromHeader => 'อิโมจินี้มาจาก';

  @override
  String get emojiInfoDiscoverableCommunity => 'คอมมูนิตี้ที่เปิดให้ค้นพบได้';

  @override
  String get emojiInfoPrivateCommunity => 'ชุมชนส่วนตัว';

  @override
  String get emojiInfoVerifiedCommunity => 'คอมมูนิตี้ที่ยืนยันแล้ว';

  @override
  String get emojiInfoAddToFavorites => 'เพิ่มในรายการโปรด';

  @override
  String get emojiInfoRemoveFromFavorites => 'นำออกจากรายการโปรด';

  @override
  String get emojiFrequentlyUsed => 'ใช้บ่อย';

  @override
  String get emojiTabGifs => 'GIF';

  @override
  String get emojiTabMedia => 'สื่อ';

  @override
  String get emojiTabStickers => 'สติกเกอร์';

  @override
  String get emojiTabEmojis => 'อิโมจิ';

  @override
  String get gifPickerSearch => 'ค้นหา GIF';

  @override
  String get gifPickerSearchKlipy => 'ค้นหา KLIPY';

  @override
  String get gifPickerSearchTenor => 'ค้นหา Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'รายการโปรด';

  @override
  String get gifPickerFavoritesEmptyTitle => 'ยังไม่มี GIF ในรายการโปรด';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'ปักหมุด GIF ที่ชอบเพื่อดูที่นี่';

  @override
  String get gifPickerTrending => 'GIF ยอดนิยม';

  @override
  String get gifPickerNoResultsTitle => 'ไม่พบผลการค้นหา';

  @override
  String get gifPickerNoResultsDescription => 'ลองใช้คำค้นหาอื่น';

  @override
  String get gifPickerLoadFailedTitle => 'ไม่สามารถโหลด GIF ได้';

  @override
  String get gifPickerLoadFailedBody =>
      'ตรวจสอบการเชื่อมต่อของคุณแล้วลองอีกครั้ง';

  @override
  String get emojiCategoryPeople => 'ผู้คน';

  @override
  String get emojiCategoryNature => 'ธรรมชาติ';

  @override
  String get emojiCategoryFood => 'อาหารและเครื่องดื่ม';

  @override
  String get emojiCategoryActivity => 'กิจกรรม';

  @override
  String get emojiCategoryTravel => 'การเดินทางและสถานที่';

  @override
  String get emojiCategoryObjects => 'สิ่งของ';

  @override
  String get emojiCategorySymbols => 'สัญลักษณ์';

  @override
  String get emojiCategoryFlags => 'ธง';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'ปลดล็อก $emojiCount จาก $communityCount ด้วย Plutonium';
  }

  @override
  String get emojiPlutoniumUpsellDismiss => 'ไม่ต้องแสดงอีก';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'อิโมจีแบบกำหนดเอง $count รายการ',
      one: 'อิโมจีแบบกำหนดเอง 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ชุมชน',
      one: '1 ชุมชน',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'คำเตือนลิงก์ภายนอก';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'คุณกำลังจะออกจาก $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'ลิงก์ภายนอกอาจเป็นอันตราย โปรดระมัดระวัง';

  @override
  String get externalLinkWarningDestinationUrl => 'URL ปลายทาง:';

  @override
  String get externalLinksSectionTitle => 'ลิงก์ภายนอก';

  @override
  String get externalLinksSectionDescription =>
      'กำหนดค่าวิธีการจัดการคำเตือนลิงก์ภายนอก';

  @override
  String get externalLinkWarningTrustPrefix => 'เชื่อถือ ';

  @override
  String get externalLinkWarningTrustSuffix => ' — ข้ามคำเตือนนี้ในครั้งต่อไป';

  @override
  String get externalLinkVisitSite => 'เยี่ยมชมเว็บไซต์';

  @override
  String get externalLinkTrustAllLabel => 'เชื่อถือลิงก์ภายนอกทั้งหมด';

  @override
  String get externalLinkStripTrackingLabel => 'ลบพารามิเตอร์ติดตามออกจาก URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'ลบพารามิเตอร์ติดตาม (เช่น utm_source, fbclid, gclid) ออกจาก URL ในข้อความที่คุณส่งโดยอัตโนมัติ ลิงก์จะถูกล้างข้อมูลก่อนถึงผู้รับ';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'เชื่อถือลิงก์ภายนอกทั้งหมดหรือไม่';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'การดำเนินการนี้จะเชื่อถือลิงก์ภายนอกทั้งหมดและข้ามคำเตือนสำหรับทุกโดเมน โดเมนที่เชื่อถืออยู่เดิมของคุณจะถูกแทนที่ ซึ่งมีความปลอดภัยน้อยกว่า';

  @override
  String get externalLinkTrustAllConfirmAction => 'เชื่อถือทั้งหมด';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'เลิกเชื่อถือลิงก์ทั้งหมดหรือไม่';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'ระบบจะแสดงคำเตือนลิงก์ภายนอกอีกครั้ง คุณจะต้องเพิ่มโดเมนที่เชื่อถือได้ทีละรายการ';

  @override
  String get externalLinkStopTrustingAllAction => 'ปิดการเชื่อถือทั้งหมด';

  @override
  String get externalLinkTrustedAllDescription =>
      'ลิงก์ภายนอกทั้งหมดเชื่อถือได้ จะไม่มีการแสดงคำเตือน';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'คุณมีโดเมนที่เชื่อถือ $count รายการ เพิ่มเติมได้โดยการทำเครื่องหมายที่ช่องเมื่อเยี่ยมชมลิงก์ภายนอก';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'เมื่อเปิดใช้งาน จะไม่มีการแสดงคำเตือนลิงก์ภายนอก ซึ่งมีความปลอดภัยน้อยกว่า';

  @override
  String get imageFileTooLarge =>
      'ไฟล์รูปภาพมีขนาดใหญ่เกินไป โปรดเลือกไฟล์ที่มีขนาดเล็กกว่า 10 MB';

  @override
  String get animatedAvatarsRequirePlutonium =>
      'อวาตาร์เคลื่อนไหวต้องใช้ Plutonium';

  @override
  String get animatedBannersRequirePlutonium =>
      'แบนเนอร์เคลื่อนไหวต้องใช้ Plutonium';

  @override
  String get animatedAvifNotSupported => 'ไม่รองรับ AVIF แบบเคลื่อนไหว';

  @override
  String get animatedAvifNotSupportedBody =>
      'การครอบตัดและหมุนไฟล์ AVIF แบบเคลื่อนไหวยังไม่รองรับ หากคุณดำเนินการต่อ ไฟล์จะถูกอัปโหลดในรูปแบบเดิม';

  @override
  String get uploadAsIs => 'อัปโหลดตามเดิม';

  @override
  String get croppingAnimatedNotSupported =>
      'การครอบตัดรูปภาพเคลื่อนไหวยังไม่รองรับ จะใช้ไฟล์ที่อัปโหลดต้นฉบับ';

  @override
  String get cropAvatar => 'ครอบตัดรูปโปรไฟล์';

  @override
  String get cropBanner => 'ครอบตัดแบนเนอร์';

  @override
  String get skip => 'ข้าม';

  @override
  String get crop => 'ครอบตัด';

  @override
  String get cropTouchHint => 'Pinch to zoom, drag to reposition';

  @override
  String get cropMouseHint => 'Drag corners to resize, drag inside to move';

  @override
  String get changeYourFluxerTag => 'เปลี่ยนชื่อผู้ใช้';

  @override
  String get fluxerTagDescriptionBase =>
      'ชื่อผู้ใช้ใช้ได้เฉพาะตัวอักษร (a-z, A-Z) ตัวเลข (0-9) และขีดล่างเท่านั้น ชื่อผู้ใช้ไม่คำนึงถึงตัวพิมพ์เล็กหรือใหญ่';

  @override
  String get fluxerTagDescriptionVisionary =>
      'ชื่อผู้ใช้สามารถมีได้เฉพาะตัวอักษร (a-z, A-Z) ตัวเลข (0-9) และขีดล่างเท่านั้น ชื่อผู้ใช้ไม่คำนึงถึงตัวพิมพ์เล็ก/ใหญ่ คุณสามารถเลือกแท็ก 4 หลักที่มีอยู่ได้ตั้งแต่ #0000 ถึง #9999';

  @override
  String get fluxerTagDescriptionPremium =>
      'ชื่อผู้ใช้สามารถมีได้เฉพาะตัวอักษร (a-z, A-Z) ตัวเลข (0-9) และขีดล่างเท่านั้น ชื่อผู้ใช้ไม่คำนึงถึงตัวพิมพ์เล็ก/ใหญ่ คุณสามารถเลือกแท็ก 4 หลักที่มีอยู่ได้ตั้งแต่ #0001 ถึง #9999';

  @override
  String validationLengthRange(int min, int max) {
    return 'ระหว่าง $min ถึง $max ตัวอักษร';
  }

  @override
  String get validationAllowedChars =>
      'ตัวอักษร (a-z, A-Z), ตัวเลข (0-9) และขีดล่าง (_) เท่านั้น';

  @override
  String get fluxerTagAlreadyTaken => 'ชื่อผู้ใช้ถูกใช้ไปแล้ว';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'ชื่อผู้ใช้ $username#$discriminator มีผู้ใช้แล้ว การดำเนินการต่อจะสุ่มเลือกตัวเลขประจำตัวของคุณใหม่โดยอัตโนมัติ';
  }

  @override
  String get customTagIsTemporary => 'แท็กที่กำหนดเองมีผลชั่วคราว';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'แท็ก 4 หลักที่กำหนดเองของคุณจะใช้งานได้เฉพาะเมื่อการสมัครสมาชิก Plutonium ของคุณยังคงใช้งานอยู่ เมื่อการสมัครสมาชิกของคุณหมดอายุในวันที่ $date แท็กของคุณจะกลับไปเป็นหมายเลขที่สุ่มเลือกหลังจากช่วงผ่อนผัน 3 วัน';
  }

  @override
  String get customTagTemporaryBody =>
      'แท็ก 4 หลักที่กำหนดเองของคุณจะใช้งานได้เฉพาะเมื่อการสมัครสมาชิก Plutonium ของคุณยังคงใช้งานอยู่ เมื่อการสมัครสมาชิกของคุณหมดอายุ แท็กของคุณจะกลับไปเป็นหมายเลขที่สุ่มเลือกหลังจากช่วงผ่อนผัน 3 วัน';

  @override
  String get iUnderstandContinue => 'ฉันเข้าใจแล้ว ดำเนินการต่อ';

  @override
  String get premiumWarningPendingDiscriminator =>
      'หากคุณบันทึก ชื่อผู้ใช้ นี้ แท็ก 4 หลักที่กำหนดเองของคุณจะกลับไปเป็นหมายเลขสุ่มเมื่อการสมัครสมาชิก Plutonium ของคุณสิ้นสุดลง หากการสมัครสมาชิกของคุณต่ออายุไม่สำเร็จ คุณจะมีช่วงผ่อนผัน 3 วันก่อนที่แท็กจะเปลี่ยนแปลง';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'แท็ก 4 หลักที่กำหนดเองของคุณ (#$discriminator) จะใช้งานได้ในขณะที่การสมัครสมาชิก Plutonium ของคุณยังคงใช้งานอยู่ หากการสมัครสมาชิกของคุณสิ้นสุดลงหรือต่ออายุไม่สำเร็จหลังจากช่วงผ่อนผัน 3 วัน แท็กของคุณจะกลับไปเป็นหมายเลขสุ่ม';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'ปรับแต่งแท็ก 4 หลักของคุณ หรือเก็บไว้เมื่อเปลี่ยนชื่อผู้ใช้';

  @override
  String get fluxerTagUpdated => 'อัปเดตชื่อผู้ใช้แล้ว';

  @override
  String get fluxerTagUpdateFailed =>
      'ไม่สามารถอัปเดต ชื่อผู้ใช้ ได้ โปรดลองอีกครั้ง';

  @override
  String get continueAction => 'ดำเนินการต่อ';

  @override
  String get profileCustomizationTitle => 'ปรับแต่งโปรไฟล์';

  @override
  String get profileCustomizationDescription =>
      'แก้ไขรูปลักษณ์โปรไฟล์ของคุณและดูตัวอย่างแบบเรียลไทม์';

  @override
  String get usernameLabel => 'ชื่อผู้ใช้';

  @override
  String get claimAccountToChangeFluxerTag =>
      'ยืนยันบัญชีเพื่อเปลี่ยนชื่อผู้ใช้';

  @override
  String get changeFluxerTag => 'เปลี่ยนชื่อผู้ใช้';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'ปรับแต่งแท็ก 4 หลักของคุณ (#$discriminator) ได้ตามต้องการด้วย Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'เปลี่ยนชื่อผู้ใช้และแท็ก 4 หลักของคุณ';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'แท็กแบบกำหนดเองของคุณ (#$discriminator) เชื่อมโยงกับการสมัครสมาชิก Plutonium ของคุณ และจะกลับไปเป็นแท็กแบบสุ่มหากหมดอายุ';
  }

  @override
  String get displayNameLabel => 'ชื่อที่แสดง';

  @override
  String get pronounsLabel => 'คำสรรพนาม';

  @override
  String get avatarLabel => 'รูปโปรไฟล์';

  @override
  String get changeAvatar => 'เปลี่ยนรูปโปรไฟล์';

  @override
  String get removeAvatar => 'ลบรูปโปรไฟล์';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. สูงสุด 10MB. แนะนำ: 512×512px';

  @override
  String get bannerLabel => 'แบนเนอร์';

  @override
  String get changeBanner => 'เปลี่ยนภาพปก';

  @override
  String get removeBanner => 'ลบแบนเนอร์';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. สูงสุด 10MB. ขั้นต่ำ: 960×540px (16:9)';

  @override
  String get accentColorLabel => 'สีเน้น';

  @override
  String get accentColorDescription =>
      'ปรับแต่งสีขอบและแบนเนอร์ในโปรไฟล์ของคุณ';

  @override
  String get aboutMeLabel => 'เกี่ยวกับฉัน';

  @override
  String get aboutMeHelperText => 'คุณสามารถใช้ลิงก์ อิโมจิ และมาร์กดาวน์ได้';

  @override
  String get emojiPickerTitle => 'อิโมจิ';

  @override
  String get plutoniumBadgePrivacyTitle => 'ความเป็นส่วนตัวของป้าย Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'ควบคุมวิธีแสดงป้าย Plutonium ของคุณให้ผู้อื่นเห็น';

  @override
  String get hidePlutoniumBadgeLabel => 'ซ่อนป้าย Plutonium ทั้งหมด';

  @override
  String get hidePlutoniumBadgeDescription =>
      'ซ่อนป้าย Plutonium ของคุณจากผู้ใช้อื่นอย่างสมบูรณ์';

  @override
  String get hidePlutoniumPurchaseDate => 'ซ่อนวันที่ซื้อ Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'ซ่อนวันที่ซื้อ Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'ลบวันที่คุณซื้อ Plutonium ครั้งแรกออกจากป้ายของคุณ';

  @override
  String get maskVisionaryAsSubscription =>
      'แสดง Visionary เป็นการสมัครสมาชิกทั่วไป';

  @override
  String get maskVisionaryDescription =>
      'แสดง Visionary เป็นการสมัครสมาชิกปกติแทน';

  @override
  String get hideVisionaryIdBadge => 'ซ่อนป้าย Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'ซ่อนป้าย ID Visionary (#$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'นำป้าย Visionary ID ออก';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. สูงสุด 10MB. แนะนำ: 512×512px. อวาตาร์เคลื่อนไหว (GIF) ต้องใช้ Plutonium';

  @override
  String get bannerPlutoniumUpsell =>
      'ปรับแต่งโปรไฟล์ของคุณด้วยรูปภาพแบนเนอร์แบบคงที่หรือเคลื่อนไหวเพื่อให้โดดเด่น';

  @override
  String get getPlutonium => 'รับ Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'ยังไม่สามารถซื้อภายในแอปได้บนแพลตฟอร์มนี้ โปรดติดตาม — เร็วๆ นี้!';

  @override
  String get profilePreviewLabel => 'ตัวอย่าง';

  @override
  String get profilePreviewMessage => 'ข้อความ';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'เป็นสมาชิก $productName ตั้งแต่';
  }

  @override
  String get unclaimedAccountTitle => 'บัญชีที่ยังไม่ได้ยืนยัน';

  @override
  String get unclaimedAccountDescription =>
      'บัญชีของคุณยังไม่ถูกอ้างสิทธิ์ หากไม่มีอีเมลและรหัสผ่าน คุณอาจสูญเสียการเข้าถึง อ้างสิทธิ์บัญชีของคุณตอนนี้เพื่อรักษาความปลอดภัย';

  @override
  String get claimAccount => 'ยืนยันบัญชี';

  @override
  String get profileTypeLabel => 'ประเภทโปรไฟล์';

  @override
  String get profileTypeGlobal => 'โปรไฟล์ส่วนกลาง';

  @override
  String get profileTypeGuildDescription =>
      'คุณกำลังแก้ไขโปรไฟล์เฉพาะสำหรับคอมมูนิตี้นี้ โปรไฟล์นี้จะแสดงเฉพาะในคอมมูนิตี้นี้เท่านั้นและจะใช้แทนโปรไฟล์ส่วนกลางของคุณ';

  @override
  String get communityNicknameLabel => 'ชื่อเล่นในคอมมูนิตี้';

  @override
  String get perGuildPremiumUpsellText =>
      'การปรับแต่งอวาตาร์, แบนเนอร์, สีเน้น และประวัติส่วนตัวสำหรับแต่ละชุมชนต้องใช้ Plutonium ชื่อเล่นและคำสรรพนามในชุมชนนั้นฟรีสำหรับทุกคน';

  @override
  String get avatarModeInherit => 'ใช้โปรไฟล์ส่วนกลาง';

  @override
  String get avatarModeCustom => 'ใช้รูปภาพที่กำหนดเอง';

  @override
  String get avatarModeUnset => 'ไม่แสดง';

  @override
  String get profileSavedToast => 'อัปเดตโปรไฟล์แล้ว';

  @override
  String get sudoTitle => 'ยืนยันตัวตนของคุณ';

  @override
  String get sudoDescription =>
      'การดำเนินการนี้ต้องมีการยืนยันเพื่อดำเนินการต่อ';

  @override
  String get sudoAuthenticatorCode => 'รหัสยืนยันตัวตน';

  @override
  String get sudoMethodPassword => 'รหัสผ่าน';

  @override
  String get sudoMethodTotp => 'แอปยืนยันตัวตน';

  @override
  String get sudoVerificationFailed => 'การยืนยันล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get securityAccountTitle => 'บัญชี';

  @override
  String get securityAccountDescription =>
      'จัดการอีเมล, รหัสผ่าน และการตั้งค่าบัญชีของคุณ';

  @override
  String get securitySectionTitle => 'ความปลอดภัย';

  @override
  String get securitySectionDescription =>
      'ปกป้องบัญชีของคุณด้วยการยืนยันตัวตนสองชั้นและรหัสผ่าน';

  @override
  String get securityLoginEmailSectionTitle => 'การตั้งค่าอีเมล';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'จัดการที่อยู่อีเมลที่คุณใช้ลงชื่อเข้าใช้ $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'ที่อยู่อีเมล';

  @override
  String get securityLoginNoEmailSet => 'ยังไม่ได้ตั้งค่าอีเมล';

  @override
  String get securityLoginChangeEmail => 'เปลี่ยนอีเมล';

  @override
  String get securityLoginAddEmail => 'เพิ่มอีเมล';

  @override
  String get securityLoginReveal => 'แสดง';

  @override
  String get securityLoginHide => 'ซ่อน';

  @override
  String get securityLoginPasswordSectionTitle => 'รหัสผ่าน';

  @override
  String get securityLoginPasswordSectionDescription =>
      'เปลี่ยนรหัสผ่านของคุณเพื่อรักษาความปลอดภัยบัญชีของคุณ';

  @override
  String get securityLoginCurrentPasswordLabel => 'รหัสผ่านปัจจุบัน';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'เปลี่ยนล่าสุด: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged => 'เปลี่ยนล่าสุด: ไม่เคย';

  @override
  String get securityLoginNoPasswordSet => 'ไม่ได้ตั้งรหัสผ่าน';

  @override
  String get securityLoginChangePassword => 'เปลี่ยนรหัสผ่าน';

  @override
  String get securityLoginSetPassword => 'ตั้งรหัสผ่าน';

  @override
  String get passwordChangeTitle => 'เปลี่ยนรหัสผ่าน';

  @override
  String get passwordChangeIntroDescription =>
      'เราจะส่งรหัสยืนยันไปยังที่อยู่อีเมลของคุณเพื่อยืนยันตัวตนของคุณก่อนที่จะเปลี่ยนรหัสผ่าน';

  @override
  String get passwordChangeStart => 'เริ่ม';

  @override
  String get passwordChangeVerifyTitle => 'ยืนยันอีเมลของคุณ';

  @override
  String get passwordChangeVerifyDescription =>
      'ป้อนรหัสยืนยันที่ส่งไปยังที่อยู่อีเมลของคุณ';

  @override
  String get passwordChangeVerificationCode => 'รหัสยืนยัน';

  @override
  String get passwordChangeVerify => 'ยืนยัน';

  @override
  String get passwordChangeNewPasswordTitle => 'ตั้งรหัสผ่านใหม่';

  @override
  String get passwordChangeNewPasswordDescription =>
      'ป้อนรหัสผ่านใหม่ของคุณด้านล่าง';

  @override
  String get passwordChangeNewPassword => 'รหัสผ่านใหม่';

  @override
  String get passwordChangeConfirmPassword => 'ยืนยันรหัสผ่านใหม่';

  @override
  String get passwordChangeSubmit => 'เปลี่ยนรหัสผ่าน';

  @override
  String get passwordChangeSuccess => 'เปลี่ยนรหัสผ่านแล้ว';

  @override
  String get passwordChangePasswordsDoNotMatch => 'รหัสผ่านไม่ตรงกัน';

  @override
  String get passwordChangeInvalidCode => 'รหัสไม่ถูกต้องหรือหมดอายุ';

  @override
  String get emailChangeTitle => 'เปลี่ยนอีเมล';

  @override
  String get emailChangeIntroDescription =>
      'เราจะส่งรหัสยืนยันเพื่อยืนยันตัวตนของคุณก่อนที่จะเปลี่ยนที่อยู่อีเมล';

  @override
  String get emailChangeStart => 'เริ่ม';

  @override
  String get emailChangeVerifyOriginalTitle => 'ยืนยันอีเมลปัจจุบัน';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'ป้อนรหัสยืนยันที่ส่งไปยังอีเมลปัจจุบันของคุณ';

  @override
  String get emailChangeNewEmailTitle => 'ป้อนอีเมลใหม่';

  @override
  String get emailChangeNewEmailDescription =>
      'ป้อนที่อยู่อีเมลใหม่ที่คุณต้องการใช้';

  @override
  String get emailChangeNewEmailLabel => 'อีเมลใหม่';

  @override
  String get emailChangeNewEmailSubmit => 'ส่งรหัสยืนยัน';

  @override
  String get emailChangeVerifyNewTitle => 'ยืนยันอีเมลใหม่';

  @override
  String get emailChangeVerifyNewDescription =>
      'ป้อนรหัสยืนยันที่ส่งไปยังที่อยู่อีเมลใหม่ของคุณ';

  @override
  String get emailChangeSuccess => 'เปลี่ยนอีเมลแล้ว';

  @override
  String get emailChangeInvalidCode => 'รหัสไม่ถูกต้องหรือหมดอายุ';

  @override
  String get resend => 'ส่งอีกครั้ง';

  @override
  String resendCountdown(int seconds) {
    return 'ส่งอีกครั้ง ($seconds วินาที)';
  }

  @override
  String get verificationCode => 'รหัสยืนยัน';

  @override
  String get verify => 'ยืนยัน';

  @override
  String get enable => 'เปิดใช้งาน';

  @override
  String get disable => 'ปิด';

  @override
  String get delete => 'ลบ';

  @override
  String get save => 'บันทึก';

  @override
  String get securityTfaSectionTitle => 'การยืนยันตัวตนแบบสองชั้น';

  @override
  String get securityTfaSectionDescription =>
      'เพิ่มความปลอดภัยอีกขั้นให้กับบัญชีของคุณ';

  @override
  String get securityTfaAuthenticatorApp => 'แอปยืนยันตัวตน';

  @override
  String get securityTfaAuthenticatorEnabled =>
      'เปิดใช้งานการยืนยันตัวตนแบบสองชั้นแล้ว';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'ใช้แอปยืนยันตัวตนเพื่อสร้างรหัสสำหรับการยืนยันตัวตนแบบสองชั้น';

  @override
  String get securityTfaBackupCodes => 'รหัสสำรอง';

  @override
  String get securityTfaBackupCodesDescription =>
      'ดูและจัดการรหัสสำรองสำหรับกู้คืนบัญชีของคุณ';

  @override
  String get securityTfaViewCodes => 'ดูรหัส';

  @override
  String get securityPasskeysSectionTitle => 'พาสคีย์';

  @override
  String get securityPasskeysSectionDescription =>
      'ใช้ Passkeys เพื่อเข้าสู่ระบบโดยไม่ต้องใช้รหัสผ่านและการยืนยันตัวตนสองชั้น';

  @override
  String get securityPasskeysRegistered => 'พาสคีย์ที่ลงทะเบียนแล้ว';

  @override
  String get securityPasskeysNone => 'ยังไม่ได้ลงทะเบียน Passkeys';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'passkeys',
      one: 'passkey',
    );
    return 'ลงทะเบียน $count $_temp0 แล้ว (สูงสุด 10 รายการ)';
  }

  @override
  String get securityPasskeysAdd => 'เพิ่มพาสคีย์';

  @override
  String securityPasskeysAdded(String date) {
    return 'เพิ่มเมื่อ: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'ใช้ครั้งล่าสุด: $date';
  }

  @override
  String get securityPasskeysRename => 'เปลี่ยนชื่อ';

  @override
  String get securityPasskeysDeleteTitle => 'ลบพาสคีย์';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ Passkey \"$name\"';
  }

  @override
  String get securityPasskeyNameTitle => 'ตั้งชื่อพาสคีย์';

  @override
  String get securityPasskeyNameLabel => 'ชื่อพาสคีย์';

  @override
  String get securityPasskeyNameHint =>
      'เช่น YubiKey, iPhone, คอมพิวเตอร์ที่ทำงาน';

  @override
  String get securityClaimTitle => 'ฟีเจอร์ความปลอดภัย';

  @override
  String get securityClaimDescription =>
      'ยืนยันบัญชีของคุณเพื่อเข้าถึงฟีเจอร์ความปลอดภัย เช่น การยืนยันตัวตนแบบสองชั้นและพาสคีย์';

  @override
  String get securityVerifyEmailRequired =>
      'คุณต้องยืนยันที่อยู่อีเมลของคุณก่อนจึงจะสามารถตั้งค่าการยืนยันตัวตนสองชั้นหรือรหัสผ่านได้';

  @override
  String get totpEnableTitle => 'ตั้งค่าแอปยืนยันตัวตน';

  @override
  String get totpEnableDescription =>
      'สแกนรหัส QR ด้วยแอปยืนยันตัวตนของคุณเพื่อสร้างรหัสสำหรับการยืนยันตัวตนสองชั้น';

  @override
  String get totpEnableCodeLabel => 'รหัส';

  @override
  String get totpEnableCodeHint => 'ป้อนรหัส 6 หลักจากแอปยืนยันตัวตนของคุณ';

  @override
  String get totpEnableSuccess => 'เปิดใช้งานการยืนยันตัวตนสองชั้นแล้ว';

  @override
  String get totpDisableTitle => 'นำแอปยืนยันตัวตนออก';

  @override
  String get totpDisableDescription =>
      'ป้อนรหัส 6 หลักจากแอปยืนยันตัวตนของคุณเพื่อปิดใช้งานการยืนยันตัวตนสองชั้น';

  @override
  String get totpDisableSuccess => 'ปิดการยืนยันตัวตนแบบสองชั้นแล้ว';

  @override
  String get backupCodesTitle => 'รหัสสำรอง';

  @override
  String get backupCodesWarning =>
      'หากคุณสูญเสียการเข้าถึงแอปยืนยันตัวตนและไม่มีรหัสเหล่านี้ คุณจะถูกล็อกออกจากบัญชีของคุณอย่างถาวร ดาวน์โหลดหรือคัดลอกตอนนี้และเก็บไว้ในที่ปลอดภัย';

  @override
  String get backupCodesCopy => 'คัดลอก';

  @override
  String get backupCodesCopied => 'คัดลอกรหัสสำรองไปยังคลิปบอร์ดแล้ว';

  @override
  String get backupCodesAcknowledge =>
      'ฉันได้ดาวน์โหลดหรือคัดลอกรหัสสำรองของฉันและเก็บไว้ในที่ปลอดภัยแล้ว';

  @override
  String get backupCodesDone => 'เสร็จสิ้น';

  @override
  String get dangerZoneSectionTitle => 'พื้นที่อันตราย';

  @override
  String get dangerZoneSectionDescription =>
      'การดำเนินการที่แก้ไขไม่ได้และทำลายล้าง';

  @override
  String get dangerZoneDisableTitle => 'ปิดใช้งานบัญชี';

  @override
  String get dangerZoneDisableDescription =>
      'ปิดใช้งานบัญชีชั่วคราว คุณเปิดใช้งานอีกครั้งได้ภายหลังโดยลงชื่อเข้าใช้';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'การปิดใช้งานบัญชีของคุณจะทำให้คุณออกจากระบบทุกเซสชัน คุณสามารถเปิดใช้งานบัญชีของคุณใหม่ได้ตลอดเวลาโดยการลงชื่อเข้าใช้อีกครั้ง';

  @override
  String get dangerZoneDeleteTitle => 'ลบบัญชี';

  @override
  String get dangerZoneDeleteDescription =>
      'ลบบัญชีและข้อมูลทั้งหมดที่เกี่ยวข้องอย่างถาวร การดำเนินการนี้ไม่สามารถเลิกทำได้';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'ยกเลิกการสมัครใช้งาน Plutonium ที่ใช้งานอยู่ของคุณในการตั้งค่า Plutonium ก่อนที่จะลบบัญชีของคุณ';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'ไม่สามารถลบบัญชีได้';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'คุณไม่สามารถลบบัญชีของคุณได้ในขณะที่คุณเป็นเจ้าของคอมมูนิตี้ โปรดโอนความเป็นเจ้าของคอมมูนิตี้ต่อไปนี้ก่อน:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'และอีก $count รายการ';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'หากต้องการโอนความเป็นเจ้าของ ให้ไปที่ $settingsPath และใช้ตัวเลือกโอนความเป็นเจ้าของ';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบบัญชี การดำเนินการนี้จะตั้งเวลาลบบัญชีของคุณอย่างถาวร';

  @override
  String get dangerZoneDeleteBullet1 =>
      'คุณสามารถยกเลิกขั้นตอนการลบได้ภายใน 14 วัน';

  @override
  String get dangerZoneDeleteBullet2 =>
      'หลังจาก 14 วัน บัญชีของคุณจะถูกลบอย่างถาวร';

  @override
  String get dangerZoneDeleteBullet3 =>
      'เมื่อดำเนินการลบแล้ว คุณจะไม่สามารถกู้คืนบัญชีของคุณได้';

  @override
  String get dangerZoneDeleteBullet4 =>
      'คุณจะไม่สามารถลบข้อความที่คุณส่งได้หลังจากลบบัญชีของคุณ';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'หากคุณต้องการส่งออกข้อมูลของคุณหรือลบข้อความของคุณก่อน โปรดไปที่ส่วนแดชบอร์ดความเป็นส่วนตัวในการตั้งค่าผู้ใช้ก่อนดำเนินการต่อ';

  @override
  String get claimAccountTitle => 'ยืนยันบัญชีของคุณ';

  @override
  String get claimAccountDescription =>
      'ยืนยันบัญชีของคุณด้วยการเพิ่มอีเมลและรหัสผ่าน เราจะส่งรหัสยืนยันเพื่อยืนยันอีเมลของคุณก่อนดำเนินการต่อ';

  @override
  String get claimAccountEmailLabel => 'อีเมล';

  @override
  String get claimAccountPasswordLabel => 'รหัสผ่าน';

  @override
  String get claimAccountSendCode => 'ส่งรหัส';

  @override
  String get claimAccountVerifyDescription =>
      'ป้อนรหัสที่เราส่งไปยังอีเมลของคุณเพื่อยืนยัน เราจะตั้งรหัสผ่านให้เมื่อยืนยันรหัสแล้ว';

  @override
  String get claimAccountSuccess => 'ยืนยันบัญชีสำเร็จแล้ว';

  @override
  String get importantInformation => 'ข้อมูลสำคัญ:';

  @override
  String get genericError => 'เกิดข้อผิดพลาดขึ้น';

  @override
  String get networkErrorMessage => 'เกิดข้อผิดพลาดบางอย่าง โปรดลองอีกครั้ง';

  @override
  String get invalidCode => 'รหัสไม่ถูกต้อง';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ปีที่แล้ว',
      one: '1 ปีที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count เดือนที่แล้ว',
      one: '1 เดือนที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วันที่แล้ว',
      one: '1 วันที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ชั่วโมงที่แล้ว',
      one: '1 ชั่วโมงที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count นาทีที่แล้ว',
      one: '1 นาทีที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count สัปดาห์ที่แล้ว',
      one: '1 สัปดาห์ที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count นาที',
      one: '1 นาที',
    );
    return 'ในอีก $_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ชั่วโมง',
      one: '1 ชั่วโมง',
    );
    return 'ในอีก $_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ในอีก $count วัน',
      one: 'ใน 1 วัน',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ใน $count สัปดาห์',
      one: 'ใน 1 สัปดาห์',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ในอีก $count เดือน',
      one: 'ใน 1 เดือน',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ในอีก $count ปี',
      one: 'ใน 1 ปี',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'เมื่อสักครู่';

  @override
  String get authorizedAppsTitle => 'แอปพลิเคชันที่ได้รับอนุญาต';

  @override
  String authorizedAppsDescription(String productName) {
    return 'แอปพลิเคชันเหล่านี้ได้รับอนุญาตให้เข้าถึงบัญชี $productName ของคุณ';
  }

  @override
  String get authorizedAppsEmptyTitle => 'ไม่มีแอปที่ได้รับอนุญาต';

  @override
  String get authorizedAppsEmptyDescription =>
      'คุณยังไม่ได้อนุญาตแอปพลิเคชันใดๆ ให้เข้าถึงบัญชีของคุณ';

  @override
  String get authorizedAppsLoadError => 'โหลดแอปที่ได้รับอนุญาตไม่สำเร็จ';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'ได้รับอนุญาตเมื่อ $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'สิทธิ์ที่ได้รับ';

  @override
  String get authorizedAppsRevoke => 'เพิกถอน';

  @override
  String get authorizedAppsRevokeTitle => 'ยกเลิกการเข้าถึงแอปพลิเคชัน';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการยกเลิกการเข้าถึงของ $appName? แอปพลิเคชันนี้จะไม่มีสิทธิ์เข้าถึงบัญชีของคุณอีกต่อไป';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'เข้าถึงข้อมูลโปรไฟล์พื้นฐานของคุณ (ชื่อผู้ใช้ รูปโปรไฟล์ ฯลฯ)';

  @override
  String get authorizedAppsScopeEmail => 'ดูที่อยู่อีเมลของคุณ';

  @override
  String get authorizedAppsScopeGuilds => 'ดูคอมมูนิตี้ที่คุณเป็นสมาชิกอยู่';

  @override
  String get authorizedAppsScopeConnections => 'ดูบัญชีที่เชื่อมต่อของคุณ';

  @override
  String get authorizedAppsScopeBot =>
      'เพิ่มบอทเข้าสู่คอมมูนิตี้พร้อมสิทธิ์ที่ร้องขอ';

  @override
  String get authorizedAppsScopeAdmin => 'เข้าถึงจุดสิ้นสุดการดูแลระบบ';

  @override
  String get applicationsTitle => 'แอปพลิเคชัน';

  @override
  String get applicationsCreate => 'สร้างแอปพลิเคชัน';

  @override
  String get applicationsCreateSubmit => 'สร้าง';

  @override
  String get applicationsCreateClaimTooltip =>
      'ยืนยันบัญชีของคุณเพื่อสร้างแอปพลิเคชัน';

  @override
  String applicationsDocsLink(String domain) {
    return 'อ่านเอกสารประกอบ ($domain)';
  }

  @override
  String get applicationsLoadError => 'ไม่สามารถโหลดแอปพลิเคชันได้';

  @override
  String get applicationsLoadErrorDescription =>
      'ตรวจสอบการเชื่อมต่อของคุณแล้วลองอีกครั้ง';

  @override
  String get applicationsEmptyTitle => 'ยังไม่มีแอปพลิเคชัน';

  @override
  String applicationsEmptyDescription(String apiName) {
    return 'สร้างแอปพลิเคชันแรกของคุณเพื่อเริ่มต้นใช้งาน $apiName';
  }

  @override
  String applicationsCreated(String date) {
    return 'สร้างเมื่อ $date';
  }

  @override
  String get applicationsName => 'ชื่อแอปพลิเคชัน';

  @override
  String get applicationsNameHint => 'แอปของฉัน';

  @override
  String get applicationsNameRequired => 'ต้องระบุชื่อแอปพลิเคชัน';

  @override
  String get applicationsBackToList => 'กลับสู่รายการ';

  @override
  String get applicationsDetailLoadError => 'ไม่สามารถโหลดแอปพลิเคชันนี้ได้';

  @override
  String get applicationsDetailLoadErrorDescription =>
      'ลองอีกครั้งหรือกลับไปที่รายการแอปพลิเคชัน';

  @override
  String get applicationsId => 'ID แอปพลิเคชัน';

  @override
  String get applicationsCopyId => 'คัดลอก ID';

  @override
  String get applicationsSecretsTitle => 'รหัสลับและโทเค็น';

  @override
  String get applicationsSecretsDescription =>
      'เก็บข้อมูลนี้ไว้ให้ปลอดภัย การสร้างใหม่จะทำให้การเชื่อมต่อที่มีอยู่ใช้งานไม่ได้';

  @override
  String get applicationsClientSecret => 'Client secret';

  @override
  String get applicationsBotToken => 'โทเค็นบอท';

  @override
  String get applicationsRegenerate => 'สร้างใหม่';

  @override
  String get applicationsRegenerateClientSecretTitle =>
      'สร้าง Client Secret ใหม่หรือไม่';

  @override
  String get applicationsRegenerateBotTokenTitle => 'สร้างโทเค็นบอทใหม่หรือไม่';

  @override
  String get applicationsRegenerateClientSecretDescription =>
      'การสร้างใหม่จะทำให้ Client Secret ปัจจุบันใช้งานไม่ได้ โปรดอัปเดตโค้ดที่ใช้ค่าเดิม';

  @override
  String get applicationsRegenerateBotTokenDescription =>
      'การสร้างใหม่จะทำให้โทเค็นปัจจุบันใช้ไม่ได้ โปรดอัปเดตโค้ดที่ใช้ค่าเดิม';

  @override
  String get applicationsClientSecretRegenerated =>
      'สร้าง Client secret ใหม่แล้ว โปรดอัปเดตโค้ดที่ใช้ secret เก่า';

  @override
  String get applicationsBotTokenRegenerated =>
      'สร้างโทเค็นบอทใหม่แล้ว โปรดอัปเดตโค้ดที่ใช้โทเค็นเก่า';

  @override
  String get applicationsRegenerateFailed => 'สร้างข้อมูลลับใหม่ไม่ได้';

  @override
  String get applicationsInfoTitle => 'ข้อมูลแอปพลิเคชัน';

  @override
  String get applicationsInfoDescription =>
      'การตั้งค่าพื้นฐานและ URI เปลี่ยนเส้นทางที่อนุญาต';

  @override
  String get applicationsPublicBot => 'บอทสาธารณะ';

  @override
  String get applicationsPublicBotDescription =>
      'อนุญาตให้ทุกคนเชิญบอทนี้เข้าสู่คอมมูนิตี้ของตนเองได้';

  @override
  String get applicationsRequireCodeGrant => 'ต้องใช้ OAuth2 code grant';

  @override
  String get applicationsRequireCodeGrantDescription =>
      'ต้องใช้ URI การเปลี่ยนเส้นทางและรหัสการอนุญาตเมื่อเชิญบอทนี้';

  @override
  String get applicationsRedirectUris => 'URI สำหรับเปลี่ยนเส้นทาง';

  @override
  String get applicationsAddRedirect => 'เพิ่มการเปลี่ยนเส้นทาง';

  @override
  String get applicationsDeleteRedirect => 'ลบ URI การเปลี่ยนเส้นทาง';

  @override
  String get applicationsBotProfileTitle => 'โปรไฟล์บอท';

  @override
  String get applicationsBotProfileDescription =>
      'รูปโปรไฟล์, แท็ก และรายละเอียดโปรไฟล์ที่สมบูรณ์สำหรับบอทของคุณ';

  @override
  String get applicationsBotAvatar => 'รูปโปรไฟล์บอท';

  @override
  String get applicationsUsernameRequired => 'ต้องระบุชื่อผู้ใช้';

  @override
  String get applicationsUsernameTooLong =>
      'ชื่อผู้ใช้ต้องมีความยาวไม่เกิน 32 ตัวอักษร';

  @override
  String get applicationsUsernameInvalid =>
      'ชื่อผู้ใช้ต้องประกอบด้วยตัวอักษร ตัวเลข และขีดล่างเท่านั้น';

  @override
  String get applicationsBotUsername => 'ชื่อผู้ใช้บอท';

  @override
  String get applicationsDiscriminator => 'Discriminator';

  @override
  String get applicationsBotBio => 'เกี่ยวกับบอท';

  @override
  String get applicationsBotBioHint => 'บอทตัวช่วยที่ทำสิ่งน่าทึ่งได้!';

  @override
  String get applicationsNoBotBanner => 'ไม่มีแบนเนอร์บอท';

  @override
  String get applicationsFriendlyBot => 'บอทเป็นกันเอง';

  @override
  String get applicationsFriendlyBotDescription =>
      'อนุญาตให้ผู้ใช้ส่งคำขอเป็นเพื่อนไปยังบอทนี้เพื่อรอการอนุมัติด้วยตนเอง';

  @override
  String get applicationsManualFriendApproval => 'ต้องอนุมัติเพื่อนด้วยตนเอง';

  @override
  String get applicationsManualFriendApprovalDescription =>
      'คำขอเป็นเพื่อนที่ส่งถึงบอทนี้ต้องได้รับการอนุมัติด้วยตนเอง';

  @override
  String get applicationsOauthBuilderTitle =>
      'เครื่องมือสร้าง URL สำหรับ OAuth2';

  @override
  String get applicationsOauthBuilderDescription =>
      'สร้าง URL การอนุญาตด้วยขอบเขตและสิทธิ์';

  @override
  String get applicationsScopes => 'ขอบเขตการเข้าถึง';

  @override
  String get applicationsRedirectUri => 'URI สำหรับเปลี่ยนเส้นทาง';

  @override
  String get applicationsSelectRedirectUri => 'เลือก URI การเปลี่ยนเส้นทาง';

  @override
  String get applicationsRedirectRequiredCodeGrant =>
      'ต้องระบุ URI สำหรับเปลี่ยนเส้นทาง เนื่องจากบอทนี้ต้องใช้ OAuth2 code grant';

  @override
  String get applicationsRedirectRequiredScopes =>
      'ต้องระบุ URI สำหรับเปลี่ยนเส้นทาง เมื่อขอบเขต bot ไม่ใช่ขอบเขตเดียวที่ใช้';

  @override
  String get applicationsBotPermissions => 'สิทธิ์ของบอท';

  @override
  String get applicationsAuthorizeUrl => 'URL การอนุญาต';

  @override
  String get applicationsAuthorizeUrlPlaceholder =>
      'เลือกขอบเขต (และ URI การเปลี่ยนเส้นทาง หากจำเป็น)';

  @override
  String get applicationsCopyAuthorizeUrl => 'คัดลอก URL การอนุญาต';

  @override
  String get applicationsCopiedUrl => 'คัดลอก URL ไปยังคลิปบอร์ดแล้ว';

  @override
  String get applicationsDangerTitle => 'พื้นที่อันตราย';

  @override
  String get applicationsDangerSubtitle =>
      'การดำเนินการนี้ไม่สามารถเลิกทำได้ การลบแอปพลิเคชันจะลบบอทของแอปพลิเคชันนั้นด้วย';

  @override
  String get applicationsDangerHelper =>
      'เมื่อลบแล้ว แอปพลิเคชันและข้อมูลรับรองจะถูกนำออกอย่างถาวร';

  @override
  String get applicationsDelete => 'ลบแอปพลิเคชัน';

  @override
  String applicationsDeleteConfirmDescription(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $name การดำเนินการนี้ไม่สามารถเลิกทำได้ ข้อมูลที่เกี่ยวข้องทั้งหมด รวมถึงผู้ใช้บอทจะถูกลบอย่างถาวร';
  }

  @override
  String get applicationsDeleteFailed => 'ไม่สามารถลบแอปพลิเคชันได้';

  @override
  String get applicationsUpdated => 'อัปเดตแอปพลิเคชันแล้ว';

  @override
  String get applicationsNoChanges => 'ไม่มีการเปลี่ยนแปลงที่ต้องบันทึก';

  @override
  String get applicationsSearchBots => 'แอปพลิเคชันและบอท';

  @override
  String get applicationsSearchBotsDescription =>
      'สร้างและจัดการแอปพลิเคชันและบอทสำหรับบัญชีของคุณ';

  @override
  String get applicationsSearchInfoDescription =>
      'แก้ไขข้อมูลพื้นฐานแอปและ URI การเปลี่ยนเส้นทาง';

  @override
  String get applicationsSearchBotProfileDescription =>
      'แก้ไขรูปโปรไฟล์บอท แท็ก ประวัติ แบนเนอร์ และลักษณะการทำงานของคำขอเป็นเพื่อน';

  @override
  String get applicationsSearchOauthDescription =>
      'สร้าง URL การอนุญาตพร้อมขอบเขต การเปลี่ยนเส้นทาง และสิทธิ์ของบอท';

  @override
  String get applicationsSearchSecretsDescription =>
      'ดูและสร้าง client secret และโทเค็นบอทใหม่';

  @override
  String get applicationsSearchBotsKeyword => 'บอท';

  @override
  String get applicationsSearchDocumentation => 'เอกสารประกอบ';

  @override
  String get blockedUsersTitle => 'ผู้ใช้ที่ถูกบล็อก';

  @override
  String get blockedUsersDescription =>
      'ผู้ใช้ที่ถูกบล็อกจะไม่สามารถส่งคำขอเป็นเพื่อนหรือส่งข้อความถึงคุณโดยตรงได้';

  @override
  String get blockedUsersEmptyTitle => 'ไม่มีผู้ใช้ที่ถูกบล็อก';

  @override
  String get blockedUsersEmptyDescription => 'คุณยังไม่ได้บล็อกใครเลย';

  @override
  String get blockedUsersLoadError => 'ไม่สามารถโหลดผู้ใช้ที่ถูกบล็อกได้';

  @override
  String get blockedUsersUnblock => 'เลิกบล็อก';

  @override
  String get blockedUsersUnblockTitle => 'เลิกบล็อกผู้ใช้';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการเลิกบล็อก $username?';
  }

  @override
  String get blockedUsersCopyTag => 'คัดลอกชื่อผู้ใช้';

  @override
  String get blockedUsersCopyId => 'คัดลอก ID ผู้ใช้';

  @override
  String get userProfileLoadError => 'ไม่สามารถโหลดโปรไฟล์ได้';

  @override
  String get userProfileLoading => 'กำลังโหลดโปรไฟล์';

  @override
  String get userProfileRetry => 'ลองอีกครั้ง';

  @override
  String get userProfileMessage => 'ข้อความ';

  @override
  String get userProfileVoiceCall => 'โทรด้วยเสียง';

  @override
  String get userProfileVideoCall => 'โทรวิดีโอ';

  @override
  String get userProfileEditProfile => 'แก้ไขโปรไฟล์';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'ทีมงาน $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'ทีมชุมชน $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'พาร์ทเนอร์ $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'นักล่าบั๊ก $productName';
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
    return 'สมาชิก $productName Plutonium ตั้งแต่ $date';
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
    return '$productName Visionary ตั้งแต่ $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'Visionary ID #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'เพื่อนร่วมกัน ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'คอมมูนิตี้ร่วมกัน ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'เพื่อนร่วมกัน';

  @override
  String get userProfileMutualCommunitiesTitle => 'คอมมูนิตี้ร่วมกัน';

  @override
  String get userProfileNoMutualFriends => 'ไม่พบเพื่อนร่วมกัน';

  @override
  String get userProfileNoMutualCommunities => 'ไม่พบคอมมูนิตี้ร่วมกัน';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'ชื่อเล่น: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'เปิดข้อความส่วนตัว';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'คุณบล็อก $username คุณจะไม่สามารถส่งข้อความได้จนกว่าจะเลิกบล็อก';
  }

  @override
  String get blockedUserComposerBarrierAction => 'เลิกบล็อก';

  @override
  String get userProfileOpenDm => 'เปิดข้อความส่วนตัว';

  @override
  String get userProfileNoteTitle => 'โน้ต';

  @override
  String get userProfileNoteVisibility => '(คุณเท่านั้นที่เห็น)';

  @override
  String get userProfileNoteSave => 'บันทึก';

  @override
  String get userProfileNoteDelete => 'ลบ';

  @override
  String get userProfileMemberSince => 'สมาชิกตั้งแต่';

  @override
  String get userProfileAboutMe => 'เกี่ยวกับฉัน';

  @override
  String get userProfileRoles => 'บทบาท';

  @override
  String get memberRoleAdd => 'เพิ่มบทบาท';

  @override
  String memberRoleRemove(String roleName) {
    return 'ลบบทบาท $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'ผู้ใช้รายนี้ไม่มีบทบาทในคอมมูนิตี้นี้';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'ยังไม่มีบทบาท เพิ่มบทบาทได้ที่ $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'ไม่มีบทบาทให้เลือก';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'ขณะนี้ยังไม่มีบทบาทให้กำหนดในชุมชนนี้ แต่คุณสามารถสร้างบทบาทใหม่ได้ที่ $rolesSettingsPath';
  }

  @override
  String get guildSettingsTitle => 'การตั้งค่าคอมมูนิตี้';

  @override
  String get guildSettingsRolesTab => 'บทบาท';

  @override
  String get memberRolesConfirmOk => 'ตกลง';

  @override
  String get userProfileLocalTime => 'เวลาท้องถิ่น';

  @override
  String get profileLocalTimeSettingsTitle => 'เวลาท้องถิ่นในโปรไฟล์';

  @override
  String profileLocalTimeSettingsSummary(String productName) {
    return 'ตั้งค่าเขตเวลาของคุณเพียงครั้งเดียว เพื่อให้ $productName อัปเดตค่าชดเชยเวลา UTC ของคุณได้เมื่อมีการเปลี่ยนแปลงช่วงเวลาฤดูร้อน ผู้ใช้รายอื่นจะเห็นเฉพาะค่าชดเชยเวลา UTC ของคุณเท่านั้น ไม่เห็นตัวระบุเขตเวลาที่แน่นอนของคุณ';
  }

  @override
  String get profileLocalTimeEditButton => 'แก้ไขเวลาท้องถิ่นในโปรไฟล์';

  @override
  String get profileLocalTimeTimezoneLabel => 'เขตเวลา';

  @override
  String profileLocalTimeTimezoneHelp(String productName) {
    return 'เลือกเขตเวลาที่ $productName ใช้ในการคำนวณค่าชดเชยเวลาสากล (UTC) สำหรับเวลาในโปรไฟล์ของคุณ';
  }

  @override
  String get profileLocalTimeSearchTimezones => 'ค้นหาเขตเวลา';

  @override
  String get profileLocalTimeNotSet => 'ไม่ได้ตั้งค่า';

  @override
  String profileLocalTimePrivacyNote(
    String timezoneIdentifierExample,
    String productName,
  ) {
    return 'ผู้ใช้อื่น ๆ จะเห็นเฉพาะค่าออฟเซ็ต UTC ปัจจุบันของคุณเมื่อคุณเลือกแชร์เวลาท้องถิ่นในโปรไฟล์ พวกเขาจะไม่เห็นตัวระบุเขตเวลาที่แน่นอน เช่น $timezoneIdentifierExample $productName จัดเก็บตัวระบุนั้นไว้เพียงเพื่อให้ค่าออฟเซ็ตอัปเดตโดยอัตโนมัติเมื่อมีการเปลี่ยนเวลาออมแสง';
  }

  @override
  String get profileLocalTimePrivacyEveryone => 'ทุกคน';

  @override
  String get profileLocalTimePrivacyEveryoneDesc =>
      'อนุญาตให้ทุกคนที่ดูโปรไฟล์แบบเต็มของคุณได้ เห็นเวลาท้องถิ่นของคุณ';

  @override
  String get profileLocalTimePrivacyFriends => 'เพื่อน';

  @override
  String get profileLocalTimePrivacyFriendsDesc =>
      'อนุญาตให้เพื่อนเห็นเวลาท้องถิ่นของคุณ';

  @override
  String get profileLocalTimePrivacyCommunityMembers => 'สมาชิกคอมมูนิตี้';

  @override
  String get profileLocalTimePrivacyCommunityMembersDesc =>
      'อนุญาตให้สมาชิกจากคอมมูนิตี้ที่คุณอยู่เห็นเวลาท้องถิ่นของคุณ';

  @override
  String get userProfileSameTimeAsYou => 'เวลาเดียวกับคุณ';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'เร็วกว่าคุณ $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'ช้ากว่าคุณ $duration';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ชั่วโมง',
      one: '1 ชั่วโมง',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes นาที',
      one: '1 นาที',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours ชั่วโมง',
      one: '1 ชั่วโมง',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes นาที',
      one: '1 นาที',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'คัดลอกชื่อผู้ใช้';

  @override
  String get userProfileCopyUserId => 'คัดลอก ID ผู้ใช้';

  @override
  String get userProfileViewMainProfile => 'ดูโปรไฟล์หลัก';

  @override
  String get userProfileViewCommunityProfile => 'ดูโปรไฟล์คอมมูนิตี้';

  @override
  String get userProfileBlockUser => 'บล็อกผู้ใช้';

  @override
  String get userProfileUnblockUser => 'เลิกบล็อกผู้ใช้';

  @override
  String get userProfileRemoveFriend => 'ลบเพื่อน';

  @override
  String get userProfileBlockConfirmTitle => 'บล็อกผู้ใช้';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการบล็อก $username?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'เลิกบล็อกผู้ใช้';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการเลิกบล็อก $username?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'ลบเพื่อน';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $username ออกจากรายชื่อเพื่อน?';
  }

  @override
  String get userProfileFailedOpenDm => 'ไม่สามารถเปิด DM ได้';

  @override
  String get userProfileFailedSaveNote => 'ไม่สามารถบันทึกหมายเหตุได้';

  @override
  String get userProfileActionFailed => 'การดำเนินการล้มเหลว โปรดลองอีกครั้ง';

  @override
  String get userProfileChangeNickname => 'เปลี่ยนชื่อเล่น';

  @override
  String get userProfileKick => 'เตะออก';

  @override
  String get userProfileBan => 'แบน';

  @override
  String get userProfileTimeout => 'พักการใช้งานชั่วคราว';

  @override
  String get userProfileRemoveTimeout => 'ยกเลิกการพักการใช้งานชั่วคราว';

  @override
  String get userProfileTransferOwnership => 'โอนความเป็นเจ้าของ';

  @override
  String get userProfileReportMessage => 'รายงานข้อความ';

  @override
  String get userProfileReportUserProfile => 'รายงานโปรไฟล์';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'เตะ $username ออก?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการเตะ $username ออก? พวกเขาสามารถเข้าร่วมใหม่ด้วยคำเชิญใหม่';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'ยกเลิกการระงับ?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'การยกเลิกการระงับจะทำให้ $username สามารถส่งข้อความ แสดงปฏิกิริยา และเข้าร่วมช่องเสียงได้อีกครั้ง';
  }

  @override
  String get userProfileTransferConfirmTitle => 'โอนความเป็นเจ้าของ?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'โอนความเป็นเจ้าของชุมชนนี้ให้กับ $username หรือไม่? การดำเนินการนี้ไม่สามารถย้อนกลับได้ และคุณจะสูญเสียสิทธิ์เจ้าของทั้งหมด';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'แบน $username';
  }

  @override
  String get userProfileBanDurationLabel => 'ระยะเวลาแบน';

  @override
  String get userProfileBanCustomSecondsLabel => 'ระยะเวลาที่กำหนดเอง (วินาที)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'ค่าใดก็ได้ตั้งแต่ $min ถึง $max วินาที';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'ลบประวัติข้อความ';

  @override
  String get userProfileBanDeleteNone => 'ไม่ลบข้อความใดๆ';

  @override
  String get userProfileBanDelete24h => '24 ชั่วโมงที่ผ่านมา';

  @override
  String get userProfileBanDelete7d => '7 วันที่ผ่านมา';

  @override
  String get userProfileBanReasonLabel => 'เหตุผล (ไม่บังคับ)';

  @override
  String get userProfileBanReasonHint => 'ระบุเหตุผลในการแบน';

  @override
  String get userProfileBanSubmit => 'แบนสมาชิก';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'ระงับ $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'ระยะเวลาพักการใช้งาน';

  @override
  String get userProfileTimeoutSubmit => 'ระงับสมาชิก';

  @override
  String get userProfileNicknameLabel => 'ชื่อเล่น';

  @override
  String get userProfileNicknameHint => 'ระบุชื่อเล่น';

  @override
  String get userProfileNicknameSave => 'บันทึก';

  @override
  String userProfileKickSuccess(String username) {
    return 'ไล่ $username ออกแล้ว';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'แบน $username แล้ว';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'ระงับ $username แล้ว';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'ยกเลิกการระงับสำหรับ $username แล้ว';
  }

  @override
  String get userProfileNicknameSuccess => 'เปลี่ยนชื่อเล่นแล้ว';

  @override
  String get userProfileTransferSuccess => 'โอนสิทธิ์การเป็นเจ้าของแล้ว';

  @override
  String get durationPermanent => 'ถาวร';

  @override
  String get duration60Seconds => '60 วินาที';

  @override
  String get duration5Minutes => '5 นาที';

  @override
  String get duration10Minutes => '10 นาที';

  @override
  String get duration1Hour => '1 ชั่วโมง';

  @override
  String get duration12Hours => '12 ชั่วโมง';

  @override
  String get duration1Day => '1 วัน';

  @override
  String get duration3Days => '3 วัน';

  @override
  String get duration5Days => '5 วัน';

  @override
  String get duration1Week => '1 สัปดาห์';

  @override
  String get duration2Weeks => '2 สัปดาห์';

  @override
  String get duration1Month => '1 เดือน';

  @override
  String get durationCustom => 'กำหนดเอง…';

  @override
  String typingIndicatorOne(String name) {
    return '$name กำลังพิมพ์...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 และ $name2 กำลังพิมพ์...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 และ $name3 กำลังพิมพ์...';
  }

  @override
  String get typingIndicatorMultiple => 'หลายคนกำลังพิมพ์...';

  @override
  String get typingIndicatorHandful => 'นักพิมพ์ดีดกำลังรวมตัวกัน...';

  @override
  String get typingIndicatorSymphony => 'เสียงแป้นพิมพ์กำลังบรรเลง...';

  @override
  String get typingIndicatorFiesta =>
      'กำลังมีงานเลี้ยงพิมพ์ดีดเต็มรูปแบบที่นี่';

  @override
  String get typingIndicatorApocalypse => 'โอ้โห นี่มันสงครามการพิมพ์!';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'ดีใจที่คุณมาอยู่ตรงนี้นะ $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'ยินดีต้อนรับ $username! ทำตัวตามสบายได้เลยนะ';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'สวัสดี $username! ยินดีต้อนรับนะ';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'สวัสดี $username! เข้ามาร่วมได้เลยเมื่อพร้อมนะ';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'สวัสดี $username ยินดีที่ได้พบคุณที่นี่!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'สวัสดี $username! ขอให้สนุกกับการอยู่ที่นี่นะ';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'สวัสดี $username ยินดีต้อนรับ!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'ดีใจที่คุณมานะ $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'เชิญเข้ามาเลย $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'ยินดีต้อนรับ $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'ยินดีต้อนรับ $username! เราดีใจที่คุณมาอยู่กับเรา';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'ยินดีต้อนรับ $username! ขอให้สนุกกับการใช้งานนะ';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'ยินดีต้อนรับ $username! การสนทนาครั้งต่อไปของคุณเริ่มต้นที่นี่';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'ยินดีต้อนรับ $username พวกเราดีใจที่มีคุณอยู่ที่นี่';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'ดีใจที่ได้เจอคุณ $username! ยินดีต้อนรับ';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'คุณมาแล้ว $username! ดีใจที่มีคุณอยู่ด้วยนะ';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'คุณมาถึงแล้ว $username! มาเริ่มกันเลย';
  }

  @override
  String get relativeTimeShortNow => 'ตอนนี้';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countนาที',
      one: '1นาที',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countชม.',
      one: '1ชม.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countวัน',
      one: '1วัน',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countด.',
      one: '1ด.',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countปี',
      one: '1ปี',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'อุปกรณ์ของฉัน';

  @override
  String get linkedDevicesDescription =>
      'ดูอุปกรณ์ทั้งหมดที่เข้าสู่ระบบบัญชีของคุณอยู่ขณะนี้ เพิกถอนเซสชันที่คุณไม่คุ้นเคย';

  @override
  String get linkedDevicesCurrentDevice => 'อุปกรณ์ปัจจุบัน';

  @override
  String get linkedDevicesOtherDevices => 'อุปกรณ์อื่น';

  @override
  String get linkedDevicesEnterSelection => 'เข้าสู่โหมดเลือก';

  @override
  String get linkedDevicesExitSelection => 'ออกจากโหมดเลือก';

  @override
  String get linkedDevicesSelectAll => 'เลือกทั้งหมด';

  @override
  String get linkedDevicesClearSelection => 'ล้างการเลือก';

  @override
  String get linkedDevicesRevokeTooltip => 'ยกเลิกอุปกรณ์';

  @override
  String get linkedDevicesSignOutAll => 'ออกจากระบบอุปกรณ์อื่นทั้งหมด';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ออกจากระบบ $count อุปกรณ์',
      one: 'ออกจากระบบ 1 อุปกรณ์',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ออกจากระบบ $count อุปกรณ์',
      one: 'ออกจากระบบ 1 อุปกรณ์',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'ออกจากระบบอุปกรณ์อื่นทั้งหมด';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'การดำเนินการนี้จะออกจากระบบอุปกรณ์ที่เลือกจากบัญชีของคุณ คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์เหล่านั้น',
      one:
          'การดำเนินการนี้จะออกจากระบบอุปกรณ์ที่เลือกจากบัญชีของคุณ คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์นั้น',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'การดำเนินการนี้จะออกจากระบบอุปกรณ์ที่เลือกจากบัญชีของคุณ คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์เหล่านั้น';

  @override
  String get linkedDevicesSignOutConfirm => 'ดำเนินการต่อ';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'คุณจะต้องเข้าสู่ระบบอีกครั้งบนอุปกรณ์ที่ออกจากระบบทั้งหมด';

  @override
  String get linkedDevicesLoadErrorTitle => 'ข้อผิดพลาดเครือข่าย';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'เรากำลังประสบปัญหาในการเชื่อมต่อกับกาลอวกาศ โปรดตรวจสอบการเชื่อมต่อของคุณและลองอีกครั้ง';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'เพิกถอนอุปกรณ์แล้ว',
      one: 'เพิกถอนอุปกรณ์แล้ว',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError => 'ไม่สามารถออกจากระบบได้ ลองอีกครั้ง';

  @override
  String get linkedDevicesUnknownOs => 'ระบบปฏิบัติการไม่รู้จัก';

  @override
  String get linkedDevicesUnknownPlatform => 'แพลตฟอร์มไม่รู้จัก';

  @override
  String get linkedDevicesViewDetails => 'ดูรายละเอียด';

  @override
  String get linkedDevicesDetailsTitle => 'รายละเอียดอุปกรณ์';

  @override
  String get linkedDevicesDetailsDevice => 'อุปกรณ์';

  @override
  String get linkedDevicesDetailsClient => 'ไคลเอ็นต์';

  @override
  String get linkedDevicesDetailsLocation => 'ตำแหน่งที่ตั้ง';

  @override
  String get linkedDevicesDetailsIp => 'ที่อยู่ IP';

  @override
  String get linkedDevicesDetailsLastUsed => 'ใช้งานล่าสุด';

  @override
  String get linkedDevicesCurrentSession => 'เซสชันปัจจุบัน';

  @override
  String get linkedDevicesUnknown => 'ไม่ทราบ';

  @override
  String slowmodeLabel(String duration) {
    return '$duration โหมดหน่วงเวลา';
  }

  @override
  String get slowmodeTooltipActive =>
      'คุณอยู่ในโหมดหน่วงเวลา โปรดรอสักครู่ก่อนส่งข้อความอื่น';

  @override
  String get slowmodeTooltipImmune =>
      'เปิดใช้งานโหมดหน่วงเวลาแล้ว แต่คุณได้รับการยกเว้น';

  @override
  String get slowmodeStatusEnabled => 'โหมดจำกัดเวลาเปิดอยู่';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'โหมดจำกัดเวลาทำงานอยู่ ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'โหมดจำกัดเวลาถูกตั้งเป็น $durationLabel แต่คุณไม่ถูกจำกัด';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'โหมดจำกัดเวลาถูกตั้งเป็น $durationLabel รอก่อนส่งข้อความถัดไป';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'โหมดจำกัดเวลาถูกตั้งเป็น $durationLabel สำหรับช่องนี้';
  }

  @override
  String get channelNoSendPermissionHint =>
      'คุณไม่สามารถส่งข้อความในช่องนี้ได้';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'ประกาศจากทีมงาน $productName คุณไม่สามารถตอบกลับที่นี่ได้';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'การส่งข้อความในคอมมูนิตี้นี้ถูกหยุดชั่วคราว';

  @override
  String get channelComposerBarrierTimedOut =>
      'คุณถูกพักการใช้งานชั่วคราว การส่งข้อความ รีแอ็กชัน และเสียงจะถูกระงับจนกว่าการพักการใช้งานจะสิ้นสุดลง';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'คุณต้องยืนยันบัญชีก่อนจึงจะส่งข้อความในคอมมูนิตี้นี้ได้';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'คุณต้องยืนยันอีเมลเพื่อส่งข้อความในคอมมูนิตี้นี้';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'บัญชีของคุณใหม่เกินไปที่จะส่งข้อความในคอมมูนิตี้นี้';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'คุณยังเป็นสมาชิกคอมมูนิตี้นี้ไม่นานพอที่จะส่งข้อความได้';

  @override
  String get channelComposerBarrierVerifyEmail => 'ยืนยันอีเมล';

  @override
  String chatAttachmentTooMany(int max) {
    return 'ไฟล์แนบมากเกินไป (สูงสุด $max ไฟล์)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName มีขนาดใหญ่เกินขีดจำกัด ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'ไฟล์เหล่านั้นมีขนาดใหญ่เกินกว่าจะส่งพร้อมกันได้';

  @override
  String get chatAttachmentDropToUpload => 'วางไฟล์เพื่ออัปโหลด';

  @override
  String get chatAttachmentDropToSend => 'วางไฟล์เพื่อส่งทันที';

  @override
  String get voiceMessageTitle => 'ข้อความเสียง';

  @override
  String get voiceMessageHoldHint =>
      'กดค้างเพื่อบันทึก ลากไปที่ถังขยะเพื่อลบ เลื่อนขึ้นเพื่อล็อค หรือปล่อยเพื่อส่ง';

  @override
  String get voiceMessageDiscard => 'ทิ้งข้อความเสียง';

  @override
  String get voiceMessageSend => 'ส่งข้อความเสียง';

  @override
  String get voiceMessageMicPermissionDenied =>
      'ไม่สามารถเริ่มบันทึกได้ โปรดอนุญาตการเข้าถึงไมโครโฟน';

  @override
  String get voiceMessageMicInUse => 'ออกจากสายสนทนาเพื่อบันทึกข้อความเสียง';

  @override
  String get voiceMessageRecordingFailed => 'บันทึกเสียงไม่สำเร็จ ลองอีกครั้ง';

  @override
  String get voiceMessageSendFailed => 'ส่งข้อความเสียงไม่ได้ ลองอีกครั้ง';

  @override
  String get voiceMessagePlay => 'เล่น';

  @override
  String get voiceMessagePause => 'หยุดชั่วคราว';

  @override
  String get voiceMessageSeekForward => 'กรอไปข้างหน้า';

  @override
  String get voiceMessageSeekBackward => 'กรอเสียงไปข้างหลัง';

  @override
  String get chatAttachmentEditTitle => 'แก้ไขไฟล์แนบ';

  @override
  String get chatAttachmentFilenameLabel => 'ชื่อไฟล์';

  @override
  String get chatAttachmentDescriptionLabel => 'คำอธิบาย';

  @override
  String get chatAttachmentDescriptionHint => 'ข้อความทางเลือก (ไม่บังคับ)';

  @override
  String get chatAttachmentSpoilerLabel => 'ทำเป็นสปอยล์';

  @override
  String get chatAttachmentRemove => 'ลบไฟล์แนบ';

  @override
  String get chatAttachmentDownload => 'ดาวน์โหลด';

  @override
  String get chatAttachmentDownloadedToast => 'บันทึกไปยังรูปภาพแล้ว';

  @override
  String get chatAttachmentDownloadFailedToast => 'ดาวน์โหลดไฟล์แนบไม่สำเร็จ';

  @override
  String get chatAttachmentExpiredTooltip => 'ไฟล์แนบหมดอายุแล้ว';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ขยาย ($count บรรทัด)',
      one: 'ขยาย ($count บรรทัด)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ยุบ ($count บรรทัด)',
      one: 'ยุบ ($count บรรทัด)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ขยาย ($count แถว)',
      one: 'ขยาย ($count แถว)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ยุบ ($count แถว)',
      one: 'ยุบ ($count แถว)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (เหลืออีก $count บรรทัด)',
      one: '... (เหลืออีก $count บรรทัด)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (เหลืออีก $count แถว)',
      one: '... (เหลืออีก $count แถว)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'ดูทั้งไฟล์';

  @override
  String get chatTextualPreviewChangeLanguage => 'เปลี่ยนภาษา';

  @override
  String get chatTextualPreviewSearchLanguage => 'ค้นหาภาษา…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'การเน้นไวยากรณ์';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'ไม่พบผลลัพธ์';

  @override
  String get chatTextualPreviewMoreOptions => 'ตัวเลือกเพิ่มเติม';

  @override
  String get chatTextualPreviewWrapText => 'ตัดข้อความขึ้นบรรทัดใหม่';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'ไฟล์ใหญ่เกินไปสำหรับการแสดงตัวอย่างแบบอินไลน์ (จำกัด $previewLimitKb KB)';
  }

  @override
  String get chatTextualPreviewLoadError => 'ไม่สามารถโหลดตัวอย่างได้';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'ข้อความธรรมดา';

  @override
  String get chatTextualPreviewCopy => 'คัดลอก';

  @override
  String get chatAttachmentSourceGallery => 'คลังภาพ';

  @override
  String get chatAttachmentSourceCamera => 'กล้อง';

  @override
  String get chatAttachmentSourceBrowse => 'เรียกดูไฟล์';

  @override
  String get chatAttachmentSpoiler => 'สปอยล์';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'เปิดสปอยล์';

  @override
  String get matureMediaRevealButton => 'แสดง';

  @override
  String get matureMediaRevealHint => 'คลิกเพื่อดู';

  @override
  String get matureContentTitle => 'เนื้อหาสำหรับผู้ใหญ่';

  @override
  String get matureCommunityTitle => 'คอมมูนิตี้สำหรับผู้ใหญ่';

  @override
  String get matureCategoryTitle => 'หมวดหมู่สำหรับผู้ใหญ่';

  @override
  String get matureChannelTitle => 'ช่องสำหรับผู้ใหญ่';

  @override
  String get communityContentWarningTitle => 'คำเตือนเนื้อหาของคอมมูนิตี้';

  @override
  String get categoryContentWarningTitle => 'คำเตือนเนื้อหาหมวดหมู่';

  @override
  String get channelContentWarningTitle => 'คำเตือนเนื้อหาช่อง';

  @override
  String get defaultContentWarningBody => 'มีเนื้อหาที่ละเอียดอ่อน';

  @override
  String get matureCommunityBody =>
      'คอมมูนิตี้นี้มีเนื้อหาสำหรับผู้ใหญ่ และอาจมีเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureCategoryBody =>
      'หมวดหมู่นี้มีเนื้อหาสำหรับผู้ใหญ่ และอาจมีเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureChannelBody =>
      'ช่องนี้มีเนื้อหาสำหรับผู้ใหญ่ และอาจมีเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureVoiceChannelBody =>
      'ช่องเสียงนี้ถูกระบุว่ามีเนื้อหาสำหรับผู้ใหญ่ และอาจมีเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureLinkChannelBody =>
      'ช่องลิงก์นี้มีเนื้อหาสำหรับผู้ใหญ่ และอาจเปิดเนื้อหาที่ไม่เหมาะสมสำหรับผู้ใช้บางราย';

  @override
  String get matureCommunityUnavailableBody =>
      'คอมมูนิตี้สำหรับผู้ใหญ่นี้ไม่พร้อมใช้งานสำหรับบัญชีของคุณ';

  @override
  String get matureCategoryUnavailableBody =>
      'หมวดหมู่สำหรับผู้ใหญ่นี้ไม่พร้อมใช้งานสำหรับบัญชีของคุณ';

  @override
  String get matureChannelUnavailableBody =>
      'ช่องสำหรับผู้ใหญ่ช่องนี้ไม่พร้อมใช้งานสำหรับบัญชีของคุณ';

  @override
  String get matureContentProceedButton => 'ดำเนินการต่อ';

  @override
  String get matureContentUnderstandButton => 'ฉันเข้าใจ';

  @override
  String get matureContentOpenLinkButton => 'เปิดลิงก์';

  @override
  String get sensitiveContentFriendDmLabel => 'ข้อความส่วนตัวจากเพื่อน';

  @override
  String get sensitiveContentNonFriendDmLabel => 'ข้อความส่วนตัวจากผู้อื่น';

  @override
  String get sensitiveContentGuildLabel => 'ข้อความในช่องคอมมูนิตี้';

  @override
  String get sensitiveContentFilterShow => 'แสดง';

  @override
  String get sensitiveContentFilterBlur => 'เบลอ';

  @override
  String get sensitiveContentFilterBlock => 'บล็อก';

  @override
  String get sensitiveContentResetButton => 'รีเซ็ต';

  @override
  String get sensitiveContentSaveButton => 'บันทึก';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ไฟล์',
      one: 'ไฟล์ 1 ไฟล์',
    );
    return 'กำลังอัปโหลด $_temp0';
  }

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'หมดอายุวันที่ $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'หมดอายุระหว่างวันที่ $start ถึง $end';
  }

  @override
  String get connectionsTitle => 'การเชื่อมต่อ';

  @override
  String connectionsDescription(String productName) {
    return 'เชื่อมโยงบัญชีและโดเมนภายนอกเข้ากับโปรไฟล์ $productName ของคุณ การเชื่อมต่อที่ยืนยันแล้วจะแสดงบนโปรไฟล์ของคุณเพื่อให้ผู้อื่นเห็น';
  }

  @override
  String get connectionsEmptyTitle => 'ยังไม่มีการเชื่อมต่อ';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'เชื่อมโยงบัญชี Bluesky ของคุณ หรือยืนยันความเป็นเจ้าของโดเมนเพื่อแสดงบนโปรไฟล์ของคุณ';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'ยืนยันความเป็นเจ้าของโดเมนเพื่อแสดงบนโปรไฟล์ของคุณ';

  @override
  String get connectionsAddBluesky => 'บลูสกาย';

  @override
  String get connectionsAddDomain => 'โดเมน';

  @override
  String get connectionsAddBlueskyAriaLabel => 'เพิ่มการเชื่อมต่อ Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'เพิ่มการเชื่อมต่อโดเมน';

  @override
  String get connectionEdit => 'แก้ไข';

  @override
  String get connectionRemove => 'ลบ';

  @override
  String get connectionVerifiedLabel => 'การเชื่อมต่อนี้ได้รับการยืนยันแล้ว';

  @override
  String get connectionUnverifiedLabel =>
      'การเชื่อมต่อนี้ยังไม่ได้รับการยืนยัน';

  @override
  String get connectionAddTitle => 'เพิ่มการเชื่อมต่อ';

  @override
  String get connectionTypeLabel => 'ประเภทการเชื่อมต่อ';

  @override
  String get connectionHandleLabel => 'ชื่อผู้ใช้';

  @override
  String get connectionDomainLabel => 'โดเมน';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'คุณมีการเชื่อมต่อนี้อยู่แล้ว';

  @override
  String get connectionConnectBluesky => 'เชื่อมต่อด้วย Bluesky';

  @override
  String get connectionContinue => 'ดำเนินการต่อ';

  @override
  String get connectionVerifyTitle => 'ยืนยันการเชื่อมต่อ';

  @override
  String get connectionVerifyInstructions =>
      'ใช้ระเบียนด้านล่างเพื่อพิสูจน์ความเป็นเจ้าของโดเมน';

  @override
  String get connectionDnsRecordTitle => 'ระเบียน DNS TXT';

  @override
  String get connectionDnsHostLabel => 'โฮสต์';

  @override
  String get connectionDnsValueLabel => 'ค่า';

  @override
  String get connectionCopyHost => 'คัดลอกโฮสต์';

  @override
  String get connectionCopyValue => 'คัดลอกค่า';

  @override
  String get connectionCopied => 'คัดลอกแล้ว!';

  @override
  String get connectionTokenFileTitle => 'วางไฟล์โทเค็นบนเว็บไซต์';

  @override
  String get connectionTokenFileDescription =>
      'ดาวน์โหลด **fluxer-verification** และวางไว้ในโฟลเดอร์ **.well-known** ของคุณ เพื่อให้เราสามารถตรวจสอบโดเมนได้';

  @override
  String get connectionTokenFileDownload => 'ดาวน์โหลด fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'ไฟล์มีโทเค็นการยืนยันที่เราจะดึงมาจาก **$dnsUrl**';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'บันทึก fluxer-verification';

  @override
  String get connectionVerifyButton => 'ยืนยัน';

  @override
  String get connectionBack => 'ย้อนกลับ';

  @override
  String get connectionEditTitle => 'แก้ไขการเชื่อมต่อ';

  @override
  String get connectionEditDescription =>
      'เลือกคนที่สามารถเห็นการเชื่อมต่อนี้ในโปรไฟล์ของคุณ';

  @override
  String get connectionVisibilityEveryone => 'ทุกคน';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'อนุญาตให้ทุกคนเห็นการเชื่อมต่อนี้ในโปรไฟล์ของคุณ';

  @override
  String get connectionVisibilityFriends => 'เพื่อน';

  @override
  String get connectionVisibilityFriendsDesc =>
      'อนุญาตให้เพื่อนเห็นการเชื่อมต่อนี้';

  @override
  String get connectionVisibilityCommunityMembers => 'สมาชิกคอมมูนิตี้';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'อนุญาตให้สมาชิกจากคอมมูนิตี้ที่คุณอยู่เห็นการเชื่อมต่อนี้';

  @override
  String get connectionRemoveTitle => 'ลบการเชื่อมต่อ';

  @override
  String get connectionRemoveDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบการเชื่อมต่อนี? การดำเนินการนี้ไม่สามารถยกเลิกได้';

  @override
  String get connectionRemoveConfirm => 'ลบ';

  @override
  String get connectionsLoadError => 'ไม่สามารถโหลดข้อมูลการเชื่อมต่อได้';

  @override
  String get connectionsReorderError => 'ไม่สามารถอัปเดตลำดับได้';

  @override
  String get connectionInitiateFailed =>
      'ไม่สามารถเริ่มการยืนยันได้ โปรดลองอีกครั้ง';

  @override
  String get connectionVerifyFailed =>
      'ไม่สามารถยืนยันได้ โปรดตรวจสอบระเบียน DNS ของคุณและลองอีกครั้ง';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'ไม่สามารถเริ่มการอนุญาต Bluesky ได้';

  @override
  String get connectionUpdateFailed => 'ไม่สามารถอัปเดตการเชื่อมต่อได้';

  @override
  String get connectionRemoveFailed => 'ไม่สามารถลบการเชื่อมต่อได้';

  @override
  String get connectionTokenSavedToast => 'บันทึก fluxer-verification แล้ว';

  @override
  String get connectionTokenSaveFailedToast => 'ไม่สามารถบันทึกไฟล์ได้';

  @override
  String get connectionEnterHandle => 'ป้อนชื่อผู้ใช้ Bluesky';

  @override
  String get connectionEnterDomain => 'ป้อนโดเมน';

  @override
  String get lookAndFeelThemeSectionTitle => 'ธีม';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'เลือกระหว่างรูปลักษณ์แบบมืด, ถ่าน, หรือสว่าง';

  @override
  String get lookAndFeelHdrSectionTitle => 'ช่วงไดนามิกสูง';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'ควบคุมการแสดงภาพ HDR บนจอภาพที่รองรับ HDR';

  @override
  String get lookAndFeelHdrFullName => 'ช่วงไดนามิกเต็มรูปแบบ';

  @override
  String get lookAndFeelHdrFullDescription =>
      'แสดงภาพ HDR ด้วยความสว่างและช่วงสีเต็มรูปแบบ';

  @override
  String get lookAndFeelHdrStandardName => 'ช่วงสีมาตรฐาน';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'ปรับโทนภาพ HDR เป็นช่วงมาตรฐาน ลดความสว่างสูงสุด';

  @override
  String get lookAndFeelHdrDisplayModeLabel => 'โหมดการแสดงผลช่วงไดนามิกสูง';

  @override
  String get lookAndFeelThemeDark => 'ธีมมืด';

  @override
  String get lookAndFeelThemeDarkLegacy => 'ธีมมืด (เดิม)';

  @override
  String get lookAndFeelThemeCoal => 'ธีมถ่านหิน';

  @override
  String get lookAndFeelThemeLight => 'ธีมสว่าง';

  @override
  String get lookAndFeelThemeSystem => 'ธีมของระบบ';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'ซิงค์ธีมในอุปกรณ์ทั้งหมด';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'เมื่อเปิดใช้งาน การเปลี่ยนแปลงธีมจะซิงค์ไปยังอุปกรณ์ทั้งหมดของคุณ เมื่อปิดใช้งาน อุปกรณ์นี้จะใช้การตั้งค่าธีมของตัวเอง';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'ธีมระบบจะปิดใช้งานการซิงค์โดยอัตโนมัติเพื่อติดตามการตั้งค่าระบบของคุณบนอุปกรณ์นี้';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'ไม่สามารถซิงค์ธีมไปยังบัญชีของคุณได้ โปรดลองอีกครั้ง';

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
  String get lookAndFeelChatFontSizeLabel => 'ขนาดตัวอักษรแชท';

  @override
  String get lookAndFeelAppZoomTitle => 'ระดับการซูมของแอป';

  @override
  String get lookAndFeelAppZoomDescription => 'ปรับระดับการซูมของแอป';

  @override
  String get lookAndFeelChatWallpaperTitle => 'วอลเปเปอร์แชท';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'เลือกพื้นหลังสำหรับแชทของคุณ สิ่งนี้จะอยู่ในอุปกรณ์นี้';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'การตั้งค่านี้จะอยู่ในอุปกรณ์นี้';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'วอลเปเปอร์แชทจะถูกบันทึกไว้ในอุปกรณ์นี้เท่านั้น และจะไม่ซิงค์ไปยังอุปกรณ์อื่น';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'ค่าเริ่มต้น';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'รูปภาพที่กำหนดเอง';

  @override
  String get lookAndFeelChatWallpaperStarfieldLabel => 'ทุ่งดาว';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'สี $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'ไล่เฉดสี $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'ปรับความเข้มวอลเปเปอร์';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'ไม่สามารถตั้งค่ารูปภาพนั้นเป็นวอลเปเปอร์ของคุณได้';

  @override
  String get lookAndFeelMessagesSectionTitle => 'ข้อความ';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'เลือกวิธีแสดงข้อความในช่องแชท';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'ระยะห่างระหว่างกลุ่มข้อความ';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'โหมดการแสดงข้อความ';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'สบายตา';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'เลย์เอาต์กว้างขวาง แยกข้อความชัดเจน';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'กระชับ';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'เพิ่มข้อความที่มองเห็นได้สูงสุดด้วยระยะห่างที่น้อยที่สุด';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'ซ่อนรูปโปรไฟล์ผู้ใช้';

  @override
  String get lookAndFeelInterfaceTitle => 'อินเทอร์เฟซ';

  @override
  String get lookAndFeelInterfaceDescription =>
      'ปรับแต่งหน้าตาและการทำงานของแอป';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'ตัวแสดงสถานะกำลังพิมพ์ในรายการช่อง';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'เลือกว่าตัวบ่งชี้การพิมพ์จะปรากฏในรายการช่องอย่างไรเมื่อมีคนกำลังพิมพ์ในช่อง';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'ตัวบ่งชี้สถานะกำลังพิมพ์ + รูปโปรไฟล์';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'แสดงสถานะกำลังพิมพ์พร้อมรูปโปรไฟล์ในรายการช่อง';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'เฉพาะตัวแสดงสถานะกำลังพิมพ์';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'แสดงเฉพาะสถานะกำลังพิมพ์ ไม่แสดงรูปโปรไฟล์';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'ซ่อนอยู่';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'ไม่แสดงสถานะกำลังพิมพ์ในรายการช่อง';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'แสดงการพิมพ์ในช่องที่เลือก';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'เมื่อปิดใช้งาน (ค่าเริ่มต้น) ตัวบ่งชี้การพิมพ์จะไม่ปรากฏในช่องที่คุณกำลังดูอยู่';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'ทั่วไป';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'คำแนะนำแป้นพิมพ์';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'ควบคุมว่าคำแนะนำทางลัดแป้นพิมพ์จะปรากฏในคำแนะนำเครื่องมือหรือไม่';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'ซ่อนคำแนะนำแป้นพิมพ์ในคำแนะนำเครื่องมือ';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'เมื่อเปิดใช้งาน จะซ่อนป้ายทางลัดในป๊อปอัปคำแนะนำเครื่องมือ';

  @override
  String get lookAndFeelGuildSidebarTitle => 'แถบด้านข้างเซิร์ฟเวอร์';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'กำหนดค่าการแสดงข้อความส่วนตัวในแถบด้านข้างเซิร์ฟเวอร์';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count ชุมชนไม่พร้อมใช้งานชั่วคราวเนื่องจากความผิดปกติของฟลักซ์คาปาซิเตอร์',
      one:
          '1 ชุมชนไม่พร้อมใช้งานชั่วคราวเนื่องจากความผิดปกติของฟลักซ์คาปาซิเตอร์',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'คอมมูนิตี้ใช้งานไม่ได้ชั่วคราว';

  @override
  String get guildUnavailableDescription =>
      'เกิดข้อผิดพลาด เรากำลังดำเนินการแก้ไขอยู่';

  @override
  String get guildNotFoundTitle => 'นี่ไม่ใช่คอมมูนิตี้ที่คุณกำลังมองหา';

  @override
  String get guildNotFoundDescription =>
      'คอมมูนิตี้ที่คุณกำลังมองหาอาจถูกลบไปแล้ว หรือคุณอาจไม่ได้รับสิทธิ์เข้าถึง';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'ขณะนี้ $communityName เข้าถึงได้เฉพาะเจ้าหน้าที่ของ $productName เท่านั้น';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'ไม่พร้อมใช้งานชั่วคราว';

  @override
  String get lookAndFeelCollapseDMsLabel => 'ยุบ DM เป็นโฟลเดอร์';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'เมื่อเปิดใช้งาน DM ที่ยังไม่ได้อ่านในแถบด้านข้างเซิร์ฟเวอร์จะถูกยุบเป็นโฟลเดอร์ในปุ่ม $productName คลิกปุ่ม $productName ขณะที่อยู่ในหน้า DM เพื่อขยายหรือยุบโฟลเดอร์';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'รายการช่อง';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'ควบคุมการแสดงตัวบ่งชี้ข้อความที่ยังไม่ได้อ่านสำหรับช่องที่ปิดเสียงในรายการช่อง';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'แสดงตัวบ่งชี้ข้อความที่ยังไม่ได้อ่านในช่องที่ปิดเสียง';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'เมื่อเปิดใช้งาน ช่องที่ปิดเสียงจะแสดงตัวบ่งชี้ที่ยังไม่ได้อ่านแบบจางๆ ทางด้านซ้าย การกล่าวถึงยังคงปรากฏโดยไม่คำนึงถึงการตั้งค่านี้';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'กำลังใช้งานอยู่';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'ควบคุมวิธีที่ \'กำลังใช้งานอยู่\' ปรากฏทั่วทั้งแอป';

  @override
  String get lookAndFeelShowActiveNowLabel => 'แสดงสถานะกำลังใช้งานบนหน้าหลัก';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'แสดงสถานะกำลังใช้งานบนหน้าหลักเพื่อให้เห็นเพื่อนที่กำลังใช้เสียงอยู่ คุณจะเห็นตัวอย่าง บริบทของช่อง ใครอยู่ในนั้นบ้าง และวิธีเข้าร่วมอย่างรวดเร็ว';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'รายการโปรด';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'ควบคุมการมองเห็นรายการโปรดทั่วทั้งแอป';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'เปิดใช้งานรายการโปรด';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'เมื่อเปิดใช้งาน คุณสามารถตั้งค่าช่องเป็นรายการโปรด และช่องเหล่านั้นจะปรากฏในส่วนรายการโปรด เมื่อปิดใช้งาน องค์ประกอบ UI ที่เกี่ยวข้องกับรายการโปรดทั้งหมด (ปุ่ม รายการเมนู) จะถูกซ่อน รายการโปรดที่มีอยู่ของคุณจะยังคงอยู่';

  @override
  String get favoritesTitle => 'รายการโปรด';

  @override
  String get favoritesEmptyTitle => 'ยังไม่มีรายการโปรด';

  @override
  String get favoritesEmptyDescription =>
      'ปักดาวช่องต่างๆ จากส่วนหัวแชทเพื่อเก็บไว้ที่นี่';

  @override
  String get favoritesWelcomeTitle => 'ยินดีต้อนรับสู่รายการโปรด';

  @override
  String get favoritesWelcomeDescription =>
      'พื้นที่ส่วนตัวของคุณสำหรับเข้าถึงช่อง ข้อความส่วนตัว และกลุ่มที่คุณชื่นชอบได้อย่างรวดเร็ว กดรูปดาวบนช่องใดก็ได้เพื่อเพิ่มช่องมาที่นี่';

  @override
  String get favoritesWelcomeTip => 'ไม่ถูกใจใช่ไหม ปิดได้ทุกเมื่อ';

  @override
  String get favoritesDisableButton => 'ปิดรายการโปรด';

  @override
  String get favoritesAddedToast => 'เพิ่มในรายการโปรดแล้ว';

  @override
  String get favoritesRemovedToast => 'นำออกจากรายการโปรดแล้ว';

  @override
  String get favoritesHiddenToast => 'ซ่อนรายการโปรดแล้ว';

  @override
  String get favoritesMute => 'ปิดเสียงรายการโปรด';

  @override
  String get favoritesUnmute => 'เลิกปิดเสียงรายการโปรด';

  @override
  String get favoritesHeaderMenu => 'เมนูรายการโปรด';

  @override
  String get favoritesCreateCategory => 'สร้างหมวดหมู่';

  @override
  String get favoritesCategoryNameLabel => 'ชื่อหมวดหมู่';

  @override
  String get favoritesHideMutedChannels => 'ซ่อนช่องที่ปิดเสียง';

  @override
  String get favoritesShowMutedChannels => 'แสดงช่องที่ปิดเสียง';

  @override
  String get favoritesSetNickname => 'ตั้งชื่อเล่น';

  @override
  String get favoritesNicknameLabel => 'ชื่อเล่น';

  @override
  String get favoritesSaveNickname => 'บันทึกชื่อเล่น';

  @override
  String get favoritesMoveToCategory => 'ย้ายไปยังหมวดหมู่';

  @override
  String get favoritesUncategorized => 'ไม่ได้จัดหมวดหมู่';

  @override
  String get favoritesOtherCategory => 'อื่น ๆ';

  @override
  String get favoritesRemoveFromFavorites => 'นำออกจากรายการโปรด';

  @override
  String get favoritesAddToFavorites => 'เพิ่มในรายการโปรด';

  @override
  String get favoritesAddToSavedMedia => 'เพิ่มไปยังสื่อที่บันทึกไว้';

  @override
  String get favoritesRemoveFromSavedMedia => 'ลบออกจากสื่อที่บันทึกไว้';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'เพิ่มไปยัง GIF รายการโปรด (เฉพาะ URL)';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'นำออกจาก GIF รายการโปรด (เฉพาะ URL)';

  @override
  String get savedMediaAddTitle => 'เพิ่มไปยังสื่อที่บันทึกไว้';

  @override
  String get savedMediaFormNameLabel => 'ชื่อ';

  @override
  String get savedMediaFormNameHint => 'สื่อสุดเจ๋งของฉัน';

  @override
  String get savedMediaFormAltTextLabel => 'ข้อความ Alt';

  @override
  String get savedMediaFormAltTextHint => 'อธิบายสื่อนี้';

  @override
  String get savedMediaFormTagsLabel => 'แท็ก';

  @override
  String get savedMediaFormTagsHint => 'ตลก, รีแอคชัน, งาน';

  @override
  String get savedMediaSaveError => 'ไม่สามารถอัปเดตสื่อที่บันทึกไว้ได้';

  @override
  String get savedMediaNameRequired => 'ต้องระบุชื่อ';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'เราควรบันทึกรายการ GIF ที่คุณชื่นชอบไว้อย่างไร';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'คุณสามารถเก็บ GIF ที่ติดดาวไว้เป็นรายการโปรดแบบ URL เท่านั้น หรืออัปโหลดไปยังสื่อที่บันทึกไว้ของคุณก็ได้ เลือกแบบที่เหมาะกับการใช้งานของคุณ คุณสามารถเปลี่ยนแปลงได้ตลอดเวลาใน การตั้งค่า > ขั้นสูง > สื่อ';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'รายการโปรดเฉพาะ URL (ค่าเริ่มต้น): ซิงค์ข้ามอุปกรณ์ของคุณ ไม่มีการอัปโหลด ไม่นับรวมในสื่อที่บันทึกไว้ สื่อต้นฉบับอาจหายไปหากโฮสต์ลบออก';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'สื่อที่บันทึกไว้: อัปโหลดได้ ติดแท็กได้ ค้นหาได้ และคงอยู่ถาวร แต่จะนับรวมกับขีดจำกัดสื่อที่บันทึกไว้ของคุณ';

  @override
  String get gifFavoriteFirstTimeHint => 'เราจะถามคุณเพียงครั้งเดียว';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'ใช้เฉพาะ URL (แนะนำ)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'ใช้สื่อที่บันทึกไว้';

  @override
  String get favoritesHideConfirmTitle => 'ซ่อนรายการโปรด';

  @override
  String get favoritesHideConfirmDescription =>
      'การดำเนินการนี้จะซ่อนองค์ประกอบ UI ที่เกี่ยวข้องกับรายการโปรดทั้งหมด รวมถึงปุ่มและรายการเมนู รายการโปรดที่มีอยู่ของคุณจะยังคงอยู่และสามารถเปิดใช้งานใหม่ได้ทุกเมื่อจากการตั้งค่า > ขั้นสูง > รูปลักษณ์';

  @override
  String get favoritesDirectMessageSubtitle => 'ข้อความส่วนตัว';

  @override
  String get messagesMediaDisplayGroupTitle => 'การแสดงผล';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'ควบคุมวิธีการแสดงข้อความ สื่อ และเนื้อหาอื่นๆ';

  @override
  String get messagesMediaMediaGroupTitle => 'สื่อ';

  @override
  String get messagesMediaMediaGroupDescription =>
      'ปรับแต่งการตั้งค่าขนาดสื่อและปุ่ม';

  @override
  String get messagesMediaInputGroupTitle => 'การป้อนข้อความ';

  @override
  String get messagesMediaInputGroupDescription =>
      'ปรับแต่งการตั้งค่าการป้อนข้อความ';

  @override
  String get messagesMediaSidebarGroupTitle => 'แถบด้านข้าง';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'กำหนดค่าวิธีการแสดงแถบด้านข้างของชุมชน';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'ซ่อนช่องที่ปิดเสียงไว้เป็นค่าเริ่มต้น';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'ซ่อนช่องที่ปิดเสียงในแถบด้านข้างโดยอัตโนมัติเมื่อคุณเข้าร่วมชุมชนใหม่';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'ซ่อนช่องที่ปิดเสียงไว้เป็นค่าเริ่มต้นหรือไม่';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'ช่องที่ปิดเสียงในคอมมูนิตี้ใหม่ที่คุณเข้าร่วมจะถูกซ่อนโดยอัตโนมัติ คุณต้องการใช้การตั้งค่านี้กับคอมมูนิตี้ที่มีอยู่ทั้งหมดของคุณด้วยหรือไม่';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'หยุดซ่อนช่องที่ปิดเสียงไว้เป็นค่าเริ่มต้นหรือไม่';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'คอมมูนิตี้ใหม่ที่คุณเข้าร่วมจะไม่ซ่อนช่องที่ปิดเสียงโดยอัตโนมัติอีกต่อไป คุณต้องการแสดงช่องที่ปิดเสียงในคอมมูนิตี้ที่มีอยู่ทั้งหมดของคุณด้วยหรือไม่';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'ใช้กับทุกคอมมูนิตี้';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'แสดงในทุกคอมมูนิตี้';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'เฉพาะคอมมูนิตี้ใหม่';

  @override
  String get messagesMediaDisplaySectionTitle => 'การแสดงผลสื่อ';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'ควบคุมวิธีการแสดงรูปภาพ วิดีโอ และสื่ออื่นๆ สื่อทั้งหมดจะถูกปรับขนาดและแปลง ไฟล์ขนาดใหญ่มากที่ไม่สามารถบีบอัดเป็นตัวอย่างได้จะไม่ถูกฝังโดยไม่คำนึงถึงการตั้งค่าเหล่านี้';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'เมื่อโพสต์เป็นลิงก์ไปยังแชท';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'เมื่ออัปโหลดไปยัง $productName โดยตรง';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'แสดงตัวอย่างลิงก์';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'ควบคุมวิธีการแสดงตัวอย่างลิงก์เว็บไซต์ในแชท';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'แสดงตัวอย่างลิงก์เว็บไซต์และสื่อที่ฝัง';

  @override
  String get messagesMediaReactionsSectionTitle => 'รีแอ็กชัน';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'ตั้งค่าการแสดงอิโมจิบนข้อความ';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'แสดงรีแอ็กชันอิโมจิบนข้อความ';

  @override
  String get messagesMediaSpoilersSectionTitle => 'เนื้อหาสปอยล์';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'ควบคุมวิธีการแสดงเนื้อหาที่ถูกสปอยล์';

  @override
  String get messagesMediaSpoilersRadioLabel => 'แสดงเนื้อหาที่ถูกสปอยล์';

  @override
  String get messagesMediaSpoilersOnClickName => 'เมื่อคลิก';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'แสดงเนื้อหาสปอยล์เมื่อคลิก';

  @override
  String get messagesMediaSpoilersIfModeratorName => 'ในช่องที่ฉันเป็นผู้ดูแล';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'แสดงเนื้อหาที่ถูกสปอยล์เสมอในช่องที่คุณได้รับอนุญาต \"จัดการข้อความ\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'ตลอดเวลา';

  @override
  String get messagesMediaSpoilersAlwaysDescription => 'แสดงเนื้อหาสปอยล์เสมอ';

  @override
  String get messagesMediaSizeSectionTitle => 'การตั้งค่าขนาดสื่อ';

  @override
  String get messagesMediaSizeSectionDescription =>
      'ปรับแต่งขนาดการแสดงผลสูงสุดสำหรับสื่อที่ฝังและแนบ ขนาดที่เล็กกว่าจะใช้พื้นที่หน้าจอน้อยกว่า ในขณะที่ขนาดที่ใหญ่กว่าจะแสดงรายละเอียดได้มากขึ้น';

  @override
  String get messagesMediaSizeEmbedLabel => 'สื่อจากลิงก์ (ที่ฝัง)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'ไฟล์แนบที่อัปโหลด';

  @override
  String get messagesMediaSizeCompactName => 'กะทัดรัด (400x300)';

  @override
  String get messagesMediaSizeCompactDescription => 'ขนาดสื่อที่เล็กกว่า';

  @override
  String get messagesMediaSizeComfortableName => 'สบายตา (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'ขนาดสื่อที่ใหญ่ขึ้นพร้อมรายละเอียดเพิ่มเติม';

  @override
  String get messagesMediaGifsSectionTitle => 'พฤติกรรม GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'ควบคุมวิธีการแทรก GIF ลงในแชท';

  @override
  String get messagesMediaGifsAutoSendLabel => 'ส่ง GIF อัตโนมัติเมื่อเลือก';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'การอัปโหลดจากกล้อง';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'เลือกว่าจะเก็บรูปภาพและวิดีโอที่ถ่ายด้วยกล้องในแอปไว้ในอุปกรณ์ของคุณหรือไม่';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel =>
      'บันทึกไปยังอุปกรณ์';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'การเติมข้อความอัตโนมัติ (การเติมข้อความด้วยเครื่องหมายทวิภาค)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'ควบคุมสิ่งที่ปรากฏในการเติมข้อความอัตโนมัติเมื่อคุณพิมพ์เครื่องหมายทวิภาค ปรับแต่งคำแนะนำที่จะแสดงเพื่อให้ตรงกับความต้องการของคุณ';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'แสดงอิโมจิเริ่มต้นในการเติมข้อความอัตโนมัติ';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'แสดงอิโมจิที่กำหนดเองในการเติมข้อความอัตโนมัติ';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'แสดงสติกเกอร์ในการเติมข้อความอัตโนมัติ';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'แสดงสื่อที่บันทึกไว้ในการเติมข้อความอัตโนมัติ';

  @override
  String get accessibilitySaturationTitle => 'ความอิ่มตัวของสี';

  @override
  String get accessibilityVisualGroupTitle => 'การแสดงผล';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel => 'ขีดเส้นใต้ลิงก์เสมอ';

  @override
  String get accessibilityShowAltTextOnImagesLabel => 'แสดงข้อความอธิบายรูปภาพ';

  @override
  String get accessibilityShowAltTextOnImagesDescription =>
      'แสดงข้อความอธิบายรูปภาพด้านล่างรูปภาพเมื่อมีข้อความดังกล่าว';

  @override
  String get accessibilityDimStrikethroughTextLabel => 'หรี่ข้อความขีดทับ';

  @override
  String get accessibilityDmMessagePreviewGroupTitle =>
      'การแสดงตัวอย่างข้อความส่วนตัว';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'โหมดแสดงตัวอย่างข้อความส่วนตัว';

  @override
  String get accessibilityDmMessagePreviewAllName => 'ข้อความทั้งหมด';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'แสดงตัวอย่างข้อความสำหรับข้อความส่วนตัวทั้งหมด';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'เฉพาะข้อความส่วนตัวที่ยังไม่ได้อ่าน';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'แสดงตัวอย่างข้อความเฉพาะในข้อความส่วนตัวที่มีข้อความยังไม่ได้อ่าน';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'ไม่มี';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'ไม่แสดงตัวอย่างข้อความในรายการข้อความส่วนตัว';

  @override
  String get accessibilityScreenReaderGroupTitle => 'โปรแกรมอ่านหน้าจอ';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'ควบคุมการทำงานของ $productName กับโปรแกรมอ่านหน้าจอ';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'ประกาศข้อความใหม่';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'ให้โปรแกรมอ่านหน้าจอประกาศข้อความใหม่เมื่อมาถึงในช่องที่เปิดอยู่ เสียงแจ้งเตือนจะไม่ได้รับผลกระทบ';

  @override
  String get accessibilityTtsGroupTitle => 'การอ่านออกเสียงข้อความ';

  @override
  String get accessibilityTtsGroupDescription =>
      'เลือกระดับความเร็วสำหรับข้อความที่อ่านออกเสียง';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'ความเร็วในการเล่นเสียงพูด';

  @override
  String get accessibilityTtsPlaySampleLabel => 'เล่นตัวอย่าง';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'หยุดเสียงตัวอย่าง';

  @override
  String get accessibilityPreviewButtonLabel => 'ปุ่มดูตัวอย่าง';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'นี่คือตัวอย่างการแสดงลิงก์: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'ผู้ใช้ตัวอย่าง';

  @override
  String get accessibilityKeyboardGroupTitle => 'แป้นพิมพ์';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'แสดงวงแหวนโฟกัสบนช่องข้อความแชท';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'ปุ่ม Esc ออกจากโหมดแป้นพิมพ์';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'แสดงปุ่มลัดเมนูบริบท';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'ยืนยันก่อนเริ่มการโทร';

  @override
  String get accessibilityAnimationGroupTitle => 'ภาพเคลื่อนไหว';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'เปิดการเคลื่อนไหวแบบลดลงแล้ว แอนิเมชันเนื้อหาจึงหยุดชั่วคราวโดยค่าเริ่มต้น คุณยังคงสามารถเปิดแอนิเมชันเหล่านี้กลับมาได้เพื่อให้เล่นต่อ';

  @override
  String get accessibilityPlayAnimatedEmojisLabel => 'เล่นอิโมจิเคลื่อนไหว';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'เล่น GIF อัตโนมัติ';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'เล่น GIF อัตโนมัติเมื่อ $productName อยู่ในโฟกัส';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'กำลังเล่นแม้จะเปิดโหมดลดการเคลื่อนไหวอยู่';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'หยุดชั่วคราวเนื่องจากโหมดลดการเคลื่อนไหว เปิดเพื่อให้อิโมจิเคลื่อนไหวเล่นต่อ';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'หยุดชั่วคราวเนื่องจากโหมดลดการเคลื่อนไหว เปิดเพื่อให้ GIF เล่นต่อ';

  @override
  String get accessibilityStickerAnimationsTitle => 'ภาพเคลื่อนไหวสติกเกอร์';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'การตั้งค่าภาพเคลื่อนไหวสติกเกอร์';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'เล่นภาพเคลื่อนไหวเสมอ';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'สติกเกอร์จะเคลื่อนไหวเสมอ';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'เล่นภาพเคลื่อนไหวเมื่อมีการโต้ตอบ';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'สติกเกอร์จะเคลื่อนไหวเมื่อคุณกดสติกเกอร์';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'สติกเกอร์จะเคลื่อนไหวเมื่อคุณวางเมาส์เหนือหรือโต้ตอบกับสติกเกอร์';

  @override
  String get accessibilityStickerNeverAnimateName => 'ไม่เล่นภาพเคลื่อนไหวเลย';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'สติกเกอร์จะไม่เคลื่อนไหว';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'แสดงภาพเคลื่อนไหวเสมอแม้จะเปิดโหมดลดการเคลื่อนไหว';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'การเคลื่อนไหวแบบลดจะจำกัดสติกเกอร์ให้เคลื่อนไหวเมื่อมีการโต้ตอบเท่านั้น หากต้องการให้เคลื่อนไหวตลอดเวลา ให้เลือก \'เคลื่อนไหวตลอดเวลา\'';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'ค่าเริ่มต้นคือเล่นภาพเคลื่อนไหวเมื่อมีการโต้ตอบบนมือถือเพื่อประหยัดแบตเตอรี่';

  @override
  String get accessibilityMotionGroupTitle => 'การเคลื่อนไหว';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'ซิงค์การตั้งค่าลดการเคลื่อนไหวกับระบบ';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'ใช้การตั้งค่าลดการเคลื่อนไหวของระบบในอุปกรณ์นี้ หรือปรับแต่งด้านล่าง';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'ลดการเคลื่อนไหว';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'ปิดภาพเคลื่อนไหวและเอฟเฟกต์การเปลี่ยนภาพ ขณะนี้ควบคุมโดยการตั้งค่าระบบของคุณ';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'ปิดภาพเคลื่อนไหวและเอฟเฟกต์การเปลี่ยนภาพทั่วทั้งแอป';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'คุณควบคุมอิโมจิ GIF และสติกเกอร์แบบเคลื่อนไหวได้ในแท็บภาพเคลื่อนไหว';

  @override
  String get accessibilityConfirmStartCallTitle => 'เริ่มการโทรหรือไม่';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการเริ่มการโทรนี้?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'เริ่มโทร';

  @override
  String get accessibilityTtsSampleDescription =>
      'ฟังตัวอย่างประโยคด้วยความเร็วที่คุณเลือก';

  @override
  String get accessibilityTtsSampleText =>
      'ด็อก ผมมาจากอนาคต ผมมาที่นี่ด้วยไทม์แมชชีนที่คุณเป็นคนประดิษฐ์ขึ้นมา ตอนนี้ผมต้องการความช่วยเหลือจากคุณเพื่อกลับไปยังปี 1985';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'การสังเคราะห์คำพูดไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'เล่นเสียงพูดไม่สำเร็จ ลองอีกครั้งหรือตรวจสอบว่าลำโพงทำงานปกติ';

  @override
  String get ttsSubstitutionUnknownUser => 'ผู้ใช้ที่ไม่รู้จัก';

  @override
  String get ttsSubstitutionUnknownRole => 'บทบาทที่ไม่รู้จัก';

  @override
  String get ttsSubstitutionUnknownChannel => 'ช่องที่ไม่รู้จัก';

  @override
  String get ttsSubstitutionCodeBlock => 'บล็อกโค้ด';

  @override
  String get ttsSubstitutionSpoiler => 'สปอยล์';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'อิโมจิ $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'คำสั่ง $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName พูดว่า: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return '$authorName ตอบกลับ $replyAuthorName ว่า: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'ส่งสติกเกอร์';

  @override
  String get ttsSentAttachment => 'ส่งไฟล์แนบ';

  @override
  String ttsSentAttachments(int count) {
    return 'ส่งไฟล์แนบ $count รายการ';
  }

  @override
  String get ttsSentEmbed => 'ส่ง Embed';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author ส่ง $summary';
  }

  @override
  String get dmListSentAnAttachment => 'ส่งไฟล์แนบ';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username ปักหมุดข้อความไว้ในช่องนี้แล้ว';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username เพิ่ม $userName เข้ากลุ่มแล้ว';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username เพิ่มบางคนเข้ากลุ่มแล้ว';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username ออกจากกลุ่มแล้ว';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username นำ $userName ออกจากกลุ่มแล้ว';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username นำบางคนออกจากกลุ่มแล้ว';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username เปลี่ยนชื่อช่องเป็น $newName';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username เปลี่ยนชื่อช่องแล้ว';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username เปลี่ยนไอคอนช่องแล้ว';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username เริ่มการโทรแล้ว';
  }

  @override
  String get systemCallJoinTheCall => 'เข้าร่วมการโทร';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username เริ่มต้นการโทรซึ่งกินเวลา $duration';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'คุณพลาดสายจาก $username ที่นาน $duration';
  }

  @override
  String systemCallMissed(String username) {
    return 'คุณพลาดสายจาก $username';
  }

  @override
  String get systemCallDurationFewSeconds => 'ไม่กี่วินาที';

  @override
  String get systemCallDurationMinute => '1 นาที';

  @override
  String get systemCallDurationOneYear => '1 ปี';

  @override
  String get systemCallDurationOneMonth => '1 เดือน';

  @override
  String get systemCallDurationOneWeek => '1 สัปดาห์';

  @override
  String get systemCallDurationOneDay => '1 วัน';

  @override
  String get systemCallDurationOneHour => '1 ชั่วโมง';

  @override
  String systemCallDurationYears(int count) {
    return '$count ปี';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count เดือน';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count สัปดาห์';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count วัน';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count ชั่วโมง';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count นาที';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'อัปเดต $productName เพื่อดูข้อความนี้';
  }

  @override
  String get voiceConnectionConfirmTitle => 'ยืนยันการเชื่อมต่อเสียง';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'คุณเชื่อมต่อกับช่องเสียงนี้จากอุปกรณ์อื่นแล้ว $count เครื่อง ต้องการทำอะไร?',
      one:
          'คุณเชื่อมต่อกับช่องเสียงนี้จากอุปกรณ์อื่นแล้ว 1 เครื่อง ต้องการทำอะไร?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'เปลี่ยนมาใช้อุปกรณ์นี้';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'เข้าร่วมเลย (คงการเชื่อมต่ออื่นไว้)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'ไม่ต้องทำอะไร ฉันไม่ต้องการเข้าร่วม';

  @override
  String get voiceJoinFailedTitle => 'เข้าร่วมเสียงไม่ได้';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'ไม่สามารถตัดการเชื่อมต่ออุปกรณ์อื่นของคุณได้ ลองอีกครั้งในสักครู่';

  @override
  String get voiceChannelJoin => 'เข้าร่วมช่องเสียง';

  @override
  String get voiceCallJoin => 'เข้าร่วมสาย';

  @override
  String get voiceChannelJoinConnect => 'เชื่อมต่อกับช่องเสียง';

  @override
  String get voiceChannelNoConnectPermission =>
      'คุณไม่มีสิทธิ์เข้าร่วมช่องเสียงนี้';

  @override
  String get voiceChannelE2eeEncrypted =>
      'เนื้อหาจากไมโครโฟน กล้อง และการแชร์หน้าจอได้รับการเข้ารหัสแบบต้นทางถึงปลายทาง';

  @override
  String get voiceCallE2eeEncrypted =>
      'เนื้อหาจากไมโครโฟน กล้อง และการแชร์หน้าจอได้รับการเข้ารหัสแบบต้นทางถึงปลายทาง';

  @override
  String get voiceChannelE2eeBroken =>
      'การเข้ารหัสจากต้นทางถึงปลายทางไม่พร้อมใช้งาน เนื่องจากมีผู้เข้าร่วมที่ไม่รองรับอยู่ในช่องเสียงนี้';

  @override
  String get voiceCallE2eeBroken =>
      'การเข้ารหัสจากต้นทางถึงปลายทางไม่พร้อมใช้งาน เนื่องจากมีผู้เข้าร่วมที่ไม่รองรับอยู่ในสายนี้';

  @override
  String get voiceE2eeUpdateRequired =>
      'ต้องอัปเดตไคลเอ็นต์นี้ก่อนเข้าร่วมการโทรที่เข้ารหัสนี้';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'ไม่สามารถเปิดไมโครโฟนของคุณได้ คุณยังคงอยู่ในสาย';

  @override
  String get voiceChannelStatusConnecting => 'กำลังเชื่อมต่อ…';

  @override
  String get voiceParticipantTooltipMobileDevice => 'อุปกรณ์มือถือ';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'อุปกรณ์เดสก์ท็อป';

  @override
  String get voiceParticipantTooltipCommunityMuted => 'ปิดเสียงโดยชุมชน';

  @override
  String get voiceParticipantTooltipMuted => 'ปิดเสียง';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'ปิดเสียงการได้ยินโดยชุมชน';

  @override
  String get voiceParticipantTooltipDeafened => 'ปิดเสียงทั้งหมดแล้ว';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'การเชื่อมต่อ: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ผู้เข้าร่วม $count คน',
      one: 'ผู้เข้าร่วม 1 คน',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'ออก';

  @override
  String get voiceControlMute => 'ปิดเสียง';

  @override
  String get voiceControlUnmute => 'เปิดเสียง';

  @override
  String get voiceControlDeafen => 'ปิดเสียงทั้งหมด';

  @override
  String get voiceControlUndeafen => 'เปิดเสียงทั้งหมด';

  @override
  String get voiceControlVideo => 'วิดีโอ';

  @override
  String get voiceControlFlipCamera => 'สลับกล้อง';

  @override
  String get voiceControlScreenShare => 'แชร์หน้าจอ';

  @override
  String get voiceScreenShareNotificationText => 'กำลังแชร์หน้าจอของคุณ';

  @override
  String get voiceControlDisconnect => 'ตัดการเชื่อมต่อ';

  @override
  String get voiceInChat => 'อยู่ในแชทเสียง';

  @override
  String get voiceConnectionFailed => 'การเชื่อมต่อล้มเหลว';

  @override
  String get voiceConnectionRetry => 'ลองอีกครั้ง';

  @override
  String get voiceConnectionDismiss => 'ปิด';

  @override
  String get voiceConnectionDisconnected => 'ตัดการเชื่อมต่อแล้ว';

  @override
  String voicePingMs(int currentLatency) {
    return 'Ping: $currentLatency ms';
  }

  @override
  String get voiceMeasuringLatency => 'กำลังวัดเวลาแฝง...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'ข้ามไปที่ $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'การเชื่อมต่อเสียง';

  @override
  String get voiceConnectionAdvancedStats => 'ขั้นสูง';

  @override
  String get voiceShowCallAvatars => 'แสดงรูปโปรไฟล์ในสาย';

  @override
  String get voiceShowConnectionId => 'แสดง ID การเชื่อมต่อ';

  @override
  String get voiceAudioProcessing => 'การประมวลผลเสียง';

  @override
  String get voiceConnectionSessionSection => 'เซสชัน';

  @override
  String get voiceConnectionDurationLabel => 'ระยะเวลา';

  @override
  String get voiceConnectionParticipantsLabel => 'ผู้เข้าร่วม';

  @override
  String get voiceConnectionNetworkSection => 'เครือข่าย';

  @override
  String get voiceConnectionPingLabel => 'ปิง';

  @override
  String get voiceConnectionJitterLabel => 'จิตเตอร์';

  @override
  String get voiceConnectionSendLabel => 'ส่ง';

  @override
  String get voiceConnectionReceiveLabel => 'รับ';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes นาที $seconds วินาที';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency มิลลิวินาที';
  }

  @override
  String voiceConnectionJitterMs(String jitter) {
    return '$jitter มิลลิวินาที';
  }

  @override
  String voiceConnectionBandwidthKbps(String bandwidth) {
    return '$bandwidth กิโลบิตต่อวินาที';
  }

  @override
  String get userAreaMuteMicrophone => 'ปิดไมโครโฟน';

  @override
  String get userAreaUnmuteMicrophone => 'เปิดไมโครโฟน';

  @override
  String get userAreaUserSettings => 'การตั้งค่าผู้ใช้';

  @override
  String get voiceParticipantMenuViewProfile => 'ดูโปรไฟล์';

  @override
  String get voiceParticipantMenuFocus => 'โฟกัสคนนี้';

  @override
  String get voiceParticipantMenuUnfocus => 'เลิกโฟกัส';

  @override
  String get voiceParticipantMenuCommunityMute => 'ปิดไมโครโฟนในคอมมูนิตี้';

  @override
  String get voiceParticipantMenuCommunityDeafen =>
      'ปิดเสียงทั้งหมดในคอมมูนิตี้';

  @override
  String get voiceParticipantMenuUserVolume => 'ระดับเสียงของผู้ใช้';

  @override
  String get voiceParticipantMenuStreamVolume => 'ระดับเสียงสตรีม';

  @override
  String get voiceParticipantMenuStopStreaming => 'หยุดสตรีม';

  @override
  String get voiceParticipantModerationFailed =>
      'ไม่สามารถอัปเดตสมาชิกนั้นได้ โปรดลองอีกครั้ง';

  @override
  String get voiceControlChat => 'แชท';

  @override
  String get voiceCallViewModeLabel => 'มุมมอง';

  @override
  String get voiceCallViewModeGrid => 'ตาราง';

  @override
  String get voiceCallViewModeFocus => 'โฟกัส';

  @override
  String get voicePanelSettingsSectionTitle => 'การตั้งค่าเสียง';

  @override
  String get voicePanelUseEarpieceLabel => 'ใช้หูฟัง';

  @override
  String get voiceOutputRouteSpeaker => 'ลำโพง';

  @override
  String get voiceOutputRouteEarpiece => 'ลำโพงหูฟัง';

  @override
  String get voiceOutputRouteHeadset => 'หูฟัง';

  @override
  String get voicePanelOnlyShowVideosLabel => 'แสดงเฉพาะวิดีโอ';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'แสดงเฉพาะผู้เข้าร่วมที่เปิดกล้องอยู่';

  @override
  String get voicePanelShowOwnCameraLabel => 'แสดงกล้องของฉัน';

  @override
  String get voicePrioritizeSpeakersLabel => 'จัดลำดับความสำคัญของผู้พูด';

  @override
  String get voiceTextChatShow => 'แสดงแชท';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ข้อความ',
      one: '# ข้อความ',
    );
    return 'แสดงแชทพร้อมข้อความที่ยังไม่ได้อ่าน $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'ต้องได้รับอนุญาตจากกล้องสำหรับวิดีโอ';

  @override
  String get voiceErrorScreenShareToggle =>
      'ไม่สามารถเริ่มแชร์หน้าจอได้ โปรดลองอีกครั้ง';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'ถูกปฏิเสธสิทธิ์การแชร์หน้าจอ';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'การแชร์หน้าจอไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get voiceWatchStream => 'ดูสตรีม';

  @override
  String get voiceStopWatching => 'หยุดดู';

  @override
  String get voiceStopWatchingCurrentStreamTooltip => 'หยุดดูสตรีมปัจจุบัน';

  @override
  String get voiceOwnScreenShareTitle => 'คุณกำลังถ่ายทอดสด';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'สตรีมของคุณกำลังถ่ายทอดสดสำหรับผู้เข้าร่วม';

  @override
  String get voiceLiveBadge => 'ถ่ายทอดสด';

  @override
  String get dmVoiceViewCall => 'ดูการโทร';

  @override
  String get dmVoiceCallFullScreen => 'เต็มหน้าจอ';

  @override
  String get dmVoiceCallFullScreenTooltip => 'เปิดการโทรแบบเต็มหน้าจอ';

  @override
  String get dmVoiceStripStatusConnecting => 'กำลังเชื่อมต่อ…';

  @override
  String get dmVoiceStripStatusInCall => 'กำลังคุยสาย';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'โทรด้วยเสียง';

  @override
  String get dmVoiceCallBarConnecting => 'กำลังเชื่อมต่อ…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'การโทรโดยตรง';

  @override
  String get dmVoiceCallBarGroupPrimary => 'การโทรแบบกลุ่ม';

  @override
  String get dmVoiceCallBarIssueFallback => 'ปัญหาเกี่ยวกับเสียง';

  @override
  String get dmVoiceFullscreenTitle => 'เสียง';

  @override
  String get voiceCallBarGuildConnectedFallback => 'เชื่อมต่อเสียงแล้ว';

  @override
  String get notificationsPageTitle => 'การแจ้งเตือน';

  @override
  String get notificationsFilterUnreads => 'ยังไม่ได้อ่าน';

  @override
  String get notificationsFilterMentions => 'การกล่าวถึง';

  @override
  String get notificationsBookmarksTooltip => 'บุ๊กมาร์ก';

  @override
  String get notificationsMentionFilterTooltip => 'ตัวกรองการกล่าวถึง';

  @override
  String get notificationsMentionFiltersTitle => 'ตัวกรองการกล่าวถึง';

  @override
  String get notificationsMentionIncludeEveryone =>
      'รวมการกล่าวถึง @everyone และ @here';

  @override
  String get notificationsMentionIncludeRoles => 'รวมการกล่าวถึงบทบาท';

  @override
  String get notificationsMentionIncludeGuilds =>
      'รวมการกล่าวถึงทั้งหมดในคอมมูนิตี้';

  @override
  String get notificationsNoUnreadTitle => 'ไม่มีข้อความที่ยังไม่ได้อ่าน';

  @override
  String get notificationsNoUnreadBody => 'อ่านครบหมดแล้ว';

  @override
  String get notificationsNoMentionsTitle => 'ไม่มีการกล่าวถึงล่าสุด';

  @override
  String get notificationsNoMentionsBody =>
      'การกล่าวถึงคุณทั้งหมดจะปรากฏที่นี่เป็นเวลา 7 วัน';

  @override
  String get notificationsMentionsEndTitle => 'คุณดูจนหมดแล้ว';

  @override
  String get notificationsMentionsEndBody =>
      'คุณเห็นการกล่าวถึงล่าสุดทั้งหมดแล้ว ไม่ต้องกังวล จะมีเพิ่มเข้ามาอีกเร็วๆ นี้';

  @override
  String get notificationsJump => 'ข้ามไป';

  @override
  String get notificationsRemoveMentionTooltip => 'ลบการกล่าวถึง';

  @override
  String get notificationsViewAllUnread => 'ดูทั้งหมดที่ยังไม่ได้อ่าน';

  @override
  String get notificationsMarkAsRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get notificationsExpand => 'ขยาย';

  @override
  String get notificationsCollapse => 'ยุบ';

  @override
  String get notificationsMessageUnavailable => 'ไม่สามารถโหลดข้อความนี้ได้';

  @override
  String characterCounterRemaining(int remaining) {
    return '$remaining ตัวอักษรที่เหลือ';
  }

  @override
  String get characterCounterTooLong => 'ข้อความยาวเกินไป';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return '$remaining ตัวอักษรที่เหลือ รับ $productName เพื่อเขียนได้สูงสุด $premiumMaxLength ตัวอักษร';
  }

  @override
  String get chatMessageFailedToSend => 'ส่งข้อความไม่สำเร็จ';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'ไม่สามารถส่งข้อความของคุณได้ โดยปกติจะเป็นเพราะคุณไม่ได้อยู่ในชุมชนเดียวกับผู้รับ หรือผู้รับยอมรับเฉพาะข้อความส่วนตัวจากเพื่อนเท่านั้น คุณอาจต้องปรับการตั้งค่าความเป็นส่วนตัวข้อความส่วนตัวของคุณใน $settingsPath';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'ส่งข้อความของคุณไม่ได้ คุณต้องยืนยันบัญชีก่อนจึงจะส่งข้อความส่วนตัวได้';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'ส่งข้อความไม่ได้ คุณต้องยืนยันบัญชีก่อนจึงจะส่งข้อความได้';

  @override
  String get chatSendFailureContentBlocked =>
      'ไม่สามารถส่งข้อความของคุณได้ เนื่องจากถูกระบบความปลอดภัยของเราตรวจจับไว้ หากคุณคิดว่านี่เป็นความผิดพลาด โปรดติดต่อฝ่ายสนับสนุน';

  @override
  String get chatSendFailureContentBlockedSelfHosted =>
      'ไม่สามารถส่งข้อความของคุณได้ เนื่องจากถูกระบบความปลอดภัยของเราตรวจจับไว้ หากคุณคิดว่านี่เป็นความผิดพลาด โปรดติดต่อผู้ดูแลระบบของอินสแตนซ์นี้';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'ไม่สามารถส่งข้อความของคุณได้เนื่องจากมีอิโมจิหรือสติกเกอร์สำหรับผู้ใหญ่ที่ไม่ได้รับอนุญาตในบริบทนี้';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'มีเพียงคุณเท่านั้นที่เห็นข้อความนี้';

  @override
  String get chatClientSystemDismiss => 'ปิด';

  @override
  String get privacyDashboardCommunicationSection => 'การสื่อสาร';

  @override
  String get privacyDashboardProfilePrivacySection =>
      'ความเป็นส่วนตัวของโปรไฟล์';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'เพื่อนและข้อความส่วนตัว';

  @override
  String get privacyDashboardActivitySharingSection => 'การแชร์กิจกรรม';

  @override
  String get privacyDashboardSensitiveContentSection => 'เนื้อหาที่ละเอียดอ่อน';

  @override
  String get privacyDashboardDataExportSection => 'การส่งออกข้อมูล';

  @override
  String get privacyDashboardDataDeletionSection => 'การลบข้อมูล';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'ใครดูโปรไฟล์ทั้งหมดของคุณได้บ้าง';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'เพื่อนและคอมมูนิตี้ทั้งหมด';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'โปรไฟล์แบบเต็มของคุณจะแสดงให้เพื่อนและทุกคนในคอมมูนิตี้ของคุณเห็น';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'เฉพาะเพื่อนและคอมมูนิตี้ขนาดเล็ก';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'โปรไฟล์แบบเต็มของคุณจะแสดงให้เพื่อนและสมาชิกในคอมมูนิตี้ที่มีสมาชิก 200 คนหรือน้อยกว่าเห็น';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'เฉพาะเพื่อน';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'โปรไฟล์แบบเต็มของคุณจะแสดงให้เพื่อนเห็นเท่านั้น';

  @override
  String get privacyDashboardFriendRequestsTitle => 'คำขอเป็นเพื่อน';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'ทุกคน';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'เพื่อนของเพื่อน';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'สมาชิกคอมมูนิตี้';

  @override
  String get privacyDashboardDirectMessagesTitle => 'ข้อความส่วนตัว';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'อนุญาตข้อความส่วนตัวจากสมาชิกคอมมูนิตี้';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'อนุญาตข้อความส่วนตัวจากบอทของคอมมูนิตี้';

  @override
  String get privacyDashboardIncomingCallsTitle => 'สายเรียกเข้า';

  @override
  String get privacyDashboardAllowedCallers => 'ผู้ที่โทรหาคุณได้';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'บล็อกสายเรียกเข้าทั้งหมด';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'อนุญาตให้เฉพาะเพื่อนโทรหาคุณเท่านั้น (แนะนำ)';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'อนุญาตให้เพื่อนและกลุ่มเพิ่มเติมที่คุณเลือก';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'อนุญาตให้ทุกคนโทรหาคุณได้ แม้แต่คนแปลกหน้า';

  @override
  String get privacyDashboardAdditionalGroups => 'กลุ่มเพิ่มเติม';

  @override
  String get privacyDashboardRingBehavior => 'ลักษณะการโทร';

  @override
  String get privacyDashboardSilentCalls => 'ปิดเสียงสายเรียกเข้าจากทุกคน';

  @override
  String get privacyDashboardGroupDmTitle => 'ใครเพิ่มคุณเข้ากลุ่มได้บ้าง';

  @override
  String get privacyDashboardAllowedInvites => 'ผู้ที่เชิญคุณได้';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'ห้ามใครเพิ่มคุณเข้ากลุ่มแชทโดยไม่ได้รับอนุญาต';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'อนุญาตให้เพื่อนเพิ่มคุณได้โดยไม่ต้องขอ (แนะนำ)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'อนุญาตให้เพื่อนและกลุ่มเพิ่มเติมเพิ่มคุณได้';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'อนุญาตให้ทุกคนเพิ่มคุณเข้ากลุ่มแชทได้โดยไม่ต้องขอ';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'กิจกรรมเสียงในส่วนกำลังใช้งานอยู่';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'แชร์กิจกรรมเสียงของคุณกับเพื่อน';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'แชร์กิจกรรมเสียงกับเพื่อนทั้งหมดหรือไม่';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'หยุดแชร์กิจกรรมเสียงกับเพื่อนทั้งหมดใช่หรือไม่';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'คุณกำลังจะเริ่มแชร์กิจกรรมเสียงของคุณกับเพื่อนทุกคนที่คุณมี รวมถึงเพื่อนในอนาคตด้วย ซึ่งจะส่งการอัปเดตถึงเพื่อนทุกคนและสามารถเปลี่ยนแปลงได้อีกครั้งใน 24 ชั่วโมง';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'คุณกำลังจะหยุดแชร์กิจกรรมเสียงของคุณกับเพื่อนทุกคน รวมถึงเพื่อนในอนาคตด้วย การดำเนินการนี้จะส่งการอัปเดตถึงเพื่อนทุกคน และจะสามารถเปลี่ยนแปลงได้อีกครั้งใน 24 ชั่วโมง';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'ใช่ แชร์กับเพื่อนทั้งหมด';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'ใช่ หยุดแชร์';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'จะใช้งานได้อีกครั้งใน $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'อัปเดตการแชร์กิจกรรมเสียงแล้ว';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'ไม่สามารถอัปเดตการแชร์กิจกรรมเสียงได้ในขณะนี้';

  @override
  String get privacyDashboardDataExportDesc =>
      'สร้างไฟล์เก็บถาวรที่ดาวน์โหลดได้ของข้อมูลบัญชีของคุณ รวมถึงข้อความและ URL ของไฟล์แนบ ผู้ใช้ส่วนใหญ่ต้องการทุกอย่าง แต่คุณสามารถจำกัดขอบเขตได้ด้านล่าง';

  @override
  String get privacyDashboardExportMyData => 'ส่งออกข้อมูลของฉัน';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'ลบข้อความที่คุณส่งในข้อความส่วนตัว แชทกลุ่ม และคอมมูนิตี้อย่างถาวร การดำเนินการนี้จะทำงานเบื้องหลัง และคุณจะได้รับข้อความส่วนตัวแจ้งเมื่อเสร็จสิ้น';

  @override
  String get privacyDashboardDeleteMyMessages => 'ลบข้อความของฉัน';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'อนุญาตข้อความส่วนตัวจากสมาชิกคอมมูนิตี้ไหม';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'บล็อกข้อความส่วนตัวจากสมาชิกคอมมูนิตี้ใช่หรือไม่';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'อนุญาตให้บอทส่งข้อความส่วนตัวถึงคุณหรือไม่';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'บล็อกไม่ให้บอทส่งข้อความส่วนตัวถึงคุณใช่หรือไม่';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'คุณต้องการอนุญาตให้สมาชิกในคอมมูนิตี้ที่คุณอยู่ส่งข้อความส่วนตัวถึงคุณด้วยหรือไม่';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'คุณต้องการบล็อกข้อความส่วนตัวจากสมาชิกในคอมมูนิตี้ที่คุณอยู่ด้วยหรือไม่';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'คุณต้องการอนุญาตให้บอทจากคอมมูนิตี้ที่คุณอยู่ส่งข้อความส่วนตัวถึงคุณด้วยหรือไม่';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'คุณต้องการบล็อกบอทจากชุมชนที่คุณเป็นสมาชิกอยู่ด้วยหรือไม่';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'คุณสามารถเปลี่ยนการตั้งค่านี้ต่อชุมชนได้โดยการกดที่ชื่อชุมชนค้างไว้แล้วเลือก การตั้งค่าความเป็นส่วนตัว';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'อนุญาตสำหรับทุกคอมมูนิตี้';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'บล็อกสำหรับทุกคอมมูนิตี้';

  @override
  String get privacyDashboardDmConfirmSkip => 'ข้ามขั้นตอนนี้';

  @override
  String get privacyDashboardDataRequestGoBack => 'ย้อนกลับ';

  @override
  String get privacyDashboardDataRequestExportTitle => 'ส่งออกข้อมูลของฉัน';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'ลบข้อความของฉัน';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'เราจะดำเนินการโดยเร็วที่สุด คุณจะได้รับอีเมลเมื่อไฟล์เก็บถาวรของคุณพร้อมใช้งาน';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'เราจะดำเนินการให้เร็วที่สุด คุณจะได้รับข้อความส่วนตัวจากเราเมื่อดำเนินการเสร็จสิ้น';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'สิ่งที่ต้องการรวม';

  @override
  String get privacyDashboardDataRequestExportEverything => 'ทุกอย่าง';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'ส่งออกข้อความทั้งหมดที่คุณเคยส่ง รวมถึงการตั้งค่าบัญชี การเป็นสมาชิก และข้อมูลเมตาของคุณทั้งหมด';

  @override
  String get privacyDashboardDataRequestExportCustom => 'เลือกเอง';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'เลือกประเภทการสนทนา คอมมูนิตี้ และช่วงเวลาที่จะรวมไว้ในไฟล์เก็บถาวร';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'เลือกสิ่งที่ต้องการรวม';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'เลือกประเภทการสนทนาที่ต้องการล้างข้อมูล';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'เฉพาะที่ที่ฉันเข้าถึงไม่ได้แล้ว';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'ลบเฉพาะข้อความจากคอมมูนิตี้และแชทกลุ่มที่คุณออกมาแล้วหรือถูกนำออกแล้ว';

  @override
  String get privacyDashboardDataRequestKindsTitle => 'การสนทนาใดบ้าง';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'เลือกประเภทการสนทนาที่คุณต้องการรวม';

  @override
  String get privacyDashboardDataRequestKindDms => 'ข้อความส่วนตัวที่เปิดอยู่';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'ข้อความส่วนตัวที่ปิดไปแล้ว';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'แชทกลุ่ม';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'คอมมูนิตี้';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'คอมมูนิตี้ใดบ้าง';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'ตัวกรองคอมมูนิตี้';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'รวมทั้งหมด ยกเว้นที่เลือก';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'เฉพาะที่เลือกไว้';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'ขณะนี้คุณยังไม่ได้อยู่ในคอมมูนิตี้ใดๆ';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'ช่วงเวลา';

  @override
  String get privacyDashboardDataRequestDateMode => 'ช่วงเวลา';

  @override
  String get privacyDashboardDataRequestAllTime => 'ทุกช่วงเวลา';

  @override
  String get privacyDashboardDataRequestCustomRange => 'กำหนดช่วงเอง';

  @override
  String get privacyDashboardDataRequestStartDate => 'วันที่เริ่มต้น';

  @override
  String get privacyDashboardDataRequestEndDate => 'วันที่สิ้นสุด';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'เว้นช่องใดช่องหนึ่งว่างไว้ เพื่อไม่กำหนดขอบเขตของช่วงเวลาด้านนั้น';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'เลือกประเภทการสนทนาที่จะรวมอย่างน้อยหนึ่งประเภท';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'วันที่เริ่มต้นต้องเร็วกว่าวันที่สิ้นสุด';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'ตรวจสอบและยืนยัน';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'เราจะสร้างไฟล์เก็บถาวรที่ดาวน์โหลดได้ของทุกข้อความที่คุณเคยส่ง และจะส่งอีเมลแจ้งให้คุณทราบเมื่อไฟล์พร้อมใช้งาน ลิงก์ดาวน์โหลดในอีเมลนั้นจะหมดอายุใน 7 วัน';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'เราจะสร้างไฟล์เก็บถาวรที่ดาวน์โหลดได้ซึ่งตรงกับตัวกรองด้านล่าง และจะส่งอีเมลแจ้งให้คุณทราบเมื่อไฟล์พร้อมใช้งาน ลิงก์ดาวน์โหลดในอีเมลจะหมดอายุหลังจาก 7 วัน';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'ลบข้อความที่ตรงกับตัวกรองด้านล่างอย่างถาวร การดำเนินการนี้ไม่สามารถเลิกทำได้';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'เมื่อเริ่มแล้วจะไม่สามารถกู้คืนได้ เราจะส่งข้อความส่วนตัวถึงคุณเมื่อดำเนินการเสร็จสิ้น';

  @override
  String get privacyDashboardDataRequestRequestExport => 'ขอส่งออกข้อมูล';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'ลบข้อความ';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'ขอบเขต';

  @override
  String get privacyDashboardDataRequestSummaryConversations => 'การสนทนา';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'คอมมูนิตี้';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'ช่วงเวลา';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'ไม่มี';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'ตั้งแต่ $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'จนถึง $end';
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
      other: '# ชุมชน',
      one: '# ชุมชน',
    );
    return 'ทั้งหมด ยกเว้น $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# ชุมชน',
      one: '# ชุมชน',
    );
    return 'เพียง $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'ข้อความส่วนตัวที่เปิดอยู่';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'ข้อความส่วนตัวที่ปิดไปแล้ว';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'ข้อความส่วนตัว (ทั้งที่เปิดและปิด)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'แชทกลุ่ม';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'คอมมูนิตี้';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ชั่วโมง',
      one: '# ชั่วโมง',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: 'และ # นาที',
      one: 'และ # นาที',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# ชั่วโมง',
      one: '# ชั่วโมง',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# นาที',
      one: '# นาที',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# วินาที',
      one: '# วินาที',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'ไม่สามารถโหลดการตั้งค่าความเป็นส่วนตัวได้';

  @override
  String get privacyDashboardRetry => 'ลองอีกครั้ง';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'ไม่สามารถบันทึกการตั้งค่าเนื้อหาที่ละเอียดอ่อนได้';

  @override
  String get privacyDashboardDataRequestFailed =>
      'ไม่สามารถดำเนินการตามคำขอได้สำเร็จ';

  @override
  String get chatMessageDeleteFailed => 'ล้มเหลวในการลบข้อความ';

  @override
  String get chatMessageAddReaction => 'เพิ่มรีแอ็กชัน';

  @override
  String get doubleTapReactionHint => 'แตะสองครั้งที่ข้อความเพื่อ';

  @override
  String get doubleTapReactionEdit => 'แก้ไข';

  @override
  String get doubleTapReactionEditTitle => 'แก้ไขค่าเริ่มต้น';

  @override
  String get doubleTapReactionEditSubtitle => 'เลือกอิโมจิแตะสองครั้ง';

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
  String get chatMessageEdit => 'แก้ไขข้อความ';

  @override
  String get chatMessageReply => 'ตอบกลับ';

  @override
  String get notificationReplyPlaceholder => 'ข้อความ';

  @override
  String get notificationReplyFailed => 'ส่งข้อความตอบกลับไม่ได้';

  @override
  String get chatMessageForward => 'ส่งต่อ';

  @override
  String get forwardMessageTitle => 'ส่งต่อข้อความ';

  @override
  String get forwardSearchHint => 'ค้นหาแชทหรือ DM';

  @override
  String get forwardDirectMessagesSection => 'ข้อความส่วนตัว';

  @override
  String get forwardCommentHint => 'เพิ่มความคิดเห็น (ไม่บังคับ)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'ส่ง ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'ไม่พบช่อง';

  @override
  String get forwardSuccessToast => 'ส่งต่อข้อความแล้ว';

  @override
  String get forwardFailed => 'ส่งต่อข้อความไม่สำเร็จ';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'ไม่สามารถแสดงความคิดเห็นได้เนื่องจากช่องที่เลือกเปิดใช้งานโหมดหน่วงเวลา';

  @override
  String get forwardSendSlowmodeBlocked =>
      'กำลังรอให้โหมดจำกัดเวลาในช่องที่เลือกอย่างน้อยหนึ่งช่องสิ้นสุด';

  @override
  String get slowmodeRateLimitedTitle => 'โหมดจำกัดเวลาทำงานอยู่';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'โหมดหน่วงเวลาเปิดอยู่ — รออีก $duration ก่อนส่งข้อความถัดไป';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'การอัปโหลดโดยตรงถูกปิดใช้งานในช่วงโหมดหน่วงเวลา';

  @override
  String get shareMediaTitle => 'แชร์ไปยัง';

  @override
  String get shareMediaMessageHint => 'เพิ่มข้อความเสริม…';

  @override
  String get shareMediaSendButton => 'ส่ง';

  @override
  String get shareMediaSuccessToast => 'แชร์สื่อแล้ว';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'แชร์ไปยังปลายทาง $count รายการ';
  }

  @override
  String get shareMediaFailedToast => 'แชร์สื่อไม่สำเร็จ';

  @override
  String get forwardDestinationNoSendPermission =>
      'คุณไม่สามารถส่งข้อความที่นี่ได้';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'คุณไม่สามารถฝังลิงก์ที่นี่ได้';

  @override
  String get forwardDestinationNoAttachPermission =>
      'คุณไม่สามารถแนบไฟล์ที่นี่ได้';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'การส่งข้อความในคอมมูนิตี้นี้ถูกปิดอยู่';

  @override
  String get forwardDestinationTimedOut => 'คุณถูกจำกัดการสื่อสารในชุมชนนี้';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'โหมดหน่วงเวลา - รอ $remaining';
  }

  @override
  String get chatMessageCopyText => 'คัดลอกข้อความ';

  @override
  String get chatMessageCopyEmbedText => 'คัดลอกข้อความที่ฝัง';

  @override
  String get chatMessageTranslate => 'แปลภาษา';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'แปลจาก $language';
  }

  @override
  String get chatMessageSeeOriginal => 'ดูต้นฉบับ';

  @override
  String get chatMessageSeeTranslation => 'ดูการแปล';

  @override
  String get chatMessageTranslating => 'กำลังแปล…';

  @override
  String get chatMessageTranslateFailed => 'แปลข้อความนี้ไม่ได้';

  @override
  String get chatMessageTranslateUnavailable =>
      'การแปลไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get chatMessageSpeak => 'อ่านข้อความออกเสียง';

  @override
  String get chatMessageStopSpeaking => 'หยุดพูด';

  @override
  String get chatMessagePin => 'ปักหมุดข้อความ';

  @override
  String get chatMessageUnpin => 'เลิกปักหมุดข้อความ';

  @override
  String get chatMessageUnpinIt => 'เลิกปักหมุด';

  @override
  String get chatMessageBookmark => 'บุ๊กมาร์กข้อความ';

  @override
  String get chatMessageRemoveBookmark => 'ลบบุ๊กมาร์ก';

  @override
  String get chatMessageMarkAsUnread => 'ทำเครื่องหมายว่ายังไม่ได้อ่าน';

  @override
  String get chatMessageCopyMessageLink => 'คัดลอกลิงก์ข้อความ';

  @override
  String get chatMessageOpenLink => 'เปิดลิงก์';

  @override
  String get chatMessageCopyLink => 'คัดลอกลิงก์';

  @override
  String get chatMessageCopyMessageId => 'คัดลอก ID ข้อความ';

  @override
  String get chatMessageViewReactions => 'ดูรีแอ็กชัน';

  @override
  String get chatMessageRemoveAllReactions => 'ลบรีแอ็กชันทั้งหมด';

  @override
  String get chatMessageDebug => 'ดีบักข้อความ';

  @override
  String get chatMessageDebugSheetTitle => 'ดีบักข้อความ';

  @override
  String get chatMessageDebugCopyJson => 'คัดลอก JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'คัดลอก JSON ข้อความไปยังคลิปบอร์ดแล้ว';

  @override
  String get chatReactionsSheetTitle => 'รีแอ็กชัน';

  @override
  String get chatReactionsSheetEmpty => 'ยังไม่มีใครใช้รีแอ็กชันนี้';

  @override
  String get chatReactionAddFailed => 'ไม่สามารถเพิ่มอิโมจิได้';

  @override
  String get chatReactionRemoveFailed => 'ไม่สามารถลบอิโมจิได้';

  @override
  String get chatMessageReport => 'รายงานข้อความ';

  @override
  String get reportFlowTitleMessage => 'รายงานข้อความ';

  @override
  String get reportFlowTitleUserProfile => 'รายงานโปรไฟล์';

  @override
  String get reportFlowSummaryTitle => 'ตรวจสอบรายงานของคุณ';

  @override
  String get reportFlowSummarySubtitle => 'ตรวจสอบให้แน่ใจว่าถูกต้องก่อนส่ง';

  @override
  String reportFlowDisclaimer(String guidelines) {
    return 'รายงานเฉพาะสิ่งที่คุณเชื่อด้วยความสุจริตใจว่าละเมิดกฎ การใช้รายงานในทางที่ผิดขัดต่อ$guidelinesของเรา';
  }

  @override
  String get reportFlowCommunityGuidelinesLink => 'หลักเกณฑ์คอมมูนิตี้';

  @override
  String get reportFlowDisclaimerNoLink =>
      'รายงานเฉพาะสิ่งที่คุณเชื่อด้วยความสุจริตใจว่าละเมิดกฎ และโปรดอย่าส่งรายงานเดียวกันซ้ำ';

  @override
  String get reportFlowSelectedMessage => 'ข้อความที่คุณกำลังรายงาน';

  @override
  String get reportFlowSelectedUser => 'โปรไฟล์ที่คุณกำลังรายงาน';

  @override
  String get reportFlowReportCategory => 'คำตอบของคุณ';

  @override
  String get reportFlowSubmit => 'ส่งรายงาน';

  @override
  String get reportFlowBack => 'ย้อนกลับ';

  @override
  String get reportFlowNext => 'ถัดไป';

  @override
  String get reportFlowDone => 'เสร็จสิ้น';

  @override
  String get reportFlowThankYouTitle => 'ส่งรายงานแล้ว';

  @override
  String get reportFlowThankYouNoReportTitle => 'ขอบคุณที่แจ้งให้เราทราบ';

  @override
  String reportFlowThankYouBody(String productName) {
    return 'ทีมความปลอดภัยของ $productName จะตรวจสอบรายงานของคุณ เราจะไม่เปิดเผยว่ารายงานนี้มาจากคุณ';
  }

  @override
  String get reportFlowThankYouNoReportBody =>
      'ขอบคุณที่แจ้งให้เราทราบ เรื่องนี้เพียงอย่างเดียวยังไม่ถือว่าละเมิดกฎของเรา เราจึงไม่ได้ส่งรายงาน หากมุ่งเป้าไปที่ใครบางคนหรือใช้ถ้อยคำเหยียดหยาม โปรดรายงานอีกครั้งและเลือก “เนื้อหาที่ล่วงละเมิดหรือเป็นอันตราย”';

  @override
  String get reportFlowThankYouNoReportBodyShort =>
      'ขอบคุณที่แจ้งให้เราทราบ เรื่องนี้เพียงอย่างเดียวยังไม่ถือว่าละเมิดกฎของเรา เราจึงไม่ได้ส่งรายงาน';

  @override
  String get reportFlowMoreYouCanDo => 'ตัวเลือกของคุณ';

  @override
  String reportFlowBlockName(String name) {
    return 'บล็อก $name';
  }

  @override
  String get reportFlowBlockDescription =>
      'ซ่อนข้อความของพวกเขาและหยุดไม่ให้ส่งข้อความถึงคุณ';

  @override
  String get reportFlowBlockButton => 'บล็อก';

  @override
  String get reportFlowBlockedButton => 'ถูกบล็อก';

  @override
  String get reportFlowUrgentBanner =>
      'หากมีใครกำลังตกอยู่ในอันตรายเฉพาะหน้า โปรดติดต่อหน่วยบริการฉุกเฉินในพื้นที่ก่อน';

  @override
  String get reportFlowLoadFailed => 'ไม่สามารถโหลดแบบฟอร์มรายงานได้';

  @override
  String get reportFlowTryAgain => 'ลองอีกครั้ง';

  @override
  String get reportFlowOutdated =>
      'แบบฟอร์มรายงานมีการเปลี่ยนแปลง โปรดเริ่มใหม่';

  @override
  String get reportFlowAlreadyReported => 'คุณได้รายงานข้อความนี้ไปแล้ว';

  @override
  String get reportFlowAlreadyReportedProfile =>
      'คุณได้รายงานโปรไฟล์นี้ไปแล้ววันนี้';

  @override
  String get reportFlowRateLimited =>
      'คุณส่งรายงานเร็วเกินไป ลองอีกครั้งภายหลัง';

  @override
  String get reportFlowSubmitFailed => 'ส่งรายงานของคุณไม่สำเร็จ ลองอีกครั้ง';

  @override
  String get reportFlowAccountSetupRequired =>
      'ยืนยันบัญชีและอีเมลของคุณเพื่อส่งรายงาน';

  @override
  String get chatMessageSuppressEmbeds => 'ไม่แสดงตัวอย่างลิงก์';

  @override
  String get chatMessageUnsuppressEmbeds => 'แสดงตัวอย่างลิงก์';

  @override
  String get chatMessageDelete => 'ลบข้อความ';

  @override
  String get chatMessageDeleteConfirmTitle => 'ลบข้อความ';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบข้อความนี้';

  @override
  String get chatMessageDeleteAttachment => 'ลบไฟล์แนบ';

  @override
  String get chatMessageDeleteAttachmentConfirmDescription =>
      'Are you sure you want to delete this attachment?';

  @override
  String get chatMessageEditAttachmentAltText => 'แก้ไขข้อความอธิบายรูปภาพ';

  @override
  String get chatMessageMore => 'เพิ่มเติม';

  @override
  String get chatEditingMessage => 'กำลังแก้ไขข้อความ';

  @override
  String get chatReplyOriginalDeleted => 'ข้อความต้นฉบับถูกลบแล้ว';

  @override
  String get chatReplyOriginalFailedToLoad => 'ไม่สามารถโหลดข้อความต้นฉบับได้';

  @override
  String get chatReplyAttachedMedia => 'ข้อความมีสื่อที่แนบมา';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ข้อความที่ถูกบล็อก $count รายการ',
      one: 'ข้อความที่ถูกบล็อก 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ข้อความสแปมที่อาจเกิดขึ้น',
      one: 'ข้อความสแปมที่อาจเกิดขึ้น 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'ซ่อนการตอบกลับเนื่องจากคุณบล็อกผู้เขียนต้นฉบับ';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'ซ่อนการตอบกลับ เนื่องจากผู้เขียนต้นฉบับถูกระบุว่าเป็นผู้ส่งสแปม';

  @override
  String get devMarkAsSpamLocally => 'ทำเครื่องหมายว่าเป็นสแปมเฉพาะเครื่องนี้';

  @override
  String get devIgnoreSpamFlag => 'ไม่สนใจการแจ้งว่าเป็นสแปม';

  @override
  String get chatMessagesLoadError => 'ไม่สามารถโหลดข้อความได้';

  @override
  String get chatReplyMentionOverrideTitle =>
      'ข้ามการตั้งค่าการกล่าวถึงหรือไม่';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname ต้องการให้กล่าวถึงเมื่อตอบกลับ จะส่งโดยไม่กล่าวถึงหรือไม่';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname ไม่ต้องการให้กล่าวถึงเมื่อตอบกลับ จะส่งโดยกล่าวถึงอยู่ดีหรือไม่';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'ไม่สนใจการตั้งค่า';

  @override
  String get chatReplyMentionDisableTooltip =>
      'คลิกเพื่อปิดการแจ้งเตือนผู้ใช้ที่คุณกำลังตอบกลับ';

  @override
  String get chatReplyMentionEnableTooltip =>
      'คลิกเพื่อเปิดการแจ้งเตือนผู้ใช้ที่คุณกำลังตอบกลับ';

  @override
  String get chatReplyMentionAccessibilityLabel => 'Mention ผู้ที่ตอบกลับ';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'OFF';

  @override
  String get chatReplyCancel => 'ยกเลิกตอบกลับ';

  @override
  String get chatEditMessageHint => 'แก้ไขข้อความ';

  @override
  String get chatEditNoChanges => 'ไม่มีการเปลี่ยนแปลงที่ต้องบันทึก';

  @override
  String get chatChannelNotReady =>
      'ช่องนี้ยังไม่พร้อม โปรดลองอีกครั้งในสักครู่';

  @override
  String get chatMessageEdited => '(แก้ไขแล้ว)';

  @override
  String get chatMessageSilent => 'นี่คือข้อความ @silent';

  @override
  String chatMessageTimestampToday(String time) {
    return 'วันนี้ เวลา $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'เมื่อวานนี้ เวลา $time';
  }

  @override
  String get mediaViewerImagePreview => 'ตัวอย่างรูปภาพ';

  @override
  String get mediaViewerClose => 'ปิดหน้าต่างดูมีเดีย';

  @override
  String get mediaViewerOpenInBrowser => 'เปิดในเบราว์เซอร์';

  @override
  String get mediaViewerOptions => 'ตัวเลือกสื่อ';

  @override
  String get mediaViewerCopyLink => 'คัดลอกลิงก์';

  @override
  String get mediaViewerForward => 'ส่งต่อ';

  @override
  String get mediaViewerZoomIn => 'ซูมเข้า';

  @override
  String get mediaViewerZoomOut => 'ซูมออก';

  @override
  String get mediaViewerPreviousAttachment => 'ไฟล์แนบก่อนหน้า';

  @override
  String get mediaViewerNextAttachment => 'ไฟล์แนบถัดไป';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'ไฟล์แนบ $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'ปิด';

  @override
  String get chatAttachmentVideoToggleControls => 'สลับการควบคุมวิดีโอ';

  @override
  String get chatAttachmentVideoMute => 'ปิดเสียงวิดีโอ';

  @override
  String get chatAttachmentVideoUnmute => 'เปิดเสียงวิดีโอ';

  @override
  String get chatAttachmentVideoPlay => 'เล่นวิดีโอ';

  @override
  String get chatAttachmentVideoPause => 'หยุดวิดีโอชั่วคราว';

  @override
  String get chatAttachmentVideoProgress => 'ความคืบหน้าของวิดีโอ';

  @override
  String get chatVideoPlaybackFailed => 'ไม่สามารถเล่นวิดีโอนี้ได้';

  @override
  String get chatImageCouldNotLoad => 'ไม่สามารถโหลดรูปภาพนี้ได้';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'แจ้งเตือนผู้ใช้ที่มีบทบาทนี้และมีสิทธิ์เข้าถึงช่องนี้';

  @override
  String get composerAutocompleteSuggestions => 'คำแนะนำ';

  @override
  String get composerAutocompleteCommandsHeading => 'คำสั่ง';

  @override
  String get composerAutocompleteChoicesHeading => 'ตัวเลือก';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'อาร์กิวเมนต์เสริม';

  @override
  String get composerAutocompleteMediaHeading => 'สื่อ';

  @override
  String get composerAutocompleteStickersHeading => 'สติกเกอร์';

  @override
  String get composerAutocompleteGifsHeading => 'GIF';

  @override
  String get composerAutocompleteNoGifs => 'ไม่พบ GIF';

  @override
  String get composerCommandShrugDescription =>
      'เพิ่ม ¯\\_(ツ)_/¯ ต่อท้ายข้อความของคุณ';

  @override
  String get composerCommandTableflipDescription =>
      'เพิ่ม (╯°□°)╯︵ ┻━┻ ต่อท้ายข้อความของคุณ';

  @override
  String get composerCommandUnflipDescription =>
      'เพิ่ม ┬─┬ ノ( ゜-゜ノ) ต่อท้ายข้อความของคุณ';

  @override
  String get composerCommandMeDescription =>
      'ส่งข้อความแบบบรรยายการกระทำ (แสดงเป็นตัวเอียง)';

  @override
  String get composerCommandSpoilerDescription =>
      'ส่งข้อความสปอยล์ (จะซ่อนข้อความไว้)';

  @override
  String get composerCommandTtsDescription => 'ส่งข้อความแบบอ่านออกเสียง';

  @override
  String get composerCommandNickDescription =>
      'เปลี่ยนชื่อเล่นของคุณในคอมมูนิตี้นี้';

  @override
  String get composerCommandKickDescription => 'เตะสมาชิกออกจากคอมมูนิตี้นี้';

  @override
  String get composerCommandBanDescription => 'แบนสมาชิกออกจากคอมมูนิตี้นี้';

  @override
  String get composerCommandMsgDescription => 'ส่งข้อความส่วนตัวถึงผู้ใช้';

  @override
  String get composerCommandSavedDescription => 'ส่งรายการสื่อที่บันทึกไว้';

  @override
  String get composerCommandStickerDescription => 'ส่งสติกเกอร์';

  @override
  String get composerCommandGifDescription => 'ค้นหาและส่ง GIF';

  @override
  String get composerCommandMemberOption => 'สมาชิกที่จะดำเนินการ';

  @override
  String get composerCommandReasonOption => 'เหตุผล (ไม่บังคับ)';

  @override
  String get composerCommandMessageOption => 'ข้อความที่จะส่ง';

  @override
  String get composerCommandQueryOption => 'สิ่งที่ต้องการค้นหา';

  @override
  String get composerCommandNicknameOption =>
      'ชื่อเล่นใหม่ของคุณ หรือเว้นว่างไว้เพื่อรีเซ็ต';

  @override
  String get composerCommandDeleteMessagesOption =>
      'จะลบประวัติข้อความล่าสุดของสมาชิกจำนวนเท่าใด';

  @override
  String get composerCommandDeleteMessagesNone => 'ไม่ลบข้อความใดๆ';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return '$count วันที่ผ่านมา';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '24 ชั่วโมงที่ผ่านมา';

  @override
  String get composerCommandOptionRequired => 'ตัวเลือกนี้จำเป็น โปรดระบุค่า';

  @override
  String get composerCommandClear => 'ล้างคำสั่ง';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'คุณเปลี่ยนชื่อเล่นในคอมมูนิตี้นี้จาก **$previousNickname** เป็น **$newNickname**';
  }

  @override
  String get composerCommandUnknownUser => 'ผู้ใช้ที่ไม่รู้จัก';

  @override
  String composerCommandMsgFailed(String username) {
    return 'ส่งข้อความถึง **$username** ไม่สำเร็จ พวกเขาอาจปิดใช้งานข้อความส่วนตัว หรือคุณอาจถูกบล็อก';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return '+$count เพิ่มเติม';
  }

  @override
  String get addGuildModalTitle => 'เพิ่มคอมมูนิตี้';

  @override
  String get addGuildModalLandingDescription =>
      'สร้างคอมมูนิตี้ใหม่หรือเข้าร่วมคอมมูนิตี้ที่มีอยู่';

  @override
  String get addGuildCreateCommunity => 'สร้างคอมมูนิตี้';

  @override
  String get addGuildJoinCommunity => 'เข้าร่วมคอมมูนิตี้';

  @override
  String get addGuildImportDiscordTemplate => 'นำเข้าเทมเพลต Discord';

  @override
  String get addGuildJoinTitle => 'เข้าร่วมคอมมูนิตี้';

  @override
  String get addGuildJoinDescription => 'ป้อนลิงก์เชิญเพื่อเข้าร่วมคอมมูนิตี้';

  @override
  String get addGuildInviteLinkLabel => 'ลิงก์เชิญ';

  @override
  String get addGuildJoinSubmit => 'เข้าร่วมคอมมูนิตี้';

  @override
  String get addGuildInviteInvalid => 'คำเชิญนี้ไม่ถูกต้องหรือไม่ถูกต้องแล้ว';

  @override
  String get addGuildJoinFailed => 'ไม่สามารถเข้าร่วมชุมชนได้ โปรดลองอีกครั้ง';

  @override
  String get addGuildCreateTitle => 'สร้างคอมมูนิตี้';

  @override
  String get addGuildCreateDescription =>
      'สร้างคอมมูนิตี้ให้คุณและเพื่อนๆ ได้แชทกัน';

  @override
  String get addGuildCreateNameLabel => 'ชื่อคอมมูนิตี้';

  @override
  String get addGuildCreateSubmit => 'สร้างคอมมูนิตี้';

  @override
  String get addGuildCreateFailed => 'ไม่สามารถสร้างชุมชนได้ โปรดลองอีกครั้ง';

  @override
  String get addGuildCreateClaimTitle => 'ยืนยันบัญชีของคุณ';

  @override
  String get addGuildCreateClaimDescription =>
      'คุณต้องยืนยันบัญชีก่อนจึงจะสร้างคอมมูนิตี้ได้';

  @override
  String get addGuildCreateVerifyTitle => 'ยืนยันอีเมลของคุณ';

  @override
  String get addGuildCreateVerifyDescription =>
      'คุณต้องยืนยันอีเมลก่อนจึงจะสร้างคอมมูนิตี้ได้';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'ไม่รองรับไอคอนแบบเคลื่อนไหวเมื่อสร้างคอมมูนิตี้ใหม่ ใช้ภาพนิ่งแทน';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'การสร้างคอมมูนิตี้แสดงว่าคุณตกลงที่จะปฏิบัติตามและยึดถือ ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'แนวทางปฏิบัติของชุมชน $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'อินสแตนซ์นี้มีชุมชนเดียว จึงไม่สามารถสร้างชุมชนเพิ่มเติมได้';

  @override
  String get addGuildCreateChangeIcon => 'เปลี่ยนไอคอน';

  @override
  String get addGuildCreateIconLabel => 'ไอคอนคอมมูนิตี้';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG ขนาดสูงสุด 10MB แนะนำ: 512×512px';

  @override
  String get addGuildImportDescription =>
      'วาง URL เทมเพลต Discord เพื่อนำเข้าโครงสร้างไปยังชุมชนใหม่';

  @override
  String get addGuildImportUrlLabel => 'URL เทมเพลต';

  @override
  String get addGuildImportUrlInvalid =>
      'กรุณากรอก URL หรือโค้ดเทมเพลต Discord ที่ถูกต้อง';

  @override
  String get addGuildImportFetchFailed =>
      'ไม่สามารถดึงเทมเพลตชุมชนได้ เทมเพลตอาจไม่มีอยู่ หรือบริการภายนอกไม่พร้อมใช้งาน';

  @override
  String get addGuildImportInvalidResponse =>
      'นี่ไม่ใช่เทมเพลตการตอบกลับที่ถูกต้อง';

  @override
  String get addGuildImportTemplateLabel => 'เทมเพลต';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return 'ข้อความ $textChannelCount ช่อง, เสียง $voiceChannelCount ช่อง, $categoryCount หมวดหมู่, $roleCount บทบาท';
  }

  @override
  String get addGuildImportRemoveIcon => 'ลบไอคอน';

  @override
  String get addGuildImportTemplateInvalid =>
      'ข้อมูลเทมเพลตชุมชนไม่ถูกต้องหรือไม่สมบูรณ์';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle => 'ลบรีแอ็กชันทั้งหมด';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบอิโมจิทั้งหมดออกจากข้อความนี้';

  @override
  String get chatMessagePinConfirm => 'ปักหมุด';

  @override
  String get chatMessagePinConfirmDescription =>
      'ปักหมุดข้อความนี้ในช่องเพื่อให้ทุกคนเห็น';

  @override
  String get chatMessageUnpinConfirmTitle => 'เลิกปักหมุดข้อความ';

  @override
  String get chatMessageUnpinConfirmDescription =>
      'ส่งรายการปักหมุดนี้ย้อนเวลากลับไปไหม';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username ปักหมุด $messageLink ไว้ในช่องนี้ ดู $allPinsLink';
  }

  @override
  String get systemPinMessageMessageLink => 'ข้อความ';

  @override
  String get systemPinMessageAllPinsLink => 'ข้อความที่ปักหมุดทั้งหมด';

  @override
  String get channelPinsEmptyTitle => 'ไม่มีข้อความปักหมุด';

  @override
  String get channelPinsEmptyDescription => 'ข้อความที่ปักหมุดจะแสดงที่นี่';

  @override
  String get channelDetailsFallbackTitle => 'รายละเอียด';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'กลุ่ม DM · สมาชิก $count คน';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'ปิดการสนทนากับ $name หรือไม่?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'ออกจาก $name ไหม';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'การตั้งค่าช่อง';

  @override
  String get channelDetailsGroupSettingsTitle => 'ตั้งค่ากลุ่ม';

  @override
  String get channelDetailsDmSettingsTitle => 'การตั้งค่าข้อความส่วนตัว';

  @override
  String get channelDetailsInvitePeople => 'เชิญผู้คน';

  @override
  String get channelDetailsCopyLink => 'คัดลอกลิงก์';

  @override
  String get channelMenuCopyChannelLink => 'คัดลอกลิงก์ช่อง';

  @override
  String get channelMenuCopyRedirectLink => 'คัดลอกลิงก์เปลี่ยนเส้นทาง';

  @override
  String get channelDetailsAddFriendsToGroup => 'เพิ่มเพื่อนเข้ากลุ่ม';

  @override
  String get channelDetailsGroupInvites => 'คำเชิญกลุ่ม';

  @override
  String get channelDetailsEditChannel => 'แก้ไขช่อง';

  @override
  String get channelDetailsDeleteChannel => 'ลบช่อง';

  @override
  String get channelSettingsEditCategory => 'แก้ไขหมวดหมู่';

  @override
  String get channelSettingsTabOverview => 'ภาพรวม';

  @override
  String get channelSettingsTabPermissions => 'สิทธิ์';

  @override
  String get channelSettingsTabInvites => 'คำเชิญ';

  @override
  String get channelSettingsTabWebhooks => 'Webhook';

  @override
  String get channelSettingsDeleteChannel => 'ลบช่อง';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $channelName นี้? การดำเนินการนี้ไม่สามารถย้อนกลับได้';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $categoryName การดำเนินการนี้จะไม่สามารถย้อนกลับได้';
  }

  @override
  String get channelSettingsDeleteCategory => 'ลบหมวดหมู่';

  @override
  String get channelSettingsChannelUpdated => 'อัปเดตช่องแล้ว';

  @override
  String get channelSettingsChannelName => 'ชื่อช่อง';

  @override
  String get channelSettingsCategoryName => 'ชื่อหมวดหมู่';

  @override
  String get channelSettingsMyCategory => 'หมวดหมู่ของฉัน';

  @override
  String get categoryExpandCategory => 'ขยายหมวดหมู่';

  @override
  String get categoryCollapseCategory => 'ยุบหมวดหมู่';

  @override
  String get categoryExpandAllCategories => 'ขยายหมวดหมู่ทั้งหมด';

  @override
  String get categoryCollapseAllCategories => 'ยุบหมวดหมู่ทั้งหมด';

  @override
  String get categoryMuteCategory => 'ปิดเสียงหมวดหมู่นี้';

  @override
  String get categoryUnmuteCategory => 'เลิกปิดเสียงหมวดหมู่';

  @override
  String get categoryCopyCategoryId => 'คัดลอก ID หมวดหมู่';

  @override
  String get categoryIdCopied => 'คัดลอก ID หมวดหมู่แล้ว';

  @override
  String get channelSettingsChannelNamePlaceholder => 'ทั่วไป';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'หัวข้อ';

  @override
  String get channelSettingsTopicPlaceholder => 'เพิ่มหัวข้อในช่องนี้';

  @override
  String get channelSettingsInsertEmoji => 'แทรกอิโมจิ';

  @override
  String get channelSettingsTopicTooLongTitle => 'หัวข้อช่องยาวเกินไป';

  @override
  String get channelSettingsTopicTooLongMessage => 'ย่อหัวข้อแล้วลองอีกครั้ง';

  @override
  String get channelSettingsSlowmode => 'โหมดจำกัดเวลา';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'รอระหว่างข้อความ \"$bypassSlowmodePermissionLabel\" สามารถข้ามได้';
  }

  @override
  String get channelSettingsSlowmodeOff => 'ปิด';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds วินาที';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes นาที';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours ชั่วโมง';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute นาที';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour ชั่วโมง';
  }

  @override
  String get channelSettingsVoiceQuality => 'คุณภาพเสียง';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'บิตเรตที่สูงขึ้น = คุณภาพดีขึ้นและใช้แบนด์วิธมากขึ้น';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'จำกัดจำนวนผู้เข้าร่วม';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'จำนวนสมาชิกสูงสุดที่เข้าร่วมได้พร้อมกัน 0 หมายถึงไม่จำกัด';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ผู้เข้าร่วม',
      one: '1 ผู้เข้าร่วม',
      zero: '∞ ไม่จำกัด',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'ขีดจำกัดการเชื่อมต่อ';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'จำนวนการเชื่อมต่อสูงสุดที่สมาชิกหนึ่งคนสามารถใช้งานได้ในช่องนี้';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count การเชื่อมต่อ',
      one: '1 การเชื่อมต่อ',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'ภูมิภาคเสียง';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'เลือกภูมิภาคเสียงสำหรับช่องนี้ ภูมิภาคอัตโนมัติจะใช้ภูมิภาคที่ใกล้ที่สุด';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'อัตโนมัติ';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'ไม่สามารถโหลดภูมิภาคเสียงได้';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'ลองอีกครั้งในอีกสักครู่';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'เปลี่ยนการตั้งค่าระดับ $scopeLevel สำหรับช่องนี้ เนื้อหาสำหรับผู้ใหญ่จะแสดงหลังประตูทางเข้า';
  }

  @override
  String get channelSettingsMatureContentInherit => 'สืบทอด';

  @override
  String get channelSettingsMatureContentOn => 'เปิด';

  @override
  String get channelSettingsMatureContentOff => 'ปิด';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'ตั้งค่าช่องนี้สำหรับเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'เปิดช่องทางนี้ให้แสดงเนื้อหาสำหรับผู้ใหญ่ได้';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'สืบทอดมาจาก $inheritedSourceLabel: เปิด';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'สืบทอดมาจาก $inheritedSourceLabel: ปิด';
  }

  @override
  String get channelSettingsMatureContentCategoryScope => 'หมวดหมู่';

  @override
  String get channelSettingsMatureContentCommunityScope => 'คอมมูนิตี้';

  @override
  String get channelSettingsContentWarningToggle =>
      'แสดงคำเตือนเนื้อหาในช่องนี้';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'เปิดการแจ้งเตือนเพื่อขอความยินยอมก่อนเข้าสู่แชนเนลนี้';

  @override
  String get channelSettingsContentWarningText => 'ข้อความเตือนที่กำหนดเอง';

  @override
  String get channelSettingsContentWarningDefault => 'มีเนื้อหาที่ละเอียดอ่อน';

  @override
  String get channelSettingsUnknownRole => 'บทบาทที่ไม่รู้จัก';

  @override
  String get channelSettingsUnknownUser => 'ผู้ใช้ที่ไม่รู้จัก';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'การตั้งค่าการเข้าถึง';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'แก้ไขสิทธิ์สำหรับ $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'กลับไปที่การตั้งค่าสิทธิ์';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'ตั้งค่าการเข้าถึงพื้นฐานสำหรับช่องนี้';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'กำหนดการตั้งค่าเฉพาะสำหรับบทบาทนี้';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'กำหนดการตั้งค่าเฉพาะสำหรับสมาชิกนี้';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'ค้นหาสิทธิ์…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'อัปเดตการเข้าถึงช่องแล้ว';

  @override
  String get channelSettingsPermissionsTitle => 'การควบคุมการเข้าถึง';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'ช่องนี้ซิงค์กับหมวดหมู่หลัก ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'ช่องนี้ไม่ได้ซิงค์กับหมวดหมู่หลัก ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory => 'ซิงค์กับหมวดหมู่';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'ช่องซิงค์กับหมวดหมู่หลักแล้ว';

  @override
  String get channelSettingsPermissionsAddOverride => 'เพิ่มการตั้งค่าเฉพาะ';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'ค้นหาบทบาทหรือสมาชิก…';

  @override
  String get channelSettingsDeleteInvite => 'ลบคำเชิญ';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'ลบคำเชิญนี้ใช่หรือไม่ การดำเนินการนี้จะยกเลิกไม่ได้';

  @override
  String get channelSettingsCopyInviteCode => 'คัดลอกรหัสเชิญ';

  @override
  String get channelSettingsCopyInviteUrl => 'คัดลอก URL คำเชิญ';

  @override
  String get channelSettingsWebhookCreated => 'สร้าง webhook แล้ว';

  @override
  String get channelSettingsWebhookCreateFailed => 'สร้าง webhook ไม่สำเร็จ';

  @override
  String get channelSettingsCreateWebhook => 'สร้าง webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'จัดการลิงก์เชิญสำหรับช่องนี้';

  @override
  String get channelSettingsInvitesCreate => 'สร้างคำเชิญ';

  @override
  String get channelSettingsInvitesEmpty => 'ไม่มีลิงก์เชิญ';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'ช่องนี้ยังไม่มีลิงก์เชิญ สร้างลิงก์เพื่อเชิญผู้คนมาที่ช่องนี้';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'เกิดข้อผิดพลาดในการโหลดลิงก์เชิญสำหรับช่องนี้ ลองอีกครั้ง';

  @override
  String get channelSettingsWebhooksDescription =>
      'จัดการ webhook ขาเข้าที่สามารถโพสต์ข้อความในช่องนี้ได้';

  @override
  String get channelSettingsWebhooksEmpty => 'ไม่มี webhook';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'ยังไม่มีการตั้งค่า webhook สำหรับช่องนี้ สร้าง webhook เพื่อให้แอปพลิเคชันภายนอกสามารถโพสต์ข้อความได้';

  @override
  String get channelSettingsWebhooksUnsupported => 'ช่องนี้ไม่รองรับ webhook';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'คุณต้องมีสิทธิ์ \"$permission\" เพื่อดูและแก้ไขเว็บฮุกสำหรับช่องนี้';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'โหลด webhook ไม่สำเร็จ';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'เกิดข้อผิดพลาดในการโหลด webhook สำหรับช่องนี้ ลองอีกครั้ง';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'สร้างโดย $creator เมื่อ $date';
  }

  @override
  String get channelSettingsWebhooksAvatar => 'รูปโปรไฟล์';

  @override
  String get channelSettingsWebhooksUploadImage => 'อัปโหลดรูปภาพ';

  @override
  String get channelSettingsWebhooksRemove => 'ลบ';

  @override
  String get channelSettingsWebhooksName => 'ชื่อ';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'ชื่อ webhook';

  @override
  String get channelSettingsWebhooksChannel => 'ช่อง';

  @override
  String get channelSettingsWebhooksUrl => 'URL ของ webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'คัดลอก URL ของ webhook';

  @override
  String get channelSettingsWebhooksDelete => 'ลบ webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed =>
      'ไม่สามารถลบ webhook นี้ได้';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'ลบ webhook นี้หรือไม่? การดำเนินการนี้ไม่สามารถยกเลิกได้';

  @override
  String get channelSettingsWebhookTryAgainInAMoment =>
      'ลองอีกครั้งในอีกสักครู่';

  @override
  String get channelMenuOpenChat => 'เปิดแชท';

  @override
  String get channelMenuDuplicateChannel => 'ทำซ้ำช่อง';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'รีเซ็ตสถานะข้อตกลงเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'ลบข้อความของคุณในช่องนี้ใช่หรือไม่';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'ข้อความทั้งหมดที่คุณเคยส่งในช่องนี้จะถูกลบอย่างถาวร การดำเนินการนี้ไม่สามารถเลิกทำได้';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'ลบข้อความของฉัน';

  @override
  String get channelMenuDeletedYourMessages => 'ลบข้อความของคุณแล้ว';

  @override
  String get channelMenuCouldNotDeleteYourMessages => 'ลบข้อความของคุณไม่ได้';

  @override
  String get channelDetailsSystemMessage => 'ข้อความระบบ';

  @override
  String get channelDetailsTextChannel => 'ช่องข้อความ';

  @override
  String get channelDetailsVoiceChannel => 'ช่องเสียง';

  @override
  String get channelDetailsCategory => 'หมวดหมู่';

  @override
  String get channelDetailsLinkChannel => 'ลิงก์ช่อง';

  @override
  String get channelDetailsGenericChannel => 'ช่อง';

  @override
  String get channelDetailsMutedConversation => 'ปิดเสียงการสนทนา';

  @override
  String get channelDetailsUnmutedConversation => 'ยกเลิกการปิดเสียงการสนทนา';

  @override
  String get channelDetailsMutedChannel => 'ปิดเสียงช่อง';

  @override
  String get channelDetailsUnmutedChannel => 'ยกเลิกการปิดเสียงช่อง';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'อัปเดตการตั้งค่าการแจ้งเตือนแล้ว';

  @override
  String get channelDetailsTabMembers => 'สมาชิก';

  @override
  String get channelDetailsTabPins => 'ข้อความปักหมุด';

  @override
  String get channelDetailsActionMute => 'ปิดเสียง';

  @override
  String get channelDetailsActionUnmute => 'ยกเลิกปิดเสียง';

  @override
  String get channelDetailsActionSearch => 'ค้นหา';

  @override
  String get channelDetailsActionMore => 'เพิ่มเติม';

  @override
  String get channelDetailsMembersEmptyTitle => 'ไม่มีสมาชิกให้แสดง';

  @override
  String get channelDetailsMembersEmptyBody =>
      'สมาชิกจะปรากฏที่นี่เมื่อข้อมูลชุมชนโหลดเสร็จแล้ว';

  @override
  String get memberListPermissionDeniedTitle =>
      'คุณไม่สามารถดูรายชื่อสมาชิกได้';

  @override
  String get memberListPermissionDeniedBody =>
      'คุณไม่สามารถดูสมาชิกของช่องนี้ในคอมมูนิตี้นี้ได้';

  @override
  String get memberListUnavailableTitle => 'ไม่สามารถดูรายชื่อสมาชิกได้';

  @override
  String get memberListUnavailableBody =>
      'ขณะนี้ยังไม่สามารถดูรายชื่อสมาชิกในคอมมูนิตี้นี้ได้';

  @override
  String get channelDetailsPinsLoadFailedTitle => 'ไม่สามารถโหลดหมุดได้';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'สมาชิกที่มีสิทธิ์ \"ปักหมุดข้อความ\" สามารถปักหมุดข้อความเพื่อให้ทุกคนเห็นได้';

  @override
  String get channelDetailsPinsDmEndHint =>
      'คุณสามารถปักหมุดข้อความในบทสนทนานี้เพื่อให้ทุกคนเห็นได้';

  @override
  String get channelDetailsPinsEndReached => 'คุณดูจนหมดแล้ว';

  @override
  String get channelHeaderPinnedMessages => 'ข้อความปักหมุด';

  @override
  String get channelHeaderPinnedMessagesUnread =>
      'ข้อความปักหมุด, ที่ยังไม่ได้อ่าน';

  @override
  String get channelHeaderMemberList => 'รายชื่อสมาชิก';

  @override
  String get channelHeaderInbox => 'กล่องข้อความ';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'การตั้งค่าการแจ้งเตือน, ปิดเสียง';

  @override
  String get channelDetailsSearchTitle => 'ค้นหา';

  @override
  String get channelDetailsSearchHint => 'ค้นหาข้อความ';

  @override
  String get channelDetailsSearchFilterFrom => 'จาก';

  @override
  String get channelDetailsSearchFilterHas => 'มี';

  @override
  String get channelDetailsSearchFilterIn => 'ใน';

  @override
  String get channelDetailsSearchFilterMentions => 'การกล่าวถึง';

  @override
  String get channelDetailsSearchFilterMore => 'เพิ่มเติม';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'ใช้งานอยู่';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count ช่อง';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count ผู้ใช้';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'ผู้ใช้';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'บอท';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'กรองตามช่อง';

  @override
  String get channelDetailsSearchChannelsHint => 'ค้นหาช่อง';

  @override
  String get channelDetailsSearchChannelsEmpty => 'ไม่พบช่อง';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'ปักหมุด';

  @override
  String get channelDetailsSearchPinnedTrue => 'ปักหมุดเท่านั้น';

  @override
  String get channelDetailsSearchPinnedFalse => 'ไม่รวมรายการปักหมุด';

  @override
  String get channelDetailsSearchClearFilter => 'ล้าง';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'ประเภทผู้เขียน';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'วันที่';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'โหมดวันที่';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'เลือกวันที่';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'ลิงก์โฮสต์';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'ชื่อไฟล์มีคำว่า';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'นามสกุลไฟล์';

  @override
  String get channelDetailsSearchContentPoll => 'โพล';

  @override
  String get channelDetailsSearchContentPollDescription => 'ข้อความที่มีโพล';

  @override
  String get channelDetailsSearchContentForward => 'ส่งต่อ';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'ข้อความที่ส่งต่อ';

  @override
  String get channelDetailsSearchFilterSort => 'จัดเรียง';

  @override
  String get channelHeaderSearchFiltersTitle => 'ตัวกรองการค้นหา';

  @override
  String get channelHeaderSearchRecentTitle => 'การค้นหาล่าสุด';

  @override
  String get channelHeaderSearchUsersTitle => 'ผู้ใช้';

  @override
  String get channelHeaderSearchChannelsTitle => 'ช่อง';

  @override
  String get channelHeaderSearchValuesTitle => 'ค่า';

  @override
  String get channelHeaderSearchDatesTitle => 'วันที่';

  @override
  String get channelHeaderSearchDefaultBadge => 'ค่าเริ่มต้น';

  @override
  String get channelHeaderSearchClearHistory => 'ล้าง';

  @override
  String get channelHeaderSearchFilterDescFrom => 'ผู้ใช้';

  @override
  String get channelHeaderSearchFilterDescMentions => 'ผู้ใช้';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'ลิงก์, ไฟล์แนบ, รูปภาพ, วิดีโอ, เสียง, ไฟล์, สติกเกอร์, …';

  @override
  String get channelHeaderSearchFilterDescBefore => 'วันที่หรือช่วงวันที่';

  @override
  String get channelHeaderSearchFilterDescOn => 'วันที่หรือช่วงวันที่';

  @override
  String get channelHeaderSearchFilterDescDuring => 'วันที่หรือช่วงวันที่';

  @override
  String get channelHeaderSearchFilterDescAfter => 'วันที่หรือช่วงวันที่';

  @override
  String get channelHeaderSearchFilterDescIn => 'ช่อง';

  @override
  String get channelHeaderSearchFilterDescPinned => 'จริงหรือไม่จริง';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'ผู้ใช้, บอท หรือเว็บฮุค';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'โฮสต์เนม เช่น example.com';

  @override
  String get channelHeaderSearchFilterDescFileName => 'ส่วนหนึ่งของชื่อไฟล์แนบ';

  @override
  String get channelHeaderSearchFilterDescFileType => 'นามสกุลไฟล์ เช่น png';

  @override
  String get channelHeaderSearchFilterDescSort =>
      'เวลาที่โพสต์ หรือ ความเกี่ยวข้อง';

  @override
  String get channelHeaderSearchFilterDescOrder =>
      'จากน้อยไปมาก หรือ จากมากไปน้อย';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString ผลลัพธ์',
      one: '1 ผลลัพธ์',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'กรองตามผู้ใช้';

  @override
  String get channelDetailsSearchFilterByContent => 'กรองตามเนื้อหา';

  @override
  String get channelDetailsSearchSortBy => 'เรียงผลลัพธ์ตาม';

  @override
  String get channelDetailsSearchIn => 'ค้นหาใน';

  @override
  String get channelDetailsSearchEmptyTitle => 'ค้นหาในบทสนทนานี้';

  @override
  String get channelDetailsSearchEmptyBody =>
      'พิมพ์ข้อความ ผู้เขียน หรือตัวกรองเนื้อหาเพื่อค้นหาข้อความ';

  @override
  String get channelDetailsSearchIndexingTitle => 'กำลังจัดทำดัชนีข้อความ';

  @override
  String get channelDetailsSearchIndexingBody =>
      'ลองใหม่อีกครั้งในไม่ช้าเมื่อการค้นหาเสร็จสิ้นการจัดทำดัชนีขอบเขตนี้';

  @override
  String get channelDetailsSearchNoResultsTitle => 'ไม่พบผลลัพธ์';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'ลองใช้คำค้นหาหรือตัวกรองอื่น';

  @override
  String get channelDetailsMembersOnline => 'ออนไลน์';

  @override
  String get channelDetailsMembersOffline => 'ออฟไลน์';

  @override
  String get channelDetailsMemberYou => 'คุณ';

  @override
  String get channelDetailsSearchUsersHint => 'ค้นหาผู้ใช้';

  @override
  String get channelDetailsSearchUsersTypeToSearch => 'พิมพ์เพื่อค้นหาสมาชิก';

  @override
  String get channelDetailsSearchUsersEmpty => 'ไม่พบผู้ใช้';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'ไม่มีผู้ใช้ให้เลือก';

  @override
  String get channelDetailsDone => 'เสร็จสิ้น';

  @override
  String get channelDetailsHasFilterPrompt => 'แสดงข้อความที่มี:';

  @override
  String get channelDetailsRetry => 'ลองอีกครั้ง';

  @override
  String get channelDetailsPinnedMessageTitle => 'ข้อความปักหมุด';

  @override
  String get channelDetailsSearchResultTitle => 'ผลการค้นหา';

  @override
  String get channelDetailsJumpToMessage => 'ไปยังข้อความ';

  @override
  String get channelDetailsUnpinMessage => 'เลิกปักหมุดข้อความ';

  @override
  String get channelDetailsCopyMessageLink => 'คัดลอกลิงก์ข้อความ';

  @override
  String get channelDetailsCopyMessageId => 'คัดลอก ID ข้อความ';

  @override
  String get channelDetailsMessageUnpinned => 'เลิกปักหมุดข้อความแล้ว';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'คอมมูนิตี้ปัจจุบัน';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'ข้อความส่วนตัวปัจจุบัน';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'ทุกคอมมูนิตี้';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'เฉพาะข้อความส่วนตัว';

  @override
  String get channelDetailsSearchScopeAllDms => 'ข้อความส่วนตัวทั้งหมด';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild =>
      'เฉพาะข้อความส่วนตัวที่เปิดอยู่';

  @override
  String get channelDetailsSearchScopeOpenDms => 'ข้อความส่วนตัวที่เปิดอยู่';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'ข้อความส่วนตัวทั้งหมด + คอมมูนิตี้';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'ข้อความส่วนตัวที่เปิดอยู่ + คอมมูนิตี้';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'ค้นหาเฉพาะในคอมมูนิตี้ปัจจุบัน';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'ค้นหาเฉพาะในข้อความส่วนตัวปัจจุบัน';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'ในทุกชุมชนที่คุณอยู่';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'เฉพาะข้อความส่วนตัวทั้งหมดที่คุณเคยเข้าร่วม';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'ในข้อความส่วนตัวทั้งหมดที่คุณเคยเข้าร่วม';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'ในข้อความส่วนตัวทั้งหมดที่คุณเปิดอยู่เท่านั้น';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'ใน DM ทั้งหมดที่คุณเปิดอยู่';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'ในทุกข้อความส่วนตัวที่คุณเคยมี + ทุกชุมชนที่คุณอยู่ในปัจจุบัน';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'ใน DM ทั้งหมดที่คุณเปิดอยู่ + ในทุกชุมชนที่คุณเป็นสมาชิก';

  @override
  String get channelDetailsSearchSortNewest => 'ใหม่สุดขึ้นก่อน';

  @override
  String get channelDetailsSearchSortOldest => 'เก่าสุดขึ้นก่อน';

  @override
  String get channelDetailsSearchSortRelevance => 'เกี่ยวข้องมากที่สุด';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'แสดงข้อความล่าสุดก่อน';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'แสดงข้อความเก่าสุดก่อน';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'แสดงข้อความที่เกี่ยวข้องมากที่สุดก่อน';

  @override
  String get channelDetailsSearchContentImage => 'อัปโหลดรูปภาพ';

  @override
  String get channelDetailsSearchContentVideo => 'อัปโหลดวิดีโอ';

  @override
  String get channelDetailsSearchContentAudio => 'อัปโหลดเสียง';

  @override
  String get channelDetailsSearchContentFile => 'อัปโหลดไฟล์';

  @override
  String get channelDetailsSearchContentLink => 'ลิงก์';

  @override
  String get channelDetailsSearchContentEmbed =>
      'ตัวอย่างลิงก์หรือเนื้อหาที่ฝัง';

  @override
  String get channelDetailsSearchContentSticker => 'สติกเกอร์';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'เฉพาะไฟล์รูปภาพที่อัปโหลด';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'เฉพาะไฟล์วิดีโอที่อัปโหลด';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'เฉพาะไฟล์เสียงที่อัปโหลด';

  @override
  String get channelDetailsSearchContentFileDescription => 'ไฟล์แนบที่อัปโหลด';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'URL ที่พิมพ์ไว้ในเนื้อหาข้อความ';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'ตัวอย่างลิงก์ที่ดึงมาแล้วและการฝังเนื้อหาแบบสมบูรณ์ ไม่ใช่ไฟล์ที่อัปโหลด';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'สติกเกอร์ที่แนบกับข้อความ';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count ประเภท';
  }

  @override
  String get personalNotesTitle => 'บันทึกส่วนตัว';

  @override
  String get personalNotesSubtitle =>
      'พื้นที่ส่วนตัวสำหรับจดความคิดและสิ่งที่ต้องจำ';

  @override
  String groupDmWelcome(String displayName) {
    return 'ยินดีต้อนรับสู่ $displayName เพิ่มเพื่อนเพื่อเริ่มกลุ่มกันเลย';
  }

  @override
  String get groupDmWelcomeEditGroup => 'แก้ไขกลุ่ม';

  @override
  String get groupDmWelcomeAddFriends => 'เพิ่มเพื่อนเข้ากลุ่ม';

  @override
  String get dmGroupInvites => 'คำเชิญ';

  @override
  String get groupDmEditTitle => 'แก้ไขกลุ่ม';

  @override
  String get groupDmGroupName => 'ชื่อกลุ่ม';

  @override
  String get groupDmMyGroup => 'กลุ่มของฉัน';

  @override
  String get groupDmGroupNameMaxLength => 'ชื่อกลุ่มต้องไม่เกิน 100 ตัวอักษร';

  @override
  String get groupDmGroupIcon => 'ไอคอนกลุ่ม';

  @override
  String get groupDmUploadIcon => 'อัปโหลดไอคอน';

  @override
  String get groupDmChangeIcon => 'เปลี่ยนไอคอน';

  @override
  String get groupDmRemoveIcon => 'ลบไอคอน';

  @override
  String get groupDmUpdated => 'อัปเดตกลุ่มแล้ว';

  @override
  String get groupDmUpdateFailed => 'อัปเดตกลุ่มไม่สำเร็จ ลองอีกครั้ง';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'ไม่รองรับไอคอนแบบเคลื่อนไหว ใช้ภาพนิ่งแทน';

  @override
  String get groupDmAnimatedIconNotSupportedTitle => 'ไม่รองรับไอคอนเคลื่อนไหว';

  @override
  String get groupDmIconFileTooLargeTitle => 'ไฟล์ไอคอนมีขนาดใหญ่เกินไป';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'ไฟล์ไอคอนใหญ่เกินไป เลือกไฟล์ที่มีขนาดเล็กกว่า $maxSize';
  }

  @override
  String get groupDmUnsupportedIconFormat => 'รูปแบบไอคอนที่ไม่รองรับ';

  @override
  String get groupDmUnsupportedIconFormatBody => 'ไม่รองรับประเภทไฟล์นี้';

  @override
  String get groupDmInvalidImage => 'รูปภาพไม่ถูกต้อง';

  @override
  String get groupDmInvalidImageBody => 'รูปภาพนี้ไม่ถูกต้อง ลองใช้รูปอื่น';

  @override
  String get groupDmAddFriends => 'เพิ่ม';

  @override
  String get groupDmOrSendInvite => 'หรือส่งคำเชิญให้เพื่อน:';

  @override
  String get groupDmGenerateInviteLink => 'สร้างลิงก์เชิญ';

  @override
  String get groupDmCreateInvite => 'สร้าง';

  @override
  String get groupDmInviteExpires24Hours => 'คำเชิญจะหมดอายุใน 24 ชั่วโมง';

  @override
  String get groupDmAddFriendFailed =>
      'เพิ่มเพื่อนคนนี้เข้ากลุ่มไม่ได้ โปรดลองอีกครั้ง';

  @override
  String get groupDmGroupFull =>
      'กลุ่มนี้เต็มแล้ว นำสมาชิกบางคนออกก่อนจึงจะเพิ่มคนอื่นได้';

  @override
  String get groupDmRateLimited =>
      'คุณกำลังดำเนินการเร็วเกินไป โปรดรอสักครู่แล้วลองอีกครั้ง';

  @override
  String get groupDmCreateInviteFailedBody =>
      'สร้างลิงก์เชิญไม่ได้ โปรดลองอีกครั้ง';

  @override
  String get guildNavbarCreateInviteFailed =>
      'สร้างลิงก์เชิญไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'คุณไม่มีสิทธิ์สร้างคำเชิญในช่องนี้';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'ชุมชนนี้ถึงขีดจำกัดการเชิญแล้ว';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'การสร้างคำเชิญถูกปิดใช้งานชั่วคราวสำหรับชุมชนนี้';

  @override
  String get groupDmCopyInviteFailed => 'คัดลอกลิงก์เชิญไม่สำเร็จ';

  @override
  String get groupDmInvitesOwnerOnly =>
      'เฉพาะเจ้าของกลุ่มเท่านั้นที่จัดการคำเชิญได้';

  @override
  String get groupDmNoInvitesCreated => 'ยังไม่มีคำเชิญ';

  @override
  String get groupDmLoadingInvites => 'กำลังโหลดคำเชิญ...';

  @override
  String get groupDmInvitesLoadFailed => 'โหลดคำเชิญไม่สำเร็จ ลองอีกครั้ง';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'เพิกถอนคำเชิญนี้ใช่ไหม การดำเนินการนี้จะย้อนกลับไม่ได้';

  @override
  String get groupDmInviteRevoked => 'ยกเลิกคำเชิญแล้ว';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'สร้างโดย $name หมดอายุใน $time';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'ยินดีต้อนรับสู่ $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'ในตอนแรก ไม่มีอะไรเลย จากนั้นก็มี $channelName และมันก็ดี';
  }

  @override
  String get personalNotesComposerHint => 'ส่งข้อความถึงตัวเอง';

  @override
  String channelComposerHint(String channelName) {
    return 'ส่งข้อความไปยัง #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'ส่งข้อความไปยัง @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'ส่งข้อความไปยัง $groupName';
  }

  @override
  String get groupDmComposerHint => 'กลุ่มข้อความ';

  @override
  String get composerHint => 'Message';

  @override
  String get composerOpenExpressionPicker => 'เปิดตัวเลือกอิโมจิ';

  @override
  String get composerShowKeyboard => 'แสดงแป้นพิมพ์';

  @override
  String get composerCloseAttachmentPanel => 'ปิดตัวเลือกไฟล์แนบ';

  @override
  String get chatAttachmentPanelPhotos => 'รูปภาพ';

  @override
  String get chatAttachmentPanelFiles => 'ไฟล์';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'จำเป็นต้องเข้าถึงคลังรูปภาพ';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'อนุญาตให้เข้าถึงคลังรูปภาพเพื่อเรียกดูและแนบรูปภาพและวิดีโอล่าสุด';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'เปิดการตั้งค่า';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', กำลังส่ง';

  @override
  String get messageAccessibilityFailedSuffix => ', ส่งไม่สำเร็จ';

  @override
  String get messageAccessibilityAttachmentSummary => 'ไฟล์แนบ';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return 'ไฟล์แนบ $count รายการ';
  }

  @override
  String get messageAccessibilityImageSummary => 'รูปภาพ';

  @override
  String get messageAccessibilityVideoSummary => 'วิดีโอ';

  @override
  String get messageAccessibilityAudioSummary => 'ไฟล์เสียง';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'สติกเกอร์ $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'ไฟล์ $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'ไฟล์แนบที่ถูกซ่อน';

  @override
  String get messageAccessibilityEmbedSummary => 'การฝัง';

  @override
  String get messageAccessibilityEmptySummary => 'ข้อความ';

  @override
  String get personalNotesPrivateSpace => 'พื้นที่ส่วนตัวของคุณ';

  @override
  String get purgePersonalNotes => 'ล้างบันทึกส่วนตัว';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'การดำเนินการนี้จะลบข้อความและไฟล์แนบทั้งหมดในบันทึกส่วนตัวของคุณอย่างถาวร ซึ่งไม่สามารถยกเลิกได้';

  @override
  String get purgePersonalNotesConfirmButton => 'ล้าง';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'ล้างข้อความ $count รายการออกจากบันทึกส่วนตัวแล้ว';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'บันทึกส่วนตัวว่างเปล่าอยู่แล้ว';

  @override
  String get purgePersonalNotesFailed => 'ไม่สามารถล้างบันทึกส่วนตัวได้';

  @override
  String get userSettingsGroupYourAccount => 'บัญชีของคุณ';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'ค้นหาการตั้งค่า...';

  @override
  String get userSettingsSearchClear => 'ล้างการค้นหา';

  @override
  String get userSettingsSearchNoResults => 'ไม่พบการตั้งค่า';

  @override
  String get userSettingsCopyLinkToSection => 'Copy link to section';

  @override
  String get userSettingsCopyLinkToPage => 'Copy link to page';

  @override
  String get userSettingsNavProfile => 'โปรไฟล์';

  @override
  String get userSettingsNavSecurityLogin => 'ความปลอดภัยและการเข้าสู่ระบบ';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'ของขวัญ';

  @override
  String get giftSettingsClaimAccountTitle => 'ยืนยันบัญชีของคุณ';

  @override
  String get giftSettingsClaimAccountDescription =>
      'ยืนยันบัญชีของคุณเพื่อรับหรือจัดการรหัสของขวัญ Plutonium';

  @override
  String get giftSettingsRedeemTitle => 'แลกของขวัญ';

  @override
  String get giftSettingsRedeemDescription =>
      'กรอกรหัสของขวัญเพื่อรับ Plutonium สำหรับบัญชีของคุณ';

  @override
  String get giftSettingsRedeemPlaceholder => 'ป้อนรหัสของขวัญ…';

  @override
  String get giftSettingsRedeemButton => 'แลก';

  @override
  String get giftSettingsRedeemSuccess =>
      'แลกรับของขวัญสำเร็จแล้ว ขอให้สนุกกับ Plutonium นะ';

  @override
  String get giftSettingsPurchasedTitle => 'ของขวัญที่ซื้อแล้ว';

  @override
  String get giftSettingsPurchasedDescription =>
      'จัดการโค้ดของขวัญ Plutonium ที่คุณซื้อไปแล้ว แชร์ลิงก์ของขวัญให้คนพิเศษ หรือแลกรับด้วยตัวเอง!';

  @override
  String get giftSettingsEmptyTitle => 'ยังไม่มีของขวัญ';

  @override
  String get giftSettingsEmptyDescription =>
      'ซื้อของขวัญ Plutonium จากแท็บ Plutonium เพื่อแชร์กับเพื่อนๆ';

  @override
  String get giftSettingsGoToPlutonium => 'ไปที่ Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'โหลดคลังของขวัญไม่สำเร็จ';

  @override
  String get giftSettingsLoadFailedDescription => 'ลองอีกครั้งในภายหลัง';

  @override
  String get giftSettingsTryAgain => 'ลองอีกครั้ง';

  @override
  String get giftSettingsGiftUrl => 'ลิงก์ของขวัญ';

  @override
  String get giftSettingsCopy => 'คัดลอก';

  @override
  String get giftSettingsCopied => 'คัดลอกแล้ว';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'ซื้อเมื่อ $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'แลกรับแล้ว $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'รับโดย $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'แลกของขวัญนี้แล้ว';

  @override
  String get giftSettingsRedeemForYourself => 'แลกให้ตัวเอง';

  @override
  String get giftSettingsShareWithFriend => 'แชร์ให้เพื่อน';

  @override
  String get premiumPlutoniumTagline =>
      'ปลดล็อกขีดจำกัดที่สูงขึ้นและฟีเจอร์พิเศษ พร้อมสนับสนุนแพลตฟอร์มการสื่อสารอิสระ';

  @override
  String get premiumPurchaseMode => 'โหมดการซื้อ';

  @override
  String get premiumForMe => 'สำหรับฉัน';

  @override
  String get premiumAsAGift => 'เป็นของขวัญ';

  @override
  String get premiumMonthly => 'รายเดือน';

  @override
  String get premiumYearly => 'รายปี';

  @override
  String get premiumPerMonth => '/ เดือน';

  @override
  String get premiumPerYear => '/ ปี';

  @override
  String get premiumOneTimePurchase => 'ซื้อครั้งเดียว';

  @override
  String get premiumSave17 => 'ประหยัด 17%';

  @override
  String get premiumUpgradeNow => 'อัปเกรดเลย';

  @override
  String get premiumBuyGift => 'ซื้อของขวัญ';

  @override
  String get premiumOneYearGift => 'ของขวัญ 1 ปี';

  @override
  String get premiumOneMonthGift => 'ของขวัญ 1 เดือน';

  @override
  String get premiumScrollPrompt =>
      'เลื่อนลงเพื่อดูสิทธิประโยชน์ทั้งหมดที่มีให้สำหรับ Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'ฟรีเทียบกับ Plutonium';

  @override
  String get premiumFreeColumn => 'ฟรี';

  @override
  String get premiumGiftSectionTitle => 'มอบ Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'มอบประสบการณ์ Plutonium ให้เพื่อนของคุณด้วยการซื้อการสมัครสมาชิกล่วงหน้า';

  @override
  String get premiumGiftBannerOne => 'คุณมีรหัสของขวัญใหม่รอคุณอยู่!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'คุณมีโค้ดของขวัญใหม่ $count รายการรอคุณอยู่!';
  }

  @override
  String get premiumViewGifts => 'ดูของขวัญ';

  @override
  String get premiumReadyToUpgrade => 'พร้อมจะอัปเกรดหรือยัง?';

  @override
  String get premiumReadyToBuyGift => 'พร้อมซื้อของขวัญหรือยัง?';

  @override
  String get premiumManageSubscription => 'จัดการการสมัครสมาชิก';

  @override
  String get premiumRedeemGiftCode => 'แลกรหัสของขวัญ';

  @override
  String get premiumGiftBadge => 'ของขวัญ';

  @override
  String get premiumCancelSubscriptionTitle => 'ยกเลิกการสมัครสมาชิกใช่หรือไม่';

  @override
  String get premiumCancelSubscriptionBody =>
      'คุณจะยังคงได้รับสิทธิประโยชน์จนถึงวันต่ออายุครั้งถัดไป จากนั้นจะมีระยะเวลาผ่อนผัน 3 วันในการสมัครสมาชิกอีกครั้งเพื่อรักษาประวัติการเป็นสมาชิกของคุณไว้';

  @override
  String get premiumCancelSubscriptionConfirm => 'ยกเลิกการสมัครสมาชิก';

  @override
  String get premiumPurchaseHistoryTitle => 'ประวัติการซื้อ';

  @override
  String get premiumPurchaseHistoryDescription =>
      'ใบแจ้งหนี้ล่าสุดของคุณ หากต้องการเปลี่ยนวิธีการชำระเงินสำหรับการสมัครใช้งานของคุณ ให้เพิ่มหรือเลือกวิธีการชำระเงินในพอร์ทัลการเรียกเก็บเงิน แล้วตั้งเป็นค่าเริ่มต้น';

  @override
  String get premiumManagePaymentMethods => 'จัดการวิธีการชำระเงิน';

  @override
  String get premiumSelfServeRefundButton => 'คืนเงินการซื้อล่าสุด';

  @override
  String get premiumDisclaimerAgreementPrefix => 'เมื่อซื้อ คุณยอมรับ ';

  @override
  String get premiumDisclaimerAgreementPastPrefix => 'เมื่อซื้อ คุณได้ตกลงตาม ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' และ ';

  @override
  String premiumActiveUntil(String date) {
    return 'ใช้งานได้ถึง $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'กำลังยกเลิก';

  @override
  String premiumCancelsOn(String date) {
    return 'จะยกเลิกในวันที่ $date สิทธิประโยชน์จะยังคงใช้งานได้จนถึงตอนนั้น';
  }

  @override
  String get premiumReactivateSubscription => 'เปิดใช้งานอีกครั้ง';

  @override
  String premiumGiftedUntil(String date) {
    return 'ได้รับเป็นของขวัญจนถึงวันที่ $date จะไม่ต่ออายุอัตโนมัติ';
  }

  @override
  String get premiumGiftGraceEnded =>
      'เวลาของขวัญของคุณหมดแล้ว สมัครสมาชิกเพื่อรับ Plutonium ต่อไป';

  @override
  String get premiumGiftTimeAddedAfterSubscription =>
      'คุณจะถูกเรียกเก็บเงินทันที เวลาของขวัญที่เหลือของคุณจะถูกเพิ่มหลังจากช่วงเวลาที่ชำระเงินของคุณ ดังนั้นจะไม่มีการสูญเสีย';

  @override
  String get premiumComparisonFeatureColumn => 'ฟีเจอร์';

  @override
  String get premiumDisclaimerRefund =>
      'ขอคืนเงินด้วยตนเองได้ภายใน 3 วันหลังชำระเงิน และทำได้หนึ่งครั้งทุก 30 วัน การคืนเงินค่าสมัครสมาชิกจะเป็นการยกเลิกการสมัครสมาชิกด้วย ผู้ซื้อใน EU/EEA สละสิทธิ์ยกเลิกสัญญาภายใน 14 วันตอนชำระเงิน เพื่อเข้าถึงเนื้อหาได้ทันที โปรดใช้ปุ่มขอคืนเงินในแอปแทนการปฏิเสธการชำระเงินกับธนาคาร การปฏิเสธการชำระเงินอาจทำให้บัญชีของคุณถูกจำกัดอย่างถาวร Stripe เป็นผู้ดูแลการชำระเงินอย่างปลอดภัย เราไม่เห็นหมายเลขบัตรแบบเต็มของคุณ';

  @override
  String get premiumTermsOfService => 'ข้อกำหนดในการให้บริการ';

  @override
  String get premiumPrivacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get premiumCheckoutStartFailedTitle => 'ไม่สามารถเริ่มชำระเงินได้';

  @override
  String get premiumCheckoutStartFailedBody =>
      'เกิดข้อผิดพลาดขณะเริ่มต้นการชำระเงิน โปรดลองอีกครั้งในภายหลัง';

  @override
  String get premiumPlanUnavailable =>
      'แพ็กเกจนี้ไม่พร้อมใช้งาน โปรดติดต่อฝ่ายสนับสนุน';

  @override
  String get premiumPlanUnavailableSelfHosted =>
      'แพ็กเกจนี้ไม่พร้อมใช้งาน โปรดติดต่อผู้ดูแลระบบของอินสแตนซ์นี้';

  @override
  String get premiumCompletePaymentTitle => 'ชำระเงินให้เสร็จสมบูรณ์';

  @override
  String get premiumCompletePaymentBody =>
      'คุณกำลังไปยัง Stripe เพื่อดำเนินการชำระเงินให้เสร็จสิ้น กลับไปที่ Fluxer เมื่อคุณดำเนินการเสร็จแล้ว';

  @override
  String get premiumChoosePaymentMethodTitle => 'เลือกช่องทางการชำระเงิน';

  @override
  String get premiumPixPaymentPromptDescription =>
      'ชำระเงินด้วย Pix อัตโนมัติเพื่ออนุญาตให้เรียกเก็บเงินเป็นประจำโดยตรงจากธนาคารในบราซิลของคุณ หรือเลือกใช้บัตรเพื่อป้อนข้อมูลบัตรเครดิตในหน้าถัดไปของ Stripe';

  @override
  String get premiumUsePix => 'ใช้ Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'ชำระเงินด้วย UPI เพื่อตั้งค่า e-mandate ที่เป็นไปตามข้อกำหนดของ RBI จากธนาคารอินเดียของคุณ หรือเลือกใช้บัตรเพื่อกรอกข้อมูลบัตรเครดิตในหน้าถัดไปของ Stripe';

  @override
  String get premiumUseUpi => 'ใช้ UPI';

  @override
  String get premiumUseCard => 'ใช้บัตร';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'ไม่สามารถเปิดพอร์ทัลการเรียกเก็บเงินได้';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'เกิดข้อผิดพลาดขณะเปิดพอร์ทัลการเรียกเก็บเงิน โปรดลองอีกครั้งในภายหลัง';

  @override
  String get premiumAlreadyVisionaryTitle => 'คุณเป็น Visionary อยู่แล้ว';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary มีสิทธิ์เข้าถึงถาวรอยู่แล้ว จึงไม่จำเป็นต้องสมัครสมาชิกแบบต่ออายุอัตโนมัติ คุณยังสามารถซื้อของขวัญให้ผู้อื่นได้';

  @override
  String get premiumExistingSubscriptionTitle => 'มีการสมัครสมาชิกอยู่แล้ว';

  @override
  String get premiumExistingSubscriptionBody =>
      'เราพบการสมัครใช้งาน Fluxer Plutonium ที่มีอยู่สำหรับบัญชีนี้ จัดการได้ที่พอร์ทัลการเรียกเก็บเงินที่ปลอดภัยเพื่ออัปเดตรายละเอียดการชำระเงินหรือตรวจสอบสถานะการต่ออายุ หากคุณเพิ่งชำระเงิน โปรดรอสักครู่แล้วเปิดหน้านี้อีกครั้ง';

  @override
  String get premiumPurchasesDisabledTitle => 'ไม่สามารถซื้อได้';

  @override
  String premiumPurchasesDisabledBody(String supportEmail) {
    return 'การซื้อถูกปิดใช้งานสำหรับบัญชีนี้ ติดต่อ $supportEmail หากดูเหมือนว่ามีข้อผิดพลาด';
  }

  @override
  String get premiumPurchasesDisabledBodySelfHosted =>
      'การซื้อถูกปิดใช้งานสำหรับบัญชีนี้ ติดต่อผู้ดูแลระบบของอินสแตนซ์นี้หากดูเหมือนว่ามีข้อผิดพลาด';

  @override
  String get premiumClaimAccountToPurchase =>
      'รับสิทธิ์บัญชีของคุณเพื่อซื้อ Fluxer Plutonium';

  @override
  String get premiumVerifyEmailToPurchase =>
      'คุณต้องยืนยันอีเมลของคุณก่อนจึงจะสามารถซื้อ Fluxer Plutonium ได้';

  @override
  String get premiumPerkCommunities => 'คอมมูนิตี้';

  @override
  String get premiumPerkMessageCharacterLimit => 'ขีดจำกัดตัวอักษรของข้อความ';

  @override
  String get premiumPerkBookmarkedMessages => 'ข้อความที่บุ๊กมาร์ก';

  @override
  String get premiumPerkFileUploadSize => 'ขนาดไฟล์ที่อัปโหลด';

  @override
  String get premiumPerkUseAnimatedEmojis => 'ใช้อิโมจิเคลื่อนไหว';

  @override
  String get premiumPerkVideoQuality => 'คุณภาพวิดีโอ';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'รูปโปรไฟล์และแบนเนอร์แบบเคลื่อนไหว';

  @override
  String get premiumPerkEarlyAccess => 'เข้าถึงฟีเจอร์ใหม่ก่อนใคร';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'สูงสุด 4K/60fps';

  @override
  String storePlutoniumPriceLine(String monthly, String yearly) {
    return '$monthly หรือ $yearly';
  }

  @override
  String get storePlutoniumMonthSuffix => '/เดือน';

  @override
  String get storePlutoniumYearSuffix => '/ปี';

  @override
  String get storePlutoniumPriceOr => 'หรือ';

  @override
  String get storePlutoniumEmojiTitle => 'อิโมจิของคุณ ใช้ได้ทุกที่';

  @override
  String get storePlutoniumEmojiBody =>
      'นำอิโมจิและสติกเกอร์ที่กำหนดเองจากคอมมูนิตี้ใดก็ได้ของคุณมาใช้ในทุกแชทและทุกคอมมูนิตี้ที่คุณอยู่';

  @override
  String get storePlutoniumProfileTitle => 'โปรไฟล์ที่โดดเด่น';

  @override
  String get storePlutoniumProfileBody =>
      'รับรูปโปรไฟล์และแบนเนอร์แบบเคลื่อนไหว, ป้ายสมาชิก, แท็กสี่หลักที่คุณต้องการต่อท้ายชื่อผู้ใช้ของคุณ* และโปรไฟล์แยกต่างหากสำหรับแต่ละคอมมูนิตี้';

  @override
  String get storePlutoniumFilesTitle => 'ส่งไฟล์ขนาดสูงสุด 500 MB';

  @override
  String get storePlutoniumFilesBody =>
      'แชร์วิดีโอความยาวเต็มและไฟล์ขนาดใหญ่ได้โดยไม่ต้องย่อขนาดก่อน บัญชีฟรีสามารถส่งได้สูงสุด 25 MB';

  @override
  String get storePlutoniumCompareTitle => 'เปรียบเทียบแบบฟรีและ Plutonium';

  @override
  String get storePlutoniumCompareMobileNote =>
      'ฟีเจอร์เหล่านี้บางส่วนไม่มีในแอปมือถือ บางฟีเจอร์ใช้ได้บนเดสก์ท็อปเท่านั้น';

  @override
  String get storePlutoniumNotAvailable => 'ไม่พร้อมใช้งาน';

  @override
  String get storePlutoniumAvailable => 'พร้อมใช้งาน';

  @override
  String get storePlutoniumCompareTag =>
      'เลือกตัวเลข 4 หลักหลังชื่อผู้ใช้ของคุณ*';

  @override
  String get storePlutoniumCompareProfile => 'โปรไฟล์แยกสำหรับแต่ละคอมมูนิตี้';

  @override
  String get storePlutoniumCompareBadge => 'ป้ายสมาชิกบนโปรไฟล์ของคุณ';

  @override
  String get storePlutoniumCompareBackgrounds =>
      'พื้นหลังโทรวิดีโอที่คุณบันทึกได้';

  @override
  String get storePlutoniumCompareCommunities => 'คอมมูนิตี้ที่คุณเข้าร่วมได้';

  @override
  String get storePlutoniumCompareCharacters => 'อักขระในข้อความเดียว';

  @override
  String get storePlutoniumCompareBookmarks =>
      'ข้อความที่คุณสามารถบุ๊กมาร์กได้';

  @override
  String get storePlutoniumCompareUpload =>
      'ไฟล์ที่ใหญ่ที่สุดที่คุณสามารถอัปโหลดได้';

  @override
  String get storePlutoniumCompareSavedMedia =>
      'รายการสื่อที่คุณสามารถบันทึกไว้ดูภายหลังได้';

  @override
  String get storePlutoniumCompareAnimatedEmoji =>
      'ใช้อิโมจิเคลื่อนไหวในข้อความ';

  @override
  String get storePlutoniumCompareCustomEmoji =>
      'ใช้อิโมจิและสติกเกอร์ที่กำหนดเองในคอมมูนิตี้ใดก็ได้';

  @override
  String get storePlutoniumCompareVideo => 'คุณภาพการโทรวิดีโอและการแชร์หน้าจอ';

  @override
  String get storePlutoniumCompareAvatar =>
      'รูปโปรไฟล์และแบนเนอร์แบบเคลื่อนไหว';

  @override
  String get storePlutoniumCompareEarlyAccess => 'เข้าถึงฟีเจอร์ใหม่ก่อนใคร';

  @override
  String get storePlutoniumCompareThemes => 'ธีมแบบกำหนดเองสำหรับแอป';

  @override
  String get storePlutoniumVideoFree => 'สูงสุด 720p ที่ 30 FPS';

  @override
  String get storePlutoniumVideoPlutonium => 'สูงสุด 4K ที่ 60 FPS';

  @override
  String get storePlutoniumTagFootnote =>
      'คุณเลือกได้เฉพาะแท็กที่ยังไม่มีผู้อื่นซึ่งใช้ชื่อผู้ใช้เดียวกันใช้อยู่ ชื่อผู้ใช้ไม่คำนึงถึงตัวพิมพ์เล็กและใหญ่ ดังนั้น Mina#4821 และ mina#4821 จึงถือว่าเป็นชื่อเดียวกัน แท็ก #0000 สงวนไว้สำหรับสมาชิก Fluxer Visionary';

  @override
  String get storePlutoniumLearnVisionary =>
      'เรียนรู้เพิ่มเติมเกี่ยวกับ Visionary';

  @override
  String get storePlutoniumDonatePrompt =>
      'แค่อยากสนับสนุนการพัฒนาโอเพนซอร์สของ Fluxer ใช่ไหม ';

  @override
  String get storePlutoniumDonateLink => 'บริจาคแทน';

  @override
  String get storePlutoniumHighlightsLead =>
      'การสมัครสมาชิกจะช่วยสนับสนุน Fluxer และปลดล็อก';

  @override
  String get storePlutoniumHighlightEmoji =>
      'อิโมจิและสติกเกอร์ที่กำหนดเองในทุกแชท';

  @override
  String get storePlutoniumHighlightProfile =>
      'โปรไฟล์เคลื่อนไหว ป้าย และตัวเลข 4 หลักที่เลือกเอง';

  @override
  String get storePlutoniumHighlightFiles => 'อัปโหลดได้สูงสุด 500 MB';

  @override
  String get storePlutoniumHighlightMessages =>
      'ส่งข้อความได้สูงสุด 4,000 ตัวอักษร';

  @override
  String get storePlutoniumHighlightCommunityProfile =>
      'โปรไฟล์แยกสำหรับแต่ละคอมมูนิตี้';

  @override
  String get storePlutoniumHighlightsMore => 'และอีกมากมาย';

  @override
  String get storePlutoniumRenewsThroughPlay =>
      'ต่ออายุอัตโนมัติผ่าน Google Play จนกว่าคุณจะยกเลิก';

  @override
  String get storePlutoniumRenewsThroughAppStore =>
      'ต่ออายุอัตโนมัติผ่าน App Store จนกว่าคุณจะยกเลิก';

  @override
  String get storePlutoniumAlreadySubscribed =>
      'คุณมีการสมัครสมาชิก Fluxer Plutonium อยู่แล้ว';

  @override
  String storePlutoniumSavePercent(int percent) {
    return 'ประหยัด $percent%';
  }

  @override
  String get storePlutoniumWaiting =>
      'ได้รับคำสั่งซื้อแล้ว Plutonium จะแสดงที่นี่เมื่อเปิดใช้งาน';

  @override
  String get storePlutoniumUnavailable =>
      'การสมัครสมาชิกในแอปยังไม่พร้อมใช้งานบนอุปกรณ์นี้';

  @override
  String get storePlutoniumVisionaryStatus =>
      'Visionary มีสิทธิ์เข้าถึงถาวรอยู่แล้ว จึงไม่จำเป็นต้องมีการสมัครสมาชิกแบบประจำ';

  @override
  String get userSettingsNavPrivacyDashboard => 'แดชบอร์ดความเป็นส่วนตัว';

  @override
  String get userSettingsNavAuthorizedApps => 'แอปที่ได้รับอนุญาต';

  @override
  String get userSettingsNavBlockedUsers => 'ผู้ใช้ที่ถูกบล็อก';

  @override
  String get userSettingsNavLinkedDevices => 'อุปกรณ์ที่เชื่อมโยง';

  @override
  String get userSettingsNavConnections => 'การเชื่อมต่อ';

  @override
  String get userSettingsNavLookAndFeel => 'รูปลักษณ์และการแสดงผล';

  @override
  String get userSettingsNavAccessibility => 'การช่วยสำหรับการเข้าถึง';

  @override
  String get userSettingsNavChat => 'แชท';

  @override
  String get userSettingsNavAudioAndVideo => 'เสียงและวิดีโอ';

  @override
  String get userSettingsNavShortcuts => 'ปุ่มลัด';

  @override
  String get audioAndVideoAudioSectionTitle => 'เสียง';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'ตั้งค่าไมโครโฟน ลำโพง และการประมวลผลเสียงของคุณ';

  @override
  String get audioAndVideoVideoSectionTitle => 'วิดีโอ';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'ตั้งค่าคุณภาพกล้องและการแชร์หน้าจอของคุณ';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'การทำงานขณะอยู่ในสาย';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'ควบคุมการแจ้งเตือนเพื่อยืนยันระหว่างการโทรด้วยเสียงและวิดีโอ';

  @override
  String get audioAndVideoInputDeviceLabel => 'อุปกรณ์อินพุต';

  @override
  String get audioAndVideoOutputDeviceLabel => 'อุปกรณ์เอาต์พุต';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'ค่าเริ่มต้น';

  @override
  String get audioAndVideoUseSpeakerLabel => 'ใช้ลำโพง';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'เมื่อปิดอยู่ เสียงจะเล่นผ่านลำโพงหูฟังหรือหูฟังที่เชื่อมต่อ';

  @override
  String get audioAndVideoInputVolumeLabel => 'ระดับเสียงไมโครโฟน';

  @override
  String get audioAndVideoOutputVolumeLabel => 'ระดับเสียงลำโพง';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'การประมวลผลเสียง';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'เน้นเสียงพูด';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'แนะนำ: ปรับปรุงไมโครโฟนของคุณเพื่อให้เสียงพูดชัดเจน';

  @override
  String get audioAndVideoDirectInputLabel => 'อินพุตโดยตรง';

  @override
  String get audioAndVideoDirectInputDescription =>
      'ส่งเสียงของคุณโดยไม่มีการปรับแต่ง เหมาะที่สุดหากคุณใช้ซอฟต์แวร์เสียงภายนอก';

  @override
  String get audioAndVideoCustomProfileLabel => 'กำหนดเอง';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'ปรับการตั้งค่าแต่ละรายการด้วยตัวเอง: การลดเสียงรบกวน การตัดเสียงสะท้อน และเกน';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'การลดเสียงรบกวน';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'ปรับปรุงแล้ว';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'มาตรฐาน';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'ไม่มี';

  @override
  String get audioAndVideoEchoCancellationLabel => 'การตัดเสียงสะท้อน';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'ควบคุมอัตราขยายเสียงอัตโนมัติ';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'ปรับระดับเสียงไมโครโฟนให้สม่ำเสมอ ปิดเมื่อเปิดใช้งานการลดเสียงรบกวนขั้นสูง';

  @override
  String get audioAndVideoMicTestSectionTitle => 'ทดสอบไมโครโฟน';

  @override
  String get audioAndVideoMicTestStartLabel => 'เริ่มทดสอบไมโครโฟน';

  @override
  String get audioAndVideoMicTestStopLabel => 'หยุดทดสอบไมโครโฟน';

  @override
  String get audioAndVideoCameraLabel => 'กล้อง';

  @override
  String get audioAndVideoMirrorCameraLabel => 'กลับด้านกล้อง';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'คุณภาพกล้อง';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'คุณภาพการแชร์หน้าจอ';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'อัตราเฟรม';

  @override
  String get audioAndVideoFrameRate15Label => '15 เฟรมต่อวินาที';

  @override
  String get audioAndVideoFrameRate30Label => '30 เฟรมต่อวินาที';

  @override
  String get audioAndVideoFrameRate60Label => '60 เฟรมต่อวินาที';

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'อินสแตนซ์นี้ปัจจุบันอนุญาตให้แชร์หน้าจอได้สูงสุด 720p ที่ 30 FPS';

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'ไม่ถามเมื่อซ่อนกล้องของฉัน';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'ไม่ถามเมื่อซ่อนการแชร์หน้าจอของฉัน';

  @override
  String get userSettingsNavNotifications => 'การแจ้งเตือน';

  @override
  String get notificationsGeneralSectionTitle => 'ทั่วไป';

  @override
  String get notificationsEnableNotificationsLabel => 'เปิดการแจ้งเตือน';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'รับการแจ้งเตือนเมื่อคุณได้รับข้อความ คุณอาจต้องอนุญาตการแจ้งเตือนสำหรับ $productName ในการตั้งค่าอุปกรณ์ของคุณ หากต้องการควบคุมการแจ้งเตือนแต่ละช่อง/แต่ละคอมมูนิตี้ ให้เปิดการตั้งค่าการแจ้งเตือนจากเมนูของคอมมูนิตี้';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'เปิดการแจ้งเตือนบนเดสก์ท็อป';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'ใช้ศูนย์การแจ้งเตือนของระบบปฏิบัติการ หากต้องการควบคุมการแจ้งเตือนแต่ละช่อง/แต่ละคอมมูนิตี้ ให้คลิกขวาที่ไอคอนคอมมูนิตี้แล้วเปิดการตั้งค่าการแจ้งเตือน';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'หมดเวลาการแจ้งเตือนแบบพุชเมื่อไม่ใช้งาน';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName จะไม่ส่งการแจ้งเตือนแบบพุชไปยังอุปกรณ์มือถือของคุณเมื่อคุณอยู่หน้าคอมพิวเตอร์ เลือกระยะเวลาที่ต้องไม่มีการใช้งานบนเดสก์ท็อป ก่อนที่คุณจะเริ่มได้รับการแจ้งเตือนแบบพุช';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute นาที';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes นาที';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle =>
      'การตั้งค่าการกล่าวถึง';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'การตั้งค่าการกล่าวถึงในการตอบกลับ';

  @override
  String get notificationsMentionNoPreferenceName => 'ไม่ระบุ';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'เคารพการตั้งค่าของผู้ส่ง โดยไม่มีการแจ้งเตือนเมื่อผู้ส่งเปิด/ปิดการกล่าวถึง (@)';

  @override
  String get notificationsMentionPreferMentionName => 'ต้องการ @mention';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'ให้การตอบกลับกล่าวถึง (@) คุณโดยค่าเริ่มต้น และเตือนผู้ส่งหากพวกเขาปิดไว้';

  @override
  String get notificationsMentionPreferNoMentionName => 'ไม่ต้องการ @mention';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'ให้การตอบกลับไม่กล่าวถึง (@) โดยค่าเริ่มต้น และเตือนผู้ส่งหากพวกเขาเปิดใช้งาน';

  @override
  String get notificationsTtsSectionTitle =>
      'การแจ้งเตือนแบบอ่านออกเสียงข้อความ';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'เปิดใช้งานการอ่านออกเสียง /tts';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'ให้ /tts อ่านข้อความของคุณออกเสียง การปิดการตั้งค่านี้จะทำให้คำสั่งเหล่านั้นเป็นข้อความปกติ';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'ปรับความเร็วในการเล่นได้ใน ';

  @override
  String get notificationsTtsAccessibilityLinkLabel =>
      'การช่วยสำหรับการเข้าถึง';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'อ่านข้อความอัตโนมัติ';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'แปลงเนื้อหาที่เข้ามาเป็นเสียงพูด ไม่ว่าจะมาจาก /tts หรือไม่ก็ตาม';

  @override
  String get notificationsTtsModeAllChannelsName => 'ทุกช่อง';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'ให้ระบบอ่านทุกข้อความที่เข้ามา ไม่ว่าจะเปิดช่องไหนอยู่ก็ตาม';

  @override
  String get notificationsTtsModeCurrentChannelName => 'เฉพาะช่องที่ใช้งานอยู่';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'อ่านออกเสียงเฉพาะช่องที่คุณกำลังดูอยู่ การอ่านออกเสียงจะตามคุณไปเมื่อเปลี่ยนช่อง';

  @override
  String get notificationsTtsModeNeverName => 'ไม่อ่านอัตโนมัติ';

  @override
  String get notificationsTtsModeNeverDescription =>
      'จะไม่มีเสียงพูดจนกว่าจะมีคนใช้คำสั่ง /tts ด้วยตัวเอง';

  @override
  String get notificationsTtsModeAriaLabel => 'อ่านออกเสียงทุกข้อความ';

  @override
  String get notificationsSoundsSectionTitle => 'เสียง';

  @override
  String get notificationsMasterVolumeLabel => 'ระดับเสียงหลัก';

  @override
  String get notificationsMasterVolumeDescription =>
      'ตั้งค่าระดับเสียงสำหรับเอฟเฟกต์เสียงทั้งหมด การตั้งค่าเฉพาะเสียงจะข้ามการตั้งค่านี้';

  @override
  String get notificationsResetToDefaultVolume =>
      'รีเซ็ตระดับเสียงเป็นค่าเริ่มต้น';

  @override
  String get notificationsDisableAllSoundsLabel => 'ปิดเสียงแจ้งเตือนทั้งหมด';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'ระบบจะยังคงใช้การตั้งค่าเสียงแจ้งเตือนเดิมของคุณ';

  @override
  String get notificationsShowMoreSoundEffects => 'แสดงเอฟเฟกต์เสียงเพิ่มเติม';

  @override
  String get notificationsShowFewerSoundEffects => 'แสดงเอฟเฟกต์เสียงให้น้อยลง';

  @override
  String get notificationsPreviewSound => 'ลองฟังเสียง';

  @override
  String get notificationsPerSoundVolumeTitle => 'ระดับเสียงแต่ละเสียง';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'ตั้งค่าระดับเสียงเฉพาะสำหรับแต่ละเสียง เสียงที่ไม่ได้ตั้งค่าเองจะใช้ระดับเสียงหลัก';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'มีการตั้งค่าระดับเสียงที่กำหนดเองไว้: $overrideCount';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'ติดตามหลัก • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'รีเซ็ต $label เป็นระดับเสียงหลัก';
  }

  @override
  String get notificationsResetAllOverrides =>
      'รีเซ็ตระดับเสียงที่กำหนดเองทั้งหมด';

  @override
  String notificationsMuteSound(String label) {
    return 'ปิดเสียง $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'เปิดเสียง $label';
  }

  @override
  String get notificationsSoundMessage => 'การแจ้งเตือนข้อความของคอมมูนิตี้';

  @override
  String get notificationsSoundDirectMessage => 'การแจ้งเตือนข้อความส่วนตัว';

  @override
  String get notificationsSoundSameChannelMessage =>
      'การแจ้งเตือนข้อความของช่องปัจจุบัน';

  @override
  String get notificationsSoundMute => 'ปิดไมโครโฟน';

  @override
  String get notificationsSoundUnmute => 'เปิดไมโครโฟน';

  @override
  String get notificationsSoundDeaf => 'ปิดเสียงทั้งหมด';

  @override
  String get notificationsSoundUndeaf => 'เลิกปิดเสียงทั้งหมด';

  @override
  String get notificationsSoundUserJoin => 'ผู้ใช้เข้าร่วมช่อง';

  @override
  String get notificationsSoundUserLeave => 'ผู้ใช้ออกจากช่อง';

  @override
  String get notificationsSoundUserMove => 'ผู้ใช้ย้ายช่อง';

  @override
  String get notificationsSoundViewerJoin => 'ผู้ชมเข้าร่วมสตรีม';

  @override
  String get notificationsSoundViewerLeave => 'ผู้ชมออกจากสตรีม';

  @override
  String get notificationsSoundVoiceDisconnect => 'เสียงถูกตัดการเชื่อมต่อ';

  @override
  String get notificationsSoundIncomingRing => 'สายเรียกเข้า';

  @override
  String get notificationsSoundCameraOn => 'เปิดกล้อง';

  @override
  String get notificationsSoundCameraOff => 'ปิดกล้อง';

  @override
  String get notificationsSoundScreenShareStart => 'เริ่มแชร์หน้าจอ';

  @override
  String get notificationsSoundScreenShareStop => 'หยุดแชร์หน้าจอ';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'ไม่สามารถอัปเดตการหมดเวลาการแจ้งเตือนแบบพุชได้ ลองอีกครั้ง';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'ไม่สามารถอัปเดตการตั้งค่าการกล่าวถึงได้ ลองอีกครั้ง';

  @override
  String get notificationsPermissionDeniedTitle => 'การแจ้งเตือนถูกบล็อก';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'ไม่สามารถเปิดใช้งานการแจ้งเตือนได้ โปรดยืนยันสิทธิ์การแจ้งเตือนเพื่อดำเนินการต่อ';

  @override
  String get notificationsPushRelaySectionTitle =>
      'ตัวส่งต่อการแจ้งเตือนแบบพุช';

  @override
  String notificationsPushRelaySectionDescription(String pushProvider) {
    return '$pushProvider ส่งการแจ้งเตือนแบบพุชผ่านบริการของตนเองเท่านั้น การแจ้งเตือนของอุปกรณ์นี้จึงผ่านตัวส่งต่อของ Fluxer';
  }

  @override
  String get notificationsPushRelayConsentLabel => 'ใช้ตัวส่งต่อพุชของ Fluxer';

  @override
  String get notificationsPushRelayConsentDescription =>
      'หากปิดใช้งาน การลงทะเบียนพุชของอุปกรณ์นี้จะถูกลบ และอุปกรณ์จะหยุดรับการแจ้งเตือนแบบพุช';

  @override
  String get pushRelayConsentTitle => 'ตัวส่งต่อการแจ้งเตือนแบบพุช';

  @override
  String pushRelayConsentDescription(String pushProvider) {
    return '$pushProvider ส่งการแจ้งเตือนแบบพุชผ่านบริการของตนเองเท่านั้น การแจ้งเตือนของอุปกรณ์นี้จึงผ่านตัวส่งต่อของ Fluxer';
  }

  @override
  String get pushRelayConsentNoticePrefix =>
      'หากต้องการเปิดการแจ้งเตือนแบบพุชบนอุปกรณ์นี้ โปรดยอมรับ';

  @override
  String get pushRelayConsentNoticeLink =>
      'ประกาศความเป็นส่วนตัวของตัวส่งต่อพุช';

  @override
  String get pushRelayConsentNoticeSuffix =>
      ' คุณยอมรับเพียงครั้งเดียวต่ออุปกรณ์';

  @override
  String get pushRelayConsentAgree => 'ยอมรับและดำเนินการต่อ';

  @override
  String get pushRelayConsentDecline => 'ไม่ใช่ตอนนี้';

  @override
  String get userSettingsNavLanguageAndTime => 'ภาษาและเวลา';

  @override
  String get languageAndTimeLanguageSectionTitle => 'ภาษาของแอป';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'เลือกภาษาที่จะใช้ทั่วทั้งแอป';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'รูปแบบเวลา';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'เลือกวิธีแสดงเวลาในแอป';

  @override
  String get languageAndTimeTimeFormatSelectionLabel => 'การเลือกรูปแบบเวลา';

  @override
  String get languageAndTimeTimeFormatAuto => 'อัตโนมัติ';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 ชั่วโมง';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 ชั่วโมง';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'รูปแบบเวลาตามภาษาของแอป: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'รูปแบบเวลาตามระบบ: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'ใช้รูปแบบเวลาตามภาษาของระบบ';

  @override
  String get languageAndTimeTimeFormatSyncFailed => 'อัปเดตรูปแบบเวลาไม่สำเร็จ';

  @override
  String get userSettingsNavDefaultApps => 'แอปเริ่มต้น';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'เว็บเบราว์เซอร์';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'เลือกเบราว์เซอร์ที่จะเปิดเมื่อคุณแตะลิงก์';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'หากมีการติดตั้งแอปสำหรับเว็บไซต์ ลิงก์จะเปิดในแอปนั้นก่อน';

  @override
  String get defaultAppsWebBrowserInApp => 'เบราว์เซอร์ในแอป';

  @override
  String get defaultAppsWebBrowserExternal => 'เบราว์เซอร์ภายนอก';

  @override
  String get userSettingsNavAppIcon => 'ไอคอนแอป';

  @override
  String get appIconSectionTitle => 'ไอคอนแอป';

  @override
  String get appIconSectionDescription =>
      'เลือกไอคอนที่จะแสดงบนหน้าจอหลักของคุณ';

  @override
  String get appIconOptionDefault => 'ค่าเริ่มต้น';

  @override
  String get appIconOptionStarfield => 'ทุ่งดาว';

  @override
  String get appIconOptionSweden => 'สวีเดน';

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
      'การเปลี่ยนไอคอนแอปไม่สามารถใช้งานได้บนอุปกรณ์นี้';

  @override
  String get userSettingsNavAdvanced => 'ขั้นสูง';

  @override
  String get advancedPerformanceReportingTitle => 'การรายงานประสิทธิภาพ';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'ช่วยปรับปรุง $productName ด้วยการแชร์ข้อมูลประสิทธิภาพและข้อมูลขัดข้องแบบไม่ระบุตัวตน';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'ส่งรายงานข้อขัดข้องและประสิทธิภาพ';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'ข้อมูลที่รายงานทั้งหมดไม่ระบุตัวตนและจะถูกส่งไปยังบริการตรวจสอบของ $productName เท่านั้น — ไม่มีผู้ให้บริการบุคคลที่สาม';
  }

  @override
  String get advancedSettingsConfigure => 'กำหนดค่า';

  @override
  String get advancedSettingsCategoryPrivacy => 'ความเป็นส่วนตัว';

  @override
  String get advancedSettingsCategoryAppearance => 'รูปลักษณ์';

  @override
  String get advancedSettingsCategoryAccessibility => 'การช่วยสำหรับการเข้าถึง';

  @override
  String get advancedSettingsCategoryChat => 'แชท';

  @override
  String get advancedSettingsCategoryMedia => 'สื่อ';

  @override
  String get advancedSettingsCategoryVoice => 'เสียง';

  @override
  String get advancedSettingsCategoryDeveloper => 'นักพัฒนา';

  @override
  String get advancedSettingEnableTextSelectionLabel =>
      'เปิดใช้งานการเลือกข้อความ';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'อนุญาตให้เลือกข้อความในแอป';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'เปิดใช้งานภาพตัวอย่างการเลื่อนวิดีโอ';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'ภาพขนาดย่อหรือเฟรมสดขณะเลื่อนวิดีโอ';

  @override
  String get advancedSettingHapticFeedbackLabel => 'การสั่น';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'การสั่นเพื่อตอบสนองต่อการแตะและการดำเนินการต่างๆ จะไม่ซิงค์ข้ามอุปกรณ์';

  @override
  String get advancedSettingShowNekoLabel => 'แสดง Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'แมวเนโกะที่ไล่ตามเคอร์เซอร์ของคุณ';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'แสดง Neko ที่ช่องป้อนข้อความแชทของคุณ';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'ภาพเคลื่อนไหวซูมตอนเปิด';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'ย่อโลโก้ออกเมื่อออกจากหน้าจอเริ่มต้น';

  @override
  String get advancedSettingKeyboardHintsLabel => 'คำแนะนำแป้นพิมพ์';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'แสดงปุ่มลัดแป้นพิมพ์ในคำแนะนำเครื่องมือ';

  @override
  String get advancedSettingEnableFavoritesLabel => 'เปิดใช้งานรายการโปรด';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'แสดงรายการโปรดทั่วทั้งแอป';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'ลักษณะการเข้าร่วมช่องเสียง';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'ยืนยันหรือดับเบิลคลิกเพื่อเข้าร่วมช่องเสียงของคอมมูนิตี้';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'ต้องดับเบิลคลิกเพื่อเข้าร่วมช่องเสียง';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'ยืนยันก่อนเข้าร่วมช่องเสียง';

  @override
  String get advancedSettingAutoSendGifsLabel => 'ส่ง GIF อัตโนมัติเมื่อเลือก';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'ส่ง GIF จากตัวเลือก GIF ทันทีโดยไม่ต้องยืนยัน';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'บันทึก GIF รายการโปรดเป็นสื่อที่บันทึกไว้';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'เลือกวิธีจัดเก็บ GIF ที่ติดดาวเป็นรายการโปรด';

  @override
  String get advancedSettingMediaButtonsLabel => 'ปุ่มสื่อ';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'ปรับแต่งปุ่มและตัวบ่งชี้ที่จะแสดงบนไฟล์แนบสื่อและการฝัง';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'อัปโหลดไฟล์แนบก่อนส่ง';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'เริ่มอัปโหลดไฟล์แนบเมื่อเพิ่มลงในช่องข้อความ';

  @override
  String get advancedSettingStripTrackingLabel =>
      'ลบพารามิเตอร์ติดตามออกจาก URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'ลบพารามิเตอร์ติดตามออกจาก URL ในข้อความที่คุณส่งโดยอัตโนมัติ';

  @override
  String get advancedSettingTrustAllLinksLabel => 'เชื่อถือลิงก์ภายนอกทั้งหมด';

  @override
  String get advancedSettingSearchEnginesLabel => 'เครื่องมือค้นหา';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'กำหนดค่าเครื่องมือค้นหาที่จะใช้เมื่อเลือกข้อความ';

  @override
  String get advancedSettingTranslatorsLabel => 'ผู้แปล';

  @override
  String get advancedSettingTranslatorsDescription =>
      'กำหนดค่าผู้ให้บริการแปลที่ใช้สำหรับข้อความที่เลือก';

  @override
  String get advancedSettingReverseImageSearchLabel => 'ค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'ผู้ให้บริการค้นหารูปภาพแบบย้อนกลับ';

  @override
  String get advancedSettingMessageActionBarLabel => 'แถบการทำงานของข้อความ';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'ปรับแต่งแถบการทำงานที่ปรากฏขึ้นเมื่อวางเมาส์เหนือข้อความ';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'เติมอิโมจิอัตโนมัติ';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'เลือกสิ่งที่แสดงเมื่อคุณพิมพ์เครื่องหมายโคลอนในช่องป้อนข้อความ';

  @override
  String get advancedSettingInputButtonsLabel => 'ปุ่มป้อนข้อความ';

  @override
  String get advancedSettingInputButtonsDescription =>
      'เลือกปุ่มที่จะแสดงในช่องป้อนข้อความ';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'เลื่อนไปด้านล่างเมื่อส่งข้อความ';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'เลือกวิธีที่แชทจะเลื่อนหลังจากที่คุณส่งข้อความ';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'ข้ามการยืนยัน \"ทำเครื่องหมายว่าอ่านแล้วทั้งหมด\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'ทำเครื่องหมายช่องที่ยังไม่ได้อ่านทั้งหมดในกล่องข้อความว่าอ่านแล้วทันที โดยไม่ต้องยืนยัน';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'ซ่อนช่องที่ปิดเสียงไว้เป็นค่าเริ่มต้น';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'ซ่อนช่องที่คุณปิดเสียงจากแถบด้านข้างของคอมมูนิตี้';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'แสดงตัวบ่งชี้ GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'แสดงตัวบ่งชี้วันหมดอายุของไฟล์แนบ';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'แสดงปุ่มลบ';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'แสดงปุ่มดาวน์โหลด';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'แสดงปุ่มรายการโปรด';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'แสดงปุ่มซ่อนเนื้อหาที่ฝัง';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'แสดงแถบการทำงานของข้อความ';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'แสดงเฉพาะปุ่มเพิ่มเติม';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'แสดงรีแอ็กชันด่วน';

  @override
  String get advancedSettingEnableShiftToExpandLabel =>
      'เปิดใช้ Shift เพื่อขยาย';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'แสดงอิโมจิเริ่มต้นในการเติมข้อความอัตโนมัติ';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'แสดงอิโมจิที่กำหนดเองในการเติมข้อความอัตโนมัติ';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'แสดงสติกเกอร์ในการเติมข้อความอัตโนมัติ';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'แสดงสื่อที่บันทึกไว้ในการเติมข้อความอัตโนมัติ';

  @override
  String get advancedSettingShowGifsButtonLabel => 'แสดงปุ่ม GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'แสดงปุ่มสื่อ';

  @override
  String get advancedSettingShowStickersButtonLabel => 'แสดงปุ่มสติกเกอร์';

  @override
  String get advancedSettingShowEmojiButtonLabel => 'แสดงปุ่มอิโมจิ';

  @override
  String get advancedSettingShowSendButtonLabel => 'แสดงปุ่มส่ง';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'แสดงการแจ้งเตือนอุปกรณ์ใหม่';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'แจ้งเตือนเมื่อมีอุปกรณ์เสียงใหม่';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'การควบคุมระดับเสียงการเชื่อมต่อ';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'แสดงแถบเลื่อนระดับเสียงของผู้เข้าร่วมตามอุปกรณ์ในเมนูเสียง';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'พฤติกรรมการแสดงตัวอย่างการแชร์หน้าจอ';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'พฤติกรรมของตัวอย่าง ป๊อปเอาต์ และภาพขนาดย่อของสตรีม';

  @override
  String get advancedSettingScreenShareCodecLabel =>
      'ตัวแปลงสัญญาณการแชร์หน้าจอ';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'ตัวแปลงสัญญาณวิดีโอสำหรับการแชร์หน้าจอ';

  @override
  String get advancedSettingScreenShareCodecAuto => 'อัตโนมัติ (แนะนำ)';

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
      'หยุดแสดงตัวอย่างการแชร์หน้าจอของฉันชั่วคราวเมื่อแอปอยู่เบื้องหลัง';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'ซ่อนภาพตัวอย่างสตรีมของฉัน';

  @override
  String get advancedSettingDeveloperModeLabel => 'เปิดโหมดนักพัฒนา';

  @override
  String get advancedSettingDeveloperModeDescription => 'เปิดโหมดนักพัฒนา';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'เครื่องมือค้นหาเริ่มต้น';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'เลือกเครื่องมือค้นหาที่จะใช้เป็นค่าเริ่มต้นเมื่อค้นหาข้อความที่เลือก';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel => 'เครื่องมือค้นหาในตัว';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'เปิดหรือปิดเครื่องมือค้นหาในตัว เครื่องมือค้นหาที่เปิดใช้งานจะแสดงในเมนูบริบทข้อความเมื่อเลือกข้อความ';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'เครื่องมือค้นหาที่กำหนดเอง';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'เพิ่มเครื่องมือค้นหาของคุณเองด้วยรูปแบบ URL ที่กำหนดเอง ใช้ \'$query\' เป็นตัวยึดสำหรับข้อความค้นหา';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'เพิ่มเครื่องมือค้นหา';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'เปิดใช้งานเครื่องมือค้นหาอย่างน้อยหนึ่งรายการด้านล่าง';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'ลบเครื่องมือค้นหา';

  @override
  String get advancedSettingDefaultTranslatorLabel =>
      'เครื่องมือแปลภาษาเริ่มต้น';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'เลือกเครื่องมือแปลภาษาที่จะใช้เป็นค่าเริ่มต้นเมื่อแปลข้อความที่เลือก';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'เครื่องมือแปลภาษาในตัว';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'เปิดหรือปิดเครื่องมือแปลภาษาในตัว เครื่องมือแปลภาษาที่เปิดใช้งานจะแสดงในเมนูบริบทของข้อความเมื่อเลือกข้อความ';

  @override
  String get advancedSettingCustomTranslatorsLabel =>
      'เครื่องมือแปลภาษาที่กำหนดเอง';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'เพิ่มตัวแปลของคุณเองด้วยรูปแบบ URL ที่กำหนดเอง ใช้ \'$query\' เป็นตัวยึดสำหรับข้อความที่จะแปล';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'เพิ่มบริการแปลภาษา';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'เปิดใช้งานเครื่องมือแปลภาษาอย่างน้อยหนึ่งรายการด้านล่าง';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'ลบเครื่องมือแปลภาษา';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'การค้นหารูปภาพย้อนกลับเริ่มต้น';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'เลือกบริการค้นหารูปภาพย้อนกลับที่จะใช้เป็นค่าเริ่มต้นเมื่อค้นหารูปภาพ';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'ค้นหารูปภาพย้อนกลับในตัว';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'เปิดหรือปิดผู้ให้บริการค้นหารูปภาพย้อนกลับในตัว ผู้ให้บริการที่เปิดใช้งานจะปรากฏในเมนูบริบทของรูปภาพ, รูปโปรไฟล์, แบนเนอร์, สติกเกอร์ และอิโมจิ';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'ค้นหารูปภาพย้อนกลับแบบกำหนดเอง';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'เพิ่มผู้ให้บริการค้นหารูปภาพย้อนกลับของคุณเองด้วยรูปแบบ URL ที่กำหนดเอง ใช้ \'$url\' เป็นตัวยึดตำแหน่งสำหรับ URL ของรูปภาพ';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'เพิ่มการค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'เปิดใช้งานผู้ให้บริการค้นหารูปภาพย้อนกลับอย่างน้อยหนึ่งรายการด้านล่าง';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'ลบเครื่องมือค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingAddSearchEngineTitle => 'เพิ่มเครื่องมือค้นหา';

  @override
  String get advancedSettingEditSearchEngineTitle => 'แก้ไขเครื่องมือค้นหา';

  @override
  String get advancedSettingAddTranslatorTitle => 'เพิ่มผู้ให้บริการแปลภาษา';

  @override
  String get advancedSettingEditTranslatorTitle => 'แก้ไขผู้ให้บริการแปลภาษา';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'เพิ่มเครื่องมือค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'แก้ไขเครื่องมือค้นหารูปภาพย้อนกลับ';

  @override
  String get advancedSettingSearchProviderNameLabel => 'ชื่อ';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'รูปแบบ URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'เครื่องมือค้นหาของฉัน';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'นักแปลของฉัน';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'การค้นหารูปภาพย้อนกลับของฉัน';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'ใช้ \'$query\' ในตำแหน่งที่ควรแทรกข้อความค้นหา';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'ใช้ \'$query\' ในที่ที่ควรแทรกข้อความที่จะแปล';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'ใช้ \'$url\' ในตำแหน่งที่ต้องการแทรก URL ของรูปภาพ';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'ต้องระบุชื่อ';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'ต้องระบุรูปแบบ URL';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'รูปแบบ URL ต้องมีตัวยึดตำแหน่ง \"$query\"';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'รูปแบบ URL ต้องมีตัวยึดตำแหน่ง \"$url\"';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'รูปแบบ URL ต้องเป็น URL ที่ถูกต้อง';

  @override
  String get advancedSettingAddSearchProviderAction => 'เพิ่ม';

  @override
  String get advancedSettingEditSearchProviderAction => 'แก้ไข';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'ลบ';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบ $engineName';
  }

  @override
  String get userSettingsNavApplications => 'แอปพลิเคชัน';

  @override
  String get userSettingsNavAppLogs => 'บันทึกแอป';

  @override
  String get userSettingsNavDeveloperTools => 'เครื่องมือสำหรับนักพัฒนา';

  @override
  String get userSettingsNavLimitsConfig => 'การตั้งค่าขีดจำกัด';

  @override
  String get userSettingsNavFeatureFlags => 'ฟีเจอร์แฟล็ก';

  @override
  String get userSettingsNavWhatsNew => 'มีอะไรใหม่';

  @override
  String get userSettingsJoinFluxerLabs => 'เข้าร่วม Fluxer Labs';

  @override
  String get userSettingsGiveFeedback => 'Give feedback';

  @override
  String get userSettingsNavAppLicenses => 'ใบอนุญาตแอป';

  @override
  String get userSettingsAppLicensesDescription =>
      'ซอฟต์แวร์โอเพนซอร์สที่ใช้ในแอปนี้ แอปนี้สร้างด้วย Flutter';

  @override
  String get userSettingsAppLicensesLoadError =>
      'ไม่สามารถโหลดรายการใบอนุญาตแอปได้';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ใบอนุญาต',
      one: '1 ใบอนุญาต',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'ออกจากระบบ';

  @override
  String get userSettingsLogOutConfirmTitle => 'ออกจากระบบหรือไม่';

  @override
  String get userSettingsLogOutConfirmDescription =>
      'คุณสามารถลงชื่อเข้าใช้ได้ทุกเมื่อ';

  @override
  String get quickSwitcherTabSearch => 'ค้นหา';

  @override
  String get quickSwitcherTabFriends => 'เพื่อน';

  @override
  String get quickSwitcherSearchPlaceholder => 'ค้นหาช่อง ผู้คน หรือคอมมูนิตี้';

  @override
  String get quickSwitcherSearchFriends => 'ค้นหาเพื่อน';

  @override
  String get quickSwitcherNoMatchesFound => 'ไม่พบผลลัพธ์';

  @override
  String get quickSwitcherEmptyHint =>
      'ลองใช้ชื่ออื่น หรือใช้คำนำหน้า @ / # / ! / * เพื่อกรองผลลัพธ์';

  @override
  String get quickSwitcherSectionPeople => 'ผู้คน';

  @override
  String get quickSwitcherSectionGroupMessages => 'ข้อความกลุ่ม';

  @override
  String get quickSwitcherSectionTextChannels => 'ช่องข้อความ';

  @override
  String get quickSwitcherSectionThreads => 'Threads';

  @override
  String get quickSwitcherSectionVoiceChannels => 'ช่องเสียง';

  @override
  String get quickSwitcherSectionCommunities => 'คอมมูนิตี้';

  @override
  String get quickSwitcherSectionSettings => 'การตั้งค่า';

  @override
  String get quickSwitcherHomeLabel => 'หน้าแรก';

  @override
  String get quickSwitcherDirectMessagesLabel => 'ข้อความส่วนตัว';

  @override
  String get quickSwitcherFavoritesLabel => 'รายการโปรด';

  @override
  String get quickSwitcherUserSettingsLabel => 'การตั้งค่าผู้ใช้';

  @override
  String get quickSwitcherNotificationsLabel => 'การแจ้งเตือน';

  @override
  String get quickSwitcherBookmarksLabel => 'บุ๊กมาร์ก';

  @override
  String get savedMessagesEmptyTitle => 'ไม่มีบุ๊กมาร์ก';

  @override
  String get savedMessagesEmptyBody =>
      'บุ๊กมาร์กข้อความเพื่อบันทึกไว้อ่านภายหลัง';

  @override
  String get savedMessagesEndBody => 'ไม่มีอะไรให้ดูอีกแล้ว';

  @override
  String get savedMessagesRemoveTooltip => 'ลบบุ๊กมาร์ก';

  @override
  String get savedMessagesAddedToast => 'เพิ่มไปยังบุ๊กมาร์กแล้ว';

  @override
  String get savedMessagesRemovedToast => 'นำออกจากบุ๊กมาร์กแล้ว';

  @override
  String get quickSwitcherMentionsLabel => 'การกล่าวถึง';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'ยังไม่มีเพื่อน';

  @override
  String get quickSwitcherFriendsEmptyHint => 'เพิ่มเพื่อนเพื่อเริ่มต้นใช้งาน';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'ไม่มีเพื่อนที่ตรงกับการค้นหานี้';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'ลองใช้ชื่ออื่น';

  @override
  String get quickSwitcherSearchAliasUser => 'ผู้ใช้';

  @override
  String get quickSwitcherSearchAliasYou => 'คุณ';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'ข้อความส่วนตัว';

  @override
  String get quickSwitcherSearchAliasMessages => 'ข้อความ';

  @override
  String get quickSwitcherSearchAliasFav => 'รายการโปรด';

  @override
  String get quickSwitcherSearchAliasStarred => 'ติดดาว';

  @override
  String get quickSwitcherSearchAliasInbox => 'กล่องข้อความ';

  @override
  String get quickSwitcherSearchAliasSaved => 'บันทึกแล้ว';

  @override
  String get uiClose => 'ปิด';

  @override
  String get chatJumpToBottom => 'เลื่อนไปยังด้านล่าง';

  @override
  String get uiConfirm => 'ยืนยัน';

  @override
  String get uiLoading => 'กำลังโหลด';

  @override
  String get uiSearch => 'ค้นหา';

  @override
  String get uiStartCall => 'เริ่มโทร';

  @override
  String get uiStartVideoCall => 'เริ่มวิดีโอคอล';

  @override
  String get uiPlay => 'เล่น';

  @override
  String get uiPause => 'หยุดชั่วคราว';

  @override
  String get uiDownload => 'ดาวน์โหลด';

  @override
  String get uiMoreActions => 'การดำเนินการเพิ่มเติม';

  @override
  String get uiUnsavedChanges => 'การเปลี่ยนแปลงที่ยังไม่ได้บันทึก';

  @override
  String get uiReset => 'รีเซ็ต';

  @override
  String get uiOpenColorPicker => 'เปิดตัวเลือกสี';

  @override
  String get uiSelectPlaceholder => 'เลือก';

  @override
  String get uiSearchPlaceholder => 'ค้นหา';

  @override
  String get uiNoOptionsFound => 'ไม่พบตัวเลือก';

  @override
  String get uiDismissNotification => 'ปิดการแจ้งเตือน';

  @override
  String get uiColorPickerTitle => 'ตัวเลือกสี';

  @override
  String get mentionConfirmTitle => 'กล่าวถึงทุกคนหรือไม่?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'การดำเนินการนี้จะแจ้งเตือนสมาชิก $count คน ดำเนินการต่อหรือไม่?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'การดำเนินการนี้จะแจ้งเตือนสมาชิกที่ออนไลน์อยู่ $count คน ดำเนินการต่อหรือไม่?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'การดำเนินการนี้จะแจ้งเตือนสมาชิก $count คนที่มีบทบาท $roleName ต่อไปไหม';
  }

  @override
  String get mentionConfirmButton => 'กล่าวถึง';

  @override
  String get composerEmojiUnavailable => 'คุณไม่สามารถใช้อีโมจินี้ที่นี่ได้';

  @override
  String get instanceUrlLabel => 'URL อินสแตนซ์';

  @override
  String get instanceUrlPlaceholder => 'ป้อน URL อินสแตนซ์ (เช่น fluxer.app)';

  @override
  String get instanceUrlHelper =>
      'ใช้ fluxer.app สำหรับอินสแตนซ์อย่างเป็นทางการ หรือ URL ที่ถูกต้องของอินสแตนซ์ที่โฮสต์เอง';

  @override
  String get resetToDefaultInstance => 'รีเซ็ตเป็น Fluxer';

  @override
  String get instanceConnect => 'เชื่อมต่อ';

  @override
  String get instanceConnecting => 'กำลังเชื่อมต่อ…';

  @override
  String get instanceConnectFailed => 'เชื่อมต่ออินสแตนซ์ไม่สำเร็จ';

  @override
  String get instanceInvalidDiscoveryResponse =>
      'This client cannot connect to this instance. The instance is likely out of date. If the instance is up to date, try updating this app.';

  @override
  String get recentInstances => 'อินสแตนซ์ล่าสุด';

  @override
  String removeRecentInstance(String domain) {
    return 'นำ $domain ออกจากอินสแตนซ์ล่าสุด';
  }

  @override
  String get instanceSheetTitle => 'เชื่อมต่อกับอินสแตนซ์';

  @override
  String get changeInstance => 'เปลี่ยน';

  @override
  String get instanceConnectionRequired =>
      'เชื่อมต่อกับอินสแตนซ์เพื่อลงชื่อเข้าใช้';

  @override
  String get comingSoon => 'เร็วๆ นี้';

  @override
  String get guildNavbarDirectMessages => 'ข้อความส่วนตัว';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'สำรวจชุมชนที่ค้นหาได้';

  @override
  String get discoveryExplore => 'สำรวจ';

  @override
  String get discoveryExplorePublicCommunities => 'สำรวจชุมชนสาธารณะ';

  @override
  String get discoveryListingSubheading =>
      'ต้องการลงรายการชุมชนของคุณที่นี่หรือไม่? สมัครหากคุณมีคุณสมบัติตรงตามข้อกำหนดใน การตั้งค่าชุมชน > การค้นพบ';

  @override
  String get discoverySearchCommunities => 'ค้นหาคอมมูนิตี้';

  @override
  String get discoveryFilterByLanguage => 'กรองตามภาษา';

  @override
  String get discoveryAllLanguages => 'ทุกภาษา';

  @override
  String get discoveryAllCategories => 'ทั้งหมด';

  @override
  String get discoveryCategoryGaming => 'เกม';

  @override
  String get discoveryCategoryMusic => 'เพลง';

  @override
  String get discoveryCategoryEntertainment => 'บันเทิง';

  @override
  String get discoveryCategoryEducation => 'การศึกษา';

  @override
  String get discoveryCategoryScienceAndTechnology => 'วิทยาศาสตร์และเทคโนโลยี';

  @override
  String get discoveryCategoryContentCreator => 'ผู้สร้างเนื้อหา';

  @override
  String get discoveryCategoryAnimeAndManga => 'อนิเมะและมังงะ';

  @override
  String get discoveryCategoryMoviesAndTv => 'ภาพยนตร์และทีวี';

  @override
  String get discoveryCategoryOther => 'อื่น ๆ';

  @override
  String get discoveryNoCommunitiesMatch => 'ไม่พบคอมมูนิตี้ที่ตรงกัน';

  @override
  String get discoveryJoinCommunity => 'เข้าร่วมคอมมูนิตี้';

  @override
  String get discoveryJoined => 'เข้าร่วมแล้ว';

  @override
  String discoveryOnlineCount(String count) {
    return '$count ออนไลน์';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString สมาชิก',
      one: 'สมาชิก 1 คน',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'ไม่มีคำอธิบาย';

  @override
  String get discoveryCommunities => 'คอมมูนิตี้';

  @override
  String get discoveryApps => 'แอป';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'ไม่สามารถเข้าร่วมคอมมูนิตี้นี้ได้';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'เกิดข้อผิดพลาด โปรดลองอีกครั้งในภายหลัง';

  @override
  String get discoveryJoinErrorFullTitle => 'คอมมูนิตี้นี้เต็มแล้ว';

  @override
  String get discoveryJoinErrorFullMessage =>
      'คอมมูนิตี้นี้มีสมาชิกเต็มแล้ว คุณจึงเข้าร่วมตอนนี้ไม่ได้';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'คุณถึงขีดจำกัดจำนวนคอมมูนิตี้แล้ว';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'คุณเข้าร่วมคอมมูนิตี้ครบจำนวนสูงสุดแล้ว ออกจากคอมมูนิตี้หนึ่งแล้วลองอีกครั้ง';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'คุณไม่สามารถเข้าร่วมคอมมูนิตี้นี้ได้';

  @override
  String get discoveryJoinErrorBannedMessage => 'คุณถูกแบนจากคอมมูนิตี้นี้แล้ว';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'คอมมูนิตี้นี้ไม่พร้อมใช้งานแล้ว';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'คอมมูนิตี้นี้อาจออกจาก Discovery หรือปิดรับสมาชิกใหม่ไปแล้ว รีเฟรชหน้านี้แล้วจะไม่เห็นอีก';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'คุณทำเร็วเกินไป';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'โปรดรอสักครู่แล้วลองอีกครั้ง';

  @override
  String get guildNavbarAddCommunity => 'เพิ่มคอมมูนิตี้';

  @override
  String get guildNavbarHelp => 'ช่วยเหลือ';

  @override
  String get scrollIndicatorNew => 'ใหม่';

  @override
  String get scrollIndicatorNewMessage => 'ข้อความใหม่';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'ยุบ $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'เลือกแล้ว';

  @override
  String get guildNavbarGuildUnread => 'ยังไม่ได้อ่าน';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count การกล่าวถึง',
      one: 'การกล่าวถึง 1 รายการ',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'ปิดเสียง';

  @override
  String get authShowPassword => 'แสดงรหัสผ่าน';

  @override
  String get authHidePassword => 'ซ่อนรหัสผ่าน';

  @override
  String get authCheckStillWorking => 'กำลังดำเนินการอยู่…';

  @override
  String get authVerificationFailed => 'ยืนยันตัวตนไม่สำเร็จ โปรดลองอีกครั้ง';

  @override
  String get chatLoadingMessages => 'กำลังโหลดข้อความ';

  @override
  String get friendsMessageFriend => 'ส่งข้อความ';

  @override
  String get friendsFriendActions => 'การดำเนินการของเพื่อน';

  @override
  String get friendsAcceptRequest => 'ตอบรับคำขอเป็นเพื่อน';

  @override
  String get friendsDeclineRequest => 'ปฏิเสธคำขอเป็นเพื่อน';

  @override
  String get friendsCancelRequest => 'ยกเลิกคำขอเป็นเพื่อน';

  @override
  String get friendsOpenInbox => 'กล่องข้อความ';

  @override
  String get profileRemoveFriend => 'ลบเพื่อน';

  @override
  String get profileUnblockUser => 'เลิกบล็อกผู้ใช้';

  @override
  String get profileAcceptFriendRequest => 'ตอบรับคำขอเป็นเพื่อน';

  @override
  String get profileCancelFriendRequest => 'ยกเลิกคำขอเป็นเพื่อน';

  @override
  String get profileSendFriendRequest => 'เพิ่มเพื่อน';

  @override
  String get accountOverflowMenu => 'ตัวเลือกบัญชี';

  @override
  String get navHome => 'หน้าหลัก';

  @override
  String get navNotifications => 'การแจ้งเตือน';

  @override
  String get navYou => 'คุณ';

  @override
  String get guildFolderSettingsTitle => 'การตั้งค่าโฟลเดอร์';

  @override
  String get guildFolderNameLabel => 'ชื่อโฟลเดอร์';

  @override
  String get guildFolderColorLabel => 'สีของโฟลเดอร์';

  @override
  String get guildFolderShowIconWhenCollapsed => 'แสดงไอคอนเมื่อยุบ';

  @override
  String get guildFolderIconLabel => 'ไอคอนโฟลเดอร์';

  @override
  String get guildFolderDelete => 'ลบโฟลเดอร์';

  @override
  String get guildFolderIconFolder => 'โฟลเดอร์';

  @override
  String get guildFolderIconStar => 'ดาว';

  @override
  String get guildFolderIconHeart => 'หัวใจ';

  @override
  String get guildFolderIconBookmark => 'บุ๊กมาร์ก';

  @override
  String get guildFolderIconGameController => 'จอยเกม';

  @override
  String get guildFolderIconShield => 'โล่';

  @override
  String get guildFolderIconMusicNote => 'โน้ตเพลง';

  @override
  String get guildFolderMarkAsRead => 'ทำเครื่องหมายโฟลเดอร์ว่าอ่านแล้ว';

  @override
  String get guildBulkMuteCommunities => 'ปิดเสียงคอมมูนิตี้ทั้งหมด';

  @override
  String get guildBulkUnmuteCommunities => 'เลิกปิดเสียงคอมมูนิตี้ทั้งหมด';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'การตั้งค่าการแจ้งเตือนของคอมมูนิตี้';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'การตั้งค่าความเป็นส่วนตัวของคอมมูนิตี้';

  @override
  String get guildBulkAllowEveryoneAndHere => 'อนุญาตให้ @everyone และ @here';

  @override
  String get guildBulkAllowRoleMentions => 'อนุญาตให้กล่าวถึงบทบาท';

  @override
  String get guildBulkEnableMobilePush => 'เปิดการแจ้งเตือนแบบพุชบนมือถือ';

  @override
  String get guildBulkDisableMobilePush => 'ปิดการแจ้งเตือนบนมือถือ';

  @override
  String get guildBulkAllowDirectMessages => 'อนุญาตข้อความส่วนตัว';

  @override
  String get guildBulkBlockDirectMessages => 'บล็อกข้อความส่วนตัว';

  @override
  String get guildBulkAllowBotDirectMessages => 'อนุญาตให้บอทส่งข้อความส่วนตัว';

  @override
  String get guildBulkBlockBotDirectMessages => 'บล็อกข้อความส่วนตัวจากบอท';

  @override
  String get guildNavbarGroupDm => 'แชทกลุ่ม';

  @override
  String get guildNavbarCreateChannel => 'สร้างช่อง';

  @override
  String get guildNavbarChannelType => 'ประเภทช่อง';

  @override
  String get guildNavbarTextChannel => 'ช่องข้อความ';

  @override
  String get guildNavbarTextChannelDescription =>
      'ส่งข้อความ รูปภาพ GIF และอิโมจิ';

  @override
  String get guildNavbarVoiceChannel => 'ช่องเสียง';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'พูดคุยกันด้วยเสียง วิดีโอ และการแชร์หน้าจอ';

  @override
  String get guildNavbarLinkChannel => 'ช่องลิงก์';

  @override
  String get guildNavbarLinkChannelDescription =>
      'เข้าถึงเว็บไซต์หรือแหล่งข้อมูลภายนอกได้อย่างรวดเร็ว';

  @override
  String get guildNavbarNameLabel => 'ชื่อ';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'เลือกประเภทช่อง';

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
  String get guildNavbarCreateCategory => 'สร้างหมวดหมู่';

  @override
  String get guildNavbarNewCategoryHint => 'หมวดหมู่ใหม่';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'ชวนเพื่อนมาที่ $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'ผู้รับจะถูกนำไปยัง #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'ค้นหาเพื่อน';

  @override
  String get guildNavbarNoFriendsYet => 'ยังไม่มีเพื่อน';

  @override
  String get guildNavbarNoResults => 'ไม่พบผลลัพธ์';

  @override
  String get guildNavbarInviteLinkPrompt => 'หรือส่งลิงก์เชิญให้เพื่อน:';

  @override
  String get guildNavbarInviteLink => 'ลิงก์เชิญ';

  @override
  String get guildNavbarCopy => 'คัดลอก';

  @override
  String get guildNavbarCopied => 'คัดลอกแล้ว!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'ลิงก์เชิญของคุณจะหมดอายุใน 7 วัน';

  @override
  String get guildNavbarInviteNeverExpires => 'ลิงก์เชิญนี้จะไม่มีวันหมดอายุ';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'ลิงก์เชิญของคุณจะหมดอายุใน $duration';
  }

  @override
  String get guildNavbarEditInviteLink => 'แก้ไขลิงก์เชิญ';

  @override
  String get guildNavbarInviteLinkSettings => 'การตั้งค่าลิงก์เชิญ';

  @override
  String get guildNavbarExpireAfter => 'หมดอายุใน';

  @override
  String get guildNavbarMaxUses => 'จำนวนครั้งที่ใช้ได้สูงสุด';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'ให้สิทธิ์เข้าเป็นสมาชิกชั่วคราว';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'สมาชิกจะถูกลบออกเมื่อออฟไลน์ เว้นแต่จะได้รับมอบหมายบทบาท';

  @override
  String get guildNavbarCreateNewLink => 'สร้างลิงก์ใหม่';

  @override
  String get guildNavbarSent => 'ส่งแล้ว';

  @override
  String get guildNavbarInvite => 'เชิญ';

  @override
  String get guildNavbarLeaveCommunityTitle => 'ออกจากคอมมูนิตี้';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'คุณแน่ใจหรือไม่ว่าต้องการออกจากชุมชนนี้? คุณจะไม่สามารถดูข้อความใดๆ ได้อีกต่อไป';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'ออกจากคอมมูนิตี้';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'ลบข้อความของคุณในคอมมูนิตี้นี้ใช่หรือไม่';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'ลบข้อความทั้งหมดที่คุณส่งที่นี่อย่างถาวร ในทุกช่อง จะไม่สามารถยกเลิกได้';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'ลบข้อความของฉัน';

  @override
  String get guildNavbarDeletedYourMessages => 'ลบข้อความของคุณแล้ว';

  @override
  String get guildNavbarCouldNotDeleteYourMessages => 'ลบข้อความของคุณไม่ได้';

  @override
  String get guildNavbarRemoveOverride => 'ลบการตั้งค่าเฉพาะ';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'ปิดเสียงจนถึง $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'เข้าถึงได้โดยเจ้าหน้าที่ $productName เท่านั้น';
  }

  @override
  String get guildNavbarInvitesPaused => 'ขณะนี้ปิดรับคำเชิญในคอมมูนิตี้นี้';

  @override
  String get guildNavbarDurationNever => 'ไม่หมดอายุ';

  @override
  String get guildNavbarDuration30Minutes => '30 นาที';

  @override
  String get guildNavbarDuration1Hour => '1 ชั่วโมง';

  @override
  String get guildNavbarDuration6Hours => '6 ชั่วโมง';

  @override
  String get guildNavbarDuration12Hours => '12 ชั่วโมง';

  @override
  String get guildNavbarDuration1Day => '1 วัน';

  @override
  String get guildNavbarDuration7Days => '7 วัน';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count วินาที';
  }

  @override
  String get guildNavbarNever => 'ไม่เลย';

  @override
  String get guildNavbarNoLimit => 'ไม่จำกัด';

  @override
  String get guildNavbarOneUse => 'ใช้ได้ 1 ครั้ง';

  @override
  String guildNavbarUses(int count) {
    return '$count ครั้ง';
  }

  @override
  String get guildMenuMarkAsRead => 'ทำเครื่องหมายว่าอ่านแล้ว';

  @override
  String get guildPeekMoreOptions => 'ตัวเลือกเพิ่มเติม';

  @override
  String get guildMenuInviteMembers => 'เชิญสมาชิก';

  @override
  String get guildMenuCommunitySettings => 'การตั้งค่าคอมมูนิตี้';

  @override
  String get guildMenuEditCommunityProfile => 'แก้ไขโปรไฟล์คอมมูนิตี้';

  @override
  String get guildMenuUnmuteCommunity => 'เลิกปิดเสียงคอมมูนิตี้';

  @override
  String get guildMenuMuteCommunity => 'ปิดเสียงคอมมูนิตี้';

  @override
  String get guildMenuHideMutedChannels => 'ซ่อนช่องที่ปิดเสียง';

  @override
  String get guildMenuDebugCommunity => 'ดีบักคอมมูนิตี้';

  @override
  String get guildMenuCopyCommunityId => 'คัดลอก ID คอมมูนิตี้';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'จนถึง $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'ทั่วไป';

  @override
  String get guildMenuSettingsRoles => 'บทบาทและสิทธิ์';

  @override
  String get guildMenuSettingsEmoji => 'อิโมจิ';

  @override
  String get guildMenuSettingsStickers => 'สติกเกอร์';

  @override
  String get guildMenuSettingsSafetyModeration => 'ความปลอดภัยและการกลั่นกรอง';

  @override
  String get guildMenuSettingsActivityLog => 'บันทึกกิจกรรม';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook';

  @override
  String get guildMenuSettingsDiscovery => 'Discovery';

  @override
  String get guildMenuSettingsMembers => 'สมาชิก';

  @override
  String get guildMenuSettingsInviteLinks => 'คำเชิญ';

  @override
  String get guildMenuSettingsBans => 'การแบน';

  @override
  String get guildMenuSettingsChannels => 'ช่อง';

  @override
  String get guildSettingsNoPermission => 'คุณไม่มีสิทธิ์ดูแท็บการตั้งค่านี้';

  @override
  String get guildSettingsOverviewIconTitle => 'ไอคอน';

  @override
  String get guildSettingsOverviewBannerTitle => 'แบนเนอร์';

  @override
  String get guildSettingsOverviewNameTitle => 'ชื่อ';

  @override
  String get guildSettingsOverviewNameHint => 'คอมมูนิตี้สุดเจ๋งของฉัน';

  @override
  String get guildSettingsCreateRole => 'สร้างบทบาท';

  @override
  String get guildSettingsRolesListTitle => 'บทบาท';

  @override
  String get guildSettingsRolesNewRole => 'บทบาทใหม่';

  @override
  String get guildSettingsRolesDeleteRole => 'ลบบทบาท';

  @override
  String get guildSettingsRolesBackToRoles => 'กลับไปที่บทบาท';

  @override
  String get guildSettingsBackToSettings => 'กลับไปที่การตั้งค่า';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'แก้ไข \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle => 'ตั้งค่าบทบาทและสิทธิ์';

  @override
  String get guildSettingsRolesDisplaySection => 'การแสดงผล';

  @override
  String get guildSettingsRolesRoleName => 'ชื่อบทบาท';

  @override
  String get guildSettingsRolesRoleColor => 'สีของบทบาท';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'พิมพ์สี (hex, rgb(), hsl() หรือชื่อ) หรือใช้เครื่องมือเลือกสี';

  @override
  String get guildSettingsRolesShowSeparately => 'แสดงบทบาทนี้แยกต่างหาก';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'แสดงสมาชิกที่มีบทบาทนี้ในส่วนของตนเองในรายการสมาชิก';

  @override
  String get guildSettingsRolesAllowMentions => 'อนุญาตให้กล่าวถึงบทบาทนี้';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'สมาชิกที่มีสิทธิ์ \"$permission\" สามารถกล่าวถึงบทบาทได้เสมอ โดยไม่คำนึงถึงการตั้งค่านี้';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'ใช้ปุ่มนี้เพื่อล้างสิทธิ์ทั้งหมดอย่างรวดเร็ว';

  @override
  String get guildSettingsRolesClearPermissions => 'ล้างสิทธิ์';

  @override
  String get guildSettingsRolesPermissionsSection => 'สิทธิ์';

  @override
  String get guildSettingsRolesSearchPermissions => 'ค้นหาสิทธิ์';

  @override
  String get guildSettingsRolesDenseLayout => 'เลย์เอาต์กระชับ';

  @override
  String get guildSettingsRolesComfyLayout => 'เลย์เอาต์ที่ดูสบายตา';

  @override
  String get guildSettingsRolesSingleColumn => 'คอลัมน์เดียว';

  @override
  String get guildSettingsRolesTwoColumns => 'สองคอลัมน์';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'ไม่พบสิทธิ์';

  @override
  String get guildSettingsRolesHoistOrder => 'ลำดับการแสดงแยก';

  @override
  String get guildSettingsRolesResetHoistOrder => 'รีเซ็ตเป็นค่าเริ่มต้น';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'ลากบทบาทเพื่อจัดเรียงลำดับการแสดงในรายการสมาชิก';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'ไม่มีบทบาทที่แสดงแยกกัน เปิดใช้ \"แสดงบทบาทนี้แยกกัน\" ในบทบาทเพื่อดูที่นี่';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'คุณต้องมีสิทธิ์ \"$permission\" เพื่อแก้ไขสิทธิ์เหล่านี้';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'คุณไม่สามารถแก้ไขบทบาทที่เท่ากันหรือสูงกว่าบทบาทสูงสุดของคุณได้';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'คุณไม่สามารถให้สิทธิ์ที่คุณไม่มีได้';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'คุณไม่สามารถลบสิทธิ์นี้ได้ เนื่องจากจะเป็นการลบสิทธิ์ออกจากตัวคุณเอง';

  @override
  String get guildSettingsRolesUpdatedSuccess => 'อัปเดตบทบาทสำเร็จแล้ว';

  @override
  String get guildSettingsRolesCreatedSuccess => 'สร้างบทบาทสำเร็จแล้ว';

  @override
  String get guildSettingsRolesDeletedSuccess => 'ลบบทบาทสำเร็จแล้ว';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'ลำดับการแสดงแยกกลับเป็นค่าเริ่มต้นแล้ว';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'ต้องระบุชื่อบทบาท';

  @override
  String get guildSettingsRolesNameRequiredBody => 'ตั้งชื่อบทบาทก่อนบันทึก';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'สร้างบทบาทไม่ได้';

  @override
  String get guildSettingsRolesUpdateFailedTitle => 'อัปเดตบทบาทไม่ได้';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'ลบบทบาทไม่ได้';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" ลบไม่ได้ ลองอีกครั้ง';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'รีเซ็ตลำดับการแสดงแยกไม่สำเร็จ';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'ลองอีกครั้งในอีกสักครู่';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการลบสิทธิ์ $name สมาชิกทุกคนที่มีสิทธิ์นี้จะไม่มีสิทธิ์อีกต่อไป';
  }

  @override
  String get permissionCategoryCommunityWide => 'ทั้งคอมมูนิตี้';

  @override
  String get permissionCategoryMessagesMedia => 'ข้อความและสื่อ';

  @override
  String get permissionCategoryModeration => 'การดูแล';

  @override
  String get permissionCategoryChannelAccess => 'การเข้าถึงช่อง';

  @override
  String get permissionCategoryChannelManagement => 'การจัดการช่อง';

  @override
  String get permissionCategoryAudioVideo => 'เสียงและวิดีโอ';

  @override
  String get permissionAdministrator => 'ผู้ดูแลระบบ';

  @override
  String get permissionAdministratorDescription =>
      'ให้สิทธิ์ทั้งหมดและข้ามข้อจำกัดของช่อง มีความละเอียดอ่อนสูง';

  @override
  String get permissionViewActivityLog => 'ดูบันทึกกิจกรรม';

  @override
  String get permissionViewActivityLogDescription =>
      'อ่านบันทึกกิจกรรมของคอมมูนิตี้เกี่ยวกับการเปลี่ยนแปลงและการดำเนินการดูแล';

  @override
  String get permissionManageCommunity => 'จัดการคอมมูนิตี้';

  @override
  String get permissionManageCommunityDescription =>
      'แก้ไขการตั้งค่าทั่วไป เช่น ชื่อ คำอธิบาย และไอคอน';

  @override
  String get permissionManageRoles => 'จัดการบทบาท';

  @override
  String get permissionManageRolesDescription =>
      'สร้าง แก้ไข หรือลบบทบาทที่ต่ำกว่าบทบาทสูงสุดของคุณ รวมถึงแก้ไขการแทนที่สิทธิ์ช่องได้ด้วย';

  @override
  String get permissionManageChannels => 'จัดการช่อง';

  @override
  String get permissionManageChannel => 'จัดการช่อง';

  @override
  String get permissionManageChannelDescription =>
      'เปลี่ยนชื่อและแก้ไขการตั้งค่าช่องนี้';

  @override
  String get permissionManagePermissions => 'จัดการสิทธิ์';

  @override
  String get permissionManagePermissionsDescription =>
      'แก้ไขการแทนที่สิทธิ์สำหรับบทบาทและสมาชิกในช่องนี้';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'สร้าง แก้ไข หรือลบ webhook สำหรับช่องนี้';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'ดูรายชื่อสมาชิกของช่องนี้';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'จัดการลิงก์เชิญสำหรับช่องนี้';

  @override
  String get permissionOverwriteDeny => 'ปฏิเสธ';

  @override
  String get permissionOverwriteInherit => 'เป็นกลาง (สืบทอดค่า)';

  @override
  String get permissionOverwriteAllow => 'อนุญาต';

  @override
  String get permissionOverwriteSetAllHelp =>
      'ใช้ปุ่มเหล่านี้เพื่อตั้งค่าสิทธิ์ทั้งหมดอย่างรวดเร็ว';

  @override
  String get permissionManageChannelsDescription =>
      'สร้าง แก้ไข หรือลบช่องและหมวดหมู่';

  @override
  String get permissionKickMembers => 'เตะสมาชิกออก';

  @override
  String get permissionBanMembers => 'แบนสมาชิก';

  @override
  String get permissionCreateInviteLinks => 'สร้างลิงก์เชิญ';

  @override
  String get permissionChangeOwnNickname => 'เปลี่ยนชื่อเล่นของตัวเอง';

  @override
  String get permissionChangeOwnNicknameDescription => 'อัปเดตชื่อเล่นของคุณ';

  @override
  String get permissionManageNicknames => 'จัดการชื่อเล่น';

  @override
  String get permissionManageNicknamesDescription =>
      'เปลี่ยนชื่อเล่นของสมาชิกคนอื่น';

  @override
  String get permissionCreateEmojiStickers => 'สร้างอิโมจิและสติกเกอร์';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'อัปโหลดอิโมจิและสติกเกอร์ใหม่ รวมถึงจัดการผลงานของคุณเอง';

  @override
  String get permissionManageEmojiStickers => 'จัดการอิโมจิและสติกเกอร์';

  @override
  String get permissionManageEmojiStickersDescription =>
      'แก้ไขหรือลบอิโมจิและสติกเกอร์ที่สมาชิกคนอื่นสร้างไว้';

  @override
  String get permissionManageWebhooks => 'จัดการ webhook';

  @override
  String get permissionManageWebhooksDescription =>
      'สร้าง แก้ไข หรือลบ webhook';

  @override
  String get permissionSendMessages => 'ส่งข้อความ';

  @override
  String get permissionSendTtsMessages => 'ส่งข้อความ TTS';

  @override
  String get permissionSendTtsMessagesDescription => 'ส่งข้อความเสียงพูด';

  @override
  String get permissionManageMessages => 'จัดการข้อความ';

  @override
  String get permissionManageMessagesDescription =>
      'ลบข้อความของสมาชิกคนอื่นได้ การปักหมุดข้อความจะถูกควบคุมแยกต่างหาก';

  @override
  String get permissionPinMessages => 'ปักหมุดข้อความ';

  @override
  String get permissionEmbedLinks => 'ฝังลิงก์';

  @override
  String get permissionAttachFiles => 'แนบไฟล์';

  @override
  String get permissionMentionEveryone => 'ใช้ @everyone/@here และ @role';

  @override
  String get permissionMentionEveryoneDescription =>
      'กล่าวถึงทุกคนหรือบทบาทใดก็ได้ (แม้ว่าบทบาทนั้นจะไม่ได้ตั้งค่าให้กล่าวถึงได้ก็ตาม)';

  @override
  String get permissionUseExternalEmoji => 'ใช้อิโมจิจากภายนอก';

  @override
  String get permissionUseExternalEmojiDescription =>
      'ใช้อิโมจิจากคอมมูนิตี้อื่น';

  @override
  String get permissionUseExternalStickers => 'ใช้สติกเกอร์จากภายนอก';

  @override
  String get permissionAddReactions => 'เพิ่มรีแอ็กชัน';

  @override
  String get permissionAddReactionsDescription =>
      'เพิ่มรีแอ็กชันใหม่ให้ข้อความ';

  @override
  String get permissionBypassSlowmode => 'ข้ามโหมดจำกัดเวลา';

  @override
  String get permissionBypassSlowmodeDescription =>
      'ข้ามการจำกัดอัตราการส่งข้อความของแต่ละช่อง';

  @override
  String get permissionTimeOutMembers => 'พักการใช้งานสมาชิกชั่วคราว';

  @override
  String get permissionTimeOutMembersDescription =>
      'ระงับไม่ให้สมาชิกส่งข้อความ แสดงรีแอ็กชัน และเข้าร่วมช่องเสียงตามระยะเวลาที่กำหนด';

  @override
  String get permissionViewChannel => 'ดูช่อง';

  @override
  String get permissionViewChannelMembers => 'ดูสมาชิกช่อง';

  @override
  String get permissionViewChannelMembersDescription =>
      'ดูรายชื่อสมาชิกของช่องต่างๆ ในคอมมูนิตี้นี้';

  @override
  String get permissionConnect => 'เชื่อมต่อ';

  @override
  String get permissionSpeak => 'พูด';

  @override
  String get permissionStreamVideo => 'สตรีมวิดีโอ';

  @override
  String get permissionUseVoiceActivity => 'ใช้การตรวจจับเสียงพูด';

  @override
  String get permissionUseVoiceActivityDescription =>
      'หากไม่มีสิทธิ์นี้ จะต้องใช้การกดเพื่อพูด';

  @override
  String get permissionPrioritySpeaker => 'ผู้พูดสำคัญ';

  @override
  String get permissionMuteMembers => 'ปิดไมโครโฟนของสมาชิก';

  @override
  String get permissionDeafenMembers => 'ปิดเสียงทั้งหมดของสมาชิก';

  @override
  String get permissionMoveMembers => 'ย้ายสมาชิก';

  @override
  String get permissionMoveMembersDescription =>
      'ลากสมาชิกไปยังช่องอื่นที่พวกเขาสามารถเข้าถึงได้';

  @override
  String get permissionSetVoiceRegion => 'ตั้งค่าภูมิภาคเสียง';

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
  String get guildSettingsEmojiEmpty => 'ยังไม่มีอิโมจิที่กำหนดเอง';

  @override
  String get guildSettingsStickersEmpty => 'ยังไม่มีสติกเกอร์ที่กำหนดเอง';

  @override
  String get guildSettingsModerationVerificationTitle => 'การยืนยันตัวตนสมาชิก';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'เลือกสิ่งที่สมาชิกต้องมีก่อนที่จะโพสต์หรือส่งข้อความส่วนตัวถึงสมาชิกในคอมมูนิตี้ได้';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'สมาชิกที่มีบทบาทสามารถข้ามการตรวจสอบเหล่านี้ได้ สำหรับพื้นที่สาธารณะ เราแนะนำให้เปิดใช้งานการยืนยัน';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'ชุมชนที่แสดงใน Discovery ต้องมีอีเมลที่ยืนยันแล้วเป็นอย่างน้อย ไม่สามารถเลือก \'ไม่มี\' ได้ในขณะที่เปิดใช้งาน Discovery';

  @override
  String get guildSettingsModerationMatureTitle =>
      'เนื้อหาสำหรับผู้ใหญ่และคำเตือนเนื้อหา';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'กำหนดการติดป้ายเนื้อหาสำหรับผู้ใหญ่และการเตือนเนื้อหาที่เป็นทางเลือกสำหรับสมาชิก';

  @override
  String get guildSettingsModerationMatureToggle => 'เนื้อหาสำหรับผู้ใหญ่';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'ทำเครื่องหมายว่าชุมชนนี้มีเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get guildSettingsVerificationNone => 'ไม่มี';

  @override
  String get guildSettingsVerificationNoneDescription => 'ไม่ต้องยืนยันตัวตน';

  @override
  String get guildSettingsVerificationLow => 'ต่ำ';

  @override
  String get guildSettingsVerificationLowDescription =>
      'ต้องมีที่อยู่อีเมลที่ยืนยันแล้ว';

  @override
  String get guildSettingsVerificationMedium => 'ปานกลาง';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'ต้องมีที่อยู่อีเมลที่ยืนยันแล้ว และบัญชีที่มีอายุอย่างน้อย 5 นาที';

  @override
  String get guildSettingsVerificationHigh => 'สูง';

  @override
  String get guildSettingsVerificationHighDescription =>
      'ต้องมีทุกอย่างเหมือนระดับกลาง และเป็นสมาชิกของคอมมูนิตี้มาแล้วอย่างน้อย 10 นาที';

  @override
  String get guildSettingsAuditLogDescription =>
      'ติดตามการดำเนินการของผู้ดูแลทั่วทั้งคอมมูนิตี้';

  @override
  String get guildSettingsAuditLogEmpty => 'ยังไม่มีบันทึก';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'การดำเนินการดูแลและการเปลี่ยนแปลงคอมมูนิตี้จะแสดงที่นี่';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'ผู้ใช้ทั้งหมด';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'ทุกการกระทำ';

  @override
  String get guildSettingsAuditLogNoReason => 'ไม่มีการระบุเหตุผล';

  @override
  String get guildSettingsAuditLogUnknownUser => 'ผู้ใช้ที่ไม่รู้จัก';

  @override
  String get guildSettingsAuditLogReason => 'เหตุผล';

  @override
  String get guildSettingsAuditLogSomeone => 'ใครบางคน';

  @override
  String get guildSettingsAuditLogSomething => 'บางสิ่งบางอย่าง';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'เอนทิตีที่ไม่รู้จัก';

  @override
  String get guildSettingsAuditLogNothing => 'ไม่มีอะไร';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'เป้าหมายที่ไม่รู้จัก';

  @override
  String get auditLogActionGuildUpdate => 'อัปเดตคอมมูนิตี้แล้ว';

  @override
  String get auditLogActionChannelCreate => 'สร้างช่องแล้ว';

  @override
  String get auditLogActionChannelUpdate => 'อัปเดตช่องแล้ว';

  @override
  String get auditLogActionChannelDelete => 'ช่องถูกลบแล้ว';

  @override
  String get auditLogActionThreadCreate => 'Thread created';

  @override
  String get auditLogActionThreadUpdate => 'Thread updated';

  @override
  String get auditLogActionThreadDelete => 'Thread deleted';

  @override
  String get auditLogActionChannelOverwriteCreate => 'เพิ่มการเขียนทับช่อง';

  @override
  String get auditLogActionChannelOverwriteUpdate => 'อัปเดตการเขียนทับช่อง';

  @override
  String get auditLogActionChannelOverwriteDelete => 'ลบการเขียนทับช่อง';

  @override
  String get auditLogActionMemberKick => 'เตะสมาชิกออกแล้ว';

  @override
  String get auditLogActionMemberPrune => 'สมาชิกถูกลบ';

  @override
  String get auditLogActionMemberBanAdd => 'แบนสมาชิกแล้ว';

  @override
  String get auditLogActionMemberBanRemove => 'ยกเลิกแบนสมาชิกแล้ว';

  @override
  String get auditLogActionMemberUpdate => 'อัปเดตสมาชิกแล้ว';

  @override
  String get auditLogActionMemberRoleUpdate => 'อัปเดตบทบาทสมาชิกแล้ว';

  @override
  String get auditLogActionMemberMove => 'ย้ายสมาชิกแล้ว';

  @override
  String get auditLogActionMemberDisconnect => 'ตัดการเชื่อมต่อสมาชิกแล้ว';

  @override
  String get auditLogActionBotAdd => 'เพิ่มบอทแล้ว';

  @override
  String get auditLogActionRoleCreate => 'สร้างบทบาทแล้ว';

  @override
  String get auditLogActionRoleUpdate => 'อัปเดตบทบาทแล้ว';

  @override
  String get auditLogActionRoleDelete => 'ลบบทบาทแล้ว';

  @override
  String get auditLogActionInviteCreate => 'สร้างคำเชิญแล้ว';

  @override
  String get auditLogActionInviteUpdate => 'อัปเดตคำเชิญแล้ว';

  @override
  String get auditLogActionInviteDelete => 'ลบคำเชิญแล้ว';

  @override
  String get auditLogActionWebhookCreate => 'สร้าง webhook แล้ว';

  @override
  String get auditLogActionWebhookUpdate => 'อัปเดต webhook แล้ว';

  @override
  String get auditLogActionWebhookDelete => 'ลบ webhook แล้ว';

  @override
  String get auditLogActionEmojiCreate => 'สร้างอิโมจิแล้ว';

  @override
  String get auditLogActionEmojiUpdate => 'อัปเดตอิโมจิแล้ว';

  @override
  String get auditLogActionEmojiDelete => 'ลบอิโมจิแล้ว';

  @override
  String get auditLogActionStickerCreate => 'สร้างสติกเกอร์แล้ว';

  @override
  String get auditLogActionStickerUpdate => 'อัปเดตสติกเกอร์แล้ว';

  @override
  String get auditLogActionStickerDelete => 'ลบสติกเกอร์แล้ว';

  @override
  String get auditLogActionMessageDelete => 'ลบข้อความแล้ว';

  @override
  String get auditLogActionMessageBulkDelete => 'ลบข้อความหลายรายการแล้ว';

  @override
  String get auditLogActionMessagePin => 'ปักหมุดข้อความแล้ว';

  @override
  String get auditLogActionMessageUnpin => 'เลิกปักหมุดข้อความแล้ว';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor อัปเดตการตั้งค่าชุมชนแล้ว';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor สร้างช่อง $target แล้ว';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor อัปเดตช่อง $target แล้ว';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor ลบช่อง $target แล้ว';
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
    return '$actor เพิ่มสิทธิ์ช่องสำหรับ $target แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor เพิ่มสิทธิ์ช่องสำหรับ $target ในช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor อัปเดตสิทธิ์ช่องสำหรับ $target แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor อัปเดตสิทธิ์ช่องสำหรับ $target ในช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor ลบสิทธิ์ช่องสำหรับ $target แล้ว';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ลบสิทธิ์ช่องสำหรับ $target ในช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor เตะ $target ออกแล้ว';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor แบน $target แล้ว';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor เลิกแบน $target แล้ว';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor อัปเดต $target แล้ว';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor อัปเดตบทบาทสำหรับ $target แล้ว';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor ลบสมาชิกที่ไม่มีความเคลื่อนไหวแล้ว';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor ลบสมาชิกที่ไม่มีความเคลื่อนไหวเป็นเวลา $days วันแล้ว';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor ย้าย $target ไปยังช่องเสียงอื่นแล้ว';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ย้าย $target ไปยังช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor ตัดการเชื่อมต่อเสียงของ $target แล้ว';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor เพิ่มบอท $target แล้ว';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor สร้างบทบาท $target แล้ว';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor อัปเดตบทบาท $target แล้ว';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor ลบบทบาท $target แล้ว';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor สร้างคำเชิญ $target แล้ว';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor สร้างคำเชิญ $target สำหรับช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor อัปเดตคำเชิญ $target แล้ว';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor อัปเดตคำเชิญ $target สำหรับช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor ลบคำเชิญ $target แล้ว';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor ลบคำเชิญ $target สำหรับช่อง $channel แล้ว';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor สร้างเว็บฮุค $target แล้ว';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor อัปเดตเว็บฮุค $target แล้ว';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor ลบเว็บฮุค $target แล้ว';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor เพิ่มอิโมจิ $target';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor อัปเดตอิโมจิ $target';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor ลบอิโมจิ $target';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor เพิ่มสติกเกอร์ $target';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor อัปเดตสติกเกอร์ $target';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor ลบสติกเกอร์ $target';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor ลบข้อความ';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor ลบข้อความใน $channel';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor ลบข้อความหลายรายการ';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor ลบข้อความ $count รายการ';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor ลบข้อความหลายรายการใน $channel';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor ลบข้อความ $count รายการใน $channel';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor ปักหมุดข้อความ';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor ปักหมุดข้อความใน $channel';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor เลิกปักหมุดข้อความ';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor เลิกปักหมุดข้อความใน $channel';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor ดำเนินการตรวจสอบบน $target';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'อัปเดต $field จาก $oldValue เป็น $newValue';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'ตั้งค่า $field เป็น $newValue';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'ล้าง $field (เดิมคือ $oldValue)';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'อัปเดต $field';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'เปลี่ยนชื่อชุมชนเป็น $name';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon => 'อัปเดตไอคอนชุมชน';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'เปลี่ยนชื่อช่องเป็น $name';
  }

  @override
  String get auditLogChangeClearedTopic => 'ล้างหัวข้อ';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'อัปเดตหัวข้อเป็น $topic';
  }

  @override
  String get auditLogChangeEnabledMatureContent =>
      'เปิดใช้งานเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get auditLogChangeDisabledMatureContent =>
      'ปิดใช้งานเนื้อหาสำหรับผู้ใหญ่';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'ตั้งชื่อเล่นเป็น $nickname';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'ลบชื่อเล่น $nickname';
  }

  @override
  String get auditLogChangeMutedMember => 'ปิดเสียงสมาชิก';

  @override
  String get auditLogChangeUnmutedMember => 'เปิดเสียงสมาชิก';

  @override
  String get auditLogChangeDeafenedMember => 'ปิดเสียงสมาชิก (ห้ามได้ยิน)';

  @override
  String get auditLogChangeUndeafenedMember => 'เปิดเสียงสมาชิก (ให้ได้ยิน)';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'เพิ่ม $roles';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'ลบ $roles';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'ช่อง: $value';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'ข้อความ: $value';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'ได้รับเชิญจาก $value';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบข้อความ # รายการ',
      one: 'ลบข้อความ # รายการ',
    );
    return '$_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ลบสมาชิก # รายการ',
      one: 'ลบสมาชิก # รายการ',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires => 'คำเชิญนี้ไม่มีวันหมดอายุ';

  @override
  String get auditLogOptionTemporaryMembership =>
      'ให้สิทธิ์การเป็นสมาชิกชั่วคราว';

  @override
  String get auditLogOptionPermanentMembership => 'ให้สิทธิ์การเป็นสมาชิกถาวร';

  @override
  String get guildSettingsWebhooksDescription =>
      'ดูและจัดการ webhook ทั้งหมดที่ตั้งค่าไว้ในคอมมูนิตี้ของคุณ';

  @override
  String get guildSettingsWebhooksEmpty => 'ไม่มี webhook';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'ชุมชนนี้ยังไม่มีเว็บฮุคเลย ไปที่ $channelSettingsPath เพื่อสร้างเว็บฮุค';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'คุณต้องมีสิทธิ์ \"$permission\" เพื่อดูและแก้ไขเว็บฮุกสำหรับชุมชนนี้';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'โหลด webhook ไม่สำเร็จ';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'เกิดข้อผิดพลาดในการโหลด webhook ลองอีกครั้ง';

  @override
  String get guildSettingsWebhooksUpdated => 'อัปเดต webhook แล้ว';

  @override
  String get guildSettingsWebhooksUpdateFailed => 'อัปเดต webhook ไม่สำเร็จ';

  @override
  String get guildSettingsUnknownChannel => 'ช่องที่ไม่รู้จัก';

  @override
  String get guildSettingsCopiedUrl => 'คัดลอก URL ไปยังคลิปบอร์ดแล้ว';

  @override
  String get guildSettingsDiscoveryDescription =>
      'แสดงคอมมูนิตี้ของคุณใน Discovery เพื่อให้คนอื่นค้นหาและเข้าร่วมได้';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle => 'สมาชิกไม่พอ';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'ชุมชนของคุณต้องมีสมาชิกอย่างน้อย $count คนก่อนจึงจะสามารถแสดงใน Discovery ได้';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'สถานะ:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'รอดำเนินการ';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'อนุมัติแล้ว';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'ถูกปฏิเสธ';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'นำออกแล้ว';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'เหตุผล: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'คอมมูนิตี้ของคุณแสดงอยู่ใน Discovery แล้ว คุณสามารถอัปเดตรายละเอียดประกาศด้านล่าง หรือถอนออกเพื่อนำรายการออกก็ได้';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'ใบสมัครของคุณอยู่ระหว่างการตรวจสอบ คุณยังสามารถอัปเดตรายละเอียดประกาศหรือถอนใบสมัครได้';

  @override
  String get guildSettingsDiscoveryCategory => 'หมวดหมู่';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'เลือกหมวดหมู่ที่ตรงกับคอมมูนิตี้ของคุณมากที่สุด เปลี่ยนได้ทุกเมื่อ';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'ภาษาหลัก';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'ภาษาที่คนส่วนใหญ่ในคอมมูนิตี้ของคุณใช้ ใช้เพื่อกรองผลลัพธ์ใน Discovery';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'คำอธิบาย';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'อธิบายเกี่ยวกับคอมมูนิตี้ของคุณ';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'ต้องระบุคำอธิบาย';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'คำอธิบายต้องมีความยาวอย่างน้อย $minLength ตัวอักษร';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'คำอธิบายต้องไม่เกิน $maxLength ตัวอักษร';
  }

  @override
  String get guildSettingsDiscoveryTags => 'แท็กที่กำหนดเอง';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'แท็กสูงสุด $maxTags แท็กจะช่วยให้ผู้คนค้นหาชุมชนของคุณได้ แท็กเหล่านี้จะแสดงในการค้นหาของ Discovery';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'เพิ่มแท็กแล้วกด Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'เพิ่ม';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'ลบแท็ก $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'เพิ่มแท็กไม่ได้';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'แท็กต้องมีความยาว 2 ถึง $maxLength ตัวอักษร และเป็นตัวอักษรหรือตัวเลขเท่านั้น';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'คุณสามารถเพิ่มแท็กได้สูงสุด $maxTags แท็กเท่านั้น';
  }

  @override
  String get guildSettingsDiscoveryApply => 'ใช้';

  @override
  String get guildSettingsDiscoverySave => 'บันทึก';

  @override
  String get guildSettingsDiscoveryWithdraw => 'ถอนคำขอ';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'ส่งใบสมัคร Discovery แล้ว';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'อัปเดตรายการ Discovery แล้ว';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'ถอนใบสมัคร Discovery แล้ว';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle => 'ถอนใบสมัครไม่ได้';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'ลองอีกครั้งในอีกสักครู่';

  @override
  String get guildSettingsMembersSearchHint => 'ค้นหาด้วยชื่อผู้ใช้หรือ ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return 'สมาชิก $count คน';
  }

  @override
  String get guildMembersRecentTitle => 'สมาชิกล่าสุด';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'แสดงสมาชิก $displayedCount จากทั้งหมด $totalCount คน';
  }

  @override
  String get guildMembersSort => 'จัดเรียง';

  @override
  String get guildSettingsMembersSortNewest => 'ใหม่สุดขึ้นก่อน';

  @override
  String get guildMembersSortOldest => 'เก่าสุดขึ้นก่อน';

  @override
  String get guildMembersColumnName => 'ชื่อ';

  @override
  String get guildMembersColumnMemberSince => 'สมาชิกตั้งแต่';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'เข้าร่วม $productName เมื่อ';
  }

  @override
  String get guildMembersColumnJoinMethod => 'วิธีเข้าร่วม';

  @override
  String get guildMembersColumnRoles => 'บทบาท';

  @override
  String get guildMembersFilterMemberSince => 'กรองตามวันที่เป็นสมาชิก';

  @override
  String get guildMembersFilterJoinedProduct => 'กรองตามวันที่สร้างบัญชี';

  @override
  String get guildMembersFilterJoinMethod => 'กรองตามวิธีเข้าร่วม';

  @override
  String get guildMembersFilterRoles => 'กรองตามบทบาท';

  @override
  String get guildMembersFilterAll => 'ทั้งหมด';

  @override
  String get guildMembersFilterPast1Hour => '1 ชั่วโมงที่ผ่านมา';

  @override
  String get guildMembersFilterPast24Hours => '24 ชั่วโมงที่ผ่านมา';

  @override
  String get guildMembersFilterPast7Days => '7 วันที่ผ่านมา';

  @override
  String get guildMembersFilterPast2Weeks => '2 สัปดาห์ที่ผ่านมา';

  @override
  String get guildMembersFilterPast3Weeks => '3 สัปดาห์ที่ผ่านมา';

  @override
  String get guildMembersFilterPast4Weeks => '4 สัปดาห์ที่ผ่านมา';

  @override
  String get guildMembersFilterPast3Months => '3 เดือนที่ผ่านมา';

  @override
  String get guildMembersFilterCustomRange => 'กำหนดช่วงเอง...';

  @override
  String get guildMembersDateRangeTitle => 'กำหนดช่วงวันที่เอง';

  @override
  String get guildMembersDateAfter => 'หลังวันที่';

  @override
  String get guildMembersDateBefore => 'ก่อนวันที่';

  @override
  String get guildMembersClearAll => 'ล้างทั้งหมด';

  @override
  String get guildMembersRowsPerPage => 'จำนวนแถวต่อหน้า';

  @override
  String get guildMembersEmptySearch => 'ไม่มีใครตรงกับการค้นหานั้น';

  @override
  String get guildMembersLoadError =>
      'เกิดข้อผิดพลาดขณะโหลดสมาชิก โปรดลองอีกครั้งในภายหลัง';

  @override
  String get guildMembersIndexing => 'กำลังจัดทำดัชนีสมาชิก…';

  @override
  String get guildMembersJoinSourceCreator => 'ผู้สร้างคอมมูนิตี้';

  @override
  String get guildMembersJoinSourceInvite => 'เชิญ';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'เชิญ ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'ได้รับเชิญจาก $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL ที่กำหนดเอง';

  @override
  String get guildMembersJoinSourceBotInvite => 'คำเชิญบอท';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'ผู้ดูแลแพลตฟอร์ม';

  @override
  String get guildMembersJoinSourceDiscovery => 'Discovery';

  @override
  String get guildMembersJoinMethodUnknown => 'ไม่ทราบ';

  @override
  String get guildMembersCommunityOwner => 'เจ้าของคอมมูนิตี้';

  @override
  String get guildMembersViewAllRoles => 'ดูบทบาททั้งหมด';

  @override
  String get guildMembersJoinedJustNow => 'เมื่อสักครู่';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count นาทีที่แล้ว',
      one: '1 นาทีที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ชั่วโมงที่แล้ว',
      one: '1 ชั่วโมงที่แล้ว',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'สมาชิก';

  @override
  String get guildSettingsInvitesTitle => 'คำเชิญ';

  @override
  String get guildSettingsInvitesDescription =>
      'ดูคำเชิญทั้งหมดสำหรับคอมมูนิตี้นี้ หากต้องการสร้างคำเชิญใหม่ ให้ไปที่ช่องและใช้ปุ่มเชิญ';

  @override
  String get guildSettingsInvitesEmpty => 'ไม่มีลิงก์เชิญ';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'คอมมูนิตี้นี้ยังไม่มีลิงก์เชิญ ไปที่ช่องแล้วสร้างลิงก์เชิญเพื่อเชิญผู้คน';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'โหลดคำเชิญไม่สำเร็จ';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'เกิดข้อผิดพลาดในการโหลดคำเชิญ ลองอีกครั้ง';

  @override
  String get guildSettingsInvitesTryAgain => 'ลองอีกครั้ง';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'แสดงวันที่สร้างแทนวันหมดอายุ';

  @override
  String get guildSettingsInvitesPauseInvites => 'หยุดคำเชิญชั่วคราว';

  @override
  String get guildSettingsInvitesEnableInvites => 'เปิดใช้งานคำเชิญ';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'หยุดคำเชิญสำหรับคอมมูนิตี้นี้ชั่วคราว';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'เปิดใช้งานคำเชิญสำหรับคอมมูนิตี้นี้';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'หยุดคำเชิญชั่วคราวใช่ไหม ผู้ใช้ใหม่จะไม่สามารถเข้าร่วมผ่านลิงก์เชิญได้จนกว่าคุณจะเปิดใช้งานอีกครั้ง สมาชิกปัจจุบันจะไม่ได้รับผลกระทบ';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'เปิดใช้งานคำเชิญใช่ไหม ผู้ใช้จะสามารถเข้าร่วมคอมมูนิตี้นี้ผ่านลิงก์เชิญได้อีกครั้ง';

  @override
  String get guildSettingsInvitesPause => 'หยุดชั่วคราว';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'ปิดรับคำเชิญสำหรับคอมมูนิตี้นี้ชั่วคราว';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'คำเชิญถูกหยุดชั่วคราวเนื่องจาก $productName ตรวจพบการโจมตีที่อาจเกิดขึ้น ผู้ใช้ใหม่ไม่สามารถเข้าร่วมได้ในขณะนี้';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'ผู้เชิญ:';

  @override
  String get guildSettingsInvitesLabelChannel => 'ช่อง:';

  @override
  String get guildSettingsInvitesLabelCode => 'รหัส:';

  @override
  String get guildSettingsInvitesLabelUses => 'จำนวนครั้งที่ใช้:';

  @override
  String get guildSettingsInvitesLabelCreated => 'สร้างเมื่อ:';

  @override
  String get guildSettingsInvitesLabelExpires => 'หมดอายุ:';

  @override
  String get guildSettingsInvitesUnknown => 'ไม่ทราบ';

  @override
  String get guildSettingsInvitesNoCategory => 'ไม่มีหมวดหมู่';

  @override
  String get guildSettingsInvitesExpired => 'หมดอายุแล้ว';

  @override
  String get guildSettingsInvitesNever => 'ไม่เลย';

  @override
  String get guildSettingsInvitesCopyLink => 'คัดลอกลิงก์เชิญ';

  @override
  String get guildSettingsInvitesRevoke => 'เพิกถอนคำเชิญ';

  @override
  String get guildSettingsInvitesRevokeFailedTitle => 'ยกเลิกคำเชิญไม่ได้';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'ลิงก์อาจยังใช้งานได้ ลองอีกครั้งในอีกสักครู่';

  @override
  String get guildSettingsBansDescription => 'ดูและจัดการผู้ใช้ที่ถูกแบน';

  @override
  String get guildSettingsBansSearchHint => 'ค้นหาผู้ที่ถูกแบน';

  @override
  String get guildSettingsBansEmpty => 'ไม่มีผู้ใช้ที่ถูกแบน';

  @override
  String get guildSettingsBanExpiresLabel => 'หมดอายุ';

  @override
  String get guildSettingsBansNoSearchResults =>
      'ไม่พบการแบนที่ตรงกับการค้นหาของคุณ';

  @override
  String get guildSettingsBanDetailsTitle => 'รายละเอียดการแบน';

  @override
  String get guildSettingsBanViewDetails => 'ดูรายละเอียด';

  @override
  String get guildSettingsBannedOn => 'แบนเมื่อ';

  @override
  String get guildSettingsBannedBy => 'แบนโดย';

  @override
  String get guildSettingsRevokeBanTitle => 'ยกเลิกแบน';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'คุณแน่ใจหรือไม่ว่าต้องการเพิกถอนการแบน $displayName? พวกเขาจะสามารถกลับเข้าร่วมชุมชนได้';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'เพิกถอนการแบนสำหรับ $displayName แล้ว';
  }

  @override
  String get guildSettingsRevokeBanError =>
      'ไม่สามารถเพิกถอนการแบนได้ ลองอีกครั้ง';

  @override
  String get guildSettingsCommunitySettings => 'การตั้งค่าคอมมูนิตี้';

  @override
  String get guildSettingsDeleteCommunity => 'ลบคอมมูนิตี้';

  @override
  String get guildSettingsDeleteCommunityConfirm =>
      'คุณแน่ใจหรือไม่ว่าต้องการลบคอมมูนิตี้นี้ การดำเนินการนี้ไม่สามารถยกเลิกได้ ทุกช่อง ข้อความ และการตั้งค่าจะถูกลบอย่างถาวร';

  @override
  String get guildSettingsCommunityDeleted => 'ลบคอมมูนิตี้แล้ว';

  @override
  String get guildSettingsDeleteCommunityFailed =>
      'ไม่สามารถลบคอมมูนิตี้นี้ได้';

  @override
  String get guildSettingsCategoryExpressions => 'EXPRESSIONS';

  @override
  String get guildSettingsCategoryCommunity => 'COMMUNITY';

  @override
  String get guildSettingsCategoryIntegrations => 'INTEGRATIONS';

  @override
  String get guildSettingsCategoryPeople => 'PEOPLE';

  @override
  String get guildSettingsOverviewBrandingTitle => 'แบรนด์';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'อัปเดตไอคอน ชื่อ แบนเนอร์ และพื้นหลังคำเชิญของคุณ';

  @override
  String get guildSettingsOverviewBannerUpload => 'อัปโหลดแบนเนอร์';

  @override
  String get guildSettingsOverviewIdleTitle => 'การตั้งค่าเมื่อไม่ได้ใช้งาน';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'กำหนดค่าช่อง AFK และหมดเวลา';

  @override
  String get guildSettingsOverviewSystemTitle => 'ระบบและข้อความต้อนรับ';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'เลือกปลายทางสำหรับข้อความระบบและการต้อนรับ';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'การแจ้งเตือนเริ่มต้น';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'คอมมูนิตี้ที่มีสมาชิกมากกว่า 250 คนจะถูกตั้งค่าเป็น \"เฉพาะเมื่อถูกกล่าวถึง\" โดยอัตโนมัติ การตั้งค่าเดิมของคุณจะยังคงอยู่และจะกลับมาใช้เมื่อจำนวนสมาชิกในคอมมูนิตี้ลดลงต่ำกว่า 250 คน';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'อนุญาตให้ตั้งชื่อช่องข้อความได้อย่างยืดหยุ่น';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'ซ่อนมงกุฎเจ้าของคอมมูนิตี้';

  @override
  String get guildSettingsOverviewDetachedBanner => 'แบนเนอร์แยกส่วน';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'แสดงแบนเนอร์ในส่วนของตัวเองที่อยู่ใต้ส่วนหัวของคอมมูนิตี้';

  @override
  String get guildSettingsOverviewUploadIcon => 'อัปโหลดไอคอน';

  @override
  String get guildSettingsOverviewRemoveImage => 'ลบ';

  @override
  String get guildSettingsOverviewSplashTitle => 'ภาพพื้นหลังคำเชิญ';

  @override
  String get guildSettingsOverviewEmbedSplashTitle => 'พื้นหลังการฝังแชท';

  @override
  String get guildSettingsOverviewUploadBackground => 'อัปโหลดภาพพื้นหลัง';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'ไม่มีแบนเนอร์คอมมูนิตี้';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'ไม่มีภาพพื้นหลังคำเชิญ';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'ตัวอย่าง';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'ดูว่าคำเชิญของคุณแสดงต่อผู้เยี่ยมชมอย่างไร';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'ชื่อช่องข้อความ';

  @override
  String get guildSettingsOverviewOwnerCrownTitle => 'มงกุฎเจ้าของคอมมูนิตี้';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'กำหนดว่าจะแสดงไอคอนมงกุฎถัดจากเจ้าของชุมชนหรือไม่';

  @override
  String get guildSettingsSplashCardAlignment => 'การจัดวางการ์ด';

  @override
  String get guildSettingsSplashAlignmentCenter => 'กึ่งกลาง';

  @override
  String get guildSettingsSplashAlignmentLeft => 'ซ้าย';

  @override
  String get guildSettingsSplashAlignmentRight => 'ขวา';

  @override
  String get guildSettingsSplashAlignmentHint => 'ใช้ได้เฉพาะบนหน้าจอขนาดใหญ่';

  @override
  String get permissionReadMessageHistory => 'อ่านประวัติข้อความ';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'เปลี่ยนสิ่งที่ผู้ใช้ที่ไม่มี \"$permission\" สามารถมองเห็นได้';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'ใช้หน้าต่างที่กำหนดเองเพื่อตั้งค่าวันที่กำหนดเวลาประวัติข้อความสำหรับสมาชิกที่ไม่มีสิทธิ์ $permission';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'เปิดการตั้งค่าเกณฑ์ประวัติข้อความ';

  @override
  String get guildSettingsMessageHistoryThresholdTitle => 'เกณฑ์ประวัติข้อความ';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'เปิดใช้งานเกณฑ์ประวัติข้อความ';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'วันที่กำหนด';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'สมาชิกที่ไม่มีสิทธิ์อ่านประวัติข้อความสามารถดูข้อความที่ส่งหลังจากวันที่นี้ได้';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'อัปเดตเกณฑ์ประวัติข้อความแล้ว';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'อนุญาตให้ใช้ตัวพิมพ์ใหญ่และเว้นวรรคในชื่อช่องข้อความ หากปิด จะจำกัดชื่อเป็นตัวพิมพ์เล็กโดยมีเครื่องหมายขีดกลางและขีดล่าง';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'ซ่อนไอคอนมงกุฎถัดจากเจ้าของชุมชนในทุกส่วน';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'ไอคอนเคลื่อนไหวต้องมีฟีเจอร์ชุมชนไอคอนเคลื่อนไหว';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'แบนเนอร์เคลื่อนไหวต้องมีฟีเจอร์ชุมชนแบนเนอร์เคลื่อนไหว';

  @override
  String get guildSettingsAfkChannel => 'ช่อง AFK / ไม่ใช้งาน';

  @override
  String get guildSettingsAfkChannelHint =>
      'ย้ายสมาชิกไปยังช่องนี้เมื่อพวกเขาไม่อยู่';

  @override
  String get guildSettingsNoAfkChannel => 'ไม่มีช่อง AFK';

  @override
  String get guildSettingsAfkTimeout => 'หมดเวลา AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 นาที';

  @override
  String get guildSettingsAfkTimeout5Min => '5 นาที';

  @override
  String get guildSettingsAfkTimeout15Min => '15 นาที';

  @override
  String get guildSettingsAfkTimeout30Min => '30 นาที';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 ชั่วโมง';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds วินาที';
  }

  @override
  String get guildSettingsSystemChannel => 'ช่องปลายทาง';

  @override
  String get guildSettingsSystemChannelHint =>
      'ข้อความต้อนรับและข้อความระบบจะปรากฏที่นี่';

  @override
  String get guildSettingsNoSystemChannel => 'ไม่มีช่องระบบ';

  @override
  String get guildSettingsHideJoinMessages => 'ซ่อนข้อความเข้าร่วม';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'ปิดข้อความการเข้าร่วมในช่องปลายทาง';

  @override
  String get guildSettingsDefaultNotifications =>
      'การตั้งค่าการแจ้งเตือนเริ่มต้น';

  @override
  String get guildSettingsNotificationsAll => 'ข้อความทั้งหมด';

  @override
  String get guildSettingsNotificationsAllDescription => 'แจ้งเตือนทุกข้อความ';

  @override
  String get guildSettingsNotificationsMentions => 'เฉพาะเมื่อถูกกล่าวถึง';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'แจ้งเตือนเฉพาะเมื่อมีการกล่าวถึง';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. สูงสุด 10MB. ขั้นต่ำ: 960×540px (16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. สูงสุด 10MB. ขั้นต่ำ: 960×540px (16:9). แสดงใน embed ของคำเชิญในแชท';

  @override
  String get guildSettingsModerationContentFilterTitle => 'การกรองเนื้อหา';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'คัดกรองข้อความที่มีเนื้อหาโจ่งแจ้งโดยอัตโนมัติในช่องที่ไม่ได้ระบุว่าเป็นเนื้อหาสำหรับผู้ใหญ่';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'ชุมชนที่แสดงใน Discovery ต้องสแกนสมาชิกทั้งหมด การตั้งค่านี้ไม่สามารถเปลี่ยนแปลงได้ในขณะที่เปิดใช้งาน Discovery';

  @override
  String get guildSettingsContentFilterOff => 'ปิด';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'ให้คอมมูนิตี้จัดการกันเอง';

  @override
  String get guildSettingsContentFilterNoRole => 'กรองสมาชิกที่ไม่มีบทบาท';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'แนะนำสำหรับคอมมูนิตี้ส่วนใหญ่';

  @override
  String get guildSettingsContentFilterAll => 'กรองทุกคน';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'ปกป้องเต็มที่เพื่อพื้นที่ที่เหมาะสำหรับทุกคนในครอบครัว';

  @override
  String get guildSettingsContentWarningToggle => 'แสดงคำเตือนเนื้อหา';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'สลับการแจ้งเตือนก่อนเข้าช่องใดๆ';

  @override
  String get guildSettingsContentWarningText => 'ข้อความเตือนที่กำหนดเอง';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'มีเนื้อหาที่ละเอียดอ่อน';

  @override
  String get guildSettingsModeration2faTitle => 'ข้อกำหนด 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'กำหนดให้มีการยืนยันตัวตนสองปัจจัยสำหรับผู้กลั่นกรองก่อนที่พวกเขาจะสามารถแบน, ไล่ออก, ระงับเวลา หรือลบข้อความได้';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'กำหนดให้ใช้ 2FA สำหรับการดำเนินการดูแล';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'เปิดใช้งาน 2FA ในบัญชีของคุณเพื่อเปลี่ยนการตั้งค่านี้';

  @override
  String get guildSettingsEmojiSearchHint => 'ค้นหาอิโมจิ';

  @override
  String get guildSettingsEmojiUploadTitle => 'อัปโหลดอิโมจิ';

  @override
  String get guildSettingsEmojiSlotsTitle => 'ช่องอิโมจิ';

  @override
  String get guildSettingsEmojiDropZone => 'ลากและวางไฟล์อิโมจิที่นี่';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'โหลดอิโมจิไม่สำเร็จ ลองอีกครั้งในภายหลัง';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'ไม่พบอิโมจิที่ตรงกับการค้นหาของคุณ';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'คุณใช้อิโมจิครบตามจำนวนสูงสุดแล้ว ลบอิโมจิที่มีอยู่บางส่วนออกเพื่อเพิ่มพื้นที่';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'ชื่ออิโมจิต้องมีอย่างน้อย 2 ตัวอักษร และสามารถใช้ตัวอักษร ตัวเลข และขีดล่างได้ อิโมจิต้องมีขนาดไม่เกิน $maxSize ภาพนิ่งจะถูกปรับขนาดเป็น 128x128 พิกเซลและบีบอัดโดยอัตโนมัติ ส่วนอิโมจิเคลื่อนไหวและ SVG ต้องมีขนาดไม่เกินที่กำหนดอยู่แล้ว';
  }

  @override
  String get guildSettingsEmojiSomeFailedTitle => 'เพิ่มอิโมจิบางรายการไม่ได้';

  @override
  String get guildSettingsEmojiRenameTitle => 'เปลี่ยนชื่ออิโมจิ';

  @override
  String get guildSettingsEmojiRenameHint => '2-32 ตัวอักษร, ตัวเลข, ขีดล่าง';

  @override
  String get guildSettingsEmojiColumnName => 'ชื่อ';

  @override
  String get guildSettingsEmojiColumnUploader => 'อัปโหลดโดย';

  @override
  String get guildSettingsEmojiDeleteTitle => 'ลบอิโมจิ';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'ลบ :$name:? การดำเนินการนี้ไม่สามารถยกเลิกได้';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'ลบอิโมจินี้ออกจากที่จัดเก็บและ CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'ชื่ออิโมจิต้องมีความยาวอย่างน้อย 2 ตัวอักษร';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'ชื่ออิโมจิต้องมีความยาวไม่เกิน 32 ตัวอักษร';

  @override
  String get guildSettingsEmojiInvalidNameTitle => 'ชื่ออิโมจิไม่ถูกต้อง';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'เปลี่ยนชื่ออิโมจินี้ไม่ได้';

  @override
  String get guildSettingsEmojiDeleteFailedTitle => 'ไม่สามารถลบอิโมจินี้ได้';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'อนุญาตให้ผู้อื่นโคลนอิโมจิของคุณได้';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'เมื่อเปิดใช้งาน สมาชิกของชุมชนอื่นจะสามารถใช้ปุ่ม \"คัดลอก\" ในแอปเพื่อคัดลอกอิโมจิที่คุณกำหนดเองได้ทันที อย่างไรก็ตาม การตั้งค่านี้ไม่ได้ป้องกันไม่ให้พวกเขาบันทึกรูปภาพและอัปโหลดด้วยตนเอง';

  @override
  String get guildSettingsCloneStickerTitle =>
      'อนุญาตให้ผู้อื่นคัดลอกสติกเกอร์ของคุณได้';

  @override
  String get guildSettingsCloneStickerDescription =>
      'เมื่อเปิดใช้งาน สมาชิกของชุมชนอื่นจะสามารถใช้ทางลัด \"โคลน\" ในแอปเพื่อคัดลอกสติกเกอร์ที่คุณกำหนดเองได้ การดำเนินการนี้ไม่ได้ป้องกันไม่ให้พวกเขาบันทึกรูปภาพและอัปโหลดด้วยตนเอง';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'เฉพาะสมาชิกที่มีสิทธิ์ \"$permission\" เท่านั้นที่สามารถเปลี่ยนแปลงสิ่งนี้ได้';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed => 'อัปเดตการโคลนอิโมจิไม่ได้';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'อัปเดตการโคลนสติกเกอร์ไม่ได้';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'อิโมจิที่ไม่เคลื่อนไหว ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'อิโมจิเคลื่อนไหว ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'ค้นหาสติกเกอร์';

  @override
  String get guildSettingsStickerSlotsTitle => 'ช่องสติกเกอร์';

  @override
  String get guildSettingsStickerUploadTitle => 'อัปโหลดสติกเกอร์';

  @override
  String get guildSettingsStickerDropZone =>
      'ลากและวางไฟล์สติกเกอร์ที่นี่ (ครั้งละหนึ่งไฟล์)';

  @override
  String get guildSettingsStickerDensity => 'ความหนาแน่นของสติกเกอร์';

  @override
  String get guildSettingsStickerDensityCozy => 'โปร่งสบาย';

  @override
  String get guildSettingsStickerDensityCompact => 'กะทัดรัด';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'โหลดสติกเกอร์ไม่สำเร็จ';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'เกิดข้อผิดพลาดในการโหลดสติกเกอร์ ลองอีกครั้ง';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'ไม่พบสติกเกอร์ที่ตรงกับการค้นหาของคุณ';

  @override
  String get guildSettingsStickerSlotsFull =>
      'คุณใช้สติกเกอร์ครบตามจำนวนสูงสุดแล้ว ลบสติกเกอร์บางส่วนออกเพื่อเพิ่มพื้นที่';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'สติกเกอร์จะถูกบันทึกที่ 320x320 พิกเซล และต้องมีขนาดไม่เกิน $maxSize ภาพนิ่งจะถูกปรับขนาดและบีบอัดโดยอัตโนมัติ สติกเกอร์เคลื่อนไหวและ SVG ต้องมีขนาดไม่เกินที่กำหนดอยู่แล้ว';
  }

  @override
  String get guildSettingsStickerAddTitle => 'เพิ่มสติกเกอร์';

  @override
  String get guildSettingsStickerEditTitle => 'แก้ไขสติกเกอร์';

  @override
  String get guildSettingsStickerNameLabel => 'ชื่อ';

  @override
  String get guildSettingsStickerNameHint => 'สติกเกอร์สุดเจ๋งของฉัน';

  @override
  String get guildSettingsStickerDescriptionLabel => 'คำอธิบาย';

  @override
  String get guildSettingsStickerDescriptionHint => 'อธิบายสติกเกอร์';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'แท็ก ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'เพิ่มแท็ก';

  @override
  String get guildSettingsStickerTagAdd => 'เพิ่ม';

  @override
  String get guildSettingsStickerNameRequired => 'ต้องระบุชื่อ';

  @override
  String get guildSettingsStickerNameTooShort =>
      'ชื่อต้องมีอย่างน้อย 2 ตัวอักษร';

  @override
  String get guildSettingsStickerNameTooLong =>
      'ชื่อต้องมีความยาวไม่เกิน 30 ตัวอักษร';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'คำอธิบายต้องมีความยาวไม่เกิน 500 ตัวอักษร';

  @override
  String get guildSettingsStickerCreateFailedTitle => 'สร้างสติกเกอร์นี้ไม่ได้';

  @override
  String get guildSettingsStickerDeleteTitle => 'ลบสติกเกอร์';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'ลบ \"$name\" หรือไม่? การดำเนินการนี้ไม่สามารถย้อนกลับได้';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'ลบสติกเกอร์นี้ออกจากที่จัดเก็บและ CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'ไม่สามารถลบสติกเกอร์นี้ได้';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'หากต้องการสร้างเว็ةฮุค ให้เปิดที่ $channelSettingsPath คุณยังสามารถแก้ไขและจัดระเบียบเว็ะฮุคที่มีอยู่ทั้งหมดได้ที่นี่';
  }

  @override
  String get guildSettingsBannedUsersTitle => 'ผู้ใช้ที่ถูกแบน';

  @override
  String get guildSettingsInvitesTableInviter => 'ผู้เชิญ';

  @override
  String get guildSettingsInvitesTableChannel => 'ช่อง';

  @override
  String get guildSettingsInvitesTableCode => 'รหัส';

  @override
  String get guildSettingsInvitesTableUses => 'จำนวนครั้งที่ใช้';

  @override
  String get guildSettingsInvitesTableCreated => 'สร้างเมื่อ';

  @override
  String get guildSettingsInvitesTableExpires => 'หมดอายุ';

  @override
  String get guildSettingsAuditLogFilterUser => 'กรองตามผู้ใช้';

  @override
  String get guildSettingsAuditLogFilterAction => 'กรองตามการกระทำ';

  @override
  String get createDm => 'สร้างข้อความส่วนตัว';

  @override
  String get createGroupDm => 'สร้างแชทกลุ่ม';

  @override
  String get createDmNewMessage => 'ข้อความใหม่';

  @override
  String get createDmSelectFriends => 'เลือกเพื่อน';

  @override
  String get createDmChooseFriendsSubtitle => 'เลือกเพื่อนเพื่อส่งข้อความ';

  @override
  String get createDmSearchFriends => 'ค้นหาเพื่อน';

  @override
  String get createDmNoFriendsFound => 'ไม่พบเพื่อน';

  @override
  String get createDmNoFriendsYet => 'คุณยังไม่มีเพื่อน';

  @override
  String get createDmClaimToStartDms =>
      'ยืนยันบัญชีของคุณเพื่อเริ่มส่งข้อความส่วนตัว';

  @override
  String get createDmVerifyToStartDms =>
      'ยืนยันอีเมลของคุณเพื่อเริ่มส่งข้อความส่วนตัว';

  @override
  String get createDmVerifyYourEmail => 'ยืนยันอีเมลของคุณ';

  @override
  String get createDmNewGroup => 'สร้างกลุ่มใหม่';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'สร้างกลุ่มใหม่กับ $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'ยืนยันการสร้างกลุ่มใหม่';

  @override
  String get createDmCreateNewGroup => 'สร้างกลุ่มใหม่';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'นำ $displayName ออก';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'คุณมีกลุ่มที่มีผู้ใช้เหล่านี้อยู่แล้ว ต้องการสร้างกลุ่มใหม่อีกกลุ่มใช่ไหม ทำได้เลย!';

  @override
  String get createDmNoActivityYet => 'ยังไม่มีกิจกรรม';

  @override
  String get createDmSomeUsersCantBeAdded => 'เพิ่มผู้ใช้บางคนไม่ได้';

  @override
  String get createDmCreateWithoutThem => 'สร้างโดยไม่มีพวกเขา';

  @override
  String get createDmUnaddableIntro =>
      'ไม่สามารถเพิ่มคนเหล่านี้เข้าแชทกลุ่มนี้ได้:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'สร้าง DM กลุ่มกับผู้รับที่เหลืออีก $count คน และข้ามคนอื่นไปหรือไม่';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'ไม่มีผู้รับที่เหลือให้สร้างแชทกลุ่มด้วย';

  @override
  String get createDmUnaddableUserNotFound => 'ไม่พบผู้ใช้';

  @override
  String get createDmUnaddableBlocked =>
      'คุณไม่สามารถส่งข้อความถึงผู้ใช้นี้ได้';

  @override
  String get createDmUnaddableNotFriends => 'ไม่ได้อยู่ในรายชื่อเพื่อนของคุณ';

  @override
  String get createDmUnaddableGroupDisabled => 'ไม่อนุญาตให้เพิ่มเข้าแชทกลุ่ม';

  @override
  String get createDmFailed => 'ไม่สามารถสร้างการสนทนาได้ ลองอีกครั้ง';

  @override
  String get dmListMessagesTitle => 'ข้อความ';

  @override
  String get dmListDirectMessagesTitle => 'ข้อความส่วนตัว';

  @override
  String get keybindsSearchShortcuts => 'ค้นหาปุ่มลัด';

  @override
  String get keybindSectionDefaults => 'ค่าเริ่มต้น';

  @override
  String get keybindSectionMessages => 'ข้อความ';

  @override
  String get keybindSectionNavigation => 'การนำทาง';

  @override
  String get keybindSectionDragAndDrop => 'ลากและวาง';

  @override
  String get keybindSectionChat => 'แชท';

  @override
  String get keybindSectionVoiceAndVideo => 'เสียงและวิดีโอ';

  @override
  String get keybindSectionMisc => 'เบ็ดเตล็ด';

  @override
  String get keybindActionShowShortcutsList => 'แสดงรายการปุ่มลัด';

  @override
  String get keybindActionCopyText => 'คัดลอกข้อความ';

  @override
  String get keybindActionMarkUnread => 'ทำเครื่องหมายว่ายังไม่ได้อ่าน';

  @override
  String get keybindActionFocusTextarea => 'โฟกัสช่องข้อความ';

  @override
  String get keybindActionSwitchCommunities => 'สลับคอมมูนิตี้';

  @override
  String get keybindActionSwitchChannels => 'สลับช่อง';

  @override
  String get keybindActionHistoryBack => 'ย้อนกลับในประวัติช่องที่ดูแล้ว';

  @override
  String get keybindActionHistoryForward =>
      'เลื่อนไปข้างหน้าในประวัติช่องที่ดูแล้ว';

  @override
  String get keybindActionJumpUnreadChannels =>
      'ข้ามไปมาระหว่างช่องที่ยังไม่ได้อ่าน';

  @override
  String get keybindActionJumpMentionChannels =>
      'ข้ามไปมาระหว่างช่องที่ยังไม่ได้อ่านที่มีการกล่าวถึง';

  @override
  String get keybindActionJumpCurrentCall => 'ข้ามไปที่การโทรปัจจุบัน';

  @override
  String get keybindActionToggleLastGuildDms =>
      'สลับระหว่างคอมมูนิตี้ล่าสุดและข้อความส่วนตัว';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'สลับไปคอมมูนิตี้หรือข้อความส่วนตัวก่อนหน้า';

  @override
  String get keybindActionNextCommunityOrDms =>
      'สลับไปคอมมูนิตี้หรือข้อความส่วนตัวถัดไป';

  @override
  String get keybindActionGoToDms => 'ไปที่ข้อความส่วนตัว';

  @override
  String get keybindActionGoToFirstCommunity => 'ไปที่คอมมูนิตี้แรก';

  @override
  String get keybindActionGoToSecondCommunity => 'ไปที่คอมมูนิตี้ที่สอง';

  @override
  String get keybindActionGoToThirdCommunity => 'ไปที่คอมมูนิตี้ที่สาม';

  @override
  String get keybindActionGoToFourthCommunity => 'ไปที่คอมมูนิตี้ที่สี่';

  @override
  String get keybindActionGoToFifthCommunity => 'ไปที่คอมมูนิตี้ที่ห้า';

  @override
  String get keybindActionGoToSixthCommunity => 'ไปที่คอมมูนิตี้ที่หก';

  @override
  String get keybindActionGoToSeventhCommunity => 'ไปที่คอมมูนิตี้ที่เจ็ด';

  @override
  String get keybindActionGoToEighthCommunity => 'ไปที่คอมมูนิตี้ที่แปด';

  @override
  String get keybindActionToggleQuickSwitcher => 'เปิด/ปิดตัวสลับด่วน';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'สร้างหรือเข้าร่วมคอมมูนิตี้';

  @override
  String get keybindActionStartDragAndDrop => 'เริ่มลากและวาง';

  @override
  String get keybindActionMove => 'ย้าย';

  @override
  String get keybindActionDropItem => 'วางไอเทม';

  @override
  String get keybindActionCancel => 'ยกเลิก';

  @override
  String get keybindActionMarkCommunityRead =>
      'ทำเครื่องหมายคอมมูนิตี้ว่าอ่านแล้ว';

  @override
  String get keybindActionMarkChannelRead => 'ทำเครื่องหมายช่องว่าอ่านแล้ว';

  @override
  String get keybindActionStartGroupDm => 'เริ่มแชทกลุ่ม';

  @override
  String get keybindActionTogglePinnedMessages => 'สลับข้อความปักหมุด';

  @override
  String get keybindActionToggleInbox => 'สลับกล่องข้อความ';

  @override
  String get keybindActionMarkTopInboxRead =>
      'ทำเครื่องหมายช่องบนสุดในกล่องข้อความว่าอ่านแล้ว';

  @override
  String get keybindActionMarkAllInboxRead =>
      'ทำเครื่องหมายทุกช่องในกล่องข้อความว่าอ่านแล้ว';

  @override
  String get keybindActionToggleMemberList => 'สลับรายการสมาชิกหรือแชทเสียง';

  @override
  String get keybindActionToggleEmojiPicker => 'สลับตัวเลือกอิโมจิ';

  @override
  String get keybindActionToggleGifPicker => 'สลับตัวเลือก GIF';

  @override
  String get keybindActionToggleStickerPicker => 'สลับตัวเลือกสติกเกอร์';

  @override
  String get keybindActionScrollChatUp => 'เลื่อนแชทขึ้น';

  @override
  String get keybindActionScrollChatDown => 'เลื่อนแชทลง';

  @override
  String get keybindActionJumpOldestUnread =>
      'ข้ามไปยังข้อความที่ยังไม่ได้อ่านเก่าสุด';

  @override
  String get keybindActionFocusComposer => 'โฟกัสช่องข้อความ';

  @override
  String get keybindActionUploadFile => 'อัปโหลดไฟล์';

  @override
  String get keybindActionCopyChannelLink => 'คัดลอกลิงก์ช่อง';

  @override
  String get keybindActionToggleSavedMedia => 'สลับสื่อที่บันทึกไว้';

  @override
  String get keybindActionSendVoiceMessage => 'ส่งข้อความเสียง';

  @override
  String get keybindActionAnswerCall => 'รับสายเรียกเข้า';

  @override
  String get keybindActionDeclineCall => 'ปฏิเสธสายเรียกเข้า';

  @override
  String get keybindActionStartDmCall => 'เริ่มการโทรในข้อความส่วนตัวหรือกลุ่ม';

  @override
  String get keybindActionToggleSoundboard => 'สลับซาวด์บอร์ด';

  @override
  String get keybindActionToggleCompactCallView =>
      'ขยายหรือยุบมุมมองการโทรแบบกะทัดรัด';

  @override
  String get keybindActionPushToTalkPriority => 'กดเพื่อพูด (สำคัญ)';

  @override
  String get keybindActionVoiceActivityPriority => 'การตรวจจับเสียงพูด (สำคัญ)';

  @override
  String get keybindActionOpenHelp => 'เปิดวิธีใช้';

  @override
  String get keybindActionSearchMessages => 'ค้นหาข้อความ';

  @override
  String get keybindActionOpenContextMenu => 'เปิดเมนูตัวเลือก';

  @override
  String get keybindActionOpenSettings => 'เปิดการตั้งค่า';

  @override
  String get keybindActionOpenThemeStudio =>
      'เปิดสตูดิโอธีมในหน้าต่างป๊อปเอาต์';

  @override
  String get keybindActionZoomIn => 'ซูมเข้า';

  @override
  String get keybindActionZoomOut => 'ซูมออก';

  @override
  String get keybindActionZoomReset => 'รีเซ็ตการซูม';

  @override
  String get clipboardPasteFailed =>
      'วางไม่ได้ คลิปบอร์ดว่างเปล่า หรือแอปนี้ไม่ได้รับอนุญาตให้เข้าถึง';

  @override
  String get homeQuickActionDms => 'ข้อความส่วนตัว';

  @override
  String get assistantNeedsLogin => 'เปิด Fluxer และลงชื่อเข้าใช้ก่อน';

  @override
  String get assistantNotInVoice => 'คุณไม่ได้อยู่ในการโทร';

  @override
  String get assistantNotFound => 'Fluxer ไม่พบรายการนั้น';

  @override
  String get assistantDmsDisabled => 'ปิดใช้งานข้อความส่วนตัวในอินสแตนซ์นี้';

  @override
  String get assistantFailed => 'Fluxer ทำสิ่งนั้นไม่สำเร็จ';

  @override
  String get assistantOkMuted => 'ปิดไมค์แล้ว';

  @override
  String get assistantOkUnmuted => 'เปิดไมค์แล้ว';

  @override
  String get assistantOkLeftVoice => 'ออกจากช่องเสียงแล้ว';

  @override
  String get assistantOkJoinedVoice => 'กำลังเข้าร่วมช่องเสียง';

  @override
  String get assistantOkStartedCall => 'กำลังเริ่มการโทร';

  @override
  String assistantOkStatusSet(String status) {
    return 'ตั้งสถานะเป็น $status แล้ว';
  }

  @override
  String get assistantOkOpened => 'กำลังเปิด Fluxer';

  @override
  String get assistantOkMessageSent => 'ส่งข้อความแล้ว';

  @override
  String get assistantOkCustomStatusSet => 'อัปเดตสถานะกำหนดเองแล้ว';

  @override
  String get assistantOkCustomStatusCleared => 'ล้างสถานะกำหนดเองแล้ว';

  @override
  String get guildNavbarAnnouncementChannel => 'ช่องประกาศ';

  @override
  String get guildNavbarAnnouncementChannelDescription =>
      'โพสต์อัปเดตที่คอมมูนิตี้อื่นสามารถติดตามไปยังช่องของตนเองได้';

  @override
  String get channelDetailsAnnouncementChannel => 'ช่องประกาศ';

  @override
  String get channelSettingsAnnouncementChannel => 'ช่องประกาศ';

  @override
  String get channelSettingsAnnouncementChannelDescription =>
      'ให้คอมมูนิตี้อื่นติดตามช่องนี้และรับสำเนาข้อความที่คุณเผยแพร่';

  @override
  String get channelSettingsStopAnnouncementTitle =>
      'หยุดเป็นช่องประกาศหรือไม่';

  @override
  String channelSettingsStopAnnouncementBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          '$count ช่องกำลังติดตามช่องนี้ การแปลงเป็นช่องข้อความจะลบการติดตามเหล่านั้นออก',
      one:
          '1 ช่องกำลังติดตามช่องนี้ การแปลงเป็นช่องข้อความจะลบการติดตามนั้นออก',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsStopAnnouncementUnknown =>
      'การแปลงช่องนี้เป็นช่องข้อความจะทำให้ทุกช่องที่ติดตามช่องนี้เลิกติดตาม';

  @override
  String get channelSettingsConvertChannel => 'แปลง';

  @override
  String get channelSettingsConvertFailed => 'ไม่สามารถแปลงช่องนี้ได้';

  @override
  String get channelSettingsChannelHasFollowers =>
      'ยังมีช่องอื่นติดตามช่องนี้อยู่ โปรดลบการติดตามเหล่านั้นก่อนแปลงช่อง';

  @override
  String get channelMenuFollow => 'ติดตามช่อง';

  @override
  String get channelFollowTitle => 'ติดตามช่องนี้';

  @override
  String get channelFollowBody =>
      'เลือกตำแหน่งที่ควรเผยแพร่ข้อความ คุณสามารถยกเลิกการติดตามได้ทุกเมื่อในการตั้งค่าคอมมูนิตี้ → Webhook';

  @override
  String get channelFollowCommunity => 'คอมมูนิตี้';

  @override
  String get channelFollowChannel => 'ช่อง';

  @override
  String get channelFollowAgeWarning =>
      'ช่องนี้จำกัดอายุ สามารถส่งอัปเดตไปยังช่องที่จำกัดอายุเท่านั้น';

  @override
  String get channelFollowContentWarning =>
      'ช่องนี้มีคำเตือนเนื้อหา การอัปเดตจะส่งไปยังช่องที่มีคำเตือนเนื้อหาหรือการจำกัดอายุเท่านั้น';

  @override
  String get channelFollowHiddenHint =>
      'คอมมูนิตี้และช่องที่คุณไม่สามารถจัดการ Webhook ได้จะถูกซ่อนไว้';

  @override
  String get channelFollowEmpty =>
      'คุณไม่สามารถจัดการ Webhook ในคอมมูนิตี้ใดๆ ได้ โปรดขอให้ผู้ดูแลระบบติดตามช่องนี้';

  @override
  String get channelFollowSubmit => 'ติดตาม';

  @override
  String get channelFollowFailed => 'ติดตามช่องนี้ไม่ได้';

  @override
  String get channelFollowSuccessTitle => 'กำลังมีอัปเดตเข้ามา!';

  @override
  String channelFollowSuccessBody(String sourceName, String targetName) {
    return 'ข้อความที่เผยแพร่ใน $sourceName จะแสดงใน #$targetName';
  }

  @override
  String get channelFollowSuccessDismiss => 'เข้าใจแล้ว!';

  @override
  String get channelFollowBarrier =>
      'ติดตามช่องนี้เพื่อรับประกาศเหล่านี้ในช่องที่คุณเลือก';

  @override
  String get channelHeaderFollow => 'ติดตามช่อง';

  @override
  String get chatMessagePublish => 'เผยแพร่';

  @override
  String get chatMessagePublished => 'เผยแพร่แล้ว';

  @override
  String get chatMessagePublishConfirmTitle => 'เผยแพร่ข้อความหรือไม่';

  @override
  String get chatMessagePublishConfirmBody =>
      'การดำเนินการนี้จะส่งสำเนาไปยังทุกช่องที่ติดตามช่องนี้';

  @override
  String get chatMessagePublishedToast => 'ข้อความเผยแพร่แล้ว';

  @override
  String get chatMessageAlreadyPublished => 'ข้อความนี้เผยแพร่แล้ว';

  @override
  String get chatMessagePublishFailedTitle => 'ไม่สามารถเผยแพร่ข้อความนี้ได้';

  @override
  String get chatMessagePublishFailedBody =>
      'เกิดข้อผิดพลาด ลองอีกครั้งในภายหลัง';

  @override
  String get chatMessagePublishLimitTitle => 'ช้าลงหน่อย';

  @override
  String chatMessagePublishLimitBody(String duration) {
    return 'คุณจะสามารถเผยแพร่ได้อีกครั้งใน $duration';
  }

  @override
  String get chatMessagePublishLimitUnknown =>
      'คุณกำลังเผยแพร่เร็วเกินไป โปรดลองอีกครั้งในอีกสักครู่';

  @override
  String get chatMessageDeletePublished =>
      'การดำเนินการนี้จะลบสำเนาที่ส่งไปยังช่องที่ติดตามช่องนี้ด้วย';

  @override
  String get chatMessageEditPublishedTitle =>
      'แก้ไขข้อความที่เผยแพร่แล้วหรือไม่?';

  @override
  String get chatMessageEditPublishedBody =>
      'การดำเนินการนี้จะอัปเดตสำเนาที่ส่งไปยังช่องที่ติดตามช่องนี้ด้วย';

  @override
  String get chatMessageEditPublishedSave => 'บันทึก';

  @override
  String get chatMessageEditLimitTitle => 'ช้าลงหน่อย';

  @override
  String chatMessageEditLimitBody(String duration) {
    return 'คุณสามารถแก้ไขข้อความที่เผยแพร่นี้ได้อีกครั้งใน $duration';
  }

  @override
  String get chatMessageEditLimitUnknown =>
      'คุณกำลังแก้ไขข้อความที่เผยแพร่นี้เร็วเกินไป โปรดลองอีกครั้งในอีกสักครู่';

  @override
  String get chatMessageOriginalDeleted => '[ข้อความต้นฉบับถูกลบแล้ว]';

  @override
  String get userTagCommunity => 'คอมมูนิตี้';

  @override
  String systemFollowAdd(String username, String source) {
    return '$username ตั้งให้ช่องนี้ติดตาม $source ข้อความที่เผยแพร่ที่นั่นจะปรากฏที่นี่';
  }

  @override
  String systemPreviewFollowAdd(String username, String source) {
    return '$username ตั้งให้ช่องนี้ติดตาม $source';
  }

  @override
  String get publishNudgeNotSent => 'ยังไม่ได้ส่งให้ผู้ติดตาม';

  @override
  String get publishNudgeHideForever => 'ไม่ต้องแสดงอีก';

  @override
  String get publishNudgeDismiss => 'ปิด';

  @override
  String get channelSettingsFollowedChannels => 'ช่องที่ติดตาม';

  @override
  String get channelSettingsFollowedChannelsDescription =>
      'ช่องประกาศที่ช่องนี้ติดตาม หากต้องการหยุดรับสำเนา ให้ยกเลิกการติดตาม';

  @override
  String get guildSettingsFollowedChannelsDescription =>
      'ช่องประกาศที่ช่องต่างๆ ในคอมมูนิตี้นี้ติดตามอยู่';

  @override
  String channelSettingsFollowedFrom(String guildName, String channelName) {
    return 'จาก $guildName #$channelName';
  }

  @override
  String get channelSettingsFollowedPaused =>
      'หยุดอัปเดตชั่วคราวเนื่องจากช่องต้นทางไม่พร้อมใช้งานแล้ว';

  @override
  String channelSettingsUnfollowTitle(String name) {
    return 'เลิกติดตาม $name ไหม';
  }

  @override
  String get channelSettingsUnfollowBody =>
      'ช่องนี้จะหยุดรับสำเนาจากช่องประกาศนั้น';

  @override
  String get channelSettingsUnfollow => 'ยกเลิกการติดตาม';

  @override
  String get crosspostCommunityTitle => 'คอมมูนิตี้';

  @override
  String get crosspostGoToCommunity => 'ไปที่คอมมูนิตี้';

  @override
  String get crosspostJoinCommunity => 'เข้าร่วมคอมมูนิตี้';

  @override
  String get crosspostSourceFailed =>
      'ไม่สามารถโหลดคอมมูนิตี้นี้ได้ ลองอีกครั้งในอีกสักครู่';

  @override
  String crosspostMembers(int count) {
    return 'สมาชิก $count คน';
  }

  @override
  String crosspostOnline(int count) {
    return '$count ออนไลน์';
  }

  @override
  String durationMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count นาที',
      one: '1 นาที',
    );
    return '$_temp0';
  }

  @override
  String durationSeconds(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count วินาที',
      one: '1 วินาที',
    );
    return '$_temp0';
  }

  @override
  String get channelUnsupportedTitle => 'ไม่รองรับประเภทช่องนี้';

  @override
  String get channelUnsupportedBody => 'แอปเวอร์ชันนี้ไม่รองรับช่องประเภทนี้';

  @override
  String get channelDetailsUnsupportedChannel => 'ช่องที่ไม่รองรับ';

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
