import 'dart:ffi';

import 'package:ffi/ffi.dart';

const int _kTh32csSnapProcess = 0x00000002;
const int _kMaxPath = 260;

final class _ProcessEntry32W extends Struct {
  @Uint32()
  external int dwSize;

  @Uint32()
  external int cntUsage;

  @Uint32()
  external int th32ProcessID;

  @UintPtr()
  external int th32DefaultHeapID;

  @Uint32()
  external int th32ModuleID;

  @Uint32()
  external int cntThreads;

  @Uint32()
  external int th32ParentProcessID;

  @Int32()
  external int pcPriClassBase;

  @Uint32()
  external int dwFlags;

  @Array(_kMaxPath)
  external Array<Uint16> szExeFile;
}

final DynamicLibrary _kernel32 = DynamicLibrary.open('kernel32.dll');

final Pointer<Void> Function(int, int) _createSnapshot = _kernel32
    .lookupFunction<
      Pointer<Void> Function(Uint32, Uint32),
      Pointer<Void> Function(int, int)
    >('CreateToolhelp32Snapshot');

final int Function(Pointer<Void>, Pointer<_ProcessEntry32W>) _processFirst =
    _kernel32.lookupFunction<
      Int32 Function(Pointer<Void>, Pointer<_ProcessEntry32W>),
      int Function(Pointer<Void>, Pointer<_ProcessEntry32W>)
    >('Process32FirstW');

final int Function(Pointer<Void>, Pointer<_ProcessEntry32W>) _processNext =
    _kernel32.lookupFunction<
      Int32 Function(Pointer<Void>, Pointer<_ProcessEntry32W>),
      int Function(Pointer<Void>, Pointer<_ProcessEntry32W>)
    >('Process32NextW');

final int Function(Pointer<Void>) _closeHandle = _kernel32
    .lookupFunction<Int32 Function(Pointer<Void>), int Function(Pointer<Void>)>(
      'CloseHandle',
    );

String _exeName(_ProcessEntry32W entry) {
  final List<int> units = <int>[];
  for (int i = 0; i < _kMaxPath; i++) {
    final int unit = entry.szExeFile[i];
    if (unit == 0) {
      break;
    }
    units.add(unit);
  }
  return String.fromCharCodes(units);
}

Set<String> windowsRunningProcessNames() {
  final Pointer<Void> snapshot = _createSnapshot(_kTh32csSnapProcess, 0);
  if (snapshot.address == -1 || snapshot == nullptr) {
    return const <String>{};
  }
  final Pointer<_ProcessEntry32W> entry = malloc<_ProcessEntry32W>();
  final Set<String> names = <String>{};
  try {
    entry.ref.dwSize = sizeOf<_ProcessEntry32W>();
    if (_processFirst(snapshot, entry) == 0) {
      return names;
    }
    do {
      names.add(_exeName(entry.ref).toLowerCase());
    } while (_processNext(snapshot, entry) != 0);
    return names;
  } finally {
    malloc.free(entry);
    _closeHandle(snapshot);
  }
}
