import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
import 'package:fluxer_app/core/instance/instance_constants.dart';
import 'package:fluxer_app/core/instance/instance_endpoint_normalizer.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_domain_icon.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/spinner/fluxer_loading_spinner.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class InstanceSelectorControl extends ConsumerStatefulWidget {
  const InstanceSelectorControl({
    required this.enabled,
    this.compact = false,
    this.onConnected,
    super.key,
  });

  final bool enabled;
  final bool compact;
  final VoidCallback? onConnected;

  @override
  ConsumerState<InstanceSelectorControl> createState() =>
      _InstanceSelectorControlState();
}

class _InstanceSelectorControlState
    extends ConsumerState<InstanceSelectorControl> {
  final TextEditingController _controller = TextEditingController();
  String _draftUrl = '';
  bool _showRecentInstances = false;

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
    final bool isOfficial = ref.watch(isActiveInstanceOfficialProvider);

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
              enabled: widget.enabled,
              prefixIcon: InstanceDomainIcon(
                isOfficial: isOfficial && !viewState.requiresDiscovery,
                size: 20,
              ),
              suffixIcon: _buildSuffixIcons(context, viewState, isOfficial),
              onChanged: _handleDraftChanged,
              onSubmitted: (String value) => unawaited(_connectTo(value)),
              errorText: errorText,
              keyboardType: TextInputType.url,
              autocorrect: false,
              enableSuggestions: false,
              textInputAction: TextInputAction.go,
            ),
            SizedBox(height: context.layout.s2),
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    onPressed:
                        !widget.enabled ||
                            viewState.status ==
                                InstanceDiscoveryStatus.discovering
                        ? null
                        : () => unawaited(_connectTo(_draftUrl)),
                    label:
                        viewState.status == InstanceDiscoveryStatus.discovering
                        ? l10n.instanceConnecting
                        : l10n.instanceConnect,
                    isLoading:
                        viewState.status == InstanceDiscoveryStatus.discovering,
                  ),
                ),
                if (selector.recentInstances.isNotEmpty) ...[
                  SizedBox(width: context.layout.s2),
                  IconButton(
                    tooltip: l10n.recentInstances,
                    onPressed: widget.enabled
                        ? () => setState(
                            () => _showRecentInstances = !_showRecentInstances,
                          )
                        : null,
                    icon: PhosphorIcon(
                      _showRecentInstances
                          ? PhosphorIconsFill.caretUp
                          : PhosphorIconsFill.caretDown,
                      color: context.colors.textPrimaryMuted,
                    ),
                  ),
                ],
              ],
            ),
            if (_showRecentInstances && selector.recentInstances.isNotEmpty)
              _RecentInstancesList(
                instances: selector.recentInstances,
                enabled: widget.enabled,
                onSelect: (RecentInstance instance) {
                  setState(() => _showRecentInstances = false);
                  unawaited(_connectTo(instance.domain));
                },
                onRemove: (String domain) {
                  unawaited(notifier.removeRecentInstance(domain));
                },
              ),
            if (!widget.compact) SizedBox(height: context.layout.s6),
          ],
        );
      },
    );
  }

  Widget? _buildSuffixIcons(
    BuildContext context,
    InstanceSelectorState selector,
    bool isOfficial,
  ) {
    final Widget? statusIcon = _buildStatusIcon(context, selector.status);
    final bool showReset = _shouldShowReset(selector, isOfficial);
    if (!showReset) {
      return statusIcon;
    }
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tooltip(
          message: l10n.resetToDefaultInstance,
          child: IconButton(
            visualDensity: VisualDensity.compact,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            tooltip: l10n.resetToDefaultInstance,
            onPressed:
                !widget.enabled ||
                    selector.status == InstanceDiscoveryStatus.discovering
                ? null
                : () => unawaited(_resetToOfficialDefault()),
            icon: PhosphorIcon(
              PhosphorIconsFill.arrowsCounterClockwise,
              color: context.colors.textPrimaryMuted,
              size: 20,
            ),
          ),
        ),
        ?statusIcon,
      ],
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
    final bool isOfficial = ref.watch(isActiveInstanceOfficialProvider);
    final String displayDomain = ref.watch(activeInstanceDisplayDomainProvider);
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
    final TextStyle tertiaryStyle = context.textStyles.bodySmall.copyWith(
      color: context.colors.textTertiary,
      fontSize: 12,
    );
    void openSheet() {
      if (!enabled) {
        return;
      }
      onOpenSheet();
    }

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
            style: tertiaryStyle.copyWith(color: context.colors.textDanger),
          ),
          SizedBox(height: context.layout.s1),
          Center(
            child: FluxerTextLink(
              text: l10n.connectToDifferentInstance,
              onTap: openSheet,
              style: tertiaryStyle,
              color: context.colors.textTertiary,
            ),
          ),
        ],
      );
    }

    if (!isOfficial) {
      return Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const InstanceDomainIcon(isOfficial: false),
            SizedBox(width: context.layout.s1),
            Text(displayDomain, style: tertiaryStyle),
            Text(' · ', style: tertiaryStyle),
            FluxerTextLink(
              text: l10n.changeInstance,
              onTap: openSheet,
              style: tertiaryStyle,
              color: context.colors.textTertiary,
            ),
          ],
        ),
      );
    }

    return Center(
      child: FluxerTextLink(
        text: l10n.connectToDifferentInstance,
        onTap: openSheet,
        style: tertiaryStyle,
        color: context.colors.textTertiary,
      ),
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
    return Padding(
      padding: EdgeInsets.only(top: context.layout.s2),
      child: Column(
        children: instances.map((RecentInstance instance) {
          final String displayDomain = const InstanceEndpointNormalizer()
              .formatDisplayDomain(instance.domain);
          return ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(
              instance.name ?? displayDomain,
              style: context.textStyles.bodySmall,
            ),
            subtitle: instance.name != null
                ? Text(
                    displayDomain,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textTertiary,
                    ),
                  )
                : null,
            onTap: enabled ? () => onSelect(instance) : null,
            trailing: IconButton(
              tooltip: l10n.removeRecentInstance(displayDomain),
              onPressed: enabled ? () => onRemove(instance.domain) : null,
              icon: PhosphorIcon(
                PhosphorIconsFill.trash,
                color: context.colors.textTertiary,
                size: 18,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
