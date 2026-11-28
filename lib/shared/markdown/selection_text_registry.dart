import 'package:fluxer_app/material_ui.dart';

final Expando<String> _selectedTextByRegion = Expando<String>(
  'selectedTextByRegion',
);

void recordSelectableRegionText(SelectableRegionState? region, String? text) {
  if (region == null) {
    return;
  }
  _selectedTextByRegion[region] = text;
}

String? selectableRegionText(SelectableRegionState region) =>
    _selectedTextByRegion[region];
