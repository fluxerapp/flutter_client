abstract final class MdSpanFormat {
  static const int none = 0;
  static const int bold = 1 << 0;
  static const int italic = 1 << 1;
  static const int underline = 1 << 2;
  static const int strike = 1 << 3;
  static const int spoiler = 1 << 4;
  static const int code = 1 << 5;
  static const int heading = 1 << 6;
  static const int blockquote = 1 << 7;
  static const int subtext = 1 << 8;
  static const int link = 1 << 9;
  static const int codeBlock = 1 << 10;
  static const int blockquoteMarker = 1 << 12;
}

final class MdSourceSpan {
  const MdSourceSpan({
    required this.start,
    required this.end,
    required this.isMarker,
    required this.format,
  });

  final int start;
  final int end;
  final bool isMarker;
  final int format;

  bool has(int bit) => (format & bit) != 0;

  MdSourceSpan copyWith({int? start, int? end}) => MdSourceSpan(
    start: start ?? this.start,
    end: end ?? this.end,
    isMarker: isMarker,
    format: format,
  );

  @override
  String toString() =>
      'MdSourceSpan($start, $end, ${isMarker ? 'marker' : 'content'}, '
      '$format)';
}
