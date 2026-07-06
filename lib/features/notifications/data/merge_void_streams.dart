import 'dart:async';

import 'package:fluxer_app/core/database/drift_stream_utils.dart';

Stream<void> mergeVoidStreams(List<Stream<dynamic>> streams) {
  final List<StreamSubscription<dynamic>> subscriptions = [];
  late final StreamController<void> controller;
  controller = StreamController<void>.broadcast(
    onListen: () {
      void pulse() {
        if (!controller.isClosed) {
          controller.add(null);
        }
      }

      pulse();
      for (final Stream<dynamic> stream in streams) {
        subscriptions.add(
          stream.listen(
            (_) => pulse(),
            onError: (Object error, StackTrace stackTrace) {
              if (isDriftCancellation(error)) {
                return;
              }
              if (!controller.isClosed) {
                controller.addError(error, stackTrace);
              }
            },
          ),
        );
      }
    },
    onCancel: () async {
      for (final StreamSubscription<dynamic> sub in subscriptions) {
        await sub.cancel();
      }
      subscriptions.clear();
      if (!controller.isClosed) {
        await controller.close();
      }
    },
  );

  return controller.stream;
}
