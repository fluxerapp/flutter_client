import 'dart:async';
import 'dart:ffi';
import 'dart:isolate';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';

const String _kAlgorithm = 'PBKDF2/SHA-256';
const int _kMaxKeyBytes = 32;
const int _kMaxNonceBytes = 60;
const int _kMaxSaltBytes = 51;

const int _kSolveUnsupported = -2;
const int _kStopSlot = 1;

@Native<
  Int64 Function(
    Pointer<Uint8>,
    Uint32,
    Pointer<Uint8>,
    Uint32,
    Uint32,
    Pointer<Uint8>,
    Uint32,
    Pointer<Uint32>,
    Pointer<Uint8>,
  )
>(symbol: 'fluxer_altcha_solve')
external int _altchaSolve(
  Pointer<Uint8> nonce,
  int nonceLength,
  Pointer<Uint8> salt,
  int saltLength,
  int iterations,
  Pointer<Uint8> prefix,
  int prefixLength,
  Pointer<Uint32> shared,
  Pointer<Uint8> outKey,
);

class AltchaNativeSolution {
  const AltchaNativeSolution({required this.counter, required this.key});

  final int counter;
  final Uint8List key;
}

bool altchaNativeSupports({
  required String algorithm,
  required int keyLength,
  required int nonceLength,
  required int saltLength,
  required int prefixLength,
}) {
  return algorithm.toUpperCase() == _kAlgorithm &&
      keyLength <= _kMaxKeyBytes &&
      nonceLength <= _kMaxNonceBytes &&
      saltLength <= _kMaxSaltBytes &&
      prefixLength <= keyLength;
}

typedef _WorkerArgs = ({
  Uint8List nonce,
  Uint8List salt,
  int cost,
  Uint8List prefix,
  int sharedAddress,
  SendPort reply,
});

Future<AltchaNativeSolution?> solveAltchaNative({
  required Uint8List nonce,
  required Uint8List salt,
  required int cost,
  required Uint8List prefix,
  required int workers,
  required Duration timeout,
}) {
  final Pointer<Uint32> shared = calloc<Uint32>(2);
  final ReceivePort port = ReceivePort();
  final Completer<AltchaNativeSolution?> result =
      Completer<AltchaNativeSolution?>();
  int running = workers;
  Object? failure;
  bool released = false;

  void stop() {
    if (!released) {
      shared[_kStopSlot] = 1;
    }
  }

  void finishWorker() {
    running--;
    if (running > 0) {
      return;
    }
    port.close();
    released = true;
    calloc.free(shared);
    if (result.isCompleted) {
      return;
    }
    final Object? error = failure;
    if (error != null) {
      result.completeError(error);
    } else {
      result.complete(null);
    }
  }

  void fail(Object error) {
    failure ??= error;
    stop();
    finishWorker();
  }

  port.listen((Object? message) {
    if (message is AltchaNativeSolution) {
      if (!result.isCompleted) {
        result.complete(message);
      }
      finishWorker();
      return;
    }
    if (message is String) {
      fail(StateError(message));
      return;
    }
    finishWorker();
  });

  final Timer deadline = Timer(timeout, stop);
  final _WorkerArgs args = (
    nonce: nonce,
    salt: salt,
    cost: cost,
    prefix: prefix,
    sharedAddress: shared.address,
    reply: port.sendPort,
  );
  for (int i = 0; i < workers; i++) {
    unawaited(
      Isolate.spawn<_WorkerArgs>(
        _solveWorker,
        args,
      ).then<void>((_) {}, onError: fail),
    );
  }
  return result.future.whenComplete(() {
    deadline.cancel();
    stop();
  });
}

void _solveWorker(_WorkerArgs args) {
  Object? outcome;
  final Pointer<Uint8> buffer = calloc<Uint8>(
    args.nonce.length + args.salt.length + args.prefix.length + 32,
  );
  try {
    final Pointer<Uint8> nonce = buffer;
    final Pointer<Uint8> salt = nonce + args.nonce.length;
    final Pointer<Uint8> prefix = salt + args.salt.length;
    final Pointer<Uint8> key = prefix + args.prefix.length;
    nonce.asTypedList(args.nonce.length).setAll(0, args.nonce);
    salt.asTypedList(args.salt.length).setAll(0, args.salt);
    prefix.asTypedList(args.prefix.length).setAll(0, args.prefix);
    final int counter = _altchaSolve(
      nonce,
      args.nonce.length,
      salt,
      args.salt.length,
      args.cost,
      prefix,
      args.prefix.length,
      Pointer<Uint32>.fromAddress(args.sharedAddress),
      key,
    );
    if (counter >= 0) {
      outcome = AltchaNativeSolution(
        counter: counter,
        key: Uint8List.fromList(key.asTypedList(32)),
      );
    } else if (counter == _kSolveUnsupported) {
      outcome = 'unsupported';
    }
  } on Object catch (error) {
    outcome = '$error';
  } finally {
    calloc.free(buffer);
  }
  Isolate.exit(args.reply, outcome);
}
