import 'dart:ui' as ui;

import 'package:phone_numbers_parser/phone_numbers_parser.dart';

class PhoneCountry {
  const PhoneCountry({required this.code, required this.dialCode, this.format});

  final String code;
  final String dialCode;
  final String? format;
}

const List<PhoneCountry> kPhoneCountries = [
  PhoneCountry(code: 'US', dialCode: '+1', format: '(###) ###-####'),
  PhoneCountry(code: 'CA', dialCode: '+1', format: '(###) ###-####'),
  PhoneCountry(code: 'BS', dialCode: '+1242'),
  PhoneCountry(code: 'BB', dialCode: '+1246'),
  PhoneCountry(code: 'AG', dialCode: '+1268'),
  PhoneCountry(code: 'DM', dialCode: '+1767'),
  PhoneCountry(code: 'DO', dialCode: '+1809'),
  PhoneCountry(code: 'JM', dialCode: '+1876'),
  PhoneCountry(code: 'TT', dialCode: '+1868'),
  PhoneCountry(code: 'EG', dialCode: '+20', format: '### ### ####'),
  PhoneCountry(code: 'ZA', dialCode: '+27', format: '## ### ####'),
  PhoneCountry(code: 'DZ', dialCode: '+213'),
  PhoneCountry(code: 'MA', dialCode: '+212'),
  PhoneCountry(code: 'TN', dialCode: '+216'),
  PhoneCountry(code: 'LY', dialCode: '+218'),
  PhoneCountry(code: 'GM', dialCode: '+220'),
  PhoneCountry(code: 'SN', dialCode: '+221'),
  PhoneCountry(code: 'MR', dialCode: '+222'),
  PhoneCountry(code: 'ML', dialCode: '+223'),
  PhoneCountry(code: 'GN', dialCode: '+224'),
  PhoneCountry(code: 'CI', dialCode: '+225'),
  PhoneCountry(code: 'BF', dialCode: '+226'),
  PhoneCountry(code: 'NE', dialCode: '+227'),
  PhoneCountry(code: 'TG', dialCode: '+228'),
  PhoneCountry(code: 'BJ', dialCode: '+229'),
  PhoneCountry(code: 'MU', dialCode: '+230'),
  PhoneCountry(code: 'LR', dialCode: '+231'),
  PhoneCountry(code: 'SL', dialCode: '+232'),
  PhoneCountry(code: 'GH', dialCode: '+233'),
  PhoneCountry(code: 'NG', dialCode: '+234', format: '### ### ####'),
  PhoneCountry(code: 'TD', dialCode: '+235'),
  PhoneCountry(code: 'CF', dialCode: '+236'),
  PhoneCountry(code: 'CM', dialCode: '+237'),
  PhoneCountry(code: 'CV', dialCode: '+238'),
  PhoneCountry(code: 'ST', dialCode: '+239'),
  PhoneCountry(code: 'GQ', dialCode: '+240'),
  PhoneCountry(code: 'GA', dialCode: '+241'),
  PhoneCountry(code: 'CG', dialCode: '+242'),
  PhoneCountry(code: 'CD', dialCode: '+243'),
  PhoneCountry(code: 'AO', dialCode: '+244'),
  PhoneCountry(code: 'GW', dialCode: '+245'),
  PhoneCountry(code: 'SC', dialCode: '+248'),
  PhoneCountry(code: 'SD', dialCode: '+249'),
  PhoneCountry(code: 'RW', dialCode: '+250'),
  PhoneCountry(code: 'ET', dialCode: '+251'),
  PhoneCountry(code: 'SO', dialCode: '+252'),
  PhoneCountry(code: 'DJ', dialCode: '+253'),
  PhoneCountry(code: 'KE', dialCode: '+254'),
  PhoneCountry(code: 'TZ', dialCode: '+255'),
  PhoneCountry(code: 'UG', dialCode: '+256'),
  PhoneCountry(code: 'BI', dialCode: '+257'),
  PhoneCountry(code: 'MZ', dialCode: '+258'),
  PhoneCountry(code: 'ZM', dialCode: '+260'),
  PhoneCountry(code: 'MG', dialCode: '+261'),
  PhoneCountry(code: 'RE', dialCode: '+262'),
  PhoneCountry(code: 'ZW', dialCode: '+263'),
  PhoneCountry(code: 'NA', dialCode: '+264'),
  PhoneCountry(code: 'MW', dialCode: '+265'),
  PhoneCountry(code: 'LS', dialCode: '+266'),
  PhoneCountry(code: 'BW', dialCode: '+267'),
  PhoneCountry(code: 'SZ', dialCode: '+268'),
  PhoneCountry(code: 'KM', dialCode: '+269'),
  PhoneCountry(code: 'GR', dialCode: '+30', format: '### ### ####'),
  PhoneCountry(code: 'NL', dialCode: '+31', format: '## ########'),
  PhoneCountry(code: 'BE', dialCode: '+32', format: '### ## ## ##'),
  PhoneCountry(code: 'FR', dialCode: '+33', format: '# ## ## ## ##'),
  PhoneCountry(code: 'ES', dialCode: '+34', format: '### ### ###'),
  PhoneCountry(code: 'HU', dialCode: '+36', format: '## ### ####'),
  PhoneCountry(code: 'IT', dialCode: '+39', format: '### ### ####'),
  PhoneCountry(code: 'RO', dialCode: '+40', format: '### ### ###'),
  PhoneCountry(code: 'CH', dialCode: '+41', format: '## ### ## ##'),
  PhoneCountry(code: 'AT', dialCode: '+43', format: '### ######'),
  PhoneCountry(code: 'GB', dialCode: '+44', format: '#### ### ####'),
  PhoneCountry(code: 'DK', dialCode: '+45', format: '## ## ## ##'),
  PhoneCountry(code: 'SE', dialCode: '+46', format: '## ### ## ##'),
  PhoneCountry(code: 'NO', dialCode: '+47', format: '### ## ###'),
  PhoneCountry(code: 'PL', dialCode: '+48', format: '### ### ###'),
  PhoneCountry(code: 'DE', dialCode: '+49', format: '### ########'),
  PhoneCountry(code: 'PE', dialCode: '+51'),
  PhoneCountry(code: 'MX', dialCode: '+52', format: '### ### ####'),
  PhoneCountry(code: 'CU', dialCode: '+53'),
  PhoneCountry(code: 'AR', dialCode: '+54', format: '## ####-####'),
  PhoneCountry(code: 'BR', dialCode: '+55', format: '(##) #####-####'),
  PhoneCountry(code: 'CL', dialCode: '+56', format: '# #### ####'),
  PhoneCountry(code: 'CO', dialCode: '+57', format: '### #######'),
  PhoneCountry(code: 'VE', dialCode: '+58'),
  PhoneCountry(code: 'MY', dialCode: '+60', format: '##-### ####'),
  PhoneCountry(code: 'AU', dialCode: '+61', format: '#### ### ###'),
  PhoneCountry(code: 'ID', dialCode: '+62', format: '###-###-####'),
  PhoneCountry(code: 'PH', dialCode: '+63', format: '#### ### ####'),
  PhoneCountry(code: 'NZ', dialCode: '+64', format: '## ### ####'),
  PhoneCountry(code: 'SG', dialCode: '+65', format: '#### ####'),
  PhoneCountry(code: 'TH', dialCode: '+66', format: '## ### ####'),
  PhoneCountry(code: 'JP', dialCode: '+81', format: '###-####-####'),
  PhoneCountry(code: 'KR', dialCode: '+82', format: '##-####-####'),
  PhoneCountry(code: 'VN', dialCode: '+84', format: '### ### ####'),
  PhoneCountry(code: 'CN', dialCode: '+86', format: '### #### ####'),
  PhoneCountry(code: 'TR', dialCode: '+90', format: '(###) ### ## ##'),
  PhoneCountry(code: 'IN', dialCode: '+91', format: '##### #####'),
  PhoneCountry(code: 'PK', dialCode: '+92', format: '### #######'),
  PhoneCountry(code: 'AF', dialCode: '+93'),
  PhoneCountry(code: 'LK', dialCode: '+94'),
  PhoneCountry(code: 'MM', dialCode: '+95'),
  PhoneCountry(code: 'IR', dialCode: '+98'),
  PhoneCountry(code: 'FI', dialCode: '+358', format: '## ### ####'),
  PhoneCountry(code: 'BG', dialCode: '+359'),
  PhoneCountry(code: 'LT', dialCode: '+370'),
  PhoneCountry(code: 'LV', dialCode: '+371'),
  PhoneCountry(code: 'EE', dialCode: '+372'),
  PhoneCountry(code: 'MD', dialCode: '+373'),
  PhoneCountry(code: 'AM', dialCode: '+374'),
  PhoneCountry(code: 'BY', dialCode: '+375'),
  PhoneCountry(code: 'AD', dialCode: '+376'),
  PhoneCountry(code: 'MC', dialCode: '+377'),
  PhoneCountry(code: 'SM', dialCode: '+378'),
  PhoneCountry(code: 'VA', dialCode: '+379'),
  PhoneCountry(code: 'UA', dialCode: '+380', format: '## ### ####'),
  PhoneCountry(code: 'RS', dialCode: '+381'),
  PhoneCountry(code: 'ME', dialCode: '+382'),
  PhoneCountry(code: 'HR', dialCode: '+385'),
  PhoneCountry(code: 'SI', dialCode: '+386'),
  PhoneCountry(code: 'BA', dialCode: '+387'),
  PhoneCountry(code: 'MK', dialCode: '+389'),
  PhoneCountry(code: 'CZ', dialCode: '+420', format: '### ### ###'),
  PhoneCountry(code: 'SK', dialCode: '+421'),
  PhoneCountry(code: 'BZ', dialCode: '+501'),
  PhoneCountry(code: 'GT', dialCode: '+502'),
  PhoneCountry(code: 'SV', dialCode: '+503'),
  PhoneCountry(code: 'HN', dialCode: '+504'),
  PhoneCountry(code: 'NI', dialCode: '+505'),
  PhoneCountry(code: 'CR', dialCode: '+506'),
  PhoneCountry(code: 'PA', dialCode: '+507'),
  PhoneCountry(code: 'HT', dialCode: '+509'),
  PhoneCountry(code: 'BO', dialCode: '+591'),
  PhoneCountry(code: 'GY', dialCode: '+592'),
  PhoneCountry(code: 'EC', dialCode: '+593'),
  PhoneCountry(code: 'PY', dialCode: '+595'),
  PhoneCountry(code: 'SR', dialCode: '+597'),
  PhoneCountry(code: 'UY', dialCode: '+598'),
  PhoneCountry(code: 'BN', dialCode: '+673'),
  PhoneCountry(code: 'NR', dialCode: '+674'),
  PhoneCountry(code: 'PG', dialCode: '+675'),
  PhoneCountry(code: 'TO', dialCode: '+676'),
  PhoneCountry(code: 'SB', dialCode: '+677'),
  PhoneCountry(code: 'VU', dialCode: '+678'),
  PhoneCountry(code: 'FJ', dialCode: '+679'),
  PhoneCountry(code: 'PW', dialCode: '+680'),
  PhoneCountry(code: 'WS', dialCode: '+685'),
  PhoneCountry(code: 'KI', dialCode: '+686'),
  PhoneCountry(code: 'NC', dialCode: '+687'),
  PhoneCountry(code: 'TV', dialCode: '+688'),
  PhoneCountry(code: 'PF', dialCode: '+689'),
  PhoneCountry(code: 'RU', dialCode: '+7', format: '(###) ###-##-##'),
  PhoneCountry(code: 'KZ', dialCode: '+7'),
  PhoneCountry(code: 'HK', dialCode: '+852', format: '#### ####'),
  PhoneCountry(code: 'MO', dialCode: '+853'),
  PhoneCountry(code: 'KH', dialCode: '+855'),
  PhoneCountry(code: 'LA', dialCode: '+856'),
  PhoneCountry(code: 'BD', dialCode: '+880', format: '####-######'),
  PhoneCountry(code: 'TW', dialCode: '+886', format: '#### ####'),
  PhoneCountry(code: 'MV', dialCode: '+960'),
  PhoneCountry(code: 'LB', dialCode: '+961'),
  PhoneCountry(code: 'JO', dialCode: '+962'),
  PhoneCountry(code: 'SY', dialCode: '+963'),
  PhoneCountry(code: 'IQ', dialCode: '+964'),
  PhoneCountry(code: 'KW', dialCode: '+965'),
  PhoneCountry(code: 'SA', dialCode: '+966', format: '## ### ####'),
  PhoneCountry(code: 'YE', dialCode: '+967'),
  PhoneCountry(code: 'OM', dialCode: '+968'),
  PhoneCountry(code: 'PS', dialCode: '+970'),
  PhoneCountry(code: 'AE', dialCode: '+971', format: '## ### ####'),
  PhoneCountry(code: 'IL', dialCode: '+972', format: '##-###-####'),
  PhoneCountry(code: 'BH', dialCode: '+973'),
  PhoneCountry(code: 'QA', dialCode: '+974'),
  PhoneCountry(code: 'BT', dialCode: '+975'),
  PhoneCountry(code: 'MN', dialCode: '+976'),
  PhoneCountry(code: 'NP', dialCode: '+977'),
  PhoneCountry(code: 'TJ', dialCode: '+992'),
  PhoneCountry(code: 'TM', dialCode: '+993'),
  PhoneCountry(code: 'AZ', dialCode: '+994'),
  PhoneCountry(code: 'GE', dialCode: '+995'),
  PhoneCountry(code: 'KG', dialCode: '+996'),
  PhoneCountry(code: 'UZ', dialCode: '+998'),
  PhoneCountry(code: 'PT', dialCode: '+351', format: '### ### ###'),
  PhoneCountry(code: 'LU', dialCode: '+352'),
  PhoneCountry(code: 'IE', dialCode: '+353', format: '## ### ####'),
  PhoneCountry(code: 'IS', dialCode: '+354'),
  PhoneCountry(code: 'AL', dialCode: '+355'),
  PhoneCountry(code: 'MT', dialCode: '+356'),
  PhoneCountry(code: 'CY', dialCode: '+357'),
];

