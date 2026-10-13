import 'dart:async';

import 'package:fluxer_app/features/notifications/data/inbox_visit.dart';
import 'package:fluxer_app/features/notifications/data/unread_inbox_card_cache.dart';
import 'package:fluxer_app/features/notifications/domain/unread_inbox_entry.dart';
import 'package:fluxer_app/material_ui.dart';

const int kUnreadInboxPageSize = 10;
const Duration kUnreadInboxRefillCooldown = Duration(seconds: 10);

typedef UnreadInboxCardLoader =
    Future<UnreadInboxCardData> Function(UnreadInboxEntry entry);

class UnreadInboxRow {
  const UnreadInboxRow({
    required this.entry,
    required this.data,
    required this.collapsed,
    required this.read,
  });

  final UnreadInboxEntry entry;
  final UnreadInboxCardData data;
  final bool collapsed;
  final bool read;

  String get channelId => entry.channelId;

  UnreadInboxRow copyWith({bool? collapsed, bool? read}) => UnreadInboxRow(
    entry: entry,
    data: data,
    collapsed: collapsed ?? this.collapsed,
    read: read ?? this.read,
  );
}

class UnreadInboxView extends ChangeNotifier {
  UnreadInboxView({required this._loadCard, InboxVisit? visit})
    : _visit = visit ?? InboxVisit();

  final UnreadInboxCardLoader _loadCard;
  final InboxVisit _visit;

  List<UnreadInboxEntry>? _live;
  List<UnreadInboxEntry> _frozen = const <UnreadInboxEntry>[];
  int _attempted = 0;
  List<UnreadInboxRow> _rows = const <UnreadInboxRow>[];
  bool _loaded = false;
  bool _loadingMore = false;
  bool _freezing = false;
  Object? _error;
  bool _failed = false;
  Object? _lastError;
  int _generation = 0;
  DateTime _shownAt = DateTime.now();
  bool _shownRows = false;
  bool _disposed = false;
  Timer? _awayTimer;
  Timer? _refillTimer;

  List<UnreadInboxRow> get rows => _rows;
  bool get loaded => _loaded;
  bool get loadingMore => _loadingMore;
  bool get hasMore => _attempted < _frozen.length;
  Object? get error => _error;

  void updateLive(List<UnreadInboxEntry> live) {
    final bool first = _live == null;
    _live = live;
    if (first && _visit.visiting) {
      unawaited(_freeze());
      return;
    }
    _applyLive();
    _maybeRefill();
  }

  void enter() {
    _awayTimer?.cancel();
    final bool fresh = _visit.enter();
    if (_live == null) {
      return;
    }
    if (fresh || (_loaded && _rows.isEmpty)) {
      unawaited(_freeze());
    }
  }

  void leave() {
    if (!_visit.visiting) {
      return;
    }
    _visit.leave();
    _refillTimer?.cancel();
    _awayTimer?.cancel();
    _awayTimer = Timer.periodic(kInboxVisitStaleAfter, (_) {
      if (_live != null && !_visit.visiting) {
        _visit.renew();
        unawaited(_freeze());
      }
    });
  }

  Future<void> refresh(List<UnreadInboxEntry> live) {
    _live = live;
    _visit.renew();
    return _freeze();
  }

  Future<void> loadMore() async {
    if (!_loaded || _loadingMore || _freezing || !hasMore) {
      return;
    }
    final int generation = _generation;
    _loadingMore = true;
    _notify();
    final List<UnreadInboxRow> more = await _loadPage(generation);
    if (generation != _generation) {
      return;
    }
    _loadingMore = false;
    _rows = <UnreadInboxRow>[..._rows, ...more];
    _notify();
  }

  void setCollapsed(String channelId, {required bool collapsed}) {
    _rows = _rows
        .map(
          (UnreadInboxRow row) => row.channelId == channelId
              ? row.copyWith(collapsed: collapsed)
              : row,
        )
        .toList();
    _notify();
  }

  void dismiss(String channelId) {
    _rows = _rows
        .where((UnreadInboxRow row) => row.channelId != channelId)
        .toList();
    _notify();
    _maybeRefill();
  }

