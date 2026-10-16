import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/domain/pending_attachment.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_gallery_grid.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_panel_content.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_panel_source_bar.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/features/chat/providers/upload/cloud_upload_controller.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:path/path.dart' as path_lib;

import '../../../../../helpers/pump_fluxer_app.dart';

const Size _kGalleryViewport = Size(400, 520);

Future<void> _waitForPendingItems(
  WidgetTester tester,
  ProviderContainer container,
  int count,
) async {
  for (int i = 0; i < 300; i++) {
    if (container
            .read(cloudUploadControllerProvider('channel-1'))
            .items
            .length >=
        count) {
      return;
    }
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 10)),
    );
    await tester.pump();
  }
}

void main() {
  testWidgets('loading older photos does not jump the gallery to the top', (
    tester,
  ) async {
    final _FakeAttachmentGallerySource source = _FakeAttachmentGallerySource()
      ..pageGate = Completer<void>();
    final ScrollController scrollController = await _pumpGallery(
      tester,
      source,
    );

    expect(find.byType(AttachmentGalleryGrid), findsOneWidget);
    expect(scrollController.offset, 0);

    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    await tester.pump();
    final double offsetWhileLoading = scrollController.offset;
    expect(offsetWhileLoading, greaterThan(400));
    expect(source.loadCalls, 2);

    source.emitChange();
    await tester.pump(const Duration(milliseconds: 350));

    expect(find.byType(AttachmentGalleryGrid), findsOneWidget);
    expect(scrollController.offset, offsetWhileLoading);
    expect(source.loadCalls, 2);

    source.pageGate!.complete();
    await tester.pump();
    await tester.pump();

    expect(find.byType(AttachmentGalleryGrid), findsOneWidget);
    expect(scrollController.offset, offsetWhileLoading);
    expect(source.loadCalls, 2);
    expect(find.byKey(const ValueKey<String>('photo-80')), findsWidgets);
  });

  testWidgets('library changes while scrolled apply after returning to top', (
    tester,
  ) async {
    final _FakeAttachmentGallerySource source = _FakeAttachmentGallerySource();
    final ScrollController scrollController = await _pumpGallery(
      tester,
      source,
    );

    scrollController.jumpTo(scrollController.position.maxScrollExtent);
    await tester.pump();
    await tester.pump();
    expect(scrollController.offset, greaterThan(400));
    expect(source.loadCalls, 2);

    source.emitChange();
    await tester.pump(const Duration(milliseconds: 350));
    expect(source.loadCalls, 2);
    expect(scrollController.offset, greaterThan(400));

    scrollController.jumpTo(0);
    await tester.pump();
    await tester.pump();
    expect(scrollController.offset, 0);
    expect(source.loadCalls, 3);
    expect(find.byKey(const ValueKey<String>('photo-0')), findsOneWidget);
  });

  testWidgets('a photo shows as picked while it resolves and taps queue', (
    tester,
  ) async {
    final Directory dir = Directory.systemTemp.createTempSync('gallery_pick');
    addTearDown(() => dir.deleteSync(recursive: true));
    final _FakeAttachmentGallerySource source = _FakeAttachmentGallerySource()
      ..resolveGate = Completer<void>()
      ..resolveDir = dir;
    await _pumpGallery(tester, source);
    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(AttachmentPanelContent)),
    );

    await tester.tap(find.byKey(const ValueKey<String>('photo-0')));
    await tester.pump();
    await tester.tap(find.byKey(const ValueKey<String>('photo-1')));
    await tester.pump();

    expect(
      tester
          .widget<AttachmentGalleryGrid>(find.byType(AttachmentGalleryGrid))
          .selectedAssetIds,
      <String>{'photo-0', 'photo-1'},
    );

    source.resolveGate!.complete();
    await _waitForPendingItems(tester, container, 2);

    expect(
      container
          .read(cloudUploadControllerProvider('channel-1'))
          .items
          .map((PendingAttachment a) => a.galleryAssetId),
      <String>['photo-0', 'photo-1'],
    );
    await tester.pump(const Duration(seconds: 30));
  });

  testWidgets('a photo keeps the name the library gives it', (tester) async {
    final Directory dir = Directory.systemTemp.createTempSync('gallery_name');
    addTearDown(() => dir.deleteSync(recursive: true));
    final _FakeAttachmentGallerySource source = _FakeAttachmentGallerySource()
      ..resolveDir = dir
      ..resolvedName = 'IMG_0568.GIF';
    await _pumpGallery(tester, source);
    final ProviderContainer container = ProviderScope.containerOf(
      tester.element(find.byType(AttachmentPanelContent)),
    );

    await tester.tap(find.byKey(const ValueKey<String>('photo-0')));
    await _waitForPendingItems(tester, container, 1);

    expect(
      container
          .read(cloudUploadControllerProvider('channel-1'))
          .items
          .map((PendingAttachment a) => a.filename),
      <String>['IMG_0568.GIF'],
    );
    await tester.pump(const Duration(seconds: 30));
  });

  testWidgets('the source bar sits below the grid, not over it', (
    tester,
  ) async {
    await _pumpGallery(tester, _FakeAttachmentGallerySource());

    final Rect grid = tester.getRect(find.byType(AttachmentGalleryGrid));
    final Rect bar = tester.getRect(find.byType(AttachmentPanelSourceBar));
    expect(bar.top, greaterThanOrEqualTo(grid.bottom));
  });

  testWidgets('limited library access shows a manage banner', (tester) async {
    final _FakeAttachmentGallerySource source = _FakeAttachmentGallerySource()
      ..access = AttachmentGalleryAccess.limited;
    await _pumpGallery(tester, source);

    expect(find.byType(AttachmentGalleryGrid), findsOneWidget);
    expect(find.text('Manage'), findsOneWidget);
    expect(
      find.text('Only photos and videos you chose to share are shown here.'),
      findsOneWidget,
    );
    final Rect grid = tester.getRect(find.byType(AttachmentGalleryGrid));
    final Rect banner = tester.getRect(
      find.text('Only photos and videos you chose to share are shown here.'),
    );
    expect(grid.top, greaterThanOrEqualTo(banner.bottom));
  });

  testWidgets('without photo access the camera is still offered', (
    tester,
  ) async {
    final _FakeAttachmentGallerySource source = _FakeAttachmentGallerySource()
      ..access = AttachmentGalleryAccess.denied;
    await _pumpGallery(tester, source);

    expect(find.byType(AttachmentGalleryGrid), findsNothing);
    expect(find.bySemanticsLabel('Camera'), findsOneWidget);
    final Rect settings = tester.getRect(find.byType(FluxerButton).first);
    final Rect bar = tester.getRect(find.byType(AttachmentPanelSourceBar));
    expect(bar.overlaps(settings), isFalse);
  });
}

