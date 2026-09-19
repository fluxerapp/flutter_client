import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/settings/providers/applications_view_model.dart';
import 'package:fluxer_app/features/ui/ui.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';

class ApplicationCreateSheet extends ConsumerStatefulWidget {
  const ApplicationCreateSheet({super.key});

  static Future<void> show(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.applicationsCreate,
      useRootNavigator: true,
      builder: (_, _) => const ApplicationCreateSheet(),
    );
  }

  @override
  ConsumerState<ApplicationCreateSheet> createState() =>
      _ApplicationCreateSheetState();
}

class _ApplicationCreateSheetState
    extends ConsumerState<ApplicationCreateSheet> {
  final TextEditingController _nameController = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final String name = _nameController.text.trim();
    if (name.isEmpty) {
      setState(() {
        _error = FluxerLocalizations.of(context).applicationsNameRequired;
      });
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      await ref.read(applicationsViewModelProvider.notifier).create(name: name);
      if (!mounted) {
        return;
      }
      Navigator.of(context).pop();
    } on Object catch (e) {
      if (!mounted) {
        return;
      }
      final FluxerLocalizations l10n = FluxerLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = userFacingErrorMessage(e, l10n.genericError);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FluxerInput(
            controller: _nameController,
            label: l10n.applicationsName,
            hint: l10n.applicationsNameHint,
            autofocus: true,
            maxLength: 100,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _submit(),
            errorText: _error,
          ),
          SizedBox(height: layout.s4),
          Row(
            children: [
              Expanded(
                child: FluxerButton.secondary(
                  onPressed: _loading
                      ? null
                      : () => Navigator.of(context).pop(),
                  label: l10n.cancel,
                  fitContent: true,
                ),
              ),
              SizedBox(width: layout.s3),
              Expanded(
                child: FluxerButton.primary(
                  onPressed: _loading ? null : _submit,
                  label: l10n.applicationsCreateSubmit,
                  isLoading: _loading,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
