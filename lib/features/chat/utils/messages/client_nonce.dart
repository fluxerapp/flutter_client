import 'package:fluxer_app/shared/utils/snowflake_time.dart';

/// Generates monotonic, snowflake-shaped client nonces for optimistic message
/// sends.
///
/// Within a single millisecond the sequence counter increments (wrapping at 12
/// bits), matching the server snowflake layout
/// `(timestamp << 22) | (worker << 12) | sequence`. A single process-wide
/// instance ([clientNonceGenerator]) keeps nonces unique across every send
/// path.
class ClientNonceGenerator {
  ClientNonceGenerator();

  int _timestampMs = 0;
  int _sequence = 0;

  /// Returns the next unique nonce as a decimal string.
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

/// Shared process-wide nonce generator used by every optimistic send path.
final ClientNonceGenerator clientNonceGenerator = ClientNonceGenerator();
