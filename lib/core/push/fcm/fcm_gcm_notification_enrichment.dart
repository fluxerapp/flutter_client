const String kGcmNotificationTitleKey = 'gcm.notification.title';
const String kGcmNotificationBodyKey = 'gcm.notification.body';

Map<String, String> enrichGcmNotificationData(Map<String, String> data) {
  final Map<String, String> enriched = Map<String, String>.from(data);
  if (!enriched.containsKey('title')) {
    final String? title = enriched[kGcmNotificationTitleKey]?.trim();
    if (title != null && title.isNotEmpty) {
      enriched['title'] = title;
    }
  }
  if (!enriched.containsKey('body')) {
    final String? body = enriched[kGcmNotificationBodyKey]?.trim();
    if (body != null && body.isNotEmpty) {
      enriched['body'] = body;
    }
  }
  return enriched;
}
