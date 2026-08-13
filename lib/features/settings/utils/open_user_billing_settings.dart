import 'package:flutter/material.dart';
import 'package:fluxer_app/features/settings/domain/user_settings_section.dart';
import 'package:fluxer_app/features/settings/presentation/user_settings_modal.dart';

Future<void> openUserBillingSettings(
  BuildContext context,
  UserSettingsSection section,
) {
  return UserSettingsModal.show(context, initialSection: section);
}
