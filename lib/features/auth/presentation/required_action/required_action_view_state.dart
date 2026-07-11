import 'package:fluxer_app/features/auth/domain/required_action_flow.dart';

enum RequiredActionViewKind {
  intro,
  chooseMethod,
  emailCheck,
  phoneNumber,
  phoneCode,
  phoneInboundWaiting,
}

class RequiredActionViewState {
  const RequiredActionViewState({
    required this.view,
    required this.selectedChannel,
    required this.actionError,
    required this.isLoggingOut,
    required this.isResendingEmail,
  });

  final RequiredActionViewKind view;
  final VerificationChannel selectedChannel;
  final String? actionError;
  final bool isLoggingOut;
  final bool isResendingEmail;

  RequiredActionViewState copyWith({
    RequiredActionViewKind? view,
    VerificationChannel? selectedChannel,
    String? actionError,
    bool? isLoggingOut,
    bool? isResendingEmail,
    bool clearActionError = false,
  }) {
    return RequiredActionViewState(
      view: view ?? this.view,
      selectedChannel: selectedChannel ?? this.selectedChannel,
      actionError: clearActionError ? null : actionError ?? this.actionError,
      isLoggingOut: isLoggingOut ?? this.isLoggingOut,
      isResendingEmail: isResendingEmail ?? this.isResendingEmail,
    );
  }
}
