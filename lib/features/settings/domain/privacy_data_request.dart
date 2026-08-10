import 'package:fluxer_dart/export.dart';

enum PrivacyDataRequestVariant { export, delete }

enum PrivacyDataRequestStep { scope, kinds, communities, when, confirm }

enum PrivacyDataRequestScope { everything, custom, selected, inaccessibleOnly }

enum PrivacyDataRequestDateMode { allTime, custom }

enum PrivacyDataRequestGuildFilterMode { exclude, includeOnly }

class PrivacyDataRequestFilterState {
  const PrivacyDataRequestFilterState({
    required this.scope,
    this.includeDms = true,
    this.includeDmsClosed = true,
    this.includeGroupDms = true,
    this.includeGuilds = true,
    this.guildFilterMode = PrivacyDataRequestGuildFilterMode.exclude,
    this.excludedGuildIds = const <String>{},
    this.includedGuildIds = const <String>{},
    this.dateMode = PrivacyDataRequestDateMode.allTime,
    this.startDate,
    this.endDate,
  });

  factory PrivacyDataRequestFilterState.initial(
    PrivacyDataRequestVariant variant,
  ) {
    return PrivacyDataRequestFilterState(
      scope: variant == PrivacyDataRequestVariant.export
          ? PrivacyDataRequestScope.everything
          : PrivacyDataRequestScope.selected,
    );
  }

  final PrivacyDataRequestScope scope;
  final bool includeDms;
  final bool includeDmsClosed;
  final bool includeGroupDms;
  final bool includeGuilds;
  final PrivacyDataRequestGuildFilterMode guildFilterMode;
  final Set<String> excludedGuildIds;
  final Set<String> includedGuildIds;
  final PrivacyDataRequestDateMode dateMode;
  final DateTime? startDate;
  final DateTime? endDate;

  PrivacyDataRequestFilterState copyWith({
    PrivacyDataRequestScope? scope,
    bool? includeDms,
    bool? includeDmsClosed,
    bool? includeGroupDms,
    bool? includeGuilds,
    PrivacyDataRequestGuildFilterMode? guildFilterMode,
    Set<String>? excludedGuildIds,
    Set<String>? includedGuildIds,
    PrivacyDataRequestDateMode? dateMode,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return PrivacyDataRequestFilterState(
      scope: scope ?? this.scope,
      includeDms: includeDms ?? this.includeDms,
      includeDmsClosed: includeDmsClosed ?? this.includeDmsClosed,
      includeGroupDms: includeGroupDms ?? this.includeGroupDms,
      includeGuilds: includeGuilds ?? this.includeGuilds,
      guildFilterMode: guildFilterMode ?? this.guildFilterMode,
      excludedGuildIds: excludedGuildIds ?? this.excludedGuildIds,
      includedGuildIds: includedGuildIds ?? this.includedGuildIds,
      dateMode: dateMode ?? this.dateMode,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
    );
  }

  bool isCustomScope(PrivacyDataRequestVariant variant) {
    return variant == PrivacyDataRequestVariant.export
        ? scope == PrivacyDataRequestScope.custom
        : scope == PrivacyDataRequestScope.selected;
  }

  bool showKinds(PrivacyDataRequestVariant variant) => isCustomScope(variant);

  bool showCommunities(PrivacyDataRequestVariant variant) =>
      isCustomScope(variant) && includeGuilds;

  bool showWhen(PrivacyDataRequestVariant variant) =>
      isCustomScope(variant) || variant == PrivacyDataRequestVariant.delete;

  List<PrivacyDataRequestStep> visibleSteps(PrivacyDataRequestVariant variant) {
    final List<PrivacyDataRequestStep> steps = <PrivacyDataRequestStep>[
      PrivacyDataRequestStep.scope,
    ];
    if (showKinds(variant)) {
      steps.add(PrivacyDataRequestStep.kinds);
    }
    if (showCommunities(variant)) {
      steps.add(PrivacyDataRequestStep.communities);
    }
    if (showWhen(variant)) {
      steps.add(PrivacyDataRequestStep.when);
    }
    steps.add(PrivacyDataRequestStep.confirm);
    return steps;
  }

  HarvestSelfDataRequest toHarvestRequest() {
    final bool guildsActive = includeGuilds;
    return HarvestSelfDataRequest(
      scope: HarvestSelfDataRequestScopeScope.selected,
      includeDms: includeDms,
      includeDmsClosed: includeDmsClosed,
      includeGroupDms: includeGroupDms,
      includeGuilds: includeGuilds,
      guildFilterMode:
          guildFilterMode == PrivacyDataRequestGuildFilterMode.exclude
          ? HarvestSelfDataRequestGuildFilterModeGuildFilterMode.exclude
          : HarvestSelfDataRequestGuildFilterModeGuildFilterMode.includeOnly,
      excludedGuildIds:
          guildsActive &&
              guildFilterMode == PrivacyDataRequestGuildFilterMode.exclude
          ? excludedGuildIds.toList()
          : const <String>[],
      includedGuildIds:
          guildsActive &&
              guildFilterMode == PrivacyDataRequestGuildFilterMode.includeOnly
          ? includedGuildIds.toList()
          : const <String>[],
      startDate: dateMode == PrivacyDataRequestDateMode.custom
          ? startDate
          : null,
      endDate: dateMode == PrivacyDataRequestDateMode.custom ? endDate : null,
    );
  }

  BulkDeleteSelfMessagesRequest toDeleteRequest() {
    final BulkDeleteSelfMessagesRequestScopeScope deleteScope =
        scope == PrivacyDataRequestScope.inaccessibleOnly
        ? BulkDeleteSelfMessagesRequestScopeScope.inaccessibleOnly
        : BulkDeleteSelfMessagesRequestScopeScope.selected;
    final bool guildsActive =
        deleteScope == BulkDeleteSelfMessagesRequestScopeScope.selected &&
        includeGuilds;

    return BulkDeleteSelfMessagesRequest(
      scope: deleteScope,
      includeDms:
          deleteScope == BulkDeleteSelfMessagesRequestScopeScope.selected
          ? includeDms
          : false,
      includeDmsClosed:
          deleteScope == BulkDeleteSelfMessagesRequestScopeScope.selected
          ? includeDmsClosed
          : false,
      includeGroupDms:
          deleteScope == BulkDeleteSelfMessagesRequestScopeScope.selected
          ? includeGroupDms
          : false,
      includeGuilds:
          deleteScope == BulkDeleteSelfMessagesRequestScopeScope.selected
          ? includeGuilds
          : true,
      guildFilterMode:
          guildFilterMode == PrivacyDataRequestGuildFilterMode.exclude
          ? BulkDeleteSelfMessagesRequestGuildFilterModeGuildFilterMode.exclude
          : BulkDeleteSelfMessagesRequestGuildFilterModeGuildFilterMode
                .includeOnly,
      excludedGuildIds:
          guildsActive &&
              guildFilterMode == PrivacyDataRequestGuildFilterMode.exclude
          ? excludedGuildIds.toList()
          : const <String>[],
      includedGuildIds:
          guildsActive &&
              guildFilterMode == PrivacyDataRequestGuildFilterMode.includeOnly
          ? includedGuildIds.toList()
          : const <String>[],
      startDate: dateMode == PrivacyDataRequestDateMode.custom
          ? startDate
          : null,
      endDate: dateMode == PrivacyDataRequestDateMode.custom ? endDate : null,
    );
  }
}
