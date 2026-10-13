import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/presentation/modals/add_guild_create_view.dart';
import 'package:fluxer_app/features/guilds/utils/discord_template_parser.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class AddGuildImportUrlView extends ConsumerWidget {
  const AddGuildImportUrlView({
    required this.urlController,
    required this.onUrlSubmitted,
    this.urlErrorText,
    this.enabled = true,
    super.key,
  });

  final TextEditingController urlController;
  final VoidCallback onUrlSubmitted;
  final String? urlErrorText;
  final bool enabled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Widget? gate = buildAddGuildCreateGate(context, ref);
    if (gate != null) {
      return gate;
    }
    return FluxerInput(
      controller: urlController,
      label: FluxerLocalizations.of(context).addGuildImportUrlLabel,
      hint: kDiscordTemplateExampleUrl,
      errorText: urlErrorText,
      autofocus: true,
      enabled: enabled,
      onSubmitted: (_) => onUrlSubmitted(),
    );
  }
}

class AddGuildImportCreateView extends StatefulWidget {
  const AddGuildImportCreateView({
    required this.nameController,
    required this.template,
    required this.centered,
    this.createErrorText,
    this.enabled = true,
    super.key,
  });

  final TextEditingController nameController;
  final DiscordGuildTemplate template;
  final bool centered;
  final String? createErrorText;
  final bool enabled;

  @override
  State<AddGuildImportCreateView> createState() =>
      AddGuildImportCreateViewState();
}

class AddGuildImportCreateViewState extends State<AddGuildImportCreateView> {
  String? _iconDataUri;

  String? get iconDataUri => _iconDataUri;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        _TemplatePreviewCard(template: widget.template),
        const SizedBox(height: 16),
        AddGuildIconField(
          nameController: widget.nameController,
          iconDataUri: _iconDataUri,
          centered: widget.centered,
          enabled: widget.enabled,
          removeLabel: l10n.addGuildImportRemoveIcon,
          onChanged: (String? dataUri) =>
              setState(() => _iconDataUri = dataUri),
        ),
        const SizedBox(height: 16),
        FluxerInput(
          controller: widget.nameController,
          label: l10n.addGuildCreateNameLabel,
          errorText: widget.createErrorText,
          autofocus: true,
          maxLength: 100,
          enabled: widget.enabled,
        ),
        const SizedBox(height: 12),
        const AddGuildGuidelines(),
      ],
    );
  }
}

class _TemplatePreviewCard extends StatelessWidget {
  const _TemplatePreviewCard({required this.template});

  final DiscordGuildTemplate template;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final DiscordTemplateStats stats = template.stats;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.colors.backgroundSecondary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: context.colors.backgroundModifierAccent),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            l10n.addGuildImportTemplateLabel,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            template.name,
            style: context.textStyles.label.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.addGuildImportTemplateStats(
              stats.textChannelCount,
              stats.voiceChannelCount,
              stats.categoryCount,
              stats.roleCount,
            ),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
