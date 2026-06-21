import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/sheets/instance_selector_sheet.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/instance_selector.dart';
import 'package:fluxer_app/features/auth/providers/instance_selector_provider.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({
    required this.showBrowserLogin,
    this.heading,
    super.key,
  });

  final bool showBrowserLogin;
  final String? heading;

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submitLogin() {
    final notifier = ref.read(loginViewModelProvider.notifier);
    final bool canAuthenticate = ref.read(instanceSelectorCanAuthenticateProvider);
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
    final bool canAuthenticate = ref.watch(instanceSelectorCanAuthenticateProvider);
    final bool canSubmit = vm.canLogin && canAuthenticate;

    return AbsorbPointer(
      absorbing: vm.isLoggingIn,
      child: AnimatedOpacity(
        opacity: vm.isLoggingIn ? 0.6 : 1.0,
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
                label: strings.email,
                autofillHints: const [AutofillHints.email],
                onChanged: notifier.updateEmail,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) => _passwordFocusNode.requestFocus(),
                errorText: vm.fieldErrors['email'],
              ),
              SizedBox(height: layout.s6),
              FluxerInput(
                label: strings.password,
                focusNode: _passwordFocusNode,
                autofillHints: const [AutofillHints.password],
                onChanged: notifier.updatePassword,
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
                onSuffixTap: notifier.togglePassword,
              ),
              SizedBox(height: layout.s1),
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
                        child: Text(
                          errorText,
                          style: context.textStyles.bodySmall.copyWith(
                            color: context.colors.textDanger,
                          ),
                        ),
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
              if (widget.showBrowserLogin) ...[
                SizedBox(height: layout.s2),
                FluxerButton.secondary(
                  onPressed: () {},
                  icon: PhosphorIconsFill.monitor,
                  label: strings.logInViaBrowser,
                ),
              ],
              SizedBox(height: layout.s5),
              Row(
                children: [
                  Text(
                    strings.needAccountPrompt,
                    style: context.textStyles.bodySmall.copyWith(
                      color: context.colors.textTertiary,
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
