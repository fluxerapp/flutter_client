import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/database_provider.dart';
import 'package:fluxer_app/features/quick_switcher/data/quick_switcher_repository.dart';

final Provider<QuickSwitcherRepository> quickSwitcherRepositoryProvider =
    Provider<QuickSwitcherRepository>((Ref ref) {
      return QuickSwitcherRepository(ref.watch(fluxerDatabaseProvider));
    });
