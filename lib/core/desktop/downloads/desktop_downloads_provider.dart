import 'dart:async';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_download.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_file_actions.dart';
import 'package:fluxer_app/core/talker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'desktop_downloads_provider.g.dart';

const int kDesktopDownloadsLimit = 10;
const Duration kDesktopDownloadProgressInterval = Duration(milliseconds: 250);

enum DesktopDownloadOutcome { completed, canceled, failed }

typedef DesktopDownloadTransfer =
    Future<void> Function(
      CancelToken cancelToken,
      ProgressCallback onReceiveProgress,
    );

@Riverpod(keepAlive: true)
class DesktopDownloads extends _$DesktopDownloads {
  final Map<int, CancelToken> _cancelTokens = <int, CancelToken>{};
  int _nextId = 0;

  @override
  List<DesktopDownload> build() {
    ref.onDispose(() {
      for (final CancelToken token in _cancelTokens.values) {
        token.cancel();
      }
      _cancelTokens.clear();
    });
    return const <DesktopDownload>[];
  }

  Future<DesktopDownloadOutcome> start({
    required String filePath,
    required DesktopDownloadTransfer transfer,
  }) async {
    final int id = _nextId++;
    final CancelToken cancelToken = CancelToken();
    _cancelTokens[id] = cancelToken;
    _add(DesktopDownload(id: id, filePath: filePath));
    int received = 0;
    DateTime? lastEmittedAt;
    try {
      await transfer(cancelToken, (int count, int total) {
        received = count;
        final DateTime now = clock.now();
        final DateTime? last = lastEmittedAt;
        if (cancelToken.isCancelled ||
            (last != null &&
                now.difference(last) < kDesktopDownloadProgressInterval)) {
          return;
        }
        lastEmittedAt = now;
        _update(
          id,
          DesktopDownloadState.progressing,
          receivedBytes: count,
          totalBytes: total > 0 ? total : null,
        );
      });
      _update(
        id,
        DesktopDownloadState.completed,
        receivedBytes: received,
        totalBytes: received,
      );
      return DesktopDownloadOutcome.completed;
    } on Object catch (error, stackTrace) {
      await _deletePartialFile(filePath);
      if (cancelToken.isCancelled) {
        _update(id, DesktopDownloadState.canceled, receivedBytes: received);
        return DesktopDownloadOutcome.canceled;
      }
      talker.warning('[Downloads] Download failed', error, stackTrace);
      _update(id, DesktopDownloadState.failed, receivedBytes: received);
      return DesktopDownloadOutcome.failed;
    } finally {
      _cancelTokens.remove(id);
    }
  }

  void cancel(int id) => _cancelTokens[id]?.cancel();

  void dismiss(int id) {
    state = <DesktopDownload>[
      for (final DesktopDownload download in state)
        if (download.id != id || download.isInProgress) download,
    ];
  }

  void clear() {
    state = <DesktopDownload>[
      for (final DesktopDownload download in state)
        if (download.isInProgress) download,
    ];
  }

  void refreshFileExists() {
    state = <DesktopDownload>[
      for (final DesktopDownload download in state)
        if (download.state == DesktopDownloadState.completed)
          download.copyWith(fileExists: File(download.filePath).existsSync())
        else
          download,
    ];
  }

  Future<void> open(int id) => _withCompletedFile(id, openDesktopFile);

  Future<void> reveal(int id) => _withCompletedFile(id, revealDesktopFile);

  Future<void> _withCompletedFile(
    int id,
    Future<void> Function(String filePath) action,
  ) async {
    refreshFileExists();
    for (final DesktopDownload download in state) {
      if (download.id == id && download.canOpen) {
        try {
          await action(download.filePath);
        } on Object catch (error, stackTrace) {
          talker.warning('[Downloads] File action failed', error, stackTrace);
        }
        return;
      }
    }
  }

  void _add(DesktopDownload added) {
    final List<DesktopDownload> next = <DesktopDownload>[
      added,
      for (final DesktopDownload download in state)
        if (download.isInProgress || download.filePath != added.filePath)
          download,
    ];
    for (
      int index = next.length - 1;
      index > 0 && next.length > kDesktopDownloadsLimit;
      index--
    ) {
      if (!next[index].isInProgress) {
        next.removeAt(index);
      }
    }
    state = next;
  }

  void _update(
    int id,
    DesktopDownloadState downloadState, {
    required int receivedBytes,
    int? totalBytes,
  }) {
    if (!ref.mounted) {
      return;
    }
    state = <DesktopDownload>[
      for (final DesktopDownload download in state)
        if (download.id == id)
          download.copyWith(
            state: downloadState,
            receivedBytes: receivedBytes,
            totalBytes: totalBytes,
            fileExists: downloadState == DesktopDownloadState.completed,
          )
        else
          download,
    ];
  }

  Future<void> _deletePartialFile(String filePath) async {
    try {
      final File file = File(filePath);
      if (file.existsSync()) {
        await file.delete();
      }
    } on Object catch (error) {
      talker.warning('[Downloads] Could not delete partial file: $error');
    }
  }
}
