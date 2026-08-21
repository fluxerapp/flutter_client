import 'package:flutter/foundation.dart';

final class AppLicensesData {
  const AppLicensesData({
    required this.packages,
    required this.packageLicenseBindings,
    required this.licenses,
  });

  final List<String> packages;
  final Map<String, List<int>> packageLicenseBindings;
  final List<LicenseEntry> licenses;

  List<LicenseEntry> entriesForPackage(String packageName) {
    final List<int>? bindings = packageLicenseBindings[packageName];
    if (bindings == null) {
      return const [];
    }
    return bindings.map((int index) => licenses[index]).toList(growable: false);
  }

  int licenseCountForPackage(String packageName) {
    return packageLicenseBindings[packageName]?.length ?? 0;
  }
}

Future<AppLicensesData> loadAppLicensesData() {
  return LicenseRegistry.licenses
      .fold<_AppLicensesAccumulator>(
        _AppLicensesAccumulator(),
        (_AppLicensesAccumulator data, LicenseEntry entry) =>
            data..addLicense(entry),
      )
      .then((_AppLicensesAccumulator data) => data.build());
}

String formatAppLicenseEntries(List<LicenseEntry> entries) {
  final StringBuffer buffer = StringBuffer();
  for (final LicenseEntry entry in entries) {
    if (buffer.isNotEmpty) {
      buffer
        ..writeln()
        ..writeln('---')
        ..writeln();
    }
    final List<LicenseParagraph> paragraphs = entry.paragraphs.toList();
    for (final LicenseParagraph paragraph in paragraphs) {
      if (buffer.isNotEmpty && !buffer.toString().endsWith('\n\n')) {
        buffer.writeln();
      }
      if (paragraph.indent == LicenseParagraph.centeredIndent) {
        buffer.writeln(paragraph.text);
      } else {
        buffer.writeln('${'  ' * paragraph.indent}${paragraph.text}');
      }
    }
  }
  return buffer.toString().trim();
}

class _AppLicensesAccumulator {
  final List<LicenseEntry> licenses = <LicenseEntry>[];
  final Map<String, List<int>> packageLicenseBindings = <String, List<int>>{};
  final List<String> packages = <String>[];

  String? _firstPackage;

  void addLicense(LicenseEntry entry) {
    for (final String package in entry.packages) {
      _addPackage(package);
      packageLicenseBindings[package]!.add(licenses.length);
    }
    licenses.add(entry);
  }

  void _addPackage(String package) {
    if (packageLicenseBindings.containsKey(package)) {
      return;
    }
    packageLicenseBindings[package] = <int>[];
    _firstPackage ??= package;
    packages.add(package);
  }

  AppLicensesData build() {
    packages.sort((String a, String b) {
      if (a == _firstPackage) {
        return -1;
      }
      if (b == _firstPackage) {
        return 1;
      }
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    return AppLicensesData(
      packages: List<String>.unmodifiable(packages),
      packageLicenseBindings: Map<String, List<int>>.unmodifiable(
        packageLicenseBindings.map(
          (String key, List<int> value) =>
              MapEntry<String, List<int>>(key, List<int>.unmodifiable(value)),
        ),
      ),
      licenses: List<LicenseEntry>.unmodifiable(licenses),
    );
  }
}
