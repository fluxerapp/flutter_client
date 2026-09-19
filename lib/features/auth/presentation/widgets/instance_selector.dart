import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_domain_icon.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InstanceSelectorControl extends ConsumerStatefulWidget {
  const InstanceSelectorControl({
    required this.enabled,
    this.onConnected,
    super.key,
  });

  final bool enabled;
  final VoidCallback? onConnected;

  @override
  ConsumerState<InstanceSelectorControl> createState() =>
      _InstanceSelectorControlState();
}

class _InstanceSelectorControlState
    extends ConsumerState<InstanceSelectorControl> {
  final TextEditingController _controller = TextEditingController();
  String _draftUrl = '';

  @override
  void initState() {
    super.initState();
    final String? initialUrl = ref
        .read(instanceSelectorProvider)
        .asData
        ?.value
        .instanceUrl;
    if (initialUrl != null) {
      _controller.text = initialUrl;
      _draftUrl = initialUrl;
    }
    ref.listenManual<AsyncValue<InstanceSelectorState>>(
      instanceSelectorProvider,
      (
        AsyncValue<InstanceSelectorState>? previous,
        AsyncValue<InstanceSelectorState> next,
      ) {
        final String? previousUrl = previous?.asData?.value.instanceUrl;
        final String? instanceUrl = next.asData?.value.instanceUrl;
        if (instanceUrl != null && previousUrl != instanceUrl) {
          _replaceDraft(instanceUrl);
        }
      },
    );
  }

  void _replaceDraft(String value) {
    if (_controller.text != value) {
      _controller.value = _controller.value.copyWith(
        text: value,
        selection: TextSelection.collapsed(offset: value.length),
      );
    }
    if (_draftUrl != value) {
      setState(() => _draftUrl = value);
    }
  }

  void _handleDraftChanged(String value) {
    final InstanceSelectorState? selector = ref
        .read(instanceSelectorProvider)
        .asData
        ?.value;
    if (selector?.status == InstanceDiscoveryStatus.discovering) {
      ref.read(instanceSelectorProvider.notifier).cancelPendingConnection();
    }
    setState(() => _draftUrl = value);
  }

  Future<void> _connectTo(String value) async {
    final String input = value.trim();
    _replaceDraft(input);
    final bool connected = await ref
        .read(instanceSelectorProvider.notifier)
        .connectToUrl(input);
    if (connected && mounted) {
      widget.onConnected?.call();
    }
  }

  Future<void> _resetToOfficialDefault() async {
    _replaceDraft(InstanceConstants.defaultInstanceInputUrl);
    final bool connected = await ref
        .read(instanceSelectorProvider.notifier)
        .resetToOfficialDefault();
    if (connected && mounted) {
      widget.onConnected?.call();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<InstanceSelectorState> selectorAsync = ref.watch(
      instanceSelectorProvider,
    );
    final InstanceSelector notifier = ref.read(
      instanceSelectorProvider.notifier,
    );

    return selectorAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (InstanceSelectorState selector) {
        final bool draftChanged = _draftUrl != selector.instanceUrl;
        final InstanceSelectorState viewState = draftChanged
            ? selector.copyWith(
                instanceUrl: _draftUrl,
                status: InstanceDiscoveryStatus.idle,
                requiresDiscovery: _draftUrl.trim().isNotEmpty,
                clearError: true,
              )
            : selector;
        final bool isOfficial = const InstanceEndpointNormalizer()
            .isOfficialInstanceInput(viewState.instanceUrl);
        final bool discovering =
            viewState.status == InstanceDiscoveryStatus.discovering;
        final bool canSubmit = widget.enabled && !discovering;
        final String? errorText =
            viewState.status == InstanceDiscoveryStatus.error
            ? viewState.errorMessage ?? l10n.instanceConnectFailed
            : null;

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FluxerInput(
              controller: _controller,
              label: l10n.instanceUrlLabel,
              hint: l10n.instanceUrlPlaceholder,
              helperText: l10n.instanceUrlHelper,
              enabled: widget.enabled,
              prefixIcon: InstanceDomainIcon(
                isOfficial: isOfficial && !viewState.requiresDiscovery,
                size: 20,
              ),
              suffixIcon: _buildStatusIcon(context, viewState.status),
              onChanged: _handleDraftChanged,
              onSubmitted: (String value) => unawaited(_connectTo(value)),
              errorText: errorText,
              keyboardType: TextInputType.url,
              autocorrect: false,
              enableSuggestions: false,
              textInputAction: TextInputAction.go,
            ),
            SizedBox(height: context.layout.s3),
            FluxerButton.primary(
              onPressed: canSubmit
                  ? () => unawaited(_connectTo(_draftUrl))
                  : null,
              label: discovering
                  ? l10n.instanceConnecting
                  : l10n.instanceConnect,
              isLoading: discovering,
            ),
            if (_shouldShowReset(viewState, isOfficial)) ...[
              SizedBox(height: context.layout.s2),
              Center(
                child: FluxerButton.ghost(
                  onPressed: canSubmit
                      ? () => unawaited(_resetToOfficialDefault())
                      : null,
                  label: l10n.resetToDefaultInstance,
                  fitContent: true,
                ),
              ),
            ],
            if (selector.recentInstances.isNotEmpty) ...[
              SizedBox(height: context.layout.s2),
              _RecentInstancesList(
                instances: selector.recentInstances,
                enabled: widget.enabled,
                onSelect: (RecentInstance instance) {
                  unawaited(_connectTo(instance.domain));
                },
                onRemove: (String domain) {
                  unawaited(notifier.removeRecentInstance(domain));
                },
              ),
            ],
          ],
        );
      },
    );
  }

  bool _shouldShowReset(InstanceSelectorState selector, bool isOfficial) {
    if (selector.status == InstanceDiscoveryStatus.discovering) {
      return false;
    }
    final String current = selector.instanceUrl.trim().toLowerCase();
    const String defaultUrl = InstanceConstants.defaultInstanceInputUrl;
    return !isOfficial || current != defaultUrl || selector.requiresDiscovery;
  }

  Widget? _buildStatusIcon(
    BuildContext context,
    InstanceDiscoveryStatus status,
  ) {
    switch (status) {
      case InstanceDiscoveryStatus.success:
        return PhosphorIcon(
          PhosphorIconsFill.checkCircle,
          color: context.colors.textPositive,
          size: 20,
        );
      case InstanceDiscoveryStatus.error:
        return PhosphorIcon(
          PhosphorIconsFill.warningCircle,
          color: context.colors.textDanger,
          size: 20,
        );
      case InstanceDiscoveryStatus.discovering:
        return FluxerLoadingSpinner(color: context.colors.textPrimaryMuted);
      case InstanceDiscoveryStatus.idle:
        return null;
    }
  }
}

