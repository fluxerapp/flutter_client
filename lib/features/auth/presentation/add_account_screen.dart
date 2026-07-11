import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/active_instance_provider.dart';
import 'package:fluxer_app/core/router/fluxer_router.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_flow_content.dart';
import 'package:fluxer_app/features/auth/providers/add_account_instance_guard_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AddAccountScreen extends ConsumerStatefulWidget {
  const AddAccountScreen({this.prefillEmail, super.key});

  final String? prefillEmail;

  @override
  ConsumerState<AddAccountScreen> createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends ConsumerState<AddAccountScreen> {
  String? _initialUserId;

  @override
  void initState() {
    super.initState();
    _initialUserId = ref.read(currentUserIdProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      ref
          .read(addAccountInstanceGuardProvider.notifier)
          .arm(ref.read(activeInstanceProvider));
      ref.invalidate(instanceSelectorProvider);
      final LoginViewModel notifier = ref.read(loginViewModelProvider.notifier)
        ..hideAccountSelector();
      if (widget.prefillEmail != null) {
        notifier.updateEmail(widget.prefillEmail!);
      }
    });
  }

  void _releaseAddAccountGuard() {
    final String? currentUserId = ref.read(currentUserIdProvider);
    if (_initialUserId != null && currentUserId == _initialUserId) {
      ref
          .read(addAccountInstanceGuardProvider.notifier)
          .restoreActiveInstance();
      ref.invalidate(instanceSelectorProvider);
    }
    ref.read(addAccountInstanceGuardProvider.notifier).disarm();
  }

  void _close() {
    if (!mounted) {
      return;
    }
    _releaseAddAccountGuard();
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<String?>(currentUserIdProvider, (
      String? previous,
      String? next,
    ) {
      if (next != null && next != _initialUserId && mounted) {
        _close();
      }
    });

    final layout = context.layout;
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (didPop) {
          return;
        }
        _close();
      },
      child: Scaffold(
        backgroundColor: context.colors.backgroundPrimary,
        appBar: AppBar(
          backgroundColor: context.colors.backgroundPrimary,
          elevation: 0,
          leading: IconButton(
            icon: PhosphorIcon(
              PhosphorIconsRegular.x,
              color: context.colors.textPrimary,
            ),
            onPressed: _close,
          ),
        ),
        body: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: isMobileLayout(context) ? double.infinity : 420,
              ),
              child: Padding(
                padding: EdgeInsets.all(layout.s5),
                child: AuthFlowContent(
                  showBrowserLogin: false,
                  heading: l10n.accountAdd,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
