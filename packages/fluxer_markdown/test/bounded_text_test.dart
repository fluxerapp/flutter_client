import 'package:flutter/rendering.dart' show RenderClipRect;
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_markdown/src/utils/bounded_text.dart';
import 'package:material_ui/material_ui.dart';

const String _kZalgoSample =
    'Z\u0300\u0301\u0302\u0303\u0304\u0305\u0306\u0307'
    'a\u0300\u0301\u0302\u0303\u0304\u0305\u0306\u0307';

void main() {
  testWidgets(
    'buildFluxerBoundedRichText does not force strut for inline widgets',
    (WidgetTester tester) async {
      const TextStyle style = TextStyle(fontSize: 14, height: 18 / 14);
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: buildFluxerBoundedRichText(
              text: const TextSpan(
                style: style,
                children: [
                  TextSpan(text: 'hello '),
                  WidgetSpan(
                    child: SizedBox(
                      key: Key('inline-widget'),
                      width: 24,
                      height: 24,
                    ),
                  ),
                ],
              ),
              baseStyle: style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );

      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.strutStyle?.forceStrutHeight, isFalse);
      expect(find.byType(FluxerBoundedTextClip), findsOneWidget);
      expect(tester.getSize(find.byKey(const Key('inline-widget'))).height, 24);
    },
  );

  testWidgets(
    'buildFluxerBoundedRichText still forces strut for plain single-line text',
    (WidgetTester tester) async {
      const TextStyle style = TextStyle(fontSize: 14, height: 18 / 14);
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: buildFluxerBoundedRichText(
              text: const TextSpan(text: _kZalgoSample, style: style),
              baseStyle: style,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      );

      final RichText richText = tester.widget<RichText>(find.byType(RichText));
      expect(richText.strutStyle?.forceStrutHeight, isTrue);
    },
  );

  testWidgets(
    'bounded text lets glyphs overhang sideways but clips above and below',
    (WidgetTester tester) async {
      const TextStyle style = TextStyle(
        fontSize: 24,
        fontStyle: FontStyle.italic,
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Center(
            child: buildFluxerBoundedRichText(
              text: const TextSpan(text: 'Half', style: style),
              baseStyle: style,
              textWidthBasis: TextWidthBasis.longestLine,
            ),
          ),
        ),
      );

      final RenderClipRect clip = tester.renderObject<RenderClipRect>(
        find.descendant(
          of: find.byType(FluxerBoundedTextClip),
          matching: find.byType(ClipRect),
        ),
      );
      final Rect clipRect = clip.clipper!.getClip(clip.size);
      expect(clipRect.left, lessThan(0));
      expect(clipRect.right, greaterThan(clip.size.width));
      expect(clipRect.top, 0);
      expect(clipRect.bottom, clip.size.height);
    },
  );
}
