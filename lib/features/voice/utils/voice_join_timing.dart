import 'package:fluxer_app/core/talker.dart';

class VoiceJoinTiming {
  VoiceJoinTiming({required this.channelId}) : _startedAt = DateTime.now();

  final String channelId;
  final DateTime _startedAt;
  final Set<String> _marked = <String>{};

  int get elapsedMs => DateTime.now().difference(_startedAt).inMilliseconds;

  void mark(String step) {
    talker.info('[Voice] join $step +${elapsedMs}ms (channelId=$channelId)');
  }

  void markOnce(String step) {
    if (!_marked.add(step)) {
      return;
    }
    mark(step);
  }
}
