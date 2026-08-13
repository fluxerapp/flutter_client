import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/channels/domain/channel.dart';
import 'package:fluxer_app/features/channels/providers/channel_list_view_model.dart';
import 'package:fluxer_app/features/chat/presentation/widgets/channel/search/channel_search_option_card.dart';
import 'package:fluxer_app/features/chat/utils/channel_search_utils.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ChannelSearchMoreFiltersResult {
  const ChannelSearchMoreFiltersResult({
    this.pinned,
    this.authorTypes = const <String>{},
    this.linkHostname,
    this.fileName,
    this.fileExtension,
    this.dateFilterKey,
    this.dateValue,
  });

  final bool? pinned;
  final Set<String> authorTypes;
  final String? linkHostname;
  final String? fileName;
  final String? fileExtension;
  final String? dateFilterKey;
  final String? dateValue;
}

class ChannelSearchMoreFiltersSheet extends StatefulWidget {
  const ChannelSearchMoreFiltersSheet({
    required this.initial,
    required this.scrollController,
    required this.onDone,
    super.key,
  });

  final ChannelSearchMoreFiltersResult initial;
  final ScrollController scrollController;
  final ValueChanged<ChannelSearchMoreFiltersResult> onDone;

  @override
  State<ChannelSearchMoreFiltersSheet> createState() =>
      _ChannelSearchMoreFiltersSheetState();
}

