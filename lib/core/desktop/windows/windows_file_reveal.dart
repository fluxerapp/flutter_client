import 'dart:ffi';

import 'package:ffi/ffi.dart';

const int _kCoinitApartmentThreaded = 0x2;

final DynamicLibrary _ole32 = DynamicLibrary.open('ole32.dll');
final DynamicLibrary _shell32 = DynamicLibrary.open('shell32.dll');

final int Function(Pointer<Void>, int) _coInitializeEx = _ole32
    .lookupFunction<
      Int32 Function(Pointer<Void>, Uint32),
      int Function(Pointer<Void>, int)
    >('CoInitializeEx');

final void Function() _coUninitialize = _ole32
    .lookupFunction<Void Function(), void Function()>('CoUninitialize');

final void Function(Pointer<Void>) _coTaskMemFree = _ole32
    .lookupFunction<Void Function(Pointer<Void>), void Function(Pointer<Void>)>(
      'CoTaskMemFree',
    );

final int Function(
  Pointer<Utf16>,
  Pointer<Void>,
  Pointer<Pointer<Void>>,
  int,
  Pointer<Uint32>,
)
_shParseDisplayName = _shell32
    .lookupFunction<
      Int32 Function(
        Pointer<Utf16>,
        Pointer<Void>,
        Pointer<Pointer<Void>>,
        Uint32,
        Pointer<Uint32>,
      ),
      int Function(
        Pointer<Utf16>,
        Pointer<Void>,
        Pointer<Pointer<Void>>,
        int,
        Pointer<Uint32>,
      )
    >('SHParseDisplayName');

final int Function(Pointer<Void>, int, Pointer<Pointer<Void>>, int)
_shOpenFolderAndSelectItems = _shell32
    .lookupFunction<
      Int32 Function(Pointer<Void>, Uint32, Pointer<Pointer<Void>>, Uint32),
      int Function(Pointer<Void>, int, Pointer<Pointer<Void>>, int)
    >('SHOpenFolderAndSelectItems');

bool revealWindowsFile(String filePath) {
  final bool initialized =
      _coInitializeEx(nullptr, _kCoinitApartmentThreaded) >= 0;
  try {
    return using((Arena arena) {
      final Pointer<Pointer<Void>> item = arena<Pointer<Void>>();
      final int parsed = _shParseDisplayName(
        filePath.toNativeUtf16(allocator: arena),
        nullptr,
        item,
        0,
        nullptr,
      );
      if (parsed < 0) {
        return false;
      }
      try {
        return _shOpenFolderAndSelectItems(item.value, 0, nullptr, 0) >= 0;
      } finally {
        _coTaskMemFree(item.value);
      }
    });
  } finally {
    if (initialized) {
      _coUninitialize();
    }
  }
}
