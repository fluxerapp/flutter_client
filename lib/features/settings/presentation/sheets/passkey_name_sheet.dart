import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/api/dio_error_message.dart';
import 'package:fluxer_app/core/api/fluxer_client_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/data/webauthn_service.dart';
import 'package:fluxer_app/features/settings/presentation/widgets/wide_settings_content_layout.dart';
import 'package:fluxer_app/features/ui/bottom_sheet/fluxer_bottom_sheet.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_dart/export.dart';
import 'package:material_ui/material_ui.dart';
import 'package:passkeys/authenticator.dart';
import 'package:passkeys/exceptions.dart';

class PasskeyNameSheet extends ConsumerStatefulWidget {
  const PasskeyNameSheet({
    super.key,
    this.initialName,
    this.credentialId,
    this.onSubmitted,
  });

  final String? initialName;
  final String? credentialId;
  final VoidCallback? onSubmitted;

  static Future<void> showForCreate(
    BuildContext context,
    WidgetRef ref, {
    VoidCallback? onCreated,
  }) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.securityPasskeyNameTitle,
      useRootNavigator: true,
      builder: (_, _) => PasskeyNameSheet(onSubmitted: onCreated),
    );
  }

  static Future<void> showForRename(
    BuildContext context,
    WidgetRef ref, {
    required String credentialId,
    required String currentName,
    VoidCallback? onRenamed,
  }) {
    final l10n = FluxerLocalizations.of(context);
    return FluxerBottomSheet.show<void>(
      context,
      title: l10n.securityPasskeyNameTitle,
      useRootNavigator: true,
      builder: (_, _) => PasskeyNameSheet(
        initialName: currentName,
        credentialId: credentialId,
        onSubmitted: onRenamed,
      ),
    );
  }

  @override
  ConsumerState<PasskeyNameSheet> createState() => _PasskeyNameSheetState();
}

class _PasskeyNameSheetState extends ConsumerState<PasskeyNameSheet> {
  late final TextEditingController _nameController;
  bool _loading = false;
  String? _error;

  bool get _isRename => widget.credentialId != null;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      return;
    }

    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final client = ref.read(fluxerClientProvider);

      if (_isRename) {
        await client.users.updateWebauthnCredential(
          credentialId: widget.credentialId!,
          body: WebAuthnCredentialUpdateRequest(name: name),
        );
      } else {
        final dio = ref.read(fluxerDioProvider);
        final optionsRes = await dio.post<Map<String, dynamic>>(
          '/users/@me/mfa/webauthn/credentials/registration-options',
          data: <String, dynamic>{},
        );
        final options = optionsRes.data!;
        final ceremony = await WebAuthnService(
          PasskeyAuthenticator(),
        ).register(options);
        await client.users.registerWebauthnCredential(
          body: WebAuthnRegisterRequest(
            response: ceremony,
            challenge: options['challenge'] as String,
            name: name,
          ),
        );
      }

      if (mounted) {
        Navigator.of(context).pop();
        widget.onSubmitted?.call();
      }
    } on PasskeyAuthCancelledException {
      if (mounted) {
        setState(() => _loading = false);
      }
    } on AuthenticatorException catch (e) {
      if (!mounted) {
        return;
      }
      final l10n = FluxerLocalizations.of(context);
      final message = e is UnhandledAuthenticatorException && e.message != null
          ? e.message!
          : l10n.genericError;
      setState(() {
        _loading = false;
        _error = message;
      });
    } on DioException catch (e) {
      if (!mounted) {
        return;
      }
      final l10n = FluxerLocalizations.of(context);
      setState(() {
        _loading = false;
        _error = userFacingErrorMessage(e, l10n.genericError);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = FluxerLocalizations.of(context);
    final layout = context.layout;

    return SingleChildScrollView(
      padding: settingsSheetScrollPadding(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FluxerInput(
            controller: _nameController,
            label: l10n.securityPasskeyNameLabel,
            hint: l10n.securityPasskeyNameHint,
            autofocus: true,
            maxLength: 64,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _handleSubmit(),
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
              const SizedBox(width: 12),
              Expanded(
                child: FluxerButton.primary(
                  onPressed: _loading ? null : _handleSubmit,
                  label: l10n.save,
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