class _ChannelSearchMoreFiltersSheetState
    extends State<ChannelSearchMoreFiltersSheet> {
  late final TextEditingController _linkController;
  late final TextEditingController _fileNameController;
  late final TextEditingController _fileTypeController;
  late bool? _pinned;
  late String? _dateFilterKey;
  DateTime? _selectedDate;
  late final Set<String> _authorTypes;

  @override
  void initState() {
    super.initState();
    _linkController = TextEditingController(text: widget.initial.linkHostname);
    _fileNameController = TextEditingController(text: widget.initial.fileName);
    _fileTypeController = TextEditingController(
      text: widget.initial.fileExtension,
    );
    _pinned = widget.initial.pinned;
    _dateFilterKey = widget.initial.dateFilterKey;
    _authorTypes = <String>{...widget.initial.authorTypes};
    if (widget.initial.dateValue != null &&
        widget.initial.dateValue!.isNotEmpty) {
      _selectedDate = DateTime.tryParse(widget.initial.dateValue!);
    }
  }

  @override
  void dispose() {
    _linkController.dispose();
    _fileNameController.dispose();
    _fileTypeController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(2015),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _toggleAuthorType(String value) {
    setState(() {
      if (_authorTypes.contains(value)) {
        _authorTypes.remove(value);
      } else {
        _authorTypes.add(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;

    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              controller: widget.scrollController,
              padding: FluxerBottomSheet.scrollViewPadding(
                context,
                padding: const EdgeInsets.symmetric(vertical: 4),
              ),
              children: <Widget>[
                Text(
                  l10n.channelDetailsSearchMoreFiltersPinned,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                ChannelSearchOptionCard(
                  icon: PhosphorIconsFill.pushPin,
                  label: l10n.channelDetailsSearchPinnedTrue,
                  isSelected: _pinned ?? false,
                  onTap: () => setState(() => _pinned = true),
                ),
                const SizedBox(height: 8),
                ChannelSearchOptionCard(
                  icon: PhosphorIconsBold.pushPinSlash,
                  label: l10n.channelDetailsSearchPinnedFalse,
                  isSelected: _pinned == false,
                  onTap: () => setState(() => _pinned = false),
                ),
                if (_pinned != null) ...<Widget>[
                  const SizedBox(height: 8),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: TextButton(
                      onPressed: () => setState(() => _pinned = null),
                      child: Text(l10n.channelDetailsSearchClearFilter),
                    ),
                  ),
                ],
                const SizedBox(height: 16),
                Text(
                  l10n.channelDetailsSearchMoreFiltersAuthorType,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                for (final String value
                    in kChannelSearchAuthorTypeValues) ...<Widget>[
                  ChannelSearchOptionCard(
                    icon: PhosphorIconsFill.robot,
                    label: channelSearchAuthorTypeLabel(l10n, value),
                    isSelected: _authorTypes.contains(value),
                    onTap: () => _toggleAuthorType(value),
                  ),
                  const SizedBox(height: 8),
                ],
                const SizedBox(height: 8),
                Text(
                  l10n.channelDetailsSearchMoreFiltersDate,
                  style: context.textStyles.bodySmall.copyWith(
                    color: colors.textSecondary,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  initialValue: _dateFilterKey,
                  decoration: InputDecoration(
                    labelText: l10n.channelDetailsSearchMoreFiltersDateMode,
                  ),
                  items: <DropdownMenuItem<String>>[
                    for (final String key in kChannelSearchDateFilterKeys)
                      DropdownMenuItem<String>(
                        value: key,
                        child: Text('$key:'),
                      ),
                  ],
                  onChanged: (String? value) =>
                      setState(() => _dateFilterKey = value),
                ),
                const SizedBox(height: 8),
                ChannelSearchOptionCard(
                  icon: PhosphorIconsFill.calendar,
                  label: _selectedDate == null
                      ? l10n.channelDetailsSearchMoreFiltersPickDate
                      : formatChannelSearchDate(_selectedDate!),
                  isSelected: _selectedDate != null,
                  onTap: _pickDate,
                ),
                const SizedBox(height: 16),
                FluxerInput(
                  controller: _linkController,
                  hint: l10n.channelDetailsSearchMoreFiltersLink,
                ),
                const SizedBox(height: 12),
                FluxerInput(
                  controller: _fileNameController,
                  hint: l10n.channelDetailsSearchMoreFiltersFileName,
                ),
                const SizedBox(height: 12),
                FluxerInput(
                  controller: _fileTypeController,
                  hint: l10n.channelDetailsSearchMoreFiltersFileType,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FluxerButton.primary(
              label: l10n.channelDetailsDone,
              onPressed: () {
                widget.onDone(
                  ChannelSearchMoreFiltersResult(
                    pinned: _pinned,
                    authorTypes: _authorTypes,
                    linkHostname: _linkController.text.trim().isEmpty
                        ? null
                        : _linkController.text.trim(),
                    fileName: _fileNameController.text.trim().isEmpty
                        ? null
                        : _fileNameController.text.trim(),
                    fileExtension: _fileTypeController.text.trim().isEmpty
                        ? null
                        : _fileTypeController.text.trim(),
                    dateFilterKey: _dateFilterKey,
                    dateValue: _selectedDate == null
                        ? null
                        : formatChannelSearchDate(_selectedDate!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChannelSearchChannelFilterSheet extends ConsumerStatefulWidget {
  const ChannelSearchChannelFilterSheet({
    required this.initialSelectedIds,
    required this.scrollController,
    required this.onDone,
    super.key,
  });

  final Set<String> initialSelectedIds;
  final ScrollController scrollController;
  final ValueChanged<List<Channel>> onDone;

  @override
  ConsumerState<ChannelSearchChannelFilterSheet> createState() =>
      _ChannelSearchChannelFilterSheetState();
}

class _ChannelSearchChannelFilterSheetState
    extends ConsumerState<ChannelSearchChannelFilterSheet> {
  late final TextEditingController _searchController;
  final Map<String, Channel> _selectedById = <String, Channel>{};
  String _searchTerm = '';
  bool _initializedSelection = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initializedSelection) {
      return;
    }
    _initializedSelection = true;
    for (final Channel channel in _channels) {
      if (widget.initialSelectedIds.contains(channel.id)) {
        _selectedById[channel.id] = channel;
      }
    }
  }

  @override
  void dispose() {
    _searchController
      ..removeListener(_onSearchChanged)
      ..dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    setState(() => _searchTerm = _searchController.text);
  }

  List<Channel> get _channels {
    final List<ChannelCategory> categories = ref
        .read(channelListViewModelProvider)
        .categories;
    return <Channel>[
      for (final ChannelCategory category in categories)
        ...category.channels.where(
          (Channel channel) =>
              channel.type == ChannelType.guildText ||
              channel.type == ChannelType.guildVoice,
        ),
    ];
  }

  List<Channel> get _filteredChannels {
    final String normalized = _searchTerm.trim().toLowerCase();
    if (normalized.isEmpty) {
      return _channels;
    }
    return _channels
        .where(
          (Channel channel) => channel.name.toLowerCase().contains(normalized),
        )
        .toList();
  }

  void _toggle(Channel channel) {
    setState(() {
      if (_selectedById.containsKey(channel.id)) {
        _selectedById.remove(channel.id);
      } else {
        _selectedById[channel.id] = channel;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final colors = context.colors;
    final List<Channel> channels = _filteredChannels;

    return Padding(
      padding: FluxerBottomSheet.scrollViewPadding(
        context,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      ),
      child: Column(
        children: <Widget>[
          FluxerInput(
            controller: _searchController,
            hint: l10n.channelDetailsSearchChannelsHint,
            prefixIcon: const PhosphorIcon(PhosphorIconsBold.magnifyingGlass),
            textInputAction: TextInputAction.search,
            autofocus: true,
          ),
          const SizedBox(height: 12),
          Expanded(
            child: channels.isEmpty
                ? Center(
                    child: Text(
                      l10n.channelDetailsSearchChannelsEmpty,
                      style: context.textStyles.bodySmall.copyWith(
                        color: colors.textSecondary,
                      ),
                    ),
                  )
                : ListView.separated(
                    controller: widget.scrollController,
                    itemCount: channels.length,
                    separatorBuilder: (_, _) => const SizedBox(height: 4),
                    itemBuilder: (BuildContext context, int index) {
                      final Channel channel = channels[index];
                      final bool isSelected = _selectedById.containsKey(
                        channel.id,
                      );
                      return _ChannelFilterRow(
                        channel: channel,
                        isSelected: isSelected,
                        onTap: () => _toggle(channel),
                      );
                    },
                  ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: FluxerButton.primary(
              label: l10n.channelDetailsDone,
              onPressed: () =>
                  widget.onDone(_selectedById.values.toList(growable: false)),
            ),
          ),
        ],
      ),
    );
  }
}

class _ChannelFilterRow extends StatelessWidget {
  const _ChannelFilterRow({
    required this.channel,
    required this.isSelected,
    required this.onTap,
  });

  final Channel channel;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final accent = colors.brandPrimaryLight;
    final background = isSelected
        ? accent.withValues(alpha: 0.10)
        : Colors.transparent;
    final borderColor = isSelected ? accent : colors.borderColor;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Row(
            children: [
              PhosphorIcon(
                PhosphorIconsBold.hash,
                size: 20,
                color: isSelected ? accent : colors.textSecondary,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  channel.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      (isSelected
                              ? context.textStyles.channelName
                              : context.textStyles.username)
                          .copyWith(fontSize: 15, color: colors.textPrimary),
                ),
              ),
              if (isSelected) ...[
                const SizedBox(width: 12),
                PhosphorIcon(PhosphorIconsBold.check, size: 20, color: accent),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
