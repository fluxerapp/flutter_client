import 'dart:async';

import 'package:cached_network_image_ce/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/media/fluxer_media_url.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_color_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/sheets/application_create_sheet.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/applications/application_detail.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/applications_view_model.dart';
import 'package:fluxer_app/features/settings/providers/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/oauth_authorize_url.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/snowflake_time.dart';
import 'package:fluxer_app/shared/utils/user_date_formatting.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserApplications extends ConsumerWidget {
  const UserApplications({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ApplicationsViewState state = ref.watch(
      applicationsViewModelProvider,
    );
    if (state.isDetailView) {
      return ApplicationDetail(
        scrollController: scrollController,
        onBack: ref.read(applicationsViewModelProvider.notifier).closeDetail,
      );
    }
    return _ApplicationsList(scrollController: scrollController, state: state);
  }
}

class _ApplicationsList extends ConsumerWidget {
  const _ApplicationsList({required this.state, this.scrollController});

  final ApplicationsViewState state;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final colors = context.colors;
    final Widget body;
    if (state.isLoading) {
      body = const Center(child: FluxerLoadingSpinner());
    } else if (state.error != null) {
      body = Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PhosphorIcon(
            PhosphorIconsFill.networkSlash,
            size: 48,
            color: colors.textPrimaryMuted,
          ),
          SizedBox(height: layout.s3),
          Text(
            l10n.applicationsLoadError,
            style: context.textStyles.heading.copyWith(
              color: colors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s1),
          Text(
            l10n.applicationsLoadErrorDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s4),
          FluxerButton.primary(
            label: l10n.retry,
            onPressedAsync: ref
                .read(applicationsViewModelProvider.notifier)
                .load,
          ),
        ],
      );
    } else {
      body = FluxerSettingsSection(
        title: l10n.applicationsTitle,
        isFirst: true,
        sectionId: 'applications-list',
        density: FluxerSettingsSectionDensity.compact,
        children: [
          _CreateAndDocsRow(),
          if (state.applications.isEmpty)
            _EmptyState(
              apiName:
                  '${ref.watch(instanceRuntimeConfigProvider.select((config) => config.productName))} API',
            )
          else
            for (final ApplicationResponse app in state.applications)
              _ApplicationRow(
                application: app,
                onTap: () => unawaited(
                  ref
                      .read(applicationsViewModelProvider.notifier)
                      .openDetail(app.id),
                ),
              ),
        ],
      );
    }

    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 1),
        child: body,
      ),
    );
  }
}

class _CreateAndDocsRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final bool unclaimed = ref.watch(
      userSettingsViewModelProvider.select((s) => s.isKnownUnclaimed),
    );
    final Widget createButton = FluxerButton.primary(
      label: l10n.applicationsCreate,
      fitContent: true,
      onPressed: unclaimed
          ? null
          : () => unawaited(ApplicationCreateSheet.show(context)),
    );

    return Wrap(
      spacing: layout.s4,
      runSpacing: layout.s2,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        if (unclaimed)
          FluxerTooltip(
            message: l10n.applicationsCreateClaimTooltip,
            child: createButton,
          )
        else
          createButton,
        FluxerTextLink(
          text: l10n.applicationsDocsLink(kApplicationDocsDomain),
          url: kApplicationDocsUrl,
        ),
      ],
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState({required this.apiName});

  final String apiName;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: layout.s4),
      child: Column(
        children: [
          PhosphorIcon(
            PhosphorIconsFill.appWindow,
            size: 48,
            color: context.colors.textPrimaryMuted,
          ),
          SizedBox(height: layout.s3),
          Text(
            l10n.applicationsEmptyTitle,
            style: context.textStyles.heading.copyWith(
              color: context.colors.textPrimary,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: layout.s1),
          Text(
            l10n.applicationsEmptyDescription(apiName),
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textPrimaryMuted,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ApplicationRow extends StatelessWidget {
  const _ApplicationRow({required this.application, required this.onTap});

  final ApplicationResponse application;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final layout = context.layout;
    final String created = formatUserMediumDate(
      dateTimeFromSnowflakeAsLocalOrNow(application.id),
      l10n.localeName,
    );
    final String? avatarUrl = FluxerMediaUrl.userAvatar(
      userId: application.bot?.id ?? application.id,
      hash: application.bot?.avatar,
    );
    final String letter = application.name.isNotEmpty
        ? application.name[0].toUpperCase()
        : '?';

    return Material(
      color: colors.backgroundTertiary,
      shape: RoundedRectangleBorder(
        borderRadius: layout.radiusLg,
        side: BorderSide(color: colors.borderColor),
      ),
      clipBehavior: Clip.antiAlias,
      child: FluxerTappable(
        onTap: onTap,
        builder: (_, _) => Padding(
          padding: EdgeInsets.symmetric(
            horizontal: layout.s3,
            vertical: layout.s3,
          ),
          child: Row(
            children: [
              _Avatar(url: avatarUrl, letter: letter, colors: colors),
              SizedBox(width: layout.s2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      application.name,
                      style: context.textStyles.bodySmall.copyWith(
                        color: colors.textPrimary,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: layout.s1 / 2),
                    Text(
                      l10n.applicationsCreated(created),
                      style: context.textStyles.bodySmall.copyWith(
                        color: colors.textPrimaryMuted,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              PhosphorIcon(
                PhosphorIconsBold.caretRight,
                size: 16,
                color: colors.textTertiary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar({
    required this.url,
    required this.letter,
    required this.colors,
  });

  final String? url;
  final String letter;
  final FluxerColorTheme colors;

  @override
  Widget build(BuildContext context) {
    final Widget placeholder = ColoredBox(
      color: colors.backgroundModifierHover,
      child: Center(
        child: Text(
          letter,
          style: TextStyle(
            color: colors.textPrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
    return ClipOval(
      child: SizedBox(
        width: 32,
        height: 32,
        child: url == null
            ? placeholder
            : CachedNetworkImage(
                imageUrl: url!,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => placeholder,
              ),
      ),
    );
  }
}
