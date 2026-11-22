import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'operator_pass_settings_provider.g.dart';

typedef OperatorPassSettingsData = ({
  OperatorPassPassesResponse passes,
  OperatorPassListingResponse? listing,
});

@riverpod
Future<OperatorPassSettingsData?> operatorPassSettings(Ref ref) async {
  final OperatorPassApi api = ref.watch(fluxerClientProvider).operatorPass;
  final OperatorPassPassesResponse passes = await api.listOperatorPasses();
  if (passes.count <= 0) {
    return null;
  }
  OperatorPassListingResponse? listing;
  try {
    listing = await api.getOperatorPassListing();
  } on Object catch (error, stackTrace) {
    talker.debug('[OperatorPass] Listing unavailable', error, stackTrace);
  }
  return (passes: passes, listing: listing);
}
