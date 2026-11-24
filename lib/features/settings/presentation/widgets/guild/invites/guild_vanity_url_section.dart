import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/permissions/permission.dart';
import 'package:fluxer_app/core/providers/instance/well_known_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/guilds/utils/guild_features.dart';
import 'package:fluxer_app/features/settings/providers/guild/guild_settings_tab_providers.dart';
import 'package:fluxer_app/features/settings/utils/guild/guild_invites_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';

final RegExp _kVanityCodePattern = RegExp(
  r'^[A-Za-z0-9](?:[A-Za-z0-9-]*[A-Za-z0-9])?$',
);
const int _kVanityMinLength = 2;
const int _kVanityMaxLength = 32;

class GuildVanityUrlSection extends ConsumerStatefulWidget {
  const GuildVanityUrlSection({required this.guildId, super.key});

  final String guildId;

  @override
  ConsumerState<GuildVanityUrlSection> createState() =>
      _GuildVanityUrlSectionState();
}

class _GuildVanityUrlSectionState extends ConsumerState<GuildVanityUrlSection> {
  final TextEditingController _controller = TextEditingController();
  String _savedCode = '';
  int _uses = 0;
  bool _loading = true;
  bool _saving = false;
  String? _error;
  bool _loadStarted = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    try {
      final GuildVanityUrlResponse response = await ref
          .read(fluxerClientProvider)
          .guilds
          .getGuildVanityUrl(guildId: widget.guildId);
      if (!mounted) {
        return;
      }
      setState(() {
        _savedCode = response.code ?? '';
        _uses = response.uses;
        _controller.text = _savedCode;
        _loading = false;
      });
    } on Object catch (error, stackTrace) {
      talker.warning('[VanityUrl] Load failed', error, stackTrace);
      if (mounted) {
        setState(() {
          _loading = false;
          _error = FluxerLocalizations.of(context).guildVanityUrlLoadFailed;
        });
      }
    }
  }

  String? _validate(FluxerLocalizations l10n, String code) {
    if (code.isEmpty) {
      return null;
    }
    if (code.length < _kVanityMinLength) {
      return l10n.guildVanityUrlTooShort;
    }
    if (code.length > _kVanityMaxLength) {
      return l10n.guildVanityUrlTooLong;
    }
    if (!_kVanityCodePattern.hasMatch(code)) {
      return l10n.guildVanityUrlInvalidCharacters;
    }
    return null;
  }

  Future<void> _save(FluxerLocalizations l10n) async {
    final String code = _controller.text.trim();
    final String? validation = _validate(l10n, code);
    if (validation != null) {
      setState(() => _error = validation);
      return;
    }
    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await ref
          .read(fluxerClientProvider)
          .guilds
          .updateGuildVanityUrl(
            guildId: widget.guildId,
            body: GuildVanityUrlUpdateRequest(
              code: JsonNullable<String>.of(code.isEmpty ? null : code),
            ),
          );
      if (!mounted) {
        return;
      }
      setState(() => _savedCode = code);
      ref
          .read(toastProvider.notifier)
          .show(
            FluxerToast(
              message: code.isEmpty
                  ? l10n.guildVanityUrlRemoved
                  : l10n.guildVanityUrlSaved,
              variant: FluxerToastVariant.success,
            ),
          );
    } on Object catch (error, stackTrace) {
      talker.warning('[VanityUrl] Save failed', error, stackTrace);
      if (mounted) {
        setState(() => _error = l10n.guildVanityUrlSaveFailed);
      }
    } finally {
      if (mounted) {
        setState(() => _saving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final int permissions = ref.watch(
      guildSettingsPermissionsProvider(widget.guildId),
    );
    final Guild? guild = ref.watch(guildByIdProvider(widget.guildId)).value;
    if (guild == null ||
        !hasPermission(permissions, Permission.manageGuild) ||
        !hasGuildFeature(guild.features, GuildFeatures.vanityUrl)) {
      return const SizedBox.shrink();
    }
    if (!_loadStarted) {
      _loadStarted = true;
      unawaited(_load());
    }
    final String inviteBase = ref.watch(instanceInviteBaseUrlProvider);
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: layout.s3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(l10n.guildVanityUrlTitle, style: context.textStyles.label),
          SizedBox(height: layout.s1),
          Text(
            l10n.guildVanityUrlDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          SizedBox(height: layout.s2),
          FluxerInput(
            controller: _controller,
            hint: l10n.guildVanityUrlHint,
            errorText: _error,
            maxLength: _kVanityMaxLength,
            helperText: _savedCode.isEmpty
                ? null
                : '${GuildInvitesUtils.buildInviteUrl(inviteBaseUrl: inviteBase, code: _savedCode)} · ${l10n.guildVanityUrlUses(_uses)}',
            trailing: Padding(
              padding: EdgeInsets.all(layout.s1),
              child: FluxerButton.primary(
                fitContent: true,
                size: FluxerButtonSize.compact,
                isLoading: _saving || _loading,
                label: l10n.guildVanityUrlSave,
                onPressed: _saving || _loading
                    ? null
                    : () => unawaited(_save(l10n)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