  Future<void> _freeze() async {
    final List<UnreadInboxEntry>? live = _live;
    if (live == null) {
      return;
    }
    final int generation = ++_generation;
    _freezing = true;
    _loadingMore = false;
    _refillTimer?.cancel();
    final List<UnreadInboxEntry> frozen = _groupByGuild(live);
    final List<UnreadInboxEntry> previousFrozen = _frozen;
    final int previousAttempted = _attempted;
    _frozen = frozen;
    _attempted = 0;
    final List<UnreadInboxRow> rows = await _loadPage(generation);
    if (generation != _generation) {
      return;
    }
    _freezing = false;
    if (rows.isEmpty && _failed) {
      _frozen = previousFrozen;
      _attempted = previousAttempted;
      if (!_loaded || _rows.isEmpty) {
        _error = _lastError;
        _loaded = true;
      }
      _notify();
      return;
    }
    _error = null;
    _rows = rows;
    _loaded = true;
    _shownAt = DateTime.now();
    _shownRows = rows.isNotEmpty;
    _applyLive(notify: false);
    _notify();
  }

  Future<List<UnreadInboxRow>> _loadPage(int generation) async {
    _failed = false;
    final List<UnreadInboxRow> page = <UnreadInboxRow>[];
    while (page.length < kUnreadInboxPageSize && hasMore) {
      final int end = (_attempted + kUnreadInboxPageSize).clamp(
        0,
        _frozen.length,
      );
      final List<UnreadInboxEntry> batch = _frozen.sublist(_attempted, end);
      _attempted = end;
      final List<UnreadInboxCardData?> loaded = await Future.wait(
        batch.map(_tryLoad),
      );
      if (generation != _generation) {
        return const <UnreadInboxRow>[];
      }
      for (int i = 0; i < batch.length; i++) {
        final UnreadInboxCardData? data = loaded[i];
        if (data == null || data.messages.isEmpty) {
          continue;
        }
        page.add(
          UnreadInboxRow(
            entry: batch[i],
            data: data,
            collapsed: batch[i].isCollapsed,
            read: false,
          ),
        );
      }
    }
    return page;
  }

  Future<UnreadInboxCardData?> _tryLoad(UnreadInboxEntry entry) async {
    try {
      return await _loadCard(entry);
    } on Object catch (error) {
      _failed = true;
      _lastError = error;
      return null;
    }
  }

  void _applyLive({bool notify = true}) {
    final List<UnreadInboxEntry>? live = _live;
    if (live == null || _rows.isEmpty) {
      return;
    }
    final Map<String, UnreadInboxEntry> liveById = <String, UnreadInboxEntry>{
      for (final UnreadInboxEntry entry in live) entry.channelId: entry,
    };
    bool changed = false;
    final List<UnreadInboxRow> next = <UnreadInboxRow>[];
    for (final UnreadInboxRow row in _rows) {
      final UnreadInboxEntry? current = liveById[row.channelId];
      final bool read = current == null;
      final bool collapsed = current?.isCollapsed ?? row.collapsed;
      if (read == row.read && collapsed == row.collapsed) {
        next.add(row);
        continue;
      }
      changed = true;
      next.add(row.copyWith(read: read, collapsed: collapsed));
    }
    if (!changed) {
      return;
    }
    _rows = next;
    if (notify) {
      _notify();
    }
  }

  void _maybeRefill() {
    final List<UnreadInboxEntry>? live = _live;
    if (!_visit.visiting ||
        !_loaded ||
        _freezing ||
        _rows.isNotEmpty ||
        hasMore ||
        live == null ||
        live.isEmpty) {
      return;
    }
    final Duration shownFor = DateTime.now().difference(_shownAt);
    if (!_shownRows || shownFor >= kUnreadInboxRefillCooldown) {
      unawaited(_freeze());
      return;
    }
    _refillTimer?.cancel();
    _refillTimer = Timer(kUnreadInboxRefillCooldown - shownFor, _maybeRefill);
  }

  void _notify() {
    if (!_disposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    _generation++;
    _awayTimer?.cancel();
    _refillTimer?.cancel();
    super.dispose();
  }

  static List<UnreadInboxEntry> _groupByGuild(List<UnreadInboxEntry> entries) {
    final Map<String, List<UnreadInboxEntry>> groups =
        <String, List<UnreadInboxEntry>>{};
    for (final UnreadInboxEntry entry in entries) {
      groups
          .putIfAbsent(entry.guildId ?? '', () => <UnreadInboxEntry>[])
          .add(entry);
    }
    return <UnreadInboxEntry>[
      for (final List<UnreadInboxEntry> group in groups.values) ...group,
    ];
  }
}