IsoCode? isoCodeFromCountryCode(String countryCode) {
  for (final IsoCode iso in IsoCode.values) {
    if (iso.name == countryCode) {
      return iso;
    }
  }
  return null;
}

PhoneCountry? findPhoneCountry(String code) {
  for (final PhoneCountry country in kPhoneCountries) {
    if (country.code == code) {
      return country;
    }
  }
  return null;
}

PhoneCountry getDefaultPhoneCountry() {
  final String? region = ui.PlatformDispatcher.instance.locale.countryCode;
  if (region != null) {
    final PhoneCountry? match = findPhoneCountry(region.toUpperCase());
    if (match != null) {
      return match;
    }
  }
  return findPhoneCountry('US')!;
}

String formatPhoneDigits(String digits, PhoneCountry country) {
  if (digits.isEmpty) {
    return '';
  }
  final IsoCode? iso = isoCodeFromCountryCode(country.code);
  if (iso != null) {
    try {
      final PhoneNumber parsed = PhoneNumber.parse(
        digits,
        destinationCountry: iso,
      );
      return parsed.formatNsn();
    } on Object {
      // Fall through to pattern formatting.
    }
  }
  if (country.format == null) {
    return digits;
  }
  final StringBuffer formatted = StringBuffer();
  int digitIndex = 0;
  for (final int unit in country.format!.runes) {
    final String char = String.fromCharCode(unit);
    if (char == '#') {
      if (digitIndex >= digits.length) {
        break;
      }
      formatted.write(digits[digitIndex]);
      digitIndex += 1;
      continue;
    }
    if (digitIndex > 0 && digitIndex < digits.length) {
      formatted.write(char);
    }
  }
  return formatted.toString();
}

String? getE164PhoneNumber(String digits, PhoneCountry country) {
  final String normalized = digits.replaceAll(RegExp(r'\D'), '');
  if (normalized.isEmpty) {
    return null;
  }
  final IsoCode? iso = isoCodeFromCountryCode(country.code);
  if (iso != null) {
    try {
      final PhoneNumber parsed = PhoneNumber.parse(
        normalized,
        destinationCountry: iso,
      );
      if (parsed.isValid()) {
        return parsed.international.replaceAll(' ', '');
      }
    } on Object {
      // Fall through.
    }
  }
  final String dialDigits = country.dialCode.replaceAll('+', '');
  if (normalized.startsWith(dialDigits)) {
    return '+$normalized';
  }
  return '${country.dialCode}$normalized';
}

String getPhoneNumberPlaceholder(PhoneCountry country) {
  if (country.format != null) {
    return country.format!.replaceAll('#', '0');
  }
  return '0000000000';
}

String getCountrySelectLabel(PhoneCountry country) {
  return '${country.code} (${country.dialCode})';
}
