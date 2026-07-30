import 'package:fluxer_app/features/discovery/domain/discovery_constants.dart';
import 'package:fluxer_app/features/settings/domain/guild/guild_discovery_application.dart';

enum GuildDiscoveryLoadStatus { loading, success, error }

class GuildDiscoverySettingsState {
  const GuildDiscoverySettingsState({
    required this.loadStatus,
    required this.eligible,
    required this.minMemberCount,
    required this.description,
    required this.categoryType,
    required this.primaryLanguage,
    required this.customTags,
    this.application,
    this.isSubmitting = false,
    this.isWithdrawing = false,
  });

  final GuildDiscoveryLoadStatus loadStatus;
  final bool eligible;
  final int minMemberCount;
  final GuildDiscoveryApplication? application;
  final String description;
  final int categoryType;
  final String primaryLanguage;
  final List<String> customTags;
  final bool isSubmitting;
  final bool isWithdrawing;

  bool get hasActiveApplication {
    final GuildDiscoveryApplication? current = application;
    if (current == null) {
      return false;
    }
    return current.status == DiscoveryApplicationStatus.pending ||
        current.status == DiscoveryApplicationStatus.approved;
  }

  bool get canApply {
    if (hasActiveApplication) {
      return false;
    }
    final GuildDiscoveryApplication? current = application;
    return current == null ||
        current.status == DiscoveryApplicationStatus.rejected ||
        current.status == DiscoveryApplicationStatus.removed;
  }

  bool get showsForm => canApply || hasActiveApplication;

  bool get isFormDisabled => !eligible && canApply;

  bool get showsEligibilityWarning => !eligible && canApply;

  GuildDiscoverySettingsState copyWith({
    GuildDiscoveryLoadStatus? loadStatus,
    bool? eligible,
    int? minMemberCount,
    GuildDiscoveryApplication? application,
    bool clearApplication = false,
    String? description,
    int? categoryType,
    String? primaryLanguage,
    List<String>? customTags,
    bool? isSubmitting,
    bool? isWithdrawing,
  }) {
    return GuildDiscoverySettingsState(
      loadStatus: loadStatus ?? this.loadStatus,
      eligible: eligible ?? this.eligible,
      minMemberCount: minMemberCount ?? this.minMemberCount,
      application: clearApplication ? null : (application ?? this.application),
      description: description ?? this.description,
      categoryType: categoryType ?? this.categoryType,
      primaryLanguage: primaryLanguage ?? this.primaryLanguage,
      customTags: customTags ?? this.customTags,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isWithdrawing: isWithdrawing ?? this.isWithdrawing,
    );
  }

  static GuildDiscoverySettingsState fromStatus(GuildDiscoveryStatus status) {
    final GuildDiscoveryApplication? application = status.application;
    final bool hasActive =
        application != null &&
        (application.status == DiscoveryApplicationStatus.pending ||
            application.status == DiscoveryApplicationStatus.approved);
    if (hasActive) {
      return GuildDiscoverySettingsState(
        loadStatus: GuildDiscoveryLoadStatus.success,
        eligible: status.eligible,
        minMemberCount: status.minMemberCount,
        application: application,
        description: application.description,
        categoryType: application.categoryType,
        primaryLanguage: application.primaryLanguage,
        customTags: List<String>.from(application.customTags),
      );
    }
    return GuildDiscoverySettingsState(
      loadStatus: GuildDiscoveryLoadStatus.success,
      eligible: status.eligible,
      minMemberCount: status.minMemberCount,
      application: application,
      description: '',
      categoryType: 0,
      primaryLanguage: DiscoveryConstants.defaultLanguage,
      customTags: const <String>[],
    );
  }

  static const GuildDiscoverySettingsState loading =
      GuildDiscoverySettingsState(
        loadStatus: GuildDiscoveryLoadStatus.loading,
        eligible: false,
        minMemberCount: 0,
        description: '',
        categoryType: 0,
        primaryLanguage: DiscoveryConstants.defaultLanguage,
        customTags: <String>[],
      );
}
