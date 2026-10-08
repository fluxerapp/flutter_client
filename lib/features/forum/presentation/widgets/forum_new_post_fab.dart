import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/forum/presentation/sheets/forum_post_composer_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_circle_fab.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ForumNewPostFab extends ConsumerWidget {
  const ForumNewPostFab({required this.forum, super.key});

  final Channel forum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerCircleFab(
      icon: PhosphorIconsBold.plus,
      semanticLabel: l10n.forumNewPost,
      onTap: () =>
          unawaited(showForumPostComposerSheet(context, ref, forum: forum)),
    );
  }
}
