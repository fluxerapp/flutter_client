// SPDX-License-Identifier: AGPL-3.0-or-later
//
// Bound against the code asset emitted by hook/build.dart; the asset id
// matches this library's URI.

import 'dart:ffi';
import 'dart:io';

/// Mirror of `FluxerMdBuffer` in rust/src/native.rs.
final class FluxerMdBuffer extends Struct {
  external Pointer<Uint8> data;

  @Size()
  external int dataLen;

  external Pointer<Uint8> error;

  @Size()
  external int errorLen;
}

typedef _ParseC =
    Uint32 Function(
      Pointer<Uint8>,
      Size,
      Uint32,
      Pointer<Uint8>,
      Size,
      Pointer<FluxerMdBuffer>,
    );

typedef _ParseDart =
    int Function(
      Pointer<Uint8>,
      int,
      int,
      Pointer<Uint8>,
      int,
      Pointer<FluxerMdBuffer>,
    );

typedef _FreeDart = void Function(Pointer<FluxerMdBuffer>);

int fluxerMdParse(
  Pointer<Uint8> inputPtr,
  int inputLen,
  int flags,
  Pointer<Uint8> tsvPtr,
  int tsvLen,
  Pointer<FluxerMdBuffer> out,
) {
  if (_loadsBundledFramework) {
    return _bundled().parse(inputPtr, inputLen, flags, tsvPtr, tsvLen, out);
  }
  return _nativeFluxerMdParse(inputPtr, inputLen, flags, tsvPtr, tsvLen, out);
}

int fluxerMdParseBinary(
  Pointer<Uint8> inputPtr,
  int inputLen,
  int flags,
  Pointer<Uint8> tsvPtr,
  int tsvLen,
  Pointer<FluxerMdBuffer> out,
) {
  if (_loadsBundledFramework) {
    return _bundled().parseBinary(
      inputPtr,
      inputLen,
      flags,
      tsvPtr,
      tsvLen,
      out,
    );
  }
  return _nativeFluxerMdParseBinary(
    inputPtr,
    inputLen,
    flags,
    tsvPtr,
    tsvLen,
    out,
  );
}

void fluxerMdBufferFree(Pointer<FluxerMdBuffer> out) {
  if (_loadsBundledFramework) {
    _bundled().free(out);
    return;
  }
  _nativeFluxerMdBufferFree(out);
}

@Native<
  Uint32 Function(
    Pointer<Uint8>,
    Size,
    Uint32,
    Pointer<Uint8>,
    Size,
    Pointer<FluxerMdBuffer>,
  )
>(symbol: 'fluxer_md_parse')
external int _nativeFluxerMdParse(
  Pointer<Uint8> inputPtr,
  int inputLen,
  int flags,
  Pointer<Uint8> tsvPtr,
  int tsvLen,
  Pointer<FluxerMdBuffer> out,
);

@Native<
  Uint32 Function(
    Pointer<Uint8>,
    Size,
    Uint32,
    Pointer<Uint8>,
    Size,
    Pointer<FluxerMdBuffer>,
  )
>(symbol: 'fluxer_md_parse_binary')
external int _nativeFluxerMdParseBinary(
  Pointer<Uint8> inputPtr,
  int inputLen,
  int flags,
  Pointer<Uint8> tsvPtr,
  int tsvLen,
  Pointer<FluxerMdBuffer> out,
);

@Native<Void Function(Pointer<FluxerMdBuffer>)>(symbol: 'fluxer_md_buffer_free')
external void _nativeFluxerMdBufferFree(Pointer<FluxerMdBuffer> out);

// The manifest path is resolved at the app root. The binary is in Frameworks/.
// dart test still uses the @Native lookup.
bool get _loadsBundledFramework {
  if (Platform.isIOS) {
    return true;
  }
  return Platform.isMacOS &&
      Platform.resolvedExecutable.contains('.app/Contents/MacOS/');
}

_BundledParser? _openParser;

_BundledParser _bundled() {
  final cached = _openParser;
  if (cached != null) {
    return cached;
  }
  final opened = _BundledParser.open();
  _openParser = opened;
  return opened;
}

final class _BundledParser {
  _BundledParser(DynamicLibrary library)
    : parse = library.lookupFunction<_ParseC, _ParseDart>('fluxer_md_parse'),
      parseBinary = library.lookupFunction<_ParseC, _ParseDart>(
        'fluxer_md_parse_binary',
      ),
      free = library
          .lookupFunction<Void Function(Pointer<FluxerMdBuffer>), _FreeDart>(
            'fluxer_md_buffer_free',
          );

  factory _BundledParser.open() {
    return _BundledParser(DynamicLibrary.open(_frameworkBinaryPath()));
  }

  final _ParseDart parse;
  final _ParseDart parseBinary;
  final _FreeDart free;
}

String _frameworkBinaryPath() {
  const framework = 'fluxer_markdown_parser.framework/fluxer_markdown_parser';
  final executableDir = File(Platform.resolvedExecutable).parent;
  // iOS: Runner.app/Runner. macOS: App.app/Contents/MacOS/App.
  final bundleDir = Platform.isIOS ? executableDir : executableDir.parent;
  return '${bundleDir.path}/Frameworks/$framework';
}
