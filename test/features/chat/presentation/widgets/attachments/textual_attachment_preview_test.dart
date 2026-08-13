import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/chat/domain/message.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/attachment_file.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/attachments/textual_attachment_preview.dart';
import 'package:fluxer_app/features/chat/utils/attachment_preview_utils.dart';
import 'package:fluxer_app/features/chat/utils/textual_attachment_content.dart';
import '../../../../../helpers/test_l10n.dart';

void main() {
  testWidgets('renders textual preview for eligible code attachment', (
    tester,
  ) async {
    final Attachment attachment = _buildAttachment(
      filename: 'main.py',
      url: 'https://cdn.example/main.py',
      contentType: 'text/x-python',
      size: 2048,
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: TextualAttachmentPreview(
          attachment: attachment,
          contentLoader:
              ({
                required Attachment attachment,
                CancelToken? cancelToken,
              }) async {
                return const TextualAttachmentContentResult.loaded(
                  'print("hi")\n',
                );
              },
        ),
      ),
    );
    expect(find.byType(TextualAttachmentPreview), findsOneWidget);
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 1));
    expect(find.byType(TextualAttachmentPreview), findsOneWidget);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });

  testWidgets('AttachmentFile routes eligible csv to textual preview', (
    tester,
  ) async {
    final Attachment attachment = _buildAttachment(
      filename: 'data.csv',
      url: 'https://cdn.example/data.csv',
      size: 512,
    );
    await tester.pumpWidget(
      _buildTestApp(
        child: TextualAttachmentPreview(
          attachment: attachment,
          contentLoader:
              ({
                required Attachment attachment,
                CancelToken? cancelToken,
              }) async {
                return const TextualAttachmentContentResult.loaded(
                  'a,b\n1,2\n',
                );
              },
        ),
      ),
    );
    expect(find.byType(TextualAttachmentPreview), findsOneWidget);
    await tester.pump();
    expect(shouldPreviewAttachment(attachment), isTrue);
    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });

  testWidgets('AttachmentFile keeps chip for oversized textual attachment', (
    tester,
  ) async {
    final Attachment attachment = _buildAttachment(
      filename: 'big.py',
      url: 'https://cdn.example/big.py',
      size: kTextPreviewMaxBytes + 1,
    );
    await tester.pumpWidget(
      _buildTestApp(child: AttachmentFile(attachment: attachment)),
    );
    expect(find.byType(TextualAttachmentPreview), findsNothing);
    expect(find.byType(AttachmentFile), findsOneWidget);
  });

  testWidgets('AttachmentFile keeps chip for non-textual attachment', (
    tester,
  ) async {
    final Attachment attachment = _buildAttachment(
      filename: 'report.pdf',
      url: 'https://cdn.example/report.pdf',
      contentType: 'application/pdf',
      size: 2048,
    );
    await tester.pumpWidget(
      _buildTestApp(child: AttachmentFile(attachment: attachment)),
    );
    expect(find.byType(TextualAttachmentPreview), findsNothing);
    expect(find.byType(AttachmentFile), findsOneWidget);
  });
}

Widget _buildTestApp({required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    child: MaterialApp(
      locale: kTestLocale,
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(body: child),
    ),
  );
}

Attachment _buildAttachment({
  required String filename,
  required String url,
  String? contentType,
  int size = 1024,
}) {
  return Attachment(
    id: 'attachment-$filename',
    filename: filename,
    url: url,
    contentType: contentType,
    size: size,
  );
}