Future<ScrollController> _pumpGallery(
  WidgetTester tester,
  _FakeAttachmentGallerySource source,
) async {
  final ScrollController scrollController = ScrollController();
  addTearDown(scrollController.dispose);
  await tester.binding.setSurfaceSize(_kGalleryViewport);
  addTearDown(() => tester.binding.setSurfaceSize(null));
  await tester.pumpWidget(
    pumpFluxerApp(
      overrides: [
        chatViewModelProvider.overrideWithValue(_chatState()),
        attachmentGallerySourceProvider.overrideWithValue(source),
        advancedPreferencesProvider.overrideWith(_NoPreuploadPreferences.new),
      ],
      child: MediaQuery(
        data: const MediaQueryData(
          size: _kGalleryViewport,
          disableAnimations: true,
        ),
        child: Scaffold(
          body: AttachmentPanelContent(scrollController: scrollController),
        ),
      ),
    ),
  );
  await tester.pump();
  await tester.pump();
  return scrollController;
}

ChatViewState _chatState() {
  return const ChatViewState(
    channelId: 'channel-1',
    messages: <Message>[],
    replyingTo: null,
    replyMentioning: false,
    editingMessage: null,
    messageText: '',
    scrollToBottomSignal: 0,
    isLoading: false,
    isSyncingMessages: false,
    isLoadingMore: false,
    isLoadingNewer: false,
    hasMoreMessages: false,
    hasMoreNewerMessages: false,
    errorMessage: null,
  );
}

class _FakeAttachmentGallerySource extends AttachmentGallerySource {
  static const int _pageCount = 3;
  final List<VoidCallback> _listeners = <VoidCallback>[];
  Completer<void>? pageGate;
  Completer<void>? resolveGate;
  Directory? resolveDir;
  String? resolvedName;
  AttachmentGalleryAccess access = AttachmentGalleryAccess.granted;
  int loadCalls = 0;

  void emitChange() {
    for (final VoidCallback listener in List<VoidCallback>.of(_listeners)) {
      listener();
    }
  }

  @override
  Future<AttachmentGalleryAccess> requestAccess() async {
    return access;
  }

  @override
  Future<List<AttachmentGalleryItem>> loadPage({
    required int page,
    required int pageSize,
  }) async {
    loadCalls += 1;
    if (pageGate != null && page == 1) {
      await pageGate!.future;
    }
    if (page >= _pageCount) {
      return const <AttachmentGalleryItem>[];
    }
    return List<AttachmentGalleryItem>.generate(
      pageSize,
      (int i) => AttachmentGalleryItem(
        id: 'photo-${page * pageSize + i}',
        isVideo: false,
      ),
    );
  }

  @override
  Future<Uint8List?> loadThumbnail(String id, {required int size}) async {
    return Uint8List(0);
  }

  @override
  Future<AttachmentGalleryFile?> resolveFile(String id) async {
    final Directory? dir = resolveDir;
    if (dir == null) {
      return null;
    }
    await resolveGate?.future;
    final File file = File('${dir.path}/$id.jpg')..writeAsBytesSync(<int>[1]);
    return (
      file: XFile(file.path),
      filename: resolvedName ?? path_lib.basename(file.path),
    );
  }

  @override
  void addChangeListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeChangeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }
}

class _NoPreuploadPreferences extends AdvancedPreferences {
  @override
  AdvancedPreferencesState build() {
    return const AdvancedPreferencesState(preuploadMessageAttachments: false);
  }
}
