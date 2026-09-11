// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'fluxer_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class FluxerLocalizationsVi extends FluxerLocalizations {
  FluxerLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get reconnectingTitle => 'Chúng tôi đã gặp trục trặc!';

  @override
  String get reconnectingBody =>
      'Có lỗi xảy ra với phiên bản này.\nSẽ được khắc phục trong giây lát!';

  @override
  String get gatewayReconnectingToast => 'Đang kết nối lại…';

  @override
  String get gatewayConnectedToast => 'Đã kết nối';

  @override
  String get sessionExpiredToast =>
      'Phiên của bạn đã hết hạn. Vui lòng đăng nhập lại.';

  @override
  String splashStartupFailed(String error) {
    return 'Không thể khởi động: $error';
  }

  @override
  String get retry => 'Thử lại';

  @override
  String get connectingCaps => 'CONNECTING';

  @override
  String get splashConnectionLost => 'Mất kết nối';

  @override
  String get splashViewOnStatusPage => 'Xem trên trang trạng thái';

  @override
  String get splashConnectionIssuesPrompt => 'Có vấn đề kết nối?';

  @override
  String get splashStatusPageLink => 'Trang trạng thái';

  @override
  String get splashReadIncident => 'Đọc sự cố';

  @override
  String get splashIncidentHistory => 'Lịch sử sự cố';

  @override
  String get nagbarLearnMore => 'Tìm hiểu thêm';

  @override
  String nagbarMaintenanceScheduled(String localizedTime, String duration) {
    return 'Lịch bảo trì vào lúc $localizedTime. Thời gian dự kiến: $duration.';
  }

  @override
  String nagbarMaintenanceInProgress(String duration) {
    return 'Đang bảo trì. Thời gian dự kiến: $duration.';
  }

  @override
  String get nagbarMaintenanceComplete => 'Đã hoàn tất bảo trì.';

  @override
  String nagbarUnclaimedAccountMessage(String displayName) {
    return 'Chào $displayName, hãy xác nhận tài khoản để tránh mất quyền truy cập.';
  }

  @override
  String nagbarEmailVerificationMessage(String displayName) {
    return 'Chào $displayName, vui lòng xác minh địa chỉ email của bạn.';
  }

  @override
  String get nagbarOpenSettings => 'Mở cài đặt';

  @override
  String get systemPermissionSettingsTitle => 'Bật quyền';

  @override
  String get systemPermissionSettingsOpenSettings => 'Mở cài đặt';

  @override
  String systemPermissionMicrophoneMessage(String productName) {
    return '$productName không có quyền truy cập micrô của bạn. Bạn có thể bật tính năng này trong cài đặt quyền riêng tư của thiết bị.';
  }

  @override
  String systemPermissionCameraMessage(String productName) {
    return '$productName không có quyền truy cập máy ảnh của bạn. Bạn có thể bật tính năng này trong cài đặt quyền riêng tư của thiết bị.';
  }

  @override
  String systemPermissionPhotosMessage(String productName) {
    return '$productName không có quyền truy cập vào thư viện ảnh của bạn. Bạn có thể bật quyền này trong cài đặt quyền riêng tư trên thiết bị của mình.';
  }

  @override
  String systemPermissionNotificationsMessage(String productName) {
    return '$productName không có quyền gửi thông báo. Bạn có thể bật tính năng này trong cài đặt thiết bị của mình.';
  }

  @override
  String nagbarPremiumGracePeriod(String productName, String graceDate) {
    return 'Đăng ký của bạn đã không được gia hạn, nhưng bạn vẫn có quyền truy cập vào các đặc quyền của $productName cho đến ngày $graceDate. Hãy hành động ngay bây giờ nếu không bạn sẽ mất tất cả các đặc quyền.';
  }

  @override
  String nagbarPremiumExpired(String productName) {
    return 'Gói đăng ký $productName của bạn đã hết hạn. Gia hạn ngay để giữ các đặc quyền.';
  }

  @override
  String get nagbarManageSubscription => 'Quản lý gói đăng ký';

  @override
  String nagbarPremiumOnboardingDefault(
    String productFullName,
    String productName,
  ) {
    return 'Chào mừng bạn đến với $productFullName. Khám phá các đặc quyền $productName của bạn và quản lý đăng ký của bạn.';
  }

  @override
  String nagbarViewPremiumFeatures(String productName) {
    return 'Xem các tính năng của $productName';
  }

  @override
  String get nagbarGiftInventoryOne =>
      'Bạn có một mã quà tặng mới đang chờ trong kho quà tặng của mình.';

  @override
  String nagbarGiftInventoryMany(int count) {
    return 'Bạn có $count mã quà tặng mới đang chờ trong kho quà tặng của mình.';
  }

  @override
  String get nagbarViewGiftInventory => 'Xem kho quà';

  @override
  String get nagbarVisionaryMfa =>
      'Bật xác thực hai yếu tố để bảo vệ tài khoản Visionary của bạn.';

  @override
  String get nagbarEnableMfa => 'Bật 2FA';

  @override
  String get nagbarTermsAcceptance =>
      'Chúng tôi đã cập nhật điều khoản. Vui lòng xem lại và chấp nhận để tiếp tục.';

  @override
  String get nagbarReviewTerms => 'Xem lại điều khoản';

  @override
  String nagbarGuildMembershipCta(String communityName) {
    return 'Tham gia $communityName để trò chuyện với đội ngũ và cập nhật thông tin mới nhất.';
  }

  @override
  String nagbarJoinCommunity(String communityName) {
    return 'Tham gia $communityName';
  }

  @override
  String get nagbarPushNotification =>
      'Bật thông báo để bạn không bỏ lỡ tin nhắn và lượt nhắc đến.';

  @override
  String get nagbarEnableNotifications => 'Bật thông báo';

  @override
  String get nagbarBillingPortalFailed =>
      'Không thể mở cổng thanh toán. Vui lòng thử lại sau.';

  @override
  String get welcomeBack => 'Chào mừng bạn trở lại';

  @override
  String get email => 'Email';

  @override
  String get emailInvalid => 'Vui lòng nhập một địa chỉ email hợp lệ.';

  @override
  String get password => 'Mật khẩu';

  @override
  String get forgotPassword => 'Quên mật khẩu?';

  @override
  String get logIn => 'Đăng nhập';

  @override
  String get logInWithPasskey => 'Đăng nhập bằng khóa truy cập';

  @override
  String continueWithSso(String provider) {
    return 'Tiếp tục với $provider';
  }

  @override
  String get ssoRequired =>
      'Bạn cần đăng nhập một lần để truy cập phiên bản này.';

  @override
  String get organizationSsoProvider =>
      'Đăng nhập bằng nhà cung cấp đăng nhập một lần của tổ chức bạn.';

  @override
  String get failedToStartSso => 'Không thể bắt đầu SSO';

  @override
  String get ssoCancelled => 'Đăng nhập SSO đã bị hủy';

  @override
  String preferSso(String provider) {
    return 'Ưu tiên dùng SSO? Tiếp tục với $provider.';
  }

  @override
  String get logInViaBrowser => 'Đăng nhập qua trình duyệt';

  @override
  String get needAccountPrompt => 'Cần tài khoản? ';

  @override
  String get register => 'Đăng ký';

  @override
  String get orDivider => 'OR';

  @override
  String get captchaTitle => 'Xác minh bạn không phải robot';

  @override
  String get captchaDescription =>
      'Chúng tôi cần đảm bảo bạn không phải là bot. Vui lòng hoàn tất xác minh bên dưới.';

  @override
  String get captchaSwitchToHcaptcha => 'Gặp sự cố? Thử dùng hCaptcha';

  @override
  String get captchaSwitchToTurnstile => 'Thử dùng Turnstile';

  @override
  String get cancel => 'Hủy';

  @override
  String get ipAuthCheckEmail => 'Kiểm tra email của bạn';

  @override
  String ipAuthDescription(String email) {
    return 'Chúng tôi đã gửi một liên kết đến $email để xác thực đăng nhập này. Vui lòng kiểm tra hộp thư của bạn.';
  }

  @override
  String get ipAuthConnectionLost => 'Mất kết nối';

  @override
  String get ipAuthConnectionLostDescription =>
      'Chúng tôi đã mất kết nối khi chờ ủy quyền. Vui lòng thử lại.';

  @override
  String get ipAuthLinkExpired => 'Liên kết đăng nhập đã hết hạn';

  @override
  String get ipAuthLinkExpiredDescription =>
      'Liên kết ủy quyền này đã hết hạn. Vui lòng đăng nhập lại.';

  @override
  String get ipAuthResendEmail => 'Gửi lại email';

  @override
  String get ipAuthResent => 'Đã gửi lại';

  @override
  String ipAuthResendCountdown(int seconds) {
    return '$seconds giây';
  }

  @override
  String get back => 'Quay lại';

  @override
  String get next => 'Tiếp';

  @override
  String get mfaTitle => 'Xác thực 2 yếu tố';

  @override
  String get mfaChooseMethod => 'Chọn phương thức xác minh';

  @override
  String get mfaMethodTotp => 'Ứng dụng xác thực';

  @override
  String get mfaMethodWebauthn => 'Khóa bảo mật / Mật mã';

  @override
  String get mfaTotpDescription =>
      'Nhập mã gồm 6 chữ số từ ứng dụng xác thực của bạn hoặc một trong các mã dự phòng của bạn.';

  @override
  String get mfaCodeLabel => 'Mã';

  @override
  String get mfaTryAnotherMethod => 'Thử phương thức khác';

  @override
  String get mfaUseSecurityKey => 'Thử dùng khóa bảo mật / mật mã';

  @override
  String get accountSelectorTitle => 'Chọn một tài khoản';

  @override
  String get accountSelectorDescription =>
      'Chọn một tài khoản để tiếp tục hoặc thêm tài khoản khác.';

  @override
  String get accountAdd => 'Thêm tài khoản';

  @override
  String get accountRemove => 'Xóa';

  @override
  String accountRemoveTitle(String username) {
    return 'Xóa $username';
  }

  @override
  String get accountRemoveDescription =>
      'Thao tác này sẽ xoá phiên đã lưu cho tài khoản này.';

  @override
  String get accountRemoveOnlyDescription =>
      'Thao tác này sẽ xoá tài khoản duy nhất đã lưu trên thiết bị này.';

  @override
  String get accountExpired => 'Đã hết hạn';

  @override
  String accountSessionExpired(String identifier) {
    return 'Phiên đã hết hạn cho $identifier. Vui lòng đăng nhập lại.';
  }

  @override
  String get accountManageTitle => 'Quản lý tài khoản';

  @override
  String get accountSwitchFailed =>
      'Không thể chuyển đổi tài khoản. Vui lòng thử lại.';

  @override
  String get profileTabMenuSwitchAccounts => 'Chuyển tài khoản';

  @override
  String get statusChangeSheetTitle => 'Đặt trạng thái';

  @override
  String get statusOnlineStatusSection => 'Trạng thái online';

  @override
  String get statusOnline => 'Đang hoạt động';

  @override
  String get statusIdle => 'Không hoạt động';

  @override
  String get statusDnd => 'Không làm phiền';

  @override
  String get statusInvisible => 'Ẩn';

  @override
  String get statusOffline => 'Ngoại tuyến';

  @override
  String get statusUntilIChangeIt => 'Cho đến khi tôi đổi';

  @override
  String get statusDontClear => 'Không xóa';

  @override
  String get statusFor10Seconds => 'Trong 10 giây';

  @override
  String get statusClearAfter10Seconds => '10 giây';

  @override
  String get statusClearAfter15Minutes => '15 phút';

  @override
  String get statusClearAfter30Minutes => '30 phút';

  @override
  String get statusClearAfter1Hour => '1 giờ';

  @override
  String get statusClearAfter3Hours => '3 giờ';

  @override
  String get statusClearAfter4Hours => '4 giờ';

  @override
  String get statusClearAfter8Hours => '8 giờ';

  @override
  String get statusClearAfter24Hours => '24 giờ';

  @override
  String get statusClearAfter3Days => '3 ngày';

  @override
  String get statusDndDescription =>
      'Bạn sẽ không nhận được thông báo trên máy tính';

  @override
  String get statusInvisibleDescription =>
      'Bạn sẽ hiện ở trạng thái ngoại tuyến';

  @override
  String get customStatusSetTitle => 'Đặt trạng thái tùy chỉnh';

  @override
  String get customStatusCurrentHint => 'Trạng thái tùy chỉnh';

  @override
  String get customStatusClear => 'Xóa trạng thái tùy chỉnh';

  @override
  String get customStatusPlaceholder => 'Bạn đang làm gì?';

  @override
  String get customStatusChooseEmoji => 'Chọn biểu tượng cảm xúc';

  @override
  String get customStatusClearAfter => 'Xóa sau';

  @override
  String get customStatusSave => 'Lưu';

  @override
  String get accountActive => 'Tài khoản đang hoạt động';

  @override
  String get signOut => 'Đăng xuất';

  @override
  String get suspendedPermanentTitle => 'Tài khoản bị đình chỉ vĩnh viễn';

  @override
  String get suspendedTemporaryTitle => 'Tài khoản bị tạm ngưng';

  @override
  String get suspendedPermanentDescription =>
      'Tài khoản của bạn đã bị đình chỉ vĩnh viễn vì vi phạm Điều khoản dịch vụ của chúng tôi.';

  @override
  String get suspendedTemporaryDescription =>
      'Tài khoản của bạn đã bị tạm khóa. Bạn sẽ có thể truy cập lại tài khoản sau khi hết thời gian khóa.';

  @override
  String get suspendedIssuedAt => 'Đã ban hành';

  @override
  String get suspendedEndsAt => 'Kết thúc';

  @override
  String get suspendedDuration => 'Thời lượng';

  @override
  String get suspendedPermanent => 'Vĩnh viễn';

  @override
  String get suspendedReason => 'Lý do';

  @override
  String get suspendedAppealDeadline => 'Hạn chót kháng cáo';

  @override
  String suspendedDeletionWarning(String date) {
    return 'Tài khoản của bạn đã được lên lịch xóa vào ngày $date.';
  }

  @override
  String get suspendedRecheck => 'Kiểm tra cập nhật';

  @override
  String suspendedRecheckCooldown(int seconds) {
    return 'Kiểm tra lại sau $seconds giây';
  }

  @override
  String get suspendedBackToLogin => 'Quay lại Đăng nhập';

  @override
  String get suspendedAppealTitle => 'Kháng nghị';

  @override
  String get suspendedAppealHint =>
      'Giải thích lý do bạn nên được xem xét lại việc đình chỉ (tối thiểu 50 ký tự)...';

  @override
  String get suspendedAppealSubmit => 'Gửi kháng cáo';

  @override
  String get suspendedAppealPending => 'Chờ xem xét';

  @override
  String get suspendedAppealAccepted => 'Đã chấp nhận kháng nghị';

  @override
  String get suspendedAppealRejected => 'Yêu cầu bị từ chối';

  @override
  String get suspendedAppealAcceptedDescription =>
      'Yêu cầu của bạn đã được chấp nhận và tài khoản của bạn đã được khôi phục.';

  @override
  String get suspendedSignIn => 'Đăng nhập vào tài khoản của bạn';

  @override
  String get forgotPasswordTitle => 'Quên mật khẩu?';

  @override
  String get forgotPasswordDescription =>
      'Nhập địa chỉ email của bạn và chúng tôi sẽ gửi cho bạn một liên kết để đặt lại mật khẩu.';

  @override
  String get forgotPasswordSubmit => 'Gửi liên kết đặt lại';

  @override
  String get forgotPasswordSentTitle => 'Kiểm tra email của bạn';

  @override
  String get forgotPasswordSentDescription =>
      'Chúng tôi đã gửi hướng dẫn đặt lại mật khẩu đến địa chỉ email của bạn. Vui lòng kiểm tra hộp thư đến và nhấp vào liên kết để đặt lại mật khẩu.';

  @override
  String get forgotPasswordBackToLogin => 'Quay lại đăng nhập';

  @override
  String get resetPasswordTitle => 'Đặt mật khẩu mới';

  @override
  String get resetPasswordDescription =>
      'Nhập mật khẩu mới của bạn bên dưới để hoàn tất quá trình đặt lại.';

  @override
  String get resetPasswordNewPassword => 'Mật khẩu mới';

  @override
  String get resetPasswordConfirm => 'Xác nhận mật khẩu mới';

  @override
  String get resetPasswordSubmit => 'Đặt lại mật khẩu';

  @override
  String get resetPasswordMismatch => 'Mật khẩu không khớp.';

  @override
  String get registerTitle => 'Tạo tài khoản';

  @override
  String get registerDisplayName => 'Tên hiển thị (Tùy chọn)';

  @override
  String get registerDisplayNameHint => 'Mọi người nên gọi bạn là gì?';

  @override
  String get registerUsername => 'Tên người dùng (Tùy chọn)';

  @override
  String get registerUsernameHint => 'Để trống nếu muốn dùng tên ngẫu nhiên';

  @override
  String get registerUsernameTagHint =>
      'Một thẻ gồm 4 chữ số sẽ được thêm tự động để đảm bảo tính duy nhất';

  @override
  String get registerDateOfBirth => 'Ngày sinh';

  @override
  String get registerMonth => 'Tháng';

  @override
  String get registerDay => 'Ngày';

  @override
  String get registerYear => 'Năm';

  @override
  String get registerConsent =>
      'Tôi đồng ý với Điều khoản dịch vụ và Chính sách quyền riêng tư';

  @override
  String get registerConsentPrefix => 'Tôi đồng ý với ';

  @override
  String get registerConsentTerms => 'Điều khoản dịch vụ';

  @override
  String get registerConsentAnd => ' và ';

  @override
  String get registerConsentPrivacy => 'Chính sách bảo mật';

  @override
  String get registerConfirmPassword => 'Xác nhận mật khẩu';

  @override
  String get registerSubmit => 'Tạo tài khoản';

  @override
  String get registerHaveAccount => 'Đã có tài khoản? ';

  @override
  String get registerPendingApproval =>
      'Yêu cầu tài khoản của bạn đang chờ phê duyệt. Bạn có thể đăng nhập sau khi quản trị viên phê duyệt.';

  @override
  String get registerClosed =>
      'Hiện tại đăng ký đang đóng. Hãy dùng liên kết đăng ký từ quản trị viên để tạo tài khoản.';

  @override
  String get passkeyNoCredentials =>
      'Không tìm thấy khóa truy cập nào cho ứng dụng này. Thay vào đó, hãy đăng nhập bằng email và mật khẩu.';

  @override
  String get passkeyDeviceNotSupported =>
      'Thiết bị này không hỗ trợ khóa truy cập.';

  @override
  String get passkeyDomainNotAssociated =>
      'Mật mã không được cấu hình cho ứng dụng này. Thay vào đó, hãy đăng nhập bằng email và mật khẩu.';

  @override
  String get passkeyTimeout =>
      'Xác thực khóa truy cập đã hết thời gian. Vui lòng thử lại.';

  @override
  String get passkeyNotAvailable =>
      'Tạo khóa không khả dụng cho ứng dụng này. Thay vào đó, hãy đăng nhập bằng email và mật khẩu.';

  @override
  String get passkeyFailed =>
      'Xác thực khóa truy cập thất bại. Vui lòng thử lại.';

  @override
  String get errorUnableToCreateAccount =>
      'Không thể tạo tài khoản. Vui lòng thử lại.';

  @override
  String get errorUnableToSignIn =>
      'Không thể đăng nhập ngay bây giờ. Vui lòng thử lại.';

  @override
  String get errorServiceUnavailable =>
      'Phiên bản này tạm thời không khả dụng. Vui lòng thử lại sau.';

  @override
  String get errorInvalidEmailOrPassword => 'Email hoặc mật khẩu không hợp lệ.';

  @override
  String get errorUnableToSendResetLink =>
      'Không thể gửi liên kết đặt lại. Vui lòng thử lại.';

  @override
  String get errorUnableToResetPassword =>
      'Không thể đặt lại mật khẩu. Vui lòng thử lại.';

  @override
  String get embedInviteJoin => 'Tham gia cộng đồng';

  @override
  String get embedInviteGoTo => 'Đi tới Cộng đồng';

  @override
  String embedInviteOnline(String count) {
    return '$count người đang trực tuyến';
  }

  @override
  String embedInviteMembers(String count) {
    return '$count thành viên';
  }

  @override
  String get embedInviteUnknownTitle => 'Lời mời không hợp lệ';

  @override
  String get embedInviteUnknownSubtitle => 'Thử yêu cầu một lời mời mới.';

  @override
  String get embedInviteUnavailable => 'Lời mời không khả dụng';

  @override
  String get embedInviteJoinGroup => 'Tham gia nhóm';

  @override
  String get embedInviteAlreadyJoined => 'Đã tham gia';

  @override
  String get embedInviteDisabled => 'Đã tắt lời mời';

  @override
  String get embedInvitePaused => 'Đã tạm dừng lời mời cho cộng đồng này.';

  @override
  String embedInvitePausedRaid(String productName) {
    return '$productName đã phát hiện một cuộc tấn công tiềm ẩn, vì vậy người dùng mới không thể tham gia ngay bây giờ.';
  }

  @override
  String get inviteAcceptInvitesPausedTryAgain =>
      'Cộng đồng này đã tạm dừng lời mời. Bạn có thể thử lại sau.';

  @override
  String inviteAcceptRaidInvitesPaused(String productName) {
    return '$productName đã phát hiện một cuộc tấn công tiềm ẩn trong cộng đồng này. Lời mời đang bị tạm dừng, vì vậy người dùng mới không thể tham gia ngay bây giờ.';
  }

  @override
  String get inviteAcceptTitle => 'Bạn đã được mời tham gia';

  @override
  String get inviteAcceptJoinButton => 'Tham gia cộng đồng';

  @override
  String get inviteAcceptGoToButton => 'Đi tới Cộng đồng';

  @override
  String get inviteAcceptInvitesPaused => 'Tạm dừng lời mời';

  @override
  String get inviteAcceptNotFoundTitle => 'Lời mời không hợp lệ';

  @override
  String get inviteAcceptNotFoundDescription =>
      'Lời mời này có thể đã hết hạn hoặc không hợp lệ.';

  @override
  String get invalidDeepLinkTitle => 'Liên kết không thể mở';

  @override
  String get invalidDeepLinkDescription =>
      'Liên kết này có thể bị hỏng, chỉ khả dụng trên web hoặc bạn không có quyền truy cập. Hãy kiểm tra lại liên kết và thử lại.';

  @override
  String get invalidDeepLinkGoHomeButton => 'Về trang chủ';

  @override
  String get inviteAcceptJoinGroupButton => 'Tham gia nhóm';

  @override
  String inviteAcceptGroupDmDescription(String inviterName) {
    return 'Bạn đã được mời tham gia nhóm DM bởi $inviterName';
  }

  @override
  String get inviteAcceptSomeone => 'ai đó';

  @override
  String get inviteAcceptEmojiPack => 'Gói biểu tượng cảm xúc';

  @override
  String get inviteAcceptStickerPack => 'Gói nhãn dán';

  @override
  String get inviteAcceptInstallEmojiPack => 'Cài đặt gói biểu tượng cảm xúc';

  @override
  String get inviteAcceptInstallStickerPack => 'Cài đặt bộ sticker';

  @override
  String get inviteAcceptPackInstallNote =>
      'Chấp nhận lời mời này sẽ tự động cài đặt gói.';

  @override
  String get mentionUnknownChannel => 'unknown-channel';

  @override
  String get channelAccessDeniedTitle => 'Truy cập kênh bị từ chối';

  @override
  String get channelAccessDeniedDescription =>
      'Bạn không có quyền truy cập vào kênh đã gửi tin nhắn này.';

  @override
  String get messageJumpLinkNoAccess => 'Không có quyền truy cập';

  @override
  String get okay => 'Đồng ý';

  @override
  String get embedThemeTitle => 'Chủ đề được chia sẻ';

  @override
  String get embedThemeSubtitle =>
      'Ứng dụng này không hỗ trợ tùy chỉnh giao diện.';

  @override
  String get embedThemeUnavailableButton => 'Chủ đề không khả dụng';

  @override
  String embedGiftVisionaryLifetime(String productName) {
    return 'Visionary (trọn đời $productName)';
  }

  @override
  String embedGiftDurationDays(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ngày $productName',
      one: '1 ngày $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationWeeks(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tuần $productName',
      one: '1 tuần $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationMonths(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tháng $productName',
      one: '1 tháng $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftDurationYears(int count, String productName) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count năm $productName',
      one: '1 năm $productName',
    );
    return '$_temp0';
  }

  @override
  String embedGiftFrom(String creatorTag) {
    return 'Từ $creatorTag';
  }

  @override
  String get embedGiftClaimHelp => 'Nhấn để nhận quà!';

  @override
  String get embedGiftAlreadyRedeemed => 'Đã đổi';

  @override
  String get embedGiftClaimAccountHelp => 'Xác nhận tài khoản để nhận quà này.';

  @override
  String get embedGiftClaim => 'Nhận quà';

  @override
  String get embedGiftClaimed => 'Đã nhận quà';

  @override
  String get embedGiftClaimAccount => 'Đăng ký tài khoản để đổi quà';

  @override
  String get embedGiftUnknownTitle => 'Quà không xác định';

  @override
  String get embedGiftUnknownSubtitle =>
      'Mã quà tặng này không hợp lệ hoặc đã được nhận.';

  @override
  String get embedGiftUnavailable => 'Không có quà tặng';

  @override
  String giftAcceptClaimSubscription(String productName) {
    return 'Nhận quà của bạn để kích hoạt gói đăng ký $productName của bạn!';
  }

  @override
  String get giftAcceptAlreadyClaimed => 'Món quà này đã được nhận.';

  @override
  String get giftAcceptMaybeLater => 'Để sau';

  @override
  String get giftRedeemedToast => 'Đã đổi quà thành công!';

  @override
  String get giftRedeemInvalidTitle => 'Mã quà tặng không hợp lệ';

  @override
  String get giftRedeemInvalidMessage =>
      'Mã này không hợp lệ hoặc đã được sử dụng.';

  @override
  String get giftRedeemAlreadyRedeemedTitle => 'Quà đã được đổi';

  @override
  String get giftRedeemAlreadyRedeemedMessage => 'Mã này đã được đổi.';

  @override
  String get giftRedeemNotFoundTitle => 'Không tìm thấy quà tặng';

  @override
  String get giftRedeemNotFoundMessage => 'Mã này không tồn tại.';

  @override
  String get giftRedeemFailedTitle => 'Không thể đổi quà';

  @override
  String get giftRedeemFailedMessage =>
      'Không thể đổi quà này. Vui lòng thử lại.';

  @override
  String get giftVisionaryCannotRedeemTitle => 'Không thể đổi quà này';

  @override
  String get giftVisionaryCannotRedeemMessage =>
      'Tài khoản Visionary không thể đổi quà Plutonium. Hãy sao chép liên kết để chia sẻ với bạn bè.';

  @override
  String get giftCopyLink => 'Sao chép liên kết quà tặng';

  @override
  String get privacySettings => 'Cài đặt quyền riêng tư';

  @override
  String get privacyDirectMessages => 'Tin nhắn trực tiếp';

  @override
  String get privacyDirectMessagesDescription =>
      'Cho phép tin nhắn trực tiếp từ các thành viên khác trong cộng đồng này';

  @override
  String get privacyBotDirectMessages => 'Tin nhắn trực tiếp của bot';

  @override
  String get privacyBotDirectMessagesDescription =>
      'Cho phép bot từ cộng đồng này gửi tin nhắn trực tiếp cho bạn';

  @override
  String get privacyMutualDmsDisabled =>
      'Quản trị viên cộng đồng đã tắt tính năng nhận tin nhắn trực tiếp chỉ từ các thành viên chung trong cộng đồng này.';

  @override
  String get communityDebug => 'Gỡ lỗi cộng đồng';

  @override
  String get copiedToClipboard => 'Đã sao chép vào bảng nhớ tạm';

  @override
  String get notificationSettings => 'Cài đặt thông báo';

  @override
  String notificationMuteGuild(String guildName) {
    return 'Tắt tiếng $guildName';
  }

  @override
  String get notificationMuteDescription =>
      'Tắt tiếng cộng đồng sẽ ngăn các chỉ báo chưa đọc và thông báo xuất hiện trừ khi bạn được đề cập';

  @override
  String get notificationCommunitySettings => 'Cài đặt thông báo cộng đồng';

  @override
  String get notificationAllMessages => 'Tất cả tin nhắn';

  @override
  String get notificationOnlyMentions => 'Chỉ đề cập';

  @override
  String get notificationNothing => 'Không có gì';

  @override
  String get notificationSuppressEveryone => 'Tắt @everyone và @here';

  @override
  String get notificationSuppressRoles => 'Tắt tiếng tất cả @nhắc đến vai trò';

  @override
  String get notificationMobilePush => 'Thông báo đẩy trên di động';

  @override
  String get notificationOverrides => 'Tùy chỉnh thông báo';

  @override
  String get notificationSelectChannel => 'Chọn một kênh hoặc danh mục';

  @override
  String get notificationOnlyAtMentions => 'Chỉ @lượt nhắc';

  @override
  String get notificationMuteChannel => 'Tắt tiếng kênh';

  @override
  String get notificationUnmuteChannel => 'Bỏ tắt tiếng kênh';

  @override
  String get notificationUseCategoryDefault => 'Sử dụng mặc định của danh mục';

  @override
  String get notificationUseCommunityDefault =>
      'Sử dụng mặc định của cộng đồng';

  @override
  String get notificationNoCategory => 'Không có danh mục';

  @override
  String get dmMarkAsRead => 'Đánh dấu là đã đọc';

  @override
  String get dmMuteConversation => 'Tắt thông báo';

  @override
  String get dmUnmuteConversation => 'Bật tiếng tin nhắn';

  @override
  String get dmPinDm => 'Ghim tin nhắn trực tiếp';

  @override
  String get dmUnpinDm => 'Bỏ ghim tin nhắn';

  @override
  String get dmAlwaysShowInSidebar => 'Luôn hiển thị trên thanh bên';

  @override
  String get dmRemoveFromAlwaysShown => 'Bỏ khỏi Luôn hiển thị';

  @override
  String get dmCloseDm => 'Đóng tin nhắn';

  @override
  String get dmCloseDmConfirmTitle => 'Đóng tin nhắn';

  @override
  String dmCloseDmConfirmDescription(String username) {
    return 'Bạn có chắc chắn muốn đóng cuộc trò chuyện trực tiếp với $username không? Bạn luôn có thể mở lại sau.';
  }

  @override
  String get dmDeleteMyMessagesTitle =>
      'Xóa tin nhắn của bạn trong cuộc trò chuyện này?';

  @override
  String get dmDeleteMyMessagesDescription =>
      'Thao tác này sẽ xóa vĩnh viễn tất cả tin nhắn bạn đã gửi trong cuộc trò chuyện này. Không thể hoàn tác.';

  @override
  String get dmCopyChannelId => 'Sao chép ID kênh';

  @override
  String get dmChannelIdCopied => 'Đã sao chép ID kênh';

  @override
  String get dmCopyUserId => 'Sao chép ID người dùng';

  @override
  String get dmUserIdCopied => 'Đã sao chép ID người dùng';

  @override
  String get dmViewProfile => 'Xem hồ sơ';

  @override
  String get dmVoiceCall => 'Bắt đầu cuộc gọi thoại';

  @override
  String get incomingVoiceCallTitle => 'Cuộc gọi thoại đến';

  @override
  String get incomingVoiceCallAccept => 'Chấp nhận';

  @override
  String get incomingVoiceCallDecline => 'Từ chối';

  @override
  String get incomingVoiceCallLabel => 'Cuộc gọi đến';

  @override
  String get incomingVoiceCallIgnore => 'Bỏ qua';

  @override
  String get directVoiceCallNotEligible =>
      'Cuộc gọi này không thể bắt đầu ngay bây giờ. Vui lòng thử lại sau.';

  @override
  String get voiceJoinCallFailed =>
      'Không thể kết nối với cuộc gọi này. Hãy kiểm tra kết nối của bạn và thử lại.';

  @override
  String get voiceJoinIncomingCallFailed =>
      'Không thể tham gia cuộc gọi này. Hãy kiểm tra kết nối của bạn và thử lại.';

  @override
  String get incomingVoiceRingingUpdateFailed =>
      'Không thể cập nhật cuộc gọi này trên máy chủ. Hãy kiểm tra kết nối của bạn và thử lại.';

  @override
  String get dmAddNote => 'Thêm ghi chú';

  @override
  String get dmEditGroup => 'Sửa nhóm';

  @override
  String get dmInviteToCommunity => 'Mời vào cộng đồng';

  @override
  String get dmBlock => 'Chặn';

  @override
  String get dmLeaveGroup => 'Rời nhóm';

  @override
  String get dmNoCommunitiesAvailable => 'Không có cộng đồng nào khả dụng';

  @override
  String dmGroupMemberCount(int count) {
    return '$count thành viên';
  }

  @override
  String get dmMuteFor15Min => 'Trong 15 phút';

  @override
  String get dmMuteFor30Min => 'Trong 30 phút';

  @override
  String get dmMuteFor1Hour => 'Trong 1 giờ';

  @override
  String get dmMuteFor3Hours => 'Trong 3 giờ';

  @override
  String get dmMuteFor4Hours => 'Trong 4 giờ';

  @override
  String get dmMuteFor8Hours => 'Trong 8 giờ';

  @override
  String get dmMuteFor24Hours => 'Trong 24 giờ';

  @override
  String get dmMuteFor3Days => 'Trong 3 ngày';

  @override
  String get dmMuteForever => 'Cho đến khi tôi bật lại';

  @override
  String get dmPinGroupDm => 'Ghim nhóm DM';

  @override
  String get dmUnpinGroupDm => 'Bỏ ghim nhóm DM';

  @override
  String get dmUnnamedGroup => 'Nhóm chưa đặt tên';

  @override
  String dmOwnersGroup(String resolvedName) {
    return 'Nhóm của $resolvedName';
  }

  @override
  String get dmFavoriteDm => 'DM yêu thích';

  @override
  String get dmUnfavoriteDm => 'Bỏ yêu thích tin nhắn';

  @override
  String get dmFavoriteGroupDm => 'Ưu tiên DM nhóm';

  @override
  String get dmUnfavoriteGroupDm => 'Bỏ ghim nhóm DM';

  @override
  String get dmChangeFriendNickname => 'Đổi biệt danh bạn bè';

  @override
  String get dmRemoveFriend => 'Xóa bạn';

  @override
  String get dmAddFriend => 'Thêm bạn';

  @override
  String get dmAcceptFriendRequest => 'Chấp nhận lời mời kết bạn';

  @override
  String get dmIgnoreFriendRequest => 'Bỏ qua lời mời kết bạn';

  @override
  String get dmFriendRequestSent => 'Đã gửi lời mời kết bạn';

  @override
  String get dmUnblock => 'Bỏ chặn';

  @override
  String get dmDebugUser => 'Gỡ lỗi người dùng';

  @override
  String get dmDebugChannel => 'Gỡ lỗi kênh';

  @override
  String get dmDebugCategory => 'Gỡ lỗi danh mục';

  @override
  String get dmPinned => 'Tin nhắn đã ghim';

  @override
  String get dmUnpinned => 'DM đã bỏ ghim';

  @override
  String get dmMuted => 'Tin nhắn đã tắt tiếng';

  @override
  String get dmUnmuted => 'Đã bỏ chặn tin nhắn riêng';

  @override
  String get dmRemoveFriendConfirmTitle => 'Xóa bạn';

  @override
  String dmRemoveFriendConfirmDescription(String username) {
    return 'Bạn có chắc chắn muốn xóa $username khỏi danh sách bạn bè không?';
  }

  @override
  String get dmBlockConfirmTitle => 'Chặn người dùng';

  @override
  String dmBlockConfirmDescription(String username) {
    return 'Bạn có chắc chắn muốn chặn $username không? Họ sẽ không thể nhắn tin hoặc gửi lời mời kết bạn cho bạn.';
  }

  @override
  String get dmFriendRequestSentToast => 'Đã gửi lời mời kết bạn';

  @override
  String get dmFriendRequestFailed => 'Không gửi được lời mời kết bạn';

  @override
  String get dmAcceptFriendRequestFailed =>
      'Không thể chấp nhận lời mời kết bạn';

  @override
  String get dmRemoveFriendFailed => 'Không thể xóa bạn bè';

  @override
  String get dmBlockFailed => 'Không thể chặn người dùng';

  @override
  String get dmUnblockFailed => 'Không thể bỏ chặn người dùng';

  @override
  String get dmIgnoreFriendRequestFailed => 'Không thể bỏ qua lời mời kết bạn';

  @override
  String get dmAddFriends => 'Thêm bạn bè';

  @override
  String get addFriendSheetTitle => 'Thêm bạn bè';

  @override
  String get addFriendUsernameHint => 'Tên người dùng#0000';

  @override
  String get addFriendUsernameLabel => 'Tên người dùng của bạn bè';

  @override
  String get addFriendSendRequest => 'Gửi lời mời';

  @override
  String get addFriendNoUserFound =>
      'Không tìm thấy người dùng nào có tên đăng nhập này.';

  @override
  String get addFriendInvalidUsername =>
      'Nhập tên người dùng hợp lệ (Tên người dùng#0000).';

  @override
  String get addFriendOutgoingSuccess => 'Đã gửi lời mời kết bạn';

  @override
  String get addFriendClaimTitle => 'Xác nhận tài khoản';

  @override
  String get addFriendClaimDescription =>
      'Xác nhận tài khoản để gửi lời mời kết bạn.';

  @override
  String get addFriendVerifyTitle => 'Xác minh email của bạn';

  @override
  String get addFriendVerifyDescription =>
      'Bạn cần xác minh địa chỉ email trước khi gửi lời mời kết bạn.';

  @override
  String get addFriendVerifyEmail => 'Xác minh email';

  @override
  String addFriendIncomingRequests(int count) {
    return 'Yêu cầu kết bạn đến ($count)';
  }

  @override
  String addFriendOutgoingRequests(int count) {
    return 'Yêu cầu kết bạn đã gửi ($count)';
  }

  @override
  String get addFriendIncomingStatus => 'Lời mời kết bạn đến';

  @override
  String get addFriendOutgoingStatus => 'Đã gửi lời mời kết bạn';

  @override
  String get addFriendViewProfile => 'Xem hồ sơ';

  @override
  String get addFriendAccept => 'Chấp nhận';

  @override
  String get addFriendIgnore => 'Bỏ qua';

  @override
  String get addFriendAcceptTitle => 'Chấp nhận lời mời kết bạn';

  @override
  String get addFriendIgnoreTitle => 'Bỏ qua lời mời kết bạn';

  @override
  String addFriendAcceptConfirmDescription(String userName) {
    return 'Chấp nhận lời mời kết bạn từ $userName?';
  }

  @override
  String addFriendIgnoreConfirmDescription(String displayName) {
    return 'Bỏ qua lời mời kết bạn từ $displayName?';
  }

  @override
  String get addFriendCancelRequest => 'Hủy yêu cầu';

  @override
  String get addFriendCancelRequestFailed =>
      'Không thể hủy lời mời kết bạn. Vui lòng thử lại.';

  @override
  String get addFriendNotAcceptingRequests =>
      'Họ không chấp nhận lời mời kết bạn vào lúc này.';

  @override
  String get addFriendUnblockFirst =>
      'Bỏ chặn họ trước để gửi lời mời kết bạn.';

  @override
  String get addFriendCannotSendToSelf =>
      'Bạn không thể tự gửi lời mời kết bạn cho chính mình.';

  @override
  String get addFriendAlreadyFriends =>
      'Bạn đã là bạn bè với người dùng này rồi.';

  @override
  String get addFriendClaimToSend => 'Hoàn tất đăng ký để gửi lời mời kết bạn.';

  @override
  String get addFriendVerifyToSend =>
      'Xác minh email của bạn trước khi gửi lời mời kết bạn.';

  @override
  String get addFriendFriendsListFull =>
      'Danh sách bạn bè của bạn hoặc của họ đã đầy. Hãy xóa bớt một người và thử lại.';

  @override
  String get userTagBot => 'BOT';

  @override
  String get userTagSystem => 'Hệ thống';

  @override
  String get emojiSearchPlaceholder => 'Tìm emoji bạn thích';

  @override
  String get emojiSearchEmpty =>
      'Không có biểu tượng cảm xúc nào khớp với tìm kiếm của bạn';

  @override
  String get emojiAutocompleteDefaultLabel => 'Biểu tượng cảm xúc mặc định';

  @override
  String emojiInfoDefaultDescription(String productName) {
    return 'Đây là biểu tượng cảm xúc mặc định trên $productName.';
  }

  @override
  String get emojiInfoCustomGuildDescription =>
      'Emoji này đến từ cộng đồng này. Bạn có thể sử dụng nó ở mọi nơi.';

  @override
  String get emojiInfoCustomUnknownDescription =>
      'Đây là biểu tượng cảm xúc tùy chỉnh từ một cộng đồng.';

  @override
  String get emojiInfoCustomInviteRequiredDescription =>
      'Đây là biểu tượng cảm xúc tùy chỉnh từ một cộng đồng. Hãy hỏi tác giả để được mời sử dụng biểu tượng cảm xúc này.';

  @override
  String get emojiInfoFromHeader => 'Emoji này đến từ';

  @override
  String get emojiInfoDiscoverableCommunity => 'Cộng đồng công khai';

  @override
  String get emojiInfoPrivateCommunity => 'Cộng đồng riêng tư';

  @override
  String get emojiInfoVerifiedCommunity => 'Cộng đồng đã xác minh';

  @override
  String get emojiInfoAddToFavorites => 'Thêm vào mục yêu thích';

  @override
  String get emojiInfoRemoveFromFavorites => 'Xóa khỏi mục yêu thích';

  @override
  String get emojiFrequentlyUsed => 'Emoji đã dùng thường xuyên';

  @override
  String get emojiTabGifs => 'Ảnh GIF';

  @override
  String get emojiTabMedia => 'Phương tiện';

  @override
  String get emojiTabStickers => 'Nhãn dán';

  @override
  String get emojiTabEmojis => 'Biểu tượng cảm xúc';

  @override
  String get gifPickerSearch => 'Tìm ảnh GIF';

  @override
  String get gifPickerSearchKlipy => 'Tìm kiếm KLIPY';

  @override
  String get gifPickerSearchTenor => 'Tìm kiếm trên Tenor';

  @override
  String get gifPickerPoweredByKlipy => 'KLIPY';

  @override
  String get gifPickerFavorites => 'Mục ưa thích';

  @override
  String get gifPickerFavoritesEmptyTitle => 'Chưa có GIF yêu thích nào';

  @override
  String get gifPickerFavoritesEmptyDescription =>
      'Gắn sao cho GIF để xem tại đây.';

  @override
  String get gifPickerTrending => 'GIF thịnh hành';

  @override
  String get gifPickerNoResultsTitle => 'Không có kết quả tìm kiếm';

  @override
  String get gifPickerNoResultsDescription => 'Thử từ khóa khác';

  @override
  String get gifPickerLoadFailedTitle => 'Không tải được ảnh GIF';

  @override
  String get gifPickerLoadFailedBody => 'Kiểm tra kết nối mạng và thử lại.';

  @override
  String get emojiCategoryPeople => 'Mọi người';

  @override
  String get emojiCategoryNature => 'Thiên nhiên';

  @override
  String get emojiCategoryFood => 'Ẩm thực & Đồ uống';

  @override
  String get emojiCategoryActivity => 'Hoạt động';

  @override
  String get emojiCategoryTravel => 'Du lịch & Địa điểm';

  @override
  String get emojiCategoryObjects => 'Vật thể';

  @override
  String get emojiCategorySymbols => 'Ký hiệu';

  @override
  String get emojiCategoryFlags => 'Cờ';

  @override
  String emojiPlutoniumUpsellText(String emojiCount, String communityCount) {
    return 'Mở khóa $emojiCount từ $communityCount với Plutonium.';
  }

  @override
  String get emojiPlutoniumUpsellButton => 'Nhận Plutonium';

  @override
  String get emojiPlutoniumUpsellDismiss => 'Không hiển thị lại';

  @override
  String emojiPlutoniumUpsellCustomEmoji(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count biểu tượng cảm xúc tùy chỉnh',
      one: '1 biểu tượng cảm xúc tùy chỉnh',
    );
    return '$_temp0';
  }

  @override
  String emojiPlutoniumUpsellCommunity(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cộng đồng',
      one: '1 cộng đồng',
    );
    return '$_temp0';
  }

  @override
  String get externalLinkWarningTitle => 'Cảnh báo liên kết ngoài';

  @override
  String externalLinkWarningLeaving(String productName) {
    return 'Bạn sắp rời khỏi $productName';
  }

  @override
  String get externalLinkWarningDescription =>
      'Liên kết ngoài có thể nguy hiểm. Vui lòng cẩn thận.';

  @override
  String get externalLinkWarningDestinationUrl => 'URL đích:';

  @override
  String get externalLinksSectionTitle => 'Liên kết ngoài';

  @override
  String get externalLinksSectionDescription =>
      'Cấu hình cách xử lý cảnh báo liên kết ngoài.';

  @override
  String get externalLinkWarningTrustPrefix => 'Luôn tin cậy ';

  @override
  String get externalLinkWarningTrustSuffix => ' — bỏ qua cảnh báo này lần tới';

  @override
  String get externalLinkVisitSite => 'Truy cập trang web';

  @override
  String get externalLinkTrustAllLabel => 'Luôn tin cậy các liên kết bên ngoài';

  @override
  String get externalLinkStripTrackingLabel => 'Xóa tham số theo dõi khỏi URL';

  @override
  String get externalLinkStripTrackingDescription =>
      'Tự động xoá các tham số theo dõi (như utm_source, fbclid, gclid) khỏi URL trong tin nhắn bạn gửi. Liên kết sẽ được làm sạch trước khi đến tay người nhận.';

  @override
  String get externalLinkTrustAllConfirmTitle =>
      'Tin cậy tất cả liên kết ngoài?';

  @override
  String get externalLinkTrustAllConfirmDescription =>
      'Thao tác này sẽ tin cậy tất cả các liên kết bên ngoài và bỏ qua cảnh báo cho mọi miền. Các miền đáng tin cậy hiện có của bạn sẽ bị thay thế. Điều này kém an toàn hơn.';

  @override
  String get externalLinkTrustAllConfirmAction => 'Tin cậy tất cả';

  @override
  String get externalLinkStopTrustingAllTitle =>
      'Dừng tin cậy tất cả các liên kết?';

  @override
  String get externalLinkStopTrustingAllDescription =>
      'Cảnh báo liên kết ngoài sẽ hiển thị lại. Bạn cần thêm từng miền đáng tin cậy theo cách thủ công.';

  @override
  String get externalLinkStopTrustingAllAction => 'Tắt tin cậy tất cả';

  @override
  String get externalLinkTrustedAllDescription =>
      'Tất cả các liên kết bên ngoài đều đáng tin cậy. Sẽ không hiển thị cảnh báo.';

  @override
  String externalLinkTrustedDomainsDescription(int count) {
    return 'Bạn có $count tên miền đáng tin cậy. Thêm tên miền khác bằng cách chọn hộp kiểm khi truy cập các liên kết bên ngoài.';
  }

  @override
  String get externalLinkTrustAllDisabledDescription =>
      'Khi bật, sẽ không hiển thị cảnh báo liên kết ngoài. Điều này kém an toàn hơn.';

  @override
  String get imageFileTooLarge =>
      'Tệp ảnh quá lớn. Vui lòng chọn tệp có dung lượng nhỏ hơn 10 MB.';

  @override
  String get animatedAvatarsRequirePlutonium => 'Ảnh động cần có Plutonium';

  @override
  String get animatedBannersRequirePlutonium => 'Ảnh động yêu cầu Plutonium';

  @override
  String get animatedAvifNotSupported => 'AVIF động không được hỗ trợ';

  @override
  String get animatedAvifNotSupportedBody =>
      'Việc cắt và xoay tệp AVIF động chưa được hỗ trợ. Nếu bạn tiếp tục, tệp sẽ được tải lên ở dạng gốc.';

  @override
  String get uploadAsIs => 'Tải lên nguyên bản';

  @override
  String get croppingAnimatedNotSupported =>
      'Chưa hỗ trợ cắt ảnh động. Chúng tôi sẽ sử dụng ảnh gốc đã tải lên.';

  @override
  String get cropAvatar => 'Cắt ảnh đại diện';

  @override
  String get cropBanner => 'Cắt ảnh biểu ngữ';

  @override
  String get skip => 'Bỏ qua';

  @override
  String get crop => 'Cắt ảnh';

  @override
  String get cropTouchHint => 'Chụm để thu phóng, kéo để di chuyển';

  @override
  String get cropMouseHint =>
      'Kéo các góc để thay đổi kích thước, kéo bên trong để di chuyển';

  @override
  String get changeYourFluxerTag => 'Đổi tên người dùng';

  @override
  String get fluxerTagInputLabel => 'Tên người dùng';

  @override
  String get fluxerTagDescriptionBase =>
      'Tên người dùng chỉ có thể chứa chữ cái (a-z, A-Z), số (0-9) và dấu gạch dưới. Tên người dùng không phân biệt chữ hoa, chữ thường.';

  @override
  String get fluxerTagDescriptionVisionary =>
      'Tên người dùng chỉ có thể chứa chữ cái (a-z, A-Z), số (0-9) và dấu gạch dưới. Tên người dùng không phân biệt chữ hoa chữ thường. Bạn có thể chọn bất kỳ thẻ gồm 4 chữ số nào có sẵn từ #0000 đến #9999.';

  @override
  String get fluxerTagDescriptionPremium =>
      'Tên người dùng chỉ có thể chứa chữ cái (a-z, A-Z), số (0-9) và dấu gạch dưới. Tên người dùng không phân biệt chữ hoa chữ thường. Bạn có thể chọn bất kỳ thẻ gồm 4 chữ số nào có sẵn từ #0001 đến #9999.';

  @override
  String validationLengthRange(int min, int max) {
    return 'Từ $min đến $max ký tự';
  }

  @override
  String get validationAllowedChars =>
      'Chỉ dùng chữ cái (a-z, A-Z), số (0-9) và dấu gạch dưới (_)';

  @override
  String get discriminatorPremiumTooltip =>
      'Nhận Plutonium để tùy chỉnh thẻ của bạn hoặc giữ nguyên khi đổi tên người dùng';

  @override
  String get fluxerTagAlreadyTaken => 'Tên người dùng đã được sử dụng';

  @override
  String fluxerTagAlreadyTakenBody(String username, String discriminator) {
    return 'Tên người dùng $username#$discriminator đã được sử dụng. Tiếp tục sẽ tự động chọn lại bộ nhận dạng của bạn.';
  }

  @override
  String get customTagIsTemporary => 'Thẻ tùy chỉnh có thời hạn';

  @override
  String customTagTemporaryBodyWithDate(String date) {
    return 'Thẻ gồm 4 chữ số tùy chỉnh của bạn chỉ khả dụng khi gói đăng ký Plutonium của bạn còn hoạt động. Khi gói đăng ký của bạn hết hạn vào ngày $date, thẻ của bạn sẽ trở về số được chỉ định ngẫu nhiên sau thời gian ân hạn 3 ngày.';
  }

  @override
  String get customTagTemporaryBody =>
      'Thẻ gồm 4 chữ số tùy chỉnh của bạn chỉ khả dụng khi gói đăng ký Plutonium của bạn còn hoạt động. Khi gói đăng ký của bạn hết hạn, thẻ của bạn sẽ trở về số ngẫu nhiên sau thời gian ân hạn 3 ngày.';

  @override
  String get iUnderstandContinue => 'Tôi hiểu, Tiếp tục';

  @override
  String get premiumWarningPendingDiscriminator =>
      'Nếu bạn lưu tên người dùng này, thẻ gồm 4 chữ số tùy chỉnh của bạn sẽ trở về số ngẫu nhiên khi gói đăng ký Plutonium của bạn kết thúc. Nếu gói đăng ký của bạn không được gia hạn, bạn sẽ có 3 ngày gia hạn trước khi thẻ thay đổi.';

  @override
  String premiumWarningActiveDiscriminator(String discriminator) {
    return 'Thẻ gồm 4 chữ số tùy chỉnh của bạn (#$discriminator) sẽ hoạt động khi gói đăng ký Plutonium của bạn còn hiệu lực. Nếu gói đăng ký của bạn kết thúc hoặc không gia hạn sau thời gian ân hạn 3 ngày, thẻ của bạn sẽ trở về số ngẫu nhiên.';
  }

  @override
  String get premiumUpsellCustomizeTag =>
      'Tùy chỉnh thẻ 4 chữ số của bạn hoặc giữ nguyên khi đổi tên người dùng';

  @override
  String premiumTrialExpiresOn(String date) {
    return 'Gói Plutonium dùng thử của bạn sẽ hết hạn vào ngày $date. Nâng cấp để giữ thẻ tùy chỉnh của bạn và nhận huy hiệu trên hồ sơ.';
  }

  @override
  String get premiumTrialActive =>
      'Bạn đang dùng thử Plutonium. Nâng cấp để giữ thẻ tùy chỉnh và nhận huy hiệu trên hồ sơ của bạn.';

  @override
  String get fluxerTagUpdated => 'Đã cập nhật tên người dùng';

  @override
  String get fluxerTagUpdateFailed =>
      'Không thể cập nhật tên người dùng. Vui lòng thử lại.';

  @override
  String get continueAction => 'Tiếp tục';

  @override
  String get profileCustomizationTitle => 'Tùy chỉnh hồ sơ';

  @override
  String get profileCustomizationDescription =>
      'Chỉnh sửa giao diện hồ sơ và xem trước trực tiếp';

  @override
  String get usernameLabel => 'Tên người dùng';

  @override
  String get claimAccountToChangeFluxerTag =>
      'Xác nhận tài khoản để đổi tên người dùng';

  @override
  String get changeFluxerTag => 'Đổi tên người dùng';

  @override
  String customizeTagWithPlutoniumTooltip(String discriminator) {
    return 'Tùy chỉnh thẻ gồm 4 chữ số của bạn (#$discriminator) theo ý muốn với Plutonium';
  }

  @override
  String get changeUsernameAndTagHint =>
      'Đổi tên người dùng và thẻ gồm 4 chữ số của bạn';

  @override
  String customTagSubscriptionWarning(String discriminator) {
    return 'Thẻ tùy chỉnh của bạn (#$discriminator) được liên kết với gói đăng ký Plutonium của bạn và sẽ trở về thẻ ngẫu nhiên nếu hết hạn.';
  }

  @override
  String get displayNameLabel => 'Tên hiển thị';

  @override
  String get pronounsLabel => 'Đại từ nhân xưng';

  @override
  String get avatarLabel => 'Ảnh đại diện';

  @override
  String get changeAvatar => 'Đổi ảnh đại diện';

  @override
  String get removeAvatar => 'Xóa ảnh đại diện';

  @override
  String get avatarDescription =>
      'PNG, JPEG, WebP, GIF. Tối đa 10MB. Khuyến nghị: 512×512px';

  @override
  String get bannerLabel => 'Ảnh bìa';

  @override
  String get changeBanner => 'Thay đổi ảnh bìa';

  @override
  String get removeBanner => 'Xóa biểu ngữ';

  @override
  String get bannerDescription =>
      'PNG, JPEG, WebP, GIF. Tối đa 10MB. Tối thiểu: 960×540px (tỷ lệ 16:9)';

  @override
  String get accentColorLabel => 'Màu nhấn';

  @override
  String get accentColorDescription =>
      'Tùy chỉnh màu viền và biểu ngữ trên hồ sơ của bạn';

  @override
  String get aboutMeLabel => 'Giới thiệu về tôi';

  @override
  String get aboutMeHelperText =>
      'Bạn có thể dùng đường dẫn, biểu tượng cảm xúc và Markdown.';

  @override
  String get emojiPickerTitle => 'Biểu tượng cảm xúc';

  @override
  String get plutoniumBadgePrivacyTitle => 'Quyền riêng tư Huy hiệu Plutonium';

  @override
  String get plutoniumBadgePrivacyDescription =>
      'Kiểm soát cách huy hiệu Plutonium của bạn hiển thị với người khác';

  @override
  String get hidePlutoniumBadgeLabel => 'Ẩn hoàn toàn huy hiệu Plutonium';

  @override
  String get hidePlutoniumBadgeDescription =>
      'Ẩn hoàn toàn huy hiệu Plutonium của bạn khỏi người dùng khác';

  @override
  String get hidePlutoniumPurchaseDate => 'Ẩn ngày mua Plutonium';

  @override
  String hidePlutoniumPurchaseDateWithDate(String date) {
    return 'Ẩn ngày mua Plutonium ($date)';
  }

  @override
  String get hidePurchaseDateDescription =>
      'Xóa khi bạn lần đầu mua Plutonium khỏi huy hiệu của bạn';

  @override
  String get maskVisionaryAsSubscription =>
      'Ẩn danh hiệu Visionary (gói đăng ký)';

  @override
  String get maskVisionaryDescription =>
      'Hiển thị Visionary của bạn dưới dạng gói đăng ký thông thường';

  @override
  String get hideVisionaryIdBadge => 'Ẩn huy hiệu Visionary ID';

  @override
  String hideVisionaryIdBadgeWithSequence(int sequence) {
    return 'Ẩn huy hiệu ID Visionary (số thứ tự #$sequence)';
  }

  @override
  String get hideVisionaryIdDescription => 'Gỡ huy hiệu ID Visionary của bạn';

  @override
  String premiumTrialSubscriptionStarts(String date) {
    return 'Bạn đang dùng thử Plutonium — gói đăng ký của bạn sẽ bắt đầu vào ngày $date';
  }

  @override
  String get premiumTrialSubscriptionStartsDescription =>
      'Đăng ký của bạn sẽ tự động bắt đầu khi bản dùng thử kết thúc. Bạn không cần thực hiện hành động nào.';

  @override
  String premiumTrialExpiresOnProfile(String date) {
    return 'Bạn đang dùng thử Plutonium, sẽ hết hạn vào ngày $date';
  }

  @override
  String get premiumTrialActiveProfile => 'Bạn đang dùng thử Plutonium';

  @override
  String get avatarDescriptionNonPremium =>
      'JPEG, PNG, WebP. Tối đa 10MB. Khuyến nghị: 512×512px. Ảnh đại diện động (GIF) yêu cầu Plutonium.';

  @override
  String get bannerPlutoniumUpsell =>
      'Tùy chỉnh hồ sơ của bạn với ảnh biểu ngữ tĩnh hoặc động để làm nổi bật nó.';

  @override
  String get getPlutonium => 'Nhận Plutonium';

  @override
  String get plutoniumNotAvailableTitle => 'Plutonium';

  @override
  String get plutoniumNotAvailableBody =>
      'Tính năng mua hàng trong ứng dụng chưa khả dụng trên nền tảng này. Hãy theo dõi — sắp ra mắt!';

  @override
  String get profilePreviewLabel => 'Xem trước';

  @override
  String get profilePreviewMessage => 'Nhắn tin';

  @override
  String profilePreviewMemberSince(String productName) {
    return 'Thành viên từ $productName';
  }

  @override
  String get unclaimedAccountTitle => 'Tài khoản chưa được xác nhận';

  @override
  String get unclaimedAccountDescription =>
      'Tài khoản của bạn chưa được xác nhận. Nếu không có email và mật khẩu, bạn có thể mất quyền truy cập. Hãy xác nhận tài khoản của bạn ngay bây giờ để bảo mật.';

  @override
  String get claimAccount => 'Nhận Tài khoản';

  @override
  String get profileTypeLabel => 'Loại hồ sơ';

  @override
  String get profileTypeGlobal => 'Hồ sơ chung';

  @override
  String get profileTypeGuildDescription =>
      'Bạn đang chỉnh sửa hồ sơ riêng cho cộng đồng này. Hồ sơ này sẽ chỉ hiển thị trong cộng đồng này và sẽ ghi đè lên hồ sơ chung của bạn.';

  @override
  String get communityNicknameLabel => 'Biệt danh cộng đồng';

  @override
  String get perGuildPremiumUpsellText =>
      'Tùy chỉnh ảnh đại diện, biểu ngữ, màu sắc chủ đạo và tiểu sử của bạn cho từng cộng đồng yêu cầu Plutonium. Biệt danh cộng đồng và đại từ miễn phí cho mọi người.';

  @override
  String get avatarModeInherit => 'Sử dụng hồ sơ chung';

  @override
  String get avatarModeCustom => 'Sử dụng ảnh tùy chỉnh';

  @override
  String get avatarModeUnset => 'Không hiển thị';

  @override
  String get profileSavedToast => 'Đã cập nhật hồ sơ';

  @override
  String get profileEditButton => 'Chỉnh sửa hồ sơ';

  @override
  String get profileNoteLabel => 'Ghi chú';

  @override
  String get profileNoteVisibility => '(chỉ mình bạn thấy)';

  @override
  String get profileNoteEmpty => 'Chưa có ghi chú.';

  @override
  String get sudoTitle => 'Xác minh danh tính của bạn';

  @override
  String get sudoDescription => 'Hành động này yêu cầu xác minh để tiếp tục.';

  @override
  String get sudoAuthenticatorCode => 'Mã xác thực';

  @override
  String get sudoMethodPassword => 'Mật khẩu';

  @override
  String get sudoMethodTotp => 'Xác thực';

  @override
  String get sudoVerificationFailed => 'Xác minh thất bại. Vui lòng thử lại.';

  @override
  String get securityAccountTitle => 'Tài khoản';

  @override
  String get securityAccountDescription =>
      'Quản lý email, mật khẩu và cài đặt tài khoản của bạn';

  @override
  String get securitySectionTitle => 'Bảo mật';

  @override
  String get securitySectionDescription =>
      'Bảo vệ tài khoản của bạn bằng xác thực hai yếu tố và khóa truy cập';

  @override
  String get securityLoginEmailSectionTitle => 'Cài đặt email';

  @override
  String securityLoginEmailSectionDescription(String productName) {
    return 'Quản lý địa chỉ email bạn dùng để đăng nhập vào $productName';
  }

  @override
  String get securityLoginEmailAddressLabel => 'Địa chỉ email';

  @override
  String get securityLoginNoEmailSet => 'Chưa đặt địa chỉ email';

  @override
  String get securityLoginChangeEmail => 'Đổi địa chỉ email';

  @override
  String get securityLoginAddEmail => 'Thêm email';

  @override
  String get securityLoginReveal => 'Hiện';

  @override
  String get securityLoginHide => 'Ẩn';

  @override
  String get securityLoginPasswordSectionTitle => 'Mật khẩu';

  @override
  String get securityLoginPasswordSectionDescription =>
      'Thay đổi mật khẩu của bạn để giữ cho tài khoản an toàn';

  @override
  String get securityLoginCurrentPasswordLabel => 'Mật khẩu hiện tại';

  @override
  String securityLoginPasswordLastChanged(String date) {
    return 'Đổi lần cuối: $date';
  }

  @override
  String get securityLoginPasswordNeverChanged =>
      'Lần cuối thay đổi: Chưa bao giờ';

  @override
  String get securityLoginNoPasswordSet => 'Chưa đặt mật khẩu';

  @override
  String get securityLoginChangePassword => 'Đổi mật khẩu';

  @override
  String get securityLoginSetPassword => 'Đặt mật khẩu';

  @override
  String get passwordChangeTitle => 'Đổi mật khẩu';

  @override
  String get passwordChangeIntroDescription =>
      'Chúng tôi sẽ gửi một mã xác minh đến địa chỉ email của bạn để xác nhận danh tính trước khi thay đổi mật khẩu.';

  @override
  String get passwordChangeStart => 'Bắt đầu';

  @override
  String get passwordChangeVerifyTitle => 'Xác minh Email của bạn';

  @override
  String get passwordChangeVerifyDescription =>
      'Nhập mã xác minh đã gửi đến địa chỉ email của bạn.';

  @override
  String get passwordChangeVerificationCode => 'Mã xác minh';

  @override
  String get passwordChangeVerify => 'Xác minh';

  @override
  String get passwordChangeNewPasswordTitle => 'Đặt mật khẩu mới';

  @override
  String get passwordChangeNewPasswordDescription =>
      'Nhập mật khẩu mới của bạn bên dưới.';

  @override
  String get passwordChangeNewPassword => 'Mật khẩu mới';

  @override
  String get passwordChangeConfirmPassword => 'Xác nhận mật khẩu mới';

  @override
  String get passwordChangeSubmit => 'Đổi mật khẩu';

  @override
  String get passwordChangeSuccess => 'Đã đổi mật khẩu';

  @override
  String get passwordChangePasswordsDoNotMatch => 'Mật khẩu không khớp';

  @override
  String get passwordChangeInvalidCode => 'Mã không hợp lệ hoặc đã hết hạn';

  @override
  String get emailChangeTitle => 'Thay đổi email';

  @override
  String get emailChangeIntroDescription =>
      'Chúng tôi sẽ gửi mã xác minh để xác minh danh tính của bạn trước khi thay đổi địa chỉ email.';

  @override
  String get emailChangeStart => 'Bắt đầu';

  @override
  String get emailChangeVerifyOriginalTitle => 'Xác minh email hiện tại';

  @override
  String get emailChangeVerifyOriginalDescription =>
      'Nhập mã xác minh được gửi đến địa chỉ email hiện tại của bạn.';

  @override
  String get emailChangeNewEmailTitle => 'Nhập email mới';

  @override
  String get emailChangeNewEmailDescription =>
      'Nhập địa chỉ email mới bạn muốn sử dụng.';

  @override
  String get emailChangeNewEmailLabel => 'Email mới';

  @override
  String get emailChangeNewEmailSubmit => 'Gửi mã xác minh';

  @override
  String get emailChangeVerifyNewTitle => 'Xác minh email mới';

  @override
  String get emailChangeVerifyNewDescription =>
      'Nhập mã xác minh được gửi đến địa chỉ email mới của bạn.';

  @override
  String get emailChangeSuccess => 'Đã đổi email';

  @override
  String get emailChangeInvalidCode => 'Mã không hợp lệ hoặc đã hết hạn';

  @override
  String get resend => 'Gửi lại';

  @override
  String resendCountdown(int seconds) {
    return 'Gửi lại (${seconds}s)';
  }

  @override
  String get verificationCode => 'Mã xác minh';

  @override
  String get verify => 'Xác minh';

  @override
  String get enable => 'Bật';

  @override
  String get disable => 'Tắt';

  @override
  String get delete => 'Xóa';

  @override
  String get save => 'Lưu';

  @override
  String get securityTfaSectionTitle => 'Xác thực hai yếu tố';

  @override
  String get securityTfaSectionDescription =>
      'Thêm một lớp bảo mật cho tài khoản của bạn';

  @override
  String get securityTfaAuthenticatorApp => 'Ứng dụng xác thực';

  @override
  String get securityTfaAuthenticatorEnabled => 'Đã bật xác thực 2 yếu tố';

  @override
  String get securityTfaAuthenticatorDisabled =>
      'Dùng ứng dụng xác thực để tạo mã cho xác minh 2 bước';

  @override
  String get securityTfaBackupCodes => 'Mã dự phòng';

  @override
  String get securityTfaBackupCodesDescription =>
      'Xem và quản lý mã dự phòng để khôi phục tài khoản';

  @override
  String get securityTfaViewCodes => 'Xem mã';

  @override
  String get securityPasskeysSectionTitle => 'Mã khóa';

  @override
  String get securityPasskeysSectionDescription =>
      'Dùng mã khóa để đăng nhập không cần mật khẩu và xác thực 2 yếu tố';

  @override
  String get securityPasskeysRegistered => 'Chìa khóa truy cập đã đăng ký';

  @override
  String get securityPasskeysNone => 'Chưa đăng ký khóa truy cập nào';

  @override
  String securityPasskeysCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'khóa truy cập',
      one: 'khóa truy cập',
    );
    return '$count $_temp0 đã đăng ký (tối đa 10)';
  }

  @override
  String get securityPasskeysAdd => 'Thêm khóa truy cập';

  @override
  String securityPasskeysAdded(String date) {
    return 'Đã thêm: $date';
  }

  @override
  String securityPasskeysLastUsed(String date) {
    return 'Sử dụng lần cuối: $date';
  }

  @override
  String get securityPasskeysRename => 'Đổi tên';

  @override
  String get securityPasskeysDeleteTitle => 'Xóa khóa truy cập';

  @override
  String securityPasskeysDeleteDescription(String name) {
    return 'Bạn có chắc chắn muốn xóa khóa truy cập \"$name\" không?';
  }

  @override
  String get securityPasskeyNameTitle => 'Đặt tên cho khóa truy cập';

  @override
  String get securityPasskeyNameLabel => 'Tên khóa truy cập';

  @override
  String get securityPasskeyNameHint =>
      'ví dụ: YubiKey, iPhone, Máy tính cơ quan';

  @override
  String get securityPhoneSectionTitle => 'Số điện thoại';

  @override
  String get securityPhoneSectionDescription =>
      'Quản lý số điện thoại của bạn.';

  @override
  String get securityPhoneLabel => 'Số điện thoại';

  @override
  String get securityPhoneNone => 'Chưa thêm số điện thoại.';

  @override
  String get securityPhoneAdd => 'Thêm số điện thoại';

  @override
  String get securityPhoneRemove => 'Xóa';

  @override
  String get securityPhoneRemoveTitle => 'Xóa số điện thoại';

  @override
  String get securityPhoneRemoveDescription =>
      'Bạn có chắc chắn muốn xóa số điện thoại của mình không?';

  @override
  String get securityPhoneRemoved => 'Số điện thoại đã bị xóa';

  @override
  String get securityClaimTitle => 'Tính năng bảo mật';

  @override
  String get securityClaimDescription =>
      'Xác nhận tài khoản để truy cập các tính năng bảo mật như xác thực 2 yếu tố và mã khóa.';

  @override
  String get securityVerifyEmailRequired =>
      'Bạn phải xác minh địa chỉ email của mình trước khi có thể thiết lập xác thực hai yếu tố, khóa truy cập hoặc xác minh qua SMS.';

  @override
  String get totpEnableTitle => 'Thiết lập ứng dụng xác thực';

  @override
  String get totpEnableDescription =>
      'Quét mã QR bằng ứng dụng xác thực của bạn để tạo mã cho xác thực hai yếu tố.';

  @override
  String get totpEnableCodeLabel => 'Mã';

  @override
  String get totpEnableCodeHint =>
      'Nhập mã gồm 6 chữ số từ ứng dụng xác thực của bạn';

  @override
  String get totpEnableSuccess => 'Xác thực hai yếu tố đã được bật';

  @override
  String get totpDisableTitle => 'Xóa ứng dụng xác thực';

  @override
  String get totpDisableDescription =>
      'Nhập mã gồm 6 chữ số từ ứng dụng xác thực của bạn để tắt xác thực hai yếu tố.';

  @override
  String get totpDisableSuccess => 'Đã tắt xác thực 2 yếu tố';

  @override
  String get backupCodesTitle => 'Mã dự phòng';

  @override
  String get backupCodesWarning =>
      'Nếu bạn mất quyền truy cập vào ứng dụng xác thực và không có các mã này, bạn sẽ bị khóa vĩnh viễn khỏi tài khoản của mình. Tải xuống hoặc sao chép chúng ngay bây giờ và lưu trữ ở nơi an toàn.';

  @override
  String get backupCodesDownload => 'Tải xuống';

  @override
  String get backupCodesCopy => 'Sao chép';

  @override
  String get backupCodesCopied => 'Mã khôi phục đã sao chép vào khay nhớ tạm';

  @override
  String get backupCodesAcknowledge =>
      'Tôi đã tải xuống hoặc sao chép mã sao lưu của mình và lưu trữ chúng ở một nơi an toàn.';

  @override
  String get backupCodesDone => 'Xong';

  @override
  String get backupCodesViewTitle => 'Xem mã sao lưu';

  @override
  String get backupCodesViewDescription =>
      'Bạn có thể cần xác minh danh tính trước khi xem mã sao lưu.';

  @override
  String get phoneAddTitle => 'Thêm số điện thoại';

  @override
  String get phoneAddLabel => 'Số điện thoại';

  @override
  String get phoneAddHint => 'Nhập số điện thoại của bạn';

  @override
  String get phoneAddFooter =>
      'Chúng tôi sẽ gửi mã SMS khi có sẵn. Số của bạn không được liên kết với tài khoản của bạn. Chúng tôi chỉ giữ một mã đánh dấu được mã hóa, không có ID người dùng, để cho phép tối đa 2 lần xác minh trong khoảng 30 ngày.';

  @override
  String get phoneAddSendCode => 'Gửi mã';

  @override
  String get phoneVerifyTitle => 'Xác minh số điện thoại';

  @override
  String get phoneVerifyDescription =>
      'Nhập mã xác minh đã gửi đến số điện thoại của bạn.';

  @override
  String get phoneAddSuccess => 'Đã xác minh số điện thoại';

  @override
  String get phoneCountryLabel => 'Quốc gia';

  @override
  String get phoneSearchCountries => 'Tìm kiếm quốc gia...';

  @override
  String get phoneNumberRequired => 'Cần có số điện thoại';

  @override
  String get phoneEnterValidNumber => 'Nhập số điện thoại di động hợp lệ.';

  @override
  String get phoneCannotBeUsed =>
      'Không thể sử dụng số điện thoại này. Hãy thử số di động khác hoặc liên hệ bộ phận hỗ trợ.';

  @override
  String get phoneAlreadyUsed =>
      'Số điện thoại này đã được sử dụng. Hãy thử số khác hoặc liên hệ bộ phận hỗ trợ.';

  @override
  String get phoneCodeDidNotWork =>
      'Mã đó không đúng. Vui lòng kiểm tra lại và thử lại.';

  @override
  String get phoneTooManyAttempts =>
      'Đã thử quá nhiều lần. Vui lòng đợi một lát rồi thử lại.';

  @override
  String get phoneSmsUnavailable =>
      'Xác minh SMS hiện không khả dụng. Vui lòng thử lại sau hoặc liên hệ với bộ phận hỗ trợ.';

  @override
  String get phoneNotEligible =>
      'Xác minh số điện thoại không khả dụng cho tài khoản này. Hãy dùng phương thức khác hoặc liên hệ bộ phận hỗ trợ.';

  @override
  String get phoneCaptchaRequired =>
      'Cần xác minh trình duyệt trước khi xác minh số điện thoại. Vui lòng thử lại từ trang đăng nhập hoặc liên hệ bộ phận hỗ trợ.';

  @override
  String get phoneSomethingWentWrong => 'Đã xảy ra lỗi. Vui lòng thử lại.';

  @override
  String get phoneInboundExpensiveDescription =>
      'Gửi SMS đến số điện thoại này quá đắt, vì vậy chúng tôi cần bạn gửi SMS cho chúng tôi thay thế. Bạn cũng có thể liên hệ bộ phận hỗ trợ để chúng tôi gỡ bỏ yêu cầu này khỏi tài khoản của bạn.';

  @override
  String get phoneInboundDefaultDescription =>
      'Chúng tôi cần bạn gửi SMS để xác minh số điện thoại của mình.';

  @override
  String get phoneInboundStepOpenMessaging =>
      'Mở ứng dụng nhắn tin trên điện thoại của bạn và tạo tin nhắn văn bản mới.';

  @override
  String phoneInboundStepSendCode(String code, String number) {
    return 'Gửi mã $code đến $number.';
  }

  @override
  String get phoneInboundStepWait =>
      'Chờ chúng tôi nhận được tin nhắn của bạn. Việc này có thể mất một phút.';

  @override
  String get phoneInboundGetNewCode => 'Lấy mã mới';

  @override
  String get phoneInboundChallengeCodeLabel => 'Mã để gửi';

  @override
  String get phoneInboundOurNumberLabel => 'Gửi đến';

  @override
  String get requiredActionTitle => 'Cần xác minh tài khoản';

  @override
  String requiredActionIntroGeneric(String productName) {
    return 'Hoàn tất xác minh bắt buộc để tiếp tục sử dụng $productName.';
  }

  @override
  String get requiredActionIntroPhone =>
      'Đăng ký của bạn cần một bước kiểm tra chống spam bổ sung trước khi tiếp tục.';

  @override
  String requiredActionIntroEmailOrPhone(String productName) {
    return 'Xác minh email hoặc số điện thoại của bạn để tiếp tục sử dụng $productName.';
  }

  @override
  String requiredActionIntroEmailAndPhone(String productName) {
    return 'Hoàn tất các bước xác minh email và điện thoại bắt buộc bên dưới để tiếp tục sử dụng $productName.';
  }

  @override
  String get requiredActionChooseMethodTitle => 'Chọn phương thức xác minh';

  @override
  String requiredActionChooseMethodDescription(String productName) {
    return 'Hoàn tất một trong các phương thức xác minh dưới đây để tiếp tục sử dụng $productName.';
  }

  @override
  String get requiredActionUseEmail => 'Dùng email';

  @override
  String get requiredActionUsePhone => 'Dùng số điện thoại';

  @override
  String get requiredActionCheckEmailTitle => 'Kiểm tra email của bạn';

  @override
  String get requiredActionCheckEmailDescription =>
      'Chúng tôi đã gửi một liên kết xác minh đến địa chỉ email của bạn. Hãy mở nó để tiếp tục.';

  @override
  String get requiredActionResendVerificationEmail => 'Gửi lại email xác minh';

  @override
  String get requiredActionVerificationEmailSent =>
      'Đã gửi email xác minh. Vui lòng kiểm tra hộp thư đến của bạn.';

  @override
  String get requiredActionSignOut => 'Đăng xuất';

  @override
  String get dangerZoneSectionTitle => 'Khu vực nguy hiểm';

  @override
  String get dangerZoneSectionDescription =>
      'Các hành động không thể hoàn tác và có thể gây hậu quả nghiêm trọng';

  @override
  String get dangerZoneDisableTitle => 'Tắt tài khoản';

  @override
  String get dangerZoneDisableDescription =>
      'Tạm thời vô hiệu hóa tài khoản của bạn. Bạn có thể kích hoạt lại sau bằng cách đăng nhập lại.';

  @override
  String get dangerZoneDisableConfirmDescription =>
      'Tắt tài khoản của bạn sẽ đăng xuất bạn khỏi tất cả các phiên. Bạn có thể bật lại tài khoản của mình bất kỳ lúc nào bằng cách đăng nhập lại.';

  @override
  String get dangerZoneDeleteTitle => 'Xóa tài khoản';

  @override
  String get dangerZoneDeleteDescription =>
      'Xóa vĩnh viễn tài khoản và tất cả dữ liệu liên quan. Thao tác này không thể hoàn tác.';

  @override
  String get dangerZoneDeleteCancelSubscription =>
      'Hủy gói đăng ký Plutonium đang hoạt động của bạn trong cài đặt Plutonium trước khi xóa tài khoản.';

  @override
  String get dangerZoneDeleteCannotDeleteAccount => 'Không thể xóa tài khoản';

  @override
  String get dangerZoneDeleteOwnsCommunities =>
      'Bạn không thể xóa tài khoản khi đang sở hữu các cộng đồng. Vui lòng chuyển quyền sở hữu các cộng đồng sau trước:';

  @override
  String dangerZoneDeleteAndXMore(int count) {
    return 'và thêm $count nữa';
  }

  @override
  String dangerZoneDeleteTransferInstructions(String settingsPath) {
    return 'Để chuyển quyền sở hữu, hãy truy cập $settingsPath và chọn tùy chọn chuyển quyền sở hữu.';
  }

  @override
  String get dangerZoneDeleteConfirmDescription =>
      'Bạn có chắc chắn muốn xóa tài khoản của mình không? Thao tác này sẽ lên lịch xóa vĩnh viễn tài khoản của bạn.';

  @override
  String get dangerZoneDeleteBullet1 =>
      'Bạn có thể huỷ quá trình xoá trong vòng 14 ngày';

  @override
  String get dangerZoneDeleteBullet2 =>
      'Sau 14 ngày, tài khoản của bạn sẽ bị xóa vĩnh viễn';

  @override
  String get dangerZoneDeleteBullet3 =>
      'Sau khi quá trình xoá hoàn tất, bạn sẽ không thể khôi phục quyền truy cập vào tài khoản của mình';

  @override
  String get dangerZoneDeleteBullet4 =>
      'Bạn sẽ không thể xóa các tin nhắn đã gửi sau khi tài khoản bị xóa';

  @override
  String get dangerZoneDeleteDisclaimer =>
      'Nếu bạn muốn xuất dữ liệu hoặc xóa tin nhắn trước, vui lòng truy cập mục Bảng điều khiển quyền riêng tư trong Cài đặt người dùng trước khi tiếp tục.';

  @override
  String get claimAccountTitle => 'Nhận tài khoản của bạn';

  @override
  String get claimAccountDescription =>
      'Xác nhận tài khoản của bạn bằng cách thêm email và mật khẩu. Chúng tôi sẽ gửi mã xác minh đến email của bạn để hoàn tất.';

  @override
  String get claimAccountEmailLabel => 'Email';

  @override
  String get claimAccountPasswordLabel => 'Mật khẩu';

  @override
  String get claimAccountSendCode => 'Gửi mã';

  @override
  String get claimAccountVerifyDescription =>
      'Nhập mã chúng tôi đã gửi đến email của bạn để xác minh. Mật khẩu của bạn sẽ được đặt sau khi mã được xác nhận.';

  @override
  String get claimAccountSuccess => 'Đã xác nhận tài khoản thành công';

  @override
  String get importantInformation => 'Thông tin quan trọng:';

  @override
  String get genericError => 'Đã xảy ra lỗi';

  @override
  String get networkErrorMessage => 'Đã xảy ra lỗi. Vui lòng thử lại.';

  @override
  String get invalidCode => 'Mã không hợp lệ';

  @override
  String relativeTimeYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count năm trước',
      one: '1 năm trước',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tháng trước',
      one: '1 tháng trước',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ngày trước',
      one: '1 ngày trước',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giờ trước',
      one: '1 giờ trước',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count phút trước',
      one: '1 phút trước',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tuần trước',
      one: '1 tuần trước',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'trong $count phút',
      one: 'trong 1 phút',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'trong $count giờ',
      one: 'trong 1 giờ',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'trong $count ngày',
      one: 'trong 1 ngày',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeInWeeks(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tuần',
      one: '1 tuần',
    );
    return 'trong $_temp0';
  }

  @override
  String relativeTimeInMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tháng',
      one: '1 tháng',
    );
    return 'trong $_temp0';
  }

  @override
  String relativeTimeInYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'trong $count năm',
      one: 'trong 1 năm',
    );
    return '$_temp0';
  }

  @override
  String get relativeTimeJustNow => 'vừa xong';

  @override
  String get authorizedAppsTitle => 'Ứng dụng đã ủy quyền';

  @override
  String authorizedAppsDescription(String productName) {
    return 'Các ứng dụng này đã được cấp quyền truy cập vào tài khoản $productName của bạn.';
  }

  @override
  String get authorizedAppsEmptyTitle => 'Không có ứng dụng nào được ủy quyền';

  @override
  String get authorizedAppsEmptyDescription =>
      'Bạn chưa cấp quyền cho ứng dụng nào truy cập tài khoản của mình.';

  @override
  String get authorizedAppsLoadError => 'Không tải được ứng dụng đã ủy quyền';

  @override
  String authorizedAppsAuthorizedOn(String date) {
    return 'Đã ủy quyền vào $date';
  }

  @override
  String get authorizedAppsPermissionsGranted => 'Quyền đã cấp';

  @override
  String get authorizedAppsRevoke => 'Thu hồi';

  @override
  String get authorizedAppsRevokeTitle => 'Thu hồi quyền truy cập ứng dụng';

  @override
  String authorizedAppsRevokeDescription(String appName) {
    return 'Bạn có chắc chắn muốn thu hồi quyền truy cập của $appName không? Ứng dụng này sẽ không còn quyền truy cập vào tài khoản của bạn nữa.';
  }

  @override
  String get authorizedAppsScopeIdentify =>
      'Truy cập thông tin hồ sơ cơ bản của bạn (tên người dùng, ảnh đại diện, v.v.)';

  @override
  String get authorizedAppsScopeEmail => 'Xem địa chỉ email của bạn';

  @override
  String get authorizedAppsScopeGuilds => 'Xem các cộng đồng bạn là thành viên';

  @override
  String get authorizedAppsScopeConnections => 'Xem các tài khoản đã kết nối';

  @override
  String get authorizedAppsScopeBot =>
      'Thêm bot vào cộng đồng với các quyền được yêu cầu';

  @override
  String get authorizedAppsScopeAdmin => 'Truy cập các điểm cuối quản trị';

  @override
  String get privacyPendingDeletionTitle => 'Đang chờ xóa';

  @override
  String get blockedUsersTitle => 'Người dùng bị chặn';

  @override
  String get blockedUsersDescription =>
      'Người dùng bị chặn không thể gửi lời mời kết bạn hoặc nhắn tin trực tiếp cho bạn.';

  @override
  String get blockedUsersEmptyTitle => 'Chưa có người dùng bị chặn';

  @override
  String get blockedUsersEmptyDescription => 'Bạn chưa chặn ai.';

  @override
  String get blockedUsersLoadError => 'Không tải được người dùng bị chặn';

  @override
  String get blockedUsersUnblock => 'Bỏ chặn';

  @override
  String get blockedUsersUnblockTitle => 'Bỏ chặn người dùng';

  @override
  String blockedUsersUnblockDescription(String username) {
    return 'Bạn có chắc chắn muốn bỏ chặn $username không?';
  }

  @override
  String get blockedUsersCopyTag => 'Sao chép tên người dùng';

  @override
  String get blockedUsersCopyId => 'Sao chép ID người dùng';

  @override
  String get userProfileLoadError => 'Không thể tải hồ sơ';

  @override
  String get userProfileLoading => 'Đang tải hồ sơ';

  @override
  String get userProfileRetry => 'Thử lại';

  @override
  String get userProfileMessage => 'Nhắn tin';

  @override
  String get userProfileVoiceCall => 'Gọi thoại';

  @override
  String get userProfileVideoCall => 'Gọi video';

  @override
  String get userProfileEditProfile => 'Chỉnh sửa hồ sơ';

  @override
  String userProfileStaffBadgeTooltip(String productName) {
    return 'Nhân viên $productName';
  }

  @override
  String userProfileCtpBadgeTooltip(String productName) {
    return 'Nhóm Cộng đồng $productName';
  }

  @override
  String userProfilePartnerBadgeTooltip(String productName) {
    return 'Đối tác $productName';
  }

  @override
  String userProfileBugHunterBadgeTooltip(String productName) {
    return 'Người tìm lỗi $productName';
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
    return '$productName Plutonium thành viên từ $date';
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
    return '$productName Visionary từ $date';
  }

  @override
  String userProfileVisionaryIdTooltip(int sequence) {
    return 'ID Visionary #$sequence';
  }

  @override
  String userProfileMutualFriends(int count) {
    return 'Bạn bè chung ($count)';
  }

  @override
  String userProfileMutualCommunities(int count) {
    return 'Cộng đồng chung ($count)';
  }

  @override
  String get userProfileMutualFriendsTitle => 'Bạn bè chung';

  @override
  String get userProfileMutualCommunitiesTitle => 'Cộng đồng chung';

  @override
  String get userProfileNoMutualFriends => 'Không tìm thấy bạn chung.';

  @override
  String get userProfileNoMutualCommunities =>
      'Không tìm thấy cộng đồng chung nào.';

  @override
  String userProfileMutualCommunityNickname(String nickname) {
    return 'Biệt danh: $nickname';
  }

  @override
  String get userProfileOpenBlockedDmTitle => 'Mở tin nhắn riêng';

  @override
  String userProfileOpenBlockedDmDescription(String username) {
    return 'Bạn đã chặn $username. Bạn sẽ không thể gửi tin nhắn trừ khi bỏ chặn họ.';
  }

  @override
  String get blockedUserComposerBarrierAction => 'Bỏ chặn';

  @override
  String get userProfileOpenDm => 'Mở tin nhắn riêng';

  @override
  String get userProfileNoteTitle => 'Ghi chú';

  @override
  String get userProfileNoteVisibility => '(chỉ mình bạn thấy)';

  @override
  String get userProfileNoteSave => 'Lưu';

  @override
  String get userProfileNoteDelete => 'Xóa';

  @override
  String get userProfileNoteEmpty => 'Nhấn để thêm ghi chú';

  @override
  String get userProfileMemberSince => 'Thành viên từ';

  @override
  String get userProfileAboutMe => 'Giới thiệu';

  @override
  String get userProfileRoles => 'Vai trò';

  @override
  String get memberRoleAdd => 'Thêm vai trò';

  @override
  String memberRoleRemove(String roleName) {
    return 'Xóa vai trò $roleName';
  }

  @override
  String get userProfileNoRolesInCommunity =>
      'Người dùng này không có vai trò nào trong cộng đồng này.';

  @override
  String memberRolesNoRolesYet(String rolesSettingsPath) {
    return 'Chưa có vai trò nào. Thêm vai trò trong $rolesSettingsPath';
  }

  @override
  String get memberRolesNoRolesAvailable => 'Không có vai trò nào';

  @override
  String memberRolesNoRolesAvailableDescription(String rolesSettingsPath) {
    return 'Hiện tại không có vai trò nào để gán trong cộng đồng này, nhưng bạn có thể tạo một vai trò mới trong $rolesSettingsPath.';
  }

  @override
  String get guildSettingsTitle => 'Cài đặt cộng đồng';

  @override
  String get guildSettingsRolesTab => 'Vai trò';

  @override
  String get memberRolesConfirmOk => 'OK';

  @override
  String get userProfileLocalTime => 'Giờ địa phương';

  @override
  String get userProfileSameTimeAsYou => 'Cùng múi giờ với bạn';

  @override
  String userProfileTimeAheadOfYou(String duration) {
    return 'Trước bạn $duration';
  }

  @override
  String userProfileTimeBehindYou(String duration) {
    return 'Chậm hơn bạn $duration';
  }

  @override
  String userProfileTimezoneDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours giờ',
      one: '1 giờ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes phút',
      one: '1 phút',
    );
    return '$_temp0 $_temp1';
  }

  @override
  String userProfileTimezoneDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '$hours giờ',
      one: '1 giờ',
    );
    return '$_temp0';
  }

  @override
  String userProfileTimezoneDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '$minutes phút',
      one: '1 phút',
    );
    return '$_temp0';
  }

  @override
  String get userProfileCopyUsername => 'Sao chép tên người dùng';

  @override
  String get userProfileCopyUserId => 'Sao chép ID người dùng';

  @override
  String get userProfileViewMainProfile => 'Xem hồ sơ chính';

  @override
  String get userProfileViewCommunityProfile => 'Xem hồ sơ cộng đồng';

  @override
  String get userProfileBlockUser => 'Chặn người dùng';

  @override
  String get userProfileUnblockUser => 'Bỏ chặn người dùng';

  @override
  String get userProfileRemoveFriend => 'Xóa bạn';

  @override
  String get userProfileBlockConfirmTitle => 'Chặn người dùng';

  @override
  String userProfileBlockConfirmDescription(String username) {
    return 'Bạn có chắc chắn muốn chặn $username không?';
  }

  @override
  String get userProfileUnblockConfirmTitle => 'Bỏ chặn người dùng';

  @override
  String userProfileUnblockConfirmDescription(String username) {
    return 'Bạn có chắc chắn muốn bỏ chặn $username không?';
  }

  @override
  String get userProfileRemoveFriendConfirmTitle => 'Xóa bạn';

  @override
  String userProfileRemoveFriendConfirmDescription(String username) {
    return 'Bạn có chắc chắn muốn xóa $username khỏi danh sách bạn bè không?';
  }

  @override
  String get userProfileFailedOpenDm => 'Không thể mở DM';

  @override
  String get userProfileFailedSaveNote => 'Không thể lưu ghi chú';

  @override
  String get userProfileActionFailed => 'Hành động thất bại, vui lòng thử lại';

  @override
  String get userProfileChangeNickname => 'Đổi biệt danh';

  @override
  String get userProfileKick => 'Đuổi';

  @override
  String get userProfileBan => 'Cấm';

  @override
  String get userProfileTimeout => 'Tạm dừng';

  @override
  String get userProfileRemoveTimeout => 'Bỏ giới hạn';

  @override
  String get userProfileTransferOwnership => 'Chuyển quyền sở hữu';

  @override
  String get userProfileReportUser => 'Báo cáo người dùng';

  @override
  String get userProfileReportMessage => 'Báo cáo tin nhắn';

  @override
  String userProfileKickConfirmTitle(String username) {
    return 'Đá $username chứ?';
  }

  @override
  String userProfileKickConfirmDescription(String username) {
    return 'Bạn có chắc chắn muốn kick $username không? Họ có thể tham gia lại bằng một lời mời mới.';
  }

  @override
  String get userProfileRemoveTimeoutConfirmTitle => 'Xóa thời gian chờ?';

  @override
  String userProfileRemoveTimeoutConfirmDescription(String username) {
    return 'Việc xóa thời gian chờ sẽ cho phép $username gửi tin nhắn, phản ứng và tham gia lại các kênh thoại.';
  }

  @override
  String get userProfileTransferConfirmTitle => 'Chuyển quyền sở hữu?';

  @override
  String userProfileTransferConfirmDescription(String username) {
    return 'Chuyển quyền sở hữu cộng đồng này cho $username? Hành động này không thể hoàn tác và bạn sẽ mất tất cả các đặc quyền của chủ sở hữu.';
  }

  @override
  String userProfileBanSheetTitle(String username) {
    return 'Cấm $username';
  }

  @override
  String get userProfileBanDurationLabel => 'Thời hạn cấm';

  @override
  String get userProfileBanCustomSecondsLabel => 'Thời gian tùy chỉnh (giây)';

  @override
  String userProfileBanCustomSecondsHelper(int min, int max) {
    return 'Bất kỳ giá trị nào từ $min đến $max giây';
  }

  @override
  String get userProfileBanDeleteHistoryLabel => 'Xóa lịch sử tin nhắn';

  @override
  String get userProfileBanDeleteNone => 'Không xóa bất kỳ';

  @override
  String get userProfileBanDelete24h => '24 giờ trước';

  @override
  String get userProfileBanDelete7d => '7 ngày trước';

  @override
  String get userProfileBanReasonLabel => 'Lý do (không bắt buộc)';

  @override
  String get userProfileBanReasonHint => 'Nhập lý do cấm';

  @override
  String get userProfileBanSubmit => 'Cấm thành viên';

  @override
  String userProfileTimeoutSheetTitle(String username) {
    return 'Chặn $username';
  }

  @override
  String get userProfileTimeoutDurationLabel => 'Thời lượng tạm dừng';

  @override
  String get userProfileTimeoutSubmit => 'Hết thời gian chờ thành viên';

  @override
  String get userProfileNicknameLabel => 'Biệt danh';

  @override
  String get userProfileNicknameHint => 'Nhập biệt danh';

  @override
  String get userProfileNicknameSave => 'Lưu';

  @override
  String userProfileKickSuccess(String username) {
    return 'Đã kick $username';
  }

  @override
  String userProfileBanSuccess(String username) {
    return 'Đã cấm $username';
  }

  @override
  String userProfileTimeoutSuccess(String username) {
    return 'Đã chặn $username';
  }

  @override
  String userProfileRemoveTimeoutSuccess(String username) {
    return 'Đã gỡ hết thời gian chờ của $username';
  }

  @override
  String get userProfileNicknameSuccess => 'Đã cập nhật biệt danh';

  @override
  String get userProfileTransferSuccess => 'Đã chuyển quyền sở hữu';

  @override
  String get durationPermanent => 'Vĩnh viễn';

  @override
  String get duration60Seconds => '60 giây';

  @override
  String get duration5Minutes => '5 phút';

  @override
  String get duration10Minutes => '10 phút';

  @override
  String get duration1Hour => '1 giờ';

  @override
  String get duration12Hours => '12 giờ';

  @override
  String get duration1Day => '1 ngày';

  @override
  String get duration3Days => '3 ngày';

  @override
  String get duration5Days => '5 ngày';

  @override
  String get duration1Week => '1 tuần';

  @override
  String get duration2Weeks => '2 tuần';

  @override
  String get duration1Month => '1 tháng';

  @override
  String get durationCustom => 'Tùy chỉnh…';

  @override
  String get iarReportUserTitle => 'Báo cáo người dùng';

  @override
  String get iarReportGuildTitle => 'Báo cáo cộng đồng';

  @override
  String get iarReportGuildPreconfirmBody =>
      'Nếu báo cáo này liên quan đến một tin nhắn cụ thể trong cộng đồng này, hãy báo cáo tin nhắn đó thay vì báo cáo cộng đồng. Báo cáo tin nhắn cung cấp cho đội ngũ an toàn của chúng tôi ngữ cảnh rõ ràng nhất và việc thêm chi tiết vào phần bình luận có thể giúp chúng tôi xem xét nhanh hơn. Chỉ tiếp tục báo cáo toàn bộ cộng đồng nếu việc báo cáo một tin nhắn không thể giải quyết được vấn đề lớn hơn.';

  @override
  String get iarContinueToReportCommunity => 'Tiếp tục báo cáo cộng đồng';

  @override
  String get iarPreviewCommunitySubtitle => 'Cộng đồng';

  @override
  String get iarReasonHarassmentGuildLabel =>
      'Quấy rối hoặc nhắm mục tiêu lạm dụng';

  @override
  String get iarReasonHarassmentGuildDescription =>
      'Cộng đồng tạo điều kiện cho các cuộc tấn công hoặc lạm dụng có chủ đích.';

  @override
  String get iarReasonHateGuildDescription =>
      'Cổ súy thù ghét các nhóm được bảo vệ.';

  @override
  String get iarReasonTerrorismLabel => 'Khủng bố hoặc cực đoan bạo lực';

  @override
  String get iarReasonTerrorismDescription =>
      'Quảng bá, tuyển mộ hoặc điều phối hoạt động cực đoan bạo lực.';

  @override
  String get iarReasonMatureContentGuildLabel =>
      'Nội dung người lớn hoặc kiểm duyệt không an toàn';

  @override
  String get iarReasonMatureContentGuildDescription =>
      'Nội dung người lớn không được kiểm soát đúng cách.';

  @override
  String get iarReasonChildSafetyGuildDescription =>
      'Gây nguy hiểm cho trẻ vị thành niên hoặc chứa nội dung bóc lột trẻ em.';

  @override
  String get iarReasonRaidLabel => 'Phối hợp tấn công';

  @override
  String get iarReasonRaidDescription =>
      'Điều phối các cuộc tấn công, quấy rối hoặc gây rối có tổ chức nhắm vào người hoặc cộng đồng.';

  @override
  String get iarReasonSpamGuildDescription =>
      'Cộng đồng tồn tại để spam, lừa đảo hoặc lạm dụng nền tảng.';

  @override
  String get iarReasonMalwareGuildLabel => 'Phân phối phần mềm độc hại';

  @override
  String get iarReasonMalwareGuildDescription =>
      'Phân phối phần mềm độc hại, đánh cắp thông tin đăng nhập hoặc các tệp độc hại.';

  @override
  String get iarReasonPrivacyGuildLabel =>
      'Vi phạm quyền riêng tư hoặc doxxing';

  @override
  String get iarReasonPrivacyGuildDescription =>
      'Chia sẻ thông tin cá nhân, theo dõi người dùng hoặc phối hợp lạm dụng quyền riêng tư.';

  @override
  String get iarReasonSelfHarmGuildLabel => 'Khuyến khích tự làm hại bản thân';

  @override
  String get iarReasonSelfHarmGuildDescription =>
      'Khuyến khích tự tử, tự làm hại bản thân hoặc rối loạn ăn uống.';

  @override
  String get iarReasonInappropriateProfile => 'Hồ sơ không phù hợp';

  @override
  String get iarReasonInappropriateProfileDescription =>
      'Hồ sơ người dùng này chứa nội dung không phù hợp';

  @override
  String typingIndicatorOne(String name) {
    return '$name đang nhập...';
  }

  @override
  String typingIndicatorTwo(String name1, String name2) {
    return '$name1 và $name2 đang gõ...';
  }

  @override
  String typingIndicatorThree(String name1, String name2, String name3) {
    return '$name1, $name2 và $name3 đang gõ...';
  }

  @override
  String get typingIndicatorMultiple => 'Một vài người đang nhập...';

  @override
  String get typingIndicatorHandful => 'Một vài chiến thần bàn phím đang gõ...';

  @override
  String get typingIndicatorSymphony => 'Đang có người gõ phím...';

  @override
  String get typingIndicatorFiesta =>
      'Một bữa tiệc gõ phím đang diễn ra sôi nổi';

  @override
  String get typingIndicatorApocalypse =>
      'Chà, nhiều người đang gõ tin nhắn quá';

  @override
  String systemJoinGladYoureHere(String username) {
    return 'Chào mừng bạn đến với ứng dụng, $username!';
  }

  @override
  String systemJoinWelcomeMakeYourselfAtHome(String username) {
    return 'Chào mừng, $username! Cứ tự nhiên như ở nhà nhé.';
  }

  @override
  String systemJoinHelloNiceToHaveYouHere(String username) {
    return 'Chào $username! Rất vui được gặp bạn.';
  }

  @override
  String systemJoinHelloJumpInWheneverYoureReady(String username) {
    return 'Chào $username! Cứ tham gia bất cứ khi nào bạn sẵn sàng nhé.';
  }

  @override
  String systemJoinHeyGreatToSeeYouHere(String username) {
    return 'Chào $username, rất vui được gặp bạn!';
  }

  @override
  String systemJoinHeyThereHopeYouEnjoyYourStay(String username) {
    return 'Chào bạn, $username! Chúc bạn có thời gian vui vẻ nhé.';
  }

  @override
  String systemJoinHeyWelcomeAboard(String username) {
    return 'Chào mừng $username đến với nhóm!';
  }

  @override
  String systemJoinGladYouMadeIt(String username) {
    return 'Mừng bạn đã đến, $username!';
  }

  @override
  String systemJoinWelcomeIn(String username) {
    return 'Chào mừng bạn, $username!';
  }

  @override
  String systemJoinWelcome(String username) {
    return 'Chào mừng, $username!';
  }

  @override
  String systemJoinWelcomeWereGladYoureHere(String username) {
    return 'Chào mừng, $username! Chúng tôi rất vui vì bạn đã ở đây.';
  }

  @override
  String systemJoinWelcomeHopeYouEnjoyYourTimeHere(String username) {
    return 'Chào mừng, $username! Chúc bạn có khoảng thời gian vui vẻ tại đây.';
  }

  @override
  String systemJoinWelcomeYourNextConversationStartsHere(String username) {
    return 'Chào mừng, $username! Cuộc trò chuyện tiếp theo của bạn bắt đầu tại đây.';
  }

  @override
  String systemJoinWelcomeWereHappyToHaveYouHere(String username) {
    return 'Chào mừng, $username. Rất vui được gặp bạn tại đây.';
  }

  @override
  String systemJoinGreatToSeeYouWelcomeIn(String username) {
    return 'Rất vui được gặp bạn, $username! Chào mừng bạn đến với nhóm.';
  }

  @override
  String systemJoinYoureHereGoodToHaveYouWithUs(String username) {
    return 'Bạn đã ở đây, $username! Rất vui khi có bạn tham gia cùng chúng tôi.';
  }

  @override
  String systemJoinYouveArrivedLetsGetStarted(String username) {
    return 'Bạn đã đến, $username! Cùng bắt đầu nào.';
  }

  @override
  String get relativeTimeShortNow => 'bây giờ';

  @override
  String relativeTimeShortMinutes(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count phút',
      one: '1 phút',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortHours(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giờ',
      one: '1 giờ',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortDays(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ngày',
      one: '1 ngày',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count th',
      one: '1 th',
    );
    return '$_temp0';
  }

  @override
  String relativeTimeShortYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count năm',
      one: '1 năm',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesTitle => 'Thiết bị của tôi';

  @override
  String get linkedDevicesDescription =>
      'Xem tất cả các thiết bị hiện đang đăng nhập vào tài khoản của bạn. Thu hồi bất kỳ phiên nào bạn không nhận ra.';

  @override
  String get linkedDevicesCurrentDevice => 'Thiết bị hiện tại';

  @override
  String get linkedDevicesOtherDevices => 'Thiết bị khác';

  @override
  String get linkedDevicesEnterSelection => 'Vào chế độ chọn';

  @override
  String get linkedDevicesExitSelection => 'Thoát chế độ chọn';

  @override
  String get linkedDevicesSelectAll => 'Chọn tất cả';

  @override
  String get linkedDevicesClearSelection => 'Bỏ chọn';

  @override
  String get linkedDevicesRevokeTooltip => 'Thu hồi thiết bị';

  @override
  String get linkedDevicesSignOutAll =>
      'Đăng xuất khỏi tất cả các thiết bị khác';

  @override
  String linkedDevicesSignOutN(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đăng xuất $count thiết bị',
      one: 'Đăng xuất 1 thiết bị',
    );
    return '$_temp0';
  }

  @override
  String linkedDevicesSignOutSheetTitle(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đăng xuất khỏi $count thiết bị',
      one: 'Đăng xuất khỏi 1 thiết bị',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetTitle =>
      'Đăng xuất khỏi tất cả các thiết bị khác';

  @override
  String linkedDevicesSignOutSheetDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Thao tác này sẽ đăng xuất các thiết bị đã chọn khỏi tài khoản của bạn. Bạn sẽ cần đăng nhập lại trên các thiết bị đó.',
      one:
          'Thao tác này sẽ đăng xuất thiết bị đã chọn khỏi tài khoản của bạn. Bạn sẽ cần đăng nhập lại trên thiết bị đó.',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesSignOutAllSheetDescription =>
      'Thao tác này sẽ đăng xuất các thiết bị đã chọn khỏi tài khoản của bạn. Bạn sẽ cần đăng nhập lại trên các thiết bị đó.';

  @override
  String get linkedDevicesSignOutConfirm => 'Tiếp tục';

  @override
  String get linkedDevicesLogoutDisclaimer =>
      'Bạn sẽ phải đăng nhập lại trên tất cả các thiết bị đã đăng xuất';

  @override
  String get linkedDevicesLoadErrorTitle => 'Lỗi mạng';

  @override
  String get linkedDevicesLoadErrorDescription =>
      'Chúng tôi gặp sự cố khi kết nối với không-thời gian. Vui lòng kiểm tra kết nối của bạn và thử lại.';

  @override
  String linkedDevicesRevokeSuccess(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã thu hồi thiết bị',
      one: 'Đã thu hồi thiết bị',
    );
    return '$_temp0';
  }

  @override
  String get linkedDevicesRevokeError =>
      'Không thể đăng xuất. Vui lòng thử lại.';

  @override
  String get linkedDevicesUnknownOs => 'Hệ điều hành không xác định';

  @override
  String get linkedDevicesUnknownPlatform => 'Nền tảng không xác định';

  @override
  String slowmodeLabel(String duration) {
    return '$duration chế độ chậm';
  }

  @override
  String get slowmodeTooltipActive =>
      'Bạn đang ở chế độ chậm. Vui lòng đợi trước khi gửi tin nhắn khác.';

  @override
  String get slowmodeTooltipImmune =>
      'Chế độ làm chậm đã bật, nhưng bạn được miễn trừ.';

  @override
  String get slowmodeStatusEnabled => 'Chế độ chậm đang bật';

  @override
  String slowmodeStatusActive(String remaining) {
    return 'Chế độ chậm đang hoạt động ($remaining)';
  }

  @override
  String slowmodeTooltipSetImmune(String durationLabel) {
    return 'Chế độ chậm được đặt thành $durationLabel, nhưng bạn được miễn trừ.';
  }

  @override
  String slowmodeTooltipSetWait(String durationLabel) {
    return 'Chế độ chậm được đặt thành $durationLabel. Hãy đợi trước khi gửi tin nhắn khác.';
  }

  @override
  String slowmodeTooltipSetChannel(String durationLabel) {
    return 'Chế độ chậm được đặt thành $durationLabel cho kênh này.';
  }

  @override
  String get channelNoSendPermissionHint =>
      'Bạn không thể gửi tin nhắn trong kênh này.';

  @override
  String systemDmComposerBarrier(String productName) {
    return 'Thông báo hệ thống từ đội ngũ $productName. Bạn không thể trả lời tại đây.';
  }

  @override
  String get channelComposerBarrierGuildSendDisabled =>
      'Tính năng nhắn tin tạm thời bị tạm dừng trong cộng đồng này.';

  @override
  String get channelComposerBarrierTimedOut =>
      'Bạn đã bị tạm dừng. Tính năng nhắn tin, bày tỏ cảm xúc và thoại sẽ tạm dừng cho đến khi hết thời gian chờ.';

  @override
  String get channelComposerBarrierUnclaimedAccount =>
      'Bạn cần xác nhận tài khoản để gửi tin nhắn trong cộng đồng này.';

  @override
  String get channelComposerBarrierUnverifiedEmail =>
      'Bạn cần xác minh email để gửi tin nhắn trong cộng đồng này.';

  @override
  String get channelComposerBarrierAccountTooNew =>
      'Tài khoản của bạn còn quá mới để gửi tin nhắn trong cộng đồng này.';

  @override
  String get channelComposerBarrierNotMemberLongEnough =>
      'Bạn chưa phải là thành viên đủ lâu để gửi tin nhắn trong cộng đồng này.';

  @override
  String get channelComposerBarrierNoPhoneNumber =>
      'Bạn cần xác minh số điện thoại để gửi tin nhắn trong cộng đồng này.';

  @override
  String get channelComposerBarrierVerifyEmail => 'Xác minh email';

  @override
  String get channelComposerBarrierVerifyPhone => 'Xác minh số điện thoại';

  @override
  String chatAttachmentTooMany(int max) {
    return 'Quá nhiều tệp đính kèm (tối đa $max)';
  }

  @override
  String chatAttachmentFileTooLarge(String fileName, String fileSize) {
    return '$fileName vượt quá giới hạn kích thước ($fileSize)';
  }

  @override
  String get chatAttachmentPayloadTooLarge =>
      'Các tệp này quá lớn để gửi cùng nhau';

  @override
  String get chatAttachmentDropToUpload => 'Thả tệp để tải lên';

  @override
  String get chatAttachmentDropToSend => 'Thả tệp để gửi ngay';

  @override
  String get chatAttachmentSendVoiceMessage => 'Gửi tin nhắn thoại';

  @override
  String get voiceMessageTitle => 'Tin nhắn thoại';

  @override
  String get voiceMessageHoldHint =>
      'Nhấn giữ để ghi âm. Kéo vào thùng rác để xóa, vuốt lên để khóa, hoặc thả ra để gửi.';

  @override
  String get voiceMessageDiscard => 'Hủy tin nhắn thoại';

  @override
  String get voiceMessageSend => 'Gửi tin nhắn thoại';

  @override
  String get voiceMessageMicPermissionDenied =>
      'Không thể bắt đầu ghi âm. Vui lòng cho phép truy cập micrô.';

  @override
  String get voiceMessageRecordingNotSupported =>
      'Thiết bị này không hỗ trợ ghi âm giọng nói.';

  @override
  String get voiceMessageMicInUse =>
      'Rời khỏi cuộc gọi thoại để ghi âm tin nhắn thoại.';

  @override
  String get voiceMessageRecordingFailed => 'Ghi âm không thành công. Thử lại.';

  @override
  String get voiceMessageSendFailed =>
      'Không gửi được tin nhắn thoại. Vui lòng thử lại.';

  @override
  String get voiceMessageRecordingHint =>
      'Bắt đầu nói. Nhấn Dừng khi bạn hoàn tất — bạn có thể cắt sau.';

  @override
  String get voiceMessageReviewHint =>
      'Kéo các điểm điều khiển để cắt, sau đó nhấn Gửi.';

  @override
  String get voiceMessageStop => 'Dừng';

  @override
  String get voiceMessageStartRecording => 'Bắt đầu ghi âm';

  @override
  String get voiceMessageRerecord => 'Ghi âm lại';

  @override
  String get voiceMessagePlay => 'Phát';

  @override
  String get voiceMessagePause => 'Tạm dừng';

  @override
  String get voiceMessageSeekForward => 'Tua tới';

  @override
  String get voiceMessageSeekBackward => 'Lùi lại';

  @override
  String voiceMessageSelectionTooShort(num seconds) {
    final intl.NumberFormat secondsNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String secondsString = secondsNumberFormat.format(seconds);

    return 'Đoạn đã chọn phải dài tối thiểu $secondsString giây.';
  }

  @override
  String get chatAttachmentEditTitle => 'Chỉnh sửa tệp đính kèm';

  @override
  String get chatAttachmentFilenameLabel => 'Tên tệp';

  @override
  String get chatAttachmentDescriptionLabel => 'Mô tả';

  @override
  String get chatAttachmentDescriptionHint => 'Văn bản thay thế tùy chọn';

  @override
  String get chatAttachmentSpoilerLabel => 'Đánh dấu là spoiler';

  @override
  String get chatAttachmentRemove => 'Xóa tệp đính kèm';

  @override
  String get chatAttachmentDownload => 'Tải xuống';

  @override
  String get chatAttachmentDownloadedToast => 'Đã lưu vào ảnh';

  @override
  String get chatAttachmentDownloadFailedToast =>
      'Không thể tải xuống tệp đính kèm';

  @override
  String get chatAttachmentExpiredTooltip => 'Tệp đính kèm đã hết hạn';

  @override
  String chatTextualPreviewExpandLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mở rộng ($count dòng)',
      one: 'Mở rộng ($count dòng)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Thu gọn ($count dòng)',
      one: 'Thu gọn ($count dòng)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewExpandRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Mở rộng ($count hàng)',
      one: 'Mở rộng ($count hàng)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewCollapseRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Thu gọn ($count hàng)',
      one: 'Thu gọn ($count hàng)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingLines(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (còn $count dòng)',
      one: '... (còn $count dòng)',
    );
    return '$_temp0';
  }

  @override
  String chatTextualPreviewRemainingRows(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '... (còn lại $count hàng)',
      one: '... (còn lại $count hàng)',
    );
    return '$_temp0';
  }

  @override
  String get chatTextualPreviewViewWholeFile => 'Xem toàn bộ tệp';

  @override
  String get chatTextualPreviewChangeLanguage => 'Đổi ngôn ngữ';

  @override
  String get chatTextualPreviewSearchLanguage => 'Tìm ngôn ngữ…';

  @override
  String get chatTextualPreviewSyntaxHighlighting => 'Tô sáng cú pháp';

  @override
  String get chatTextualPreviewNoLanguagesFound => 'Không tìm thấy kết quả nào';

  @override
  String get chatTextualPreviewMoreOptions => 'Tùy chọn khác';

  @override
  String get chatTextualPreviewWrapText => 'Ngắt dòng';

  @override
  String chatTextualPreviewSizeError(int previewLimitKb) {
    return 'Tệp quá lớn để xem trước nội tuyến (giới hạn $previewLimitKb KB).';
  }

  @override
  String get chatTextualPreviewLoadError => 'Không thể tải bản xem trước.';

  @override
  String get chatTextualPreviewLanguagePlaintext => 'Văn bản thuần túy';

  @override
  String get chatTextualPreviewCopy => 'Sao chép';

  @override
  String get chatAttachmentSourceGallery => 'Thư viện ảnh';

  @override
  String get chatAttachmentSourceCamera => 'Máy ảnh';

  @override
  String get chatAttachmentSourceBrowse => 'Duyệt tệp';

  @override
  String get chatAttachmentPasteTooltip => 'Dán tệp từ khay nhớ tạm';

  @override
  String get chatAttachmentSpoiler => 'Nội dung ẩn';

  @override
  String get chatMediaSpoilerOverlayLabel => 'SPOILER';

  @override
  String get chatMediaSpoilerRevealLabel => 'Hiện nội dung ẩn';

  @override
  String get matureMediaRevealButton => 'Hiện';

  @override
  String get matureMediaRevealHint => 'Nhấn để xem';

  @override
  String get matureContentTitle => 'Nội dung nhạy cảm';

  @override
  String get matureCommunityTitle => 'Cộng đồng có nội dung nhạy cảm';

  @override
  String get matureCategoryTitle => 'Danh mục nội dung người lớn';

  @override
  String get matureChannelTitle => 'Kênh dành cho người trưởng thành';

  @override
  String get communityContentWarningTitle => 'Cảnh báo nội dung cộng đồng';

  @override
  String get categoryContentWarningTitle => 'Cảnh báo nội dung danh mục';

  @override
  String get channelContentWarningTitle => 'Cảnh báo nội dung kênh';

  @override
  String get defaultContentWarningBody =>
      'Nội dung này có chứa thông tin nhạy cảm.';

  @override
  String get matureCommunityBody =>
      'Cộng đồng này được đánh dấu là có nội dung dành cho người trưởng thành và có thể chứa tài liệu không phù hợp với một số người dùng.';

  @override
  String get matureCategoryBody =>
      'Danh mục này được đánh dấu là nội dung nhạy cảm và có thể chứa tài liệu không phù hợp với một số người dùng.';

  @override
  String get matureChannelBody =>
      'Kênh này được đánh dấu là có nội dung nhạy cảm và có thể chứa tài liệu không phù hợp với một số người dùng.';

  @override
  String get matureVoiceChannelBody =>
      'Kênh thoại này được đánh dấu là nội dung nhạy cảm và có thể chứa tài liệu không phù hợp với một số người dùng.';

  @override
  String get matureLinkChannelBody =>
      'Kênh liên kết này được đánh dấu là nội dung người lớn và có thể chứa tài liệu không phù hợp với một số người dùng.';

  @override
  String get matureCommunityUnavailableBody =>
      'Cộng đồng dành cho người trưởng thành này không khả dụng với tài khoản của bạn.';

  @override
  String get matureCategoryUnavailableBody =>
      'Danh mục dành cho người trưởng thành này không khả dụng với tài khoản của bạn.';

  @override
  String get matureChannelUnavailableBody =>
      'Kênh dành cho người trưởng thành này không khả dụng với tài khoản của bạn.';

  @override
  String get matureContentProceedButton => 'Tiếp tục';

  @override
  String get matureContentUnderstandButton => 'Tôi đã hiểu';

  @override
  String get matureContentOpenLinkButton => 'Mở liên kết';

  @override
  String get sensitiveContentSectionTitle => 'Nội dung nhạy cảm';

  @override
  String get sensitiveContentSectionDescription =>
      'Kiểm soát mức độ lọc nội dung đa phương tiện nhạy cảm hoặc trưởng thành trong các ngữ cảnh khác nhau';

  @override
  String get sensitiveContentFriendDmLabel => 'Tin nhắn trực tiếp từ bạn bè';

  @override
  String get sensitiveContentNonFriendDmLabel =>
      'Tin nhắn trực tiếp từ người khác';

  @override
  String get sensitiveContentGuildLabel => 'Tin nhắn trong kênh cộng đồng';

  @override
  String get sensitiveContentFilterShow => 'Hiển thị';

  @override
  String get sensitiveContentFilterBlur => 'Làm mờ';

  @override
  String get sensitiveContentFilterBlock => 'Chặn';

  @override
  String get sensitiveContentBlurUnscannedLabel =>
      'Che ảnh phương tiện cho đến khi quét an toàn hoàn tất';

  @override
  String get sensitiveContentBlurUnscannedDescriptionAdult =>
      'Khi bật, ảnh và video sẽ bị làm mờ cho đến khi quá trình quét an toàn nội dung hoàn tất.';

  @override
  String get sensitiveContentBlurUnscannedDescriptionMinor =>
      'Cài đặt này luôn bật cho tài khoản của bạn.';

  @override
  String get sensitiveContentResetButton => 'Đặt lại';

  @override
  String get sensitiveContentSaveButton => 'Lưu';

  @override
  String chatUploadingAttachmentsSummary(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tệp',
      one: '1 tệp',
    );
    return 'Đang tải lên $_temp0';
  }

  @override
  String get chatCancelUpload => 'Hủy tải lên';

  @override
  String chatAttachmentExpiresOn(String date) {
    return 'Hết hạn vào $date';
  }

  @override
  String chatAttachmentExpiresBetween(String start, String end) {
    return 'Hết hạn từ $start đến $end';
  }

  @override
  String get connectionsTitle => 'Kết nối';

  @override
  String connectionsDescription(String productName) {
    return 'Liên kết các tài khoản và miền bên ngoài với hồ sơ $productName của bạn. Các kết nối đã xác minh sẽ hiển thị trên hồ sơ của bạn để người khác xem.';
  }

  @override
  String get connectionsEmptyTitle => 'Chưa có kết nối nào';

  @override
  String get connectionsEmptyDescriptionBluesky =>
      'Liên kết tài khoản Bluesky của bạn hoặc xác minh quyền sở hữu tên miền để hiển thị chúng trên hồ sơ của bạn.';

  @override
  String get connectionsEmptyDescriptionDomainOnly =>
      'Xác minh quyền sở hữu tên miền để hiển thị trên hồ sơ của bạn.';

  @override
  String get connectionsAddBluesky => 'Bluesky';

  @override
  String get connectionsAddDomain => 'Miền';

  @override
  String get connectionsAddBlueskyAriaLabel => 'Thêm kết nối Bluesky';

  @override
  String get connectionsAddDomainAriaLabel => 'Thêm kết nối miền';

  @override
  String get connectionEdit => 'Chỉnh sửa';

  @override
  String get connectionRemove => 'Xóa';

  @override
  String get connectionVerifiedLabel => 'Kết nối này đã được xác minh.';

  @override
  String get connectionUnverifiedLabel => 'Kết nối này chưa được xác minh.';

  @override
  String get connectionAddTitle => 'Thêm kết nối';

  @override
  String get connectionTypeLabel => 'Loại kết nối';

  @override
  String get connectionHandleLabel => 'Tên người dùng';

  @override
  String get connectionDomainLabel => 'Miền';

  @override
  String get connectionHandlePlaceholder => 'username.bsky.social';

  @override
  String get connectionDomainPlaceholder => 'example.com';

  @override
  String get connectionAlreadyExists => 'Bạn đã có kết nối này rồi.';

  @override
  String get connectionConnectBluesky => 'Kết nối với Bluesky';

  @override
  String get connectionContinue => 'Tiếp tục';

  @override
  String get connectionVerifyTitle => 'Xác minh kết nối';

  @override
  String get connectionVerifyInstructions =>
      'Sử dụng bản ghi bên dưới để chứng minh quyền sở hữu tên miền.';

  @override
  String get connectionDnsRecordTitle => 'Bản ghi DNS TXT';

  @override
  String get connectionDnsHostLabel => 'Chủ phòng';

  @override
  String get connectionDnsValueLabel => 'Giá trị';

  @override
  String get connectionCopyHost => 'Sao chép máy chủ';

  @override
  String get connectionCopyValue => 'Sao chép giá trị';

  @override
  String get connectionCopied => 'Đã sao chép!';

  @override
  String get connectionTokenFileTitle => 'Cung cấp tệp token';

  @override
  String get connectionTokenFileDescription =>
      'Tải xuống **fluxer-verification** và đặt nó vào thư mục **.well-known** của bạn để chúng tôi có thể xác thực miền.';

  @override
  String get connectionTokenFileDownload => 'Tải xuống fluxer-verification';

  @override
  String connectionTokenFileMeta(String dnsUrl) {
    return 'Tệp này chứa mã thông báo xác minh mà chúng tôi sẽ lấy từ **$dnsUrl**.';
  }

  @override
  String get connectionSaveTokenDialogTitle => 'Lưu fluxer-verification';

  @override
  String get connectionVerifyButton => 'Xác minh';

  @override
  String get connectionBack => 'Quay lại';

  @override
  String get connectionEditTitle => 'Chỉnh sửa kết nối';

  @override
  String get connectionEditDescription =>
      'Chọn người có thể xem kết nối này trên hồ sơ của bạn.';

  @override
  String get connectionVisibilityEveryone => 'Mọi người';

  @override
  String get connectionVisibilityEveryoneDesc =>
      'Cho phép mọi người xem kết nối này trên hồ sơ của bạn';

  @override
  String get connectionVisibilityFriends => 'Bạn bè';

  @override
  String get connectionVisibilityFriendsDesc =>
      'Cho phép bạn bè xem kết nối này';

  @override
  String get connectionVisibilityCommunityMembers => 'Thành viên cộng đồng';

  @override
  String get connectionVisibilityCommunityMembersDesc =>
      'Cho phép thành viên từ các cộng đồng bạn tham gia xem kết nối này';

  @override
  String get connectionRemoveTitle => 'Xóa kết nối';

  @override
  String get connectionRemoveDescription =>
      'Bạn có chắc chắn muốn xóa kết nối này không? Hành động này không thể hoàn tác.';

  @override
  String get connectionRemoveConfirm => 'Xóa';

  @override
  String get connectionsLoadError => 'Không tải được danh sách kết nối';

  @override
  String get connectionsReorderError => 'Không thể cập nhật thứ tự';

  @override
  String get connectionInitiateFailed => 'Không thể bắt đầu xác minh. Thử lại.';

  @override
  String get connectionVerifyFailed =>
      'Không thể xác minh. Hãy kiểm tra bản ghi DNS của bạn và thử lại.';

  @override
  String get connectionBlueskyAuthorizeFailed =>
      'Không thể bắt đầu ủy quyền Bluesky.';

  @override
  String get connectionUpdateFailed => 'Không thể cập nhật kết nối';

  @override
  String get connectionRemoveFailed => 'Không thể xóa kết nối';

  @override
  String get connectionTokenSavedToast => 'Đã lưu fluxer-verification';

  @override
  String get connectionTokenSaveFailedToast => 'Không thể lưu tệp';

  @override
  String get connectionEnterHandle => 'Nhập một tên người dùng Bluesky.';

  @override
  String get connectionEnterDomain => 'Nhập một tên miền.';

  @override
  String get lookAndFeelTitle => 'Giao diện';

  @override
  String get lookAndFeelThemeSectionTitle => 'Giao diện';

  @override
  String get lookAndFeelThemeSectionDescription =>
      'Chọn giao diện tối, than hoặc sáng.';

  @override
  String get lookAndFeelHdrSectionTitle => 'Dải tương phản động cao';

  @override
  String get lookAndFeelHdrSectionDescription =>
      'Kiểm soát cách hiển thị hình ảnh HDR trên màn hình có hỗ trợ HDR.';

  @override
  String get lookAndFeelHdrFullName => 'Dải tương phản động đầy đủ';

  @override
  String get lookAndFeelHdrFullDescription =>
      'Hiển thị ảnh HDR với độ sáng và dải màu đầy đủ.';

  @override
  String get lookAndFeelHdrStandardName => 'Phạm vi tiêu chuẩn';

  @override
  String get lookAndFeelHdrStandardDescription =>
      'Ánh xạ tông màu ảnh HDR về dải tiêu chuẩn, giảm độ sáng tối đa.';

  @override
  String get lookAndFeelHdrDisplayModeLabel =>
      'Chế độ hiển thị dải tương phản động rộng';

  @override
  String get lookAndFeelThemeDark => 'Chủ đề tối';

  @override
  String get lookAndFeelThemeCoal => 'Chủ đề Than';

  @override
  String get lookAndFeelThemeLight => 'Chủ đề sáng';

  @override
  String get lookAndFeelThemeSystem => 'Chủ đề hệ thống';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesLabel =>
      'Đồng bộ giao diện trên các thiết bị';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesDescription =>
      'Khi bật, thay đổi giao diện sẽ đồng bộ hóa tới tất cả thiết bị của bạn. Khi tắt, thiết bị này sẽ sử dụng cài đặt giao diện riêng.';

  @override
  String get lookAndFeelSyncThemeAcrossDevicesSystemDescription =>
      'Chủ đề hệ thống tự động tắt đồng bộ hóa để theo dõi tùy chọn của hệ thống trên thiết bị này.';

  @override
  String get lookAndFeelThemeSyncFailed =>
      'Không thể đồng bộ giao diện với tài khoản của bạn. Vui lòng thử lại.';

  @override
  String get lookAndFeelChatFontScalingTitle => 'Tỷ lệ cỡ chữ trò chuyện';

  @override
  String get lookAndFeelChatFontScalingDescription =>
      'Điều chỉnh cỡ chữ trong cuộc trò chuyện.';

  @override
  String get lookAndFeelChatFontSizeLabel => 'Cỡ chữ trò chuyện';

  @override
  String get lookAndFeelAppZoomTitle => 'Mức thu phóng ứng dụng';

  @override
  String get lookAndFeelAppZoomDescription =>
      'Điều chỉnh mức thu phóng của ứng dụng.';

  @override
  String get lookAndFeelChatWallpaperTitle => 'Chat Wallpaper';

  @override
  String get lookAndFeelChatWallpaperDescription =>
      'Choose a background for chat. This stays on this device.';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyTooltip =>
      'This setting stays on this device';

  @override
  String get lookAndFeelChatWallpaperLocalOnlyToast =>
      'Chat wallpaper is saved on this device only and does not sync to other devices.';

  @override
  String get lookAndFeelChatWallpaperDefaultLabel => 'Default';

  @override
  String get lookAndFeelChatWallpaperCustomLabel => 'Custom image';

  @override
  String lookAndFeelChatWallpaperColorLabel(String id) {
    return 'Color $id';
  }

  @override
  String lookAndFeelChatWallpaperGradientLabel(String id) {
    return 'Gradient $id';
  }

  @override
  String get lookAndFeelChatWallpaperDimLabel => 'Dim wallpaper';

  @override
  String get lookAndFeelChatWallpaperPickFailed =>
      'Could not set that image as your wallpaper.';

  @override
  String get lookAndFeelMessagesSectionTitle => 'Tin nhắn';

  @override
  String get lookAndFeelMessagesSectionDescription =>
      'Chọn cách tin nhắn hiển thị trong các kênh chat.';

  @override
  String get lookAndFeelMessageGroupSpacingLabel =>
      'Khoảng cách giữa các nhóm tin nhắn';

  @override
  String lookAndFeelMessageGroupSpacingValue(int spacing) {
    return '${spacing}px';
  }

  @override
  String get lookAndFeelMessageDisplayModeLabel => 'Chế độ hiển thị tin nhắn';

  @override
  String get lookAndFeelMessageDisplayComfyName => 'Thoải mái';

  @override
  String get lookAndFeelMessageDisplayComfyDescription =>
      'Bố cục rộng rãi với các tin nhắn được phân tách rõ ràng.';

  @override
  String get lookAndFeelMessageDisplayDenseName => 'Dày đặc';

  @override
  String get lookAndFeelMessageDisplayDenseDescription =>
      'Tối đa tin nhắn hiển thị với khoảng cách tối thiểu.';

  @override
  String get lookAndFeelHideUserAvatarsLabel => 'Ẩn ảnh đại diện người dùng';

  @override
  String get lookAndFeelInterfaceTitle => 'Giao diện';

  @override
  String get lookAndFeelInterfaceDescription =>
      'Tùy chỉnh giao diện và hành vi ứng dụng.';

  @override
  String get lookAndFeelChannelTypingIndicatorsTitle =>
      'Hiển thị trạng thái đang nhập trong danh sách kênh';

  @override
  String get lookAndFeelChannelTypingIndicatorsDescription =>
      'Chọn cách hiển thị chỉ báo đang gõ trong danh sách kênh khi ai đó đang gõ trong kênh.';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsName =>
      'Chỉ báo đang gõ + Ảnh đại diện';

  @override
  String get lookAndFeelChannelTypingIndicatorAvatarsDescription =>
      'Hiển thị trạng thái đang nhập tin nhắn với ảnh đại diện trong danh sách kênh';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyName =>
      'Chỉ hiển thị chỉ báo đang gõ';

  @override
  String get lookAndFeelChannelTypingIndicatorOnlyDescription =>
      'Chỉ hiển thị trạng thái đang nhập, không hiển thị ảnh đại diện';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenName => 'Đã ẩn';

  @override
  String get lookAndFeelChannelTypingIndicatorHiddenDescription =>
      'Không hiển thị trạng thái đang nhập trong danh sách kênh';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorLabel =>
      'Hiển thị trạng thái đang gõ trên kênh đã chọn';

  @override
  String get lookAndFeelShowSelectedChannelTypingIndicatorDescription =>
      'Khi tắt (mặc định), chỉ báo đang gõ sẽ không hiển thị trên kênh bạn đang xem.';

  @override
  String get lookAndFeelTypingIndicatorPreviewChannelName => 'chung';

  @override
  String get lookAndFeelKeyboardHintsTitle => 'Gợi ý bàn phím';

  @override
  String get lookAndFeelKeyboardHintsDescription =>
      'Kiểm soát việc các gợi ý phím tắt có xuất hiện trong chú giải công cụ hay không.';

  @override
  String get lookAndFeelHideKeyboardHintsLabel =>
      'Ẩn gợi ý bàn phím trong chú giải công cụ';

  @override
  String get lookAndFeelHideKeyboardHintsDescription =>
      'Khi bật, các huy hiệu phím tắt sẽ bị ẩn trong các cửa sổ bật lên gợi ý.';

  @override
  String get lookAndFeelNekoTitle => 'Khác';

  @override
  String get lookAndFeelNekoDescription => 'Các tùy chọn giao diện khác.';

  @override
  String get lookAndFeelShowNekoLabel => 'Hiện Neko';

  @override
  String get lookAndFeelShowNekoDescription =>
      'Khi bật, Neko sẽ xuất hiện gần thanh nhập tin nhắn.';

  @override
  String get lookAndFeelVoiceChannelJoinTitle =>
      'Hành vi khi tham gia kênh thoại';

  @override
  String get lookAndFeelVoiceChannelJoinDescription =>
      'Kiểm soát cách bạn tham gia các kênh thoại trong cộng đồng.';

  @override
  String get lookAndFeelRequireDoubleClickJoinLabel =>
      'Yêu cầu nhấp đúp để vào kênh thoại';

  @override
  String get lookAndFeelRequireDoubleClickJoinDescription =>
      'Khi bật, bạn sẽ cần nhấp đúp vào kênh thoại để tham gia. Khi tắt (mặc định), nhấp một lần sẽ tham gia kênh ngay lập tức.';

  @override
  String get lookAndFeelChatFontPreviewSample =>
      'Con cáo nâu nhanh nhẹn nhảy qua con chó lười.';

  @override
  String get lookAndFeelGuildSidebarTitle => 'Thanh bên máy chủ';

  @override
  String get lookAndFeelGuildSidebarDescription =>
      'Tùy chỉnh cách thanh bên máy chủ hiển thị tin nhắn trực tiếp.';

  @override
  String guildUnavailableOutageTooltip(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count cộng đồng hiện không khả dụng do trục trặc bộ tụ flux.',
      one: '1 cộng đồng hiện không khả dụng do trục trặc bộ tụ flux.',
    );
    return '$_temp0';
  }

  @override
  String get communityTemporarilyUnavailable =>
      'Cộng đồng tạm thời không khả dụng';

  @override
  String get guildUnavailableDescription =>
      'Đã xảy ra lỗi. Chúng tôi đang khắc phục.';

  @override
  String get guildNotFoundTitle => 'Đây không phải cộng đồng bạn tìm kiếm.';

  @override
  String get guildNotFoundDescription =>
      'Cộng đồng bạn tìm kiếm có thể đã bị xóa hoặc bạn không có quyền truy cập.';

  @override
  String guildStaffOnlyAccessibleNagbar(
    String communityName,
    String productName,
  ) {
    return 'Hiện tại, $communityName chỉ dành cho nhân viên của $productName';
  }

  @override
  String get guildNavbarTemporarilyUnavailable => 'tạm thời không khả dụng';

  @override
  String get lookAndFeelCollapseDMsLabel => 'Thu gọn DM vào thư mục';

  @override
  String lookAndFeelCollapseDMsDescription(String productName) {
    return 'Khi bật, các DM chưa đọc trong thanh bên máy chủ sẽ được thu gọn thành một thư mục trên nút $productName. Nhấp vào nút $productName khi ở trang DM để mở rộng hoặc thu gọn thư mục.';
  }

  @override
  String get lookAndFeelChannelListSectionTitle => 'Danh sách kênh';

  @override
  String get lookAndFeelChannelListSectionDescription =>
      'Kiểm soát trạng thái chưa đọc của kênh đã tắt tiếng trong danh sách kênh.';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsLabel =>
      'Hiển thị dấu hiệu chưa đọc trên các kênh đã tắt tiếng';

  @override
  String get lookAndFeelShowFadedUnreadOnMutedChannelsDescription =>
      'Khi bật, các kênh đã tắt tiếng sẽ hiển thị chỉ báo chưa đọc mờ ở bên trái. Lượt nhắc vẫn xuất hiện bất kể cài đặt này.';

  @override
  String get lookAndFeelActiveNowSectionTitle => 'Đang hoạt động';

  @override
  String get lookAndFeelActiveNowSectionDescription =>
      'Kiểm soát cách Hiển thị Trực tuyến xuất hiện trong ứng dụng.';

  @override
  String get lookAndFeelShowActiveNowLabel =>
      'Hiển thị \"Đang hoạt động\" trên màn hình chính';

  @override
  String get lookAndFeelShowActiveNowDescription =>
      'Hiển thị \"Đang hoạt động\" trên màn hình chính để xem bạn bè đang hoạt động trong giọng nói. Bạn sẽ thấy bản xem trước, ngữ cảnh kênh, những người đã có mặt và cách nhanh chóng để tham gia.';

  @override
  String get lookAndFeelFavoritesSectionTitle => 'Mục ưa thích';

  @override
  String get lookAndFeelFavoritesSectionDescription =>
      'Kiểm soát khả năng hiển thị của mục yêu thích trên toàn bộ ứng dụng.';

  @override
  String get lookAndFeelEnableFavoritesLabel => 'Bật mục yêu thích';

  @override
  String get lookAndFeelEnableFavoritesDescription =>
      'Khi bật, bạn có thể đánh dấu kênh yêu thích và chúng sẽ xuất hiện trong mục Yêu thích. Khi tắt, tất cả các yếu tố giao diện người dùng liên quan đến yêu thích (nút, mục menu) sẽ bị ẩn. Các mục yêu thích hiện có của bạn sẽ được giữ nguyên.';

  @override
  String get favoritesTitle => 'Mục ưa thích';

  @override
  String get favoritesEmptyTitle => 'Chưa có mục yêu thích';

  @override
  String get favoritesEmptyDescription =>
      'Ghim các kênh từ đầu cuộc trò chuyện để giữ chúng ở đây.';

  @override
  String get favoritesWelcomeTitle => 'Chào mừng đến với mục yêu thích';

  @override
  String get favoritesWelcomeDescription =>
      'Không gian riêng của bạn để truy cập nhanh vào các kênh, tin nhắn trực tiếp và nhóm yêu thích. Nhấn vào biểu tượng ngôi sao trên bất kỳ kênh nào để thêm vào đây.';

  @override
  String get favoritesWelcomeTip =>
      'Không phù hợp với bạn? Tắt bất cứ lúc nào.';

  @override
  String get favoritesDisableButton => 'Tắt mục yêu thích';

  @override
  String get favoritesAddedToast => 'Đã thêm vào mục yêu thích';

  @override
  String get favoritesRemovedToast => 'Đã xóa khỏi mục yêu thích';

  @override
  String get favoritesHiddenToast => 'Đã ẩn mục yêu thích';

  @override
  String get favoritesMute => 'Tắt tiếng mục yêu thích';

  @override
  String get favoritesUnmute => 'Bỏ tắt tiếng mục yêu thích';

  @override
  String get favoritesHeaderMenu => 'Menu Yêu thích';

  @override
  String get favoritesCreateCategory => 'Tạo danh mục';

  @override
  String get favoritesCategoryNameLabel => 'Tên danh mục';

  @override
  String get favoritesHideMutedChannels => 'Ẩn kênh đã tắt thông báo';

  @override
  String get favoritesShowMutedChannels => 'Hiện các kênh đã tắt tiếng';

  @override
  String get favoritesSetNickname => 'Đặt biệt danh';

  @override
  String get favoritesNicknameLabel => 'Biệt danh';

  @override
  String get favoritesSaveNickname => 'Lưu biệt danh';

  @override
  String get favoritesMoveToCategory => 'Di chuyển đến danh mục';

  @override
  String get favoritesUncategorized => 'Chưa phân loại';

  @override
  String get favoritesOtherCategory => 'Khác';

  @override
  String get favoritesRemoveFromFavorites => 'Bỏ khỏi mục yêu thích';

  @override
  String get favoritesAddToFavorites => 'Thêm vào mục yêu thích';

  @override
  String get favoritesAddToSavedMedia => 'Thêm vào mục đã lưu';

  @override
  String get favoritesRemoveFromSavedMedia =>
      'Xóa khỏi danh sách phương tiện đã lưu';

  @override
  String get favoritesAddToUrlOnlyGifFavorites =>
      'Thêm vào danh sách GIF yêu thích chỉ bằng URL';

  @override
  String get favoritesRemoveFromUrlOnlyGifFavorites =>
      'Xóa GIF yêu thích được lưu theo URL';

  @override
  String get savedMediaAddTitle => 'Thêm vào mục đã lưu';

  @override
  String get savedMediaFormNameLabel => 'Tên';

  @override
  String get savedMediaFormNameHint => 'Ảnh/video của tôi';

  @override
  String get savedMediaFormAltTextLabel => 'Văn bản thay thế';

  @override
  String get savedMediaFormAltTextHint => 'Mô tả nội dung';

  @override
  String get savedMediaFormTagsLabel => 'Thẻ';

  @override
  String get savedMediaFormTagsHint => 'hài hước, phản ứng, công việc';

  @override
  String get savedMediaSaveError => 'Không thể cập nhật phương tiện đã lưu.';

  @override
  String get savedMediaNameRequired => 'Tên là bắt buộc.';

  @override
  String get gifFavoriteFirstTimeTitle =>
      'Chúng tôi nên lưu các GIF yêu thích của bạn như thế nào?';

  @override
  String get gifFavoriteFirstTimeDescription =>
      'Bạn có thể lưu GIF yêu thích dưới dạng mục yêu thích chỉ URL hoặc tải chúng lên phương tiện đã lưu của bạn. Chọn tùy chọn phù hợp với cách bạn sử dụng chúng. Bạn có thể thay đổi tùy chọn này bất kỳ lúc nào trong Cài đặt > Nâng cao > Phương tiện.';

  @override
  String get gifFavoriteFirstTimeUrlOnlyDetails =>
      'Ưu tiên chỉ URL (mặc định): đồng bộ trên các thiết bị của bạn, không tải lên, không tính vào phương tiện đã lưu. Phương tiện gốc có thể biến mất nếu máy chủ của nó xóa đi.';

  @override
  String get gifFavoriteFirstTimeSavedMediaDetails =>
      'Phương tiện đã lưu: đã tải lên, có thể gắn thẻ, có thể tìm kiếm và bền vững, nhưng sẽ tính vào giới hạn phương tiện đã lưu của bạn.';

  @override
  String get gifFavoriteFirstTimeHint => 'Chúng tôi sẽ chỉ hỏi một lần.';

  @override
  String get gifFavoriteFirstTimeUseUrlOnly => 'Sử dụng chỉ URL (khuyến nghị)';

  @override
  String get gifFavoriteFirstTimeUseSavedMedia => 'Sử dụng phương tiện đã lưu';

  @override
  String get favoritesHideConfirmTitle => 'Ẩn mục yêu thích';

  @override
  String get favoritesHideConfirmDescription =>
      'Thao tác này sẽ ẩn tất cả các yếu tố giao diện người dùng liên quan đến mục yêu thích, bao gồm nút và mục menu. Các mục yêu thích hiện có của bạn sẽ được giữ nguyên và có thể được bật lại bất kỳ lúc nào từ Cài đặt > Nâng cao > Giao diện.';

  @override
  String get favoritesDirectMessageSubtitle => 'Tin nhắn trực tiếp';

  @override
  String get messagesMediaDisplayGroupTitle => 'Hiển thị';

  @override
  String get messagesMediaDisplayGroupDescription =>
      'Kiểm soát cách tin nhắn, phương tiện và nội dung khác được hiển thị.';

  @override
  String get messagesMediaMediaGroupTitle => 'Phương tiện';

  @override
  String get messagesMediaMediaGroupDescription =>
      'Tùy chỉnh tùy chọn kích thước phương tiện và các nút.';

  @override
  String get messagesMediaInputGroupTitle => 'Nhập liệu';

  @override
  String get messagesMediaInputGroupDescription =>
      'Tùy chỉnh cài đặt nhập tin nhắn.';

  @override
  String get messagesMediaSidebarGroupTitle => 'Thanh bên';

  @override
  String get messagesMediaSidebarGroupDescription =>
      'Tùy chỉnh cách hiển thị thanh bên cộng đồng.';

  @override
  String get messagesMediaDefaultHideMutedChannelsLabel =>
      'Ẩn các kênh đã tắt tiếng theo mặc định';

  @override
  String get messagesMediaDefaultHideMutedChannelsDescription =>
      'Tự động ẩn các kênh đã tắt tiếng trong thanh bên khi bạn tham gia cộng đồng mới';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableTitle =>
      'Ẩn các kênh đã tắt tiếng theo mặc định?';

  @override
  String get messagesMediaDefaultHideMutedChannelsEnableDescription =>
      'Các cộng đồng mới bạn tham gia sẽ tự động ẩn những kênh đã tắt thông báo. Bạn có muốn áp dụng cài đặt này cho tất cả các cộng đồng hiện có của mình không?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableTitle =>
      'Dừng ẩn các kênh đã tắt tiếng theo mặc định?';

  @override
  String get messagesMediaDefaultHideMutedChannelsDisableDescription =>
      'Các cộng đồng mới bạn tham gia sẽ không còn tự động ẩn kênh đã tắt tiếng. Bạn có muốn hiển thị các kênh đã tắt tiếng trong tất cả các cộng đồng hiện có của mình không?';

  @override
  String get messagesMediaDefaultHideMutedChannelsApplyAllAction =>
      'Áp dụng cho tất cả cộng đồng';

  @override
  String get messagesMediaDefaultHideMutedChannelsShowAllAction =>
      'Hiển thị trong tất cả cộng đồng';

  @override
  String get messagesMediaDefaultHideMutedChannelsNewOnlyAction =>
      'Chỉ cộng đồng mới';

  @override
  String get messagesMediaDisplaySectionTitle => 'Hiển thị phương tiện';

  @override
  String get messagesMediaDisplaySectionDescription =>
      'Kiểm soát cách hình ảnh, video và các phương tiện khác được hiển thị. Tất cả phương tiện sẽ được thay đổi kích thước và chuyển đổi. Các tệp cực lớn không thể nén thành bản xem trước sẽ không được nhúng bất kể cài đặt này.';

  @override
  String get messagesMediaDisplayInlineEmbedLabel =>
      'Khi đăng dưới dạng liên kết vào cuộc trò chuyện';

  @override
  String messagesMediaDisplayInlineAttachmentLabel(String productName) {
    return 'Khi tải trực tiếp lên $productName';
  }

  @override
  String get messagesMediaLinkPreviewsSectionTitle => 'Xem trước liên kết';

  @override
  String get messagesMediaLinkPreviewsSectionDescription =>
      'Kiểm soát cách xem trước các liên kết trang web trong cuộc trò chuyện';

  @override
  String get messagesMediaLinkPreviewsToggleLabel =>
      'Hiển thị nội dung nhúng và xem trước liên kết web';

  @override
  String get messagesMediaReactionsSectionTitle => 'Biểu cảm';

  @override
  String get messagesMediaReactionsSectionDescription =>
      'Cài đặt biểu tượng cảm xúc để phản hồi tin nhắn';

  @override
  String get messagesMediaReactionsToggleLabel =>
      'Hiển thị cảm xúc biểu tượng trên tin nhắn';

  @override
  String get messagesMediaSpoilersSectionTitle => 'Nội dung ẩn';

  @override
  String get messagesMediaSpoilersSectionDescription =>
      'Kiểm soát cách hiển thị nội dung ẩn';

  @override
  String get messagesMediaSpoilersRadioLabel => 'Hiển thị nội dung ẩn';

  @override
  String get messagesMediaSpoilersOnClickName => 'Khi nhấp';

  @override
  String get messagesMediaSpoilersOnClickDescription =>
      'Hiện nội dung ẩn khi nhấp';

  @override
  String get messagesMediaSpoilersIfModeratorName =>
      'Trong các kênh tôi điều hành';

  @override
  String get messagesMediaSpoilersIfModeratorDescription =>
      'Luôn hiển thị nội dung ẩn trong các kênh mà bạn có quyền \"Quản lý tin nhắn\"';

  @override
  String get messagesMediaSpoilersAlwaysName => 'Luôn luôn';

  @override
  String get messagesMediaSpoilersAlwaysDescription =>
      'Luôn hiển thị nội dung spoil';

  @override
  String get messagesMediaSizeSectionTitle => 'Tùy chọn kích thước phương tiện';

  @override
  String get messagesMediaSizeSectionDescription =>
      'Tùy chỉnh kích thước hiển thị tối đa cho phương tiện nhúng và đính kèm. Kích thước nhỏ hơn sẽ chiếm ít không gian màn hình hơn, trong khi kích thước lớn hơn sẽ hiển thị nhiều chi tiết hơn.';

  @override
  String get messagesMediaSizeEmbedLabel => 'Phương tiện từ liên kết (nhúng)';

  @override
  String get messagesMediaSizeAttachmentLabel => 'Tệp đính kèm đã tải lên';

  @override
  String get messagesMediaSizeCompactName => 'Nhỏ gọn (400x300)';

  @override
  String get messagesMediaSizeCompactDescription =>
      'Kích thước phương tiện nhỏ hơn';

  @override
  String get messagesMediaSizeComfortableName => 'Thoải mái (550x400)';

  @override
  String get messagesMediaSizeComfortableDescription =>
      'Kích thước phương tiện lớn hơn với nhiều chi tiết hơn';

  @override
  String get messagesMediaGifsSectionTitle => 'Cài đặt GIF';

  @override
  String get messagesMediaGifsSectionDescription =>
      'Kiểm soát cách GIF được chèn vào cuộc trò chuyện';

  @override
  String get messagesMediaGifsAutoSendLabel =>
      'Tự động gửi ảnh GIF khi được chọn';

  @override
  String get messagesMediaCameraUploadsSectionTitle => 'Tải lên từ máy ảnh';

  @override
  String get messagesMediaCameraUploadsSectionDescription =>
      'Chọn xem ảnh và video chụp bằng camera trong ứng dụng có được lưu trên thiết bị của bạn không';

  @override
  String get messagesMediaCameraUploadsSaveToDeviceLabel => 'Lưu vào thiết bị';

  @override
  String get messagesMediaAutocompleteSectionTitle =>
      'Tự động hoàn thành biểu thức (tự động hoàn thành dấu hai chấm)';

  @override
  String get messagesMediaAutocompleteSectionDescription =>
      'Kiểm soát những gì xuất hiện trong gợi ý biểu thức khi bạn gõ dấu hai chấm. Tùy chỉnh các gợi ý hiển thị để phù hợp với sở thích của bạn.';

  @override
  String get messagesMediaAutocompleteDefaultEmojisLabel =>
      'Hiển thị biểu tượng cảm xúc mặc định trong gợi ý biểu cảm';

  @override
  String get messagesMediaAutocompleteCustomEmojisLabel =>
      'Hiển thị biểu tượng cảm xúc tùy chỉnh trong tự động hoàn thành biểu cảm';

  @override
  String get messagesMediaAutocompleteStickersLabel =>
      'Hiển thị nhãn dán trong gợi ý biểu cảm';

  @override
  String get messagesMediaAutocompleteSavedMediaLabel =>
      'Hiển thị ảnh/video đã lưu trong gợi ý biểu cảm';

  @override
  String get messagesMediaEditingSectionTitle => 'Chỉnh sửa tin nhắn';

  @override
  String get messagesMediaEditingSectionDescription =>
      'Kiểm soát những gì xảy ra với bản nháp chỉnh sửa của bạn khi bạn hủy.';

  @override
  String get messagesMediaEditingPreserveDraftLabel =>
      'Lưu bản nháp chỉnh sửa khi hủy';

  @override
  String get accessibilitySaturationTitle => 'Độ bão hòa';

  @override
  String get accessibilitySaturationDescription =>
      'Điều chỉnh mức độ rực rỡ của màu sắc chủ đề trên toàn bộ ứng dụng.';

  @override
  String get accessibilityVisualGroupTitle => 'Hiển thị';

  @override
  String get accessibilityAlwaysUnderlineLinksLabel =>
      'Luôn gạch chân liên kết';

  @override
  String get accessibilityDimStrikethroughTextLabel =>
      'Làm mờ văn bản gạch ngang';

  @override
  String get accessibilityDmMessagePreviewGroupTitle => 'Xem trước tin nhắn DM';

  @override
  String get accessibilityDmMessagePreviewGroupDescription =>
      'Kiểm soát thời điểm xem trước tin nhắn được hiển thị trong danh sách DM.';

  @override
  String get accessibilityDmMessagePreviewModeLabel =>
      'Chế độ xem trước tin nhắn DM';

  @override
  String get accessibilityDmMessagePreviewAllName => 'Tất cả tin nhắn';

  @override
  String get accessibilityDmMessagePreviewAllDescription =>
      'Hiển thị xem trước tin nhắn cho tất cả cuộc trò chuyện DM';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyName =>
      'Chỉ tin nhắn chưa đọc';

  @override
  String get accessibilityDmMessagePreviewUnreadOnlyDescription =>
      'Chỉ hiện bản xem trước tin nhắn cho các tin nhắn trực tiếp chưa đọc';

  @override
  String get accessibilityDmMessagePreviewNoneName => 'Không';

  @override
  String get accessibilityDmMessagePreviewNoneDescription =>
      'Không hiển thị bản xem trước tin nhắn trong danh sách tin nhắn riêng tư';

  @override
  String get accessibilityScreenReaderGroupTitle => 'Trình đọc màn hình';

  @override
  String accessibilityScreenReaderGroupDescription(String productName) {
    return 'Kiểm soát cách $productName hoạt động với trình đọc màn hình.';
  }

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesLabel =>
      'Thông báo tin nhắn mới';

  @override
  String get accessibilityScreenReaderAnnounceNewMessagesDescription =>
      'Cho phép trình đọc màn hình thông báo tin nhắn mới khi chúng đến trong kênh đang mở. Âm thanh thông báo không bị ảnh hưởng.';

  @override
  String get accessibilityTtsGroupTitle => 'Chuyển văn bản thành giọng nói';

  @override
  String get accessibilityTtsGroupDescription =>
      'Chọn tốc độ cho văn bản được đọc to.';

  @override
  String get accessibilityTtsSpeechPlaybackSpeedLabel =>
      'Tốc độ phát giọng nói';

  @override
  String get accessibilityTtsPlaySampleLabel => 'Phát thử';

  @override
  String get accessibilityTtsSilenceSampleLabel => 'Tắt tiếng mẫu';

  @override
  String get accessibilityPreviewButtonLabel => 'Nút xem trước';

  @override
  String accessibilityPreviewLinksMessage(String linkPreviewExampleUrl) {
    return 'Đây là cách các liên kết xuất hiện: $linkPreviewExampleUrl';
  }

  @override
  String get accessibilityPreviewUserName => 'Xem trước người dùng';

  @override
  String get accessibilityKeyboardGroupTitle => 'Bàn phím';

  @override
  String get accessibilityShowTextareaFocusRingLabel =>
      'Hiển thị vòng lấy nét trên vùng nhập văn bản trò chuyện';

  @override
  String get accessibilityEscapeExitsKeyboardModeLabel =>
      'Phím Escape thoát chế độ bàn phím';

  @override
  String get accessibilityShowContextMenuShortcutsLabel =>
      'Hiện phím tắt menu ngữ cảnh';

  @override
  String get accessibilityConfirmBeforeStartingCallsLabel =>
      'Xác nhận trước khi bắt đầu cuộc gọi';

  @override
  String get accessibilityAnimationGroupTitle => 'Hoạt ảnh';

  @override
  String get accessibilityReducedMotionActiveNote =>
      'Đã bật chế độ giảm chuyển động nên các ảnh động nội dung bị tạm dừng theo mặc định. Bạn vẫn có thể bật lại bất kỳ ảnh động nào để tiếp tục phát.';

  @override
  String get accessibilityPlayAnimatedEmojisLabel =>
      'Phát biểu tượng cảm xúc động';

  @override
  String get accessibilityAutoPlayGifsMobileLabel => 'Tự động phát ảnh GIF';

  @override
  String accessibilityAutoPlayGifsDesktopLabel(String productName) {
    return 'Tự động phát ảnh GIF khi $productName đang được tập trung';
  }

  @override
  String get accessibilityPlayingDespiteReducedMotion =>
      'Đang phát dù đã giảm chuyển động.';

  @override
  String get accessibilityPausedEmojiByReducedMotion =>
      'Đã tạm dừng do giảm chuyển động. Bật để tiếp tục phát biểu tượng cảm xúc động.';

  @override
  String get accessibilityPausedGifByReducedMotion =>
      'Đã tạm dừng do giảm chuyển động. Bật để tiếp tục phát ảnh GIF.';

  @override
  String get accessibilityGifDefaultsOffOnMobile =>
      'Mặc định tắt trên di động để tiết kiệm pin và dữ liệu.';

  @override
  String get accessibilityStickerAnimationsTitle => 'Ảnh động nhãn dán';

  @override
  String get accessibilityStickerAnimationPreferenceLabel =>
      'Tùy chọn ảnh động sticker';

  @override
  String get accessibilityStickerAlwaysAnimateName => 'Luôn phát ảnh động';

  @override
  String get accessibilityStickerAlwaysAnimateDescription =>
      'Sticker sẽ luôn chuyển động';

  @override
  String get accessibilityStickerAnimateOnInteractionName =>
      'Tạo hiệu ứng khi tương tác';

  @override
  String get accessibilityStickerAnimateOnPressDescription =>
      'Sticker sẽ động khi bạn nhấn vào';

  @override
  String get accessibilityStickerAnimateOnHoverDescription =>
      'Sticker sẽ tự động phát ảnh động khi bạn di chuột hoặc tương tác với chúng';

  @override
  String get accessibilityStickerNeverAnimateName =>
      'Không bao giờ tạo hiệu ứng động';

  @override
  String get accessibilityStickerNeverAnimateDescription =>
      'Sticker sẽ không bao giờ tự động phát';

  @override
  String get accessibilityStickersAlwaysDespiteReducedMotion =>
      'Luôn tạo hiệu ứng động dù đã giảm chuyển động.';

  @override
  String get accessibilityStickersReducedMotionHint =>
      'Chế độ giảm chuyển động giới hạn nhãn dán chỉ hiển thị ảnh động khi có tương tác. Chọn luôn hiển thị ảnh động để ghi đè.';

  @override
  String get accessibilityStickersDefaultsOnMobile =>
      'Mặc định là ảnh động khi tương tác trên di động để tiết kiệm pin.';

  @override
  String get accessibilityMotionGroupTitle => 'Chuyển động';

  @override
  String get accessibilitySyncReducedMotionWithSystemLabel =>
      'Đồng bộ cài đặt giảm chuyển động với hệ thống';

  @override
  String get accessibilitySyncReducedMotionWithSystemDescription =>
      'Sử dụng tùy chọn giảm chuyển động của hệ thống trên thiết bị này hoặc tùy chỉnh bên dưới.';

  @override
  String get accessibilityReducedMotionOverrideLabel => 'Giảm chuyển động';

  @override
  String get accessibilityReducedMotionOverrideSyncedDescription =>
      'Tắt hiệu ứng động và chuyển cảnh. Hiện đang được điều khiển bởi cài đặt hệ thống của bạn.';

  @override
  String get accessibilityReducedMotionOverrideManualDescription =>
      'Tắt hiệu ứng động và chuyển tiếp trong ứng dụng.';

  @override
  String get accessibilityReducedMotionAnimationTabHint =>
      'Biểu tượng cảm xúc động, ảnh GIF và nhãn dán vẫn nằm trong tầm kiểm soát của bạn trong tab Hoạt ảnh.';

  @override
  String get accessibilityConfirmStartCallTitle => 'Bắt đầu cuộc gọi?';

  @override
  String get accessibilityConfirmStartCallDescription =>
      'Bạn có chắc chắn muốn bắt đầu cuộc gọi này không?';

  @override
  String get accessibilityConfirmStartCallConfirmLabel => 'Bắt đầu cuộc gọi';

  @override
  String get accessibilityTtsSampleDescription =>
      'Nghe thử câu mẫu với tốc độ đã chọn.';

  @override
  String get accessibilityTtsSampleText =>
      'Bác sĩ, tôi đến từ tương lai. Tôi đến đây bằng cỗ máy thời gian do chính bác sĩ phát minh. Giờ thì tôi cần bác sĩ giúp để quay về năm 1985.';

  @override
  String get accessibilityTtsUnsupportedDescription =>
      'Tính năng tổng hợp giọng nói không khả dụng trên thiết bị này.';

  @override
  String get accessibilityTtsPlaybackFailedDescription =>
      'Phát âm thanh không thành công. Thử lại hoặc kiểm tra đầu ra âm thanh.';

  @override
  String get ttsSubstitutionUnknownUser => 'người dùng không xác định';

  @override
  String get ttsSubstitutionUnknownRole => 'vai trò không xác định';

  @override
  String get ttsSubstitutionUnknownChannel => 'kênh không xác định';

  @override
  String get ttsSubstitutionCodeBlock => 'khối mã';

  @override
  String get ttsSubstitutionSpoiler => 'tin nhắn ẩn';

  @override
  String ttsSubstitutionEmoji(String emojiName) {
    return 'biểu tượng cảm xúc $emojiName';
  }

  @override
  String ttsSubstitutionSlashCommand(String commandName) {
    return 'lệnh $commandName';
  }

  @override
  String ttsAuthorSaid(String authorName, String formatted) {
    return '$authorName đã nói: $formatted';
  }

  @override
  String ttsReplyingToSaid(
    String replyAuthorName,
    String authorName,
    String formatted,
  ) {
    return 'Trả lời $replyAuthorName, $authorName nói: $formatted';
  }

  @override
  String ttsAuthorDescription(String authorName, String description) {
    return '$authorName $description';
  }

  @override
  String get ttsSentSticker => 'đã gửi một nhãn dán';

  @override
  String get ttsSentAttachment => 'đã gửi một tệp đính kèm';

  @override
  String ttsSentAttachments(int count) {
    return 'đã gửi $count tệp đính kèm';
  }

  @override
  String get ttsSentEmbed => 'đã gửi một nhúng';

  @override
  String messageScreenReaderAnnouncement(String author, String summary) {
    return '$author đã gửi $summary';
  }

  @override
  String get dmListSentAnAttachment => 'Đã gửi một tệp đính kèm';

  @override
  String systemPreviewPinnedMessage(String username) {
    return '$username đã ghim một tin nhắn vào kênh này.';
  }

  @override
  String systemPreviewAddedToGroup(String username, String userName) {
    return '$username đã thêm $userName vào nhóm.';
  }

  @override
  String systemPreviewAddedSomeoneToGroup(String username) {
    return '$username đã thêm một người vào nhóm.';
  }

  @override
  String systemPreviewHasLeftGroup(String username) {
    return '$username đã rời nhóm.';
  }

  @override
  String systemPreviewRemovedFromGroup(String username, String userName) {
    return '$username đã xóa $userName khỏi nhóm.';
  }

  @override
  String systemPreviewRemovedSomeoneFromGroup(String username) {
    return '$username đã xóa một người khỏi nhóm.';
  }

  @override
  String systemPreviewChangedChannelNameTo(String username, String newName) {
    return '$username đã đổi tên kênh thành $newName.';
  }

  @override
  String systemPreviewChangedChannelName(String username) {
    return '$username đã đổi tên kênh.';
  }

  @override
  String systemPreviewChangedChannelIcon(String username) {
    return '$username đã thay đổi biểu tượng kênh.';
  }

  @override
  String systemPreviewStartedCall(String username) {
    return '$username đã bắt đầu một cuộc gọi.';
  }

  @override
  String get systemCallJoinTheCall => 'Tham gia cuộc gọi';

  @override
  String systemCallStartedThatLasted(String username, String duration) {
    return '$username đã bắt đầu một cuộc gọi kéo dài $duration.';
  }

  @override
  String systemCallMissedWithDuration(String username, String duration) {
    return 'Bạn đã bỏ lỡ cuộc gọi từ $username kéo dài $duration.';
  }

  @override
  String systemCallMissed(String username) {
    return 'Bạn đã bỏ lỡ cuộc gọi từ $username.';
  }

  @override
  String get systemCallDurationFewSeconds => 'vài giây';

  @override
  String get systemCallDurationMinute => 'một phút';

  @override
  String get systemCallDurationOneYear => '1 năm';

  @override
  String get systemCallDurationOneMonth => '1 tháng';

  @override
  String get systemCallDurationOneWeek => '1 tuần';

  @override
  String get systemCallDurationOneDay => '1 ngày';

  @override
  String get systemCallDurationOneHour => '1 giờ';

  @override
  String systemCallDurationYears(int count) {
    return '$count năm';
  }

  @override
  String systemCallDurationMonths(int count) {
    return '$count tháng';
  }

  @override
  String systemCallDurationWeeks(int count) {
    return '$count tuần';
  }

  @override
  String systemCallDurationDays(int count) {
    return '$count ngày';
  }

  @override
  String systemCallDurationHours(int count) {
    return '$count giờ';
  }

  @override
  String systemCallDurationMinutes(int count) {
    return '$count phút';
  }

  @override
  String systemUnknownMessage(String productName) {
    return 'Cập nhật $productName để xem tin nhắn này.';
  }

  @override
  String get voiceConnectionConfirmTitle => 'Xác nhận kết nối thoại';

  @override
  String voiceConnectionConfirmDescription(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other:
          'Bạn đã kết nối với kênh thoại này từ $count thiết bị khác. Bạn muốn làm gì?',
      one:
          'Bạn đã kết nối với kênh thoại này từ 1 thiết bị khác. Bạn muốn làm gì?',
    );
    return '$_temp0';
  }

  @override
  String get voiceConnectionConfirmSwitch => 'Chuyển sang thiết bị này';

  @override
  String get voiceConnectionConfirmJustJoin =>
      'Tham gia ngay (Giữ các kết nối khác)';

  @override
  String get voiceConnectionConfirmDoNothing =>
      'Không làm gì cả, tôi không muốn tham gia';

  @override
  String get voiceJoinFailedTitle => 'Không thể tham gia Giọng nói';

  @override
  String get voiceMultiDeviceDisconnectFailed =>
      'Không thể ngắt kết nối các thiết bị khác của bạn. Vui lòng thử lại sau.';

  @override
  String get voiceChannelEmptyDescription =>
      'Đây là một kênh thoại. Kết nối để bắt đầu trò chuyện!';

  @override
  String get voiceChannelJoin => 'Tham gia kênh thoại';

  @override
  String get voiceCallJoin => 'Tham gia cuộc gọi';

  @override
  String get voiceChannelJoinConnect => 'Kết nối thoại';

  @override
  String get voiceChannelNoConnectPermission =>
      'Bạn không có quyền tham gia kênh thoại này';

  @override
  String get voiceChannelE2eeEncrypted =>
      'Microphone, camera và nội dung chia sẻ màn hình được mã hóa đầu cuối.';

  @override
  String get voiceCallE2eeEncrypted =>
      'Microphone, camera và nội dung chia sẻ màn hình được mã hóa đầu cuối.';

  @override
  String get voiceChannelE2eeBroken =>
      'Không có mã hóa đầu cuối vì có người tham gia không được hỗ trợ trong kênh thoại này.';

  @override
  String get voiceCallE2eeBroken =>
      'Không có mã hóa đầu cuối vì một người tham gia không được hỗ trợ đang ở trong cuộc gọi này.';

  @override
  String get voiceE2eeUpdateRequired =>
      'Bạn cần cập nhật ứng dụng này trước khi tham gia cuộc gọi được mã hóa.';

  @override
  String get voiceMicPublishFailedStayConnected =>
      'Không thể bật micrô của bạn. Bạn vẫn đang trong cuộc gọi.';

  @override
  String get voiceChannelStatusConnecting => 'Đang kết nối…';

  @override
  String get voiceChannelStatusConnected => 'Đã kết nối';

  @override
  String get voiceChannelStatusError => 'Lỗi';

  @override
  String get voiceParticipantTooltipMobileDevice => 'Thiết bị di động';

  @override
  String get voiceParticipantTooltipDesktopDevice => 'Thiết bị máy tính';

  @override
  String get voiceParticipantTooltipCommunityMuted =>
      'Đã tắt tiếng bởi cộng đồng';

  @override
  String get voiceParticipantTooltipMuted => 'Đã tắt tiếng';

  @override
  String get voiceParticipantTooltipCommunityDeafened =>
      'Cộng đồng đã tắt tiếng';

  @override
  String get voiceParticipantTooltipDeafened => 'Đã tắt tiếng';

  @override
  String voiceParticipantTooltipConnection(String connectionId) {
    return 'Kết nối: $connectionId';
  }

  @override
  String voiceChannelParticipantCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count người tham gia',
      one: '1 người tham gia',
    );
    return '$_temp0';
  }

  @override
  String get voiceChannelLeave => 'Rời đi';

  @override
  String get voiceControlMute => 'Tắt tiếng';

  @override
  String get voiceControlUnmute => 'Bật tiếng';

  @override
  String get voiceControlDeafen => 'Tắt tiếng nghe';

  @override
  String get voiceControlUndeafen => 'Bật tiếng';

  @override
  String get voiceControlVideo => 'Video';

  @override
  String get voiceControlFlipCamera => 'Chuyển camera';

  @override
  String get voiceControlScreenShare => 'Chia sẻ màn hình';

  @override
  String get voiceScreenShareNotificationText =>
      'Đang chia sẻ màn hình của bạn.';

  @override
  String get voiceControlMore => 'Thêm';

  @override
  String get voiceControlDisconnect => 'Ngắt kết nối';

  @override
  String get voiceInChat => 'Trong trò chuyện thoại';

  @override
  String get voiceConnectionFailed => 'Không thể kết nối';

  @override
  String get voiceConnectionRetry => 'Thử lại';

  @override
  String get voiceConnectionDismiss => 'Bỏ qua';

  @override
  String get voiceConnectionDisconnected => 'Đã ngắt kết nối';

  @override
  String voicePingMs(int currentLatency) {
    return 'Độ trễ: ${currentLatency}ms';
  }

  @override
  String get voiceMeasuringLatency => 'Đang đo độ trễ...';

  @override
  String voiceJumpToChannel(String channelSourceLabel) {
    return 'Chuyển đến $channelSourceLabel';
  }

  @override
  String get voiceConnectionTitle => 'Kết nối thoại';

  @override
  String get voiceConnectionAdvancedStats => 'Nâng cao';

  @override
  String get voiceShowCallAvatars => 'Hiện ảnh đại diện cuộc gọi';

  @override
  String get voiceShowConnectionId => 'Hiện ID kết nối';

  @override
  String get voiceAudioProcessing => 'Đang xử lý âm thanh';

  @override
  String get voiceConnectionSessionSection => 'Phiên';

  @override
  String get voiceConnectionDurationLabel => 'Thời lượng';

  @override
  String get voiceConnectionParticipantsLabel => 'Người tham gia';

  @override
  String get voiceConnectionNetworkSection => 'Mạng';

  @override
  String get voiceConnectionPingLabel => 'Ping';

  @override
  String get voiceConnectionJitterLabel => 'Độ trễ biến động';

  @override
  String get voiceConnectionSendLabel => 'Gửi';

  @override
  String get voiceConnectionReceiveLabel => 'Nhận';

  @override
  String get voiceConnectionUnavailable => '—';

  @override
  String voiceConnectionDuration(int minutes, int seconds) {
    return '$minutes phút $seconds giây';
  }

  @override
  String voiceConnectionLatencyMs(int latency) {
    return '$latency mili giây';
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
  String get userAreaMuteMicrophone => 'Tắt tiếng micrô';

  @override
  String get userAreaUnmuteMicrophone => 'Bật tiếng micrô';

  @override
  String get userAreaUserSettings => 'Cài đặt người dùng';

  @override
  String get voiceParticipantMenuViewProfile => 'Xem hồ sơ';

  @override
  String get voiceParticipantMenuFocus => 'Tập trung vào người này';

  @override
  String get voiceParticipantMenuUnfocus => 'Bỏ tập trung';

  @override
  String get voiceParticipantMenuCommunityMute => 'Tắt tiếng trong cộng đồng';

  @override
  String get voiceParticipantMenuCommunityDeafen => 'Tắt tiếng cộng đồng';

  @override
  String get voiceParticipantMenuUserVolume => 'Âm lượng người dùng';

  @override
  String get voiceParticipantMenuStreamVolume => 'Âm lượng luồng phát';

  @override
  String get voiceParticipantMenuStopStreaming => 'Dừng chia sẻ màn hình';

  @override
  String get voiceParticipantModerationFailed =>
      'Không thể cập nhật thành viên đó. Vui lòng thử lại.';

  @override
  String get voiceControlChat => 'Trò chuyện';

  @override
  String get voiceCallViewModeLabel => 'Xem';

  @override
  String get voiceCallViewModeGrid => 'Lưới';

  @override
  String get voiceCallViewModeFocus => 'Tập trung';

  @override
  String get voicePanelSettingsSectionTitle => 'Cài đặt giọng nói';

  @override
  String get voicePanelUseEarpieceLabel => 'Dùng tai nghe';

  @override
  String get voicePanelOnlyShowVideosLabel => 'Chỉ hiển thị video';

  @override
  String get voicePanelOnlyShowVideosDescription =>
      'Chỉ hiển thị những người tham gia đang bật camera.';

  @override
  String get voicePanelShowOwnCameraLabel => 'Hiện camera của tôi';

  @override
  String get voicePrioritizeSpeakersLabel => 'Ưu tiên người nói';

  @override
  String get voiceTextChatShow => 'Hiện trò chuyện';

  @override
  String voiceTextChatShowUnread(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# tin nhắn chưa đọc',
      one: '# tin nhắn chưa đọc',
    );
    return 'Hiện trò chuyện có $_temp0';
  }

  @override
  String get voiceCameraPermissionRequired =>
      'Cần có quyền truy cập camera để sử dụng video.';

  @override
  String get voiceErrorScreenShareToggle =>
      'Không thể bắt đầu chia sẻ màn hình. Vui lòng thử lại.';

  @override
  String get voiceErrorScreenSharePermissionDenied =>
      'Quyền chia sẻ màn hình đã bị từ chối.';

  @override
  String get voiceErrorScreenShareUnsupported =>
      'Chia sẻ màn hình không khả dụng trên thiết bị này.';

  @override
  String get voiceWatchStream => 'Xem luồng';

  @override
  String get voiceStopWatching => 'Ngừng xem';

  @override
  String get voiceStopWatchingCurrentStreamTooltip =>
      'Ngừng xem luồng hiện tại';

  @override
  String get voiceOwnScreenShareTitle => 'Bạn đang phát sóng';

  @override
  String get voiceOwnScreenShareSubtitle =>
      'Luồng của bạn đang hoạt động cho những người tham gia.';

  @override
  String get voiceLiveBadge => 'Trực tiếp';

  @override
  String get dmVoiceViewCall => 'Xem cuộc gọi';

  @override
  String get dmVoiceCallFullScreen => 'Toàn màn hình';

  @override
  String get dmVoiceCallFullScreenTooltip => 'Mở cuộc gọi toàn màn hình';

  @override
  String get dmVoiceStripStatusConnecting => 'Đang kết nối…';

  @override
  String get dmVoiceStripStatusInCall => 'Đang gọi';

  @override
  String get dmVoiceEmbeddedFallbackTitle => 'Cuộc gọi thoại';

  @override
  String get dmVoiceCallBarConnecting => 'Đang kết nối…';

  @override
  String get dmVoiceCallBarDirectPrimary => 'Cuộc gọi trực tiếp';

  @override
  String get dmVoiceCallBarGroupPrimary => 'Cuộc gọi nhóm';

  @override
  String get dmVoiceCallBarIssueFallback => 'Sự cố thoại';

  @override
  String get dmVoiceFullscreenTitle => 'Thoại';

  @override
  String get voiceCallBarGuildConnectedFallback => 'Đã kết nối thoại';

  @override
  String get notificationsPageTitle => 'Thông báo';

  @override
  String get notificationsFilterUnreads => 'Chưa đọc';

  @override
  String get notificationsFilterMentions => 'Lượt nhắc đến';

  @override
  String get notificationsBookmarksTooltip => 'Tin nhắn đã lưu';

  @override
  String get notificationsMentionFilterTooltip => 'Lọc nhắc đến';

  @override
  String get notificationsMentionFiltersTitle => 'Bộ lọc đề cập';

  @override
  String get notificationsMentionIncludeEveryone =>
      'Bao gồm các lượt nhắc @everyone và @here';

  @override
  String get notificationsMentionIncludeRoles =>
      'Bao gồm cả lượt đề cập đến vai trò';

  @override
  String get notificationsMentionIncludeGuilds =>
      'Bao gồm tất cả lượt nhắc trong cộng đồng';

  @override
  String get notificationsNoUnreadTitle => 'Không có tin nhắn chưa đọc';

  @override
  String get notificationsNoUnreadBody => 'Bạn đã xem hết tin nhắn mới.';

  @override
  String get notificationsNoMentionsTitle => 'Không có lượt nhắc nào gần đây';

  @override
  String get notificationsNoMentionsBody =>
      'Tất cả @nhắc đến bạn sẽ xuất hiện tại đây trong 7 ngày.';

  @override
  String get notificationsMentionsEndTitle => 'Bạn đã xem hết';

  @override
  String get notificationsMentionsEndBody =>
      'Bạn đã xem tất cả các đề cập gần đây của mình. Đừng lo, sẽ sớm có thêm đề cập ở đây.';

  @override
  String get notificationsJump => 'Chuyển đến';

  @override
  String get notificationsRemoveMentionTooltip => 'Xóa nhắc đến';

  @override
  String get notificationsViewAllUnread => 'Xem tất cả tin chưa đọc';

  @override
  String get notificationsMarkAsRead => 'Đánh dấu đã đọc';

  @override
  String get notificationsExpand => 'Mở rộng';

  @override
  String get notificationsCollapse => 'Thu gọn';

  @override
  String get notificationsMessageUnavailable =>
      'Tin nhắn này không thể tải được.';

  @override
  String characterCounterRemaining(int remaining) {
    return 'Còn lại $remaining ký tự';
  }

  @override
  String get characterCounterTooLong => 'Tin nhắn quá dài';

  @override
  String characterCounterRemainingPlutoniumUpsell(
    int remaining,
    String productName,
    int premiumMaxLength,
  ) {
    return 'Còn $remaining ký tự. Nhận $productName để viết tối đa $premiumMaxLength ký tự.';
  }

  @override
  String get chatMessageFailedToSend => 'Không gửi được tin nhắn';

  @override
  String chatSendFailureDmRestricted(String settingsPath) {
    return 'Tin nhắn của bạn không thể được gửi. Điều này thường xảy ra vì bạn không chung cộng đồng với người nhận hoặc người nhận chỉ chấp nhận tin nhắn trực tiếp từ bạn bè. Bạn cũng có thể cần điều chỉnh cài đặt quyền riêng tư tin nhắn trực tiếp của mình trong $settingsPath.';
  }

  @override
  String get chatSendFailureUnclaimedDm =>
      'Không gửi được tin nhắn. Bạn cần xác minh tài khoản để gửi tin nhắn trực tiếp.';

  @override
  String get chatSendFailureUnclaimedGeneral =>
      'Không gửi được tin nhắn. Bạn cần xác thực tài khoản để gửi tin nhắn.';

  @override
  String get chatSendFailureContentBlocked =>
      'Tin nhắn của bạn không thể gửi đi vì đã bị hệ thống an toàn của chúng tôi gắn cờ. Nếu bạn cho rằng đây là lỗi, vui lòng liên hệ bộ phận hỗ trợ.';

  @override
  String get chatSendFailureNsfwEmojiSticker =>
      'Tin nhắn của bạn không thể gửi vì chứa biểu tượng cảm xúc hoặc nhãn dán nhạy cảm không được phép trong ngữ cảnh này.';

  @override
  String get chatClientSystemOnlyYouCanSee =>
      'Chỉ bạn mới xem được tin nhắn này.';

  @override
  String get chatClientSystemDismiss => 'Bỏ qua';

  @override
  String get privacyDashboardCommunicationSection => 'Giao tiếp';

  @override
  String get privacyDashboardProfilePrivacySection =>
      'Quyền riêng tư của hồ sơ';

  @override
  String get privacyDashboardFriendsAndDirectMessagesSection =>
      'Bạn bè & tin nhắn trực tiếp';

  @override
  String get privacyDashboardActivitySharingSection => 'Chia sẻ hoạt động';

  @override
  String get privacyDashboardSensitiveContentSection => 'Nội dung nhạy cảm';

  @override
  String get privacyDashboardDataExportSection => 'Xuất dữ liệu';

  @override
  String get privacyDashboardDataDeletionSection => 'Xóa dữ liệu';

  @override
  String get privacyDashboardProfilePrivacyTitle =>
      'Ai có thể xem hồ sơ đầy đủ của bạn';

  @override
  String get privacyDashboardProfilePrivacyAllCommunities =>
      'Bạn bè và tất cả cộng đồng';

  @override
  String get privacyDashboardProfilePrivacyAllCommunitiesDesc =>
      'Hồ sơ đầy đủ của bạn hiển thị với bạn bè và bất kỳ ai trong cộng đồng của bạn';

  @override
  String get privacyDashboardProfilePrivacySmallCommunities =>
      'Chỉ bạn bè và cộng đồng nhỏ';

  @override
  String get privacyDashboardProfilePrivacySmallCommunitiesDesc =>
      'Hồ sơ đầy đủ của bạn hiển thị với bạn bè và thành viên của các cộng đồng có từ 200 thành viên trở xuống';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnly => 'Chỉ bạn bè';

  @override
  String get privacyDashboardProfilePrivacyFriendsOnlyDesc =>
      'Hồ sơ đầy đủ của bạn chỉ hiển thị với bạn bè';

  @override
  String get privacyDashboardFriendRequestsTitle => 'Lời mời kết bạn';

  @override
  String get privacyDashboardFriendRequestsEveryone => 'Mọi người';

  @override
  String get privacyDashboardFriendRequestsEveryoneDesc =>
      'Cho phép mọi người gửi cho bạn lời mời kết bạn';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriends =>
      'Bạn bè của bạn bè';

  @override
  String get privacyDashboardFriendRequestsFriendsOfFriendsDesc =>
      'Cho phép bạn bè của bạn bè gửi yêu cầu cho bạn';

  @override
  String get privacyDashboardFriendRequestsCommunityMembers =>
      'Thành viên cộng đồng';

  @override
  String get privacyDashboardFriendRequestsCommunityMembersDesc =>
      'Cho phép thành viên từ các cộng đồng bạn tham gia gửi yêu cầu cho bạn';

  @override
  String get privacyDashboardDirectMessagesTitle => 'Tin nhắn trực tiếp';

  @override
  String get privacyDashboardDirectMessagesMembers =>
      'Cho phép thành viên cộng đồng nhắn tin trực tiếp';

  @override
  String get privacyDashboardDirectMessagesMembersDesc =>
      'Cho phép thành viên từ các cộng đồng bạn tham gia gửi tin nhắn trực tiếp cho bạn';

  @override
  String get privacyDashboardDirectMessagesBots =>
      'Cho phép bot cộng đồng nhắn tin trực tiếp';

  @override
  String get privacyDashboardDirectMessagesBotsDesc =>
      'Cho phép bot từ các cộng đồng bạn tham gia gửi tin nhắn trực tiếp cho bạn';

  @override
  String get privacyDashboardConnectionsSectionDesc =>
      'Kiểm soát những ai có thể gửi cho bạn yêu cầu kết bạn và tin nhắn trực tiếp';

  @override
  String get privacyDashboardCommunicationSectionDesc =>
      'Kiểm soát ai có thể gọi cho bạn và thêm bạn vào các cuộc trò chuyện nhóm';

  @override
  String get privacyDashboardIncomingCallsTitle => 'Cuộc gọi đến';

  @override
  String get privacyDashboardIncomingCallsDesc =>
      'Kiểm soát người có thể gọi cho bạn';

  @override
  String get privacyDashboardAllowedCallers => 'Người gọi được phép';

  @override
  String get privacyDashboardIncomingCallNobody => 'Không ai';

  @override
  String get privacyDashboardIncomingCallNobodyDesc =>
      'Chặn tất cả cuộc gọi đến';

  @override
  String get privacyDashboardIncomingCallFriendsOnly => 'Chỉ bạn bè';

  @override
  String get privacyDashboardIncomingCallFriendsOnlyDesc =>
      'Chỉ cho phép bạn bè gọi cho bạn (được khuyến nghị)';

  @override
  String get privacyDashboardIncomingCallCustom => 'Bạn bè + Tùy chỉnh';

  @override
  String get privacyDashboardIncomingCallCustomDesc =>
      'Cho phép bạn bè và các nhóm khác bạn chọn';

  @override
  String get privacyDashboardIncomingCallEveryone => 'Mọi người';

  @override
  String get privacyDashboardIncomingCallEveryoneDesc =>
      'Cho phép mọi người gọi cho bạn, kể cả người lạ';

  @override
  String get privacyDashboardAdditionalGroups => 'Nhóm bổ sung';

  @override
  String get privacyDashboardCallFriendsOfFriendsDesc =>
      'Những người là bạn bè của bạn bè có thể gọi cho bạn';

  @override
  String get privacyDashboardCallGuildMembersDesc =>
      'Những người từ các cộng đồng mà cả hai bạn cùng tham gia có thể gọi cho bạn';

  @override
  String get privacyDashboardRingBehavior => 'Hành vi vòng';

  @override
  String get privacyDashboardSilentCalls => 'Tắt tiếng cuộc gọi từ mọi người';

  @override
  String get privacyDashboardSilentCallsDesc =>
      'Tất cả các cuộc gọi sẽ thông báo im lặng thay vì đổ chuông. Theo mặc định, các cuộc gọi từ người lạ luôn im lặng.';

  @override
  String get privacyDashboardGroupDmTitle =>
      'Ai có thể thêm bạn vào nhóm trò chuyện';

  @override
  String get privacyDashboardGroupDmDesc =>
      'Kiểm soát những ai có thể thêm bạn vào nhóm mà không cần hỏi. Mọi người vẫn có thể gửi cho bạn liên kết mời tham gia.';

  @override
  String get privacyDashboardAllowedInvites => 'Lời mời được phép';

  @override
  String get privacyDashboardGroupDmNobodyDesc =>
      'Không ai có thể thêm bạn vào nhóm chat mà chưa có sự cho phép';

  @override
  String get privacyDashboardGroupDmFriendsOnlyDesc =>
      'Chỉ cho phép bạn bè thêm bạn mà không cần hỏi (khuyên dùng)';

  @override
  String get privacyDashboardGroupDmCustomDesc =>
      'Cho phép bạn bè và các nhóm khác thêm bạn';

  @override
  String get privacyDashboardGroupDmEveryoneDesc =>
      'Cho phép mọi người thêm bạn vào nhóm mà không cần hỏi';

  @override
  String get privacyDashboardGroupDmFriendsOfFriendsDesc =>
      'Những người là bạn bè của bạn bè có thể thêm bạn vào các cuộc trò chuyện nhóm';

  @override
  String get privacyDashboardGroupDmGuildMembersDesc =>
      'Người từ các cộng đồng mà cả hai bạn cùng tham gia có thể thêm bạn vào các nhóm chat';

  @override
  String get privacyDashboardVoiceActivityTitle =>
      'Hoạt động thoại trên mục đang hoạt động';

  @override
  String get privacyDashboardShareVoiceActivity =>
      'Chia sẻ hoạt động thoại của bạn với bạn bè';

  @override
  String get privacyDashboardVoiceActivityEnableTitle =>
      'Chia sẻ hoạt động trò chuyện thoại với tất cả bạn bè?';

  @override
  String get privacyDashboardVoiceActivityDisableTitle =>
      'Dừng chia sẻ hoạt động thoại với tất cả bạn bè?';

  @override
  String get privacyDashboardVoiceActivityEnableDesc =>
      'Bạn sắp chia sẻ hoạt động thoại của mình với tất cả bạn bè hiện tại và cả những người bạn sẽ kết nối trong tương lai. Thao tác này sẽ gửi thông báo cập nhật đến tất cả họ và chỉ có thể thay đổi lại sau 24 giờ.';

  @override
  String get privacyDashboardVoiceActivityDisableDesc =>
      'Bạn sắp ngừng chia sẻ hoạt động thoại của mình với tất cả bạn bè, bao gồm cả những người bạn trong tương lai. Thao tác này sẽ gửi thông báo cập nhật đến tất cả họ và chỉ có thể thay đổi lại sau 24 giờ.';

  @override
  String get privacyDashboardVoiceActivityEnableConfirm =>
      'Có, chia sẻ với tất cả bạn bè';

  @override
  String get privacyDashboardVoiceActivityDisableConfirm => 'Có, ngừng chia sẻ';

  @override
  String privacyDashboardVoiceActivityCooldown(String time) {
    return 'Có thể dùng lại sau $time';
  }

  @override
  String get privacyDashboardVoiceActivityUpdated =>
      'Đã cập nhật chia sẻ hoạt động thoại';

  @override
  String get privacyDashboardVoiceActivityUpdateFailed =>
      'Không thể cập nhật chia sẻ hoạt động thoại ngay bây giờ';

  @override
  String get privacyDashboardDataExportDesc =>
      'Tạo bản lưu trữ có thể tải xuống của dữ liệu tài khoản, bao gồm tin nhắn và URL tệp đính kèm. Hầu hết mọi người đều muốn tất cả, nhưng bạn có thể thu hẹp phạm vi bên dưới.';

  @override
  String get privacyDashboardExportMyData => 'Xuất dữ liệu của tôi';

  @override
  String get privacyDashboardDataDeletionDesc =>
      'Xóa vĩnh viễn các tin nhắn bạn đã gửi trong tin nhắn trực tiếp, tin nhắn nhóm và cộng đồng. Thao tác này chạy ngầm và bạn sẽ nhận được tin nhắn trực tiếp khi hoàn tất.';

  @override
  String get privacyDashboardDeleteMyMessages => 'Xóa tin nhắn của tôi';

  @override
  String get privacyDashboardDmConfirmAllowMembersTitle =>
      'Cho phép thành viên cộng đồng nhắn tin trực tiếp?';

  @override
  String get privacyDashboardDmConfirmBlockMembersTitle =>
      'Chặn tin nhắn trực tiếp từ thành viên cộng đồng?';

  @override
  String get privacyDashboardDmConfirmAllowBotsTitle =>
      'Cho phép bot gửi tin nhắn trực tiếp cho bạn?';

  @override
  String get privacyDashboardDmConfirmBlockBotsTitle =>
      'Chặn bot gửi tin nhắn trực tiếp cho bạn?';

  @override
  String get privacyDashboardDmConfirmAllowMembersDesc =>
      'Bạn có muốn cho phép thành viên của các cộng đồng hiện có nhắn tin trực tiếp cho bạn không?';

  @override
  String get privacyDashboardDmConfirmBlockMembersDesc =>
      'Bạn có muốn chặn tin nhắn trực tiếp từ các thành viên trong cộng đồng hiện có của mình không?';

  @override
  String get privacyDashboardDmConfirmAllowBotsDesc =>
      'Bạn có muốn cho phép bot từ các cộng đồng hiện có gửi tin nhắn trực tiếp cho bạn không?';

  @override
  String get privacyDashboardDmConfirmBlockBotsDesc =>
      'Bạn có muốn chặn bot khỏi các cộng đồng hiện có của mình không?';

  @override
  String get privacyDashboardDmConfirmPerCommunityHint =>
      'Bạn cũng có thể thay đổi cài đặt này cho từng cộng đồng bằng cách nhấn giữ tên cộng đồng và chọn Cài đặt quyền riêng tư.';

  @override
  String get privacyDashboardDmConfirmAllowAll => 'Cho phép tất cả cộng đồng';

  @override
  String get privacyDashboardDmConfirmBlockAll => 'Chặn khỏi tất cả cộng đồng';

  @override
  String get privacyDashboardDmConfirmSkip => 'Bỏ qua bước này';

  @override
  String get privacyDashboardDataRequestGoBack => 'Quay lại';

  @override
  String get privacyDashboardDataRequestExportTitle => 'Xuất dữ liệu của tôi';

  @override
  String get privacyDashboardDataRequestDeleteTitle => 'Xóa tin nhắn của tôi';

  @override
  String get privacyDashboardDataRequestExportSuccess =>
      'Chúng tôi sẽ xử lý yêu cầu này sớm nhất có thể. Bạn sẽ nhận được email khi kho lưu trữ của bạn đã sẵn sàng.';

  @override
  String get privacyDashboardDataRequestDeleteSuccess =>
      'Chúng tôi sẽ xử lý việc này sớm nhất có thể. Bạn sẽ nhận được tin nhắn trực tiếp từ chúng tôi khi hoàn tất.';

  @override
  String get privacyDashboardDataRequestScopeTitle => 'Nội dung cần đưa vào';

  @override
  String get privacyDashboardDataRequestExportEverything => 'Mọi thứ';

  @override
  String get privacyDashboardDataRequestExportEverythingDesc =>
      'Xuất tất cả tin nhắn bạn đã gửi, cùng với cài đặt tài khoản, tư cách thành viên và siêu dữ liệu của bạn.';

  @override
  String get privacyDashboardDataRequestExportCustom => 'Lựa chọn tùy chỉnh';

  @override
  String get privacyDashboardDataRequestExportCustomDesc =>
      'Chọn loại cuộc trò chuyện, cộng đồng và khoảng thời gian để đưa vào kho lưu trữ.';

  @override
  String get privacyDashboardDataRequestDeleteSelected =>
      'Chọn nội dung cần đưa vào';

  @override
  String get privacyDashboardDataRequestDeleteSelectedDesc =>
      'Chọn loại cuộc trò chuyện để dọn dẹp.';

  @override
  String get privacyDashboardDataRequestDeleteInaccessible =>
      'Chỉ những nơi tôi không còn quyền truy cập';

  @override
  String get privacyDashboardDataRequestDeleteInaccessibleDesc =>
      'Chỉ xóa tin nhắn khỏi các cộng đồng và tin nhắn nhóm bạn đã rời đi hoặc bị xóa khỏi.';

  @override
  String get privacyDashboardDataRequestKindsTitle =>
      'Những cuộc trò chuyện nào';

  @override
  String get privacyDashboardDataRequestKindsBody =>
      'Bật/tắt các loại cuộc trò chuyện bạn muốn đưa vào.';

  @override
  String get privacyDashboardDataRequestKindDms => 'Tin nhắn trực tiếp';

  @override
  String get privacyDashboardDataRequestKindDmsClosed =>
      'Tin nhắn trực tiếp đã đóng';

  @override
  String get privacyDashboardDataRequestKindGroupDms => 'Tin nhắn nhóm';

  @override
  String get privacyDashboardDataRequestKindCommunities => 'Cộng đồng';

  @override
  String get privacyDashboardDataRequestCommunitiesTitle => 'Cộng đồng nào';

  @override
  String get privacyDashboardDataRequestGuildFilterMode => 'Bộ lọc cộng đồng';

  @override
  String get privacyDashboardDataRequestGuildFilterExclude =>
      'Bao gồm tất cả trừ những mục đã chọn';

  @override
  String get privacyDashboardDataRequestGuildFilterInclude =>
      'Chỉ những mục đã chọn';

  @override
  String get privacyDashboardDataRequestCommunitiesEmpty =>
      'Hiện bạn chưa tham gia cộng đồng nào.';

  @override
  String get privacyDashboardDataRequestWhenTitle => 'Khoảng thời gian';

  @override
  String get privacyDashboardDataRequestDateMode => 'Khoảng thời gian';

  @override
  String get privacyDashboardDataRequestAllTime => 'Mọi lúc';

  @override
  String get privacyDashboardDataRequestCustomRange => 'Phạm vi tùy chỉnh';

  @override
  String get privacyDashboardDataRequestStartDate => 'Ngày bắt đầu';

  @override
  String get privacyDashboardDataRequestEndDate => 'Ngày kết thúc';

  @override
  String get privacyDashboardDataRequestDateHelper =>
      'Để trống một trong hai trường để không giới hạn khoảng thời gian đó.';

  @override
  String get privacyDashboardDataRequestNeedInclusion =>
      'Chọn ít nhất một loại cuộc trò chuyện để đưa vào.';

  @override
  String get privacyDashboardDataRequestDateRangeError =>
      'Ngày bắt đầu phải sớm hơn ngày kết thúc.';

  @override
  String get privacyDashboardDataRequestConfirmTitle => 'Xem lại và xác nhận';

  @override
  String get privacyDashboardDataRequestExportConfirmEverything =>
      'Chúng tôi sẽ tạo một bản lưu trữ có thể tải xuống của tất cả tin nhắn bạn đã gửi và gửi email cho bạn khi bản lưu trữ sẵn sàng. Liên kết tải xuống trong email đó sẽ hết hạn sau 7 ngày.';

  @override
  String get privacyDashboardDataRequestExportConfirmCustom =>
      'Chúng tôi sẽ tạo một bản lưu trữ có thể tải xuống khớp với các bộ lọc bên dưới và gửi email cho bạn khi bản lưu trữ sẵn sàng. Liên kết tải xuống trong email đó sẽ hết hạn sau 7 ngày.';

  @override
  String get privacyDashboardDataRequestDeleteConfirm =>
      'Xóa vĩnh viễn các tin nhắn khớp với bộ lọc bên dưới. Thao tác này không thể hoàn tác.';

  @override
  String get privacyDashboardDataRequestDeleteDanger =>
      'Không thể khôi phục sau khi quá trình này bắt đầu. Chúng tôi sẽ nhắn tin trực tiếp cho bạn khi hoàn tất.';

  @override
  String get privacyDashboardDataRequestRequestExport => 'Yêu cầu xuất dữ liệu';

  @override
  String get privacyDashboardDataRequestDeleteMessages => 'Xóa tin nhắn';

  @override
  String get privacyDashboardDataRequestSummaryScope => 'Phạm vi';

  @override
  String get privacyDashboardDataRequestSummaryConversations =>
      'Cuộc trò chuyện';

  @override
  String get privacyDashboardDataRequestSummaryCommunities => 'Cộng đồng';

  @override
  String get privacyDashboardDataRequestSummaryTimeRange => 'Khoảng thời gian';

  @override
  String get privacyDashboardDataRequestSummaryNone => 'Không';

  @override
  String privacyDashboardDataRequestSummaryFrom(String start) {
    return 'Từ $start';
  }

  @override
  String privacyDashboardDataRequestSummaryUntil(String end) {
    return 'Đến $end';
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
      other: '# cộng đồng',
      one: '# cộng đồng',
    );
    return 'Tất cả trừ $_temp0';
  }

  @override
  String privacyDashboardDataRequestSummaryGuildInclude(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# cộng đồng',
      one: '# cộng đồng',
    );
    return 'Chỉ $_temp0';
  }

  @override
  String get privacyDashboardDataRequestSummaryDmsOpen =>
      'Tin nhắn trực tiếp đang mở';

  @override
  String get privacyDashboardDataRequestSummaryDmsClosed =>
      'Tin nhắn trực tiếp đã đóng';

  @override
  String get privacyDashboardDataRequestSummaryDmsBoth =>
      'Tin nhắn trực tiếp (đang mở và đã đóng)';

  @override
  String get privacyDashboardDataRequestSummaryGroupDms => 'Tin nhắn nhóm';

  @override
  String get privacyDashboardDataRequestSummaryCommunitiesIncluded =>
      'Cộng đồng';

  @override
  String privacyDashboardDurationHoursMinutes(int hours, int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# giờ',
      one: '# giờ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# phút',
      one: '# phút',
    );
    return '$_temp0 và $_temp1';
  }

  @override
  String privacyDashboardDurationHours(int hours) {
    String _temp0 = intl.Intl.pluralLogic(
      hours,
      locale: localeName,
      other: '# giờ',
      one: '# giờ',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationMinutes(int minutes) {
    String _temp0 = intl.Intl.pluralLogic(
      minutes,
      locale: localeName,
      other: '# phút',
      one: '# phút',
    );
    return '$_temp0';
  }

  @override
  String privacyDashboardDurationSeconds(int seconds) {
    String _temp0 = intl.Intl.pluralLogic(
      seconds,
      locale: localeName,
      other: '# giây',
      one: '# giây',
    );
    return '$_temp0';
  }

  @override
  String get privacyDashboardLoadFailed =>
      'Không tải được cài đặt quyền riêng tư';

  @override
  String get privacyDashboardRetry => 'Thử lại';

  @override
  String get privacyDashboardSensitiveContentSaveFailed =>
      'Không thể lưu cài đặt nội dung nhạy cảm.';

  @override
  String get privacyDashboardDataRequestFailed =>
      'Không thể hoàn thành yêu cầu.';

  @override
  String get chatMessageDeleteFailed => 'Xóa tin nhắn lỗi';

  @override
  String get chatMessageAddReaction => 'Thêm biểu tượng cảm xúc';

  @override
  String get chatMessageEdit => 'Chỉnh sửa tin nhắn';

  @override
  String get chatMessageReply => 'Trả lời';

  @override
  String get chatMessageForward => 'Chuyển tiếp';

  @override
  String get forwardMessageTitle => 'Chuyển tiếp tin nhắn';

  @override
  String get forwardSearchHint => 'Tìm kênh hoặc tin nhắn';

  @override
  String get forwardDirectMessagesSection => 'Tin nhắn trực tiếp';

  @override
  String get forwardCommentHint => 'Thêm bình luận (tùy chọn)';

  @override
  String forwardSendButton(int count, int limit) {
    return 'Gửi ($count/$limit)';
  }

  @override
  String get forwardEmptyState => 'Không tìm thấy kênh nào';

  @override
  String get forwardSuccessToast => 'Đã chuyển tiếp tin nhắn';

  @override
  String get forwardFailed => 'Không thể chuyển tiếp tin nhắn';

  @override
  String get forwardCommentSlowmodeDisabled =>
      'Không thể gửi bình luận vì kênh đã chọn đã bật chế độ chậm.';

  @override
  String get forwardSendSlowmodeBlocked =>
      'Đang chờ chế độ chậm trong một hoặc nhiều kênh đã chọn hết hạn.';

  @override
  String get slowmodeRateLimitedTitle => 'Chế độ chậm đang bật';

  @override
  String slowmodeRateLimitedMessage(String duration) {
    return 'Chế độ chậm đang bật — đợi $duration trước khi gửi tin nhắn khác.';
  }

  @override
  String get chatAttachmentDropSlowmodeDisabled =>
      'Tải lên trực tiếp bị tắt trong chế độ làm chậm.';

  @override
  String get shareMediaTitle => 'Chia sẻ tới';

  @override
  String get shareMediaMessageHint => 'Thêm tin nhắn tùy chọn…';

  @override
  String get shareMediaSendButton => 'Gửi';

  @override
  String get shareMediaSuccessToast => 'Đã chia sẻ phương tiện';

  @override
  String shareMediaPartialSuccessToast(int count) {
    return 'Đã chia sẻ tới $count đích';
  }

  @override
  String get shareMediaFailedToast => 'Không thể chia sẻ phương tiện';

  @override
  String get forwardDestinationNoSendPermission =>
      'Bạn không thể gửi tin nhắn ở đây';

  @override
  String get forwardDestinationNoEmbedPermission =>
      'Bạn không thể nhúng liên kết ở đây';

  @override
  String get forwardDestinationNoAttachPermission =>
      'Bạn không thể đính kèm tệp ở đây';

  @override
  String get forwardDestinationGuildSendDisabled =>
      'Đã tắt tính năng gửi tin nhắn trong cộng đồng này';

  @override
  String get forwardDestinationTimedOut =>
      'Bạn đang bị tạm khóa trong cộng đồng này';

  @override
  String forwardDestinationSlowmodeCoolingDown(String remaining) {
    return 'Chế độ chậm - đợi $remaining';
  }

  @override
  String get chatMessageCopyText => 'Sao chép tin nhắn';

  @override
  String get chatMessageCopyEmbedText => 'Sao chép văn bản nhúng';

  @override
  String get chatMessageTranslate => 'Dịch';

  @override
  String chatMessageTranslatedFrom(String language) {
    return 'Đã dịch từ $language';
  }

  @override
  String get chatMessageSeeOriginal => 'Xem bản gốc';

  @override
  String get chatMessageSeeTranslation => 'Xem bản dịch';

  @override
  String get chatMessageTranslating => 'Đang dịch…';

  @override
  String get chatMessageTranslateFailed => 'Không thể dịch tin nhắn này.';

  @override
  String get chatMessageTranslateUnavailable =>
      'Không thể dịch trên thiết bị này.';

  @override
  String get chatMessageSpeak => 'Đọc tin nhắn';

  @override
  String get chatMessageStopSpeaking => 'Dừng nói';

  @override
  String get chatMessagePin => 'Ghim tin nhắn';

  @override
  String get chatMessageUnpin => 'Bỏ ghim tin nhắn';

  @override
  String get chatMessageUnpinIt => 'Bỏ ghim';

  @override
  String get chatMessageBookmark => 'Lưu tin nhắn';

  @override
  String get chatMessageRemoveBookmark => 'Bỏ đánh dấu';

  @override
  String get chatMessageMarkAsUnread => 'Đánh dấu là chưa đọc';

  @override
  String get chatMessageCopyMessageLink => 'Sao chép liên kết tin nhắn';

  @override
  String get chatMessageOpenLink => 'Mở liên kết';

  @override
  String get chatMessageCopyLink => 'Sao chép liên kết';

  @override
  String get chatMessageCopyMessageId => 'Sao chép ID tin nhắn';

  @override
  String get chatMessageViewReactions => 'Xem cảm xúc';

  @override
  String get chatMessageRemoveAllReactions => 'Xóa tất cả cảm xúc';

  @override
  String get chatMessageDebug => 'Tin nhắn gỡ lỗi';

  @override
  String get chatMessageDebugSheetTitle => 'Tin nhắn gỡ lỗi';

  @override
  String get chatMessageDebugCopyJson => 'Sao chép JSON';

  @override
  String get chatMessageDebugJsonCopiedToast =>
      'Đã sao chép JSON tin nhắn vào khay nhớ tạm';

  @override
  String get chatReactionsSheetTitle => 'Biểu cảm';

  @override
  String get chatReactionsSheetEmpty =>
      'Chưa có ai bày tỏ cảm xúc bằng biểu tượng này.';

  @override
  String get chatReactionAddFailed => 'Không thể thêm biểu tượng cảm xúc';

  @override
  String get chatReactionRemoveFailed => 'Không thể xóa biểu tượng cảm xúc';

  @override
  String get chatMessageReport => 'Báo cáo tin nhắn';

  @override
  String get iarReportMessageTitle => 'Báo cáo tin nhắn';

  @override
  String get iarThisUserFallback => 'người dùng này';

  @override
  String get iarModalDescription =>
      'Báo cáo vi phạm quy tắc hoặc tìm công cụ để quản lý liên hệ và tùy chọn.';

  @override
  String get iarPathStepAriaLabel => 'Bạn cần gì?';

  @override
  String get iarCategoryStepTitle => 'Quy tắc nào đã bị vi phạm?';

  @override
  String get iarReasonStepTitle => 'Quy tắc nào đã bị vi phạm?';

  @override
  String get iarReasonSelectHint => 'Chọn một lý do';

  @override
  String get iarPickAnOptionToast => 'Chọn một tùy chọn để tiếp tục.';

  @override
  String get iarPickARuleToast => 'Chọn quy tắc đã vi phạm.';

  @override
  String get iarPathPlatform => 'Báo cáo vi phạm quy tắc nền tảng';

  @override
  String get iarPathCommunity =>
      'Báo cáo cho người kiểm duyệt của cộng đồng này';

  @override
  String get iarPathPreferenceMessage => 'Tôi không thích nội dung này';

  @override
  String get iarCategoryTargetedHarmLabel => 'Đe dọa, quấy rối hoặc gây hại';

  @override
  String get iarCategoryTargetedHarmDescription =>
      'Bắt nạt, đe dọa, thù ghét, bạo lực, tấn công hoặc nội dung khuyến khích tự làm hại bản thân.';

  @override
  String get iarCategorySafetyMinorsLabel =>
      'An toàn cho trẻ em hoặc nội dung người lớn';

  @override
  String get iarCategorySafetyMinorsDescription =>
      'Trẻ vị thành niên gặp rủi ro, nội dung người lớn không phù hợp hoặc hành vi không mong muốn.';

  @override
  String get iarCategoryPrivacyIdentityLabel => 'Quyền riêng tư hoặc mạo danh';

  @override
  String get iarCategoryPrivacyIdentityDescription =>
      'Doxxing, rình rập, mạo danh hoặc hồ sơ không phù hợp.';

  @override
  String get iarCategoryDeceptionLabel =>
      'Lừa đảo, phần mềm độc hại hoặc thông tin sai lệch';

  @override
  String get iarCategoryDeceptionDescription =>
      'Lừa đảo, gian lận, liên kết độc hại hoặc thông tin sai lệch có khả năng gây hại trong thế giới thực.';

  @override
  String get iarCategoryIllegalOtherLabel =>
      'Hoạt động trái phép hoặc nội dung khác';

  @override
  String get iarCategoryIllegalOtherDescription =>
      'Mua bán trái phép, tiếp tay cho tội phạm hoặc vi phạm quy tắc rõ ràng không thuộc các mục trên.';

  @override
  String get iarReasonHarassmentLabel => 'Quấy rối hoặc đe dọa';

  @override
  String get iarReasonHarassmentMessageDescription =>
      'Bắt nạt, liên tục liên hệ không mong muốn, rình rập hoặc lạm dụng có chủ đích.';

  @override
  String get iarReasonHateLabel => 'Lời lẽ gây thù ghét';

  @override
  String get iarReasonHateMessageDescription =>
      'Lời lẽ xúc phạm, phi nhân tính hoặc công kích các nhóm được bảo vệ.';

  @override
  String get iarReasonViolenceLabel => 'Bạo lực hoặc đe dọa bạo lực';

  @override
  String get iarReasonViolenceDescription =>
      'Các mối đe dọa đáng tin cậy, bạo lực ghê rợn hoặc cổ súy bạo lực.';

  @override
  String get iarReasonMatureContentLabel => 'Nội dung người lớn hoặc quấy rối';

  @override
  String get iarReasonMatureContentMessageDescription =>
      'Hành vi không mong muốn hoặc nội dung người lớn không đúng chỗ.';

  @override
  String get iarReasonChildSafetyLabel =>
      'An toàn cho trẻ em hoặc bóc lột trẻ vị thành niên';

  @override
  String get iarReasonChildSafetyMessageDescription =>
      'Nội dung có hành vi dụ dỗ hoặc bóc lột trẻ em.';

  @override
  String get iarReasonHarmfulMisinfoLabel => 'Thông tin sai lệch có hại';

  @override
  String get iarReasonHarmfulMisinfoDescription =>
      'Tuyên bố sai sự thật có khả năng gây hại trong thế giới thực.';

  @override
  String get iarReasonSpamLabel =>
      'Spam, lừa đảo hoặc lừa đảo chiếm đoạt thông tin';

  @override
  String get iarReasonSpamMessageDescription =>
      'Spam hàng loạt, lừa đảo, tặng quà giả mạo hoặc lạm dụng tài khoản.';

  @override
  String get iarReasonMalwareLabel =>
      'Phần mềm độc hại hoặc liên kết nguy hiểm';

  @override
  String get iarReasonMalwareDescription =>
      'Phần mềm độc hại, đánh cắp thông tin đăng nhập hoặc các tệp độc hại.';

  @override
  String get iarReasonPrivacyLabel => 'Vi phạm quyền riêng tư';

  @override
  String get iarReasonPrivacyDescription =>
      'Doxxing, lộ thông tin cá nhân hoặc quấy rối.';

  @override
  String get iarReasonImpersonationLabel => 'Mạo danh hoặc nội dung lừa đảo';

  @override
  String get iarReasonImpersonationMessageDescription =>
      'Mạo danh người khác, bao gồm cả nội dung do AI tạo ra nhằm mục đích lừa đảo.';

  @override
  String get iarReasonIllegalLabel => 'Hoạt động trái phép';

  @override
  String get iarReasonIllegalDescription =>
      'Hoạt động mua bán trái phép, tiếp tay cho tội phạm hoặc các hành vi phi pháp khác.';

  @override
  String get iarReasonSelfHarmLabel => 'Tự làm hại bản thân hoặc tự tử';

  @override
  String get iarReasonSelfHarmMessageDescription =>
      'Quảng bá hoặc hướng dẫn tự làm hại bản thân hoặc rối loạn ăn uống.';

  @override
  String get iarReasonOtherLabel => 'Một vi phạm quy tắc rõ ràng khác';

  @override
  String iarReasonOtherDescription(String productName) {
    return 'Chỉ sử dụng tùy chọn này nếu nội dung vi phạm rõ ràng các quy tắc của $productName và không thuộc các danh mục trên.';
  }

  @override
  String iarUseChildSafetyInstead(String childSafetyReason) {
    return 'Nếu có trẻ vị thành niên liên quan, hãy sử dụng \"$childSafetyReason\" thay thế.';
  }

  @override
  String get iarSafetyNoteChildSafety =>
      'Nếu báo cáo này liên quan đến CSAM hoặc hành vi bóc lột trẻ vị thành niên, hãy gửi ngay và không chia sẻ lại tài liệu này.';

  @override
  String get iarSafetyNoteSelfHarm =>
      'Nếu có ai đó đang gặp nguy hiểm tức thì, hãy liên hệ với dịch vụ khẩn cấp địa phương nếu bạn có thể làm điều đó một cách an toàn.';

  @override
  String get iarSafetyNoteViolence =>
      'Nếu đây là mối đe dọa đáng tin cậy và sắp xảy ra, hãy liên hệ với các dịch vụ khẩn cấp địa phương nữa.';

  @override
  String get iarSafetyNoteTerrorism =>
      'Nếu đây là mối đe dọa khủng bố sắp xảy ra, hãy liên hệ với dịch vụ khẩn cấp địa phương nữa.';

  @override
  String get iarActionBlockUserTitle => 'Chặn người dùng này';

  @override
  String get iarActionBlockUserDescription =>
      'Dừng tin nhắn và lời mời kết bạn.';

  @override
  String get iarActionBlockUserButton => 'Chặn';

  @override
  String get iarActionCopyMessageLinkTitle => 'Sao chép liên kết tin nhắn';

  @override
  String get iarActionCopyMessageLinkDescription =>
      'Chia sẻ với người kiểm duyệt cộng đồng.';

  @override
  String get iarActionCopyMessageLinkButton => 'Sao chép';

  @override
  String get iarActionCloseDmTitle => 'Đóng tin nhắn này';

  @override
  String get iarActionCloseDmDescription =>
      'Không chặn. Bạn có thể mở lại sau.';

  @override
  String get iarActionCloseDmButton => 'Đóng tin nhắn';

  @override
  String get iarActionLeaveCommunityTitle => 'Rời khỏi cộng đồng';

  @override
  String get iarActionLeaveCommunityDescription =>
      'Ngừng xem nội dung và thành viên của nhóm này.';

  @override
  String get iarActionLeaveCommunityButton => 'Rời đi';

  @override
  String get iarActionDmSettingsTitle => 'Cài đặt DM & lời mời kết bạn';

  @override
  String get iarActionDmSettingsDescription =>
      'Thay đổi người có thể liên hệ với bạn.';

  @override
  String get iarActionCallSettingsTitle => 'Cài đặt cuộc gọi & trò chuyện nhóm';

  @override
  String get iarActionCallSettingsDescription =>
      'Thay đổi người có thể gọi hoặc thêm bạn.';

  @override
  String get iarActionOpenButton => 'Mở';

  @override
  String get iarActionDeleteMessageTitle => 'Xóa tin nhắn này';

  @override
  String get iarActionDeleteMessageDescription =>
      'Xóa tin nhắn này khỏi kênh đối với mọi người.';

  @override
  String get iarActionDeleteMessageButton => 'Xóa';

  @override
  String get iarActionDeleteMessageDeletedButton => 'Đã xóa';

  @override
  String get iarActionDeleteMessageDeletedTooltip => 'Tin nhắn này đã bị xóa.';

  @override
  String get iarActionBanUserTitle => 'Cấm người dùng này';

  @override
  String get iarActionBanUserDescription =>
      'Mở hộp thoại cấm cho cộng đồng này.';

  @override
  String get iarActionBanUserButton => 'Cấm';

  @override
  String get iarActionBanUserBannedButton => 'Đã cấm';

  @override
  String get iarActionBanUserBannedTooltip =>
      'Người dùng này đã bị cấm khỏi cộng đồng.';

  @override
  String get iarCloseDmConfirmTitle => 'Đóng tin nhắn';

  @override
  String iarCloseDmConfirmDescription(String name) {
    return 'Đóng cuộc trò chuyện trực tiếp hiện tại của bạn với $name. Thao tác này không chặn họ; bạn có thể mở lại sau.';
  }

  @override
  String get iarSuccessTitle => 'Đã gửi báo cáo';

  @override
  String get iarSuccessBody =>
      'Đội ngũ an toàn của chúng tôi đang xem xét báo cáo. Chúng tôi sẽ gửi cho bạn tin nhắn trực tiếp và email sau khi có kết quả.';

  @override
  String get iarAlreadyReportedTitle => 'Đã báo cáo';

  @override
  String get iarAlreadyReportedBody =>
      'Bạn đã báo cáo tin nhắn này rồi. Đội ngũ an toàn của chúng tôi đang xem xét.';

  @override
  String get iarBackButton => 'Quay lại';

  @override
  String get iarContinueButton => 'Tiếp tục';

  @override
  String get iarSendReportButton => 'Gửi báo cáo';

  @override
  String get iarDoneButton => 'Xong';

  @override
  String get iarCouldntSendToast => 'Không thể gửi báo cáo. Vui lòng thử lại.';

  @override
  String get iarRateLimitedToast =>
      'Bạn đang báo cáo quá nhanh. Vui lòng đợi một lát rồi thử lại.';

  @override
  String get iarReportSentToast =>
      'Đã gửi báo cáo. Đội ngũ an toàn của chúng tôi sẽ xem xét.';

  @override
  String iarBlockUserConfirmDescription(String name) {
    return 'Chặn $name chứ? Họ sẽ không thể nhắn tin hoặc gửi lời mời kết bạn cho bạn. Bạn có thể bỏ chặn họ sau.';
  }

  @override
  String get iarBlockUserFailedToast =>
      'Không thể chặn người dùng này. Vui lòng thử lại.';

  @override
  String get iarCloseDmSuccessToast => 'Đã đóng DM.';

  @override
  String get iarCloseDmFailedToast =>
      'Không thể đóng DM này. Vui lòng thử lại.';

  @override
  String get iarLeaveCommunityFailedToast =>
      'Không thể rời khỏi cộng đồng này. Vui lòng thử lại.';

  @override
  String get chatMessageSuppressEmbeds => 'Tắt xem trước đường dẫn';

  @override
  String get chatMessageUnsuppressEmbeds => 'Bỏ ẩn nội dung nhúng';

  @override
  String get chatMessageDelete => 'Xóa tin nhắn';

  @override
  String get chatMessageDeleteConfirmTitle => 'Xóa tin nhắn';

  @override
  String get chatMessageDeleteConfirmDescription =>
      'Bạn có chắc chắn muốn xóa tin nhắn này không?';

  @override
  String get chatMessageDeleteAttachment => 'Xóa tệp đính kèm';

  @override
  String get chatMessageEditAttachmentAltText => 'Chỉnh sửa văn bản thay thế';

  @override
  String get chatMessageMore => 'Thêm';

  @override
  String get chatEditingMessage => 'Đang chỉnh sửa tin nhắn';

  @override
  String get chatReplyOriginalDeleted => 'Tin nhắn gốc đã bị xoá';

  @override
  String get chatReplyOriginalFailedToLoad => 'Không tải được tin nhắn gốc';

  @override
  String get chatReplyAttachedMedia => 'Tin nhắn có đính kèm phương tiện';

  @override
  String chatBlockedMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tin nhắn bị chặn',
      one: '1 tin nhắn bị chặn',
    );
    return '$_temp0';
  }

  @override
  String chatSpammerMessagesCollapsed(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count tin nhắn có thể là spam',
      one: '1 tin nhắn có thể là spam',
    );
    return '$_temp0';
  }

  @override
  String get chatReplyHiddenBlockedAuthor =>
      'Không hiển thị tin nhắn trả lời vì người gửi đã bị chặn.';

  @override
  String get chatReplyHiddenSpammerAuthor =>
      'Không hiển thị tin nhắn trả lời vì người gửi ban đầu bị đánh dấu là spam.';

  @override
  String get devMarkAsSpamLocally => 'Đánh dấu là spam (trên máy này)';

  @override
  String get devIgnoreSpamFlag => 'Bỏ qua báo cáo spam';

  @override
  String get chatMessagesLoadError => 'Không thể tải tin nhắn.';

  @override
  String get chatReplyMentionOverrideTitle => 'Ghi đè tùy chọn nhắc đến?';

  @override
  String chatReplyMentionPrefersMentionBody(String authorNickname) {
    return '$authorNickname thích được nhắc đến trong các tin nhắn trả lời. Bạn vẫn muốn gửi mà không nhắc đến họ chứ?';
  }

  @override
  String chatReplyMentionPrefersNoMentionBody(String authorNickname) {
    return '$authorNickname không thích trả lời có nhắc đến tên. Bạn vẫn muốn gửi kèm nhắc đến tên chứ?';
  }

  @override
  String get chatReplyMentionIgnorePreference => 'Bỏ qua tùy chọn';

  @override
  String get chatReplyMentionDisableTooltip =>
      'Nhấn để tắt thông báo cho người bạn đang trả lời.';

  @override
  String get chatReplyMentionEnableTooltip =>
      'Nhấn để bật thông báo cho người bạn đang trả lời.';

  @override
  String get chatReplyMentionAccessibilityLabel =>
      'Đề cập người dùng đã trả lời';

  @override
  String get chatReplyMentionOn => 'ON';

  @override
  String get chatReplyMentionOff => 'Tắt';

  @override
  String get chatReplyCancel => 'Hủy trả lời';

  @override
  String get chatEditMessageHint => 'Chỉnh sửa tin nhắn';

  @override
  String get chatEditNoChanges => 'Không có thay đổi nào để lưu';

  @override
  String get chatChannelNotReady =>
      'Kênh này chưa sẵn sàng. Vui lòng thử lại sau.';

  @override
  String get chatMessageEdited => '(đã chỉnh sửa)';

  @override
  String get chatMessageSilent => 'Đây là một tin nhắn @silent.';

  @override
  String chatMessageTimestampToday(String time) {
    return 'Hôm nay lúc $time';
  }

  @override
  String chatMessageTimestampYesterday(String time) {
    return 'Hôm qua lúc $time';
  }

  @override
  String get mediaViewerImagePreview => 'Xem trước hình ảnh';

  @override
  String get mediaViewerClose => 'Đóng trình xem phương tiện';

  @override
  String get mediaViewerOpenInBrowser => 'Mở bằng trình duyệt';

  @override
  String get mediaViewerOptions => 'Tùy chọn phương tiện';

  @override
  String get mediaViewerCopyLink => 'Sao chép liên kết';

  @override
  String get mediaViewerForward => 'Chuyển tiếp';

  @override
  String get mediaViewerZoomIn => 'Phóng to';

  @override
  String get mediaViewerZoomOut => 'Thu nhỏ';

  @override
  String get mediaViewerPreviousAttachment => 'Tệp đính kèm trước';

  @override
  String get mediaViewerNextAttachment => 'Tệp đính kèm tiếp theo';

  @override
  String mediaViewerAttachmentIndex(int current, int total) {
    return '$current/$total';
  }

  @override
  String mediaViewerAttachmentThumbnail(int index) {
    return 'Tệp đính kèm $index';
  }

  @override
  String get mediaViewerDismissBackdrop => 'Bỏ qua';

  @override
  String get chatAttachmentVideoToggleControls =>
      'Bật/tắt tùy chọn điều khiển video';

  @override
  String get chatAttachmentVideoMute => 'Tắt tiếng video';

  @override
  String get chatAttachmentVideoUnmute => 'Bỏ tắt tiếng video';

  @override
  String get chatAttachmentVideoPlay => 'Phát video';

  @override
  String get chatAttachmentVideoPause => 'Tạm dừng video';

  @override
  String get chatAttachmentVideoProgress => 'Tiến độ video';

  @override
  String get chatVideoPlaybackFailed => 'Không thể phát video này.';

  @override
  String get composerAutocompleteRoleMentionDescription =>
      'Thông báo cho những người dùng có vai trò này và có quyền xem kênh.';

  @override
  String get composerAutocompleteSuggestions => 'Gợi ý';

  @override
  String get composerAutocompleteCommandsHeading => 'Lệnh';

  @override
  String get composerAutocompleteChoicesHeading => 'Lựa chọn';

  @override
  String get composerAutocompleteOptionalArgumentsHeading =>
      'Các đối số tùy chọn';

  @override
  String get composerAutocompleteChannelsHeading => 'Kênh';

  @override
  String get composerAutocompleteMembersHeading => 'Thành viên';

  @override
  String get composerAutocompleteUsersHeading => 'Người dùng';

  @override
  String get composerAutocompleteMentionsHeading => 'Lượt nhắc đến';

  @override
  String get composerAutocompleteRolesHeading => 'Vai trò';

  @override
  String get composerAutocompleteMediaHeading => 'Phương tiện';

  @override
  String get composerAutocompleteStickersHeading => 'Nhãn dán';

  @override
  String get composerAutocompleteGifsHeading => 'Ảnh GIF';

  @override
  String get composerAutocompleteNoGifs => 'Không tìm thấy ảnh GIF nào';

  @override
  String get composerCommandShrugDescription =>
      'Thêm ¯\\_(ツ)_/¯ vào tin nhắn của bạn.';

  @override
  String get composerCommandTableflipDescription =>
      'Thêm (╯°□°)╯︵ ┻━┻ vào tin nhắn của bạn.';

  @override
  String get composerCommandUnflipDescription =>
      'Thêm ┬─┬ ノ( ゜-゜ノ) vào tin nhắn của bạn.';

  @override
  String get composerCommandMeDescription =>
      'Gửi tin nhắn hành động (hiển thị nghiêng).';

  @override
  String get composerCommandSpoilerDescription =>
      'Gửi tin nhắn ẩn (sẽ được bọc trong thẻ ẩn).';

  @override
  String get composerCommandTtsDescription =>
      'Gửi tin nhắn chuyển văn bản thành giọng nói.';

  @override
  String get composerCommandNickDescription =>
      'Đổi biệt danh của bạn trong cộng đồng này.';

  @override
  String get composerCommandKickDescription =>
      'Đuổi một thành viên khỏi cộng đồng này.';

  @override
  String get composerCommandBanDescription =>
      'Cấm một thành viên khỏi cộng đồng này.';

  @override
  String get composerCommandMsgDescription =>
      'Gửi tin nhắn trực tiếp cho người dùng.';

  @override
  String get composerCommandSavedDescription =>
      'Gửi một mục phương tiện đã lưu.';

  @override
  String get composerCommandStickerDescription => 'Gửi nhãn dán.';

  @override
  String get composerCommandGifDescription => 'Tìm và gửi ảnh GIF.';

  @override
  String get composerCommandMemberOption => 'Thành viên được nhắm mục tiêu.';

  @override
  String get composerCommandReasonOption => 'Lý do (tùy chọn).';

  @override
  String get composerCommandMessageOption => 'Tin nhắn để gửi.';

  @override
  String get composerCommandQueryOption => 'Tìm kiếm cái gì.';

  @override
  String get composerCommandNicknameOption =>
      'Tên mới của bạn, hoặc để trống để đặt lại.';

  @override
  String get composerCommandDeleteMessagesOption =>
      'Số lượng lịch sử tin nhắn gần đây của thành viên sẽ bị xóa.';

  @override
  String get composerCommandDeleteMessagesNone =>
      'Không xóa bất kỳ tin nhắn nào';

  @override
  String composerCommandDeleteMessagesDays(int count) {
    return '$count ngày trước';
  }

  @override
  String get composerCommandDeleteMessagesOneDay => '24 giờ trước';

  @override
  String get composerCommandOptionRequired =>
      'Tùy chọn này là bắt buộc. Vui lòng cung cấp giá trị.';

  @override
  String get composerCommandClear => 'Xóa lệnh';

  @override
  String composerCommandNicknameChanged(
    String previousNickname,
    String newNickname,
  ) {
    return 'Bạn đã đổi biệt danh của mình trong cộng đồng này từ **$previousNickname** thành **$newNickname**.';
  }

  @override
  String get composerCommandUnknownUser => 'Người dùng không xác định';

  @override
  String composerCommandMsgFailed(String username) {
    return 'Không thể gửi tin nhắn tới **$username**. Họ có thể đã tắt tin nhắn trực tiếp hoặc bạn có thể đã bị chặn.';
  }

  @override
  String composerCommandOptionalMore(int count) {
    return 'Thêm $count nữa';
  }

  @override
  String get addGuildModalTitle => 'Thêm cộng đồng';

  @override
  String get addGuildModalLandingDescription =>
      'Tạo cộng đồng mới hoặc tham gia cộng đồng có sẵn.';

  @override
  String get addGuildCreateCommunity => 'Tạo cộng đồng';

  @override
  String get addGuildJoinCommunity => 'Tham gia cộng đồng';

  @override
  String get addGuildImportDiscordTemplate => 'Nhập mẫu Discord';

  @override
  String get addGuildJoinTitle => 'Tham gia cộng đồng';

  @override
  String get addGuildJoinDescription =>
      'Nhập liên kết mời để tham gia cộng đồng.';

  @override
  String get addGuildInviteLinkLabel => 'Liên kết mời';

  @override
  String get addGuildJoinSubmit => 'Tham gia cộng đồng';

  @override
  String get addGuildInviteInvalid =>
      'Lời mời này không hợp lệ hoặc đã hết hạn.';

  @override
  String get addGuildJoinFailed =>
      'Không thể tham gia cộng đồng. Vui lòng thử lại.';

  @override
  String get addGuildCreateTitle => 'Tạo cộng đồng';

  @override
  String get addGuildCreateDescription =>
      'Tạo một cộng đồng để bạn và bạn bè trò chuyện.';

  @override
  String get addGuildCreateNameLabel => 'Tên cộng đồng';

  @override
  String get addGuildCreateSubmit => 'Tạo cộng đồng';

  @override
  String get addGuildCreateFailed =>
      'Không thể tạo cộng đồng. Vui lòng thử lại.';

  @override
  String get addGuildCreateClaimTitle => 'Xác nhận tài khoản';

  @override
  String get addGuildCreateClaimDescription =>
      'Bạn cần xác minh tài khoản trước khi tạo cộng đồng.';

  @override
  String get addGuildCreateVerifyTitle => 'Xác minh email của bạn';

  @override
  String get addGuildCreateVerifyDescription =>
      'Bạn cần xác minh địa chỉ email trước khi tạo cộng đồng.';

  @override
  String get addGuildCreateAnimatedIconUnsupported =>
      'Không hỗ trợ biểu tượng động khi tạo cộng đồng mới. Vui lòng sử dụng ảnh tĩnh.';

  @override
  String get addGuildCreateGuidelinesBefore =>
      'Khi tạo cộng đồng, bạn đồng ý tuân thủ và duy trì ';

  @override
  String addGuildCreateGuidelinesLink(String productName) {
    return 'Hướng dẫn cộng đồng $productName';
  }

  @override
  String get addGuildCreateSingleCommunityBlocked =>
      'Máy chủ này chỉ có một cộng đồng, nên không thể tạo thêm cộng đồng nào khác.';

  @override
  String get addGuildCreateChangeIcon => 'Đổi biểu tượng';

  @override
  String get addGuildCreateIconLabel => 'Biểu tượng cộng đồng';

  @override
  String get addGuildCreateIconHint =>
      'PNG, JPEG, WebP, AVIF, HEIC, HEIF, JXL, SVG. Tối đa 10MB. Khuyến nghị: 512×512px';

  @override
  String get addGuildImportDescription =>
      'Dán URL mẫu Discord để nhập cấu trúc của nó vào một cộng đồng mới.';

  @override
  String get addGuildImportUrlLabel => 'URL mẫu';

  @override
  String get addGuildImportUrlInvalid => 'Nhập URL hoặc mã mẫu Discord hợp lệ.';

  @override
  String get addGuildImportFetchFailed =>
      'Không thể tải cộng đồng mẫu. Mẫu có thể không tồn tại hoặc dịch vụ bên ngoài không khả dụng.';

  @override
  String get addGuildImportInvalidResponse =>
      'Đây không có vẻ là phản hồi mẫu hợp lệ.';

  @override
  String get addGuildImportTemplateLabel => 'Mẫu';

  @override
  String addGuildImportTemplateStats(
    int textChannelCount,
    int voiceChannelCount,
    int categoryCount,
    int roleCount,
  ) {
    return '$textChannelCount kênh văn bản, $voiceChannelCount kênh thoại, $categoryCount danh mục, $roleCount vai trò';
  }

  @override
  String get addGuildImportRemoveIcon => 'Xóa biểu tượng';

  @override
  String get addGuildImportTemplateInvalid =>
      'Dữ liệu mẫu cộng đồng không hợp lệ hoặc bị lỗi định dạng.';

  @override
  String get addGuildPackInstalled => 'Đã cài đặt gói thành công.';

  @override
  String get chatMessageRemoveAllReactionsConfirmTitle =>
      'Xóa tất cả biểu tượng cảm xúc';

  @override
  String get chatMessageRemoveAllReactionsConfirmDescription =>
      'Bạn có chắc chắn muốn xóa tất cả các phản ứng khỏi tin nhắn này không?';

  @override
  String get chatMessageUnpinConfirmTitle => 'Bỏ ghim tin nhắn';

  @override
  String get chatMessageUnpinConfirmDescription => 'Gửi ghim này về quá khứ?';

  @override
  String systemPinMessage(
    String username,
    String messageLink,
    String allPinsLink,
  ) {
    return '$username đã ghim $messageLink vào kênh này. Xem $allPinsLink.';
  }

  @override
  String get systemPinMessageMessageLink => 'một tin nhắn';

  @override
  String get systemPinMessageAllPinsLink => 'tất cả tin nhắn được ghim';

  @override
  String get channelPinsEmptyTitle => 'Không có tin nhắn đã ghim';

  @override
  String get channelPinsEmptyDescription =>
      'Các tin nhắn đã ghim sẽ hiển thị ở đây.';

  @override
  String get channelDetailsFallbackTitle => 'Chi tiết';

  @override
  String channelDetailsGroupDmSubtitle(int count) {
    return 'Nhóm DM · $count thành viên';
  }

  @override
  String channelDetailsCloseDmDescription(String name) {
    return 'Đóng cuộc trò chuyện của bạn với $name?';
  }

  @override
  String channelDetailsLeaveGroupDescription(String name) {
    return 'Rời khỏi $name?';
  }

  @override
  String get channelDetailsChannelSettingsTitle => 'Cài đặt kênh';

  @override
  String get channelDetailsGroupSettingsTitle => 'Cài đặt nhóm';

  @override
  String get channelDetailsDmSettingsTitle => 'Cài đặt DM';

  @override
  String get channelDetailsInvitePeople => 'Mời mọi người';

  @override
  String get channelDetailsCopyLink => 'Sao chép liên kết';

  @override
  String get channelMenuCopyChannelLink => 'Sao chép liên kết kênh';

  @override
  String get channelMenuCopyRedirectLink => 'Sao chép liên kết chuyển hướng';

  @override
  String get channelDetailsAddFriendsToGroup => 'Thêm bạn vào nhóm';

  @override
  String get channelDetailsGroupInvites => 'Lời mời nhóm';

  @override
  String get channelDetailsEditChannel => 'Sửa kênh';

  @override
  String get channelDetailsDeleteChannel => 'Xóa kênh';

  @override
  String get channelSettingsCategorySettingsTitle => 'Cài đặt danh mục';

  @override
  String get channelSettingsEditCategory => 'Sửa danh mục';

  @override
  String get channelSettingsTabOverview => 'Tổng quan';

  @override
  String get channelSettingsTabPermissions => 'Quyền';

  @override
  String get channelSettingsTabInvites => 'Lời mời';

  @override
  String get channelSettingsTabWebhooks => 'Webhook';

  @override
  String get channelSettingsDeleteChannel => 'Xóa kênh';

  @override
  String channelSettingsDeleteChannelConfirm(String channelName) {
    return 'Bạn có chắc chắn muốn xóa $channelName không? Hành động này không thể hoàn tác.';
  }

  @override
  String channelSettingsDeleteCategoryConfirm(String categoryName) {
    return 'Bạn có chắc chắn muốn xóa $categoryName không? Hành động này không thể hoàn tác.';
  }

  @override
  String get channelSettingsDeleteCategory => 'Xóa danh mục';

  @override
  String get channelSettingsChannelUpdated => 'Đã cập nhật kênh';

  @override
  String get channelSettingsChannelName => 'Tên kênh';

  @override
  String get channelSettingsCategoryName => 'Tên danh mục';

  @override
  String get channelSettingsMyCategory => 'Danh mục của tôi';

  @override
  String get categoryExpandCategory => 'Mở rộng danh mục';

  @override
  String get categoryCollapseCategory => 'Thu gọn danh mục';

  @override
  String get categoryExpandAllCategories => 'Mở rộng tất cả danh mục';

  @override
  String get categoryCollapseAllCategories => 'Thu gọn tất cả danh mục';

  @override
  String get categoryMuteCategory => 'Tắt thông báo danh mục';

  @override
  String get categoryUnmuteCategory => 'Bật tiếng danh mục';

  @override
  String get categoryCopyCategoryId => 'Sao chép ID danh mục';

  @override
  String get categoryIdCopied => 'Đã sao chép ID danh mục';

  @override
  String get channelSettingsChannelNamePlaceholder => 'Chung';

  @override
  String get channelSettingsUrl => 'URL';

  @override
  String get channelSettingsUrlPlaceholder => 'https://example.com';

  @override
  String get channelSettingsTopic => 'Chủ đề';

  @override
  String get channelSettingsTopicPlaceholder => 'Thêm chủ đề cho kênh này';

  @override
  String get channelSettingsInsertEmoji => 'Chèn biểu tượng cảm xúc';

  @override
  String get channelSettingsTopicTooLongTitle => 'Chủ đề kênh quá dài.';

  @override
  String get channelSettingsTopicTooLongMessage => 'Rút gọn chủ đề và thử lại.';

  @override
  String get channelSettingsSlowmode => 'Chế độ chậm';

  @override
  String channelSettingsSlowmodeDescription(
    String bypassSlowmodePermissionLabel,
  ) {
    return 'Chờ giữa các tin nhắn. \"$bypassSlowmodePermissionLabel\" có thể bỏ qua nó.';
  }

  @override
  String get channelSettingsSlowmodeOff => 'Tắt';

  @override
  String channelSettingsSlowmodeSeconds(int seconds) {
    return '$seconds giây';
  }

  @override
  String channelSettingsSlowmodeMinutes(int minutes) {
    return '$minutes phút';
  }

  @override
  String channelSettingsSlowmodeHours(int hours) {
    return '$hours giờ';
  }

  @override
  String channelSettingsSlowmodeOneMinute(int oneMinute) {
    return '$oneMinute phút';
  }

  @override
  String channelSettingsSlowmodeOneHour(int oneHour) {
    return '$oneHour giờ';
  }

  @override
  String get channelSettingsVoiceQuality => 'Chất lượng giọng nói';

  @override
  String get channelSettingsVoiceQualityDescription =>
      'Bitrate cao hơn = chất lượng tốt hơn và sử dụng nhiều băng thông hơn.';

  @override
  String channelSettingsVoiceQualityKbps(int kilobits) {
    return '$kilobits kbps';
  }

  @override
  String get channelSettingsParticipantLimit => 'Giới hạn thành viên';

  @override
  String get channelSettingsParticipantLimitDescription =>
      'Số lượng thành viên tối đa có thể tham gia cùng lúc. 0 nghĩa là không giới hạn.';

  @override
  String channelSettingsParticipantLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count người tham gia',
      one: '1 người tham gia',
      zero: 'Vô hạn',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsConnectionLimit => 'Giới hạn kết nối';

  @override
  String get channelSettingsConnectionLimitDescription =>
      'Số kết nối hoạt động tối đa mà một thành viên có thể giữ trong kênh này.';

  @override
  String channelSettingsConnectionLimitValue(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count kết nối',
      one: '1 kết nối',
    );
    return '$_temp0';
  }

  @override
  String get channelSettingsVoiceRegion => 'Vùng thoại';

  @override
  String get channelSettingsVoiceRegionDescription =>
      'Chọn một khu vực giọng nói cho kênh này. Tự động sẽ sử dụng khu vực gần nhất.';

  @override
  String get channelSettingsVoiceRegionAutomatic => 'Tự động';

  @override
  String get channelSettingsVoiceRegionsLoadFailed =>
      'Không thể tải khu vực thoại';

  @override
  String get channelSettingsVoiceRegionsLoadFailedDescription =>
      'Thử lại sau giây lát.';

  @override
  String get channelSettingsResetSlider =>
      'Đặt lại thanh trượt về giá trị mặc định';

  @override
  String get channelSettingsAdvanced => 'Nâng cao';

  @override
  String get channelSettingsMatureContentOverride => 'Ghi đè nội dung nhạy cảm';

  @override
  String channelSettingsMatureContentSectionDescription(String scopeLevel) {
    return 'Ghi đè cài đặt cấp độ $scopeLevel cho kênh này. Nội dung nhạy cảm sẽ được hiển thị sau một lớp cổng trước khi vào.';
  }

  @override
  String get channelSettingsMatureContentInherit => 'Kế thừa';

  @override
  String get channelSettingsMatureContentOn => 'Bật';

  @override
  String get channelSettingsMatureContentOff => 'Tắt';

  @override
  String get channelSettingsMatureContentOnDescription =>
      'Đánh dấu kênh này là có nội dung người lớn.';

  @override
  String get channelSettingsMatureContentOffDescription =>
      'Để kênh này mở cho nội dung người lớn.';

  @override
  String channelSettingsMatureContentInheritsOn(String inheritedSourceLabel) {
    return 'Kế thừa từ $inheritedSourceLabel: bật';
  }

  @override
  String channelSettingsMatureContentInheritsOff(String inheritedSourceLabel) {
    return 'Kế thừa từ $inheritedSourceLabel: tắt';
  }

  @override
  String get channelSettingsMatureContentCategorySource => 'Danh mục';

  @override
  String get channelSettingsMatureContentCommunitySource => 'cộng đồng';

  @override
  String get channelSettingsMatureContentCategoryScope => 'Danh mục';

  @override
  String get channelSettingsMatureContentCommunityScope => 'Cộng đồng';

  @override
  String get channelSettingsContentWarningToggle =>
      'Hiển thị cảnh báo nội dung trong kênh này';

  @override
  String get channelSettingsContentWarningToggleDescription =>
      'Bật lời nhắc đồng ý trước khi vào kênh này.';

  @override
  String get channelSettingsContentWarningText => 'Văn bản cảnh báo tùy chỉnh';

  @override
  String get channelSettingsContentWarningDefault =>
      'Nội dung này có chứa thông tin nhạy cảm.';

  @override
  String channelSettingsPermissionsNeedManageChannels(
    String manageChannelsPermissionLabel,
  ) {
    return 'Bạn cần quyền \"$manageChannelsPermissionLabel\" để chỉnh sửa các quyền này.';
  }

  @override
  String channelSettingsPermissionsNeedManageRoles(
    String manageRolesPermissionLabel,
  ) {
    return 'Bạn cần quyền \"$manageRolesPermissionLabel\" để chỉnh sửa các quyền này.';
  }

  @override
  String get channelSettingsUnknownRole => 'Vai trò không xác định';

  @override
  String get channelSettingsUnknownUser => 'Người dùng không xác định';

  @override
  String get channelSettingsEveryoneRole => '@everyone';

  @override
  String get channelSettingsPermissionsAccessOverrides =>
      'Ghi đè quyền truy cập';

  @override
  String channelSettingsPermissionsEditAccessFor(String name) {
    return 'Chỉnh sửa quyền truy cập cho $name';
  }

  @override
  String get channelSettingsPermissionsBackToOverrides =>
      'Quay lại phần ghi đè';

  @override
  String get channelSettingsPermissionsConfigureBaseAccess =>
      'Cấu hình quyền truy cập cơ bản cho kênh này';

  @override
  String get channelSettingsPermissionsConfigureRoleOverrides =>
      'Cấu hình quyền riêng cho vai trò này';

  @override
  String get channelSettingsPermissionsConfigureMemberOverrides =>
      'Cấu hình quyền riêng cho thành viên này';

  @override
  String get channelSettingsPermissionsSearchPlaceholder => 'Tìm quyền…';

  @override
  String get channelSettingsPermissionsChannelAccessUpdated =>
      'Đã cập nhật quyền truy cập kênh';

  @override
  String get channelSettingsPermissionsTitle => 'Kiểm soát truy cập';

  @override
  String get channelSettingsPermissionsSyncedWithParentPrefix =>
      'Kênh này được đồng bộ với danh mục cha ';

  @override
  String get channelSettingsPermissionsSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentPrefix =>
      'Kênh này không được đồng bộ với danh mục cha ';

  @override
  String get channelSettingsPermissionsNotSyncedWithParentSuffix => '.';

  @override
  String get channelSettingsPermissionsSyncWithCategory =>
      'Đồng bộ với danh mục';

  @override
  String get channelSettingsPermissionsSyncedWithParentToast =>
      'Kênh đã đồng bộ với danh mục mẹ';

  @override
  String get channelSettingsPermissionsAddOverride => 'Thêm quyền ghi đè';

  @override
  String get channelSettingsPermissionsSearchRolesOrMembers =>
      'Tìm kiếm vai trò hoặc thành viên…';

  @override
  String get channelSettingsPermissionsRolesAndMembers =>
      'Vai trò và thành viên';

  @override
  String get channelSettingsDeleteInvite => 'Xóa lời mời';

  @override
  String get channelSettingsDeleteInviteConfirm =>
      'Xóa lời mời này? Không thể hoàn tác.';

  @override
  String get channelSettingsCopyInviteCode => 'Sao chép mã mời';

  @override
  String get channelSettingsCopyInviteUrl => 'Sao chép URL lời mời';

  @override
  String get channelSettingsWebhookCreated => 'Đã tạo webhook';

  @override
  String get channelSettingsWebhookCreateFailed =>
      'Tạo webhook không thành công';

  @override
  String get channelSettingsCreateWebhook => 'Tạo webhook';

  @override
  String get channelSettingsInvitesDescription =>
      'Quản lý các liên kết mời cho kênh này.';

  @override
  String get channelSettingsInvitesCreate => 'Tạo lời mời';

  @override
  String get channelSettingsInvitesEmpty => 'Không có liên kết mời';

  @override
  String get channelSettingsInvitesEmptyDescription =>
      'Kênh này chưa có liên kết mời nào. Tạo một liên kết để mời mọi người vào kênh này.';

  @override
  String get channelSettingsInvitesLoadFailedDescription =>
      'Đã xảy ra lỗi khi tải liên kết mời cho kênh này. Vui lòng thử lại.';

  @override
  String get channelSettingsWebhooksDescription =>
      'Quản lý các webhook đến có thể đăng tin nhắn vào kênh này.';

  @override
  String get channelSettingsWebhooksEmpty => 'Không có webhook nào';

  @override
  String get channelSettingsWebhooksEmptyDescription =>
      'Chưa có webhook nào được định cấu hình cho kênh này. Tạo một webhook để cho phép các ứng dụng bên ngoài đăng tin nhắn.';

  @override
  String get channelSettingsWebhooksUnsupported =>
      'Kênh này không hỗ trợ webhook.';

  @override
  String channelSettingsWebhooksPermissionRequired(String permission) {
    return 'Bạn cần quyền \"$permission\" để xem và chỉnh sửa webhook cho kênh này.';
  }

  @override
  String get channelSettingsWebhooksLoadFailedTitle => 'Không tải được webhook';

  @override
  String get channelSettingsWebhooksLoadFailedDescription =>
      'Đã xảy ra lỗi khi tải webhook cho kênh này. Vui lòng thử lại.';

  @override
  String channelSettingsWebhooksCreatedBy(String creator, String date) {
    return 'Được tạo bởi $creator vào $date';
  }

  @override
  String get channelSettingsWebhooksUnknownUser => 'Người dùng không xác định';

  @override
  String get channelSettingsWebhooksAvatar => 'Ảnh đại diện';

  @override
  String get channelSettingsWebhooksUploadImage => 'Tải ảnh lên';

  @override
  String get channelSettingsWebhooksRemove => 'Xóa';

  @override
  String get channelSettingsWebhooksName => 'Tên';

  @override
  String get channelSettingsWebhooksNamePlaceholder => 'Tên webhook';

  @override
  String get channelSettingsWebhooksChannel => 'Kênh';

  @override
  String get channelSettingsWebhooksUrl => 'URL Webhook';

  @override
  String get channelSettingsWebhooksCopyUrl => 'Sao chép URL webhook';

  @override
  String get channelSettingsWebhooksDelete => 'Xóa webhook';

  @override
  String get channelSettingsWebhooksDeleteFailed => 'Không thể xóa webhook này';

  @override
  String get channelSettingsWebhooksDeleteConfirm =>
      'Xóa webhook này? Không thể hoàn tác.';

  @override
  String get channelSettingsWebhookTryAgainInAMoment => 'Thử lại sau giây lát.';

  @override
  String get channelMenuOpenChat => 'Mở trò chuyện';

  @override
  String get channelMenuDuplicateChannel => 'Nhân bản kênh';

  @override
  String get channelMenuResetMatureContentAgreeState =>
      'Đặt lại trạng thái đồng ý nội dung người lớn';

  @override
  String get channelMenuDeleteMyMessagesTitle =>
      'Xóa tin nhắn của bạn trong kênh này?';

  @override
  String get channelMenuDeleteMyMessagesDescription =>
      'Thao tác này sẽ xóa vĩnh viễn tất cả tin nhắn bạn đã gửi trong kênh này. Không thể hoàn tác.';

  @override
  String get channelMenuDeleteMyMessagesConfirm => 'Xóa tin nhắn của tôi';

  @override
  String get channelMenuDeletedYourMessages => 'Đã xóa tin nhắn của bạn';

  @override
  String get channelMenuCouldNotDeleteYourMessages =>
      'Không thể xóa tin nhắn của bạn';

  @override
  String get channelDetailsSystemMessage => 'Tin nhắn hệ thống';

  @override
  String get channelDetailsTextChannel => 'Kênh văn bản';

  @override
  String get channelDetailsVoiceChannel => 'Kênh thoại';

  @override
  String get channelDetailsCategory => 'Danh mục';

  @override
  String get channelDetailsLinkChannel => 'Liên kết kênh';

  @override
  String get channelDetailsGenericChannel => 'Kênh';

  @override
  String get channelDetailsMutedConversation => 'Cuộc trò chuyện đã tắt tiếng';

  @override
  String get channelDetailsUnmutedConversation => 'Đã bỏ chặn cuộc trò chuyện';

  @override
  String get channelDetailsMutedChannel => 'Kênh đã tắt tiếng';

  @override
  String get channelDetailsUnmutedChannel => 'Đã bỏ tắt tiếng kênh';

  @override
  String get channelDetailsNotificationSettingsUpdated =>
      'Đã cập nhật cài đặt thông báo';

  @override
  String get channelDetailsTabMembers => 'Thành viên';

  @override
  String get channelDetailsTabPins => 'Tin đã ghim';

  @override
  String get channelDetailsActionMute => 'Tắt tiếng';

  @override
  String get channelDetailsActionUnmute => 'Bật tiếng';

  @override
  String get channelDetailsActionSearch => 'Tìm kiếm';

  @override
  String get channelDetailsActionMore => 'Thêm';

  @override
  String get channelDetailsMembersEmptyTitle =>
      'Không có thành viên nào để hiển thị';

  @override
  String get channelDetailsMembersEmptyBody =>
      'Thành viên sẽ xuất hiện ở đây khi dữ liệu cộng đồng được tải.';

  @override
  String get memberListPermissionDeniedTitle => 'Bạn không thể xem thành viên';

  @override
  String get memberListPermissionDeniedBody =>
      'Bạn không thể xem thành viên của kênh này trong cộng đồng này';

  @override
  String get memberListUnavailableTitle => 'Không có danh sách thành viên';

  @override
  String get memberListUnavailableBody =>
      'Danh sách thành viên tạm thời không khả dụng trong cộng đồng này';

  @override
  String get channelDetailsPinsLoadFailedTitle =>
      'Không thể tải các tin nhắn được ghim';

  @override
  String get channelDetailsPinsGuildEndHint =>
      'Thành viên có quyền \"Ghim tin nhắn\" có thể ghim tin nhắn để mọi người cùng xem.';

  @override
  String get channelDetailsPinsDmEndHint =>
      'Bạn có thể ghim tin nhắn trong cuộc trò chuyện này để mọi người cùng xem.';

  @override
  String get channelDetailsPinsEndReached => 'Bạn đã xem hết';

  @override
  String get channelHeaderOpenDetails => 'Mở chi tiết kênh';

  @override
  String get channelHeaderPinnedMessages => 'Tin nhắn đã ghim';

  @override
  String get channelHeaderPinnedMessagesUnread => 'Tin nhắn ghim, chưa đọc';

  @override
  String get channelHeaderMemberList => 'Danh sách thành viên';

  @override
  String get channelHeaderInbox => 'Hộp thư đến';

  @override
  String get channelHeaderNotificationSettingsMuted =>
      'Cài đặt thông báo, tắt tiếng';

  @override
  String get channelDetailsSearchTitle => 'Tìm kiếm';

  @override
  String get channelDetailsSearchHint => 'Tìm kiếm tin nhắn';

  @override
  String get channelDetailsSearchFilterFrom => 'Từ';

  @override
  String get channelDetailsSearchFilterHas => 'Có';

  @override
  String get channelDetailsSearchFilterIn => 'Trong';

  @override
  String get channelDetailsSearchFilterMentions => 'Lượt nhắc đến';

  @override
  String get channelDetailsSearchFilterMore => 'Thêm';

  @override
  String get channelDetailsSearchMoreFiltersActive => 'Đang hoạt động';

  @override
  String channelDetailsSearchChannelsCount(int count) {
    return '$count kênh';
  }

  @override
  String channelDetailsSearchUsersCount(int count) {
    return '$count người dùng';
  }

  @override
  String get channelDetailsSearchAuthorTypeUser => 'Người dùng';

  @override
  String get channelDetailsSearchAuthorTypeBot => 'Bot';

  @override
  String get channelDetailsSearchAuthorTypeWebhook => 'Webhook';

  @override
  String get channelDetailsSearchFilterByChannel => 'Lọc theo kênh';

  @override
  String get channelDetailsSearchChannelsHint => 'Tìm kênh';

  @override
  String get channelDetailsSearchChannelsEmpty => 'Không tìm thấy kênh nào';

  @override
  String get channelDetailsSearchMoreFiltersPinned => 'Đã ghim';

  @override
  String get channelDetailsSearchPinnedTrue => 'Chỉ ghim';

  @override
  String get channelDetailsSearchPinnedFalse => 'Loại trừ ghim';

  @override
  String get channelDetailsSearchClearFilter => 'Xóa';

  @override
  String get channelDetailsSearchMoreFiltersAuthorType => 'Loại tác giả';

  @override
  String get channelDetailsSearchMoreFiltersDate => 'Ngày';

  @override
  String get channelDetailsSearchMoreFiltersDateMode => 'Chế độ ngày';

  @override
  String get channelDetailsSearchMoreFiltersPickDate => 'Chọn một ngày';

  @override
  String get channelDetailsSearchMoreFiltersLink => 'Tên miền liên kết';

  @override
  String get channelDetailsSearchMoreFiltersFileName => 'Tên tệp chứa';

  @override
  String get channelDetailsSearchMoreFiltersFileType => 'Định dạng tệp';

  @override
  String get channelDetailsSearchContentPoll => 'Cuộc thăm dò';

  @override
  String get channelDetailsSearchContentPollDescription =>
      'Tin nhắn có một cuộc thăm dò';

  @override
  String get channelDetailsSearchContentForward => 'Chuyển tiếp';

  @override
  String get channelDetailsSearchContentForwardDescription =>
      'Tin nhắn đã chuyển tiếp';

  @override
  String get channelDetailsSearchFilterSort => 'Sắp xếp';

  @override
  String get channelHeaderSearchFiltersTitle => 'Bộ lọc tìm kiếm';

  @override
  String get channelHeaderSearchRecentTitle => 'Tìm kiếm gần đây';

  @override
  String get channelHeaderSearchUsersTitle => 'Người dùng';

  @override
  String get channelHeaderSearchChannelsTitle => 'Kênh';

  @override
  String get channelHeaderSearchValuesTitle => 'Giá trị';

  @override
  String get channelHeaderSearchDatesTitle => 'Ngày';

  @override
  String get channelHeaderSearchDefaultBadge => 'Mặc định';

  @override
  String get channelHeaderSearchClearHistory => 'Xóa';

  @override
  String get channelHeaderSearchFilterDescFrom => 'một người dùng';

  @override
  String get channelHeaderSearchFilterDescMentions => 'một người dùng';

  @override
  String get channelHeaderSearchFilterDescHas =>
      'liên kết, ảnh nhúng, ảnh, video, âm thanh, tệp, nhãn dán, …';

  @override
  String get channelHeaderSearchFilterDescBefore =>
      'một ngày hoặc phạm vi ngày';

  @override
  String get channelHeaderSearchFilterDescOn => 'một ngày hoặc phạm vi ngày';

  @override
  String get channelHeaderSearchFilterDescDuring =>
      'một ngày hoặc phạm vi ngày';

  @override
  String get channelHeaderSearchFilterDescAfter => 'một ngày hoặc phạm vi ngày';

  @override
  String get channelHeaderSearchFilterDescIn => 'một kênh';

  @override
  String get channelHeaderSearchFilterDescPinned => 'đúng hoặc sai';

  @override
  String get channelHeaderSearchFilterDescAuthorType =>
      'người dùng, bot hoặc webhook';

  @override
  String get channelHeaderSearchFilterDescLinkFrom =>
      'một tên máy chủ, ví dụ: example.com';

  @override
  String get channelHeaderSearchFilterDescFileName =>
      'một phần của tên tệp đính kèm';

  @override
  String get channelHeaderSearchFilterDescFileType =>
      'một phần mở rộng tệp, ví dụ: png';

  @override
  String get channelHeaderSearchFilterDescSort =>
      'thời gian hoặc mức độ liên quan';

  @override
  String get channelHeaderSearchFilterDescOrder => 'tăng dần hoặc giảm dần';

  @override
  String channelDetailsSearchResultCount(int count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString kết quả',
      one: '1 kết quả',
    );
    return '$_temp0';
  }

  @override
  String get channelDetailsSearchFilterByUser => 'Lọc theo người dùng';

  @override
  String get channelDetailsSearchFilterByContent => 'Lọc theo nội dung';

  @override
  String get channelDetailsSearchSortBy => 'Sắp xếp kết quả theo';

  @override
  String get channelDetailsSearchIn => 'Tìm kiếm trong';

  @override
  String get channelDetailsSearchEmptyTitle => 'Tìm kiếm cuộc trò chuyện này';

  @override
  String get channelDetailsSearchEmptyBody =>
      'Nhập văn bản, tác giả hoặc bộ lọc nội dung để tìm tin nhắn.';

  @override
  String get channelDetailsSearchIndexingTitle =>
      'Tin nhắn đang được lập chỉ mục';

  @override
  String get channelDetailsSearchIndexingBody =>
      'Thử lại sau khi tìm kiếm hoàn tất lập chỉ mục phạm vi này.';

  @override
  String get channelDetailsSearchNoResultsTitle => 'Không có kết quả';

  @override
  String get channelDetailsSearchNoResultsBody =>
      'Thử các cụm từ hoặc bộ lọc tìm kiếm khác.';

  @override
  String get channelDetailsMembersOnline => 'Đang hoạt động';

  @override
  String get channelDetailsMembersOffline => 'Ngoại tuyến';

  @override
  String get channelDetailsMemberYou => 'Bạn';

  @override
  String get channelDetailsSearchUsersHint => 'Tìm kiếm người dùng';

  @override
  String get channelDetailsSearchUsersTypeToSearch =>
      'Nhập để tìm kiếm thành viên';

  @override
  String get channelDetailsSearchUsersEmpty => 'Không tìm thấy người dùng nào';

  @override
  String get channelDetailsSearchUsersNoAvailable => 'Không có người dùng nào';

  @override
  String get channelDetailsDone => 'Xong';

  @override
  String get channelDetailsHasFilterPrompt => 'Hiển thị tin nhắn có chứa:';

  @override
  String get channelDetailsRetry => 'Thử lại';

  @override
  String get channelDetailsPinnedMessageTitle => 'Tin nhắn được ghim';

  @override
  String get channelDetailsSearchResultTitle => 'Kết quả tìm kiếm';

  @override
  String get channelDetailsJumpToMessage => 'Đi tới Tin nhắn';

  @override
  String get channelDetailsUnpinMessage => 'Bỏ ghim tin nhắn';

  @override
  String get channelDetailsCopyMessageLink => 'Sao chép liên kết tin nhắn';

  @override
  String get channelDetailsCopyMessageId => 'Sao chép ID tin nhắn';

  @override
  String get channelDetailsMessageUnpinned => 'Đã bỏ ghim tin nhắn';

  @override
  String get channelDetailsSearchScopeCurrentCommunity => 'Cộng đồng hiện tại';

  @override
  String get channelDetailsSearchScopeCurrentDm => 'Tin nhắn hiện tại';

  @override
  String get channelDetailsSearchScopeAllCommunities => 'Tất cả cộng đồng';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuild => 'Chỉ DM của bạn';

  @override
  String get channelDetailsSearchScopeAllDms => 'Tất cả tin nhắn';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuild => 'Chỉ DM mở';

  @override
  String get channelDetailsSearchScopeOpenDms => 'Tin nhắn trực tiếp';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunities =>
      'Tất cả DM + Cộng đồng';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunities =>
      'Tin nhắn riêng và Cộng đồng';

  @override
  String get channelDetailsSearchScopeCurrentCommunityDescription =>
      'Tìm kiếm chỉ trong Cộng đồng hiện tại';

  @override
  String get channelDetailsSearchScopeCurrentDmDescription =>
      'Chỉ tìm trong tin nhắn này';

  @override
  String get channelDetailsSearchScopeAllCommunitiesDescription =>
      'Trong tất cả các Cộng đồng bạn đang tham gia';

  @override
  String get channelDetailsSearchScopeAllDmsOnlyGuildDescription =>
      'Chỉ trong tất cả các tin nhắn trực tiếp bạn từng tham gia';

  @override
  String get channelDetailsSearchScopeAllDmsDescription =>
      'Trong tất cả các cuộc trò chuyện bạn từng tham gia';

  @override
  String get channelDetailsSearchScopeOpenDmsOnlyGuildDescription =>
      'Trong tất cả các DM bạn đang mở';

  @override
  String get channelDetailsSearchScopeOpenDmsDescription =>
      'Trong tất cả các DM bạn đang mở';

  @override
  String get channelDetailsSearchScopeAllDmsAndCommunitiesDescription =>
      'Trong tất cả các tin nhắn trực tiếp bạn từng có + tất cả các Cộng đồng bạn đang tham gia';

  @override
  String get channelDetailsSearchScopeOpenDmsAndCommunitiesDescription =>
      'Trong tất cả các DM bạn đang mở + tất cả các Cộng đồng bạn đang tham gia';

  @override
  String get channelDetailsSearchSortNewest => 'Mới nhất trước';

  @override
  String get channelDetailsSearchSortOldest => 'Cũ nhất trước';

  @override
  String get channelDetailsSearchSortRelevance => 'Liên quan nhất';

  @override
  String get channelDetailsSearchSortNewestDescription =>
      'Hiển thị tin nhắn gần đây nhất trước';

  @override
  String get channelDetailsSearchSortOldestDescription =>
      'Hiển thị tin nhắn cũ nhất trước';

  @override
  String get channelDetailsSearchSortRelevanceDescription =>
      'Hiển thị tin nhắn liên quan nhất trước';

  @override
  String get channelDetailsSearchContentImage => 'Tải lên ảnh';

  @override
  String get channelDetailsSearchContentVideo => 'Video tải lên';

  @override
  String get channelDetailsSearchContentAudio => 'Tệp âm thanh đã tải lên';

  @override
  String get channelDetailsSearchContentFile => 'Tệp tải lên';

  @override
  String get channelDetailsSearchContentLink => 'Liên kết';

  @override
  String get channelDetailsSearchContentEmbed =>
      'Xem trước hoặc nhúng đường dẫn';

  @override
  String get channelDetailsSearchContentSticker => 'Nhãn dán';

  @override
  String get channelDetailsSearchContentImageDescription =>
      'Chỉ ảnh đã tải lên';

  @override
  String get channelDetailsSearchContentVideoDescription =>
      'Chỉ video đã tải lên';

  @override
  String get channelDetailsSearchContentAudioDescription =>
      'Chỉ các tệp âm thanh đã tải lên';

  @override
  String get channelDetailsSearchContentFileDescription =>
      'Bất kỳ tệp đính kèm nào đã tải lên';

  @override
  String get channelDetailsSearchContentLinkDescription =>
      'Đã nhập URL trong nội dung tin nhắn';

  @override
  String get channelDetailsSearchContentEmbedDescription =>
      'Đã giải quyết các bản xem trước và nội dung nhúng đa dạng, không phải nội dung tải lên';

  @override
  String get channelDetailsSearchContentStickerDescription =>
      'Sticker đính kèm tin nhắn';

  @override
  String channelDetailsSearchContentTypesCount(int count) {
    return '$count loại';
  }

  @override
  String get personalNotesTitle => 'Ghi chú cá nhân';

  @override
  String get personalNotesSubtitle =>
      'Không gian riêng tư để ghi chú và nhắc nhở';

  @override
  String groupDmWelcome(String displayName) {
    return 'Chào mừng bạn đến với $displayName. Thêm bạn bè để bắt đầu cuộc trò chuyện nhóm.';
  }

  @override
  String get groupDmWelcomeEditGroup => 'Sửa nhóm';

  @override
  String get groupDmWelcomeAddFriends => 'Thêm bạn vào nhóm';

  @override
  String get dmGroupInvites => 'Lời mời';

  @override
  String get groupDmEditTitle => 'Sửa nhóm';

  @override
  String get groupDmEditDetailsTooltip => 'Chỉnh sửa chi tiết nhóm';

  @override
  String get groupDmGroupName => 'Tên nhóm';

  @override
  String get groupDmMyGroup => 'Nhóm của tôi';

  @override
  String get groupDmGroupNameMaxLength =>
      'Tên nhóm không được vượt quá 100 ký tự';

  @override
  String get groupDmGroupIcon => 'Ảnh nhóm';

  @override
  String get groupDmUploadIcon => 'Tải ảnh đại diện';

  @override
  String get groupDmChangeIcon => 'Đổi biểu tượng';

  @override
  String get groupDmRemoveIcon => 'Xóa biểu tượng';

  @override
  String get groupDmUpdated => 'Đã cập nhật nhóm';

  @override
  String get groupDmUpdateFailed => 'Không thể cập nhật nhóm. Thử lại.';

  @override
  String get groupDmAnimatedIconNotSupported =>
      'Không hỗ trợ biểu tượng động. Vui lòng sử dụng ảnh tĩnh.';

  @override
  String get groupDmAnimatedIconNotSupportedTitle =>
      'Không hỗ trợ biểu tượng động';

  @override
  String get groupDmIconFileTooLargeTitle => 'Tệp biểu tượng quá lớn';

  @override
  String groupDmIconFileTooLargeBody(String maxSize) {
    return 'Tệp biểu tượng quá lớn. Vui lòng chọn tệp có kích thước nhỏ hơn $maxSize.';
  }

  @override
  String get groupDmUnsupportedIconFormat =>
      'Định dạng biểu tượng không được hỗ trợ';

  @override
  String get groupDmUnsupportedIconFormatBody => 'Loại tệp không được hỗ trợ.';

  @override
  String get groupDmCouldntProcessImage => 'Không xử lý được hình ảnh';

  @override
  String get groupDmFailedToProcessCroppedImage =>
      'Không xử lý được hình ảnh đã cắt. Vui lòng thử lại.';

  @override
  String get groupDmInvalidImage => 'Hình ảnh không hợp lệ';

  @override
  String get groupDmInvalidImageBody =>
      'Hình ảnh không hợp lệ. Vui lòng thử ảnh khác.';

  @override
  String get groupDmAddFriends => 'Thêm';

  @override
  String get groupDmOrSendInvite => 'hoặc gửi lời mời đến một người bạn:';

  @override
  String get groupDmGenerateInviteLink => 'Tạo liên kết mời';

  @override
  String get groupDmCreateInvite => 'Tạo';

  @override
  String get groupDmInviteExpires24Hours =>
      'Lời mời của bạn sẽ hết hạn sau 24 giờ';

  @override
  String get groupDmAddFriendFailed =>
      'Không thể thêm người bạn này vào nhóm. Vui lòng thử lại.';

  @override
  String get groupDmAddFailed => 'Không thể thêm vào nhóm';

  @override
  String get groupDmGroupFull =>
      'Nhóm này đã đầy. Vui lòng xóa bớt thành viên trước khi thêm người khác.';

  @override
  String get groupDmRateLimited =>
      'Bạn đang thao tác quá nhanh. Vui lòng đợi một lát rồi thử lại.';

  @override
  String get groupDmCreateInviteFailed => 'Không thể tạo liên kết mời';

  @override
  String get groupDmCreateInviteFailedBody =>
      'Không thể tạo liên kết mời. Vui lòng thử lại.';

  @override
  String get guildNavbarCreateInviteFailed =>
      'Không thể tạo liên kết mời. Vui lòng thử lại.';

  @override
  String get guildNavbarCreateInviteMissingPermissions =>
      'Bạn không có quyền tạo lời mời trong kênh này.';

  @override
  String get guildNavbarCreateInviteMaxInvites =>
      'Cộng đồng này đã đạt giới hạn mời.';

  @override
  String get guildNavbarCreateInviteTemporarilyDisabled =>
      'Việc tạo lời mời tạm thời bị vô hiệu hóa cho cộng đồng này.';

  @override
  String get groupDmCopyInviteFailed => 'Không thể sao chép liên kết mời';

  @override
  String get groupDmInvitesOwnerOnly =>
      'Chỉ chủ nhóm mới có thể quản lý lời mời.';

  @override
  String get groupDmNoInvitesCreated => 'Chưa tạo lời mời nào';

  @override
  String get groupDmLoadingInvites => 'Đang tải lời mời...';

  @override
  String get groupDmInvitesLoadFailed =>
      'Không tải được lời mời. Vui lòng thử lại.';

  @override
  String get groupDmInvitesRevokeConfirm =>
      'Thu hồi lời mời này? Không thể hoàn tác.';

  @override
  String get groupDmInviteRevoked => 'Đã thu hồi lời mời';

  @override
  String groupDmInviteCreatedByExpires(String name, String time) {
    return 'Được tạo bởi $name. Hết hạn sau $time.';
  }

  @override
  String channelWelcomeHeading(String channelName) {
    return 'Chào mừng bạn đến với $channelName';
  }

  @override
  String channelWelcomeDescription(String channelName) {
    return 'Ban đầu, không có gì cả. Rồi, có $channelName. Và mọi thứ thật tuyệt vời.';
  }

  @override
  String get personalNotesComposerHint => 'Nhắn tin cho bản thân';

  @override
  String channelComposerHint(String channelName) {
    return 'Tin nhắn #$channelName';
  }

  @override
  String dmComposerHint(String recipientName) {
    return 'Nhắn tin cho @$recipientName';
  }

  @override
  String groupDmNamedComposerHint(String groupName) {
    return 'Tin nhắn $groupName';
  }

  @override
  String get groupDmComposerHint => 'Nhóm tin nhắn';

  @override
  String get composerHint => 'Nhắn tin';

  @override
  String get composerOpenExpressionPicker => 'Mở bộ chọn biểu tượng cảm xúc';

  @override
  String get composerShowKeyboard => 'Hiển thị bàn phím';

  @override
  String get composerCloseAttachmentPanel => 'Đóng trình chọn tệp đính kèm';

  @override
  String get chatAttachmentPanelPhotos => 'Ảnh';

  @override
  String get chatAttachmentPanelFiles => 'Tệp';

  @override
  String get chatAttachmentLibraryPermissionTitle =>
      'Cần quyền truy cập thư viện ảnh';

  @override
  String get chatAttachmentLibraryPermissionBody =>
      'Cho phép truy cập thư viện ảnh để duyệt và đính kèm ảnh cùng video gần đây.';

  @override
  String get chatAttachmentLibraryPermissionSettings => 'Mở cài đặt';

  @override
  String messageAccessibilityLabel(String author, String summary) {
    return '$author, $summary';
  }

  @override
  String get messageAccessibilitySendingSuffix => ', đang gửi';

  @override
  String get messageAccessibilityFailedSuffix => ', không gửi được';

  @override
  String get messageAccessibilityAttachmentSummary => 'một tệp đính kèm';

  @override
  String messageAccessibilityAttachmentsSummary(int count) {
    return '$count tệp đính kèm';
  }

  @override
  String get messageAccessibilityImageSummary => 'một ảnh';

  @override
  String get messageAccessibilityVideoSummary => 'một video';

  @override
  String get messageAccessibilityAudioSummary => 'một tệp âm thanh';

  @override
  String messageAccessibilityStickerSummary(String name) {
    return 'nhãn dán $name';
  }

  @override
  String messageAccessibilityFileSummary(String filename) {
    return 'tệp $filename';
  }

  @override
  String get messageAccessibilitySpoilerAttachmentSummary =>
      'một tệp đính kèm bị ẩn';

  @override
  String get messageAccessibilityEmbedSummary => 'một nội dung nhúng';

  @override
  String get messageAccessibilityEmptySummary => 'một tin nhắn';

  @override
  String get personalNotesPrivateSpace => 'Không gian riêng tư của bạn';

  @override
  String get purgePersonalNotes => 'Xóa ghi chú cá nhân';

  @override
  String get purgePersonalNotesConfirmDescription =>
      'Thao tác này sẽ xóa vĩnh viễn mọi tin nhắn và tệp đính kèm trong ghi chú cá nhân của bạn. Thao tác này không thể hoàn tác.';

  @override
  String get purgePersonalNotesConfirmButton => 'Xóa tin nhắn';

  @override
  String purgePersonalNotesSuccess(int count) {
    return 'Đã xóa $count tin nhắn khỏi ghi chú cá nhân';
  }

  @override
  String get purgePersonalNotesAlreadyEmpty => 'Ghi chú cá nhân đã trống';

  @override
  String get purgePersonalNotesFailed => 'Không thể xóa ghi chú cá nhân';

  @override
  String get userSettingsGroupYourAccount => 'TÀI KHOẢN CỦA BẠN';

  @override
  String get userSettingsGroupBilling => 'BILLING';

  @override
  String get userSettingsGroupApplication => 'APPLICATION';

  @override
  String get userSettingsGroupDeveloper => 'DEVELOPER';

  @override
  String get userSettingsGroupStaffOnly => 'STAFF-ONLY';

  @override
  String get userSettingsSearchPlaceholder => 'Tìm kiếm cài đặt...';

  @override
  String get userSettingsSearchFieldLabel => 'Tìm kiếm cài đặt';

  @override
  String get userSettingsSearchClear => 'Xóa tìm kiếm';

  @override
  String get userSettingsSearchNoResults => 'Không tìm thấy cài đặt nào';

  @override
  String get userSettingsNavProfile => 'Hồ sơ';

  @override
  String get userSettingsNavSecurityLogin => 'Bảo mật & Đăng nhập';

  @override
  String get userSettingsNavFluxerPlutonium => 'Fluxer Plutonium';

  @override
  String get userSettingsNavGiftsAndCodes => 'Quà tặng';

  @override
  String get giftSettingsClaimAccountTitle => 'Xác nhận tài khoản';

  @override
  String get giftSettingsClaimAccountDescription =>
      'Nhận tài khoản của bạn để đổi hoặc quản lý mã quà tặng Plutonium.';

  @override
  String get giftSettingsRedeemTitle => 'Đổi quà';

  @override
  String get giftSettingsRedeemDescription =>
      'Nhập mã quà tặng để đổi Plutonium cho tài khoản của bạn.';

  @override
  String get giftSettingsRedeemPlaceholder => 'Nhập mã quà tặng…';

  @override
  String get giftSettingsRedeemButton => 'Đổi quà';

  @override
  String get giftSettingsRedeemSuccess =>
      'Đã đổi quà thành công. Tận hưởng Plutonium của bạn.';

  @override
  String get giftSettingsPurchasedTitle => 'Quà đã mua';

  @override
  String get giftSettingsPurchasedDescription =>
      'Quản lý mã quà tặng Plutonium đã mua của bạn. Chia sẻ URL quà tặng với người đặc biệt hoặc tự mình đổi quà!';

  @override
  String get giftSettingsEmptyTitle => 'Chưa có quà nào';

  @override
  String get giftSettingsEmptyDescription =>
      'Mua quà Plutonium từ tab Plutonium để chia sẻ với bạn bè.';

  @override
  String get giftSettingsGoToPlutonium => 'Đi tới Plutonium';

  @override
  String get giftSettingsLoadFailedTitle => 'Không tải được kho quà';

  @override
  String get giftSettingsLoadFailedDescription => 'Thử lại sau.';

  @override
  String get giftSettingsTryAgain => 'Thử lại';

  @override
  String get giftSettingsGiftUrl => 'URL quà tặng';

  @override
  String get giftSettingsCopy => 'Sao chép';

  @override
  String get giftSettingsCopied => 'Đã sao chép';

  @override
  String get giftSettingsGiftUrlCopied => 'Đã sao chép đường dẫn quà tặng!';

  @override
  String get giftSettingsGiftUrlCopyFailed => 'Không thể sao chép URL quà tặng';

  @override
  String giftSettingsPurchasedDate(String date) {
    return 'Đã mua $date';
  }

  @override
  String giftSettingsRedeemedDate(String date) {
    return 'Đã đổi $date';
  }

  @override
  String giftSettingsRedeemedBy(String name) {
    return 'Đã đổi bởi $name';
  }

  @override
  String get giftSettingsAlreadyRedeemed => 'Món quà này đã được đổi';

  @override
  String get giftSettingsRedeemForYourself => 'Đổi cho bản thân';

  @override
  String get giftSettingsShareWithFriend => 'Chia sẻ với bạn bè';

  @override
  String get premiumPlutoniumTagline =>
      'Mở khóa giới hạn cao hơn và các tính năng độc quyền, đồng thời ủng hộ một nền tảng liên lạc độc lập.';

  @override
  String get premiumPurchaseMode => 'Chế độ mua hàng';

  @override
  String get premiumForMe => 'Dành cho tôi';

  @override
  String get premiumAsAGift => 'Làm quà tặng';

  @override
  String get premiumMonthly => 'Hàng tháng';

  @override
  String get premiumYearly => 'Hàng năm';

  @override
  String get premiumPerMonth => 'mỗi tháng';

  @override
  String get premiumPerYear => 'mỗi năm';

  @override
  String get premiumOneTimePurchase => 'mua một lần';

  @override
  String get premiumSave17 => 'Tiết kiệm 17%';

  @override
  String get premiumUpgradeNow => 'Nâng cấp ngay';

  @override
  String get premiumBuyGift => 'Mua gói quà';

  @override
  String get premiumOneYearGift => 'Gói quà 1 năm';

  @override
  String get premiumOneMonthGift => 'Gói quà 1 tháng';

  @override
  String get premiumMostPopular => 'Phổ biến nhất';

  @override
  String get premiumScrollPrompt =>
      'Cuộn xuống để xem tất cả các đặc quyền đi kèm với Plutonium';

  @override
  String get premiumFreeVsPlutonium => 'Miễn phí và Plutonium';

  @override
  String get premiumFreeColumn => 'Miễn phí';

  @override
  String get premiumGiftSectionTitle => 'Tặng Plutonium';

  @override
  String get premiumGiftSectionDescription =>
      'Chia sẻ trải nghiệm Plutonium với bạn bè bằng cách mua một gói đăng ký quà tặng.';

  @override
  String get premiumGiftBannerOne => 'Bạn có một mã quà tặng mới đang chờ bạn!';

  @override
  String premiumGiftBannerMany(int count) {
    return 'Bạn có $count mã quà tặng mới đang chờ bạn!';
  }

  @override
  String get premiumViewGifts => 'Xem quà';

  @override
  String get premiumReadyToUpgrade => 'Sẵn sàng nâng cấp?';

  @override
  String get premiumReadyToBuyGift => 'Sẵn sàng mua quà chưa?';

  @override
  String premiumMonthlyPrice(String price) {
    return 'Hàng tháng $price';
  }

  @override
  String premiumYearlyPrice(String price) {
    return 'Hàng năm $price';
  }

  @override
  String premiumOneYearPrice(String price) {
    return '1 năm $price';
  }

  @override
  String premiumOneMonthPrice(String price) {
    return '1 tháng $price';
  }

  @override
  String get premiumManageSubscription => 'Quản lý gói đăng ký';

  @override
  String get premiumRedeemGiftCode => 'Đổi mã quà tặng';

  @override
  String get premiumGiftBadge => 'Quà tặng';

  @override
  String get premiumCancelSubscriptionTitle => 'Hủy đăng ký?';

  @override
  String get premiumCancelSubscriptionBody =>
      'Bạn giữ các đặc quyền của mình cho đến ngày gia hạn tiếp theo, sau đó có thời gian gia hạn 3 ngày để đăng ký lại và giữ lịch sử người đăng ký của mình.';

  @override
  String get premiumCancelSubscriptionConfirm => 'Hủy gói đăng ký';

  @override
  String get premiumKeepSubscription => 'Giữ gói đăng ký';

  @override
  String get premiumPurchaseHistoryTitle => 'Lịch sử mua hàng';

  @override
  String get premiumPurchaseHistoryDescription =>
      'Các hóa đơn gần đây của bạn. Để thay đổi phương thức thanh toán cho gói đăng ký của bạn, hãy thêm hoặc chọn một phương thức trong cổng thanh toán và đặt nó làm mặc định.';

  @override
  String get premiumManagePaymentMethods => 'Quản lý phương thức thanh toán';

  @override
  String get premiumBillingHistory => 'Lịch sử thanh toán';

  @override
  String get premiumSelfServeRefundTitle => 'Hoàn tiền tự phục vụ';

  @override
  String get premiumSelfServeRefundButton => 'Hoàn tiền giao dịch gần nhất';

  @override
  String get premiumDisclaimerAgreementPrefix => 'Khi mua, bạn đồng ý với ';

  @override
  String get premiumDisclaimerAgreementPastPrefix =>
      'Bằng việc mua hàng, bạn đã đồng ý với ';

  @override
  String get premiumDisclaimerAgreementMiddle => ' và ';

  @override
  String premiumActiveUntil(String date) {
    return 'Còn hiệu lực đến $date';
  }

  @override
  String get premiumSubscriptionCanceling => 'Đang hủy';

  @override
  String premiumCancelsOn(String date) {
    return 'Hủy vào $date. Các đặc quyền vẫn còn hiệu lực cho đến lúc đó.';
  }

  @override
  String get premiumReactivateSubscription => 'Kích hoạt lại';

  @override
  String premiumGiftedUntil(String date) {
    return 'Đã tặng đến $date. Không tự động gia hạn.';
  }

  @override
  String get premiumComparisonFeatureColumn => 'Tính năng';

  @override
  String premiumDisclaimerPurchased(String terms, String privacy) {
    return 'Bằng cách mua, bạn đã đồng ý với $terms và $privacy của chúng tôi.';
  }

  @override
  String get premiumDisclaimerRefund =>
      'Bạn có thể tự hoàn tiền trong vòng 3 ngày kể từ khi thanh toán, mỗi 30 ngày một lần. Hoàn tiền gói đăng ký sẽ hủy gói đó. Người mua ở EU/EEA từ bỏ quyền rút tiền trong 14 ngày khi thanh toán để truy cập nội dung ngay lập tức. Hãy dùng nút hoàn tiền trong ứng dụng thay vì yêu cầu bồi hoàn. Yêu cầu bồi hoàn có thể hạn chế vĩnh viễn tài khoản của bạn. Stripe xử lý thanh toán an toàn. Chúng tôi không bao giờ thấy số thẻ đầy đủ của bạn.';

  @override
  String get premiumTermsOfService => 'Điều khoản dịch vụ';

  @override
  String get premiumPrivacyPolicy => 'Chính sách quyền riêng tư';

  @override
  String get premiumCheckoutStartFailedTitle => 'Không thể bắt đầu thanh toán';

  @override
  String get premiumCheckoutStartFailedBody =>
      'Đã xảy ra lỗi khi bắt đầu thanh toán. Vui lòng thử lại sau.';

  @override
  String get premiumGiftSubscriptionBlocksRecurring =>
      'Bạn đang dùng gói quà tặng. Gói này sẽ không tự động gia hạn. Bạn có thể đổi thêm mã quà tặng để gia hạn. Gói tự động gia hạn có thể được bắt đầu sau khi gói quà tặng của bạn kết thúc.';

  @override
  String get premiumPlanUnavailable =>
      'Gói này không khả dụng. Vui lòng liên hệ bộ phận hỗ trợ.';

  @override
  String get premiumCompletePaymentTitle => 'Hoàn tất thanh toán';

  @override
  String get premiumCompletePaymentBody =>
      'Bạn sẽ được chuyển hướng đến Stripe để hoàn tất thanh toán. Quay lại Fluxer sau khi hoàn tất.';

  @override
  String get premiumChoosePaymentMethodTitle => 'Chọn phương thức thanh toán';

  @override
  String get premiumPixPaymentPromptDescription =>
      'Thanh toán bằng Pix tự động để ủy quyền các khoản phí định kỳ trực tiếp từ ngân hàng Brazil của bạn. Hoặc chọn sử dụng thẻ để nhập thẻ tín dụng trên màn hình tiếp theo của Stripe.';

  @override
  String get premiumUsePix => 'Sử dụng Pix';

  @override
  String get premiumUpiPaymentPromptDescription =>
      'Thanh toán bằng UPI để thiết lập ủy quyền điện tử tuân thủ RBI từ ngân hàng Ấn Độ của bạn. Hoặc chọn sử dụng thẻ để nhập thẻ tín dụng trên màn hình tiếp theo của Stripe.';

  @override
  String get premiumUseUpi => 'Sử dụng UPI';

  @override
  String get premiumUseCard => 'Dùng thẻ';

  @override
  String get premiumCustomerPortalOpenFailedTitle =>
      'Không thể mở cổng thanh toán';

  @override
  String get premiumCustomerPortalOpenFailedBody =>
      'Đã xảy ra lỗi khi mở cổng thanh toán. Vui lòng thử lại sau giây lát.';

  @override
  String get premiumAlreadyVisionaryTitle => 'Bạn đã là Visionary rồi';

  @override
  String get premiumAlreadyVisionaryBody =>
      'Visionary đã bao gồm quyền truy cập vĩnh viễn, nên bạn không cần đăng ký định kỳ. Bạn vẫn có thể mua quà tặng cho người khác.';

  @override
  String get premiumExistingSubscriptionTitle => 'Gói đăng ký đã tồn tại';

  @override
  String get premiumExistingSubscriptionBody =>
      'Chúng tôi tìm thấy một gói đăng ký Fluxer Plutonium hiện có cho tài khoản này. Quản lý gói đăng ký đó trong cổng thanh toán bảo mật để cập nhật chi tiết thanh toán hoặc kiểm tra trạng thái gia hạn. Nếu bạn vừa thanh toán, hãy đợi một phút và mở lại trang này.';

  @override
  String get premiumPurchasesDisabledTitle =>
      'Tính năng mua hàng không khả dụng';

  @override
  String get premiumPurchasesDisabledBody =>
      'Giao dịch đã bị tắt cho tài khoản này. Liên hệ support@fluxer.app nếu bạn thấy có gì đó không đúng.';

  @override
  String get premiumClaimAccountToPurchase =>
      'Xác nhận tài khoản của bạn để mua Fluxer Plutonium.';

  @override
  String get premiumVerifyEmailToPurchase =>
      'Bạn cần xác minh email trước khi có thể mua Fluxer Plutonium.';

  @override
  String get premiumPerkCustomUsernameTag => 'Tên người dùng tùy chỉnh';

  @override
  String get premiumPerkPerCommunityProfiles =>
      'Hồ sơ riêng cho từng cộng đồng';

  @override
  String get premiumPerkMessageScheduling => 'Lên lịch tin nhắn';

  @override
  String get premiumPerkProfileBadge => 'Huy hiệu hồ sơ';

  @override
  String get premiumPerkCustomVideoBackgrounds => 'Hình nền video tùy chỉnh';

  @override
  String get premiumPerkEntranceSounds => 'Âm thanh vào phòng';

  @override
  String get premiumPerkCommunities => 'Cộng đồng';

  @override
  String get premiumPerkMessageCharacterLimit => 'Giới hạn ký tự tin nhắn';

  @override
  String get premiumPerkBookmarkedMessages => 'Tin nhắn đã đánh dấu';

  @override
  String get premiumPerkFileUploadSize => 'Kích thước tệp tải lên';

  @override
  String get premiumPerkEmojiStickerPacks =>
      'Gói biểu tượng cảm xúc & nhãn dán';

  @override
  String get premiumPerkSavedMedia => 'Ảnh/video đã lưu';

  @override
  String get premiumPerkUseAnimatedEmojis => 'Dùng biểu tượng cảm xúc động';

  @override
  String get premiumPerkGlobalEmojiStickerAccess =>
      'Truy cập biểu tượng cảm xúc và nhãn dán toàn cầu';

  @override
  String get premiumPerkVideoQuality => 'Chất lượng video';

  @override
  String get premiumPerkAnimatedAvatarsBanners =>
      'Ảnh đại diện & biểu ngữ động';

  @override
  String get premiumPerkEarlyAccess => 'Truy cập sớm các tính năng mới';

  @override
  String get premiumPerkCustomThemes => 'Giao diện tùy chỉnh';

  @override
  String get premiumPerkVideoQualityRestricted => '720p/30fps';

  @override
  String get premiumPerkVideoQualityStock => 'Lên đến 4K/60fps';

  @override
  String get userSettingsNavPrivacyDashboard =>
      'Bảng điều khiển quyền riêng tư';

  @override
  String get userSettingsNavAuthorizedApps => 'Ứng dụng được ủy quyền';

  @override
  String get userSettingsNavBlockedUsers => 'Người dùng bị chặn';

  @override
  String get userSettingsNavLinkedDevices => 'Thiết bị đã liên kết';

  @override
  String get userSettingsNavConnections => 'Kết nối';

  @override
  String get userSettingsNavLookAndFeel => 'Giao diện';

  @override
  String get userSettingsNavAccessibility => 'Trợ năng';

  @override
  String get userSettingsNavChat => 'Trò chuyện';

  @override
  String get userSettingsNavAudioAndVideo => 'Âm thanh & Video';

  @override
  String get userSettingsNavShortcuts => 'Phím tắt';

  @override
  String get audioAndVideoAudioSectionTitle => 'Âm thanh';

  @override
  String get audioAndVideoAudioSectionDescription =>
      'Cài đặt micro, loa và xử lý giọng nói của bạn.';

  @override
  String get audioAndVideoVideoSectionTitle => 'Video';

  @override
  String get audioAndVideoVideoSectionDescription =>
      'Cấu hình chất lượng camera và chia sẻ màn hình của bạn.';

  @override
  String get audioAndVideoInCallBehaviorSectionTitle => 'Hành vi khi đang gọi';

  @override
  String get audioAndVideoInCallBehaviorSectionDescription =>
      'Kiểm soát các lời nhắc xác nhận trong các cuộc gọi thoại và video.';

  @override
  String get audioAndVideoInputDeviceLabel => 'Thiết bị đầu vào';

  @override
  String get audioAndVideoOutputDeviceLabel => 'Thiết bị đầu ra';

  @override
  String get audioAndVideoDefaultDeviceLabel => 'Mặc định';

  @override
  String get audioAndVideoUseSpeakerLabel => 'Sử dụng loa';

  @override
  String get audioAndVideoUseSpeakerDescription =>
      'Khi tắt, âm thanh sẽ phát qua tai nghe hoặc tai nghe được kết nối.';

  @override
  String get audioAndVideoInputVolumeLabel => 'Âm lượng đầu vào';

  @override
  String get audioAndVideoOutputVolumeLabel => 'Âm lượng đầu ra';

  @override
  String get audioAndVideoVoiceProcessingSectionTitle => 'Xử lý giọng nói';

  @override
  String get audioAndVideoFocusedVoiceLabel => 'Giọng nói tập trung';

  @override
  String get audioAndVideoFocusedVoiceDescription =>
      'Được đề xuất. Làm sạch micrô của bạn để có giọng nói rõ ràng.';

  @override
  String get audioAndVideoDirectInputLabel => 'Đầu vào trực tiếp';

  @override
  String get audioAndVideoDirectInputDescription =>
      'Gửi âm thanh của bạn nguyên bản. Tốt nhất nếu bạn đang dùng phần mềm âm thanh bên ngoài.';

  @override
  String get audioAndVideoCustomProfileLabel => 'Tùy chỉnh';

  @override
  String get audioAndVideoCustomProfileDescription =>
      'Tự điều chỉnh từng cài đặt: khử tiếng ồn, loại bỏ tiếng vọng và độ lợi.';

  @override
  String get audioAndVideoNoiseSuppressionSectionTitle => 'Khử tiếng ồn';

  @override
  String get audioAndVideoNoiseSuppressionEnhancedLabel => 'Nâng cao';

  @override
  String get audioAndVideoNoiseSuppressionStandardLabel => 'Tiêu chuẩn';

  @override
  String get audioAndVideoNoiseSuppressionNoneLabel => 'Không';

  @override
  String get audioAndVideoEchoCancellationLabel => 'Khử tiếng vọng';

  @override
  String get audioAndVideoAutomaticGainControlLabel =>
      'Tự động điều chỉnh độ lợi';

  @override
  String get audioAndVideoAutomaticGainControlDescription =>
      'Cân bằng âm lượng micrô của bạn. Tắt khi bật tính năng khử tiếng ồn nâng cao.';

  @override
  String get audioAndVideoMicTestSectionTitle => 'Kiểm tra mic';

  @override
  String get audioAndVideoMicTestStartLabel => 'Bắt đầu kiểm tra mic';

  @override
  String get audioAndVideoMicTestStopLabel => 'Dừng kiểm tra mic';

  @override
  String audioAndVideoMicTestPermissionRequired(String productName) {
    return '$productName cần quyền truy cập micrô để kiểm tra đầu vào của bạn.';
  }

  @override
  String get audioAndVideoCameraLabel => 'Máy ảnh';

  @override
  String get audioAndVideoMirrorCameraLabel => 'Phản chiếu camera';

  @override
  String get audioAndVideoCameraQualitySectionTitle => 'Chất lượng camera';

  @override
  String get audioAndVideoCameraQuality480pLabel => '480p';

  @override
  String get audioAndVideoCameraQuality720pLabel => '720p';

  @override
  String get audioAndVideoCameraQuality1080pLabel => '1080p';

  @override
  String get audioAndVideoScreenShareQualitySectionTitle =>
      'Chất lượng chia sẻ màn hình';

  @override
  String get audioAndVideoFrameRateSectionTitle => 'Tốc độ khung hình';

  @override
  String get audioAndVideoFrameRate15Label => '15 FPS';

  @override
  String get audioAndVideoFrameRate30Label => '30 FPS';

  @override
  String get audioAndVideoFrameRate60Label => '60 FPS';

  @override
  String audioAndVideoHigherQualityRequiresPremium(String premiumProductName) {
    return 'Chất lượng 1080p và 60 FPS yêu cầu $premiumProductName.';
  }

  @override
  String get audioAndVideoInstanceVideoQualityLimit =>
      'Phiên bản này hiện cho phép chia sẻ màn hình lên tới 720p ở 30 FPS.';

  @override
  String audioAndVideoMicrophonePermissionRequired(String productName) {
    return '$productName cần quyền truy cập micrô để liệt kê thiết bị của bạn.';
  }

  @override
  String audioAndVideoCameraPermissionRequired(String productName) {
    return '$productName cần quyền truy cập camera để liệt kê thiết bị của bạn.';
  }

  @override
  String get audioAndVideoSkipHideOwnCameraConfirmLabel =>
      'Không hỏi khi ẩn camera của tôi';

  @override
  String get audioAndVideoSkipHideOwnScreenshareConfirmLabel =>
      'Không hỏi khi ẩn chia sẻ màn hình của tôi';

  @override
  String get userSettingsNavNotifications => 'Thông báo';

  @override
  String get notificationsGeneralSectionTitle => 'Chung';

  @override
  String get notificationsEnableNotificationsLabel => 'Bật thông báo';

  @override
  String notificationsEnableNotificationsDescription(String productName) {
    return 'Nhận thông báo khi bạn có tin nhắn. Bạn có thể cần cho phép $productName gửi thông báo trong cài đặt thiết bị của mình. Để kiểm soát thông báo cho từng kênh/cộng đồng, hãy mở cài đặt thông báo từ menu của cộng đồng.';
  }

  @override
  String get notificationsEnableDesktopNotificationsLabel =>
      'Bật thông báo trên máy tính';

  @override
  String get notificationsEnableDesktopNotificationsDescription =>
      'Sử dụng trung tâm thông báo của hệ điều hành. Để kiểm soát thông báo cho từng kênh/cộng đồng, nhấp chuột phải vào biểu tượng cộng đồng và mở cài đặt thông báo.';

  @override
  String get notificationsEnableBrowserNotificationsLabel =>
      'Bật thông báo trên trình duyệt';

  @override
  String get notificationsEnableBrowserNotificationsDescription =>
      'Nhận thông báo khi có tin nhắn mới. Bạn có thể cần bật thông báo trong cài đặt trình duyệt. Để cài đặt thông báo cho từng kênh/cộng đồng, nhấp chuột phải vào biểu tượng cộng đồng và mở cài đặt thông báo.';

  @override
  String get notificationsPushInactiveTimeoutLabel =>
      'Thời gian chờ thông báo đẩy không hoạt động';

  @override
  String notificationsPushInactiveTimeoutDescription(String productName) {
    return '$productName sẽ không gửi thông báo đẩy đến thiết bị di động của bạn khi bạn đang sử dụng máy tính. Chọn khoảng thời gian bạn cần không hoạt động trên máy tính trước khi nhận được thông báo đẩy.';
  }

  @override
  String notificationsPushInactiveTimeoutOneMinute(int oneMinute) {
    return '$oneMinute phút';
  }

  @override
  String notificationsPushInactiveTimeoutMinutes(int minutes) {
    return '$minutes phút';
  }

  @override
  String get notificationsMentionPreferenceSectionTitle => 'Tùy chọn nhắc đến';

  @override
  String get notificationsReplyMentionPreferenceAriaLabel =>
      'Tùy chọn nhắc đến trong trả lời';

  @override
  String get notificationsMentionNoPreferenceName => 'Không có tùy chọn nào';

  @override
  String get notificationsMentionNoPreferenceDescription =>
      'Tôn trọng ý định của người gửi, không cảnh báo khi họ bật/tắt nhắc đến @';

  @override
  String get notificationsMentionPreferMentionName => 'Ưu tiên nhắc đến';

  @override
  String get notificationsMentionPreferMentionDescription =>
      'Mặc định trả lời khi ai đó @nhắc đến bạn, và cảnh báo người gửi nếu họ tắt tính năng này';

  @override
  String get notificationsMentionPreferNoMentionName =>
      'Không ưu tiên nhắc đến';

  @override
  String get notificationsMentionPreferNoMentionDescription =>
      'Mặc định bỏ qua nhắc đến @, và cảnh báo người gửi nếu họ bật tính năng này';

  @override
  String get notificationsTtsSectionTitle =>
      'Thông báo chuyển văn bản thành giọng nói';

  @override
  String get notificationsTtsEnableCommandLabel =>
      'Bật tính năng đọc văn bản thành tiếng';

  @override
  String get notificationsTtsEnableCommandDescription =>
      'Cho phép /tts đọc tin nhắn của bạn. Tắt cài đặt này sẽ giữ các lệnh đó dưới dạng văn bản thông thường.';

  @override
  String get notificationsTtsAccessibilityLinkPrefix =>
      'Điều chỉnh tốc độ phát trong ';

  @override
  String get notificationsTtsAccessibilityLinkLabel => 'Trợ năng';

  @override
  String get notificationsTtsAccessibilityLinkSuffix => '.';

  @override
  String get notificationsTtsAutoNarrationTitle => 'Tự động đọc tin nhắn';

  @override
  String get notificationsTtsAutoNarrationDescription =>
      'Chuyển đổi nội dung đến thành giọng nói, bất kể nội dung đó có đến từ /tts hay không.';

  @override
  String get notificationsTtsModeAllChannelsName => 'Mọi kênh';

  @override
  String get notificationsTtsModeAllChannelsDescription =>
      'Đọc to mọi tin nhắn đến, bất kể bạn đang mở kênh nào.';

  @override
  String get notificationsTtsModeCurrentChannelName =>
      'Chỉ kênh đang hoạt động';

  @override
  String get notificationsTtsModeCurrentChannelDescription =>
      'Chỉ đọc kênh bạn đang xem. Tính năng đọc sẽ theo bạn giữa các kênh.';

  @override
  String get notificationsTtsModeNeverName => 'Không bao giờ tự động';

  @override
  String get notificationsTtsModeNeverDescription =>
      'Giữ im lặng trừ khi có người chạy lệnh /tts thủ công.';

  @override
  String get notificationsTtsModeAriaLabel => 'Đọc to tất cả tin nhắn';

  @override
  String get notificationsSoundsSectionTitle => 'Âm thanh';

  @override
  String get notificationsMasterVolumeLabel => 'Âm lượng chính';

  @override
  String get notificationsMasterVolumeDescription =>
      'Đặt mức âm lượng cho mọi hiệu ứng âm thanh. Các tùy chỉnh riêng cho từng âm thanh sẽ bỏ qua cài đặt này.';

  @override
  String get notificationsResetToDefaultVolume => 'Đặt lại âm lượng mặc định';

  @override
  String get notificationsDisableAllSoundsLabel =>
      'Tắt tất cả âm thanh thông báo';

  @override
  String get notificationsDisableAllSoundsDescription =>
      'Cài đặt âm thanh thông báo hiện có của bạn sẽ được giữ nguyên.';

  @override
  String get notificationsShowMoreSoundEffects =>
      'Hiển thị nhiều hiệu ứng âm thanh hơn';

  @override
  String get notificationsShowFewerSoundEffects =>
      'Hiển thị ít hiệu ứng âm thanh hơn';

  @override
  String get notificationsPreviewSound => 'Nghe thử âm thanh';

  @override
  String get notificationsPerSoundVolumeTitle => 'Âm lượng từng âm thanh';

  @override
  String get notificationsPerSoundVolumeDescription =>
      'Đặt âm lượng tùy chỉnh cho từng âm thanh. Các âm thanh không có cài đặt riêng sẽ theo âm lượng chính.';

  @override
  String notificationsPerSoundVolumeOverrideDescription(int overrideCount) {
    return 'Số lượng tùy chỉnh âm thanh đang được ghi đè: $overrideCount.';
  }

  @override
  String notificationsFollowingMasterVolume(int effectiveValue) {
    return 'Theo cài đặt chung • $effectiveValue%';
  }

  @override
  String notificationsResetSoundToMasterVolume(String label) {
    return 'Đặt lại $label về âm lượng chính';
  }

  @override
  String get notificationsResetAllOverrides => 'Đặt lại tất cả tùy chỉnh';

  @override
  String notificationsMuteSound(String label) {
    return 'Tắt âm thanh thông báo cho $label';
  }

  @override
  String notificationsUnmuteSound(String label) {
    return 'Bật âm thanh thông báo cho $label';
  }

  @override
  String get notificationsSoundMessage => 'Thông báo tin nhắn cộng đồng';

  @override
  String get notificationsSoundDirectMessage => 'Thông báo tin nhắn trực tiếp';

  @override
  String get notificationsSoundSameChannelMessage =>
      'Thông báo tin nhắn kênh hiện tại';

  @override
  String get notificationsSoundMute => 'Tắt tiếng cuộc gọi';

  @override
  String get notificationsSoundUnmute => 'Bật tiếng cuộc gọi';

  @override
  String get notificationsSoundDeaf => 'Tắt tiếng nghe';

  @override
  String get notificationsSoundUndeaf => 'Bật tiếng trò chuyện thoại';

  @override
  String get notificationsSoundUserJoin => 'Người dùng tham gia kênh';

  @override
  String get notificationsSoundUserLeave => 'Người dùng rời kênh';

  @override
  String get notificationsSoundUserMove => 'Người dùng đã chuyển kênh';

  @override
  String get notificationsSoundViewerJoin =>
      'Người xem tham gia luồng trực tiếp';

  @override
  String get notificationsSoundViewerLeave =>
      'Người xem rời khỏi luồng trực tiếp';

  @override
  String get notificationsSoundVoiceDisconnect => 'Đã ngắt kết nối thoại';

  @override
  String get notificationsSoundIncomingRing => 'Cuộc gọi đến';

  @override
  String get notificationsSoundCameraOn => 'Bật camera';

  @override
  String get notificationsSoundCameraOff => 'Tắt camera';

  @override
  String get notificationsSoundScreenShareStart => 'Bắt đầu chia sẻ màn hình';

  @override
  String get notificationsSoundScreenShareStop => 'Dừng chia sẻ màn hình';

  @override
  String get notificationsAfkTimeoutSyncFailed =>
      'Không thể cập nhật thời gian chờ thông báo đẩy. Thử lại.';

  @override
  String get notificationsMentionPreferenceSyncFailed =>
      'Không thể cập nhật tùy chọn đề cập. Thử lại.';

  @override
  String get notificationsPermissionDeniedTitle => 'Đã chặn thông báo';

  @override
  String get notificationsEnableNotificationsPermissionDenied =>
      'Không thể bật thông báo. Vui lòng cho phép quyền thông báo để tiếp tục.';

  @override
  String get userSettingsNavLanguageAndTime => 'Ngôn ngữ & Thời gian';

  @override
  String get languageAndTimeLanguageSectionTitle => 'Ngôn ngữ giao diện';

  @override
  String get languageAndTimeLanguageSectionDescription =>
      'Chọn ngôn ngữ được sử dụng trong ứng dụng';

  @override
  String get languageAndTimeOpenLanguageSettings => 'Mở cài đặt ngôn ngữ';

  @override
  String get languageAndTimeTimeFormatSectionTitle => 'Định dạng thời gian';

  @override
  String get languageAndTimeTimeFormatSectionDescription =>
      'Chọn cách hiển thị thời gian trong ứng dụng';

  @override
  String get languageAndTimeTimeFormatSelectionLabel =>
      'Chọn định dạng thời gian';

  @override
  String get languageAndTimeTimeFormatAuto => 'Tự động';

  @override
  String get languageAndTimeTimeFormat12Hour => '12 giờ';

  @override
  String get languageAndTimeTimeFormat24Hour => '24 giờ';

  @override
  String languageAndTimeTimeFormatAppLanguage(String format) {
    return 'Ngôn ngữ ứng dụng: $format';
  }

  @override
  String languageAndTimeTimeFormatSystemLocale(String format) {
    return 'Ngôn ngữ hệ thống: $format';
  }

  @override
  String get languageAndTimeUseSystemLocaleForTimeFormat =>
      'Sử dụng ngôn ngữ hệ thống cho định dạng thời gian';

  @override
  String get languageAndTimeTimeFormatSyncFailed =>
      'Không cập nhật được định dạng thời gian';

  @override
  String get userSettingsNavDefaultApps => 'Ứng dụng mặc định';

  @override
  String get defaultAppsWebBrowserSectionTitle => 'Trình duyệt web';

  @override
  String get defaultAppsWebBrowserSectionDescription =>
      'Chọn trình duyệt nào sẽ mở khi bạn nhấn vào một liên kết.';

  @override
  String get defaultAppsWebBrowserNativeAppNote =>
      'Nếu một ứng dụng đã được cài đặt cho một trang web, các liên kết sẽ mở trong ứng dụng đó trước.';

  @override
  String get defaultAppsWebBrowserInApp => 'Trình duyệt trong ứng dụng';

  @override
  String get defaultAppsWebBrowserExternal => 'Trình duyệt ngoài';

  @override
  String get userSettingsNavAdvanced => 'Nâng cao';

  @override
  String get advancedPerformanceReportingTitle => 'Báo cáo hiệu suất';

  @override
  String advancedPerformanceReportingSectionDescription(String productName) {
    return 'Giúp cải thiện $productName bằng cách chia sẻ dữ liệu sự cố và hiệu suất ẩn danh.';
  }

  @override
  String get advancedPerformanceReportingLabel =>
      'Gửi báo cáo sự cố và hiệu suất';

  @override
  String advancedPerformanceReportingDescription(String productName) {
    return 'Tất cả dữ liệu được báo cáo đều ẩn danh và chỉ được gửi đến dịch vụ giám sát của $productName — không sử dụng nhà cung cấp bên thứ ba nào.';
  }

  @override
  String get advancedSettingsConfigure => 'Cấu hình';

  @override
  String get advancedSettingsCategoryPrivacy => 'Quyền riêng tư';

  @override
  String get advancedSettingsCategoryAppearance => 'Giao diện';

  @override
  String get advancedSettingsCategoryAccessibility => 'Trợ năng';

  @override
  String get advancedSettingsCategoryChat => 'Trò chuyện';

  @override
  String get advancedSettingsCategoryMedia => 'Phương tiện';

  @override
  String get advancedSettingsCategoryVoice => 'Thoại';

  @override
  String get advancedSettingsCategoryDeveloper => 'Nhà phát triển';

  @override
  String get advancedSettingEnableTextSelectionLabel => 'Bật chọn văn bản';

  @override
  String get advancedSettingEnableTextSelectionDescription =>
      'Cho phép chọn văn bản trong ứng dụng';

  @override
  String get advancedSettingVideoSeekThumbnailsLabel =>
      'Bật hình thu nhỏ khi tìm kiếm video';

  @override
  String get advancedSettingVideoSeekThumbnailsDescription =>
      'Hình thu nhỏ hoặc khung hình trực tiếp khi tua video';

  @override
  String get advancedSettingHapticFeedbackLabel => 'Phản hồi rung';

  @override
  String get advancedSettingHapticFeedbackDescription =>
      'Phản hồi rung khi chạm và thực hiện hành động. Sẽ không đồng bộ hóa trên các thiết bị.';

  @override
  String get advancedSettingShowNekoLabel => 'Hiện Neko';

  @override
  String get advancedSettingShowNekoDescription =>
      'Mèo Neko đuổi theo con trỏ chuột của bạn';

  @override
  String get advancedSettingShowNekoDescriptionTouch =>
      'Hiển thị Neko trên ô nhập tin nhắn của bạn';

  @override
  String get advancedSettingMobileSplashZoomAnimationLabel =>
      'Hoạt ảnh thu phóng khi khởi động';

  @override
  String get advancedSettingMobileSplashZoomAnimationDescription =>
      'Thu nhỏ logo khi rời khỏi màn hình chờ';

  @override
  String get advancedSettingKeyboardHintsLabel => 'Gợi ý bàn phím';

  @override
  String get advancedSettingKeyboardHintsDescription =>
      'Gợi ý phím tắt trên thanh công cụ.';

  @override
  String get advancedSettingEnableFavoritesLabel => 'Bật mục yêu thích';

  @override
  String get advancedSettingEnableFavoritesDescription =>
      'Hiển thị mục yêu thích trong ứng dụng';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorLabel =>
      'Hành vi khi tham gia kênh thoại';

  @override
  String get advancedSettingVoiceChannelJoinBehaviorDescription =>
      'Xác nhận hoặc nhấp đúp để tham gia kênh thoại cộng đồng.';

  @override
  String get advancedSettingRequireDoubleClickJoinLabel =>
      'Yêu cầu nhấp đúp để vào kênh thoại';

  @override
  String get advancedSettingConfirmBeforeJoiningVoiceLabel =>
      'Xác nhận trước khi vào kênh thoại';

  @override
  String get advancedSettingAutoSendGifsLabel =>
      'Tự động gửi ảnh GIF khi được chọn';

  @override
  String get advancedSettingAutoSendGifsDescription =>
      'Tự động gửi ảnh GIF từ bộ chọn mà không cần xác nhận';

  @override
  String get advancedSettingSaveGifFavoritesLabel =>
      'Lưu GIF yêu thích vào mục đã lưu';

  @override
  String get advancedSettingSaveGifFavoritesDescription =>
      'Chọn cách lưu trữ GIF yêu thích đã gắn dấu sao';

  @override
  String get advancedSettingMediaButtonsLabel => 'Nút phương tiện';

  @override
  String get advancedSettingMediaButtonsDescription =>
      'Tùy chỉnh các nút và chỉ báo hiển thị trên hình ảnh đính kèm và nội dung nhúng';

  @override
  String get advancedSettingPreuploadAttachmentsLabel =>
      'Tải lên tệp đính kèm trước khi gửi';

  @override
  String get advancedSettingPreuploadAttachmentsDescription =>
      'Bắt đầu tải lên các tệp đính kèm ngay khi chúng được thêm vào ô nhập liệu tin nhắn';

  @override
  String get advancedSettingStripTrackingLabel =>
      'Xóa tham số theo dõi khỏi URL';

  @override
  String get advancedSettingStripTrackingDescription =>
      'Tự động xóa tham số theo dõi khỏi URL trong tin nhắn bạn gửi';

  @override
  String get advancedSettingTrustAllLinksLabel =>
      'Luôn tin cậy các liên kết bên ngoài';

  @override
  String get advancedSettingTrustAllLinksDescription =>
      'Bỏ qua cảnh báo liên kết ngoài cho tất cả các miền';

  @override
  String get advancedSettingSearchEnginesLabel => 'Công cụ tìm kiếm';

  @override
  String get advancedSettingSearchEnginesDescription =>
      'Cấu hình các công cụ tìm kiếm được sử dụng khi chọn văn bản';

  @override
  String get advancedSettingTranslatorsLabel => 'Người dịch';

  @override
  String get advancedSettingTranslatorsDescription =>
      'Định cấu hình các nhà cung cấp dịch thuật được sử dụng từ văn bản đã chọn';

  @override
  String get advancedSettingReverseImageSearchLabel =>
      'Tìm kiếm hình ảnh ngược';

  @override
  String get advancedSettingReverseImageSearchDescription =>
      'Nhà cung cấp tìm kiếm hình ảnh đảo ngược';

  @override
  String get advancedSettingMessageActionBarLabel => 'Thanh tác vụ tin nhắn';

  @override
  String get advancedSettingMessageActionBarDescription =>
      'Tùy chỉnh thanh hành động hiển thị khi di chuột qua tin nhắn';

  @override
  String get advancedSettingExpressionAutocompleteLabel =>
      'Tự động hoàn thành biểu cảm';

  @override
  String get advancedSettingExpressionAutocompleteDescription =>
      'Chọn nội dung hiển thị khi bạn nhập dấu hai chấm trong ô soạn tin nhắn';

  @override
  String get advancedSettingInputButtonsLabel => 'Nút nhập tin nhắn';

  @override
  String get advancedSettingInputButtonsDescription =>
      'Chọn các nút hiển thị trong ô nhập tin nhắn';

  @override
  String get advancedSettingScrollToBottomOnSendLabel =>
      'Cuộn xuống cuối khi gửi tin nhắn';

  @override
  String get advancedSettingScrollToBottomOnSendDescription =>
      'Chọn cách di chuyển trong cuộc trò chuyện sau khi bạn gửi tin nhắn';

  @override
  String get advancedSettingSkipMarkAllAsReadLabel =>
      'Bỏ qua xác nhận \"Đánh dấu tất cả đã đọc\"';

  @override
  String get advancedSettingSkipMarkAllAsReadDescription =>
      'Đánh dấu tất cả kênh chưa đọc trong hộp thư đến là đã đọc ngay lập tức, không cần xác nhận';

  @override
  String get advancedSettingHideMutedChannelsLabel =>
      'Ẩn các kênh đã tắt tiếng theo mặc định';

  @override
  String get advancedSettingHideMutedChannelsDescription =>
      'Ẩn các kênh đã tắt tiếng khỏi thanh bên cộng đồng';

  @override
  String get advancedSettingShowGifIndicatorLabel => 'Hiển thị chỉ báo GIF';

  @override
  String get advancedSettingShowAttachmentExpiryLabel =>
      'Hiển thị chỉ báo hết hạn tệp đính kèm';

  @override
  String get advancedSettingShowMediaDeleteLabel => 'Hiện nút xoá';

  @override
  String get advancedSettingShowMediaDownloadLabel => 'Hiện nút tải xuống';

  @override
  String get advancedSettingShowMediaFavoriteLabel => 'Hiện nút yêu thích';

  @override
  String get advancedSettingShowSuppressEmbedsLabel =>
      'Hiển thị nút chặn nhúng';

  @override
  String get advancedSettingShowMessageActionBarLabel =>
      'Hiển thị thanh tác vụ tin nhắn';

  @override
  String get advancedSettingShowOnlyMoreButtonLabel => 'Chỉ hiển thị nút thêm';

  @override
  String get advancedSettingShowQuickReactionsLabel => 'Hiện thả cảm xúc nhanh';

  @override
  String get advancedSettingEnableShiftToExpandLabel => 'Bật Shift để mở rộng';

  @override
  String get advancedSettingShowDefaultEmojisAutocompleteLabel =>
      'Hiển thị biểu tượng cảm xúc mặc định trong gợi ý biểu cảm';

  @override
  String get advancedSettingShowCustomEmojisAutocompleteLabel =>
      'Hiển thị biểu tượng cảm xúc tùy chỉnh trong tự động hoàn thành biểu cảm';

  @override
  String get advancedSettingShowStickersAutocompleteLabel =>
      'Hiển thị nhãn dán trong gợi ý biểu cảm';

  @override
  String get advancedSettingShowSavedMediaAutocompleteLabel =>
      'Hiển thị ảnh/video đã lưu trong gợi ý biểu cảm';

  @override
  String get advancedSettingShowGifsButtonLabel => 'Hiện nút GIF';

  @override
  String get advancedSettingShowMediaButtonLabel => 'Hiện nút phương tiện';

  @override
  String get advancedSettingShowStickersButtonLabel => 'Hiện nút nhãn dán';

  @override
  String get advancedSettingShowEmojiButtonLabel =>
      'Hiện nút biểu tượng cảm xúc';

  @override
  String get advancedSettingShowSendButtonLabel => 'Hiện nút gửi';

  @override
  String get advancedSettingNewDeviceAlertsLabel =>
      'Hiển thị cảnh báo thiết bị mới';

  @override
  String get advancedSettingNewDeviceAlertsDescription =>
      'Yêu cầu thiết bị âm thanh mới';

  @override
  String get advancedSettingConnectionVolumeControlsLabel =>
      'Điều khiển âm lượng kết nối';

  @override
  String get advancedSettingConnectionVolumeControlsDescription =>
      'Hiển thị thanh trượt âm lượng người tham gia theo từng thiết bị trong menu thoại';

  @override
  String get advancedSettingScreenSharePreviewBehaviorLabel =>
      'Hành vi xem trước khi chia sẻ màn hình';

  @override
  String get advancedSettingScreenSharePreviewBehaviorDescription =>
      'Xem trước, mở rộng và hành vi của hình thu nhỏ luồng phát';

  @override
  String get advancedSettingScreenShareCodecLabel => 'Codec chia sẻ màn hình';

  @override
  String get advancedSettingScreenShareCodecDescription =>
      'Codec video để chia sẻ màn hình';

  @override
  String get advancedSettingScreenShareCodecAuto =>
      'Tự động (được khuyến nghị)';

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
      'Tạm dừng xem trước chia sẻ màn hình của tôi trong nền';

  @override
  String get advancedSettingHideStreamPreviewLabel =>
      'Ẩn hình thu nhỏ xem trước luồng của tôi';

  @override
  String get advancedSettingDeveloperModeLabel => 'Bật chế độ nhà phát triển';

  @override
  String get advancedSettingDeveloperModeDescription =>
      'Bật chế độ nhà phát triển';

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
  String get advancedSettingTranslatorGoogle => 'Dịch bởi Google';

  @override
  String get advancedSettingTranslatorDeepL => 'DeepL';

  @override
  String get advancedSettingDefaultSearchEngineLabel =>
      'Công cụ tìm kiếm mặc định';

  @override
  String get advancedSettingDefaultSearchEngineDescription =>
      'Chọn công cụ tìm kiếm mặc định khi bạn tìm kiếm văn bản đã chọn.';

  @override
  String get advancedSettingBuiltInSearchEnginesLabel =>
      'Công cụ tìm kiếm tích hợp';

  @override
  String get advancedSettingBuiltInSearchEnginesDescription =>
      'Bật hoặc tắt các công cụ tìm kiếm tích hợp. Các công cụ được bật sẽ xuất hiện trong menu ngữ cảnh tin nhắn khi bạn chọn văn bản.';

  @override
  String get advancedSettingCustomSearchEnginesLabel =>
      'Công cụ tìm kiếm tùy chỉnh';

  @override
  String advancedSettingCustomSearchEnginesDescription(Object query) {
    return 'Thêm công cụ tìm kiếm của riêng bạn với một mẫu URL tùy chỉnh. Sử dụng \'$query\' làm trình giữ chỗ cho văn bản tìm kiếm.';
  }

  @override
  String get advancedSettingAddSearchEngineLabel => 'Thêm công cụ tìm kiếm';

  @override
  String get advancedSettingEnableAtLeastOneSearchEngineLabel =>
      'Bật ít nhất một công cụ tìm kiếm bên dưới.';

  @override
  String get advancedSettingRemoveSearchEngineLabel => 'Xóa công cụ tìm kiếm';

  @override
  String get advancedSettingDefaultTranslatorLabel => 'Trình dịch mặc định';

  @override
  String get advancedSettingDefaultTranslatorDescription =>
      'Chọn trình dịch mặc định khi dịch văn bản đã chọn.';

  @override
  String get advancedSettingBuiltInTranslatorsLabel => 'Trình dịch tích hợp';

  @override
  String get advancedSettingBuiltInTranslatorsDescription =>
      'Bật hoặc tắt trình dịch tích hợp. Trình dịch đã bật sẽ xuất hiện trong menu ngữ cảnh tin nhắn khi bạn chọn văn bản.';

  @override
  String get advancedSettingCustomTranslatorsLabel => 'Trình dịch tùy chỉnh';

  @override
  String advancedSettingCustomTranslatorsDescription(Object query) {
    return 'Thêm trình dịch của riêng bạn với một mẫu URL tùy chỉnh. Sử dụng \'$query\' làm trình giữ chỗ cho văn bản cần dịch.';
  }

  @override
  String get advancedSettingAddTranslatorLabel => 'Thêm người dịch';

  @override
  String get advancedSettingEnableAtLeastOneTranslatorLabel =>
      'Bật ít nhất một trình dịch bên dưới.';

  @override
  String get advancedSettingRemoveTranslatorLabel => 'Xóa trình dịch';

  @override
  String get advancedSettingDefaultReverseImageSearchLabel =>
      'Tìm kiếm hình ảnh ngược mặc định';

  @override
  String get advancedSettingDefaultReverseImageSearchDescription =>
      'Chọn dịch vụ tìm kiếm hình ảnh ngược được dùng làm mặc định khi tìm kiếm một hình ảnh.';

  @override
  String get advancedSettingBuiltInReverseImageSearchLabel =>
      'Tìm kiếm hình ảnh ngược tích hợp';

  @override
  String get advancedSettingBuiltInReverseImageSearchDescription =>
      'Bật hoặc tắt các nhà cung cấp tìm kiếm hình ảnh ngược tích hợp. Các nhà cung cấp được bật sẽ xuất hiện trong menu ngữ cảnh của hình ảnh, ảnh đại diện, biểu ngữ, nhãn dán và biểu tượng cảm xúc.';

  @override
  String get advancedSettingCustomReverseImageSearchLabel =>
      'Tìm kiếm hình ảnh ngược tùy chỉnh';

  @override
  String advancedSettingCustomReverseImageSearchDescription(Object url) {
    return 'Thêm nhà cung cấp tìm kiếm hình ảnh đảo ngược của riêng bạn với một mẫu URL tùy chỉnh. Sử dụng \'$url\' làm trình giữ chỗ cho URL hình ảnh.';
  }

  @override
  String get advancedSettingAddReverseImageSearchLabel =>
      'Thêm tìm kiếm bằng hình ảnh ngược';

  @override
  String get advancedSettingEnableAtLeastOneReverseImageSearchLabel =>
      'Vui lòng bật ít nhất một nhà cung cấp tìm kiếm hình ảnh ngược bên dưới.';

  @override
  String get advancedSettingRemoveReverseImageSearchLabel =>
      'Xóa tìm kiếm bằng hình ảnh';

  @override
  String get advancedSettingAddSearchEngineTitle => 'Thêm công cụ tìm kiếm';

  @override
  String get advancedSettingEditSearchEngineTitle =>
      'Chỉnh sửa công cụ tìm kiếm';

  @override
  String get advancedSettingAddTranslatorTitle =>
      'Thêm nhà cung cấp dịch thuật';

  @override
  String get advancedSettingEditTranslatorTitle =>
      'Chỉnh sửa nhà cung cấp dịch thuật';

  @override
  String get advancedSettingAddReverseImageSearchTitle =>
      'Thêm công cụ tìm kiếm hình ảnh ngược';

  @override
  String get advancedSettingEditReverseImageSearchTitle =>
      'Chỉnh sửa công cụ tìm kiếm hình ảnh ngược';

  @override
  String get advancedSettingSearchProviderNameLabel => 'Tên';

  @override
  String get advancedSettingSearchProviderUrlLabel => 'Mẫu URL';

  @override
  String get advancedSettingSearchProviderNameTextPlaceholder =>
      'Công cụ tìm kiếm của tôi';

  @override
  String get advancedSettingSearchProviderNameTranslatePlaceholder =>
      'Trình dịch của tôi';

  @override
  String get advancedSettingSearchProviderNameImagePlaceholder =>
      'Tìm kiếm hình ảnh của tôi';

  @override
  String advancedSettingSearchProviderUrlTextHint(Object query) {
    return 'Sử dụng \'$query\' để chèn văn bản tìm kiếm.';
  }

  @override
  String advancedSettingSearchProviderUrlTranslateHint(Object query) {
    return 'Sử dụng \'$query\' để chèn văn bản cần dịch.';
  }

  @override
  String advancedSettingSearchProviderUrlImageHint(Object url) {
    return 'Sử dụng \'$url\' để chèn URL ảnh.';
  }

  @override
  String get advancedSettingSearchProviderNameRequired => 'Tên là bắt buộc.';

  @override
  String get advancedSettingSearchProviderUrlRequired => 'Cần có mẫu URL.';

  @override
  String advancedSettingSearchProviderUrlMustContainQuery(Object query) {
    return 'Mẫu URL phải chứa trình giữ chỗ \'$query\'.';
  }

  @override
  String advancedSettingSearchProviderUrlMustContainUrl(Object url) {
    return 'Mẫu URL phải chứa placeholder \'$url\'.';
  }

  @override
  String get advancedSettingSearchProviderUrlMustBeValid =>
      'Mẫu URL phải là một URL hợp lệ.';

  @override
  String get advancedSettingAddSearchProviderAction => 'Thêm';

  @override
  String get advancedSettingEditSearchProviderAction => 'Chỉnh sửa';

  @override
  String get advancedSettingRemoveSearchProviderConfirmAction => 'Xóa';

  @override
  String advancedSettingRemoveSearchProviderConfirmDescription(
    String engineName,
  ) {
    return 'Bạn có chắc chắn muốn xóa $engineName không?';
  }

  @override
  String get userSettingsNavApplications => 'Ứng dụng';

  @override
  String get userSettingsNavAppLogs => 'Nhật ký ứng dụng';

  @override
  String get userSettingsNavDeveloperTools => 'Công cụ dành cho nhà phát triển';

  @override
  String get userSettingsNavLimitsConfig => 'Cấu hình giới hạn';

  @override
  String get userSettingsNavFeatureFlags => 'Cờ tính năng';

  @override
  String get userSettingsNavWhatsNew => 'Có gì mới';

  @override
  String get userSettingsJoinFluxerLabs => 'Tham gia Fluxer Labs';

  @override
  String get userSettingsNavAppLicenses => 'Giấy phép ứng dụng';

  @override
  String get userSettingsAppLicensesDescription =>
      'Phần mềm mã nguồn mở được sử dụng trong ứng dụng này. Ứng dụng này được xây dựng bằng Flutter.';

  @override
  String get userSettingsAppLicensesLoadError =>
      'Không thể tải danh sách giấy phép ứng dụng.';

  @override
  String userSettingsAppLicensesPackageCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giấy phép',
      one: '1 giấy phép',
    );
    return '$_temp0';
  }

  @override
  String get userSettingsNavLogOut => 'Đăng xuất';

  @override
  String get quickSwitcherTabSearch => 'Tìm kiếm';

  @override
  String get quickSwitcherTabFriends => 'Bạn bè';

  @override
  String get quickSwitcherSearchPlaceholder => 'Tìm kênh, người hoặc cộng đồng';

  @override
  String get quickSwitcherSearchFriends => 'Tìm bạn bè';

  @override
  String get quickSwitcherNoMatchesFound => 'Không tìm thấy kết quả nào';

  @override
  String get quickSwitcherEmptyHint =>
      'Thử tên khác hoặc dùng tiền tố @ / # / ! / * để lọc kết quả.';

  @override
  String get quickSwitcherSectionPeople => 'Mọi người';

  @override
  String get quickSwitcherSectionGroupMessages => 'Tin nhắn nhóm';

  @override
  String get quickSwitcherSectionTextChannels => 'Kênh văn bản';

  @override
  String get quickSwitcherSectionVoiceChannels => 'Kênh thoại';

  @override
  String get quickSwitcherSectionCommunities => 'Cộng đồng';

  @override
  String get quickSwitcherSectionSettings => 'Cài đặt';

  @override
  String get quickSwitcherHomeLabel => 'Trang chủ';

  @override
  String get quickSwitcherDirectMessagesLabel => 'Tin nhắn trực tiếp';

  @override
  String get quickSwitcherFavoritesLabel => 'Mục ưa thích';

  @override
  String get quickSwitcherUserSettingsLabel => 'Cài đặt người dùng';

  @override
  String get quickSwitcherNotificationsLabel => 'Thông báo';

  @override
  String get quickSwitcherBookmarksLabel => 'Tin nhắn đã lưu';

  @override
  String get savedMessagesEmptyTitle => 'Không có tin nhắn đã lưu';

  @override
  String get savedMessagesEmptyBody => 'Đánh dấu tin nhắn để lưu lại xem sau.';

  @override
  String get savedMessagesEndBody => 'Không còn gì khác để xem ở đây.';

  @override
  String get savedMessagesRemoveTooltip => 'Xóa dấu trang';

  @override
  String get quickSwitcherMentionsLabel => 'Lượt nhắc đến';

  @override
  String get quickSwitcherFriendsEmptyTitle => 'Chưa có bạn bè nào';

  @override
  String get quickSwitcherFriendsEmptyHint => 'Thêm bạn bè để bắt đầu.';

  @override
  String get quickSwitcherFriendsNoMatchTitle =>
      'Không có người bạn nào khớp với tìm kiếm đó';

  @override
  String get quickSwitcherFriendsNoMatchHint => 'Thử một tên khác.';

  @override
  String get quickSwitcherSearchAliasUser => 'Người dùng';

  @override
  String get quickSwitcherSearchAliasYou => 'Bạn';

  @override
  String get quickSwitcherSearchAliasDm => 'DM';

  @override
  String get quickSwitcherSearchAliasDms => 'Tin nhắn';

  @override
  String get quickSwitcherSearchAliasMessages => 'Tin nhắn';

  @override
  String get quickSwitcherSearchAliasFav => 'Yêu thích';

  @override
  String get quickSwitcherSearchAliasStarred => 'Đã ghim';

  @override
  String get quickSwitcherSearchAliasInbox => 'Hộp thư đến';

  @override
  String get quickSwitcherSearchAliasSaved => 'Đã lưu';

  @override
  String get uiClose => 'Đóng';

  @override
  String get chatJumpToBottom => 'Nhảy đến cuối';

  @override
  String get uiConfirm => 'Xác nhận';

  @override
  String get uiLoading => 'Đang tải';

  @override
  String get uiSearch => 'Tìm kiếm';

  @override
  String get uiStartCall => 'Bắt đầu cuộc gọi';

  @override
  String get uiStartVideoCall => 'Bắt đầu cuộc gọi video';

  @override
  String get uiPlay => 'Phát';

  @override
  String get uiPause => 'Tạm dừng';

  @override
  String get uiDownload => 'Tải xuống';

  @override
  String get uiMoreActions => 'Thêm tuỳ chọn';

  @override
  String get uiUnsavedChanges => 'Thay đổi chưa lưu';

  @override
  String get uiReset => 'Đặt lại';

  @override
  String get uiOpenColorPicker => 'Mở bảng chọn màu';

  @override
  String get uiSelectPlaceholder => 'Chọn';

  @override
  String get uiSearchPlaceholder => 'Tìm kiếm';

  @override
  String get uiNoOptionsFound => 'Không tìm thấy tùy chọn nào';

  @override
  String get uiDismissNotification => 'Tắt thông báo';

  @override
  String get uiColorPickerTitle => 'Bộ chọn màu';

  @override
  String get mentionConfirmTitle => 'Nhắc đến mọi người?';

  @override
  String mentionConfirmEveryoneBody(int count) {
    return 'Thao tác này sẽ thông báo cho $count thành viên. Tiếp tục?';
  }

  @override
  String mentionConfirmHereBody(int count) {
    return 'Thao tác này sẽ thông báo cho $count thành viên đang trực tuyến. Tiếp tục?';
  }

  @override
  String mentionConfirmRoleBody(int count, String roleName) {
    return 'Thao tác này sẽ thông báo cho $count thành viên có vai trò $roleName. Tiếp tục?';
  }

  @override
  String get mentionConfirmButton => 'Đề cập';

  @override
  String get composerEmojiUnavailable =>
      'Bạn không thể dùng biểu tượng cảm xúc đó ở đây.';

  @override
  String get instanceUrlLabel => 'URL của phiên bản';

  @override
  String get instanceUrlPlaceholder =>
      'Nhập URL của phiên bản (ví dụ: fluxer.app)';

  @override
  String get resetToDefaultInstance => 'Đặt lại về Fluxer';

  @override
  String get instanceConnect => 'Kết nối';

  @override
  String get instanceConnecting => 'Đang kết nối…';

  @override
  String get instanceConnectFailed => 'Không thể kết nối tới phiên bản';

  @override
  String get recentInstances => 'Các phiên bản gần đây';

  @override
  String removeRecentInstance(String domain) {
    return 'Xóa $domain khỏi các phiên gần đây';
  }

  @override
  String get instanceSheetTitle => 'Kết nối tới máy chủ';

  @override
  String get connectToDifferentInstance => 'Kết nối tới một phiên bản khác';

  @override
  String get changeInstance => 'Thay đổi';

  @override
  String get instanceConnectionRequired => 'Kết nối với phiên bản để đăng nhập';

  @override
  String get comingSoon => 'Sắp ra mắt';

  @override
  String get guildNavbarDirectMessages => 'Tin nhắn trực tiếp';

  @override
  String get guildNavbarExploreDiscoverableCommunities =>
      'Khám phá các cộng đồng có thể hiển thị';

  @override
  String get discoveryExplore => 'Khám phá';

  @override
  String get discoveryExplorePublicCommunities =>
      'Khám phá cộng đồng công khai';

  @override
  String get discoveryListingSubheading =>
      'Muốn liệt kê cộng đồng của bạn ở đây? Hãy đăng ký nếu bạn đáp ứng các yêu cầu trong cài đặt cộng đồng của bạn > Khám phá.';

  @override
  String get discoverySearchCommunities => 'Tìm cộng đồng';

  @override
  String get discoveryFilterByLanguage => 'Lọc theo ngôn ngữ';

  @override
  String get discoveryAllLanguages => 'Tất cả ngôn ngữ';

  @override
  String get discoveryAllCategories => 'Tất cả';

  @override
  String get discoveryCategoryGaming => 'Trò chơi';

  @override
  String get discoveryCategoryMusic => 'Âm nhạc';

  @override
  String get discoveryCategoryEntertainment => 'Giải trí';

  @override
  String get discoveryCategoryEducation => 'Giáo dục';

  @override
  String get discoveryCategoryScienceAndTechnology => 'Khoa học & Công nghệ';

  @override
  String get discoveryCategoryContentCreator => 'Người sáng tạo nội dung';

  @override
  String get discoveryCategoryAnimeAndManga => 'Anime & Manga';

  @override
  String get discoveryCategoryMoviesAndTv => 'Phim & TV';

  @override
  String get discoveryCategoryOther => 'Khác';

  @override
  String get discoveryNoCommunitiesMatch => 'Không có cộng đồng nào khớp.';

  @override
  String get discoveryJoinCommunity => 'Tham gia cộng đồng';

  @override
  String get discoveryJoined => 'Đã tham gia';

  @override
  String discoveryOnlineCount(String count) {
    return '$count trực tuyến';
  }

  @override
  String discoveryMemberCount(num count) {
    final intl.NumberFormat countNumberFormat =
        intl.NumberFormat.decimalPattern(localeName);
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString thành viên',
      one: '1 thành viên',
    );
    return '$_temp0';
  }

  @override
  String get discoveryNoDescription => 'Không có mô tả.';

  @override
  String get discoveryCommunities => 'Cộng đồng';

  @override
  String get discoveryApps => 'Ứng dụng';

  @override
  String get discoveryJoinErrorGenericTitle =>
      'Không thể tham gia cộng đồng này';

  @override
  String get discoveryJoinErrorGenericMessage =>
      'Đã xảy ra lỗi. Vui lòng thử lại sau giây lát.';

  @override
  String get discoveryJoinErrorFullTitle => 'Cộng đồng này đã đầy';

  @override
  String get discoveryJoinErrorFullMessage =>
      'Cộng đồng này đã đạt đến giới hạn thành viên, nên bạn không thể tham gia ngay bây giờ.';

  @override
  String get discoveryJoinErrorMaxGuildsTitle =>
      'Bạn đã đạt đến giới hạn cộng đồng';

  @override
  String get discoveryJoinErrorMaxGuildsMessage =>
      'Bạn đã tham gia số lượng cộng đồng tối đa. Hãy rời khỏi một cộng đồng và thử lại.';

  @override
  String get discoveryJoinErrorBannedTitle =>
      'Bạn không thể tham gia cộng đồng này';

  @override
  String get discoveryJoinErrorBannedMessage =>
      'Bạn đã bị cấm khỏi cộng đồng này.';

  @override
  String get discoveryJoinErrorNotAvailableTitle =>
      'Cộng đồng này không còn khả dụng';

  @override
  String get discoveryJoinErrorNotAvailableMessage =>
      'Có thể cộng đồng này đã rời khỏi mục khám phá hoặc tắt tính năng tham gia mới. Hãy làm mới trang và bạn sẽ không thấy cộng đồng này nữa.';

  @override
  String get discoveryJoinErrorRateLimitTitle => 'Bạn đang thao tác quá nhanh';

  @override
  String get discoveryJoinErrorRateLimitMessage =>
      'Vui lòng đợi một lát rồi thử lại.';

  @override
  String get guildNavbarAddCommunity => 'Thêm cộng đồng';

  @override
  String get guildNavbarHelp => 'Trợ giúp';

  @override
  String get scrollIndicatorNew => 'MỚI';

  @override
  String get scrollIndicatorNewMessage => 'Tin nhắn mới';

  @override
  String guildNavbarCollapseFolder(String folderName) {
    return 'Thu gọn $folderName';
  }

  @override
  String get guildNavbarGuildSelected => 'Đã chọn';

  @override
  String get guildNavbarGuildUnread => 'chưa đọc';

  @override
  String guildNavbarGuildMentions(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count thông báo',
      one: '1 thông báo',
    );
    return '$_temp0';
  }

  @override
  String get navigationItemMuted => 'đã tắt tiếng';

  @override
  String get authShowPassword => 'Hiện mật khẩu';

  @override
  String get authHidePassword => 'Ẩn mật khẩu';

  @override
  String get chatLoadingMessages => 'Đang tải tin nhắn';

  @override
  String get friendsMessageFriend => 'Nhắn tin';

  @override
  String get friendsFriendActions => 'Thao tác bạn bè';

  @override
  String get friendsAcceptRequest => 'Chấp nhận lời mời kết bạn';

  @override
  String get friendsDeclineRequest => 'Từ chối lời mời kết bạn';

  @override
  String get friendsCancelRequest => 'Hủy lời mời kết bạn';

  @override
  String get friendsOpenInbox => 'Hộp thư đến';

  @override
  String get profileRemoveFriend => 'Hủy kết bạn';

  @override
  String get profileUnblockUser => 'Bỏ chặn người dùng';

  @override
  String get profileAcceptFriendRequest => 'Chấp nhận lời mời kết bạn';

  @override
  String get profileCancelFriendRequest => 'Hủy lời mời kết bạn';

  @override
  String get profileSendFriendRequest => 'Thêm bạn bè';

  @override
  String get accountOverflowMenu => 'Tùy chọn tài khoản';

  @override
  String get navHome => 'Trang chủ';

  @override
  String get navNotifications => 'Thông báo';

  @override
  String get navYou => 'Bạn';

  @override
  String get guildFolderSettingsTitle => 'Cài đặt thư mục';

  @override
  String get guildFolderNameLabel => 'Tên thư mục';

  @override
  String get guildFolderColorLabel => 'Màu thư mục';

  @override
  String get guildFolderShowIconWhenCollapsed => 'Hiện biểu tượng khi thu gọn';

  @override
  String get guildFolderIconLabel => 'Biểu tượng thư mục';

  @override
  String get guildFolderDelete => 'Xóa thư mục';

  @override
  String get guildFolderIconFolder => 'Thư mục';

  @override
  String get guildFolderIconStar => 'Gắn dấu sao';

  @override
  String get guildFolderIconHeart => 'Thả tim';

  @override
  String get guildFolderIconBookmark => 'Đánh dấu';

  @override
  String get guildFolderIconGameController => 'Tay cầm chơi game';

  @override
  String get guildFolderIconShield => 'Khiên';

  @override
  String get guildFolderIconMusicNote => 'Ký hiệu nhạc';

  @override
  String get guildFolderMarkAsRead => 'Đánh dấu thư mục đã đọc';

  @override
  String get guildBulkMuteCommunities => 'Tắt thông báo cộng đồng';

  @override
  String get guildBulkUnmuteCommunities => 'Bỏ tắt tiếng cộng đồng';

  @override
  String get guildBulkCommunityNotificationSettings =>
      'Cài đặt thông báo cộng đồng';

  @override
  String get guildBulkCommunityPrivacySettings =>
      'Cài đặt quyền riêng tư của cộng đồng';

  @override
  String get guildBulkAllowEveryoneAndHere => 'Cho phép @everyone và @here';

  @override
  String get guildBulkAllowRoleMentions => 'Cho phép nhắc đến vai trò';

  @override
  String get guildBulkEnableMobilePush => 'Bật thông báo đẩy trên di động';

  @override
  String get guildBulkDisableMobilePush => 'Tắt thông báo đẩy trên di động';

  @override
  String get guildBulkAllowDirectMessages => 'Cho phép tin nhắn trực tiếp';

  @override
  String get guildBulkBlockDirectMessages => 'Chặn tin nhắn trực tiếp';

  @override
  String get guildBulkAllowBotDirectMessages =>
      'Cho phép bot nhắn tin trực tiếp';

  @override
  String get guildBulkBlockBotDirectMessages =>
      'Chặn tin nhắn trực tiếp từ bot';

  @override
  String get guildNavbarGroupDm => 'Tin nhắn nhóm';

  @override
  String get guildNavbarCreateChannel => 'Tạo kênh';

  @override
  String get guildNavbarChannelType => 'Loại kênh';

  @override
  String get guildNavbarTextChannel => 'Kênh văn bản';

  @override
  String get guildNavbarTextChannelDescription =>
      'Gửi tin nhắn, ảnh, ảnh GIF và biểu tượng cảm xúc';

  @override
  String get guildNavbarVoiceChannel => 'Kênh thoại';

  @override
  String get guildNavbarVoiceChannelDescription =>
      'Trò chuyện cùng nhau bằng giọng nói, video và chia sẻ màn hình';

  @override
  String get guildNavbarLinkChannel => 'Liên kết Kênh';

  @override
  String get guildNavbarLinkChannelDescription =>
      'Truy cập nhanh vào một trang web hoặc tài nguyên bên ngoài';

  @override
  String get guildNavbarNameLabel => 'Tên';

  @override
  String get guildNavbarNewChannelHint => 'new-channel';

  @override
  String get guildNavbarUrlLabel => 'URL';

  @override
  String get guildNavbarUrlHint => 'https://example.com';

  @override
  String get guildNavbarChannelTypeSelection => 'Chọn loại kênh';

  @override
  String get guildNavbarCreateCategory => 'Tạo danh mục';

  @override
  String get guildNavbarNewCategoryHint => 'Danh mục mới';

  @override
  String guildNavbarInviteFriendsTo(String communityName) {
    return 'Mời bạn bè đến $communityName';
  }

  @override
  String guildNavbarInviteRecipientsChannel(String channelName) {
    return 'Người nhận sẽ được đưa đến #$channelName';
  }

  @override
  String get guildNavbarSearchFriends => 'Tìm bạn bè';

  @override
  String get guildNavbarNoFriendsYet => 'Chưa có bạn bè nào';

  @override
  String get guildNavbarNoResults => 'Không có kết quả';

  @override
  String get guildNavbarInviteLinkPrompt =>
      'Hoặc, gửi một liên kết mời cho bạn bè:';

  @override
  String get guildNavbarInviteLink => 'Liên kết mời';

  @override
  String get guildNavbarCopy => 'Sao chép';

  @override
  String get guildNavbarCopied => 'Đã sao chép!';

  @override
  String get guildNavbarInviteExpiresSevenDays =>
      'Liên kết mời của bạn sẽ hết hạn sau 7 ngày.';

  @override
  String get guildNavbarInviteNeverExpires =>
      'Liên kết mời này sẽ không bao giờ hết hạn.';

  @override
  String guildNavbarInviteExpiresIn(String duration) {
    return 'Liên kết mời của bạn sẽ hết hạn sau $duration.';
  }

  @override
  String get guildNavbarEditInviteLink => 'Chỉnh sửa liên kết mời';

  @override
  String get guildNavbarInviteLinkSettings => 'Cài đặt liên kết mời';

  @override
  String get guildNavbarExpireAfter => 'Hết hạn sau';

  @override
  String get guildNavbarMaxUses => 'Số lần sử dụng tối đa';

  @override
  String get guildNavbarGrantTemporaryMembership =>
      'Cấp quyền thành viên tạm thời';

  @override
  String get guildNavbarTemporaryMembershipDescription =>
      'Thành viên sẽ bị xóa khi họ ngoại tuyến trừ khi được chỉ định một vai trò';

  @override
  String get guildNavbarCreateNewLink => 'Tạo liên kết mới';

  @override
  String get guildNavbarSent => 'Đã gửi';

  @override
  String get guildNavbarInvite => 'Mời';

  @override
  String get guildNavbarLeaveCommunityTitle => 'Rời khỏi cộng đồng';

  @override
  String get guildNavbarLeaveCommunityDescription =>
      'Bạn có chắc chắn muốn rời khỏi cộng đồng này không? Bạn sẽ không còn có thể xem bất kỳ tin nhắn nào nữa.';

  @override
  String get guildNavbarLeaveCommunityConfirm => 'Rời khỏi cộng đồng';

  @override
  String get guildNavbarDeleteMyMessagesTitle =>
      'Xóa tin nhắn của bạn trong cộng đồng này?';

  @override
  String get guildNavbarDeleteMyMessagesDescription =>
      'Xóa vĩnh viễn mọi tin nhắn bạn đã gửi ở đây, trên mọi kênh. Không thể hoàn tác.';

  @override
  String get guildNavbarDeleteMyMessagesConfirm => 'Xóa tin nhắn của tôi';

  @override
  String get guildNavbarDeletedYourMessages => 'Đã xóa tin nhắn của bạn';

  @override
  String get guildNavbarCouldNotDeleteYourMessages =>
      'Không thể xóa tin nhắn của bạn';

  @override
  String get guildNavbarRemoveOverride => 'Xóa ghi đè';

  @override
  String guildNavbarMutedUntil(String formattedDate) {
    return 'Tắt tiếng cho đến $formattedDate';
  }

  @override
  String guildNavbarStaffOnlyAccessible(String productName) {
    return 'Chỉ dành cho nhân viên $productName';
  }

  @override
  String get guildNavbarInvitesPaused =>
      'Lời mời hiện đang bị tạm dừng trong cộng đồng này';

  @override
  String get guildNavbarDurationNever => 'không bao giờ';

  @override
  String get guildNavbarDuration30Minutes => '30 phút';

  @override
  String get guildNavbarDuration1Hour => '1 giờ';

  @override
  String get guildNavbarDuration6Hours => '6 giờ';

  @override
  String get guildNavbarDuration12Hours => '12 giờ';

  @override
  String get guildNavbarDuration1Day => '1 ngày';

  @override
  String get guildNavbarDuration7Days => '7 ngày';

  @override
  String guildNavbarDurationSeconds(int count) {
    return '$count giây';
  }

  @override
  String get guildNavbarNever => 'Không bao giờ';

  @override
  String get guildNavbarNoLimit => 'Không giới hạn';

  @override
  String get guildNavbarOneUse => '1 lượt dùng';

  @override
  String guildNavbarUses(int count) {
    return '$count lượt sử dụng';
  }

  @override
  String get guildMenuMarkAsRead => 'Đánh dấu là đã đọc';

  @override
  String get guildPeekMoreOptions => 'Thêm tùy chọn';

  @override
  String get guildMenuInviteMembers => 'Mời thành viên';

  @override
  String get guildMenuCommunitySettings => 'Cài đặt cộng đồng';

  @override
  String get guildMenuEditCommunityProfile => 'Chỉnh sửa hồ sơ cộng đồng';

  @override
  String get guildMenuUnmuteCommunity => 'Bỏ tắt tiếng cộng đồng';

  @override
  String get guildMenuMuteCommunity => 'Tắt tiếng cộng đồng';

  @override
  String get guildMenuHideMutedChannels => 'Ẩn kênh đã tắt tiếng';

  @override
  String get guildMenuReportCommunity => 'Báo cáo cộng đồng';

  @override
  String get guildMenuDebugCommunity => 'Gỡ lỗi cộng đồng';

  @override
  String get guildMenuCopyCommunityId => 'Sao chép ID cộng đồng';

  @override
  String guildMenuMutedUntil(String formattedTime) {
    return 'Cho đến $formattedTime';
  }

  @override
  String get guildMenuSettingsGeneral => 'Chung';

  @override
  String get guildMenuSettingsRoles => 'Vai trò & Quyền hạn';

  @override
  String get guildMenuSettingsEmoji => 'Biểu tượng cảm xúc';

  @override
  String get guildMenuSettingsStickers => 'Nhãn dán';

  @override
  String get guildMenuSettingsSafetyModeration => 'An toàn & Kiểm duyệt';

  @override
  String get guildMenuSettingsActivityLog => 'Nhật ký hoạt động';

  @override
  String get guildMenuSettingsWebhooks => 'Webhook';

  @override
  String get guildMenuSettingsCustomInviteUrl => 'URL mời tùy chỉnh';

  @override
  String get guildMenuSettingsDiscovery => 'Khám phá';

  @override
  String get guildMenuSettingsMembers => 'Thành viên';

  @override
  String get guildMenuSettingsInviteLinks => 'Lời mời';

  @override
  String get guildMenuSettingsBans => 'Đã cấm';

  @override
  String get guildMenuSettingsChannels => 'Kênh';

  @override
  String get guildSettingsNoPermission =>
      'Bạn không có quyền xem tab cài đặt này.';

  @override
  String get guildSettingsOverviewIconTitle => 'Biểu tượng';

  @override
  String get guildSettingsUploadImage => 'Tải ảnh lên';

  @override
  String get guildSettingsOverviewBannerTitle => 'Ảnh bìa';

  @override
  String get guildSettingsOverviewBannerHint =>
      'Tải lên ảnh bìa cho máy chủ của bạn.';

  @override
  String get guildSettingsOverviewNameTitle => 'Tên';

  @override
  String get guildSettingsOverviewNameHint => 'Cộng đồng tuyệt vời của tôi';

  @override
  String get guildSettingsOverviewStatsTitle => 'Thống kê';

  @override
  String get guildSettingsOverviewMembers => 'Thành viên';

  @override
  String get guildSettingsOverviewOnline => 'Đang hoạt động';

  @override
  String get guildSettingsRolesDescription =>
      'Sử dụng vai trò để nhóm thành viên và cấp quyền.';

  @override
  String get guildSettingsCreateRole => 'Tạo vai trò';

  @override
  String get guildSettingsRolesListTitle => 'Vai trò';

  @override
  String get guildSettingsRolesNewRole => 'Vai trò mới';

  @override
  String get guildSettingsRolesDeleteRole => 'Xóa vai trò';

  @override
  String get guildSettingsRolesBackToRoles => 'Quay lại vai trò';

  @override
  String get guildSettingsBackToSettings => 'Quay lại cài đặt';

  @override
  String guildSettingsRolesEditTitle(String name) {
    return 'Chỉnh sửa \"$name\"';
  }

  @override
  String get guildSettingsRolesEditSubtitle =>
      'Cấu hình cài đặt và quyền của vai trò';

  @override
  String get guildSettingsRolesDisplaySection => 'Hiển thị';

  @override
  String get guildSettingsRolesRoleName => 'Tên vai trò';

  @override
  String get guildSettingsRolesRoleColor => 'Màu vai trò';

  @override
  String get guildSettingsRolesRoleColorHelper =>
      'Nhập màu (hệ thập lục phân, rgb(), hsl() hoặc tên) hoặc dùng công cụ chọn màu.';

  @override
  String get guildSettingsRolesShowSeparately =>
      'Hiển thị vai trò này riêng biệt';

  @override
  String get guildSettingsRolesShowSeparatelyHelper =>
      'Liệt kê các thành viên có vai trò này trong mục riêng của họ trong danh sách thành viên.';

  @override
  String get guildSettingsRolesAllowMentions => 'Cho phép nhắc đến vai trò này';

  @override
  String guildSettingsRolesAllowMentionsHelper(String permission) {
    return 'Thành viên có quyền \"$permission\" luôn có thể đề cập đến vai trò, bất kể cài đặt này.';
  }

  @override
  String get guildSettingsRolesClearPermissionsHelp =>
      'Dùng nút này để nhanh chóng xóa tất cả quyền.';

  @override
  String get guildSettingsRolesClearPermissions => 'Xóa quyền';

  @override
  String get guildSettingsRolesPermissionsSection => 'Quyền';

  @override
  String get guildSettingsRolesSearchPermissions => 'Tìm quyền';

  @override
  String get guildSettingsRolesDenseLayout => 'Bố cục gọn gàng';

  @override
  String get guildSettingsRolesComfyLayout => 'Bố cục thoải mái';

  @override
  String get guildSettingsRolesSwitchToDenseLayout =>
      'Chuyển sang bố cục gọn gàng';

  @override
  String get guildSettingsRolesSwitchToComfyLayout =>
      'Chuyển sang bố cục thoải mái';

  @override
  String get guildSettingsRolesSingleColumn => 'Một cột';

  @override
  String get guildSettingsRolesTwoColumns => 'Hai cột';

  @override
  String get guildSettingsRolesSwitchToSingleColumn => 'Chuyển sang một cột';

  @override
  String get guildSettingsRolesSwitchToTwoColumns =>
      'Chuyển sang chế độ hai cột';

  @override
  String get guildSettingsRolesNoPermissionsFound => 'Không tìm thấy quyền nào';

  @override
  String get guildSettingsRolesCustomHoistOrder => 'Thứ tự hiển thị tùy chỉnh';

  @override
  String get guildSettingsRolesHoistOrder => 'Thứ tự hiển thị';

  @override
  String get guildSettingsRolesResetHoistOrder => 'Đặt lại mặc định';

  @override
  String get guildSettingsRolesHoistOrderHelp =>
      'Kéo các vai trò để tùy chỉnh thứ tự hiển thị trong danh sách thành viên.';

  @override
  String get guildSettingsRolesNoHoistedRoles =>
      'Không có vai trò nổi bật. Bật \"Hiển thị vai trò này riêng biệt\" cho một vai trò để xem ở đây.';

  @override
  String get guildSettingsRolesLockedTooltip =>
      'Bạn không thể chỉnh sửa vai trò này vì đây là vai trò cao nhất của bạn hoặc cao hơn vai trò của bạn';

  @override
  String guildSettingsRolesNeedManageRolesPermission(String permission) {
    return 'Bạn cần quyền \"$permission\" để chỉnh sửa các quyền này';
  }

  @override
  String get guildSettingsRolesCannotEditHigherRole =>
      'Bạn không thể chỉnh sửa vai trò ngang hoặc cao hơn vai trò cao nhất của mình';

  @override
  String get guildSettingsRolesCannotGrantPermission =>
      'Bạn không thể cấp quyền mà mình không có';

  @override
  String get guildSettingsRolesCannotRemoveOwnPermission =>
      'Bạn không thể xóa quyền này vì nó sẽ xóa quyền của chính bạn';

  @override
  String get guildSettingsRolesUpdatedSuccess =>
      'Đã cập nhật vai trò thành công';

  @override
  String get guildSettingsRolesCreatedSuccess => 'Đã tạo vai trò thành công';

  @override
  String get guildSettingsRolesDeletedSuccess => 'Đã xoá vai trò thành công';

  @override
  String get guildSettingsRolesHoistResetSuccess =>
      'Đã đặt lại thứ tự hiển thị về mặc định';

  @override
  String get guildSettingsRolesNameRequiredTitle => 'Tên vai trò là bắt buộc';

  @override
  String get guildSettingsRolesNameRequiredBody =>
      'Đặt tên cho vai trò trước khi lưu.';

  @override
  String get guildSettingsRolesCreateFailedTitle => 'Không thể tạo vai trò';

  @override
  String get guildSettingsRolesUpdateFailedTitle =>
      'Không thể cập nhật vai trò';

  @override
  String get guildSettingsRolesDeleteFailedTitle => 'Không thể xóa vai trò';

  @override
  String guildSettingsRolesDeleteFailedBody(String name) {
    return '\"$name\" không thể xóa. Thử lại.';
  }

  @override
  String get guildSettingsRolesResetHoistFailedTitle =>
      'Không thể đặt lại thứ tự ưu tiên';

  @override
  String get guildSettingsRolesTryAgainInAMoment => 'Thử lại sau giây lát.';

  @override
  String guildSettingsRolesDeleteConfirm(String name) {
    return 'Bạn có chắc chắn muốn xóa vai trò $name không? Bất kỳ thành viên nào có vai trò này sẽ không còn giữ nó nữa.';
  }

  @override
  String get permissionCategoryCommunityWide => 'Toàn cộng đồng';

  @override
  String get permissionCategoryMessagesMedia => 'Tin nhắn & phương tiện';

  @override
  String get permissionCategoryModeration => 'Kiểm duyệt';

  @override
  String get permissionCategoryChannelAccess => 'Quyền truy cập kênh';

  @override
  String get permissionCategoryChannelManagement => 'Quản lý kênh';

  @override
  String get permissionCategoryAudioVideo => 'Âm thanh & video';

  @override
  String get permissionUnknown => 'Quyền không xác định';

  @override
  String get permissionAdministrator => 'Quản trị viên';

  @override
  String get permissionAdministratorDescription =>
      'Cấp tất cả quyền và bỏ qua các hạn chế kênh. Rất nhạy cảm.';

  @override
  String get permissionViewActivityLog => 'Xem nhật ký hoạt động';

  @override
  String get permissionViewActivityLogDescription =>
      'Đọc nhật ký hoạt động của cộng đồng về các thay đổi và hành động kiểm duyệt.';

  @override
  String get permissionManageCommunity => 'Quản lý cộng đồng';

  @override
  String get permissionManageCommunityDescription =>
      'Chỉnh sửa cài đặt chung như tên, mô tả và biểu tượng.';

  @override
  String get permissionManageRoles => 'Quản lý vai trò';

  @override
  String get permissionManageRolesDescription =>
      'Tạo, chỉnh sửa hoặc xóa các vai trò dưới vai trò cao nhất của bạn. Cũng cho phép chỉnh sửa quyền ghi đè kênh.';

  @override
  String get permissionManageChannels => 'Quản lý kênh';

  @override
  String get permissionManageChannel => 'Quản lý kênh';

  @override
  String get permissionManageChannelDescription =>
      'Đổi tên và chỉnh sửa cài đặt kênh này.';

  @override
  String get permissionManagePermissions => 'Quản lý quyền';

  @override
  String get permissionManagePermissionsDescription =>
      'Chỉnh sửa quyền của vai trò và thành viên trong kênh này.';

  @override
  String get permissionManageWebhooksChannelDescription =>
      'Tạo, chỉnh sửa hoặc xoá webhook cho kênh này.';

  @override
  String get permissionViewChannelMembersChannelDescription =>
      'Xem danh sách thành viên của kênh này.';

  @override
  String get permissionCreateInviteLinksChannelDescription =>
      'Quản lý các liên kết mời cho kênh này.';

  @override
  String get permissionOverwriteDeny => 'Từ chối';

  @override
  String get permissionOverwriteInherit => 'Trung lập (kế thừa)';

  @override
  String get permissionOverwriteAllow => 'Cho phép';

  @override
  String get permissionOverwriteSetAllHelp =>
      'Dùng các nút này để nhanh chóng đặt tất cả quyền.';

  @override
  String get permissionManageChannelsDescription =>
      'Tạo, chỉnh sửa hoặc xoá kênh và danh mục.';

  @override
  String get permissionKickMembers => 'Đuổi thành viên';

  @override
  String get permissionBanMembers => 'Cấm thành viên';

  @override
  String get permissionCreateInviteLinks => 'Tạo liên kết mời';

  @override
  String get permissionChangeOwnNickname => 'Thay đổi biệt danh của chính mình';

  @override
  String get permissionChangeOwnNicknameDescription =>
      'Cập nhật biệt danh của bạn.';

  @override
  String get permissionManageNicknames => 'Quản lý biệt danh';

  @override
  String get permissionManageNicknamesDescription =>
      'Đổi biệt danh của thành viên khác.';

  @override
  String get permissionCreateEmojiStickers =>
      'Tạo biểu tượng cảm xúc và nhãn dán';

  @override
  String get permissionCreateEmojiStickersDescription =>
      'Tải lên biểu tượng cảm xúc và nhãn dán mới, đồng thời quản lý các nội dung bạn đã tạo.';

  @override
  String get permissionManageEmojiStickers =>
      'Quản lý biểu tượng cảm xúc và nhãn dán';

  @override
  String get permissionManageEmojiStickersDescription =>
      'Chỉnh sửa hoặc xóa biểu tượng cảm xúc và nhãn dán do thành viên khác tạo.';

  @override
  String get permissionManageWebhooks => 'Quản lý webhook';

  @override
  String get permissionManageWebhooksDescription =>
      'Tạo, chỉnh sửa hoặc xoá webhook.';

  @override
  String get permissionSendMessages => 'Gửi tin nhắn';

  @override
  String get permissionSendTtsMessages => 'Gửi tin nhắn TTS';

  @override
  String get permissionSendTtsMessagesDescription =>
      'Gửi tin nhắn đọc thành tiếng.';

  @override
  String get permissionManageMessages => 'Quản lý tin nhắn';

  @override
  String get permissionManageMessagesDescription =>
      'Xóa tin nhắn của thành viên khác. Ghim tin nhắn được kiểm soát riêng.';

  @override
  String get permissionPinMessages => 'Ghim tin nhắn';

  @override
  String get permissionEmbedLinks => 'Nhúng liên kết';

  @override
  String get permissionAttachFiles => 'Đính kèm tệp';

  @override
  String get permissionMentionEveryone => 'Sử dụng @everyone/@here và @vai trò';

  @override
  String get permissionMentionEveryoneDescription =>
      'Đề cập tất cả mọi người hoặc bất kỳ vai trò nào (ngay cả khi vai trò đó không được đặt là có thể đề cập).';

  @override
  String get permissionUseExternalEmoji =>
      'Sử dụng biểu tượng cảm xúc bên ngoài';

  @override
  String get permissionUseExternalEmojiDescription =>
      'Dùng biểu tượng cảm xúc từ các cộng đồng khác.';

  @override
  String get permissionUseExternalStickers => 'Dùng nhãn dán bên ngoài';

  @override
  String get permissionAddReactions => 'Thêm cảm xúc';

  @override
  String get permissionAddReactionsDescription =>
      'Thêm cảm xúc mới vào tin nhắn.';

  @override
  String get permissionBypassSlowmode => 'Bỏ qua chế độ chậm';

  @override
  String get permissionBypassSlowmodeDescription =>
      'Bỏ qua giới hạn tốc độ gửi tin nhắn cho từng kênh.';

  @override
  String get permissionTimeOutMembers => 'Tạm dừng thành viên';

  @override
  String get permissionTimeOutMembersDescription =>
      'Ngăn thành viên gửi tin nhắn, bày tỏ cảm xúc và tham gia cuộc gọi thoại trong một khoảng thời gian.';

  @override
  String get permissionViewChannel => 'Xem kênh';

  @override
  String get permissionViewChannelMembers => 'Xem thành viên kênh';

  @override
  String get permissionViewChannelMembersDescription =>
      'Xem danh sách thành viên của các kênh trong cộng đồng này.';

  @override
  String get permissionConnect => 'Kết nối';

  @override
  String get permissionSpeak => 'Nói';

  @override
  String get permissionStreamVideo => 'Truyền phát video';

  @override
  String get permissionUseVoiceActivity =>
      'Sử dụng tính năng kích hoạt bằng giọng nói';

  @override
  String get permissionUseVoiceActivityDescription =>
      'Nếu không có quyền này, bạn phải dùng chế độ nhấn để nói.';

  @override
  String get permissionPrioritySpeaker => 'Người nói ưu tiên';

  @override
  String get permissionMuteMembers => 'Tắt tiếng thành viên';

  @override
  String get permissionDeafenMembers => 'Tắt tiếng thành viên';

  @override
  String get permissionMoveMembers => 'Di chuyển thành viên';

  @override
  String get permissionMoveMembersDescription =>
      'Kéo thành viên giữa các kênh mà họ có thể truy cập.';

  @override
  String get permissionSetVoiceRegion => 'Đặt vùng thoại';

  @override
  String guildSettingsEmojiSlotInfo(int staticCount, int animatedCount) {
    return '$staticCount biểu tượng cảm xúc tĩnh, $animatedCount biểu tượng cảm xúc động đã sử dụng';
  }

  @override
  String get guildSettingsEmojiEmpty =>
      'Chưa có biểu tượng cảm xúc tùy chỉnh nào.';

  @override
  String guildSettingsStickersSlotInfo(int count) {
    return '$count sticker đã tải lên';
  }

  @override
  String get guildSettingsStickersEmpty => 'Chưa có nhãn dán tùy chỉnh nào.';

  @override
  String get guildSettingsModerationVerificationTitle => 'Xác minh thành viên';

  @override
  String get guildSettingsModerationVerificationDescription =>
      'Chọn những gì thành viên phải có trước khi họ có thể đăng bài hoặc nhắn tin trực tiếp cho thành viên cộng đồng.';

  @override
  String get guildSettingsModerationVerificationRolesBypass =>
      'Thành viên có vai trò có thể bỏ qua các kiểm tra này. Đối với không gian công cộng, chúng tôi khuyên bạn nên bật xác minh.';

  @override
  String get guildSettingsModerationVerificationDiscoveryNote =>
      'Các cộng đồng hiển thị trong Khám phá yêu cầu phải có ít nhất email đã xác minh. Không thể chọn \"Không có\" khi Khám phá được bật.';

  @override
  String get guildSettingsModerationMatureTitle =>
      'Nội dung nhạy cảm & cảnh báo nội dung';

  @override
  String get guildSettingsModerationMatureSectionDescription =>
      'Cấu hình nhãn nội dung nhạy cảm và cảnh báo nội dung tùy chọn cho thành viên.';

  @override
  String get guildSettingsModerationMatureToggle => 'Nội dung nhạy cảm';

  @override
  String get guildSettingsModerationMatureToggleDescription =>
      'Đánh dấu cộng đồng này là có nội dung người lớn.';

  @override
  String get guildSettingsVerificationNone => 'Không';

  @override
  String get guildSettingsVerificationNoneDescription =>
      'Không yêu cầu xác minh.';

  @override
  String get guildSettingsVerificationLow => 'Thấp';

  @override
  String get guildSettingsVerificationLowDescription =>
      'Yêu cầu địa chỉ email đã xác minh.';

  @override
  String get guildSettingsVerificationMedium => 'Trung bình';

  @override
  String get guildSettingsVerificationMediumDescription =>
      'Yêu cầu địa chỉ email đã xác minh và tài khoản đã tạo ít nhất 5 phút.';

  @override
  String get guildSettingsVerificationHigh => 'Cao';

  @override
  String get guildSettingsVerificationHighDescription =>
      'Yêu cầu tất cả các mục trong mức trung bình, cộng với việc là thành viên của cộng đồng trong ít nhất 10 phút.';

  @override
  String get guildSettingsVerificationHighest => 'Rất cao';

  @override
  String get guildSettingsVerificationHighestDescription =>
      'Yêu cầu số điện thoại đã được xác minh.';

  @override
  String get guildSettingsAuditLogDescription =>
      'Theo dõi hành động của người kiểm duyệt trong cộng đồng.';

  @override
  String get guildSettingsAuditLogEmpty => 'Chưa có nhật ký';

  @override
  String get guildSettingsAuditLogEmptyDescription =>
      'Các hành động kiểm duyệt và thay đổi cộng đồng sẽ hiển thị ở đây.';

  @override
  String get guildSettingsAuditLogFilterAllUsers => 'Tất cả người dùng';

  @override
  String get guildSettingsAuditLogFilterAllActions => 'Tất cả hành động';

  @override
  String get guildSettingsAuditLogNoReason =>
      'Không có lý do nào được cung cấp.';

  @override
  String get guildSettingsAuditLogUnknownUser => 'Người dùng không xác định';

  @override
  String get guildSettingsAuditLogLoadError =>
      'Đã xảy ra lỗi khi tải nhật ký hoạt động.';

  @override
  String get guildSettingsAuditLogLoadErrorTitle =>
      'Không thể tải nhật ký hoạt động';

  @override
  String get guildSettingsAuditLogReason => 'Lý do';

  @override
  String get guildSettingsAuditLogSomeone => 'ai đó';

  @override
  String get guildSettingsAuditLogSomething => 'gì đó';

  @override
  String get guildSettingsAuditLogUnknownEntity => 'thực thể không xác định';

  @override
  String get guildSettingsAuditLogNothing => 'Không có gì';

  @override
  String get guildSettingsAuditLogUnknownTarget => 'Mục tiêu không xác định';

  @override
  String get auditLogActionGuildUpdate => 'Cộng đồng đã cập nhật';

  @override
  String get auditLogActionChannelCreate => 'Đã tạo kênh';

  @override
  String get auditLogActionChannelUpdate => 'Đã cập nhật kênh';

  @override
  String get auditLogActionChannelDelete => 'Đã xoá kênh';

  @override
  String get auditLogActionChannelOverwriteCreate =>
      'Đã thêm quyền ghi đè kênh';

  @override
  String get auditLogActionChannelOverwriteUpdate => 'Đã cập nhật quyền kênh';

  @override
  String get auditLogActionChannelOverwriteDelete => 'Đã xóa quyền ghi đè kênh';

  @override
  String get auditLogActionMemberKick => 'Đã kick thành viên';

  @override
  String get auditLogActionMemberPrune => 'Đã xoá thành viên không hoạt động';

  @override
  String get auditLogActionMemberBanAdd => 'Đã cấm thành viên';

  @override
  String get auditLogActionMemberBanRemove => 'Đã bỏ chặn thành viên';

  @override
  String get auditLogActionMemberUpdate => 'Đã cập nhật thành viên';

  @override
  String get auditLogActionMemberRoleUpdate => 'Đã cập nhật vai trò thành viên';

  @override
  String get auditLogActionMemberMove => 'Thành viên đã được chuyển';

  @override
  String get auditLogActionMemberDisconnect => 'Thành viên đã ngắt kết nối';

  @override
  String get auditLogActionBotAdd => 'Đã thêm bot';

  @override
  String get auditLogActionRoleCreate => 'Đã tạo vai trò';

  @override
  String get auditLogActionRoleUpdate => 'Đã cập nhật vai trò';

  @override
  String get auditLogActionRoleDelete => 'Đã xóa vai trò';

  @override
  String get auditLogActionInviteCreate => 'Đã tạo lời mời';

  @override
  String get auditLogActionInviteUpdate => 'Đã cập nhật lời mời';

  @override
  String get auditLogActionInviteDelete => 'Đã xóa lời mời';

  @override
  String get auditLogActionWebhookCreate => 'Đã tạo webhook';

  @override
  String get auditLogActionWebhookUpdate => 'Webhook đã cập nhật';

  @override
  String get auditLogActionWebhookDelete => 'Webhook đã bị xóa';

  @override
  String get auditLogActionEmojiCreate => 'Biểu tượng cảm xúc đã tạo';

  @override
  String get auditLogActionEmojiUpdate => 'Biểu tượng cảm xúc đã cập nhật';

  @override
  String get auditLogActionEmojiDelete => 'Đã xóa biểu tượng cảm xúc';

  @override
  String get auditLogActionStickerCreate => 'Đã tạo nhãn dán';

  @override
  String get auditLogActionStickerUpdate => 'Đã cập nhật nhãn dán';

  @override
  String get auditLogActionStickerDelete => 'Đã xóa nhãn dán';

  @override
  String get auditLogActionMessageDelete => 'Đã xóa tin nhắn';

  @override
  String get auditLogActionMessageBulkDelete => 'Tin nhắn đã xóa';

  @override
  String get auditLogActionMessagePin => 'Tin nhắn đã ghim';

  @override
  String get auditLogActionMessageUnpin => 'Đã bỏ ghim tin nhắn';

  @override
  String auditLogSummaryGuildUpdate(String actor) {
    return '$actor đã cập nhật cài đặt cộng đồng.';
  }

  @override
  String auditLogSummaryChannelCreate(String actor, String target) {
    return '$actor đã tạo kênh $target.';
  }

  @override
  String auditLogSummaryChannelUpdate(String actor, String target) {
    return '$actor đã cập nhật kênh $target.';
  }

  @override
  String auditLogSummaryChannelDelete(String actor, String target) {
    return '$actor đã xóa kênh $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreate(String actor, String target) {
    return '$actor đã thêm quyền cho kênh của $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteCreateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor đã thêm quyền kênh cho $target trong $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdate(String actor, String target) {
    return '$actor đã cập nhật quyền của kênh cho $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteUpdateInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor đã cập nhật quyền của kênh cho $target trong $channel.';
  }

  @override
  String auditLogSummaryChannelOverwriteDelete(String actor, String target) {
    return '$actor đã xóa quyền của kênh cho $target.';
  }

  @override
  String auditLogSummaryChannelOverwriteDeleteInChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor đã xóa quyền của kênh đối với $target trong $channel.';
  }

  @override
  String auditLogSummaryMemberKick(String actor, String target) {
    return '$actor đã kick $target.';
  }

  @override
  String auditLogSummaryMemberBanAdd(String actor, String target) {
    return '$actor đã cấm $target.';
  }

  @override
  String auditLogSummaryMemberBanRemove(String actor, String target) {
    return '$actor đã bỏ cấm $target.';
  }

  @override
  String auditLogSummaryMemberUpdate(String actor, String target) {
    return '$actor đã cập nhật $target.';
  }

  @override
  String auditLogSummaryMemberRoleUpdate(String actor, String target) {
    return '$actor đã cập nhật vai trò cho $target.';
  }

  @override
  String auditLogSummaryMemberPrune(String actor) {
    return '$actor đã xóa thành viên không hoạt động.';
  }

  @override
  String auditLogSummaryMemberPruneDays(String actor, int days) {
    return '$actor đã xóa thành viên không hoạt động trong $days ngày.';
  }

  @override
  String auditLogSummaryMemberMove(String actor, String target) {
    return '$actor đã chuyển $target sang kênh thoại khác.';
  }

  @override
  String auditLogSummaryMemberMoveToChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor đã chuyển $target sang $channel.';
  }

  @override
  String auditLogSummaryMemberDisconnect(String actor, String target) {
    return '$actor đã ngắt kết nối $target khỏi giọng nói.';
  }

  @override
  String auditLogSummaryBotAdd(String actor, String target) {
    return '$actor đã thêm bot $target.';
  }

  @override
  String auditLogSummaryRoleCreate(String actor, String target) {
    return '$actor đã tạo vai trò $target.';
  }

  @override
  String auditLogSummaryRoleUpdate(String actor, String target) {
    return '$actor đã cập nhật vai trò của $target.';
  }

  @override
  String auditLogSummaryRoleDelete(String actor, String target) {
    return '$actor đã xóa vai trò $target.';
  }

  @override
  String auditLogSummaryInviteCreate(String actor, String target) {
    return '$actor đã tạo lời mời $target.';
  }

  @override
  String auditLogSummaryInviteCreateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor đã tạo lời mời $target cho $channel.';
  }

  @override
  String auditLogSummaryInviteUpdate(String actor, String target) {
    return '$actor đã cập nhật lời mời $target.';
  }

  @override
  String auditLogSummaryInviteUpdateForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor đã cập nhật lời mời $target cho $channel.';
  }

  @override
  String auditLogSummaryInviteDelete(String actor, String target) {
    return '$actor đã xóa lời mời $target.';
  }

  @override
  String auditLogSummaryInviteDeleteForChannel(
    String actor,
    String target,
    String channel,
  ) {
    return '$actor đã xóa lời mời $target cho $channel.';
  }

  @override
  String auditLogSummaryWebhookCreate(String actor, String target) {
    return '$actor đã tạo webhook $target.';
  }

  @override
  String auditLogSummaryWebhookUpdate(String actor, String target) {
    return '$actor đã cập nhật webhook $target.';
  }

  @override
  String auditLogSummaryWebhookDelete(String actor, String target) {
    return '$actor đã xóa webhook $target.';
  }

  @override
  String auditLogSummaryEmojiCreate(String actor, String target) {
    return '$actor đã thêm biểu tượng cảm xúc $target.';
  }

  @override
  String auditLogSummaryEmojiUpdate(String actor, String target) {
    return '$actor đã cập nhật biểu tượng cảm xúc $target.';
  }

  @override
  String auditLogSummaryEmojiDelete(String actor, String target) {
    return '$actor đã xóa biểu tượng cảm xúc $target.';
  }

  @override
  String auditLogSummaryStickerCreate(String actor, String target) {
    return '$actor đã thêm nhãn dán $target.';
  }

  @override
  String auditLogSummaryStickerUpdate(String actor, String target) {
    return '$actor đã cập nhật sticker $target.';
  }

  @override
  String auditLogSummaryStickerDelete(String actor, String target) {
    return '$actor đã xóa sticker $target.';
  }

  @override
  String auditLogSummaryMessageDelete(String actor) {
    return '$actor đã xóa một tin nhắn.';
  }

  @override
  String auditLogSummaryMessageDeleteInChannel(String actor, String channel) {
    return '$actor đã xóa một tin nhắn trong $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDelete(String actor) {
    return '$actor đã xóa nhiều tin nhắn.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCount(String actor, int count) {
    return '$actor đã xóa $count tin nhắn.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteInChannel(
    String actor,
    String channel,
  ) {
    return '$actor đã xóa nhiều tin nhắn trong $channel.';
  }

  @override
  String auditLogSummaryMessageBulkDeleteCountInChannel(
    String actor,
    int count,
    String channel,
  ) {
    return '$actor đã xóa $count tin nhắn trong $channel.';
  }

  @override
  String auditLogSummaryMessagePin(String actor) {
    return '$actor đã ghim một tin nhắn.';
  }

  @override
  String auditLogSummaryMessagePinInChannel(String actor, String channel) {
    return '$actor đã ghim một tin nhắn trong $channel.';
  }

  @override
  String auditLogSummaryMessageUnpin(String actor) {
    return '$actor đã bỏ ghim một tin nhắn.';
  }

  @override
  String auditLogSummaryMessageUnpinInChannel(String actor, String channel) {
    return '$actor đã bỏ ghim một tin nhắn trong $channel.';
  }

  @override
  String auditLogSummaryDefault(String actor, String target) {
    return '$actor đã thực hiện hành động kiểm toán trên $target.';
  }

  @override
  String auditLogChangeUpdatedFromTo(
    String field,
    String oldValue,
    String newValue,
  ) {
    return 'Đã cập nhật $field từ $oldValue thành $newValue.';
  }

  @override
  String auditLogChangeSetTo(String field, String newValue) {
    return 'Đặt $field thành $newValue.';
  }

  @override
  String auditLogChangeCleared(String field, String oldValue) {
    return 'Đã xóa $field (trước đó là $oldValue).';
  }

  @override
  String auditLogChangeUpdated(String field) {
    return 'Đã cập nhật $field.';
  }

  @override
  String auditLogChangeRenamedCommunity(String name) {
    return 'Đã đổi tên cộng đồng thành $name.';
  }

  @override
  String get auditLogChangeUpdatedCommunityIcon =>
      'Đã cập nhật biểu tượng cộng đồng.';

  @override
  String auditLogChangeRenamedChannel(String name) {
    return 'Đã đổi tên kênh thành $name.';
  }

  @override
  String get auditLogChangeClearedTopic => 'Đã xoá chủ đề.';

  @override
  String auditLogChangeUpdatedTopic(String topic) {
    return 'Đã cập nhật chủ đề thành $topic.';
  }

  @override
  String get auditLogChangeEnabledMatureContent => 'Đã bật nội dung nhạy cảm.';

  @override
  String get auditLogChangeDisabledMatureContent => 'Đã tắt nội dung nhạy cảm.';

  @override
  String auditLogChangeSetNickname(String nickname) {
    return 'Đặt biệt danh thành $nickname.';
  }

  @override
  String auditLogChangeRemovedNickname(String nickname) {
    return 'Đã xóa biệt danh $nickname.';
  }

  @override
  String get auditLogChangeMutedMember => 'Đã tắt tiếng thành viên.';

  @override
  String get auditLogChangeUnmutedMember => 'Đã bỏ chặn thành viên.';

  @override
  String get auditLogChangeDeafenedMember => 'Đã tắt tiếng thành viên.';

  @override
  String get auditLogChangeUndeafenedMember => 'Bỏ chặn thành viên.';

  @override
  String auditLogChangeAddedRoles(String roles) {
    return 'Đã thêm $roles.';
  }

  @override
  String auditLogChangeRemovedRoles(String roles) {
    return 'Đã xóa $roles.';
  }

  @override
  String auditLogOptionChannel(String value) {
    return 'Kênh: $value.';
  }

  @override
  String auditLogOptionMessage(String value) {
    return 'Tin nhắn: $value.';
  }

  @override
  String auditLogOptionInvitedBy(String value) {
    return 'Được mời bởi $value.';
  }

  @override
  String auditLogOptionDeletedMessages(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# tin nhắn.',
      one: '# tin nhắn.',
    );
    return 'Đã xóa $_temp0';
  }

  @override
  String auditLogOptionRemovedMembers(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Đã xóa # thành viên.',
      one: 'Đã xóa # thành viên.',
    );
    return '$_temp0';
  }

  @override
  String get auditLogOptionInviteNeverExpires =>
      'Lời mời này không bao giờ hết hạn.';

  @override
  String get auditLogOptionTemporaryMembership =>
      'Cấp quyền thành viên tạm thời.';

  @override
  String get auditLogOptionPermanentMembership =>
      'Cấp quyền thành viên vĩnh viễn.';

  @override
  String get guildSettingsLoadMore => 'Tải thêm';

  @override
  String get guildSettingsLoadingMore => 'Đang tải...';

  @override
  String get guildSettingsWebhooksDescription =>
      'Xem và quản lý tất cả webhook đã định cấu hình trong cộng đồng của bạn.';

  @override
  String get guildSettingsWebhooksEmpty => 'Không có webhook nào';

  @override
  String guildSettingsWebhooksEmptyDescription(String channelSettingsPath) {
    return 'Cộng đồng này chưa có webhook nào. Hãy truy cập $channelSettingsPath để tạo một webhook.';
  }

  @override
  String guildSettingsWebhooksPermissionRequired(String permission) {
    return 'Bạn cần quyền \"$permission\" để xem và chỉnh sửa webhook cho cộng đồng này.';
  }

  @override
  String get guildSettingsWebhooksLoadFailedTitle => 'Không tải được webhook';

  @override
  String get guildSettingsWebhooksLoadFailedDescription =>
      'Đã xảy ra lỗi khi tải webhook. Vui lòng thử lại.';

  @override
  String get guildSettingsWebhooksUpdated => 'Đã cập nhật webhook';

  @override
  String get guildSettingsWebhooksUpdateFailed =>
      'Cập nhật webhook không thành công';

  @override
  String get guildSettingsUnknownChannel => 'Kênh không xác định';

  @override
  String get guildSettingsCopyUrl => 'Sao chép URL';

  @override
  String get guildSettingsCopiedUrl => 'Đã sao chép URL vào bộ nhớ tạm';

  @override
  String get guildSettingsDeleteWebhook => 'Xóa webhook';

  @override
  String get guildSettingsVanityUrlDescription =>
      'Đặt một liên kết mời tùy chỉnh cho máy chủ của bạn.';

  @override
  String get guildSettingsVanityUrlHint => 'my-server';

  @override
  String get guildSettingsSave => 'Lưu';

  @override
  String get guildSettingsVanityUrlUsageTitle => 'Cách sử dụng';

  @override
  String guildSettingsVanityUrlUses(int count) {
    return '$count lượt sử dụng';
  }

  @override
  String get guildSettingsDiscoveryDescription =>
      'Liệt kê cộng đồng của bạn trong Khám phá để người khác có thể tìm và tham gia.';

  @override
  String get guildSettingsDiscoveryNotEnoughMembersTitle =>
      'Không đủ thành viên';

  @override
  String guildSettingsDiscoveryNotEligible(int count) {
    return 'Cộng đồng của bạn cần có ít nhất $count thành viên trước khi có thể được liệt kê trong Khám phá.';
  }

  @override
  String get guildSettingsDiscoveryStatusLabel => 'Trạng thái:';

  @override
  String get guildSettingsDiscoveryStatusPending => 'Đang chờ';

  @override
  String get guildSettingsDiscoveryStatusApproved => 'Đã duyệt';

  @override
  String get guildSettingsDiscoveryStatusRejected => 'Đã từ chối';

  @override
  String get guildSettingsDiscoveryStatusRemoved => 'Đã xoá';

  @override
  String guildSettingsDiscoveryReason(String reason) {
    return 'Lý do: $reason';
  }

  @override
  String get guildSettingsDiscoveryApprovedInfo =>
      'Cộng đồng của bạn đã được liệt kê trong Khám phá. Bạn có thể cập nhật thông tin chi tiết bên dưới hoặc rút lại để gỡ bỏ.';

  @override
  String get guildSettingsDiscoveryPendingInfo =>
      'Đơn đăng ký của bạn đang chờ xét duyệt. Bạn vẫn có thể cập nhật chi tiết hoặc rút lại đơn đăng ký.';

  @override
  String get guildSettingsDiscoveryCategory => 'Danh mục';

  @override
  String get guildSettingsDiscoveryCategoryHelp =>
      'Chọn danh mục mô tả đúng nhất về cộng đồng của bạn. Bạn có thể thay đổi bất cứ lúc nào.';

  @override
  String get guildSettingsDiscoveryPrimaryLanguage => 'Ngôn ngữ chính';

  @override
  String get guildSettingsDiscoveryPrimaryLanguageHelp =>
      'Ngôn ngữ mà hầu hết cộng đồng của bạn sử dụng. Dùng để lọc kết quả khám phá.';

  @override
  String get guildSettingsDiscoveryDescriptionField => 'Mô tả';

  @override
  String get guildSettingsDiscoveryDescriptionPlaceholder =>
      'Mô tả về cộng đồng của bạn';

  @override
  String get guildSettingsDiscoveryDescriptionRequired => 'Cần có mô tả.';

  @override
  String guildSettingsDiscoveryDescriptionMinLength(int minLength) {
    return 'Mô tả phải có ít nhất $minLength ký tự.';
  }

  @override
  String guildSettingsDiscoveryDescriptionMaxLength(int maxLength) {
    return 'Mô tả không được dài quá $maxLength ký tự.';
  }

  @override
  String get guildSettingsDiscoveryTags => 'Thẻ tùy chỉnh';

  @override
  String guildSettingsDiscoveryTagsHelp(int maxTags) {
    return 'Tối đa $maxTags thẻ giúp mọi người tìm thấy cộng đồng của bạn. Chúng hiển thị trong tìm kiếm Khám phá.';
  }

  @override
  String get guildSettingsDiscoveryTagsHint => 'Thêm thẻ và nhấn Enter';

  @override
  String get guildSettingsDiscoveryAddTag => 'Thêm';

  @override
  String guildSettingsDiscoveryRemoveTag(String tag) {
    return 'Xóa thẻ $tag';
  }

  @override
  String get guildSettingsDiscoveryTagErrorTitle => 'Không thể thêm thẻ';

  @override
  String guildSettingsDiscoveryTagRequirements(int maxLength) {
    return 'Thẻ phải có từ 2 đến $maxLength ký tự và chỉ chứa chữ cái, số.';
  }

  @override
  String guildSettingsDiscoveryTagLimit(int maxTags) {
    return 'Bạn chỉ có thể thêm tối đa $maxTags thẻ.';
  }

  @override
  String get guildSettingsDiscoveryApply => 'Áp dụng';

  @override
  String get guildSettingsDiscoverySave => 'Lưu';

  @override
  String get guildSettingsDiscoveryWithdraw => 'Rút tiền';

  @override
  String get guildSettingsDiscoveryApplicationSent =>
      'Đã gửi đơn đăng ký khám phá';

  @override
  String get guildSettingsDiscoveryListingUpdated =>
      'Đã cập nhật danh sách khám phá';

  @override
  String get guildSettingsDiscoveryApplicationWithdrawn =>
      'Đã rút đơn đăng ký khám phá';

  @override
  String get guildSettingsDiscoveryWithdrawErrorTitle =>
      'Không thể rút đơn đăng ký';

  @override
  String get guildSettingsDiscoveryWithdrawErrorDescription =>
      'Thử lại sau giây lát.';

  @override
  String get guildSettingsMembersDescription =>
      'Tìm kiếm và quản lý thành viên máy chủ.';

  @override
  String get guildSettingsMembersSearchHint =>
      'Tìm theo tên người dùng hoặc ID';

  @override
  String guildSettingsMembersResultsTitle(int count) {
    return '$count thành viên';
  }

  @override
  String get guildMembersRecentTitle => 'Thành viên gần đây';

  @override
  String guildMembersShowingCount(int displayedCount, int totalCount) {
    return 'Hiển thị $displayedCount trên tổng số $totalCount thành viên';
  }

  @override
  String get guildMembersSort => 'Sắp xếp';

  @override
  String get guildSettingsMembersSortNewest => 'Mới nhất trước';

  @override
  String get guildMembersSortOldest => 'Cũ nhất trước';

  @override
  String get guildMembersColumnName => 'Tên';

  @override
  String get guildMembersColumnMemberSince => 'Thành viên từ';

  @override
  String guildMembersColumnJoinedProduct(String productName) {
    return 'Đã tham gia $productName';
  }

  @override
  String get guildMembersColumnJoinMethod => 'Cách tham gia';

  @override
  String get guildMembersColumnRoles => 'Vai trò';

  @override
  String get guildMembersColumnActions => 'Thao tác';

  @override
  String get guildMembersFilterMemberSince => 'Lọc theo ngày tham gia';

  @override
  String get guildMembersFilterJoinedProduct => 'Lọc theo ngày tạo tài khoản';

  @override
  String get guildMembersFilterJoinMethod => 'Lọc theo cách thức tham gia';

  @override
  String get guildMembersFilterRoles => 'Lọc theo vai trò';

  @override
  String get guildMembersFilterAll => 'Tất cả';

  @override
  String get guildMembersFilterPast1Hour => '1 giờ trước';

  @override
  String get guildMembersFilterPast24Hours => '24 giờ qua';

  @override
  String get guildMembersFilterPast7Days => '7 ngày qua';

  @override
  String get guildMembersFilterPast2Weeks => '2 tuần qua';

  @override
  String get guildMembersFilterPast3Weeks => '3 tuần trước';

  @override
  String get guildMembersFilterPast4Weeks => '4 tuần qua';

  @override
  String get guildMembersFilterPast3Months => '3 tháng qua';

  @override
  String get guildMembersFilterCustomRange => 'Khoảng tùy chỉnh...';

  @override
  String get guildMembersDateRangeTitle => 'Khoảng thời gian tùy chỉnh';

  @override
  String get guildMembersDateAfter => 'Sau ngày';

  @override
  String get guildMembersDateBefore => 'Trước ngày';

  @override
  String get guildMembersClearAll => 'Xóa tất cả';

  @override
  String get guildMembersRowsPerPage => 'Số hàng mỗi trang';

  @override
  String get guildMembersEmptySearch => 'Không có ai khớp với tìm kiếm đó.';

  @override
  String get guildMembersLoadError =>
      'Đã xảy ra lỗi khi tải thành viên. Vui lòng thử lại sau.';

  @override
  String get guildMembersIndexing => 'Đang lập chỉ mục thành viên…';

  @override
  String get guildMembersGoToPage => 'Đi đến trang';

  @override
  String guildMembersGoToPageItem(int page) {
    return 'Đi đến trang $page';
  }

  @override
  String get guildMembersJumpToPage => 'Chuyển đến trang';

  @override
  String get guildMembersJoinSourceCreator => 'Người tạo cộng đồng';

  @override
  String get guildMembersJoinSourceInvite => 'Mời';

  @override
  String guildMembersJoinSourceInviteCode(String code) {
    return 'Mời ($code)';
  }

  @override
  String guildMembersJoinSourceInvitedBy(String name) {
    return 'Được mời bởi $name';
  }

  @override
  String get guildMembersJoinSourceVanityUrl => 'URL tùy chỉnh';

  @override
  String get guildMembersJoinSourceBotInvite => 'Mời bot';

  @override
  String get guildMembersJoinSourcePlatformAdmin => 'Quản trị viên nền tảng';

  @override
  String get guildMembersJoinSourceDiscovery => 'Khám phá';

  @override
  String get guildMembersJoinMethodUnknown => 'Không rõ';

  @override
  String get guildMembersCommunityOwner => 'Chủ sở hữu cộng đồng';

  @override
  String get guildMembersViewAllRoles => 'Xem tất cả vai trò';

  @override
  String get guildMembersJoinedJustNow => 'Vừa xong';

  @override
  String guildMembersJoinedMinutesAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count phút trước',
      one: '1 phút trước',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedHoursAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count giờ trước',
      one: '1 giờ trước',
    );
    return '$_temp0';
  }

  @override
  String guildMembersJoinedDaysAgo(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ngày trước',
      one: '1 ngày trước',
    );
    return '$_temp0';
  }

  @override
  String get guildMembersChannelListLabel => 'Thành viên';

  @override
  String get guildMembersChannelListSelected => 'Đã chọn thành viên';

  @override
  String get guildSettingsInvitesTitle => 'Lời mời';

  @override
  String get guildSettingsInvitesDescription =>
      'Xem tất cả lời mời cho cộng đồng này. Để tạo lời mời mới, hãy vào một kênh và dùng nút mời.';

  @override
  String get guildSettingsInvitesEmpty => 'Không có liên kết mời';

  @override
  String get guildSettingsInvitesEmptyDescription =>
      'Cộng đồng này chưa có liên kết mời nào. Hãy vào một kênh và tạo lời mời để mời mọi người.';

  @override
  String get guildSettingsInvitesLoadFailedTitle => 'Không tải được lời mời';

  @override
  String get guildSettingsInvitesLoadFailedDescription =>
      'Đã xảy ra lỗi khi tải lời mời. Vui lòng thử lại.';

  @override
  String get guildSettingsInvitesTryAgain => 'Thử lại';

  @override
  String get guildSettingsInvitesShowCreatedDate =>
      'Hiển thị ngày tạo thay vì ngày hết hạn';

  @override
  String get guildSettingsInvitesPauseInvites => 'Tạm dừng lời mời';

  @override
  String get guildSettingsInvitesEnableInvites => 'Bật lời mời';

  @override
  String get guildSettingsInvitesPauseForCommunityTitle =>
      'Tạm dừng lời mời cho cộng đồng này';

  @override
  String get guildSettingsInvitesEnableForCommunityTitle =>
      'Bật lời mời cho cộng đồng này';

  @override
  String get guildSettingsInvitesPauseConfirmDescription =>
      'Tạm dừng lời mời? Người dùng mới sẽ không thể tham gia qua liên kết mời cho đến khi bạn bật lại. Thành viên hiện tại sẽ không bị ảnh hưởng.';

  @override
  String get guildSettingsInvitesEnableConfirmDescription =>
      'Bật lời mời? Người dùng sẽ có thể tham gia cộng đồng này qua liên kết mời.';

  @override
  String get guildSettingsInvitesPause => 'Tạm dừng';

  @override
  String get guildSettingsInvitesPausedForCommunity =>
      'Đã tạm dừng lời mời cho cộng đồng này.';

  @override
  String guildSettingsInvitesPausedBecauseRaid(String productName) {
    return 'Lời mời đang tạm dừng vì $productName phát hiện một cuộc tấn công tiềm ẩn. Người dùng mới hiện không thể tham gia.';
  }

  @override
  String get guildSettingsInvitesLabelInviter => 'Người mời:';

  @override
  String get guildSettingsInvitesLabelChannel => 'Kênh:';

  @override
  String get guildSettingsInvitesLabelCode => 'Mã:';

  @override
  String get guildSettingsInvitesLabelUses => 'Sử dụng:';

  @override
  String get guildSettingsInvitesLabelCreated => 'Đã tạo:';

  @override
  String get guildSettingsInvitesLabelExpires => 'Hết hạn:';

  @override
  String get guildSettingsInvitesUnknown => 'Không rõ';

  @override
  String get guildSettingsInvitesNoCategory => 'Không có danh mục';

  @override
  String get guildSettingsInvitesExpired => 'Đã hết hạn';

  @override
  String get guildSettingsInvitesNever => 'Không bao giờ';

  @override
  String get guildSettingsInvitesCopyLink => 'Sao chép liên kết mời';

  @override
  String get guildSettingsInvitesRevoke => 'Thu hồi lời mời';

  @override
  String get guildSettingsInvitesRevokeFailedTitle =>
      'Không thể thu hồi lời mời';

  @override
  String get guildSettingsInvitesRevokeFailedDescription =>
      'Liên kết có thể vẫn hoạt động. Vui lòng thử lại sau ít phút.';

  @override
  String guildSettingsInviteUses(int uses, int maxUses) {
    return '$uses / $maxUses lượt sử dụng';
  }

  @override
  String guildSettingsInviteExpires(String date) {
    return 'Hết hạn $date';
  }

  @override
  String get guildSettingsBansDescription =>
      'Xem và quản lý người dùng bị cấm.';

  @override
  String get guildSettingsBansSearchHint => 'Tìm kiếm lệnh cấm';

  @override
  String get guildSettingsBansEmpty => 'Không có người dùng nào bị cấm.';

  @override
  String get guildSettingsBanPermanent => 'Cấm vĩnh viễn';

  @override
  String guildSettingsBanExpires(String date) {
    return 'Hết hạn vào $date';
  }

  @override
  String get guildSettingsBanExpiresLabel => 'Hết hạn';

  @override
  String get guildSettingsUnban => 'Bỏ cấm';

  @override
  String get guildSettingsBansLoading => 'Đang tải người dùng bị cấm';

  @override
  String get guildSettingsBansNoSearchResults =>
      'Không tìm thấy lệnh cấm nào khớp với tìm kiếm của bạn.';

  @override
  String get guildSettingsBanDetailsTitle => 'Chi tiết lệnh cấm';

  @override
  String get guildSettingsBanViewDetails => 'Xem chi tiết';

  @override
  String get guildSettingsBannedOn => 'Bị cấm vào';

  @override
  String get guildSettingsBannedBy => 'Bị cấm bởi';

  @override
  String get guildSettingsRevokeBanTitle => 'Bỏ cấm';

  @override
  String guildSettingsRevokeBanDescription(String displayName) {
    return 'Bạn có chắc chắn muốn gỡ bỏ lệnh cấm đối với $displayName không? Họ sẽ có thể tham gia lại cộng đồng.';
  }

  @override
  String guildSettingsRevokeBanSuccess(String displayName) {
    return 'Đã thu hồi lệnh cấm đối với $displayName';
  }

  @override
  String get guildSettingsBansLoadError => 'Không tải được lệnh cấm. Thử lại.';

  @override
  String get guildSettingsRevokeBanError =>
      'Không thể gỡ bỏ lệnh cấm. Vui lòng thử lại.';

  @override
  String get guildSettingsCommunitySettings => 'Cài đặt cộng đồng';

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
      'Quản lý hồ sơ, kênh và cài đặt mặc định của cộng đồng của bạn.';

  @override
  String get guildSettingsOverviewBrandingTitle => 'Thương hiệu';

  @override
  String get guildSettingsOverviewBrandingDescription =>
      'Cập nhật biểu tượng, tên, biểu ngữ và ảnh nền lời mời của bạn';

  @override
  String get guildSettingsOverviewBannerUpload => 'Tải ảnh bìa lên';

  @override
  String get guildSettingsOverviewIdleTitle => 'Cài đặt trạng thái rảnh rỗi';

  @override
  String get guildSettingsOverviewIdleDescription =>
      'Thiết lập kênh AFK và thời gian chờ';

  @override
  String get guildSettingsOverviewSystemTitle => 'Hệ thống & chào mừng';

  @override
  String get guildSettingsOverviewSystemDescription =>
      'Chọn đích đến cho tin nhắn hệ thống và chào mừng';

  @override
  String get guildSettingsOverviewNotificationsTitle => 'Thông báo mặc định';

  @override
  String get guildSettingsOverviewNotificationsLargeGuild =>
      'Các cộng đồng có hơn 250 người sẽ tự động chuyển sang chế độ \"chỉ nhắc đến\". Cài đặt ban đầu của bạn sẽ được giữ nguyên và khôi phục nếu số thành viên cộng đồng giảm xuống dưới 250 người.';

  @override
  String get guildSettingsOverviewAdvancedTitle => 'Nâng cao';

  @override
  String get guildSettingsOverviewFlexibleNames =>
      'Cho phép đặt tên kênh văn bản linh hoạt';

  @override
  String get guildSettingsOverviewHideOwnerCrown =>
      'Ẩn vương miện chủ sở hữu cộng đồng';

  @override
  String get guildSettingsOverviewDetachedBanner => 'Đã gỡ biểu ngữ';

  @override
  String get guildSettingsOverviewDetachedBannerHint =>
      'Hiển thị biểu ngữ trong phần riêng bên dưới tiêu đề cộng đồng.';

  @override
  String get guildSettingsOverviewUploadIcon => 'Tải ảnh đại diện';

  @override
  String get guildSettingsOverviewRemoveImage => 'Xóa';

  @override
  String get guildSettingsOverviewSplashTitle => 'Ảnh nền lời mời';

  @override
  String get guildSettingsOverviewEmbedSplashTitle =>
      'Ảnh nền nhúng trò chuyện';

  @override
  String get guildSettingsOverviewEmbedSplashHint =>
      'Hiển thị trong các bản nhúng mời trong cuộc trò chuyện.';

  @override
  String get guildSettingsOverviewUploadBackground => 'Tải ảnh nền lên';

  @override
  String get guildSettingsOverviewNoCommunityBanner =>
      'Không có ảnh bìa cộng đồng';

  @override
  String get guildSettingsOverviewNoInviteBackground =>
      'Không có ảnh nền lời mời';

  @override
  String get guildSettingsOverviewInvitePreviewTitle => 'Xem trước';

  @override
  String get guildSettingsOverviewInvitePreviewHint =>
      'Xem trước lời mời của bạn sẽ hiển thị thế nào với khách truy cập.';

  @override
  String get guildSettingsOverviewTextChannelNamesTitle => 'Tên kênh văn bản';

  @override
  String get guildSettingsOverviewOwnerCrownTitle =>
      'Vương miện chủ sở hữu cộng đồng';

  @override
  String get guildSettingsOverviewOwnerCrownDescription =>
      'Cấu hình xem biểu tượng vương miện có hiển thị bên cạnh chủ sở hữu cộng đồng hay không';

  @override
  String get guildSettingsSplashCardAlignment => 'Căn chỉnh thẻ';

  @override
  String get guildSettingsSplashAlignmentCenter => 'Căn giữa';

  @override
  String get guildSettingsSplashAlignmentLeft => 'Trái';

  @override
  String get guildSettingsSplashAlignmentRight => 'Phải';

  @override
  String get guildSettingsSplashAlignmentHint =>
      'Chỉ áp dụng trên màn hình rộng.';

  @override
  String get permissionReadMessageHistory => 'Đọc lịch sử tin nhắn';

  @override
  String guildSettingsOverviewMessageHistoryTitle(String permission) {
    return 'Thay đổi những gì người dùng không có $permission có thể xem';
  }

  @override
  String guildSettingsOverviewMessageHistoryDescription(String permission) {
    return 'Sử dụng một cửa sổ bật lên riêng để đặt ngày giới hạn lịch sử tin nhắn cho các thành viên không có quyền $permission.';
  }

  @override
  String get guildSettingsOverviewMessageHistoryOpen =>
      'Ngưỡng lịch sử tin nhắn công khai';

  @override
  String get guildSettingsMessageHistoryThresholdTitle =>
      'Ngưỡng lịch sử tin nhắn';

  @override
  String get guildSettingsMessageHistoryThresholdEnable =>
      'Bật ngưỡng lịch sử tin nhắn';

  @override
  String get guildSettingsMessageHistoryThresholdDate => 'Ngày giới hạn';

  @override
  String get guildSettingsMessageHistoryThresholdDateHint =>
      'Thành viên không có quyền Đọc Lịch sử Tin nhắn có thể xem tin nhắn được gửi sau ngày này.';

  @override
  String get guildSettingsMessageHistoryThresholdUpdated =>
      'Đã cập nhật ngưỡng lịch sử tin nhắn';

  @override
  String get guildSettingsOverviewFlexibleNamesHint =>
      'Cho phép chữ in hoa và dấu cách trong tên kênh văn bản. Tắt sẽ giới hạn tên chỉ dùng chữ thường với dấu gạch nối và dấu gạch dưới.';

  @override
  String get guildSettingsOverviewHideOwnerCrownHint =>
      'Ẩn biểu tượng vương miện bên cạnh chủ sở hữu cộng đồng trên mọi giao diện.';

  @override
  String get guildSettingsAnimatedIconRequiresFeature =>
      'Biểu tượng động yêu cầu tính năng cộng đồng Biểu tượng động.';

  @override
  String get guildSettingsAnimatedBannerRequiresFeature =>
      'Ảnh động nền cộng đồng yêu cầu tính năng Ảnh động nền của cộng đồng.';

  @override
  String get guildSettingsAfkChannel => 'Kênh AFK / rảnh';

  @override
  String get guildSettingsAfkChannelHint =>
      'Di chuyển thành viên đến kênh này khi họ không hoạt động.';

  @override
  String get guildSettingsNoAfkChannel => 'Không có kênh AFK';

  @override
  String get guildSettingsAfkTimeout => 'Thời gian chờ AFK';

  @override
  String get guildSettingsAfkTimeout1Min => '1 phút';

  @override
  String get guildSettingsAfkTimeout5Min => '5 phút';

  @override
  String get guildSettingsAfkTimeout15Min => '15 phút';

  @override
  String get guildSettingsAfkTimeout30Min => '30 phút';

  @override
  String get guildSettingsAfkTimeout1Hour => '1 giờ';

  @override
  String guildSettingsAfkTimeoutSeconds(int seconds) {
    return '$seconds giây';
  }

  @override
  String get guildSettingsSystemChannel => 'Kênh đích';

  @override
  String get guildSettingsSystemChannelHint =>
      'Tin nhắn chào mừng và hệ thống sẽ xuất hiện ở đây.';

  @override
  String get guildSettingsNoSystemChannel => 'Không có kênh hệ thống';

  @override
  String get guildSettingsHideJoinMessages => 'Ẩn tin nhắn tham gia';

  @override
  String get guildSettingsHideJoinMessagesHint =>
      'Ẩn tin nhắn tham gia trong kênh đích.';

  @override
  String get guildSettingsDefaultNotifications => 'Cài đặt thông báo mặc định';

  @override
  String get guildSettingsNotificationsAll => 'Tất cả tin nhắn';

  @override
  String get guildSettingsNotificationsAllDescription =>
      'Thông báo cho tất cả tin nhắn';

  @override
  String get guildSettingsNotificationsMentions => 'Chỉ nhắc đến';

  @override
  String get guildSettingsNotificationsMentionsDescription =>
      'Chỉ thông báo khi được nhắc đến';

  @override
  String get guildSettingsOverviewSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Tối đa 10MB. Tối thiểu: 960×540px (tỷ lệ 16:9)';

  @override
  String get guildSettingsOverviewEmbedSplashUploadHint =>
      'JPEG, PNG, WebP, AVIF. Tối đa 10MB. Tối thiểu: 960×540px (tỷ lệ 16:9). Hiển thị trong các lượt mời nhúng trên trò chuyện.';

  @override
  String get guildSettingsModerationDescription =>
      'Cấu hình cài đặt xác minh, lọc nội dung và nội dung nhạy cảm.';

  @override
  String get guildSettingsModerationDiscoveryNotice =>
      'Cộng đồng được liệt kê trong Khám phá có các tùy chọn kiểm duyệt bị hạn chế.';

  @override
  String get guildSettingsModerationContentFilterTitle => 'Lọc nội dung';

  @override
  String get guildSettingsModerationContentFilterDescription =>
      'Tự động sàng lọc tin nhắn có nội dung nhạy cảm trong các kênh không được đánh dấu là nội dung người lớn.';

  @override
  String get guildSettingsModerationContentFilterDiscoveryNote =>
      'Các cộng đồng được liệt kê trong Khám phá phải quét tất cả thành viên. Bạn không thể thay đổi cài đặt này khi Khám phá được bật.';

  @override
  String get guildSettingsContentFilterOff => 'Tắt';

  @override
  String get guildSettingsContentFilterOffDescription =>
      'Để cộng đồng tự kiểm duyệt';

  @override
  String get guildSettingsContentFilterNoRole =>
      'Lọc thành viên chưa có vai trò';

  @override
  String get guildSettingsContentFilterNoRoleDescription =>
      'Được đề xuất cho hầu hết các cộng đồng';

  @override
  String get guildSettingsContentFilterAll => 'Lọc tất cả';

  @override
  String get guildSettingsContentFilterAllDescription =>
      'Bảo vệ tối đa cho không gian thân thiện với gia đình';

  @override
  String get guildSettingsModerationMatureOff => 'Tắt';

  @override
  String get guildSettingsModerationMatureOn => 'Bật';

  @override
  String get guildSettingsContentWarningToggle => 'Hiển thị cảnh báo nội dung';

  @override
  String get guildSettingsContentWarningToggleDescription =>
      'Bật lời nhắc đồng ý trước khi vào bất kỳ kênh nào.';

  @override
  String get guildSettingsContentWarningText => 'Văn bản cảnh báo tùy chỉnh';

  @override
  String get guildSettingsContentWarningTextPlaceholder =>
      'Nội dung này có chứa thông tin nhạy cảm.';

  @override
  String get guildSettingsModeration2faTitle => 'Yêu cầu 2FA';

  @override
  String get guildSettingsModeration2faDescription =>
      'Yêu cầu xác thực hai yếu tố cho người kiểm duyệt trước khi họ có thể cấm, đuổi, tạm dừng hoặc xóa tin nhắn.';

  @override
  String get guildSettingsModeration2faSwitchLabel =>
      'Yêu cầu xác thực 2 yếu tố cho hành động kiểm duyệt';

  @override
  String get guildSettingsModeration2faOwnerOnlyTooltip =>
      'Chỉ chủ sở hữu cộng đồng mới có thể thay đổi cài đặt này';

  @override
  String get guildSettingsModeration2faEnableFirstTooltip =>
      'Bật 2FA cho tài khoản của bạn để thay đổi cài đặt này';

  @override
  String get guildSettingsEmojiSearchHint => 'Tìm biểu tượng cảm xúc';

  @override
  String get guildSettingsEmojiUploadTitle => 'Tải biểu tượng cảm xúc lên';

  @override
  String get guildSettingsEmojiSlotsTitle => 'Ô biểu tượng cảm xúc';

  @override
  String get guildSettingsEmojiDropZone =>
      'Kéo và thả tệp biểu tượng cảm xúc vào đây';

  @override
  String get guildSettingsEmojiLoadFailed =>
      'Không tải được biểu tượng cảm xúc. Vui lòng thử lại sau.';

  @override
  String get guildSettingsEmojiSearchEmpty =>
      'Không tìm thấy biểu tượng cảm xúc nào khớp với tìm kiếm của bạn.';

  @override
  String get guildSettingsEmojiNoSlots =>
      'Không còn ô trống cho biểu tượng cảm xúc';

  @override
  String get guildSettingsEmojiSlotsFull =>
      'Bạn đã đạt đến số lượng biểu tượng cảm xúc tối đa. Hãy xóa bớt một số biểu tượng cảm xúc hiện có để tạo chỗ trống.';

  @override
  String guildSettingsEmojiUploadRequirements(String maxSize) {
    return 'Tên biểu tượng cần có ít nhất 2 ký tự và có thể sử dụng chữ cái, số và dấu gạch dưới. Kích thước biểu tượng không được vượt quá $maxSize. Ảnh tĩnh sẽ được tự động thay đổi kích thước thành 128x128 pixel và nén. Biểu tượng động và SVG phải đã phù hợp với giới hạn này.';
  }

  @override
  String get guildSettingsEmojiUploadingTitle =>
      'Đang tải biểu tượng cảm xúc lên';

  @override
  String guildSettingsEmojiUploadingBody(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '# biểu tượng cảm xúc',
      one: '# biểu tượng cảm xúc',
    );
    return 'Đang tải lên $_temp0. Việc này có thể mất một chút thời gian.';
  }

  @override
  String get guildSettingsEmojiUploadFailed =>
      'Không thể tải emoji lên. Vui lòng thử lại.';

  @override
  String get guildSettingsEmojiSomeFailedTitle =>
      'Không thể thêm một số biểu tượng cảm xúc';

  @override
  String get guildSettingsEmojiSomeFailedBody =>
      'Xem lại các tệp này và thử lại với hình ảnh nhỏ hơn hoặc đơn giản hơn.';

  @override
  String get guildSettingsEmojiRenameTitle => 'Đổi tên biểu tượng cảm xúc';

  @override
  String get guildSettingsEmojiRenameHint =>
      '2-32 ký tự, chữ cái, số, dấu gạch dưới.';

  @override
  String get guildSettingsEmojiColumnEmoji => 'Biểu tượng cảm xúc';

  @override
  String get guildSettingsEmojiColumnName => 'Tên';

  @override
  String get guildSettingsEmojiColumnUploader => 'Đã tải lên bởi';

  @override
  String get guildSettingsEmojiUnknownUploader => 'Không rõ';

  @override
  String get guildSettingsEmojiDeleteTitle => 'Xóa biểu tượng cảm xúc';

  @override
  String guildSettingsEmojiDeleteBody(String name) {
    return 'Xóa :$name:? Thao tác này không thể hoàn tác.';
  }

  @override
  String get guildSettingsEmojiPurgeLabel =>
      'Xóa biểu tượng cảm xúc này khỏi bộ nhớ và CDN';

  @override
  String get guildSettingsEmojiNameTooShort =>
      'Tên biểu tượng cảm xúc phải có ít nhất 2 ký tự';

  @override
  String get guildSettingsEmojiNameTooLong =>
      'Tên biểu tượng cảm xúc tối đa 32 ký tự';

  @override
  String get guildSettingsEmojiInvalidNameTitle =>
      'Tên biểu tượng cảm xúc không hợp lệ';

  @override
  String get guildSettingsEmojiRenameFailedTitle =>
      'Không thể đổi tên biểu tượng cảm xúc này';

  @override
  String get guildSettingsEmojiRenameFailedBody =>
      'Tên đã được khôi phục về trạng thái trước đó. Vui lòng thử lại sau giây lát.';

  @override
  String get guildSettingsEmojiGoneTitle =>
      'Biểu tượng cảm xúc này không còn tồn tại';

  @override
  String get guildSettingsEmojiGoneBody =>
      'Biểu tượng cảm xúc có thể đã bị xóa. Tên đã được khôi phục về trạng thái ban đầu.';

  @override
  String get guildSettingsEmojiNoPermissionRenameTitle =>
      'Bạn không thể đổi tên biểu tượng cảm xúc này';

  @override
  String get guildSettingsEmojiNoPermissionRenameBody =>
      'Bạn không có quyền đổi tên biểu tượng cảm xúc này. Tên đã được khôi phục về trạng thái trước đó.';

  @override
  String get guildSettingsEmojiRateLimitedTitle =>
      'Bạn đang thao tác quá nhanh';

  @override
  String get guildSettingsEmojiRateLimitedBody =>
      'Vui lòng đợi một lát rồi thử đổi tên lại.';

  @override
  String get guildSettingsEmojiDeleteFailedTitle =>
      'Không thể xóa biểu tượng cảm xúc này';

  @override
  String get guildSettingsEmojiDeleteNoPermissionTitle =>
      'Bạn không thể xóa biểu tượng cảm xúc này';

  @override
  String get guildSettingsCloneEmojiTitle =>
      'Cho phép người khác sao chép biểu tượng cảm xúc của bạn';

  @override
  String get guildSettingsCloneEmojiDescription =>
      'Khi bật, thành viên của các cộng đồng khác có thể dùng lối tắt \"Nhân bản\" một chạm trong ứng dụng cho các biểu tượng cảm xúc tùy chỉnh của bạn. Việc này không ngăn họ lưu hình ảnh và tự tải lên.';

  @override
  String get guildSettingsCloneStickerTitle =>
      'Cho phép người khác sao chép sticker của bạn';

  @override
  String get guildSettingsCloneStickerDescription =>
      'Khi bật, thành viên của các cộng đồng khác có thể dùng lối tắt \"Nhân bản\" một chạm trong ứng dụng cho các nhãn dán tùy chỉnh của bạn. Việc này không ngăn họ lưu hình ảnh và tự tải lên.';

  @override
  String guildSettingsClonePermissionHint(String permission) {
    return 'Chỉ những thành viên có quyền \"$permission\" mới có thể thay đổi điều này.';
  }

  @override
  String get guildSettingsCloneEmojiUpdateFailed =>
      'Không thể cập nhật cài đặt sao chép biểu tượng cảm xúc';

  @override
  String get guildSettingsCloneStickerUpdateFailed =>
      'Không thể cập nhật cài đặt nhân bản nhãn dán';

  @override
  String guildSettingsNonAnimatedEmoji(int count) {
    return 'Emoji không hoạt ảnh ($count)';
  }

  @override
  String guildSettingsAnimatedEmoji(int count) {
    return 'Emoji động ($count)';
  }

  @override
  String get guildSettingsStickersSearchHint => 'Tìm nhãn dán';

  @override
  String get guildSettingsStickerSlotsTitle => 'Ô nhãn dán';

  @override
  String get guildSettingsStickerUploadTitle => 'Tải sticker lên';

  @override
  String get guildSettingsStickerDropZone =>
      'Kéo và thả tệp nhãn dán vào đây (từng tệp một)';

  @override
  String get guildSettingsStickerDensity => 'Mật độ nhãn dán';

  @override
  String get guildSettingsStickerDensityCozy => 'Ấm cúng';

  @override
  String get guildSettingsStickerDensityCompact => 'Thu gọn';

  @override
  String get guildSettingsStickersLoadFailedTitle => 'Không tải được nhãn dán';

  @override
  String get guildSettingsStickersLoadFailedBody =>
      'Đã xảy ra lỗi khi tải nhãn dán. Vui lòng thử lại.';

  @override
  String get guildSettingsStickersSearchEmpty =>
      'Không tìm thấy nhãn dán nào khớp với tìm kiếm của bạn.';

  @override
  String get guildSettingsStickersEmptySearch => 'Không tìm thấy sticker nào';

  @override
  String get guildSettingsStickerNoSlots => 'Không có ô nhãn dán nào khả dụng';

  @override
  String get guildSettingsStickerSlotsFull =>
      'Bạn đã đạt đến số lượng nhãn dán tối đa. Xóa một số nhãn dán hiện có để tạo thêm chỗ trống.';

  @override
  String guildSettingsStickerUploadRequirements(String maxSize) {
    return 'Nhãn dán được lưu ở kích thước 320x320 pixel và không được vượt quá $maxSize. Ảnh tĩnh sẽ được tự động thay đổi kích thước và nén. Nhãn dán động và SVG phải đã phù hợp với giới hạn này.';
  }

  @override
  String get guildSettingsStickerUnsupportedTitle =>
      'Tệp nhãn dán không được hỗ trợ';

  @override
  String get guildSettingsStickerAddTitle => 'Thêm nhãn dán';

  @override
  String get guildSettingsStickerEditTitle => 'Sửa nhãn dán';

  @override
  String get guildSettingsStickerNameLabel => 'Tên';

  @override
  String get guildSettingsStickerNameHint => 'Sticker của tôi';

  @override
  String get guildSettingsStickerDescriptionLabel => 'Mô tả';

  @override
  String get guildSettingsStickerDescriptionHint => 'Mô tả sticker';

  @override
  String guildSettingsStickerTagsLabel(int count, int limit) {
    return 'Thẻ ($count/$limit)';
  }

  @override
  String get guildSettingsStickerTagHint => 'Thêm thẻ';

  @override
  String get guildSettingsStickerTagAdd => 'Thêm';

  @override
  String get guildSettingsStickerNameRequired => 'Cần có tên';

  @override
  String get guildSettingsStickerNameTooShort => 'Tên phải có ít nhất 2 ký tự';

  @override
  String get guildSettingsStickerNameTooLong => 'Tên phải có tối đa 30 ký tự';

  @override
  String get guildSettingsStickerDescriptionTooLong =>
      'Mô tả phải dưới 500 ký tự';

  @override
  String get guildSettingsStickerCreateFailedTitle =>
      'Không thể tạo nhãn dán này';

  @override
  String get guildSettingsStickerTooLargeTitle => 'Hình dán quá lớn';

  @override
  String get guildSettingsStickerCompressFailedTitle =>
      'Không thể nén sticker đủ nhỏ';

  @override
  String get guildSettingsStickerDeleteTitle => 'Xóa nhãn dán';

  @override
  String guildSettingsStickerDeleteBody(String name) {
    return 'Xóa \"$name\"? Thao tác này không thể hoàn tác.';
  }

  @override
  String get guildSettingsStickerPurgeLabel =>
      'Xóa nhãn dán này khỏi bộ nhớ và CDN';

  @override
  String get guildSettingsStickerDeleteFailedTitle =>
      'Không thể xóa sticker này';

  @override
  String get guildSettingsStickerDeleteNoPermissionTitle =>
      'Bạn không thể xóa nhãn dán này';

  @override
  String guildSettingsWebhooksInfo(String channelSettingsPath) {
    return 'Để tạo webhook, hãy mở $channelSettingsPath. Bạn vẫn có thể chỉnh sửa và sắp xếp tất cả các webhook hiện có tại đây.';
  }

  @override
  String get guildSettingsVanityUrlWarning =>
      'URL tùy chỉnh của bạn sẽ không hoạt động trừ khi có ít nhất một kênh hiển thị cho mọi người.';

  @override
  String get guildSettingsVanityUrlRemove => 'Xóa';

  @override
  String get guildSettingsBannedUsersTitle => 'Người dùng bị cấm';

  @override
  String get guildSettingsInvitesTableInviter => 'Người mời';

  @override
  String get guildSettingsInvitesTableChannel => 'Kênh';

  @override
  String get guildSettingsInvitesTableCode => 'Mã';

  @override
  String get guildSettingsInvitesTableUses => 'Đã dùng';

  @override
  String get guildSettingsInvitesTableCreated => 'Đã tạo';

  @override
  String get guildSettingsInvitesTableExpires => 'Hết hạn';

  @override
  String get guildSettingsAuditLogFilterUser => 'Lọc theo người dùng';

  @override
  String get guildSettingsAuditLogFilterAction => 'Lọc theo hành động';

  @override
  String get createDm => 'Tạo tin nhắn riêng tư';

  @override
  String get createGroupDm => 'Tạo nhóm chat';

  @override
  String get createDmNewMessage => 'Tin nhắn mới';

  @override
  String get createDmSelectFriends => 'Chọn bạn bè';

  @override
  String get createDmChooseFriendsSubtitle => 'Chọn bạn bè để nhắn tin.';

  @override
  String get createDmSearchFriends => 'Tìm bạn bè';

  @override
  String get createDmNoFriendsFound => 'Không tìm thấy bạn bè nào';

  @override
  String get createDmNoFriendsYet => 'Bạn chưa có người bạn nào';

  @override
  String get createDmClaimToStartDms =>
      'Xác nhận tài khoản để bắt đầu trò chuyện riêng tư.';

  @override
  String get createDmVerifyToStartDms =>
      'Xác minh email của bạn để bắt đầu tin nhắn trực tiếp.';

  @override
  String get createDmVerifyYourEmail => 'Xác minh email của bạn';

  @override
  String get createDmNewGroup => 'Nhóm mới';

  @override
  String createDmCreateGroupWithRecipient(String userName) {
    return 'Tạo nhóm mới với $userName';
  }

  @override
  String get createDmConfirmNewGroup => 'Xác nhận nhóm mới';

  @override
  String get createDmCreateNewGroup => 'Tạo nhóm mới';

  @override
  String createDmRemoveFriend(String displayName) {
    return 'Xóa $displayName';
  }

  @override
  String get createDmDuplicateGroupDescription =>
      'Bạn đã có một nhóm với những người dùng này rồi. Bạn có thực sự muốn tạo một nhóm mới không? Cũng được thôi!';

  @override
  String get createDmNoActivityYet => 'Chưa có hoạt động nào';

  @override
  String get createDmSomeUsersCantBeAdded => 'Không thể thêm một số người dùng';

  @override
  String get createDmCreateWithoutThem => 'Tạo nhóm không có họ';

  @override
  String get createDmUnaddableIntro =>
      'Không thể thêm những người sau vào cuộc trò chuyện nhóm này:';

  @override
  String createDmUnaddableProceed(int count) {
    return 'Tạo nhóm DM với $count người nhận còn lại và bỏ qua những người khác?';
  }

  @override
  String get createDmUnaddableNoneRemaining =>
      'Không còn người nhận nào để tạo tin nhắn nhóm.';

  @override
  String get createDmUnaddableUserNotFound => 'Không tìm thấy người dùng';

  @override
  String get createDmUnaddableBlocked =>
      'Bạn không thể nhắn tin cho người dùng này';

  @override
  String get createDmUnaddableNotFriends =>
      'Không có trong danh sách bạn bè của bạn';

  @override
  String get createDmUnaddableGroupDisabled =>
      'Không cho phép thêm vào tin nhắn nhóm';

  @override
  String get createDmFailed => 'Không thể tạo cuộc trò chuyện. Thử lại.';

  @override
  String get dmListMessagesTitle => 'Tin nhắn';

  @override
  String get dmListDirectMessagesTitle => 'Tin nhắn trực tiếp';

  @override
  String get keybindsSearchShortcuts => 'Tìm kiếm phím tắt';

  @override
  String get keybindSectionDefaults => 'Mặc định';

  @override
  String get keybindSectionMessages => 'Tin nhắn';

  @override
  String get keybindSectionNavigation => 'Điều hướng';

  @override
  String get keybindSectionDragAndDrop => 'Kéo và thả';

  @override
  String get keybindSectionChat => 'Trò chuyện';

  @override
  String get keybindSectionVoiceAndVideo => 'Thoại và video';

  @override
  String get keybindSectionMisc => 'Khác';

  @override
  String get keybindActionShowShortcutsList => 'Hiện danh sách phím tắt';

  @override
  String get keybindActionCopyText => 'Sao chép văn bản';

  @override
  String get keybindActionMarkUnread => 'Đánh dấu là chưa đọc';

  @override
  String get keybindActionFocusTextarea => 'Tập trung vào vùng nhập văn bản';

  @override
  String get keybindActionSwitchCommunities => 'Chuyển đổi giữa các cộng đồng';

  @override
  String get keybindActionSwitchChannels => 'Chuyển đổi kênh';

  @override
  String get keybindActionHistoryBack => 'Quay lại lịch sử kênh đã xem';

  @override
  String get keybindActionHistoryForward => 'Đi tới kênh đã xem trước đó';

  @override
  String get keybindActionJumpUnreadChannels =>
      'Chuyển nhanh giữa các kênh chưa đọc';

  @override
  String get keybindActionJumpMentionChannels =>
      'Chuyển nhanh giữa các kênh chưa đọc có nhắc đến bạn';

  @override
  String get keybindActionJumpCurrentCall => 'Chuyển đến cuộc gọi hiện tại';

  @override
  String get keybindActionToggleLastGuildDms =>
      'Chuyển đổi giữa cộng đồng và tin nhắn riêng tư gần nhất';

  @override
  String get keybindActionPreviousCommunityOrDms =>
      'Chuyển sang cộng đồng hoặc tin nhắn trực tiếp trước đó';

  @override
  String get keybindActionNextCommunityOrDms =>
      'Chuyển sang cộng đồng hoặc tin nhắn trực tiếp tiếp theo';

  @override
  String get keybindActionGoToDms => 'Đi tới Tin nhắn trực tiếp';

  @override
  String get keybindActionGoToFirstCommunity => 'Đi đến cộng đồng đầu tiên';

  @override
  String get keybindActionGoToSecondCommunity => 'Đi đến cộng đồng thứ hai';

  @override
  String get keybindActionGoToThirdCommunity => 'Đi đến cộng đồng thứ ba';

  @override
  String get keybindActionGoToFourthCommunity => 'Đi đến cộng đồng thứ tư';

  @override
  String get keybindActionGoToFifthCommunity => 'Đi đến cộng đồng thứ năm';

  @override
  String get keybindActionGoToSixthCommunity => 'Đi đến cộng đồng thứ sáu';

  @override
  String get keybindActionGoToSeventhCommunity => 'Đi đến cộng đồng thứ bảy';

  @override
  String get keybindActionGoToEighthCommunity => 'Đi đến cộng đồng thứ tám';

  @override
  String get keybindActionToggleQuickSwitcher => 'Bật/tắt bộ chuyển đổi nhanh';

  @override
  String get keybindActionCreateOrJoinCommunity =>
      'Tạo hoặc tham gia cộng đồng';

  @override
  String get keybindActionStartDragAndDrop => 'Bắt đầu kéo và thả';

  @override
  String get keybindActionMove => 'Di chuyển';

  @override
  String get keybindActionDropItem => 'Bỏ vật phẩm';

  @override
  String get keybindActionCancel => 'Hủy';

  @override
  String get keybindActionMarkCommunityRead => 'Đánh dấu cộng đồng là đã đọc';

  @override
  String get keybindActionMarkChannelRead => 'Đánh dấu kênh đã đọc';

  @override
  String get keybindActionStartGroupDm => 'Tạo tin nhắn nhóm';

  @override
  String get keybindActionTogglePinnedMessages => 'Bật/tắt tin nhắn đã ghim';

  @override
  String get keybindActionToggleInbox => 'Bật/tắt hộp thư đến';

  @override
  String get keybindActionMarkTopInboxRead =>
      'Đánh dấu kênh hộp thư đến trên cùng là đã đọc';

  @override
  String get keybindActionMarkAllInboxRead =>
      'Đánh dấu tất cả kênh hộp thư đến là đã đọc';

  @override
  String get keybindActionToggleMemberList =>
      'Bật/tắt danh sách thành viên hoặc trò chuyện thoại';

  @override
  String get keybindActionToggleEmojiPicker =>
      'Mở/đóng bảng chọn biểu tượng cảm xúc';

  @override
  String get keybindActionToggleGifPicker => 'Mở/tắt trình chọn GIF';

  @override
  String get keybindActionToggleStickerPicker => 'Mở/đóng bảng chọn nhãn dán';

  @override
  String get keybindActionScrollChatUp => 'Cuộn đoạn chat lên';

  @override
  String get keybindActionScrollChatDown => 'Cuộn xuống';

  @override
  String get keybindActionJumpOldestUnread =>
      'Chuyển đến tin nhắn cũ nhất chưa đọc';

  @override
  String get keybindActionFocusComposer => 'Tập trung vào vùng nhập văn bản';

  @override
  String get keybindActionUploadFile => 'Tải tệp lên';

  @override
  String get keybindActionCopyChannelLink => 'Sao chép liên kết kênh';

  @override
  String get keybindActionToggleSavedMedia => 'Bật/tắt phương tiện đã lưu';

  @override
  String get keybindActionSendVoiceMessage => 'Gửi tin nhắn thoại';

  @override
  String get keybindActionAnswerCall => 'Trả lời cuộc gọi đến';

  @override
  String get keybindActionDeclineCall => 'Từ chối cuộc gọi đến';

  @override
  String get keybindActionStartDmCall =>
      'Bắt đầu cuộc gọi trong tin nhắn hoặc nhóm';

  @override
  String get keybindActionToggleSoundboard => 'Bật/tắt bảng âm thanh';

  @override
  String get keybindActionToggleCompactCallView =>
      'Mở rộng hoặc thu gọn chế độ xem cuộc gọi thu gọn';

  @override
  String get keybindActionPushToTalkPriority => 'Nhấn để nói (ưu tiên)';

  @override
  String get keybindActionVoiceActivityPriority =>
      'Ưu tiên hoạt động giọng nói';

  @override
  String get keybindActionOpenHelp => 'Mở trợ giúp';

  @override
  String get keybindActionSearchMessages => 'Tìm tin nhắn';

  @override
  String get keybindActionOpenContextMenu => 'Mở menu ngữ cảnh';

  @override
  String get keybindActionOpenSettings => 'Mở cài đặt của bạn';

  @override
  String get keybindActionOpenThemeStudio => 'Mở cửa sổ bật lên studio chủ đề';

  @override
  String get keybindActionZoomIn => 'Phóng to';

  @override
  String get keybindActionZoomOut => 'Thu nhỏ';

  @override
  String get keybindActionZoomReset => 'Đặt lại thu phóng';

  @override
  String get clipboardPasteFailed =>
      'Không thể dán. Khay nhớ tạm trống hoặc bị ứng dụng này chặn.';

  @override
  String get homeQuickActionDms => 'Tin nhắn trực tiếp';
}
