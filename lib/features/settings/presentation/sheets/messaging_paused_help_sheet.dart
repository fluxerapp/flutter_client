import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/constants/contact_emails.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/messaging_paused_help_email.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_handler.dart';
import 'package:fluxer_app/shared/utils/clipboard_utils.dart';
import 'package:fluxer_app/shared/utils/user_tag.dart';

class MessagingPausedHelpSheet extends ConsumerStatefulWidget {
  const MessagingPausedHelpSheet({super.key});

  static Future<void> show(BuildContext context) {
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).messagingPausedTextDidNotGoThrough,
      useRootNavigator: true,
      builder: (_, _) => const MessagingPausedHelpSheet(),
    );
  }

  @override
  ConsumerState<MessagingPausedHelpSheet> createState() =>
      _MessagingPausedHelpSheetState();
}

class _MessagingPausedHelpSheetState
    extends ConsumerState<MessagingPausedHelpSheet> {
  final TextEditingController _countryController = TextEditingController();

  @override
  void dispose() {
    _countryController.dispose();
    super.dispose();
  }

  MessagingPausedHelpEmail _email() {
    final UserSettingsViewState settings = ref.read(
      userSettingsViewModelProvider,
    );
    return buildMessagingPausedHelpEmail(
      l10n: FluxerLocalizations.of(context),
      accountId: settings.userId,
      userTag: formatUserTag(
        settings.username,
        settings.discriminator,
        uniqueUsernames: ref.read(uniqueUsernamesProvider),
      ),
      createdAt: settings.resolvedMemberSince,
      country: _countryController.text,
    );
  }

  Future<void> _copyDetails() {
    return copyToClipboard(
      context: context,
      value: '${ContactEmails.support}\n\n${_email().body}',
    );
  }

  Future<void> _emailSupport() {
    return handleExternalLinkTap(context, _email().mailto, skipWarning: true);
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            l10n.messagingPausedHelpBody(ContactEmails.support),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s4),
          FluxerInput(
            controller: _countryController,
            label: l10n.messagingPausedHelpCountryLabel,
            maxLength: 100,
            autofillHints: const <String>[AutofillHints.countryName],
            textInputAction: TextInputAction.done,
          ),
          SizedBox(height: layout.s4),
          Row(
            children: <Widget>[
              Expanded(
                child: FluxerButton.secondary(
                  label: l10n.messagingPausedHelpCopyDetails,
                  onPressedAsync: _copyDetails,
                  fitContent: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FluxerButton.primary(
                  label: l10n.messagingPausedHelpEmailSupport,
                  onPressedAsync: _emailSupport,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
