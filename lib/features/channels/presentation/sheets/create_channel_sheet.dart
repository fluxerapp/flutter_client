import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/modal/fluxer_modal.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';

const int kDefaultVoiceConnectionLimit = 5;

class CreateChannelSheet {
  CreateChannelSheet._();

  static bool isValidUrl(String url) {
    if (url.isEmpty) {
      return false;
    }
    final Uri? uri = Uri.tryParse(url);
    return uri != null && uri.hasScheme && uri.hasAuthority;
  }

  static ChannelCreateRequest buildRequest({
    required String name,
    required int selectedType,
    required String url,
    String? parentId,
  }) {
    return switch (selectedType) {
      2 => ChannelCreateRequest2(
        name: name,
        type: GuildVoiceChannelCreateRequestTypeType.guildVoice,
        topic: null,
        url: null,
        parentId: parentId,
        bitrate: 64000,
        userLimit: 0,
        voiceConnectionLimit: kDefaultVoiceConnectionLimit,
        permissionOverwrites: [],
        rateLimitPerUser: null,
        nsfw: false,
        nsfwOverride: null,
        contentWarningLevel: ContentWarningLevel.inherit,
        contentWarningText: null,
      ),
      998 => ChannelCreateRequest998(
        name: name,
        type: GuildLinkChannelCreateRequestTypeType.guildLink,
        topic: null,
        url: url.trim(),
        parentId: parentId,
        bitrate: null,
        userLimit: null,
        voiceConnectionLimit: null,
        permissionOverwrites: [],
        rateLimitPerUser: null,
        nsfw: false,
        nsfwOverride: null,
        contentWarningLevel: ContentWarningLevel.inherit,
        contentWarningText: null,
      ),
      _ => ChannelCreateRequest0(
        name: name,
        type: GuildTextChannelCreateRequestTypeType.guildText,
        topic: null,
        url: null,
        parentId: parentId,
        bitrate: null,
        userLimit: null,
        voiceConnectionLimit: null,
        permissionOverwrites: [],
        rateLimitPerUser: null,
        nsfw: false,
        nsfwOverride: null,
        contentWarningLevel: ContentWarningLevel.inherit,
        contentWarningText: null,
      ),
    };
  }

  static Future<ChannelCreateRequest?> show(
    BuildContext context, {
    String? parentId,
  }) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    var currentName = '';
    var currentUrl = '';
    var selectedType = ChannelType.guildText.wireValue;
    final ValueNotifier<bool> formValid = ValueNotifier<bool>(false);

    void updateValidity() {
      final bool nameOk = currentName.trim().isNotEmpty;
      final bool urlOk =
          selectedType != ChannelType.guildLink.wireValue ||
          isValidUrl(currentUrl);
      formValid.value = nameOk && urlOk;
    }

    return FluxerModal.show<ChannelCreateRequest>(
      context,
      title: l10n.guildNavbarCreateChannel,
      builder: (BuildContext dialogContext, VoidCallback close) {
        final layout = dialogContext.layout;
        return StatefulBuilder(
          builder:
              (
                BuildContext stfContext,
                void Function(void Function()) setModalState,
              ) {
                final colors = stfContext.colors;
                final textStyles = stfContext.textStyles;
                return Semantics(
                  label: l10n.guildNavbarChannelTypeSelection,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: layout.s2),
                        child: Text(
                          l10n.guildNavbarChannelType,
                          style: textStyles.label.copyWith(
                            color: colors.textPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      FluxerRadioGroup<int>(
                        value: selectedType,
                        onChanged: (int value) {
                          setModalState(() => selectedType = value);
                          updateValidity();
                        },
                        items: <FluxerRadioItem<int>>[
                          FluxerRadioItem<int>(
                            value: ChannelType.guildText.wireValue,
                            label: l10n.guildNavbarTextChannel,
                            description: l10n.guildNavbarTextChannelDescription,
                          ),
                          FluxerRadioItem<int>(
                            value: ChannelType.guildVoice.wireValue,
                            label: l10n.guildNavbarVoiceChannel,
                            description:
                                l10n.guildNavbarVoiceChannelDescription,
                          ),
                          FluxerRadioItem<int>(
                            value: ChannelType.guildLink.wireValue,
                            label: l10n.guildNavbarLinkChannel,
                            description: l10n.guildNavbarLinkChannelDescription,
                          ),
                        ],
                      ),
                      SizedBox(height: layout.s4),
                      FluxerInput(
                        label: l10n.guildNavbarNameLabel,
                        hint: l10n.guildNavbarNewChannelHint,
                        maxLength: 100,
                        autofocus: true,
                        onChanged: (String value) {
                          currentName = value;
                          updateValidity();
                        },
                      ),
                      if (isGuildLinkChannelType(selectedType)) ...<Widget>[
                        SizedBox(height: layout.s4),
                        FluxerInput(
                          label: l10n.guildNavbarUrlLabel,
                          hint: l10n.guildNavbarUrlHint,
                          maxLength: 1024,
                          keyboardType: TextInputType.url,
                          onChanged: (String value) {
                            currentUrl = value;
                            updateValidity();
                          },
                        ),
                      ],
                    ],
                  ),
                );
              },
        );
      },
      actions: <Widget>[
        ValueListenableBuilder<bool>(
          valueListenable: formValid,
          builder: (BuildContext _, bool isValid, Widget? _) =>
              FluxerButton.primary(
                onPressed: isValid
                    ? () {
                        Navigator.of(context).pop(
                          buildRequest(
                            name: currentName.trim(),
                            selectedType: selectedType,
                            url: currentUrl,
                            parentId: parentId,
                          ),
                        );
                      }
                    : null,
                label: l10n.guildNavbarCreateChannel,
              ),
        ),
        const SizedBox(height: 8),
        FluxerButton.secondary(
          onPressed: () => Navigator.of(context).pop(),
          label: l10n.cancel,
        ),
      ],
    );
  }
}
