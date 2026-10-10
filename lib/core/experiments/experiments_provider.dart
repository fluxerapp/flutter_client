import 'dart:async';
import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:fluxer_app/features/voice/utils/voice_p2p_mode.dart';
import 'package:fluxer_dart/export.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experiments_provider.g.dart';

const Duration _kDefaultExperimentsPollInterval = Duration(seconds: 300);

@Riverpod(keepAlive: true)
class Experiments extends _$Experiments {
  final Random _random = Random();
  Timer? _pollTimer;
  int _generation = 0;
  Duration _pollInterval = _kDefaultExperimentsPollInterval;

  @override
  ExperimentAssignmentsResponseAssignments? build() {
    final String? userId = ref.watch(currentUserIdProvider);
    final int generation = ++_generation;
    ref.onDispose(_cancelPoll);
    if (userId != null) {
      unawaited(_refresh(generation));
    }
    return null;
  }

  Future<void> _refresh(int generation) async {
    try {
      final ExperimentAssignmentsResponse response = await ref
          .read(fluxerClientProvider)
          .experiments
          .getExperiments();
      if (!ref.mounted || generation != _generation) {
        return;
      }
      state = response.assignments;
      _pollInterval = Duration(seconds: response.pollIntervalSeconds);
      _schedule(
        generation,
        _withJitter(_pollInterval, response.pollJitterPercent),
      );
    } on Object catch (e) {
      if (!ref.mounted || generation != _generation) {
        return;
      }
      talker.warning('[Experiments] Fetch failed: $e');
      _schedule(generation, _pollInterval);
    }
  }

  Duration _withJitter(Duration interval, int jitterPercent) {
    final double factor =
        1 + (jitterPercent / 100) * (_random.nextDouble() * 2 - 1);
    return interval * factor;
  }

  void _schedule(int generation, Duration delay) {
    _cancelPoll();
    _pollTimer = Timer(delay, () => unawaited(_refresh(generation)));
  }

  void _cancelPoll() {
    _pollTimer?.cancel();
    _pollTimer = null;
  }
}

@riverpod
bool voiceP2pEnabled(Ref ref) {
  return ref.watch(
    experimentsProvider.select(
      (ExperimentAssignmentsResponseAssignments? assignments) =>
          assignments?.voiceP2p?.enabled ?? false,
    ),
  );
}

@riverpod
int voiceP2pMaxParticipants(Ref ref) {
  return ref.watch(
    experimentsProvider.select(
      (ExperimentAssignmentsResponseAssignments? assignments) =>
          assignments?.voiceP2p?.maxParticipants ??
          kVoiceP2pDefaultMaxParticipants,
    ),
  );
}
