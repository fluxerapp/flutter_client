/// Fluxer snowflake epoch (2015-01-01T00:00:00.000Z) in milliseconds.
const int kSnowflakeEpochMs = 1420070400000;

DateTime? dateTimeFromUserSnowflakeOrNull(String id) {
  final parsed = int.tryParse(id);
  if (parsed == null) {
    return null;
  }
  final ms = (parsed >> 22) + kSnowflakeEpochMs;
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
