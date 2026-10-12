import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/shared/utils/guild_acronym.dart';

void main() {
  group('guildAcronym', () {
    const cases = <(String, String, int)>[
      ('Movies? We Like Movies', 'M?WLM', 5),
      ('Movies Movies', 'MM', 2),
      ('(Internal) Fluxer DevOps', '(I)FD', 5),
      ('secret server', 'ss', 2),
      ('Hampus server', 'Hs', 2),
      ('Fluxer', 'F', 1),
      ('  Fluxer  ', 'F', 1),
      ('a   b\tc\nd', 'abcd', 4),
      ("Bob's Burgers", 'BB', 2),
      ('Bob’s Burgers', 'BB', 2),
      ("Bob's", "B's", 3),
      ("Don't Panic", "D'tP", 4),
      ('Area 51', 'A5', 2),
      ('2024 Reunion', '2R', 2),
      ('Rock-n-Roll', 'R-n-R', 5),
      ('Spider-Man Fans', 'S-MF', 4),
      ('snake_case_name', 's', 1),
      ('C++ & Rust', 'C++&R', 5),
      ('@everyone', '@e', 2),
      ('!!!', '!!!', 3),
      ('\u{1F3AE}\u{1F3B2}', '\u{1F3AE}\u{1F3B2}', 2),
      ('\u{1F496}tes tes', '\u{1F496}tt', 3),
      ('❤️love', '❤️l', 2),
      (
        '\u{1F468}‍\u{1F469}‍\u{1F467} Family',
        '\u{1F468}‍\u{1F469}‍\u{1F467}F',
        2,
      ),
      ('\u{1F1F8}\u{1F1EA} Sweden', '\u{1F1F8}\u{1F1EA}S', 2),
      ('1️⃣ One', '1️⃣O', 2),
      ('日本語 サーバー', '日サ', 2),
      ('原神交流群', '原', 1),
      ('한국 서버', '한서', 2),
      ('Привет Мир', 'ПМ', 2),
      ('مرحبا بالعالم', 'مب', 2),
      ('שלום עולם', 'שע', 2),
      ('می‌خواهم بازی', 'مب', 2),
      ('École Normale', 'ÉN', 2),
      ('नमस्ते दुनिया', 'नदु', 2),
      ('one two three four five six seven eight nine ten', 'ottffssent', 10),
      ('', '', 0),
      ('   \t 　', '', 0),
    ];

    for (final (name, acronym, length) in cases) {
      test('"$name" -> "$acronym"', () {
        expect(guildAcronym(name), acronym);
        expect(guildAcronymLength(acronym), length);
      });
    }
  });

  group('guildAcronymFontSize', () {
    const cases = <(int, double)>[
      (0, 16),
      (1, 16),
      (2, 16),
      (3, 14),
      (4, 14),
      (5, 12),
      (6, 12),
      (10, 12),
    ];

    for (final (length, fontSize) in cases) {
      for (final double iconSize in <double>[48, 60, 64]) {
        test('$length graphemes -> ${fontSize}px on a ${iconSize}px icon', () {
          expect(
            guildAcronymFontSize(length, iconSize),
            closeTo(fontSize, 0.001),
          );
        });
      }
    }

    test('scales up proportionally above 64px', () {
      expect(guildAcronymFontSize(2, 96), closeTo(24, 0.001));
      expect(guildAcronymFontSize(4, 128), closeTo(28, 0.001));
      expect(guildAcronymFontSize(5, 80), closeTo(15, 0.001));
    });

    test('scales down below 48px and never drops below the floor', () {
      expect(guildAcronymFontSize(2, 36), closeTo(12, 0.001));
      expect(guildAcronymFontSize(2, 24), closeTo(8, 0.001));
      expect(guildAcronymFontSize(4, 40), closeTo(11.667, 0.001));
      expect(guildAcronymFontSize(6, 16), kGuildAcronymMinFontSize);
    });
  });
}