class InstanceSelectorLoginEntry extends ConsumerWidget {
  const InstanceSelectorLoginEntry({
    required this.enabled,
    required this.onOpenSheet,
    super.key,
  });

  final bool enabled;
  final VoidCallback onOpenSheet;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final AsyncValue<InstanceSelectorState> selectorAsync = ref.watch(
      instanceSelectorProvider,
    );
    final InstanceConfigSnapshot snapshot = ref.watch(
      authInstanceSnapshotProvider,
    );
    const InstanceEndpointNormalizer normalizer = InstanceEndpointNormalizer();
    final bool isOfficial = normalizer.isOfficialInstanceInput(
      snapshot.apiBaseUrl,
    );
    final String displayDomain = normalizer.formatDisplayDomain(
      snapshot.displayDomain,
    );
    final bool canAuthenticate = ref.watch(
      instanceSelectorCanAuthenticateProvider,
    );

    return selectorAsync.maybeWhen(
      data: (InstanceSelectorState selector) => _buildEntry(
        context,
        l10n,
        selector,
        isOfficial,
        displayDomain,
        canAuthenticate,
      ),
      orElse: () => const SizedBox.shrink(),
    );
  }

  Widget _buildEntry(
    BuildContext context,
    FluxerLocalizations l10n,
    InstanceSelectorState selector,
    bool isOfficial,
    String displayDomain,
    bool canAuthenticate,
  ) {
    if (!canAuthenticate) {
      final String hint = selector.status == InstanceDiscoveryStatus.error
          ? selector.errorMessage ?? l10n.instanceConnectFailed
          : selector.status == InstanceDiscoveryStatus.discovering
          ? l10n.instanceConnecting
          : l10n.instanceConnectionRequired;
      return Column(
        children: [
          Text(
            hint,
            textAlign: TextAlign.center,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textDanger,
            ),
          ),
          SizedBox(height: context.layout.s2),
          _InstanceChangeRow(
            enabled: enabled,
            isOfficial: false,
            displayDomain: displayDomain,
            isError: true,
            onOpen: onOpenSheet,
          ),
        ],
      );
    }

    return _InstanceChangeRow(
      enabled: enabled,
      isOfficial: isOfficial,
      displayDomain: displayDomain,
      onOpen: onOpenSheet,
    );
  }
}

