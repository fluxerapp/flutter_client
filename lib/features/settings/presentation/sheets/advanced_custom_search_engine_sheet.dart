import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/domain/search_provider_engine.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/advanced_preferences_provider.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

Future<void> showAdvancedCustomSearchEngineSheet(
  BuildContext context, {
  required SearchProviderMode mode,
  String? editingEngineId,
  String initialName = '',
  String initialUrlTemplate = '',
}) {
  final l10n = FluxerLocalizations.of(context);
  final isEditing = editingEngineId != null;
  final title = switch (mode) {
    SearchProviderMode.text =>
      isEditing
          ? l10n.advancedSettingEditSearchEngineTitle
          : l10n.advancedSettingAddSearchEngineTitle,
    SearchProviderMode.translate =>
      isEditing
          ? l10n.advancedSettingEditTranslatorTitle
          : l10n.advancedSettingAddTranslatorTitle,
    SearchProviderMode.image =>
      isEditing
          ? l10n.advancedSettingEditReverseImageSearchTitle
          : l10n.advancedSettingAddReverseImageSearchTitle,
  };

  return FluxerPageSheet.showScrollable<void>(
    context,
    title: title,
    builder: (sheetContext, scrollController, close) {
      return _CustomSearchEngineSheetBody(
        mode: mode,
        editingEngineId: editingEngineId,
        initialName: initialName,
        initialUrlTemplate: initialUrlTemplate,
        scrollController: scrollController,
        onClose: close,
      );
    },
  );
}

class _CustomSearchEngineSheetBody extends ConsumerStatefulWidget {
  const _CustomSearchEngineSheetBody({
    required this.mode,
    required this.scrollController,
    required this.onClose,
    this.editingEngineId,
    this.initialName = '',
    this.initialUrlTemplate = '',
  });

  final SearchProviderMode mode;
  final String? editingEngineId;
  final String initialName;
  final String initialUrlTemplate;
  final ScrollController scrollController;
  final VoidCallback onClose;

  @override
  ConsumerState<_CustomSearchEngineSheetBody> createState() =>
      _CustomSearchEngineSheetBodyState();
}

class _CustomSearchEngineSheetBodyState
    extends ConsumerState<_CustomSearchEngineSheetBody> {
  late final TextEditingController _nameController;
  late final TextEditingController _urlController;
  String? _error;

  bool get _isEditing => widget.editingEngineId != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _urlController = TextEditingController(text: widget.initialUrlTemplate);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _urlController.dispose();
    super.dispose();
  }

  String get _placeholder {
    return switch (widget.mode) {
      SearchProviderMode.image => '{url}',
      SearchProviderMode.text || SearchProviderMode.translate => '{query}',
    };
  }

  String? _validate(FluxerLocalizations l10n) {
    final name = _nameController.text.trim();
    final urlTemplate = _urlController.text.trim();

    if (name.isEmpty) {
      return l10n.advancedSettingSearchProviderNameRequired;
    }
    if (urlTemplate.isEmpty) {
      return l10n.advancedSettingSearchProviderUrlRequired;
    }
    if (!urlTemplate.contains(_placeholder)) {
      return switch (widget.mode) {
        SearchProviderMode.image =>
          l10n.advancedSettingSearchProviderUrlMustContainUrl('{url}'),
        SearchProviderMode.text || SearchProviderMode.translate =>
          l10n.advancedSettingSearchProviderUrlMustContainQuery('{query}'),
      };
    }
    final uri = Uri.tryParse(urlTemplate.split(_placeholder).first);
    if (uri == null || !uri.hasScheme) {
      return l10n.advancedSettingSearchProviderUrlMustBeValid;
    }
    return null;
  }

  Future<void> _submit() async {
    final l10n = FluxerLocalizations.of(context);
    final error = _validate(l10n);
    if (error != null) {
      setState(() => _error = error);
      return;
    }

    final notifier = ref.read(advancedPreferencesProvider.notifier);
    final name = _nameController.text.trim();
    final urlTemplate = _urlController.text.trim();

    if (_isEditing) {
      await notifier.updateCustomSearchProvider(
        mode: widget.mode,
        engineId: widget.editingEngineId!,
        name: name,
        urlTemplate: urlTemplate,
      );
    } else {
      await notifier.addCustomSearchProvider(
        mode: widget.mode,
        name: name,
        urlTemplate: urlTemplate,
      );
    }

    if (mounted) {
      widget.onClose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;
    final placeholderDescription = switch (widget.mode) {
      SearchProviderMode.image =>
        l10n.advancedSettingSearchProviderUrlImageHint('{url}'),
      SearchProviderMode.text => l10n.advancedSettingSearchProviderUrlTextHint(
        '{query}',
      ),
      SearchProviderMode.translate =>
        l10n.advancedSettingSearchProviderUrlTranslateHint('{query}'),
    };
    final namePlaceholder = switch (widget.mode) {
      SearchProviderMode.image =>
        l10n.advancedSettingSearchProviderNameImagePlaceholder,
      SearchProviderMode.text =>
        l10n.advancedSettingSearchProviderNameTextPlaceholder,
      SearchProviderMode.translate =>
        l10n.advancedSettingSearchProviderNameTranslatePlaceholder,
    };

    return SingleChildScrollView(
      controller: widget.scrollController,
      padding: settingsScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FluxerInput(
            controller: _nameController,
            label: l10n.advancedSettingSearchProviderNameLabel,
            hint: namePlaceholder,
          ),
          SizedBox(height: layout.s4),
          FluxerInput(
            controller: _urlController,
            label: l10n.advancedSettingSearchProviderUrlLabel,
          ),
          SizedBox(height: layout.s2),
          Text(
            placeholderDescription,
            style: context.textStyles.bodySmall.copyWith(
              color: context.colors.textSecondary,
              height: 1.4,
            ),
          ),
          if (_error != null) ...[
            SizedBox(height: layout.s3),
            Text(
              _error!,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.statusDanger,
              ),
            ),
          ],
          SizedBox(height: layout.s5),
          FluxerButton.primary(
            onPressed: _submit,
            label: _isEditing
                ? l10n.save
                : l10n.advancedSettingAddSearchProviderAction,
          ),
        ],
      ),
    );
  }
}
