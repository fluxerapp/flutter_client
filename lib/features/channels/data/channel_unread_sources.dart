import 'dart:async';

import 'package:drift/drift.dart';
import 'package:fluxer_app/core/database/drift_stream_utils.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/talker.dart';

enum _Source { channel, readState, lastMessage, threadMember }

class _Entry {
  final Set<StreamController<void>> listeners = <StreamController<void>>{};
  final Map<_Source, Object?> values = <_Source, Object?>{};

  bool get ready => values.length == _Source.values.length;
}

class ChannelUnreadSources {
  ChannelUnreadSources(this._db) {
    _tableSubs = <StreamSubscription<Object?>>[
      for (final _Source source in _Source.values)
        _db
            .tableUpdates(TableUpdateQuery.onTable(_tableOf(source)))
            .listen((_) => _invalidate(source)),
    ];
  }

  final FluxerDatabase _db;
  late final List<StreamSubscription<Object?>> _tableSubs;
  final Map<String, _Entry> _entries = <String, _Entry>{};
  final Set<_Source> _running = <_Source>{};
  final Set<_Source> _again = <_Source>{};
  bool _registrationScheduled = false;
  bool _disposed = false;

  Stream<void> changes(String channelId) {
    late final StreamController<void> controller;
    controller = StreamController<void>(
      onListen: () => _add(channelId, controller),
      onCancel: () => _remove(channelId, controller),
    );
    return controller.stream;
  }

  void dispose() {
    _disposed = true;
    for (final StreamSubscription<Object?> sub in _tableSubs) {
      unawaited(sub.cancel());
    }
    for (final _Entry entry in _entries.values) {
      for (final StreamController<void> listener in entry.listeners) {
        unawaited(listener.close());
      }
    }
    _entries.clear();
  }

  ResultSetImplementation<Table, Object?> _tableOf(_Source source) =>
      switch (source) {
        _Source.channel => _db.channels,
        _Source.readState => _db.readStates,
        _Source.lastMessage => _db.messages,
        _Source.threadMember => _db.threadMembers,
      };

  void _add(String channelId, StreamController<void> controller) {
    if (_disposed) {
      return;
    }
    final _Entry? existing = _entries[channelId];
    if (existing != null) {
      existing.listeners.add(controller);
      if (existing.ready) {
        controller.add(null);
      }
      return;
    }
    _entries[channelId] = _Entry()..listeners.add(controller);
    if (_registrationScheduled) {
      return;
    }
    _registrationScheduled = true;
    scheduleMicrotask(() {
      _registrationScheduled = false;
      for (final _Source source in _Source.values) {
        _invalidate(source);
      }
    });
  }

  void _remove(String channelId, StreamController<void> controller) {
    final _Entry? entry = _entries[channelId];
    if (entry == null) {
      return;
    }
    entry.listeners.remove(controller);
    if (entry.listeners.isEmpty) {
      _entries.remove(channelId);
    }
  }

  void _invalidate(_Source source) {
    if (_disposed || _entries.isEmpty) {
      return;
    }
    if (_running.contains(source)) {
      _again.add(source);
      return;
    }
    unawaited(_run(source));
  }

  Future<void> _run(_Source source) async {
    _running.add(source);
    try {
      do {
        _again.remove(source);
        final List<String> ids = _entries.keys.toList(growable: false);
        if (ids.isEmpty) {
          continue;
        }
        final Map<String, Object?> fetched = await _fetch(source, ids);
        if (_disposed) {
          return;
        }
        _apply(source, ids, fetched);
      } while (_again.contains(source) && !_disposed);
    } on Object catch (error, stackTrace) {
      if (!isDriftCancellation(error) && !_disposed) {
        talker.error('[Unread] source fetch failed', error, stackTrace);
      }
    } finally {
      _running.remove(source);
    }
  }

  Future<Map<String, Object?>> _fetch(_Source source, List<String> ids) async =>
      switch (source) {
        _Source.channel => <String, Object?>{
          for (final Channel row in await _db.channelDao.getChannelsByIds(ids))
            row.id: row,
        },
        _Source.readState => <String, Object?>{
          for (final ReadState row in await _db.readStateDao.getReadStatesFor(
            ids,
          ))
            row.channelId: row,
        },
        _Source.lastMessage => await _db.messageDao.getLastMessageIds(ids),
        _Source.threadMember => <String, Object?>{
          for (final ThreadMember row in await _db.threadDao.getMembersFor(ids))
            row.threadId: row,
        },
      };

  void _apply(_Source source, List<String> ids, Map<String, Object?> fetched) {
    for (final String id in ids) {
      final _Entry? entry = _entries[id];
      if (entry == null) {
        continue;
      }
      final Object? value = fetched[id];
      if (entry.values.containsKey(source) && entry.values[source] == value) {
        continue;
      }
      entry.values[source] = value;
      if (!entry.ready) {
        continue;
      }
      for (final StreamController<void> listener in entry.listeners) {
        listener.add(null);
      }
    }
  }
}
