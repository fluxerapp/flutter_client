import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/moderation/domain/iar_context.dart';
import 'package:fluxer_app/features/moderation/domain/report_flow.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ReportFlowOptionList extends StatelessWidget {
  const ReportFlowOptionList({
    required this.options,
    required this.onChoose,
    super.key,
  });

  final List<ReportFlowOption> options;
  final ValueChanged<ReportFlowOption> onChoose;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return FluxerMenuGroup(
      children: <Widget>[
        for (final ReportFlowOption option in options)
          FluxerBottomSheetMenuItem(
            key: ValueKey<String>('report-flow-option-${option.id}'),
            label: option.label,
            onTap: () => onChoose(option),
            trailing: PhosphorIcon(
              option.outcome.type == ReportFlowOutcomeType.link
                  ? PhosphorIconsBold.arrowSquareOut
                  : PhosphorIconsBold.caretRight,
              size: 16,
              color: colors.textSecondary,
            ),
          ),
      ],
    );
  }
}

String reportFlowLinkUrl(String url, IarContext target) {
  const String reportPath = '/report';
  final Uri? uri = Uri.tryParse(url);
  if (uri == null || !uri.path.endsWith(reportPath)) {
    return url;
  }
  final String basePath = uri.path.substring(
    0,
    uri.path.length - reportPath.length,
  );
  final Map<String, String> prefill = switch (target) {
    IarMessageContext(:final message, :final guildId) => <String, String>{
      'type': 'message',
      'message_link': Uri(
        scheme: uri.scheme,
        host: uri.host,
        port: uri.hasPort ? uri.port : null,
        path:
            '$basePath/channels/${guildId ?? '@me'}/${message.channelId}/${message.id}',
      ).toString(),
    },
    IarUserContext(:final userId) => <String, String>{
      'type': 'user',
      'user_id': userId,
    },
  };
  return uri
      .replace(
        queryParameters: <String, String>{...uri.queryParameters, ...prefill},
      )
      .toString();
}
