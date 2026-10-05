import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/instance/instance_config_snapshot.dart';
import 'package:fluxer_app/core/instance/instance_runtime_config.dart';
import 'package:fluxer_app/core/providers/instance_runtime_config_provider.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/presentation/widgets/auth_form_error_text.dart';
import 'package:fluxer_app/features/auth/providers/auth_instance_snapshot_provider.dart';
import 'package:fluxer_app/features/auth/providers/auth_providers.dart';
import 'package:fluxer_app/features/auth/providers/login_error_l10n.dart';
import 'package:fluxer_app/features/auth/providers/login_view_model.dart';
import 'package:fluxer_app/features/auth/providers/pending_registration_url_code_provider.dart';
import 'package:fluxer_app/features/auth/providers/registration_draft_provider.dart';
import 'package:fluxer_app/features/shell/presentation/responsive_layout.dart';
import 'package:fluxer_app/features/ui/button/fluxer_button.dart';
import 'package:fluxer_app/features/ui/checkbox/fluxer_checkbox.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/features/ui/tappable/fluxer_gesture_detector.dart';
import 'package:fluxer_app/features/ui/text_link/fluxer_text_link.dart';
import 'package:fluxer_app/features/ui/warning_alert/fluxer_warning_alert.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:fluxer_app/material_ui.dart';
import 'package:intl/intl.dart';

enum _UsernameAvailability { idle, checking, available, taken }

