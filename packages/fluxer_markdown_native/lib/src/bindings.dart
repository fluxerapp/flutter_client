// SPDX-License-Identifier: AGPL-3.0-or-later
//
// Bound against the code asset emitted by hook/build.dart; the asset id
// matches this library's URI.

import 'dart:ffi';

/// Mirror of `FluxerMdBuffer` in rust/src/native.rs.
final class FluxerMdBuffer extends Struct {
  external Pointer<Uint8> data;

  @Size()
  external int dataLen;

  external Pointer<Uint8> error;

  @Size()
  external int errorLen;
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
external int fluxerMdParse(
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
external int fluxerMdParseBinary(
  Pointer<Uint8> inputPtr,
  int inputLen,
  int flags,
  Pointer<Uint8> tsvPtr,
  int tsvLen,
  Pointer<FluxerMdBuffer> out,
);

@Native<Void Function(Pointer<FluxerMdBuffer>)>(symbol: 'fluxer_md_buffer_free')
external void fluxerMdBufferFree(Pointer<FluxerMdBuffer> out);
