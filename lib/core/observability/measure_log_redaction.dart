import 'package:flutter/foundation.dart';

const String _kRedactedHost = 'instance';
const String _kRedactedId = ':id';
const String _kRedactedValue = ':value';
const String _kRedactedEmail = 'email';

const Set<String> _kSegmentsBeforeValue = <String>{
  'invite',
  'invites',
  'gift',
  'gifts',
  'template',
  'templates',
  'reactions',
  'vanity-url',
};

const Set<String> _kFileExtensions = <String>{
  'aab',
  'apk',
  'arb',
  'cc',
  'cpp',
  'css',
  'dart',
  'db',
  'dll',
  'dylib',
  'exe',
  'framework',
  'gif',
  'html',
  'ipa',
  'java',
  'jpeg',
  'jpg',
  'js',
  'json',
  'kt',
  'log',
  'm4a',
  'mjs',
  'mov',
  'mp3',
  'mp4',
  'plist',
  'png',
  'so',
  'sqlite',
  'svg',
  'swift',
  'txt',
  'wasm',
  'webp',
  'xml',
  'yaml',
  'yml',
  'zip',
};

final RegExp _routeWord = RegExp(r'^(?:[a-z][a-z-]*|@me|v\d+)$');
final RegExp _digitsOnly = RegExp(r'^\d+$');
final RegExp _url = RegExp(
  r'\b([a-z][a-z0-9+.\-]*)://'
  r'''([^\s/?#'"<>()\[\]{}|\\^`]+)'''
  r'''([^\s?#'"<>()\[\]{}|\\^`]*)'''
  r'''(?:\?[^\s#'"<>()]*)?'''
  r'''(?:#[^\s'"<>()]*)?''',
  caseSensitive: false,
);
final RegExp _email = RegExp(
  r'[a-z0-9._%+\-]+@[a-z0-9.\-]+\.[a-z]{2,}',
  caseSensitive: false,
);
final RegExp _hostAfterLabel = RegExp(
  r'''(host lookup: '|address = |host: |CN=)([^\s',)/]+)''',
  caseSensitive: false,
);
final RegExp _ipv4 = RegExp(r'(?<![\d.])(?:\d{1,3}\.){3}\d{1,3}(?![\d.])');
final RegExp _ipv6 = RegExp(
  r'(?<![\w.:])\[?(?=[0-9a-f:]*::)[0-9a-f]{0,4}(?::[0-9a-f]{0,4}){2,7}\]?(?![\w.:])',
  caseSensitive: false,
);
final RegExp _hostname = RegExp(
  r'(?<![\w./@:\-])'
  r'((?:[a-z0-9](?:[a-z0-9\-]{0,61}[a-z0-9])?\.)+[a-z][a-z0-9\-]{0,61}[a-z0-9])'
  r'(?![\w(\[\-]|\.[\w])',
);
final RegExp _snowflake = RegExp(r'(?<!\d)\d{15,20}(?!\d)');

String scrubPathForMeasure(String path) {
  final List<String> segments = path.split('/');
  final List<String> scrubbed = <String>[];
  String? previous;
  for (final String segment in segments) {
    if (segment.isEmpty) {
      scrubbed.add(segment);
    } else if (previous != null && _kSegmentsBeforeValue.contains(previous)) {
      scrubbed.add(_kRedactedValue);
    } else if (_digitsOnly.hasMatch(segment)) {
      scrubbed.add(_kRedactedId);
    } else if (_routeWord.hasMatch(segment)) {
      scrubbed.add(segment);
    } else {
      scrubbed.add(_kRedactedValue);
    }
    previous = segment;
  }
  return scrubbed.join('/');
}

String redactMeasureHttpUrl(String url) {
  final Uri? uri = Uri.tryParse(url);
  if (uri == null || uri.host.isEmpty) {
    return scrubForMeasure(url);
  }
  return '${uri.scheme}://$_kRedactedHost${scrubPathForMeasure(uri.path)}';
}

String scrubForMeasure(String value) {
  if (value.isEmpty) {
    return value;
  }
  return value
      .replaceAllMapped(
        _url,
        (Match match) =>
            '${match.group(1)!.toLowerCase()}://$_kRedactedHost'
            '${scrubPathForMeasure(match.group(3) ?? '')}',
      )
      .replaceAll(_email, _kRedactedEmail)
      .replaceAllMapped(
        _hostAfterLabel,
        (Match match) => '${match.group(1)}$_kRedactedHost',
      )
      .replaceAll(_ipv4, _kRedactedHost)
      .replaceAll(_ipv6, _kRedactedHost)
      .replaceAllMapped(_hostname, (Match match) {
        final String host = match.group(1)!;
        final String lastLabel = host.substring(host.lastIndexOf('.') + 1);
        if (_kFileExtensions.contains(lastLabel)) {
          return host;
        }
        return _kRedactedHost;
      })
      .replaceAll(_snowflake, _kRedactedId);
}

Object unwrapMeasureSanitizedError(Object error) {
  if (error is _MeasureRedactedError) {
    return error._source;
  }
  return error;
}

Object sanitizeErrorForMeasure(Object error) {
  return _MeasureRedactedError(error);
}

StackTrace sanitizeStackTraceForMeasure(StackTrace stackTrace) {
  return StackTrace.fromString(scrubForMeasure(stackTrace.toString()));
}

FlutterErrorDetails sanitizeErrorDetailsForMeasure(
  FlutterErrorDetails details,
) {
  final StackTrace? stack = details.stack;
  return FlutterErrorDetails(
    exception: sanitizeErrorForMeasure(details.exception),
    stack: stack == null ? null : sanitizeStackTraceForMeasure(stack),
    library: details.library,
    silent: details.silent,
  );
}

class _MeasureRedactedError implements Exception {
  _MeasureRedactedError(this._source);

  final Object _source;

  @override
  String toString() => scrubForMeasure(_source.toString());
}
