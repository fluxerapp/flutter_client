import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/instance_selector_sheet.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_form_error_text.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_selector.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/sso_button.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:fluxer_app/shared/utils/keyboard_focus_restore.dart';
import 'package:fluxer_dart/export.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({this.heading, super.key});

  final String? heading;

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm>
    with WidgetsBindingObserver {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  late final KeyboardFocusRestoreHandle _emailKeyboardRestore;
  late final KeyboardFocusRestoreHandle _passwordKeyboardRestore;
  FocusNode? _lastFocusedField;
  bool _keyboardWasVisible = false;

  @override
  void initState() {
    super.initState();
    _emailKeyboardRestore = KeyboardFocusRestoreHandle(
      focusNode: _emailFocusNode,
      shouldTrackOnBackground: () =>
          _shouldTrackKeyboardRestore(_emailFocusNode),
      canRestoreFocus: () => _canRestoreKeyboardFocus(_emailFocusNode),
    );
    _passwordKeyboardRestore = KeyboardFocusRestoreHandle(
      focusNode: _passwordFocusNode,
      shouldTrackOnBackground: () =>
          _shouldTrackKeyboardRestore(_passwordFocusNode),
      canRestoreFocus: () => _canRestoreKeyboardFocus(_passwordFocusNode),
    );
    _emailFocusNode.addListener(_trackEmailFocus);
    _passwordFocusNode.addListener(_trackPasswordFocus);
    WidgetsBinding.instance.addObserver(this);
    _emailController.addListener(_syncEmailToViewModel);
    _passwordController.addListener(_syncPasswordToViewModel);
  }

  void _trackEmailFocus() {
    if (_emailFocusNode.hasFocus) {
      _lastFocusedField = _emailFocusNode;
    }
  }

  void _trackPasswordFocus() {
    if (_passwordFocusNode.hasFocus) {
      _lastFocusedField = _passwordFocusNode;
    }
  }

  bool _isInteractionBlocked() {
    final vm = ref.read(loginViewModelProvider);
    return vm.isLoggingIn || vm.isStartingSso;
  }

  bool _shouldTrackKeyboardRestore(FocusNode node) {
    if (!mounted || _isInteractionBlocked()) {
      return false;
    }
    if (node.hasFocus) {
      return true;
    }
    return _keyboardWasVisible && _lastFocusedField == node;
  }

  bool _canRestoreKeyboardFocus(FocusNode node) {
    return mounted && !_isInteractionBlocked() && node.canRequestFocus;
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (!mounted) {
      return;
    }
    final double bottomInset = MediaQuery.viewInsetsOf(context).bottom;
    if (bottomInset > 0) {
      _keyboardWasVisible = true;
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    _emailKeyboardRestore.handleLifecycleState(state);
    _passwordKeyboardRestore.handleLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      _keyboardWasVisible = false;
    }
  }

  void _syncEmailToViewModel() {
    ref
        .read(loginViewModelProvider.notifier)
        .updateEmail(_emailController.text);
  }

  void _syncPasswordToViewModel() {
    ref
        .read(loginViewModelProvider.notifier)
        .updatePassword(_passwordController.text);
  }

  void _setControllerText(TextEditingController controller, String next) {
    if (controller.text == next) {
      return;
    }
    controller.value = TextEditingValue(
      text: next,
      selection: TextSelection.collapsed(offset: next.length),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _emailFocusNode.removeListener(_trackEmailFocus);
    _passwordFocusNode.removeListener(_trackPasswordFocus);
    _emailController.removeListener(_syncEmailToViewModel);
    _passwordController.removeListener(_syncPasswordToViewModel);
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitLogin() {
    final notifier = ref.read(loginViewModelProvider.notifier);
    final bool canAuthenticate = ref.read(
      instanceSelectorCanAuthenticateProvider,
    );
    if (ref.read(loginViewModelProvider).canLogin && canAuthenticate) {
      unawaited(notifier.login());
      TextInput.finishAutofillContext();
    }
  }

  @override
  Widget build(BuildContext context) {
    final strings = FluxerLocalizations.of(context);
    final vm = ref.watch(loginViewModelProvider);
    final notifier = ref.read(loginViewModelProvider.notifier);
    final layout = context.layout;
    final errorText = resolveLoginError(vm, strings);
    final bool canAuthenticate = ref.watch(
      instanceSelectorCanAuthenticateProvider,
    );
    final bool canSubmit = vm.canLogin && canAuthenticate;
    final bool isSsoEnabled = ref.watch(isAuthInstanceSsoEnabledProvider);
    final WellKnownFluxerResponseSso? ssoConfig = ref
        .watch(authInstanceSnapshotProvider)
        .ssoConfig;
    final bool emailsEnabled = ref.watch(
      instanceRuntimeConfigProvider.select((config) => config.emailsEnabled),
    );
    final String ssoProviderName = ssoConfig?.displayName ?? 'Single Sign-On';

    ref
      ..listen(loginViewModelProvider.select((state) => state.email), (
        _,
        next,
      ) {
        _setControllerText(_emailController, next);
      })
      ..listen(loginViewModelProvider.select((state) => state.password), (
        _,
        next,
      ) {
        _setControllerText(_passwordController, next);
      });

    return AnimatedOpacity(
      opacity: vm.isLoggingIn || vm.isStartingSso ? 0.6 : 1.0,
      duration: context.motion.fast,
      child: AutofillGroup(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                widget.heading ?? strings.welcomeBack,
                style: context.textStyles.heading,
              ),
            ),
            SizedBox(height: layout.s8),
            FluxerInput(
              controller: _emailController,
              label: strings.email,
              focusNode: _emailFocusNode,
              autofocus: true,
              autofillHints: const [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _passwordFocusNode.requestFocus(),
              errorText: vm.fieldErrors['email'],
            ),
            SizedBox(height: layout.s6),
            FluxerInput(
              controller: _passwordController,
              label: strings.password,
              focusNode: _passwordFocusNode,
              autofillHints: const [AutofillHints.password],
              obscureText: !vm.isPasswordVisible,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.go,
              onSubmitted: (_) => _submitLogin(),
              errorText: vm.fieldErrors['password'],
              suffixIcon: PhosphorIcon(
                vm.isPasswordVisible
                    ? PhosphorIconsFill.eyeSlash
                    : PhosphorIconsFill.eye,
                color: context.colors.textPrimaryMuted,
                size: 20,
              ),
              suffixSemanticLabel: vm.isPasswordVisible
                  ? strings.authHidePassword
                  : strings.authShowPassword,
              onSuffixTap: notifier.togglePassword,
            ),
            SizedBox(height: layout.s1),
            if (emailsEnabled)
              FluxerTextLink(
                text: strings.forgotPassword,
                onTap: notifier.showForgotPasswordScreen,
                style: context.textStyles.bodySmall,
                color: context.colors.textTertiary,
              ),
            SizedBox(height: layout.s6),
            AnimatedSize(
              duration: context.motion.fast,
              curve: context.motion.curve,
              alignment: Alignment.topCenter,
              child: errorText != null
                  ? Padding(
                      padding: EdgeInsets.only(bottom: layout.s2),
                      child: AuthFormErrorText(errorText),
                    )
                  : const SizedBox.shrink(),
            ),
            FluxerButton.primary(
              onPressed: canSubmit ? _submitLogin : null,
              label: strings.logIn,
              isLoading: vm.isLoggingIn,
            ),
            SizedBox(height: layout.s6),
            _buildOrDivider(context, strings),
            SizedBox(height: layout.s6),
            FluxerButton.secondary(
              onPressed: vm.isLoggingIn || !canAuthenticate
                  ? null
                  : () => unawaited(notifier.loginWithPasskey()),
              icon: PhosphorIconsFill.key,
              label: strings.logInWithPasskey,
            ),
            if (isSsoEnabled) ...[
              SizedBox(height: context.layout.s6),
              _buildOrDivider(context, strings),
              SizedBox(height: context.layout.s6),
              SsoButton(
                enabled: !vm.isLoggingIn,
                subtitle: strings.preferSso(ssoProviderName),
              ),
            ],
            SizedBox(height: layout.s5),
            Row(
              children: [
                Flexible(
                  child: Text(
                    strings.needAccountPrompt,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textTertiary,
                    ),
                  ),
                ),
                FluxerTextLink(
                  text: strings.register,
                  onTap: notifier.showRegisterScreen,
                  style: context.textStyles.bodySmall,
                ),
              ],
            ),
            SizedBox(height: layout.s4),
            InstanceSelectorLoginEntry(
              enabled: !vm.isLoggingIn,
              onOpenSheet: () => unawaited(showInstanceSelectorSheet(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrDivider(BuildContext context, FluxerLocalizations strings) =>
      Row(
        children: [
          Expanded(child: Divider(color: context.colors.borderColor)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.layout.s3),
            child: Text(
              strings.orDivider,
              style: context.textStyles.bodySmall.copyWith(
                color: context.colors.textTertiary,
                fontSize: 12,
              ),
            ),
          ),
          Expanded(child: Divider(color: context.colors.borderColor)),
        ],
      );
}
