import 'dart:async';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/limits/instance_limit_provider.dart';
import 'package:fluxer_app/core/limits/limit_key.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/guilds/domain/guild.dart';
import 'package:fluxer_app/features/guilds/providers/guild_list_view_model.dart';
import 'package:fluxer_app/features/settings/providers/preferences/entrance_sound_library_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/features/voice/utils/audio/entrance_sound_playback.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class VoiceEntranceSoundSection extends ConsumerStatefulWidget {
  const VoiceEntranceSoundSection({super.key});

  @override
  ConsumerState<VoiceEntranceSoundSection> createState() =>
      _VoiceEntranceSoundSectionState();
}

class _VoiceEntranceSoundSectionState
    extends ConsumerState<VoiceEntranceSoundSection> {
  final EntranceSoundPlayer _player = EntranceSoundPlayer();
  String _scopeId = kEntranceSoundGlobalScope;
  bool _uploading = false;

  @override
  void dispose() {
    unawaited(_player.dispose());
    super.dispose();
  }

  void _toast(String message, FluxerToastVariant variant) {
    ref
        .read(toastProvider.notifier)
        .show(FluxerToast(message: message, variant: variant));
  }

  Future<void> _upload(FluxerLocalizations l10n) async {
    final PlatformFile? file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: kEntranceSoundExtensions,
    );
    if (file == null || !mounted) {
      return;
    }
    final Uint8List bytes = await file.readAsBytes();
    if (bytes.length > kEntranceSoundMaxBytes) {
      _toast(l10n.entranceSoundTooLarge, FluxerToastVariant.danger);
      return;
    }
    setState(() => _uploading = true);
    final EntranceSoundLibrary notifier = ref.read(
      entranceSoundLibraryProvider.notifier,
    );
    try {
      final String name = file.name.contains('.')
          ? file.name.substring(0, file.name.lastIndexOf('.'))
          : file.name;
      final EntranceSoundResponse sound = await notifier.upload(
        name: name.isEmpty ? file.name : name,
        bytes: bytes,
      );
      await notifier.select(scopeId: _scopeId, soundId: sound.id);
    } on Object catch (error, stackTrace) {
      talker.warning('[EntranceSound] Upload failed', error, stackTrace);
      _toast(l10n.entranceSoundUploadFailed, FluxerToastVariant.danger);
    } finally {
      if (mounted) {
        setState(() => _uploading = false);
      }
    }
  }

  Future<void> _run(
    FluxerLocalizations l10n,
    Future<void> Function() action,
  ) async {
    try {
      await action();
    } on Object catch (error, stackTrace) {
      talker.warning('[EntranceSound] Update failed', error, stackTrace);
      _toast(l10n.entranceSoundUpdateFailed, FluxerToastVariant.danger);
    }
  }

  List<FluxerSelectItem<String>> _scopeItems(
    FluxerLocalizations l10n,
    List<Guild> guilds,
  ) {
    return <FluxerSelectItem<String>>[
      FluxerSelectItem<String>(
        value: kEntranceSoundGlobalScope,
        label: l10n.entranceSoundScopeGlobal,
        description: l10n.entranceSoundScopeGlobalDescription,
      ),
      FluxerSelectItem<String>(
        value: kEntranceSoundGuildsScope,
        label: l10n.entranceSoundScopeGuilds,
        description: l10n.entranceSoundScopeGuildsDescription,
      ),
      FluxerSelectItem<String>(
        value: kEntranceSoundDmsScope,
        label: l10n.entranceSoundScopeDms,
        description: l10n.entranceSoundScopeDmsDescription,
      ),
      for (final Guild guild in guilds)
        FluxerSelectItem<String>(
          value: entranceSoundGuildScope(guild.id),
          label: guild.name,
          description: l10n.entranceSoundScopeGuildDescription,
        ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final bool enabled = ref.watch(
      instanceFeatureEnabledProvider(LimitKeys.featureVoiceEntranceSounds),
    );
    if (!enabled) {
      return Text(
        l10n.entranceSoundUnavailable,
        style: context.textStyles.bodyMedium.copyWith(
          color: context.colors.textSecondary,
        ),
      );
    }
    final AsyncValue<EntranceSoundLibraryState> library = ref.watch(
      entranceSoundLibraryProvider,
    );
    final List<Guild> guilds =
        ref.watch(guildListViewModelProvider).guilds.toList()..sort(
          (Guild a, Guild b) =>
              a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
    final layout = context.layout;
    return library.when(
      loading: () => const Center(child: FluxerLoadingSpinner()),
      error: (Object error, StackTrace stackTrace) => Text(
        l10n.entranceSoundLoadFailed,
        style: context.textStyles.bodyMedium.copyWith(
          color: context.colors.textDanger,
        ),
      ),
      data: (EntranceSoundLibraryState data) {
        final EntranceSoundLibrary notifier = ref.read(
          entranceSoundLibraryProvider.notifier,
        );
        final String? selected = data.selectionFor(_scopeId);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            FluxerSelect<String>(
              label: l10n.entranceSoundAppliesTo,
              value: _scopeId,
              items: _scopeItems(l10n, guilds),
              onChanged: (String value) => setState(() => _scopeId = value),
            ),
            SizedBox(height: layout.s3),
            FluxerRadioGroup<String>(
              value: selected ?? '',
              onChanged: (String value) => unawaited(
                _run(
                  l10n,
                  () => notifier.select(
                    scopeId: _scopeId,
                    soundId: value.isEmpty ? null : value,
                  ),
                ),
              ),
              items: <FluxerRadioItem<String>>[
                FluxerRadioItem<String>(
                  value: '',
                  label: l10n.entranceSoundNone,
                ),
                for (final EntranceSoundResponse sound in data.sounds)
                  FluxerRadioItem<String>(
                    value: sound.id,
                    label: sound.name,
                    description: l10n.entranceSoundDuration(
                      (sound.durationMs / 1000).toStringAsFixed(1),
                    ),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        FluxerButton.ghost(
                          size: FluxerButtonSize.superCompact,
                          isSquare: true,
                          icon: PhosphorIconsFill.play,
                          semanticLabel: l10n.entranceSoundPreview,
                          onPressed: () =>
                              unawaited(_player.play(url: sound.url)),
                        ),
                        FluxerButton.ghost(
                          size: FluxerButtonSize.superCompact,
                          isSquare: true,
                          icon: PhosphorIconsBold.trash,
                          semanticLabel: l10n.entranceSoundDelete,
                          onPressed: () => unawaited(
                            _run(l10n, () => notifier.delete(sound.id)),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(height: layout.s3),
            Align(
              alignment: Alignment.centerLeft,
              child: FluxerButton.secondary(
                size: FluxerButtonSize.compact,
                fitContent: true,
                icon: PhosphorIconsBold.uploadSimple,
                isLoading: _uploading,
                label: l10n.entranceSoundUpload,
                onPressed: data.sounds.length >= kEntranceSoundMaxPerUser
                    ? null
                    : () => unawaited(_upload(l10n)),
              ),
            ),
            SizedBox(height: layout.s2),
            Text(
              l10n.entranceSoundLibraryCount(
                data.sounds.length,
                kEntranceSoundMaxPerUser,
              ),
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textTertiary,
              ),
            ),
          ],
        );
      },
    );
  }
}
