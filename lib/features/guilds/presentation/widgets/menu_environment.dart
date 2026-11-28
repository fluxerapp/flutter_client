import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/settings/providers/preferences/time_format_providers.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/shared/providers/input_modality_provider.dart';

typedef GuildMenuEnvironment = ({
  bool use12Hour,
  bool isTouchPrimary,
  bool canEditCommunityProfile,
  bool isStockCommunity,
  bool directMessagesDisabled,
});

GuildMenuEnvironment readGuildMenuEnvironment(
  ProviderContainer container,
  String guildId,
) {
  final InstanceRuntimeConfig config = container.read(
    instanceRuntimeConfigProvider,
  );
  return (
    use12Hour: container.read(use12HourTimeFormatProvider),
    isTouchPrimary: container.read(inputModalityProvider),
    canEditCommunityProfile: !container
        .read(userSettingsViewModelProvider)
        .isKnownUnclaimed,
    isStockCommunity: config.isStockCommunityGuild(guildId),
    directMessagesDisabled: config.directMessagesDisabled,
  );
}
