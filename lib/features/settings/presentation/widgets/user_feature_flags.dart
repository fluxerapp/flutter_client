import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/native_markdown_parser_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/material_ui.dart';

class UserFeatureFlags extends ConsumerWidget {
  const UserFeatureFlags({this.scrollController, super.key});

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      controller: scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FluxerSettingsSection(
            sectionId: 'feature-flags-markdown',
            title: 'Markdown',
            description:
                'Experimental parsers and rendering paths. Flags are stored '
                'on this device only.',
            isFirst: true,
            children: [
              FluxerSettingsSwitchItem(
                label: 'Native markdown parser',
                description:
                    'Parse messages with the canonical Rust parser (default '
                    'on canary). Turning this off, or any native failure, '
                    'falls back to the Dart parser.',
                value: ref.watch(nativeMarkdownParserSettingProvider),
                enabled: nativeMarkdownParserIsAvailable(),
                onChanged: (bool value) => ref
                    .read(nativeMarkdownParserSettingProvider.notifier)
                    .setEnabled(value: value),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
