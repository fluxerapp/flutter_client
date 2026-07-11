import 'package:flutter/material.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';

class MessageListPageShell extends StatelessWidget {
  const MessageListPageShell({
    required this.icon,
    required this.title,
    required this.body,
    this.trailing,
    super.key,
  });

  final Widget icon;
  final String title;
  final Widget body;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    return ColoredBox(
      color: colors.backgroundSecondary,
      child: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 56,
              decoration: BoxDecoration(
                color: colors.backgroundSecondary,
                border: Border(
                  bottom: BorderSide(color: colors.backgroundHeaderSecondary),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: layout.s4),
              child: Row(
                children: <Widget>[
                  icon,
                  SizedBox(width: layout.s2),
                  Expanded(
                    child: Text(
                      title,
                      style: context.textStyles.channelName,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ?trailing,
                ],
              ),
            ),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}
