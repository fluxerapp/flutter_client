import 'package:flutter/foundation.dart';
import 'package:fluxer_app/features/voice/domain/screen_share_source.dart';

enum ScreenShareSourcesStatus { loading, ready, failed }

@immutable
class ScreenShareSourcesState {
  const ScreenShareSourcesState({
    this.status = ScreenShareSourcesStatus.loading,
    this.sources = const <ScreenShareSource>[],
  });

  final ScreenShareSourcesStatus status;
  final List<ScreenShareSource> sources;

  List<ScreenShareSource> of(ScreenShareSourceKind kind) => <ScreenShareSource>[
    for (final ScreenShareSource source in sources)
      if (source.kind == kind) source,
  ];

  ScreenShareSourcesState copyWith({
    ScreenShareSourcesStatus? status,
    List<ScreenShareSource>? sources,
  }) {
    return ScreenShareSourcesState(
      status: status ?? this.status,
      sources: sources ?? this.sources,
    );
  }
}
