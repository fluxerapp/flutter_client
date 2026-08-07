import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_settings_tab.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/guild/guild_settings_access_gate.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/settings/fluxer_settings_sheet.dart'
    show FluxerSettingsSheet;
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/ui.dart' show FluxerSettingsSheet;
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

Color guildSettingsPageBackgroundColor(BuildContext context) {
  if (isMobileLayout(context)) {
    return context.colors.backgroundSecondary;
  }
  return context.colors.backgroundPrimary;
}

class GuildSettingsPageShell extends StatelessWidget {
  const GuildSettingsPageShell({
    required this.guildId,
    required this.tab,
    required this.body,
    super.key,
    this.actions = const <Widget>[],
  });

  final String guildId;
  final GuildSettingsTab tab;
  final Widget body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool isMobile = isMobileLayout(context);
    final Color backgroundColor = guildSettingsPageBackgroundColor(context);
    final Color appBarColor = isMobile
        ? backgroundColor
        : context.colors.backgroundSecondary;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const PhosphorIcon(PhosphorIconsBold.arrowLeft),
          onPressed: () => context.pop(),
        ),
        title: Text(guildSettingsTabTitle(l10n, tab)),
        actions: <Widget>[...actions],
      ),
      body: GuildSettingsAccessGate(guildId: guildId, tab: tab, child: body),
    );
  }
}

class GuildSettingsAsyncBody<T> extends StatelessWidget {
  const GuildSettingsAsyncBody({
    required this.value,
    required this.data,
    super.key,
    this.scrollController,
    this.usesSettingsSheet = false,
  });

  final AsyncValue<T> value;
  // Generic callback is safe here; T is only used in covariant positions.
  // ignore: unsafe_variance
  final Widget Function(T data) data;
  final ScrollController? scrollController;

  /// When true, the child manages its own scroll view inside [FluxerSettingsSheet]
  /// and must not be wrapped in an outer [SingleChildScrollView].
  final bool usesSettingsSheet;

  @override
  Widget build(BuildContext context) {
    final layout = context.layout;
    return value.when(
      loading: () => const Center(child: FluxerLoadingSpinner()),
      error: (Object error, StackTrace stackTrace) => Center(
        child: Padding(
          padding: EdgeInsets.all(layout.s4),
          child: Text(
            error.toString(),
            style: context.textStyles.bodyMedium.copyWith(
              color: context.colors.statusDanger,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      data: (T item) => _buildChild(context, item),
    );
  }

  Widget _buildChild(BuildContext context, T item) {
    final layout = context.layout;
    final Widget content = data(item);
    if (usesSettingsSheet) {
      if (isWideLayout(context)) {
        return WideSettingsContentLayout(child: content);
      }
      return content;
    }
    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: content,
    );
  }
}

String guildSettingsTabTitle(FluxerLocalizations l10n, GuildSettingsTab tab) {
  return switch (tab) {
    GuildSettingsTab.overview => l10n.guildMenuSettingsGeneral,
    GuildSettingsTab.roles => l10n.guildMenuSettingsRoles,
    GuildSettingsTab.emoji => l10n.guildMenuSettingsEmoji,
    GuildSettingsTab.stickers => l10n.guildMenuSettingsStickers,
    GuildSettingsTab.moderation => l10n.guildMenuSettingsSafetyModeration,
    GuildSettingsTab.auditLog => l10n.guildMenuSettingsActivityLog,
    GuildSettingsTab.webhooks => l10n.guildMenuSettingsWebhooks,
    GuildSettingsTab.discovery => l10n.guildMenuSettingsDiscovery,
    GuildSettingsTab.members => l10n.guildMenuSettingsMembers,
    GuildSettingsTab.invites => l10n.guildMenuSettingsInviteLinks,
    GuildSettingsTab.bans => l10n.guildMenuSettingsBans,
    GuildSettingsTab.channels => l10n.guildMenuSettingsChannels,
  };
}

IconData guildSettingsTabIcon(GuildSettingsTab tab) {
  return switch (tab) {
    GuildSettingsTab.overview => PhosphorIconsFill.gear,
    GuildSettingsTab.roles => PhosphorIconsFill.shield,
    GuildSettingsTab.emoji => PhosphorIconsFill.smiley,
    GuildSettingsTab.stickers => PhosphorIconsFill.sticker,
    GuildSettingsTab.moderation => PhosphorIconsFill.hammer,
    GuildSettingsTab.auditLog => PhosphorIconsFill.bookOpen,
    GuildSettingsTab.webhooks => PhosphorIconsFill.webhooksLogo,
    GuildSettingsTab.discovery => PhosphorIconsFill.compass,
    GuildSettingsTab.members => PhosphorIconsFill.users,
    GuildSettingsTab.invites => PhosphorIconsFill.ticket,
    GuildSettingsTab.bans => PhosphorIconsFill.prohibit,
    GuildSettingsTab.channels => PhosphorIconsBold.hash,
  };
}
