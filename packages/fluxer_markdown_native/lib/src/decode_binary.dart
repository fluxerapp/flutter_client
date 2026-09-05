// SPDX-License-Identifier: AGPL-3.0-or-later
//
// Decoder for the binary AST envelope written by rust/src/binary.rs.
// Tag values, field order, and the LEB128 varint layout are ABI contract
// with `FORMAT_VERSION` there.

import 'dart:convert';
import 'dart:typed_data';

import 'package:fluxer_markdown_native/src/ast.dart';

const int supportedBinaryFormatVersion = 1;

List<MdNode> decodeBinaryAst(Uint8List bytes) {
  final cursor = _Cursor(bytes);
  final version = cursor.readByte();
  if (version != supportedBinaryFormatVersion) {
    throw FormatException('Unsupported binary AST version: $version');
  }
  final nodes = cursor.readNodes();
  if (cursor.offset != bytes.length) {
    throw FormatException(
      'Trailing bytes in binary AST payload at ${cursor.offset}',
    );
  }
  return nodes;
}

final class _Cursor {
  _Cursor(this.bytes);

  static const Utf8Decoder _utf8 = Utf8Decoder();

  final Uint8List bytes;
  int offset = 0;

  int readByte() => bytes[offset++];

  int readVarint() {
    var shift = 0;
    var value = 0;
    while (true) {
      final byte = bytes[offset++];
      value |= (byte & 0x7f) << shift;
      if ((byte & 0x80) == 0) {
        return value;
      }
      shift += 7;
    }
  }

  int? readOptionalVarint() => readByte() == 0 ? null : readVarint();

  String readString() {
    final length = readVarint();
    final value = _utf8.convert(bytes, offset, offset + length);
    offset += length;
    return value;
  }

  String? readOptionalString() => readByte() == 0 ? null : readString();

  List<MdNode> readNodes() {
    final count = readVarint();
    return [for (var i = 0; i < count; i++) readNode()];
  }

  MdNode readNode() {
    final tag = readByte();
    return switch (tag) {
      0 => MdText(readString()),
      1 => () {
        final blankLines = readOptionalVarint();
        return MdBlockquote(readNodes(), blankLines: blankLines);
      }(),
      2 => MdStrong(readNodes()),
      3 => MdEmphasis(readNodes()),
      4 => MdUnderline(readNodes()),
      5 => MdStrikethrough(readNodes()),
      6 => () {
        final isBlock = switch (readByte()) {
          0 => null,
          1 => false,
          _ => true,
        };
        return MdSpoiler(readNodes(), isBlock: isBlock);
      }(),
      7 => () {
        final level = readByte();
        return MdHeading(level, readNodes());
      }(),
      8 => MdSubtext(readNodes()),
      9 => () {
        final ordered = readByte() != 0;
        final count = readVarint();
        return MdList(
          ordered: ordered,
          items: [
            for (var i = 0; i < count; i++)
              () {
                final ordinal = readOptionalVarint();
                return MdListItem(readNodes(), ordinal: ordinal);
              }(),
          ],
        );
      }(),
      10 => () {
        final language = readOptionalString();
        return MdCodeBlock(language: language, content: readString());
      }(),
      11 => MdInlineCode(readString()),
      12 => MdSequence(readNodes()),
      13 => () {
        final flags = readByte();
        final url = readString();
        final rawUrl = readString();
        final source = readString();
        return MdLink(
          text: (flags & 2) != 0 ? readNode() : null,
          url: url,
          escaped: (flags & 1) != 0,
          rawUrl: rawUrl,
          source: source,
        );
      }(),
      14 => MdMention(_readMention()),
      15 => () {
        final timestamp = readVarint();
        return MdTimestamp(timestamp, MdTimestampStyle.values[readByte()]);
      }(),
      16 => MdEmoji(_readEmoji()),
      17 => () {
        final header = readNode();
        final alignmentCount = readVarint();
        final alignments = [
          for (var i = 0; i < alignmentCount; i++)
            MdTableAlignment.values[readByte()],
        ];
        return MdTable(
          header: header,
          alignments: alignments,
          rows: readNodes(),
        );
      }(),
      18 => MdTableRow(readNodes()),
      19 => MdTableCell(readNodes()),
      20 => () {
        final alertType = MdAlertType.values[readByte()];
        return MdAlert(alertType, readNodes());
      }(),
      _ => throw FormatException('Unknown binary AST node tag: $tag'),
    };
  }

  MdMentionKind _readMention() {
    final kind = readByte();
    return switch (kind) {
      0 => MdUserMention(readString()),
      1 => MdChannelMention(readString()),
      2 => MdRoleMention(readString()),
      3 => MdCommandMention(
        name: readString(),
        subcommandGroup: readOptionalString(),
        subcommand: readOptionalString(),
        id: readString(),
      ),
      4 => () {
        final navigationType = MdGuildNavigationType.values[readByte()];
        return MdGuildNavigationMention(
          navigationType,
          id: readOptionalString(),
        );
      }(),
      5 => const MdEveryoneMention(),
      6 => const MdHereMention(),
      _ => throw FormatException('Unknown mention kind tag: $kind'),
    };
  }

  MdEmojiKind _readEmoji() {
    final kind = readByte();
    return switch (kind) {
      0 => MdStandardEmoji(
        raw: readString(),
        codepoints: readString(),
        name: readString(),
      ),
      1 => () {
        final animated = readByte() != 0;
        return MdCustomEmoji(
          name: readString(),
          id: readString(),
          animated: animated,
        );
      }(),
      _ => throw FormatException('Unknown emoji kind tag: $kind'),
    };
  }
}
