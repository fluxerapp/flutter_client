import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/database/fluxer_database.dart';
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

class _InstanceSelectorControlState extends ConsumerState<InstanceSelectorControl> {
  final TextEditingController _controller = TextEditingController();
  bool _showRecentInstances = false;

  @override
  void initState() {
    super.initState();
    final String? initialUrl =
        ref.read(instanceSelectorProvider).asData?.value.instanceUrl;
    if (initialUrl != null) {
      _controller.text = initialUrl;
    }
    ref.listenManual<AsyncValue<InstanceSelectorState>>(
      instanceSelectorProvider,
      (
        AsyncValue<InstanceSelectorState>? previous,
        AsyncValue<InstanceSelectorState> next,
      ) {
        final String? instanceUrl = next.asData?.value.instanceUrl;
        if (instanceUrl != null && _controller.text != instanceUrl) {
          _controller.value = _controller.value.copyWith(
            text: instanceUrl,
            selection: TextSelection.collapsed(offset: instanceUrl.length),
          );
        }
        final InstanceDiscoveryStatus? previousStatus =
            previous?.asData?.value.status;
        final InstanceDiscoveryStatus? nextStatus = next.asData?.value.status;
        if (previousStatus != InstanceDiscoveryStatus.success &&
            nextStatus == InstanceDiscoveryStatus.success) {
          widget.onConnected?.call();
        }
      },
    );
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
    final InstanceSelector notifier = ref.read(instanceSelectorProvider.notifier);
    final bool isOfficial = ref.watch(isActiveInstanceOfficialProvider);

    return selectorAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (InstanceSelectorState selector) {
        final String? errorText = selector.status == InstanceDiscoveryStatus.error
            ? selector.errorMessage ?? l10n.instanceConnectFailed
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
                isOfficial: isOfficial && !selector.requiresDiscovery,
                size: 20,
              ),
              suffixIcon: _buildStatusIcon(context, selector.status),
              onChanged: notifier.updateInstanceUrl,
              errorText: errorText,
              textInputAction: TextInputAction.next,
            ),
            SizedBox(height: context.layout.s2),
            Row(
              children: [
                Expanded(
                  child: FluxerButton.secondary(
                    onPressed: !widget.enabled ||
                            selector.status == InstanceDiscoveryStatus.discovering
                        ? null
                        : () => unawaited(notifier.connectToCurrentUrl()),
                    label: selector.status == InstanceDiscoveryStatus.discovering
                        ? l10n.instanceConnecting
                        : l10n.instanceConnect,
                    isLoading:
                        selector.status == InstanceDiscoveryStatus.discovering,
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
                  unawaited(notifier.selectRecentInstance(instance));
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
        return FluxerLoadingSpinner(
          color: context.colors.textPrimaryMuted,
        );
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
    final bool canAuthenticate = ref.watch(instanceSelectorCanAuthenticateProvider);

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
        children: instances
            .map(
              (RecentInstance instance) {
                final String displayDomain =
                    const InstanceEndpointNormalizer().formatDisplayDomain(
                  instance.domain,
                );
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
              },
            )
            .toList(),
      ),
    );
  }
}
