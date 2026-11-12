import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/core/theme/fluxer_layout_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_text_theme.dart';
import 'package:fluxer_app/core/theme/fluxer_theme.dart';
import 'package:fluxer_app/core/theme/themes/dark.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button_size.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/focus_ring/fluxer_focus_ring.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/keybind_hint/fluxer_keybind_hint.dart';
import 'package:fluxer_app/features/ui/radio_group/fluxer_radio_group.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/slider/fluxer_slider.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_segmented_tabs.dart';
import 'package:fluxer_app/features/ui/tabs/fluxer_tabs.dart';
import 'package:fluxer_app/features/ui/toggle_switch/fluxer_toggle_switch.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

import '../../helpers/input_modality_override.dart';
import '../../helpers/wide_layout_test_sizes.dart';

Widget _app({required bool touch, required Widget child}) {
  final colorTheme = buildDarkColorTheme();
  return ProviderScope(
    overrides: [inputModalityOverride(touch: touch)],
    child: MaterialApp(
      localizationsDelegates: FluxerLocalizations.localizationsDelegates,
      supportedLocales: FluxerLocalizations.supportedLocales,
      theme: buildFluxerTheme(
        colorTheme: colorTheme,
        textTheme: FluxerTextTheme.fromColors(colorTheme),
        layoutTheme: FluxerLayoutTheme.scaled(),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(16), child: child),
        ),
      ),
    ),
  );
}

Widget _gallery() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    spacing: 8,
    children: [
      FluxerButton.primary(onPressed: () {}, label: 'Save'),
      FluxerButton.secondary(
        onPressed: () {},
        label: 'Cancel',
        size: FluxerButtonSize.small,
      ),
      FluxerButton.dangerPrimary(
        onPressed: () {},
        label: 'Delete',
        size: FluxerButtonSize.compact,
      ),
      FluxerButton.ghost(
        onPressed: () {},
        label: 'More',
        size: FluxerButtonSize.superCompact,
      ),
      FluxerButton.primary(onPressed: () {}, label: 'Busy', isLoading: true),
      const FluxerInput(label: 'Name', hint: 'Type here'),
      FluxerSelect<String>(
        label: 'Pick',
        hint: 'Choose',
        enableSearch: false,
        items: const [FluxerSelectItem(value: 'a', label: 'A')],
        value: 'a',
        onChanged: (_) {},
      ),
      FluxerCheckbox(value: true, onChanged: (_) {}, label: 'Check'),
      FluxerRadioGroup<String>(
        value: 'a',
        items: const [
          FluxerRadioItem(value: 'a', label: 'A', description: 'First'),
          FluxerRadioItem(value: 'b', label: 'B'),
        ],
        onChanged: (_) {},
      ),
      FluxerToggleSwitch(value: true, onChanged: (_) {}, label: 'Toggle'),
      FluxerTabs(
        tabs: const [
          FluxerTab(label: 'One'),
          FluxerTab(label: 'Two'),
        ],
        selectedIndex: 0,
        onChanged: (_) {},
      ),
      FluxerSegmentedTabs(
        tabs: const [
          FluxerTab(label: 'Day'),
          FluxerTab(label: 'Week'),
        ],
        selectedIndex: 1,
        onChanged: (_) {},
      ),
      const FluxerWarningAlert(title: 'Heads up', message: 'Careful'),
      const FluxerKeybindHint(keys: ['⌘', 'K']),
      const FluxerFocusRing(focused: true, child: Text('Focus')),
      const SizedBox(width: 280, child: FluxerSlider(defaultValue: 40)),
    ],
  );
}

void main() {
  testWidgets('desktop primitives use web metrics', (tester) async {
    tester.view.physicalSize = kWideTestViewportSize;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app(touch: false, child: _gallery()));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byType(FluxerButton).first).height, 36);
    expect(tester.getSize(find.byType(FluxerButton).at(1)).height, 34);
    expect(tester.getSize(find.byType(FluxerButton).at(3)).height, 26);
    expect(find.byType(FluxerPulsingEllipsis), findsOneWidget);
    expect(tester.getSize(find.byType(TextField)).height, 44);
  });

  testWidgets('touch primitives keep mobile metrics', (tester) async {
    tester.view.physicalSize = kWideTestViewportSize;
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(_app(touch: true, child: _gallery()));
    await tester.pump();

    expect(tester.takeException(), isNull);
    expect(tester.getSize(find.byType(FluxerButton).first).height, 44);
    expect(find.byType(FluxerPulsingEllipsis), findsNothing);
  });
}
