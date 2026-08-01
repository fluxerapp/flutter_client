import 'package:flutter_test/flutter_test.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/pickers/expression_picker.dart';
import 'package:fluxer_app/features/chat/providers/channel/channel_message_permissions_provider.dart';
import 'package:fluxer_app/features/chat/utils/composer_expression_tabs.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';

void main() {
  group('composerInputButtonVisibleTabs', () {
    test(
      'hides media composer button without hiding it from expression panel',
      () {
        const ChannelMessagePermissions perms = ChannelMessagePermissions.all;
        const advanced = AdvancedPreferencesState(showMemesButton: false);

        final List<ExpressionPickerTab> composerTabs =
            composerInputButtonVisibleTabs(perms: perms, advanced: advanced);
        final List<ExpressionPickerTab> panelTabs = expressionPanelVisibleTabs(
          perms,
        );

        expect(composerTabs, isNot(contains(ExpressionPickerTab.memes)));
        expect(panelTabs, contains(ExpressionPickerTab.memes));
      },
    );
  });
}
