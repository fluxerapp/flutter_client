import 'package:fluxer_app/features/chat/domain/channel_search_segments.dart';

class ChannelSearchInputParts {
  const ChannelSearchInputParts({
    required this.pills,
    required this.editableText,
  });

  final List<ChannelSearchSegment> pills;
  final String editableText;
}

bool channelSearchSegmentsEqual(
  ChannelSearchSegment a,
  ChannelSearchSegment b,
) {
  return a.type == b.type &&
      a.filterKey == b.filterKey &&
      a.display == b.display &&
      a.id == b.id;
}

ChannelSearchInputParts splitChannelSearchInput(String fullText) {
  final List<ChannelSearchSegment> segments = parseChannelSearchDisplayText(
    fullText,
  );
  final List<ChannelSearchSegment> pills = <ChannelSearchSegment>[];
  final StringBuffer editable = StringBuffer();

  for (final ChannelSearchSegment segment in segments) {
    if (segment.type == ChannelSearchSegmentType.text) {
      editable.write(segment.display);
      continue;
    }
    if (segment.display.isNotEmpty) {
      pills.add(segment);
      continue;
    }
    editable.write('${segment.filterKey}:');
  }

  return ChannelSearchInputParts(
    pills: pills,
    editableText: editable.toString(),
  );
}

String rebuildChannelSearchText({
  required List<ChannelSearchSegment> pills,
  required String editableText,
}) {
  final List<ChannelSearchSegment> segments = <ChannelSearchSegment>[
    ...pills,
    if (editableText.isNotEmpty)
      ChannelSearchSegment(
        type: ChannelSearchSegmentType.text,
        filterKey: '',
        display: editableText,
      ),
  ];
  return buildChannelSearchDisplayText(segments);
}

String rebuildChannelSearchInput({
  required String oldFull,
  required String editableText,
}) {
  final ChannelSearchInputParts parts = splitChannelSearchInput(oldFull);
  return rebuildChannelSearchText(
    pills: parts.pills,
    editableText: editableText,
  );
}

List<ChannelSearchSegment> removeChannelSearchPill(
  List<ChannelSearchSegment> pills,
  ChannelSearchSegment target,
) {
  return pills
      .where(
        (ChannelSearchSegment pill) =>
            !channelSearchSegmentsEqual(pill, target),
      )
      .toList();
}

String channelSearchPillLabel(ChannelSearchSegment segment) {
  if (segment.display.isEmpty) {
    return segment.filterKey;
  }
  return segment.display;
}
