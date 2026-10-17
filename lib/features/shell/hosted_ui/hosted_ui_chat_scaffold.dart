import 'package:adaptive_platform_ui/adaptive_platform_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/providers/channel_providers.dart';
import 'package:fluxer_app/features/shell/hosted_ui/hosted_ui_back_button.dart';
import 'package:fluxer_app/features/shell/hosted_ui/iphone_duo_hosted_ui.dart';
import 'package:fluxer_app/features/shell/navigation/shell_chat_back.dart';
import 'package:fluxer_app/features/voice/utils/voice_phone_call_layout.dart';
import 'package:fluxer_app/material_ui.dart';

class HostedUiChatScaffold extends ConsumerWidget {
  const HostedUiChatScaffold({
    required this.child,
    required this.channelId,
    super.key,
  });

  final Widget child;
  final String channelId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!usesIphoneDuoHostedUi(context)) {
      return child;
    }
    final bool isThread =
        ref.watch(channelByIdProvider(channelId)).value?.isThread ?? false;
    final bool showBack =
        showsHostedUiChatBackButton(context, isThread: isThread) ||
        shouldMinimizePhoneVoiceCall(context, ref);
    if (!showBack) {
      return child;
    }
    return AdaptiveScaffold(
      backgroundColor: context.colors.backgroundPrimary,
      resizeToAvoidBottomInset: false,
      appBar: AdaptiveAppBar(
        leading: const HostedUiBackButton(),
        tintColor: context.colors.textPrimaryMuted,
      ),
      body: child,
    );
  }
}
