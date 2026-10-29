import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/platform/fluxer_platform.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/chat/presentation/sheets/double_tap_reaction_picker_sheet.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/message_actions/double_tap_reaction_hint.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/preferences/chat_preferences_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/message_ui_preferences_providers.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/user_settings/user_settings_domain_actions.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/external_links/external_link_utils.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class UserMessagesMedia extends ConsumerWidget {
  const UserMessagesMedia({super.key, this.scrollController});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(userSettingsViewModelProvider);
    final notifier = ref.read(userSettingsViewModelProvider.notifier);
    final chat = ref.watch(chatPreferencesProvider);
    final chatNotifier = ref.read(chatPreferencesProvider.notifier);
    final chatInputPrefs = ref.watch(chatInputPreferencesProvider);
    final chatInputPrefsNotifier = ref.read(
      chatInputPreferencesProvider.notifier,
    );
    final doubleTapActionPrefs = ref.watch(doubleTapActionPreferencesProvider);
    final doubleTapActionPrefsNotifier = ref.read(
      doubleTapActionPreferencesProvider.notifier,
    );
    final l10n = FluxerLocalizations.of(context);
    final doubleTapAction =
        doubleTapActionPrefs.action == DoubleTapActionPreference.unspecified
        ? DoubleTapActionPreference.react
        : doubleTapActionPrefs.action;
    final swipeRightToLeftPrefs = ref.watch(
      swipeRightToLeftActionPreferencesProvider,
    );
    final swipeRightToLeftPrefsNotifier = ref.read(
      swipeRightToLeftActionPreferencesProvider.notifier,
    );
    final swipeRightToLeftAction =
        swipeRightToLeftPrefs.action ==
            SwipeRightToLeftActionPreference.unspecified
        ? SwipeRightToLeftActionPreference.reply
        : swipeRightToLeftPrefs.action;

    final mediaSizeItems = [
      FluxerRadioItem(
        value: MediaDimensionSize.small,
        label: l10n.messagesMediaSizeCompactName,
        description: l10n.messagesMediaSizeCompactDescription,
      ),
      FluxerRadioItem(
        value: MediaDimensionSize.large,
        label: l10n.messagesMediaSizeComfortableName,
        description: l10n.messagesMediaSizeComfortableDescription,
      ),
    ];

    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            sectionId: 'display',
            title: l10n.messagesMediaDisplayGroupTitle,
            description: l10n.messagesMediaDisplayGroupDescription,
            isFirst: true,
            children: [
              FluxerSettingsSubsection(
                title: l10n.messagesMediaDisplaySectionTitle,
                description: l10n.messagesMediaDisplaySectionDescription,
                children: [
                  FluxerSettingsSwitchGroup(
                    children: [
                      FluxerSettingsSwitchItem.grouped(
                        label: l10n.messagesMediaDisplayInlineEmbedLabel,
                        value: state.inlineEmbedMedia,
                        onChanged: (value) =>
                            notifier.setInlineEmbedMedia(value: value),
                      ),
                      FluxerSettingsSwitchItem.grouped(
                        label: l10n.messagesMediaDisplayInlineAttachmentLabel(
                          ref.watch(
                            instanceRuntimeConfigProvider.select(
                              (config) => config.productName,
                            ),
                          ),
                        ),
                        value: state.inlineAttachmentMedia,
                        onChanged: (value) =>
                            notifier.setInlineAttachmentMedia(value: value),
                      ),
                    ],
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.messagesMediaLinkPreviewsSectionTitle,
                description: l10n.messagesMediaLinkPreviewsSectionDescription,
                children: [
                  FluxerSettingsSwitchItem(
                    label: l10n.messagesMediaLinkPreviewsToggleLabel,
                    value: state.renderEmbeds,
                    onChanged: (value) =>
                        notifier.setRenderEmbeds(value: value),
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.messagesMediaReactionsSectionTitle,
                description: l10n.messagesMediaReactionsSectionDescription,
                children: [
                  FluxerSettingsSwitchItem(
                    label: l10n.messagesMediaReactionsToggleLabel,
                    value: state.renderReactions,
                    onChanged: (value) =>
                        notifier.setRenderReactions(value: value),
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.messagesMediaSpoilersSectionTitle,
                description: l10n.messagesMediaSpoilersSectionDescription,
                children: [
                  FluxerRadioGroup<RenderSpoilers>(
                    label: l10n.messagesMediaSpoilersRadioLabel,
                    value: state.renderSpoilers,
                    onChanged: notifier.setRenderSpoilers,
                    items: [
                      FluxerRadioItem(
                        value: RenderSpoilers.onClick,
                        label: l10n.messagesMediaSpoilersOnClickName,
                        description:
                            l10n.messagesMediaSpoilersOnClickDescription,
                      ),
                      FluxerRadioItem(
                        value: RenderSpoilers.ifModerator,
                        label: l10n.messagesMediaSpoilersIfModeratorName,
                        description:
                            l10n.messagesMediaSpoilersIfModeratorDescription,
                      ),
                      FluxerRadioItem(
                        value: RenderSpoilers.always,
                        label: l10n.messagesMediaSpoilersAlwaysName,
                        description:
                            l10n.messagesMediaSpoilersAlwaysDescription,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          FluxerSettingsSection(
            sectionId: 'media',
            title: l10n.messagesMediaMediaGroupTitle,
            description: l10n.messagesMediaMediaGroupDescription,
            children: [
              FluxerSettingsSubsection(
                title: l10n.messagesMediaSizeSectionTitle,
                description: l10n.messagesMediaSizeSectionDescription,
                children: [
                  FluxerRadioGroup<MediaDimensionSize>(
                    label: l10n.messagesMediaSizeEmbedLabel,
                    value: chat.embedMediaDimensionSize,
                    onChanged: chatNotifier.setEmbedMediaDimensionSize,
                    items: mediaSizeItems,
                  ),
                  FluxerRadioGroup<MediaDimensionSize>(
                    label: l10n.messagesMediaSizeAttachmentLabel,
                    value: chat.attachmentMediaDimensionSize,
                    onChanged: chatNotifier.setAttachmentMediaDimensionSize,
                    items: mediaSizeItems,
                  ),
                ],
              ),
              FluxerSettingsSubsection(
                title: l10n.messagesMediaGifsSectionTitle,
                description: l10n.messagesMediaGifsSectionDescription,
                children: [
                  FluxerSettingsSwitchItem(
                    label: l10n.messagesMediaGifsAutoSendLabel,
                    value: chat.autoSendKlipyGifs,
                    onChanged: (value) =>
                        chatNotifier.setAutoSendKlipyGifs(value: value),
                  ),
                ],
              ),
              if (isFluxerNativeMobileOs)
                FluxerSettingsSubsection(
                  title: l10n.messagesMediaCameraUploadsSectionTitle,
                  description:
                      l10n.messagesMediaCameraUploadsSectionDescription,
                  children: [
                    FluxerSettingsSwitchItem(
                      label: l10n.messagesMediaCameraUploadsSaveToDeviceLabel,
                      value: chatInputPrefs.saveCameraCapturesToDevice,
                      onChanged: (value) => chatInputPrefsNotifier
                          .setSaveCameraCapturesToDevice(value: value),
                    ),
                  ],
                ),
            ],
          ),
          if (isFluxerNativeMobileOs)
            FluxerSettingsSection(
              sectionId: 'gestures',
              title: l10n.messagesMediaGesturesSectionTitle,
              description: l10n.messagesMediaGesturesSectionDescription,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FluxerRadioGroup<DoubleTapActionPreference>(
                      label: l10n.messagesMediaGesturesDoubleTapActionLabel,
                      value: doubleTapAction,
                      onChanged: doubleTapActionPrefsNotifier.setAction,
                      items: [
                        FluxerRadioItem(
                          value: DoubleTapActionPreference.react,
                          label: l10n
                              .messagesMediaGesturesDoubleTapActionReactName,
                          description: l10n
                              .messagesMediaGesturesDoubleTapActionReactDescription,
                        ),
                        FluxerRadioItem(
                          value: DoubleTapActionPreference.edit,
                          label:
                              l10n.messagesMediaGesturesDoubleTapActionEditName,
                          description: l10n
                              .messagesMediaGesturesDoubleTapActionEditDescription,
                        ),
                        FluxerRadioItem(
                          value: DoubleTapActionPreference.none,
                          label:
                              l10n.messagesMediaGesturesDoubleTapActionNoneName,
                          description: l10n
                              .messagesMediaGesturesDoubleTapActionNoneDescription,
                        ),
                      ],
                    ),
                    if (doubleTapAction == DoubleTapActionPreference.react) ...[
                      SizedBox(height: context.layout.s4),
                      FluxerSettingsAccessoryRow(
                        label: l10n.messagesMediaGesturesReactionLabel,
                        description:
                            l10n.messagesMediaGesturesReactionDescription,
                        onTap: () => unawaited(
                          showDoubleTapReactionPicker(context, ref),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const DoubleTapReactionGlyph(size: 24),
                            SizedBox(width: context.layout.s2),
                            PhosphorIcon(
                              PhosphorIconsBold.caretRight,
                              size: 18,
                              color: context.colors.textPrimaryMuted,
                            ),
                          ],
                        ),
                      ),
                    ],
                    SizedBox(height: context.layout.s4),
                    FluxerRadioGroup<SwipeRightToLeftActionPreference>(
                      label: l10n.messagesMediaGesturesSwipeRightToLeftLabel,
                      value: swipeRightToLeftAction,
                      onChanged: swipeRightToLeftPrefsNotifier.setAction,
                      items: [
                        FluxerRadioItem(
                          value: SwipeRightToLeftActionPreference.reply,
                          label: l10n
                              .messagesMediaGesturesSwipeRightToLeftReplyName,
                          description: l10n
                              .messagesMediaGesturesSwipeRightToLeftReplyDescription,
                        ),
                        FluxerRadioItem(
                          value:
                              SwipeRightToLeftActionPreference.channelDetails,
                          label: l10n
                              .messagesMediaGesturesSwipeRightToLeftChannelDetailsName,
                          description: l10n
                              .messagesMediaGesturesSwipeRightToLeftChannelDetailsDescription,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          FluxerSettingsSection(
            sectionId: 'input',
            title: l10n.messagesMediaInputGroupTitle,
            description: l10n.messagesMediaInputGroupDescription,
            children: [
              FluxerSettingsSubsection(
                title: l10n.messagesMediaAutocompleteSectionTitle,
                description: l10n.messagesMediaAutocompleteSectionDescription,
                children: [
                  FluxerSettingsSwitchGroup(
                    children: [
                      FluxerSettingsSwitchItem.grouped(
                        label: l10n.messagesMediaAutocompleteDefaultEmojisLabel,
                        value: chat.showDefaultEmojisInExpressionAutocomplete,
                        onChanged: (value) => chatNotifier
                            .setShowDefaultEmojisInExpressionAutocomplete(
                              value: value,
                            ),
                      ),
                      FluxerSettingsSwitchItem.grouped(
                        label: l10n.messagesMediaAutocompleteCustomEmojisLabel,
                        value: chat.showCustomEmojisInExpressionAutocomplete,
                        onChanged: (value) => chatNotifier
                            .setShowCustomEmojisInExpressionAutocomplete(
                              value: value,
                            ),
                      ),
                      FluxerSettingsSwitchItem.grouped(
                        label: l10n.messagesMediaAutocompleteStickersLabel,
                        value: chat.showStickersInExpressionAutocomplete,
                        onChanged: (value) => chatNotifier
                            .setShowStickersInExpressionAutocomplete(
                              value: value,
                            ),
                      ),
                      FluxerSettingsSwitchItem.grouped(
                        label: l10n.messagesMediaAutocompleteSavedMediaLabel,
                        value: chat.showMemesInExpressionAutocomplete,
                        onChanged: (value) => chatNotifier
                            .setShowMemesInExpressionAutocomplete(value: value),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.externalLinksSectionTitle,
            description: l10n.externalLinksSectionDescription,
            children: [
              FluxerSettingsSwitchItem(
                label: l10n.externalLinkTrustAllLabel,
                description: trustedDomainsDescription(
                  l10n: l10n,
                  trustAll: state.trustAllDomains,
                  trustedCount: state.trustedDomainsCount,
                ),
                value: state.trustAllDomains,
                onChanged: (value) =>
                    handleTrustAllDomainsChange(context, ref, value: value),
              ),
              FluxerSettingsSwitchItem(
                label: l10n.externalLinkStripTrackingLabel,
                description: l10n.externalLinkStripTrackingDescription,
                value: chat.sanitizeUrls,
                onChanged: (value) =>
                    chatNotifier.setSanitizeUrls(value: value),
              ),
            ],
          ),
          FluxerSettingsSection(
            title: l10n.messagesMediaSidebarGroupTitle,
            description: l10n.messagesMediaSidebarGroupDescription,
            children: [
              FluxerSettingsSwitchItem(
                label: l10n.messagesMediaDefaultHideMutedChannelsLabel,
                description:
                    l10n.messagesMediaDefaultHideMutedChannelsDescription,
                value: state.defaultHideMutedChannels,
                onChanged: (value) => handleDefaultHideMutedChannelsChange(
                  context,
                  ref,
                  value: value,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