const int _kMaxUsernameLength = 32;
final RegExp _kUsernamePattern = RegExp(r'^[a-zA-Z0-9_]+$');
const Duration _kAvailabilityCheckDelay = Duration(milliseconds: 350);

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({required this.onBack, super.key});

  final VoidCallback onBack;

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _emailController = TextEditingController();
  final _displayNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  final _displayNameFocus = FocusNode();
  final _usernameFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmFocus = FocusNode();

  int? _birthMonth;
  int? _birthDay;
  int? _birthYear;
  bool _consent = false;
  bool _isRestoringDraft = false;

  Timer? _availabilityTimer;
  String _availabilityUsername = '';
  _UsernameAvailability _availability = _UsernameAvailability.idle;

  int get _daysInMonth {
    if (_birthYear != null && _birthMonth != null) {
      return DateTime(_birthYear!, _birthMonth! + 1, 0).day;
    }
    return 31;
  }

  void _onMonthChanged(int? month) {
    setState(() {
      _birthMonth = month;
      if (_birthDay != null && _birthDay! > _daysInMonth) {
        _birthDay = null;
      }
    });
    _saveDraft();
  }

  void _onYearChanged(int? year) {
    setState(() {
      _birthYear = year;
      if (_birthDay != null && _birthDay! > _daysInMonth) {
        _birthDay = null;
      }
    });
    _saveDraft();
  }

  Future<void> _pickDateOfBirth() async {
    final now = DateTime.now();
    final initial =
        (_birthYear != null && _birthMonth != null && _birthDay != null)
        ? DateTime(_birthYear!, _birthMonth!, _birthDay!)
        : DateTime(now.year - 18);
    final picked = await showDatePicker(
      context: context,
      initialDate: initial,
      firstDate: DateTime(now.year - 150),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _birthYear = picked.year;
        _birthMonth = picked.month;
        _birthDay = picked.day;
      });
      _saveDraft();
    }
  }

  String get _formattedDateOfBirth {
    if (_birthYear == null || _birthMonth == null || _birthDay == null) {
      return '';
    }
    final locale = Localizations.localeOf(context).toString();
    final date = DateTime(_birthYear!, _birthMonth!, _birthDay!);
    return DateFormat.yMMMMd(locale).format(date);
  }

  /// Returns date field order based on locale, matching web app behavior.
  static List<String> _dateFieldOrder(String locale) {
    final pattern = DateFormat.yMd(locale).pattern ?? 'M/d/y';
    final order = <String>[];
    for (final char in pattern.codeUnits) {
      final c = String.fromCharCode(char);
      if ((c == 'M' || c == 'L') && !order.contains('month')) {
        order.add('month');
      } else if (c == 'd' && !order.contains('day')) {
        order.add('day');
      } else if (c == 'y' && !order.contains('year')) {
        order.add('year');
      }
    }
    if (order.length < 3) {
      return ['month', 'day', 'year'];
    }
    return order;
  }

  static final _emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) {
        return;
      }
      _restoreDraft();
    });
    _emailController.addListener(_saveDraft);
    _displayNameController.addListener(_saveDraft);
    _usernameController
      ..addListener(_saveDraft)
      ..addListener(_scheduleAvailabilityCheck);
    _passwordController.addListener(_saveDraft);
    _confirmController.addListener(_saveDraft);
  }

  void _restoreDraft() {
    final draft = ref.read(registrationDraftProvider);
    if (draft.isEmpty) {
      return;
    }
    _isRestoringDraft = true;
    setState(() {
      _emailController.text = draft.email;
      _displayNameController.text = draft.displayName;
      _usernameController.text = draft.username;
      _passwordController.text = draft.password;
      _confirmController.text = draft.confirmPassword;
      _birthMonth = draft.birthMonth;
      _birthDay = draft.birthDay;
      _birthYear = draft.birthYear;
      _consent = draft.consent;
    });
    _isRestoringDraft = false;
  }

  void _saveDraft() {
    if (_isRestoringDraft) {
      return;
    }
    ref
        .read(registrationDraftProvider.notifier)
        .update(
          RegistrationDraft(
            email: _emailController.text,
            displayName: _displayNameController.text,
            username: _usernameController.text,
            password: _passwordController.text,
            confirmPassword: _confirmController.text,
            birthMonth: _birthMonth,
            birthDay: _birthDay,
            birthYear: _birthYear,
            consent: _consent,
          ),
        );
  }

  String get _trimmedUsername => _usernameController.text.trim();

  bool get _usernameFormatValid =>
      _trimmedUsername.length <= _kMaxUsernameLength &&
      _kUsernamePattern.hasMatch(_trimmedUsername);

  _UsernameAvailability get _currentAvailability =>
      _availabilityUsername == _trimmedUsername
      ? _availability
      : _UsernameAvailability.idle;

  void _scheduleAvailabilityCheck() {
    _availabilityTimer?.cancel();
    final String username = _trimmedUsername;
    if (!ref.read(uniqueUsernamesProvider) ||
        username.isEmpty ||
        !_usernameFormatValid) {
      return;
    }
    if (username == _availabilityUsername &&
        _availability != _UsernameAvailability.idle) {
      return;
    }
    _availabilityTimer = Timer(
      _kAvailabilityCheckDelay,
      () => unawaited(_checkAvailability(username)),
    );
  }

  Future<void> _checkAvailability(String username) async {
    setState(() {
      _availabilityUsername = username;
      _availability = _UsernameAvailability.checking;
    });
    _UsernameAvailability next;
    try {
      final bool available = await ref
          .read(authRepositoryProvider)
          .isUsernameAvailable(username);
      next = available
          ? _UsernameAvailability.available
          : _UsernameAvailability.taken;
    } on Exception {
      next = _UsernameAvailability.idle;
    }
    if (!mounted || _availabilityUsername != username) {
      return;
    }
    setState(() => _availability = next);
  }

  @override
  void dispose() {
    _availabilityTimer?.cancel();
    _emailController.dispose();
    _displayNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    _displayNameFocus.dispose();
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _confirmFocus.dispose();
    super.dispose();
  }

  bool _isFormValid({
    required bool requiresConsent,
    required bool requiresDateOfBirth,
    required bool usernameSignIn,
    required bool uniqueUsernames,
  }) {
    final bool identityValid = usernameSignIn
        ? _trimmedUsername.isNotEmpty && _usernameFormatValid
        : _emailRegex.hasMatch(_emailController.text.trim());
    return identityValid &&
        !(uniqueUsernames &&
            _currentAvailability == _UsernameAvailability.taken) &&
        _passwordController.text.isNotEmpty &&
        _confirmController.text.isNotEmpty &&
        (!requiresDateOfBirth ||
            (_birthMonth != null && _birthDay != null && _birthYear != null)) &&
        (!requiresConsent || _consent);
  }

  bool _requiresConsent(InstanceConfigSnapshot instance) =>
      instance.termsUrl != null || instance.privacyUrl != null;

  String? get _dateOfBirth {
    if (_birthYear == null || _birthMonth == null || _birthDay == null) {
      return null;
    }
    final y = _birthYear.toString().padLeft(4, '0');
    final m = _birthMonth.toString().padLeft(2, '0');
    final d = _birthDay.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  void _submit() {
    final InstanceConfigSnapshot instance = ref.read(
      authInstanceSnapshotProvider,
    );
    final InstanceRuntimeConfig runtime = ref.read(
      instanceRuntimeConfigProvider,
    );
    final String? registrationUrlCode = ref.read(
      pendingRegistrationUrlCodeProvider,
    );
    final bool canRegister = runtime.canPublicRegister(
      registrationUrlCode: registrationUrlCode,
    );
    if (!canRegister ||
        ref.read(loginViewModelProvider).pendingApprovalUserId != null ||
        !_isFormValid(
          requiresConsent: _requiresConsent(instance),
          requiresDateOfBirth: runtime.collectDateOfBirth,
          usernameSignIn: runtime.usernameSignIn,
          uniqueUsernames: runtime.uniqueUsernames,
        )) {
      return;
    }
    final l10n = FluxerLocalizations.of(context);
    final notifier = ref.read(loginViewModelProvider.notifier);

    if (_passwordController.text != _confirmController.text) {
      notifier.setError(l10n.resetPasswordMismatch);
      return;
    }

    final dob = runtime.collectDateOfBirth ? _dateOfBirth : null;
    if (runtime.collectDateOfBirth && dob == null) {
      return;
    }

    unawaited(
      notifier.submitRegister(
        email: runtime.usernameSignIn ? null : _emailController.text,
        password: _passwordController.text,
        dateOfBirth: dob,
        username: _usernameController.text,
        displayName: _displayNameController.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(loginViewModelProvider);
    final colors = context.colors;
    final textStyles = context.textStyles;
    final layout = context.layout;
    final l10n = FluxerLocalizations.of(context);
    final InstanceConfigSnapshot instance = ref.watch(
      authInstanceSnapshotProvider,
    );
    final String? termsUrl = instance.termsUrl;
    final String? privacyUrl = instance.privacyUrl;
    final bool requiresConsent = _requiresConsent(instance);
    final bool collectDateOfBirth = ref.watch(
      instanceRuntimeConfigProvider.select(
        (InstanceRuntimeConfig config) => config.collectDateOfBirth,
      ),
    );
    final String? registrationUrlCode = ref.watch(
      pendingRegistrationUrlCodeProvider,
    );
    final bool canRegister = ref.watch(
      instanceRuntimeConfigProvider.select(
        (InstanceRuntimeConfig config) =>
            config.canPublicRegister(registrationUrlCode: registrationUrlCode),
      ),
    );
    final bool isRegistrationClosed = !canRegister;
    final bool usernameSignIn = ref.watch(
      instanceRuntimeConfigProvider.select(
        (InstanceRuntimeConfig config) => config.usernameSignIn,
      ),
    );
    final bool uniqueUsernames = ref.watch(uniqueUsernamesProvider);
    final _UsernameAvailability availability = _currentAvailability;
    final String? usernameStatus = switch (availability) {
      _UsernameAvailability.taken => l10n.registerUsernameTaken,
      _UsernameAvailability.available => l10n.registerUsernameAvailable,
      _ when usernameSignIn => l10n.registerUsernameSignInHint,
      _ when uniqueUsernames => null,
      _ => l10n.registerUsernameTagHint,
    };
    final String? pendingApprovalUserId = vm.pendingApprovalUserId;

    return AbsorbPointer(
      absorbing: vm.isLoggingIn,
      child: AnimatedOpacity(
        opacity: vm.isLoggingIn ? 0.6 : 1.0,
        duration: context.motion.fast,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              l10n.registerTitle,
              style: textStyles.heading.copyWith(color: colors.textPrimary),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: layout.s6),
            if (isRegistrationClosed) ...[
              FluxerWarningAlert(message: l10n.registerClosed),
              SizedBox(height: layout.s5),
            ],
            if (pendingApprovalUserId != null) ...[
              FluxerWarningAlert(
                message: l10n.registerPendingApproval,
                variant: FluxerAlertVariant.info,
              ),
              SizedBox(height: layout.s5),
            ],

            if (!usernameSignIn) ...[
              FluxerInput(
                controller: _emailController,
                label: l10n.email,
                autofillHints: const [AutofillHints.email],
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onSubmitted: (_) => _displayNameFocus.requestFocus(),
                onChanged: (_) => setState(() {}),
                errorText: vm.fieldErrors['email'],
              ),
              SizedBox(height: layout.s5),
            ],

            // Display name
            FluxerInput(
              controller: _displayNameController,
              focusNode: _displayNameFocus,
              label: l10n.registerDisplayName,
              hint: l10n.registerDisplayNameHint,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _usernameFocus.requestFocus(),
              onChanged: (value) {
                ref
                    .read(loginViewModelProvider.notifier)
                    .fetchUsernameSuggestions(value);
              },
              errorText: vm.fieldErrors['global_name'],
            ),
            SizedBox(height: layout.s5),

            // Username
            FluxerInput(
              controller: _usernameController,
              focusNode: _usernameFocus,
              label: usernameSignIn
                  ? l10n.usernameLabel
                  : l10n.registerUsername,
              hint: usernameSignIn ? null : l10n.registerUsernameHint,
              autofillHints: const [AutofillHints.newUsername],
              autocorrect: !usernameSignIn,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _passwordFocus.requestFocus(),
              onChanged: (_) => setState(() {}),
              errorText: vm.fieldErrors['username'],
            ),
            if (usernameStatus != null) ...[
              SizedBox(height: layout.s1),
              Text(
                usernameStatus,
                style: textStyles.bodySmall.copyWith(
                  color: switch (availability) {
                    _UsernameAvailability.taken => colors.textDanger,
                    _UsernameAvailability.available => colors.accentSuccess,
                    _ => colors.textTertiary,
                  },
                  fontSize: 12,
                ),
              ),
            ],
            if (vm.usernameSuggestions.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: layout.s2),
                child: Wrap(
                  spacing: layout.s2,
                  runSpacing: layout.s1,
                  children: vm.usernameSuggestions.map((username) {
                    return ActionChip(
                      label: Text(username, style: textStyles.bodySmall),
                      backgroundColor: colors.backgroundTertiary,
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: layout.radiusMd,
                      ),
                      onPressed: () {
                        _usernameController.text = username;
                        ref
                            .read(loginViewModelProvider.notifier)
                            .fetchUsernameSuggestions('');
                      },
                    );
                  }).toList(),
                ),
              ),
            SizedBox(height: layout.s5),

            // Password
            FluxerInput(
              controller: _passwordController,
              focusNode: _passwordFocus,
              label: l10n.password,
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              onSubmitted: (_) => _confirmFocus.requestFocus(),
              onChanged: (_) => setState(() {}),
              errorText: vm.fieldErrors['password'],
            ),
            SizedBox(height: layout.s5),

            // Confirm password
            FluxerInput(
              controller: _confirmController,
              focusNode: _confirmFocus,
              label: l10n.registerConfirmPassword,
              obscureText: true,
              autofillHints: const [AutofillHints.newPassword],
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _submit(),
              onChanged: (_) => setState(() {}),
            ),
            SizedBox(height: layout.s5),

            if (collectDateOfBirth) ...[
              // Date of birth
              Text(
                l10n.registerDateOfBirth,
                style: textStyles.label.copyWith(color: colors.textPrimary),
              ),
              SizedBox(height: layout.s2),
              if (isMobileLayout(context))
                FluxerGestureDetector(
                  onTap: _pickDateOfBirth,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: colors.backgroundTertiary,
                      borderRadius: layout.radiusMd,
                      border: Border.all(
                        color: vm.fieldErrors['date_of_birth'] != null
                            ? colors.textDanger
                            : colors.backgroundModifierAccent,
                      ),
                    ),
                    child: Text(
                      _formattedDateOfBirth.isNotEmpty
                          ? _formattedDateOfBirth
                          : DateFormat.yMd(
                                  Localizations.localeOf(context).toString(),
                                )
                                .format(DateTime(2000, 12, 30))
                                .replaceAll('2000', 'yyyy')
                                .replaceAll('30', 'dd')
                                .replaceAll('12', 'mm'),
                      style: textStyles.bodySmall.copyWith(
                        color: _formattedDateOfBirth.isNotEmpty
                            ? colors.textPrimary
                            : colors.textTertiary,
                      ),
                    ),
                  ),
                )
              else
                Builder(
                  builder: (context) {
                    final locale = Localizations.localeOf(context).toString();
                    final fields = <String, Widget>{
                      'month': Expanded(
                        flex: 4,
                        child: FluxerSelect<int>(
                          hint: l10n.registerMonth,
                          value: _birthMonth,
                          onChanged: _onMonthChanged,
                          items: List.generate(
                            12,
                            (i) => FluxerSelectItem(
                              value: i + 1,
                              label: _monthName(i + 1),
                            ),
                          ),
                        ),
                      ),
                      'day': Expanded(
                        flex: 3,
                        child: FluxerSelect<int>(
                          hint: l10n.registerDay,
                          value: _birthDay,
                          onChanged: (v) {
                            setState(() => _birthDay = v);
                            _saveDraft();
                          },
                          items: List.generate(
                            _daysInMonth,
                            (i) => FluxerSelectItem(
                              value: i + 1,
                              label: '${i + 1}',
                            ),
                          ),
                        ),
                      ),
                      'year': Expanded(
                        flex: 3,
                        child: FluxerSelect<int>(
                          hint: l10n.registerYear,
                          value: _birthYear,
                          onChanged: _onYearChanged,
                          items: List.generate(150, (i) {
                            final year = DateTime.now().year - i;
                            return FluxerSelectItem(
                              value: year,
                              label: '$year',
                            );
                          }),
                        ),
                      ),
                    };
                    final order = _dateFieldOrder(locale);
                    return Row(
                      children: [
                        for (var i = 0; i < order.length; i++) ...[
                          if (i > 0) SizedBox(width: layout.s2),
                          fields[order[i]]!,
                        ],
                      ],
                    );
                  },
                ),
              if (vm.fieldErrors['date_of_birth'] != null) ...[
                SizedBox(height: layout.s1),
                Text(
                  vm.fieldErrors['date_of_birth']!,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textDanger,
                  ),
                ),
              ],
              SizedBox(height: layout.s5),
            ],

            // Terms consent
            if (requiresConsent) ...[
              FluxerCheckbox(
                value: _consent,
                onChanged: (v) {
                  setState(() => _consent = v ?? false);
                  _saveDraft();
                },
                child: Text.rich(
                  TextSpan(
                    style: textStyles.bodySmall.copyWith(
                      color: colors.textPrimary,
                    ),
                    children: [
                      TextSpan(text: l10n.registerConsentPrefix),
                      if (termsUrl != null)
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: FluxerTextLink(
                            text: l10n.registerConsentTerms,
                            url: termsUrl,
                            style: textStyles.bodySmall,
                          ),
                        ),
                      if (termsUrl != null && privacyUrl != null)
                        TextSpan(text: l10n.registerConsentAnd),
                      if (privacyUrl != null)
                        WidgetSpan(
                          alignment: PlaceholderAlignment.baseline,
                          baseline: TextBaseline.alphabetic,
                          child: FluxerTextLink(
                            text: l10n.registerConsentPrivacy,
                            url: privacyUrl,
                            style: textStyles.bodySmall,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: layout.s5),
            ],

            // Error message
            if (resolveLoginError(vm, l10n) case final errorText?) ...[
              AuthFormErrorText(errorText),
              SizedBox(height: layout.s2),
            ],

            // Submit
            FluxerButton.primary(
              onPressed:
                  _isFormValid(
                        requiresConsent: requiresConsent,
                        requiresDateOfBirth: collectDateOfBirth,
                        usernameSignIn: usernameSignIn,
                        uniqueUsernames: uniqueUsernames,
                      ) &&
                      !vm.isLoggingIn &&
                      canRegister &&
                      pendingApprovalUserId == null
                  ? _submit
                  : null,
              label: l10n.registerSubmit,
              isLoading: vm.isLoggingIn,
            ),
            SizedBox(height: layout.s4),

            // Back to login
            Row(
              children: [
                Text(
                  l10n.registerHaveAccount,
                  style: textStyles.bodySmall.copyWith(
                    color: colors.textTertiary,
                  ),
                ),
                FluxerTextLink(
                  text: l10n.logIn,
                  onTap: widget.onBack,
                  style: textStyles.bodySmall,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    final locale = Localizations.localeOf(context).toString();
    return DateFormat.MMMM(locale).format(DateTime(2000, month));
  }
}
