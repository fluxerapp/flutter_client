import 'package:fluxer_app/shared/utils/snowflake_time.dart';

class ClientNonceGenerator {
  ClientNonceGenerator();

  int _timestampMs = 0;
  int _sequence = 0;

  String next() {
    final int timestampMs = DateTime.now().millisecondsSinceEpoch;
    if (timestampMs == _timestampMs) {
      _sequence = (_sequence + 1) & 0xFFF;
    } else {
      _timestampMs = timestampMs;
      _sequence = 0;
    }
    final int timestampPart = timestampMs - kSnowflakeEpochMs;
    const int workerId = 1;
    final int nonce = (timestampPart << 22) | (workerId << 12) | _sequence;
    return nonce.toString();
  }
}

final ClientNonceGenerator clientNonceGenerator = ClientNonceGenerator();
