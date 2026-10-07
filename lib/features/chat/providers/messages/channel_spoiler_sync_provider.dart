import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/misc.dart' show ProviderFamily;
import 'package:fluxer_markdown/fluxer_markdown.dart';

final ProviderFamily<FluxerSpoilerSyncController, String>
channelSpoilerSyncProvider = Provider.autoDispose
    .family<FluxerSpoilerSyncController, String>((Ref ref, String _) {
      final FluxerSpoilerSyncController controller =
          FluxerSpoilerSyncController();
      ref.onDispose(controller.dispose);
      return controller;
    });
