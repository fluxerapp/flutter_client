import 'dart:async';
import 'dart:io';

import 'package:clock/clock.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_download.dart';
import 'package:fluxer_app/core/desktop/downloads/desktop_downloads_provider.dart';
import 'package:path/path.dart' as p;

class _Transfer {
  final Completer<void> _completer = Completer<void>();
  late ProgressCallback progress;

  Future<void> call(CancelToken token, ProgressCallback onReceiveProgress) {
    progress = onReceiveProgress;
    unawaited(
      token.whenCancel.then((DioException error) {
        if (!_completer.isCompleted) {
          _completer.completeError(error);
        }
      }),
    );
    return _completer.future;
  }

  void complete() => _completer.complete();

  void fail() => _completer.completeError(Exception('failed'));
}

void main() {
  late Directory directory;
  late ProviderContainer container;
  late DesktopDownloads downloads;

  setUp(() {
    directory = Directory.systemTemp.createTempSync('desktop_downloads');
    container = ProviderContainer();
    downloads = container.read(desktopDownloadsProvider.notifier);
  });

  tearDown(() {
    container.dispose();
    directory.deleteSync(recursive: true);
  });

  List<DesktopDownload> entries() => container.read(desktopDownloadsProvider);

  String pathOf(String name) => p.join(directory.path, name);

  Future<DesktopDownloadOutcome> finish(String name) {
    final String path = pathOf(name);
    return downloads.start(
      filePath: path,
      transfer: (_, ProgressCallback onReceiveProgress) async {
        File(path).writeAsStringSync('data');
        onReceiveProgress(4, 4);
      },
    );
  }

  test('lists newest first and completes', () async {
    expect(await finish('a.txt'), DesktopDownloadOutcome.completed);
    await finish('b.txt');
    expect(entries().map((DesktopDownload e) => e.fileName), <String>[
      'b.txt',
      'a.txt',
    ]);
    expect(entries().first.state, DesktopDownloadState.completed);
    expect(entries().first.receivedBytes, 4);
    expect(entries().first.canOpen, isTrue);
  });

  test('evicts the oldest finished entry and keeps running ones', () async {
    final _Transfer running = _Transfer();
    final Future<DesktopDownloadOutcome> pending = downloads.start(
      filePath: pathOf('running.txt'),
      transfer: running.call,
    );
    for (int i = 0; i < kDesktopDownloadsLimit + 1; i++) {
      await finish('$i.txt');
    }
    final List<String> names = entries()
        .map((DesktopDownload e) => e.fileName)
        .toList();
    expect(names, hasLength(kDesktopDownloadsLimit));
    expect(names.last, 'running.txt');
    expect(names, isNot(contains('0.txt')));
    expect(names, isNot(contains('1.txt')));
    running.complete();
    await pending;
  });

  test('never evicts running entries past the limit', () async {
    final List<Future<DesktopDownloadOutcome>> pending =
        <Future<DesktopDownloadOutcome>>[];
    final List<_Transfer> transfers = <_Transfer>[];
    for (int i = 0; i < kDesktopDownloadsLimit + 2; i++) {
      final _Transfer transfer = _Transfer();
      transfers.add(transfer);
      pending.add(
        downloads.start(filePath: pathOf('$i'), transfer: transfer.call),
      );
    }
    expect(entries(), hasLength(kDesktopDownloadsLimit + 2));
    for (final _Transfer transfer in transfers) {
      transfer.complete();
    }
    await Future.wait(pending);
  });

  test('replaces a finished entry for the same path', () async {
    await finish('a.txt');
    final int first = entries().single.id;
    await finish('a.txt');
    expect(entries().single.id, isNot(first));
  });

  test('throttles progress', () async {
    DateTime now = DateTime(2026);
    await withClock(Clock(() => now), () async {
      final _Transfer transfer = _Transfer();
      final Future<DesktopDownloadOutcome> pending = downloads.start(
        filePath: pathOf('a.txt'),
        transfer: transfer.call,
      );
      expect(entries().single.state, DesktopDownloadState.started);
      transfer.progress(10, 100);
      expect(entries().single.state, DesktopDownloadState.progressing);
      transfer.progress(20, 100);
      expect(entries().single.receivedBytes, 10);
      now = now.add(kDesktopDownloadProgressInterval);
      transfer.progress(30, 100);
      expect(entries().single.receivedBytes, 30);
      expect(entries().single.totalBytes, 100);
      transfer.complete();
      await pending;
    });
  });

  test('cancel deletes the partial file', () async {
    final String path = pathOf('a.txt');
    File(path).writeAsStringSync('partial');
    final _Transfer transfer = _Transfer();
    final Future<DesktopDownloadOutcome> pending = downloads.start(
      filePath: path,
      transfer: transfer.call,
    );
    downloads.cancel(entries().single.id);
    expect(await pending, DesktopDownloadOutcome.canceled);
    expect(entries().single.state, DesktopDownloadState.canceled);
    expect(File(path).existsSync(), isFalse);
  });

  test('failure deletes the partial file', () async {
    final String path = pathOf('a.txt');
    File(path).writeAsStringSync('partial');
    final _Transfer transfer = _Transfer();
    final Future<DesktopDownloadOutcome> pending = downloads.start(
      filePath: path,
      transfer: transfer.call,
    );
    transfer.fail();
    expect(await pending, DesktopDownloadOutcome.failed);
    expect(entries().single.state, DesktopDownloadState.failed);
    expect(File(path).existsSync(), isFalse);
  });

  test('dismiss and clear skip running entries', () async {
    await finish('a.txt');
    final _Transfer transfer = _Transfer();
    final Future<DesktopDownloadOutcome> pending = downloads.start(
      filePath: pathOf('b.txt'),
      transfer: transfer.call,
    );
    downloads
      ..dismiss(entries().first.id)
      ..clear();
    expect(entries().single.fileName, 'b.txt');
    transfer.complete();
    await pending;
    downloads.dismiss(entries().single.id);
    expect(entries(), isEmpty);
    expect(File(pathOf('a.txt')).existsSync(), isTrue);
  });

  test('refresh notices removed files', () async {
    await finish('a.txt');
    File(pathOf('a.txt')).deleteSync();
    downloads.refreshFileExists();
    expect(entries().single.canOpen, isFalse);
    expect(entries().single.state, DesktopDownloadState.completed);
  });
}