class _InstanceChangeRow extends StatelessWidget {
  const _InstanceChangeRow({
    required this.enabled,
    required this.isOfficial,
    required this.displayDomain,
    required this.onOpen,
    this.isError = false,
  });

  final bool enabled;
  final bool isOfficial;
  final String displayDomain;
  final VoidCallback onOpen;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerTappable(
      enabled: enabled,
      onTap: onOpen,
      excludeChildSemantics: true,
      semanticLabel: '$displayDomain, ${l10n.changeInstance}',
      builder: (BuildContext context, Set<WidgetState> states) {
        final bool highlighted =
            states.contains(WidgetState.hovered) ||
            states.contains(WidgetState.pressed);
        return AnimatedContainer(
          duration: context.motion.fast,
          curve: context.motion.curve,
          width: double.infinity,
          constraints: const BoxConstraints(minHeight: 44),
          padding: EdgeInsets.symmetric(
            horizontal: layout.s3,
            vertical: layout.s2,
          ),
          decoration: BoxDecoration(
            color: highlighted
                ? colors.backgroundModifierHover
                : colors.backgroundTertiary,
            borderRadius: layout.radiusLg,
            border: Border.all(
              color: isError
                  ? colors.statusDanger
                  : colors.backgroundModifierAccent,
            ),
          ),
          child: Row(
            children: [
              InstanceDomainIcon(isOfficial: isOfficial, size: 18),
              SizedBox(width: layout.s2),
              Expanded(
                child: Text(
                  displayDomain,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                l10n.changeInstance,
                style: context.textStyles.bodySmall.copyWith(
                  color: colors.textLink,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _RecentInstancesList extends StatelessWidget {
  const _RecentInstancesList({
    required this.instances,
    required this.enabled,
    required this.onSelect,
    required this.onRemove,
  });

  final List<RecentInstance> instances;
  final bool enabled;
  final void Function(RecentInstance instance) onSelect;
  final void Function(String domain) onRemove;

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    const InstanceEndpointNormalizer normalizer = InstanceEndpointNormalizer();
    return FluxerListSection(
      header: l10n.recentInstances,
      children: instances.map((RecentInstance instance) {
        final String displayDomain = normalizer.formatDisplayDomain(
          instance.domain,
        );
        return FluxerListRow(
          leading: const InstanceDomainIcon(isOfficial: false, size: 20),
          title: instance.name ?? displayDomain,
          subtitle: instance.name != null ? displayDomain : null,
          onTap: enabled ? () => onSelect(instance) : null,
          trailing: FluxerButton.ghost(
            onPressed: enabled ? () => onRemove(instance.domain) : null,
            icon: PhosphorIconsFill.trash,
            isSquare: true,
            size: FluxerButtonSize.compact,
            semanticLabel: l10n.removeRecentInstance(displayDomain),
          ),
        );
      }).toList(),
    );
  }
}
