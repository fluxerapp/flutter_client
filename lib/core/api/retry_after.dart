import 'package:dio/dio.dart';

const _kFallbackDelayMs = 1000;

const _httpMonths = <String, int>{
  'jan': 1,
  'feb': 2,
  'mar': 3,
  'apr': 4,
  'may': 5,
  'jun': 6,
  'jul': 7,
  'aug': 8,
  'sep': 9,
  'oct': 10,
  'nov': 11,
  'dec': 12,
};

final _httpDatePattern = RegExp(
  r'^[A-Za-z]{3}, (\d{1,2}) ([A-Za-z]{3}) (\d{4}) (\d{2}):(\d{2}):(\d{2}) GMT$',
);

double? _positiveSeconds(Object? value) {
  if (value is num && value.isFinite && value > 0) {
    return value.toDouble();
  }
  if (value is String) {
    final parsed = num.tryParse(value.trim());
    if (parsed != null && parsed.isFinite && parsed > 0) {
      return parsed.toDouble();
    }
  }
  return null;
}

int? _secondsToMs(double? seconds) {
  if (seconds == null) {
    return null;
  }
  return (seconds * 1000).ceil();
}

int? _firstMs(Iterable<int?> values) {
  for (final value in values) {
    if (value != null) {
      return value;
    }
  }
  return null;
}

Map<dynamic, dynamic>? _asMap(Object? value) {
  return value is Map ? value : null;
}

int? _remainingMs(DateTime? deadline, DateTime Function() now) {
  if (deadline == null) {
    return null;
  }
  final remaining = deadline.difference(now()).inMilliseconds;
  return remaining > 0 ? remaining : null;
}

DateTime? _parseHttpDate(String raw) {
  final match = _httpDatePattern.firstMatch(raw.trim());
  if (match == null) {
    return null;
  }
  final month = _httpMonths[match.group(2)!.toLowerCase()];
  if (month == null) {
    return null;
  }
  return DateTime.utc(
    int.parse(match.group(3)!),
    month,
    int.parse(match.group(1)!),
    int.parse(match.group(4)!),
    int.parse(match.group(5)!),
    int.parse(match.group(6)!),
  );
}

int? _retryAfterHeaderMs(String? raw, DateTime Function() now) {
  if (raw == null) {
    return null;
  }
  final trimmed = raw.trim();
  if (trimmed.isEmpty) {
    return null;
  }
  final numeric = _secondsToMs(_positiveSeconds(trimmed));
  if (numeric != null) {
    return numeric;
  }
  return _remainingMs(
    DateTime.tryParse(trimmed) ?? _parseHttpDate(trimmed),
    now,
  );
}

double? _nestedRetryAfterSeconds(Object? data) {
  final retry = _asMap(_asMap(_asMap(data)?['details'])?['retry']);
  return _positiveSeconds(retry?['after_seconds']);
}

double? _bodyRetryAfterSeconds(Object? data) {
  return _positiveSeconds(_asMap(data)?['retry_after']);
}

bool isGlobalRateLimit({Headers? headers, Object? data}) {
  final flag = headers?.value('x-ratelimit-global');
  if (flag != null && flag.toLowerCase() == 'true') {
    return true;
  }
  return _asMap(data)?['global'] == true;
}

/// Transport pacing delay: reset-after, Retry-After, body, then 1s.
int transportRateLimitDelayMs({
  Headers? headers,
  Object? data,
  DateTime Function() now = DateTime.now,
}) {
  return _firstMs(<int?>[
        _secondsToMs(
          _positiveSeconds(headers?.value('x-ratelimit-reset-after')),
        ),
        _retryAfterHeaderMs(headers?.value('retry-after'), now),
        _secondsToMs(_bodyRetryAfterSeconds(data)),
      ]) ??
      _kFallbackDelayMs;
}

/// Feature delay: nested body, retry_after, then headers.
int? featureRetryAfterMs({
  Headers? headers,
  Object? data,
  DateTime Function() now = DateTime.now,
}) {
  return _firstMs(<int?>[
    _secondsToMs(_nestedRetryAfterSeconds(data)),
    _secondsToMs(_bodyRetryAfterSeconds(data)),
    _retryAfterHeaderMs(headers?.value('retry-after'), now),
    _secondsToMs(_positiveSeconds(headers?.value('x-ratelimit-reset-after'))),
  ]);
}
