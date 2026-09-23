/// Fluxer snowflake epoch (2015-01-01T00:00:00.000Z) in milliseconds.
const int kSnowflakeEpochMs = 1420070400000;

/// Unix epoch milliseconds encoded in a Fluxer snowflake id, or null if [id] is not numeric.
int? snowflakeTimestampMsOrNull(String? id) {
  final BigInt? parsed = BigInt.tryParse(id ?? '');
  if (parsed == null) {
    return null;
  }
  return (parsed >> 22).toInt() + kSnowflakeEpochMs;
}

DateTime? dateTimeFromUserSnowflakeOrNull(String id) {
  final int? ms = snowflakeTimestampMsOrNull(id);
  if (ms == null) {
    return null;
  }
  return DateTime.fromMillisecondsSinceEpoch(ms, isUtc: true);
}

DateTime dateTimeFromSnowflakeAsLocalOrNow(String snowflake) {
  final utc = dateTimeFromUserSnowflakeOrNull(snowflake);
  if (utc == null) {
    return DateTime.now();
  }
  return utc.toLocal();
}

String snowflakeFromDateTime(DateTime dateTime) {
  final int millis = dateTime.toUtc().millisecondsSinceEpoch;
  return (BigInt.from(millis - kSnowflakeEpochMs) << 22).toString();
}
