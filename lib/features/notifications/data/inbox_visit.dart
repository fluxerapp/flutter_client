const Duration kInboxVisitStaleAfter = Duration(minutes: 5);

class InboxVisit {
  InboxVisit({DateTime Function()? clock}) : _clock = clock ?? DateTime.now;

  final DateTime Function() _clock;
  DateTime? _leftAt;
  bool _visiting = false;
  bool _started = false;

  bool get visiting => _visiting;

  bool enter() {
    if (_visiting) {
      return false;
    }
    _visiting = true;
    final DateTime? leftAt = _leftAt;
    final bool fresh =
        !_started ||
        (leftAt != null &&
            _clock().difference(leftAt) >= kInboxVisitStaleAfter);
    _started = true;
    return fresh;
  }

  void leave() {
    if (!_visiting) {
      return;
    }
    _visiting = false;
    _leftAt = _clock();
  }

  void renew() {
    _started = true;
    _leftAt = _visiting ? null : _clock();
  }
}
