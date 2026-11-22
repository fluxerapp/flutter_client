import 'dart:ffi';

import 'package:ffi/ffi.dart';

const int _kRegSz = 1;
const int _kRrfRtRegSz = 0x00000002;
const int _kRrfRtRegDword = 0x00000010;
const int _kErrorSuccess = 0;

final Pointer<Void> _hkeyCurrentUser = Pointer<Void>.fromAddress(-0x7FFFFFFF);

final DynamicLibrary _advapi32 = DynamicLibrary.open('advapi32.dll');

final int Function(
  Pointer<Void>,
  Pointer<Utf16>,
  Pointer<Utf16>,
  int,
  Pointer<Uint32>,
  Pointer<Void>,
  Pointer<Uint32>,
)
_regGetValue = _advapi32
    .lookupFunction<
      Int32 Function(
        Pointer<Void>,
        Pointer<Utf16>,
        Pointer<Utf16>,
        Uint32,
        Pointer<Uint32>,
        Pointer<Void>,
        Pointer<Uint32>,
      ),
      int Function(
        Pointer<Void>,
        Pointer<Utf16>,
        Pointer<Utf16>,
        int,
        Pointer<Uint32>,
        Pointer<Void>,
        Pointer<Uint32>,
      )
    >('RegGetValueW');

final int Function(
  Pointer<Void>,
  Pointer<Utf16>,
  Pointer<Utf16>,
  int,
  Pointer<Void>,
  int,
)
_regSetKeyValue = _advapi32
    .lookupFunction<
      Int32 Function(
        Pointer<Void>,
        Pointer<Utf16>,
        Pointer<Utf16>,
        Uint32,
        Pointer<Void>,
        Uint32,
      ),
      int Function(
        Pointer<Void>,
        Pointer<Utf16>,
        Pointer<Utf16>,
        int,
        Pointer<Void>,
        int,
      )
    >('RegSetKeyValueW');

final int Function(Pointer<Void>, Pointer<Utf16>, Pointer<Utf16>)
_regDeleteKeyValue = _advapi32
    .lookupFunction<
      Int32 Function(Pointer<Void>, Pointer<Utf16>, Pointer<Utf16>),
      int Function(Pointer<Void>, Pointer<Utf16>, Pointer<Utf16>)
    >('RegDeleteKeyValueW');

String? readCurrentUserRegistryString(String subKey, String valueName) {
  return using((Arena arena) {
    final Pointer<Utf16> key = subKey.toNativeUtf16(allocator: arena);
    final Pointer<Utf16> value = valueName.toNativeUtf16(allocator: arena);
    final Pointer<Uint32> size = arena<Uint32>();
    if (_regGetValue(
          _hkeyCurrentUser,
          key,
          value,
          _kRrfRtRegSz,
          nullptr,
          nullptr,
          size,
        ) !=
        _kErrorSuccess) {
      return null;
    }
    final Pointer<Uint16> buffer = arena<Uint16>(size.value ~/ 2 + 1);
    if (_regGetValue(
          _hkeyCurrentUser,
          key,
          value,
          _kRrfRtRegSz,
          nullptr,
          buffer.cast(),
          size,
        ) !=
        _kErrorSuccess) {
      return null;
    }
    return buffer.cast<Utf16>().toDartString();
  });
}

int? readCurrentUserRegistryDword(String subKey, String valueName) {
  return using((Arena arena) {
    final Pointer<Uint32> data = arena<Uint32>();
    final Pointer<Uint32> size = arena<Uint32>()..value = sizeOf<Uint32>();
    final int status = _regGetValue(
      _hkeyCurrentUser,
      subKey.toNativeUtf16(allocator: arena),
      valueName.toNativeUtf16(allocator: arena),
      _kRrfRtRegDword,
      nullptr,
      data.cast(),
      size,
    );
    return status == _kErrorSuccess ? data.value : null;
  });
}

bool writeCurrentUserRegistryString(
  String subKey,
  String valueName,
  String data,
) {
  return using((Arena arena) {
    final Pointer<Utf16> nativeData = data.toNativeUtf16(allocator: arena);
    return _regSetKeyValue(
          _hkeyCurrentUser,
          subKey.toNativeUtf16(allocator: arena),
          valueName.toNativeUtf16(allocator: arena),
          _kRegSz,
          nativeData.cast(),
          (data.length + 1) * sizeOf<Uint16>(),
        ) ==
        _kErrorSuccess;
  });
}

bool deleteCurrentUserRegistryValue(String subKey, String valueName) {
  return using((Arena arena) {
    return _regDeleteKeyValue(
          _hkeyCurrentUser,
          subKey.toNativeUtf16(allocator: arena),
          valueName.toNativeUtf16(allocator: arena),
        ) ==
        _kErrorSuccess;
  });
}
