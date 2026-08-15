import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/providers/guild_providers.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/guild_ownership_warning_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';

class AccountDeleteSheet extends ConsumerStatefulWidget {
  const AccountDeleteSheet({super.key});

  static Future<void> show(BuildContext context, WidgetRef ref) async {
    final String? userId = ref.read(currentUserIdProvider);
    if (userId != null) {
      final ownedGuilds = await ref
          .read(guildRepositoryProvider)
          .getOwnedGuilds(userId);
      if (ownedGuilds.isNotEmpty) {
        if (!context.mounted) {
          return;
        }
        return GuildOwnershipWarningSheet.show(
          context,
          ownedGuilds: ownedGuilds,
        );
      }
    }
    if (!context.mounted) {
      return;
    }
    return FluxerBottomSheet.show<void>(
      context,
      title: FluxerLocalizations.of(context).dangerZoneDeleteTitle,
      useRootNavigator: true,
      builder: (_, _) => const AccountDeleteSheet(),
    );
  }

  @override
  ConsumerState<AccountDeleteSheet> createState() => _AccountDeleteSheetState();
}

class _AccountDeleteSheetState extends ConsumerState<AccountDeleteSheet> {
  bool _loading = false;
  String? _error;

  Future<void> _handleDelete() async {
    final l10n = FluxerLocalizations.of(context);

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = ref.read(fluxerClientProvider);
      await client.users.deleteCurrentUserAccount(
        body: const SudoVerificationSchema(),
      );

      if (mounted) {
        Navigator.of(context, rootNavigator: true).pop();
      }
    } on DioException catch (e) {
      if (!mounted) {
        return;
      }
      final data = e.response?.data;
      final message = data is Map<String, dynamic>
          ? (data['message'] as String?) ?? l10n.genericError
          : l10n.genericError;
      setState(() {
        _loading = false;
        _error = message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;

    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.dangerZoneDeleteConfirmDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textSecondary,
            ),
          ),
          const SizedBox(height: 16),

          Text(
            l10n.importantInformation,
            style: context.textStyles.categoryName.copyWith(
              color: colors.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          _bullet(context, l10n.dangerZoneDeleteBullet1),
          _bullet(context, l10n.dangerZoneDeleteBullet2),
          _bullet(context, l10n.dangerZoneDeleteBullet3),
          _bullet(context, l10n.dangerZoneDeleteBullet4),
          const SizedBox(height: 16),

          Text(
            l10n.dangerZoneDeleteDisclaimer,
            style: context.textStyles.bodySmall.copyWith(fontSize: 13),
          ),

          if (_error != null) ...[
            SizedBox(height: layout.s3),
            Text(
              _error!,
              style: context.textStyles.bodySmall.copyWith(
                color: colors.statusDanger,
              ),
            ),
          ],
          SizedBox(height: layout.s4),

          Row(
            children: [
              Expanded(
                child: FluxerButton.secondary(
                  onPressed: _loading
                      ? null
                      : () => Navigator.of(context).pop(),
                  label: l10n.cancel,
                  fitContent: true,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FluxerButton.dangerPrimary(
                  onPressed: _loading ? null : _handleDelete,
                  label: l10n.dangerZoneDeleteTitle,
                  isLoading: _loading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bullet(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('  •  ', style: context.textStyles.bodySmall),
          Expanded(
            child: Text(
              text,
              style: context.textStyles.bodySmall.copyWith(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
