import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart' hide Message;
import 'package:fluxer_app/core/providers/database_provider.dart';

final StreamProvider<List<NotificationMentionFeedData>>
notificationMentionFeedStreamProvider =
    StreamProvider<List<NotificationMentionFeedData>>((Ref ref) {
      final FluxerDatabase db = ref.watch(fluxerDatabaseProvider);
      return db.notificationDao.watchMentionFeedOrdered();
    });
