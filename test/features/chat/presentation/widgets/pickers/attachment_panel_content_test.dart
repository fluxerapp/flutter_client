import 'dart:async';
import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/data/attachment_gallery_source.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_gallery_grid.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/attachment_panel_content.dart';
import 'package:fluxer_app/features/chat/providers/core/chat_view_model.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../../helpers/pump_fluxer_app.dart';

const Size _kGalleryViewport = Size(400, 520);

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

class _FakeAttachmentGallerySource implements AttachmentGallerySource {
  static const int _pageCount = 3;
  final List<VoidCallback> _listeners = <VoidCallback>[];
  Completer<void>? pageGate;
  int loadCalls = 0;

  void emitChange() {
    for (final VoidCallback listener in List<VoidCallback>.of(_listeners)) {
      listener();
    }
  }

  @override
  Future<AttachmentGalleryAccess> requestAccess() async {
    return AttachmentGalleryAccess.granted;
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
  Future<XFile?> resolveFile(String id) async {
    return null;
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
