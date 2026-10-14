import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/profile/presentation/sheets/user_profile_note_edit_sheet.dart';
import 'package:fluxer_app/features/profile/providers/user_note_view_model.dart';
import 'package:fluxer_app/features/ui/character_counter/fluxer_character_counter.dart';
import 'package:fluxer_app/features/ui/input/utf16_length_limiting_formatter.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../../../helpers/open_test_database.dart';
import '../../../../helpers/test_l10n.dart';

const String _kUserId = '42';
const String _kSkull = '\u{1F480}';

class _RecordingNoteViewModel extends UserNoteViewModel {
  static final List<String> saved = <String>[];

  @override
  Stream<String?> build({required String userId}) =>
      Stream<String?>.value(null);

  @override
  Future<void> save(String note) async => saved.add(note);
}

Future<void> _openEditor(WidgetTester tester) async {
  final colorTheme = buildDarkColorTheme();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        userNoteViewModelProvider(
          userId: _kUserId,
        ).overrideWith(_RecordingNoteViewModel.new),
      ],
      child: MaterialApp(
        locale: kTestLocale,
        localizationsDelegates: fluxerLocalizationsDelegates,
        supportedLocales: FluxerLocalizations.supportedLocales,
        theme: buildFluxerTheme(
          colorTheme: colorTheme,
          textTheme: FluxerTextTheme.fromColors(colorTheme),
          layoutTheme: FluxerLayoutTheme.scaled(),
        ),
        home: Builder(
          builder: (BuildContext context) => Scaffold(
            body: Center(
              child: TextButton(
                onPressed: () => unawaited(
                  UserProfileNoteEditSheet.show(context, userId: _kUserId),
                ),
                child: const Text('open'),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  await tester.tap(find.text('open'));
  await tester.pumpAndSettle();
}

String _fieldText(WidgetTester tester) =>
    tester.widget<EditableText>(find.byType(EditableText)).controller.text;

int _counterRemaining(WidgetTester tester) {
  final FluxerCharacterCounter counter = tester.widget(
    find.byType(FluxerCharacterCounter),
  );
  return counter.max - counter.current;
}

void main() {
  setUp(_RecordingNoteViewModel.saved.clear);

  testWidgets('shows how many characters are left', (
    WidgetTester tester,
  ) async {
    await _openEditor(tester);
    expect(_counterRemaining(tester), kUserNoteMaxLength);

    await tester.enterText(find.byType(EditableText), 'hello');
    await tester.pump();

    expect(_counterRemaining(tester), kUserNoteMaxLength - 5);
    expect(find.text('${kUserNoteMaxLength - 5}'), findsOneWidget);
    await releaseTestWidgetTree(tester);
  });

  testWidgets('emoji count against the limit the way the API counts them', (
    WidgetTester tester,
  ) async {
    await _openEditor(tester);

    await tester.enterText(
      find.byType(EditableText),
      '${_kSkull * 60}${'d' * 200}',
    );
    await tester.pump();

    final String text = _fieldText(tester);
    expect(text.length, kUserNoteMaxLength);
    expect(text, '${_kSkull * 60}${'d' * (kUserNoteMaxLength - 120)}');
    expect(_counterRemaining(tester), 0);

    await tester.tap(find.text(testL10n.userProfileNoteSave));
    await tester.pumpAndSettle();
    expect(_RecordingNoteViewModel.saved.single.length, kUserNoteMaxLength);
    await releaseTestWidgetTree(tester);
  });

  test('typing at the limit is ignored', () {
    final Utf16LengthLimitingTextInputFormatter formatter =
        Utf16LengthLimitingTextInputFormatter(4);
    const TextEditingValue full = TextEditingValue(
      text: 'abcd',
      selection: TextSelection.collapsed(offset: 2),
    );
    final TextEditingValue result = formatter.formatEditUpdate(
      full,
      const TextEditingValue(
        text: 'abXcd',
        selection: TextSelection.collapsed(offset: 3),
      ),
    );
    expect(result.text, 'abcd');
    expect(result.selection.baseOffset, 2);
  });

  test('a paste in the middle keeps the text after the cursor', () {
    final Utf16LengthLimitingTextInputFormatter formatter =
        Utf16LengthLimitingTextInputFormatter(6);
    final TextEditingValue result = formatter.formatEditUpdate(
      const TextEditingValue(
        text: 'abcd',
        selection: TextSelection.collapsed(offset: 2),
      ),
      const TextEditingValue(
        text: 'ab${_kSkull}x${_kSkull}cd',
        selection: TextSelection.collapsed(offset: 8),
      ),
    );
    expect(result.text, 'ab${_kSkull}cd');
    expect(result.selection.baseOffset, 4);
  });
}
