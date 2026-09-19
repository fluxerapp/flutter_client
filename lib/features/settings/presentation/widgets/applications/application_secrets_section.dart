import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_read_only_input.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ApplicationSecretsSection extends StatelessWidget {
  const ApplicationSecretsSection({
    required this.clientSecret,
    required this.botToken,
    required this.hasBot,
    required this.isRotatingClient,
    required this.isRotatingBot,
    required this.onRegenerateClientSecret,
    required this.onRegenerateBotToken,
    super.key,
  });

  final String? clientSecret;
  final String? botToken;
  final bool hasBot;
  final bool isRotatingClient;
  final bool isRotatingBot;
  final VoidCallback onRegenerateClientSecret;
  final VoidCallback onRegenerateBotToken;

  static const String _placeholder = '••••••••••••••••••••••••••••••••';

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);

    return FluxerSettingsSection(
      title: l10n.applicationsSecretsTitle,
      description: l10n.applicationsSecretsDescription,
      isFirst: true,
      density: FluxerSettingsSectionDensity.compact,
      sectionId: 'applications-secrets',
      children: [
        _SecretRow(
          label: l10n.applicationsClientSecret,
          value: clientSecret,
          isLoading: isRotatingClient,
          onRegenerate: onRegenerateClientSecret,
        ),
        if (hasBot)
          _SecretRow(
            label: l10n.applicationsBotToken,
            value: botToken,
            isLoading: isRotatingBot,
            onRegenerate: onRegenerateBotToken,
          ),
      ],
    );
  }
}

class _SecretRow extends StatelessWidget {
  const _SecretRow({
    required this.label,
    required this.value,
    required this.isLoading,
    required this.onRegenerate,
  });

  final String label;
  final String? value;
  final bool isLoading;
  final VoidCallback onRegenerate;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return ApplicationReadOnlyInput(
      text: value ?? '',
      label: label,
      hint: ApplicationSecretsSection._placeholder,
      trailing: FluxerButton.primary(
        onPressed: isLoading ? null : onRegenerate,
        label: l10n.applicationsRegenerate,
        size: FluxerButtonSize.small,
        isLoading: isLoading,
        fitContent: true,
      ),
    );
  }
}
