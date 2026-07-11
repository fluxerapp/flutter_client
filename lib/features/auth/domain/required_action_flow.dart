enum VerificationMode { email, phone, emailOrPhone, emailAndPhone }

enum VerificationChannel { email, phone }

class ChannelVerificationPlan {
  const ChannelVerificationPlan({
    required this.channel,
    required this.actions,
    required this.reverify,
    required this.clearsAll,
    required this.remainingActionsAfterCompletion,
    required this.requiresInboundPhone,
  });

  final VerificationChannel channel;
  final List<String> actions;
  final bool reverify;
  final bool clearsAll;
  final List<String> remainingActionsAfterCompletion;
  final bool requiresInboundPhone;
}

class RequiredActionFlow {
  const RequiredActionFlow({
    required this.actions,
    required this.key,
    required this.mode,
    required this.defaultTab,
    required this.email,
    required this.phone,
    required this.reverify,
    required this.requiresInboundPhone,
  });

  final List<String> actions;
  final String key;
  final VerificationMode mode;
  final VerificationChannel defaultTab;
  final ChannelVerificationPlan? email;
  final ChannelVerificationPlan? phone;
  final bool reverify;
  final bool requiresInboundPhone;
}

const Set<String> _emailActions = {
  'REQUIRE_VERIFIED_EMAIL',
  'REQUIRE_REVERIFIED_EMAIL',
  'REQUIRE_VERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_VERIFIED_EMAIL_OR_REVERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_REVERIFIED_PHONE',
};

const Set<String> _phoneActions = {
  'REQUIRE_VERIFIED_PHONE',
  'REQUIRE_REVERIFIED_PHONE',
  'REQUIRE_VERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_VERIFIED_EMAIL_OR_REVERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_REVERIFIED_PHONE',
  'REQUIRE_INBOUND_PHONE_VERIFICATION',
};

const Set<String> _emailReverifyActions = {
  'REQUIRE_REVERIFIED_EMAIL',
  'REQUIRE_REVERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_REVERIFIED_PHONE',
};

const Set<String> _phoneReverifyActions = {
  'REQUIRE_REVERIFIED_PHONE',
  'REQUIRE_VERIFIED_EMAIL_OR_REVERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_REVERIFIED_PHONE',
};

const Set<String> _emailCompletionClearedActions = {
  'REQUIRE_VERIFIED_EMAIL',
  'REQUIRE_REVERIFIED_EMAIL',
  'REQUIRE_VERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_VERIFIED_EMAIL_OR_REVERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_REVERIFIED_PHONE',
};

const Set<String> _phoneCompletionClearedActions = {
  'REQUIRE_VERIFIED_PHONE',
  'REQUIRE_REVERIFIED_PHONE',
  'REQUIRE_VERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_VERIFIED_PHONE',
  'REQUIRE_VERIFIED_EMAIL_OR_REVERIFIED_PHONE',
  'REQUIRE_REVERIFIED_EMAIL_OR_REVERIFIED_PHONE',
  'REQUIRE_INBOUND_PHONE_VERIFICATION',
};

List<String> _sortActions(List<String> actions) {
  return <String>{...actions}.toList()..sort();
}

List<String> _clearChannelActions(
  List<String> actions,
  VerificationChannel channel,
) {
  final Set<String> clearedActions = channel == VerificationChannel.email
      ? _emailCompletionClearedActions
      : _phoneCompletionClearedActions;
  return actions
      .where((String action) => !clearedActions.contains(action))
      .toList();
}

ChannelVerificationPlan? _buildChannelPlan(
  VerificationChannel channel,
  List<String> actions,
) {
  final Set<String> channelActionSet = channel == VerificationChannel.email
      ? _emailActions
      : _phoneActions;
  final Set<String> reverifyActionSet = channel == VerificationChannel.email
      ? _emailReverifyActions
      : _phoneReverifyActions;
  final List<String> channelActions = actions
      .where(channelActionSet.contains)
      .toList();
  if (channelActions.isEmpty) {
    return null;
  }
  final List<String> remainingActionsAfterCompletion = _clearChannelActions(
    actions,
    channel,
  );
  return ChannelVerificationPlan(
    channel: channel,
    actions: channelActions,
    reverify: channelActions.any(reverifyActionSet.contains),
    clearsAll: remainingActionsAfterCompletion.isEmpty,
    remainingActionsAfterCompletion: remainingActionsAfterCompletion,
    requiresInboundPhone:
        channel == VerificationChannel.phone &&
        actions.contains('REQUIRE_INBOUND_PHONE_VERIFICATION'),
  );
}

VerificationChannel _pickDefaultTab(
  ChannelVerificationPlan? email,
  ChannelVerificationPlan? phone,
) {
  if (email == null) {
    return VerificationChannel.phone;
  }
  if (phone == null) {
    return VerificationChannel.email;
  }
  if (email.clearsAll != phone.clearsAll) {
    return email.clearsAll
        ? VerificationChannel.email
        : VerificationChannel.phone;
  }
  if (email.remainingActionsAfterCompletion.length !=
      phone.remainingActionsAfterCompletion.length) {
    return email.remainingActionsAfterCompletion.length <
            phone.remainingActionsAfterCompletion.length
        ? VerificationChannel.email
        : VerificationChannel.phone;
  }
  return VerificationChannel.email;
}

String? getRequiredActionsKey(List<String>? requiredActions) {
  if (requiredActions == null || requiredActions.isEmpty) {
    return null;
  }
  return _sortActions(requiredActions).join('|');
}

RequiredActionFlow? resolveRequiredActionFlow(List<String>? requiredActions) {
  if (requiredActions == null || requiredActions.isEmpty) {
    return null;
  }
  final List<String> actions = _sortActions(requiredActions);
  final ChannelVerificationPlan? email = _buildChannelPlan(
    VerificationChannel.email,
    actions,
  );
  final ChannelVerificationPlan? phone = _buildChannelPlan(
    VerificationChannel.phone,
    actions,
  );
  VerificationMode mode = VerificationMode.email;
  if (email != null && phone != null) {
    mode = email.clearsAll || phone.clearsAll
        ? VerificationMode.emailOrPhone
        : VerificationMode.emailAndPhone;
  } else if (phone != null) {
    mode = VerificationMode.phone;
  }
  return RequiredActionFlow(
    actions: actions,
    key: getRequiredActionsKey(actions)!,
    mode: mode,
    defaultTab: _pickDefaultTab(email, phone),
    email: email,
    phone: phone,
    reverify: (email?.reverify ?? false) || (phone?.reverify ?? false),
    requiresInboundPhone: phone?.requiresInboundPhone ?? false,
  );
}
