import 'package:country_flags/country_flags.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluxer_app/core/theme/fluxer_theme_extension.dart';
import 'package:fluxer_app/features/auth/providers/phone_verification_view_model.dart';
import 'package:fluxer_app/features/auth/utils/country_codes.dart';
import 'package:fluxer_app/features/auth/utils/phone_verification_error_l10n.dart';
import 'package:fluxer_app/features/ui/input/fluxer_input.dart';
import 'package:fluxer_app/features/ui/select/fluxer_select.dart';
import 'package:fluxer_app/l10n/generated/fluxer_localizations.dart';
import 'package:material_ui/material_ui.dart';

class PhoneNumberInput extends ConsumerStatefulWidget {
  const PhoneNumberInput({required this.provider, super.key});

  final PhoneVerificationViewModelProvider provider;

  @override
  ConsumerState<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends ConsumerState<PhoneNumberInput> {
  late final TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final FluxerLocalizations l10n = FluxerLocalizations.of(context);
    final PhoneVerificationViewState state = ref.watch(widget.provider);
    final PhoneVerificationViewModel notifier = ref.read(
      widget.provider.notifier,
    );
    final String formatted = formatPhoneDigits(
      state.phoneDigits,
      state.selectedCountry,
    );
    if (_phoneController.text != formatted) {
      _phoneController.value = TextEditingValue(
        text: formatted,
        selection: TextSelection.collapsed(offset: formatted.length),
      );
    }
    final String? errorText = state.phoneError?.resolve(l10n);
    final List<FluxerSelectItem<String>> countryItems = kPhoneCountries
        .map(
          (PhoneCountry country) => FluxerSelectItem<String>(
            value: country.code,
            label: getCountrySelectLabel(country),
            searchText: '${country.code} ${country.dialCode}',
            leading: SizedBox(
              width: 20,
              height: 14,
              child: CountryFlag.fromCountryCode(
                country.code,
                theme: const ImageTheme(
                  width: 20,
                  height: 14,
                  shape: RoundedRectangle(2),
                ),
              ),
            ),
          ),
        )
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        FluxerSelect<String>(
          items: countryItems,
          value: state.selectedCountry.code,
          label: l10n.phoneCountryLabel,
          searchHint: l10n.phoneSearchCountries,
          scrollableSheet: true,
          onChanged: (String code) {
            final PhoneCountry? country = findPhoneCountry(code);
            if (country != null) {
              notifier.setSelectedCountry(country);
            }
          },
        ),
        SizedBox(height: context.layout.s4),
        FluxerInput(
          controller: _phoneController,
          label: l10n.phoneAddLabel,
          hint: getPhoneNumberPlaceholder(state.selectedCountry),
          autofocus: true,
          keyboardType: TextInputType.phone,
          autofillHints: const <String>[AutofillHints.telephoneNumber],
          textInputAction: TextInputAction.done,
          errorText: errorText,
          onChanged: (String value) {
            notifier.setPhoneDigits(value.replaceAll(RegExp(r'\D'), ''));
          },
        ),
      ],
    );
  }
}
