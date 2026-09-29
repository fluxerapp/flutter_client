import 'package:timezone/data/latest.dart' as tz_data;
import 'package:timezone/timezone.dart' as tz;

bool _initialized = false;

void ensureTimezoneDatabaseInitialized() {
  if (_initialized) {
    return;
  }
  tz_data.initializeTimeZones();
  _initialized = true;
}

class TimezoneCatalogOption {
  const TimezoneCatalogOption({
    required this.id,
    required this.label,
    required this.searchText,
    required this.offsetMinutes,
  });

  final String id;
  final String label;
  final String searchText;
  final int offsetMinutes;
}

String formatUtcOffsetLabel(int offsetMinutes) {
  final String sign = offsetMinutes >= 0 ? '+' : '-';
  final int absolute = offsetMinutes.abs();
  final String hours = (absolute ~/ 60).toString().padLeft(2, '0');
  final String minutes = (absolute % 60).toString().padLeft(2, '0');
  return 'UTC$sign$hours:$minutes';
}

String _formatZonePlaceName(String id) {
  if (id == 'UTC') {
    return 'UTC';
  }
  return id.replaceAll('_', ' ');
}

int? currentOffsetMinutesForTimezone(String? timezoneId) {
  final String? trimmed = timezoneId?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }
  ensureTimezoneDatabaseInitialized();
  try {
    final tz.Location location = tz.getLocation(trimmed);
    final tz.TZDateTime now = tz.TZDateTime.now(location);
    return now.timeZoneOffset.inMinutes;
  } on Object {
    return null;
  }
}

List<TimezoneCatalogOption> buildTimezoneCatalogOptions() {
  ensureTimezoneDatabaseInitialized();
  final DateTime utcNow = DateTime.now().toUtc();
  final List<TimezoneCatalogOption> options = <TimezoneCatalogOption>[];

  for (final MapEntry<String, tz.Location> entry
      in tz.timeZoneDatabase.locations.entries) {
    final String id = entry.key;
    final tz.Location location = entry.value;
    final tz.TZDateTime zoned = tz.TZDateTime.from(utcNow, location);
    final int offsetMinutes = zoned.timeZoneOffset.inMinutes;
    final String place = _formatZonePlaceName(id);
    final String label = '${formatUtcOffsetLabel(offsetMinutes)} $place';
    options.add(
      TimezoneCatalogOption(
        id: id,
        label: label,
        searchText: '$id $place',
        offsetMinutes: offsetMinutes,
      ),
    );
  }

  options.sort((TimezoneCatalogOption a, TimezoneCatalogOption b) {
    final int byOffset = a.offsetMinutes.compareTo(b.offsetMinutes);
    if (byOffset != 0) {
      return byOffset;
    }
    return a.label.compareTo(b.label);
  });
  return options;
}
