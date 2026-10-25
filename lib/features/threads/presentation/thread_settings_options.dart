import 'package:fluxer_app/features/threads/domain/thread_channel.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';

List<FluxerSelectItem<int>> threadAutoArchiveItems(FluxerLocalizations l10n) =>
    <FluxerSelectItem<int>>[
      for (final int minutes in threadAutoArchiveDurations)
        FluxerSelectItem<int>(
          value: minutes,
          label: threadAutoArchiveLabel(l10n, minutes),
        ),
    ];
