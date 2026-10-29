import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance/instance_runtime_config_provider.dart';
import 'package:fluxer_app/features/profile/providers/own_profile_badges_provider.dart';
import 'package:fluxer_app/features/settings/providers/view_models/user_settings_view_model.dart';
import 'package:fluxer_app/features/settings/utils/commerce/operator_pass_utils.dart';
import 'package:fluxer_app/shared/providers/user_profile.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'operator_pass_listing_provider.g.dart';

@riverpod
class OperatorPassListing extends _$OperatorPassListing {
  @override
  Future<OperatorPassListingResponse?> build() async {
    final InstanceRuntimeConfig config = ref.watch(
      instanceRuntimeConfigProvider,
    );
    if (!isOperatorPassAvailable(selfHosted: config.selfHosted)) {
      return null;
    }
    final UserSettingsViewState settings = ref.watch(
      userSettingsViewModelProvider,
    );
    final bool hasBadge = hasOperatorPassProfileBadge(
      settings.operatorPassSince,
    );
    if (!hasBadge) {
      return null;
    }
    return ref.read(fluxerClientProvider).operatorPass.getOperatorPassListing();
  }

  Future<OperatorPassListingResponse> saveListing(
    OperatorPassListingUpdateRequest body,
  ) async {
    final OperatorPassListingResponse result = await ref
        .read(fluxerClientProvider)
        .operatorPass
        .updateOperatorPassListing(body: body);
    state = AsyncData(result);
    await ref.read(currentUserFullProfileProvider.notifier).refresh();
    ref.invalidate(ownProfileBadgesPreviewProvider);
    return result;
  }
}
