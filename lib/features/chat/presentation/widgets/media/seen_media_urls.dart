import 'dart:collection';

import 'package:flutter/foundation.dart';

const int kSeenMediaUrlsMaxEntries = 1000;

const Set<String> _kSignedQueryParameters = <String>{
  'mt',
  'ex',
  'is',
  'hm',
  'expires',
  'signature',
  'key-pair-id',
  'token',
};

bool _isSignedQueryParameter(String name) {
  final String lower = name.toLowerCase();
  return _kSignedQueryParameters.contains(lower) || lower.startsWith('x-amz-');
}

class SeenMediaUrls {
  SeenMediaUrls._();

  static final LinkedHashSet<String> _keys = LinkedHashSet<String>();

  static String keyOf(String url) {
    final int hashIndex = url.indexOf('#');
    final String head = hashIndex < 0 ? url : url.substring(0, hashIndex);
    final int queryIndex = head.indexOf('?');
    if (queryIndex < 0) {
      return head;
    }
    final List<String> kept = <String>[
      for (final String part in head.substring(queryIndex + 1).split('&'))
        if (part.isNotEmpty && !_isSignedQueryParameter(_nameOf(part))) part,
    ];
    final String path = head.substring(0, queryIndex);
    return kept.isEmpty ? path : '$path?${kept.join('&')}';
  }

  static String _nameOf(String part) {
    final int equalsIndex = part.indexOf('=');
    return equalsIndex < 0 ? part : part.substring(0, equalsIndex);
  }

  static bool contains(String url) {
    if (url.isEmpty) {
      return false;
    }
    return _keys.contains(keyOf(url));
  }

  static void mark(String url) {
    if (url.isEmpty) {
      return;
    }
    final String key = keyOf(url);
    _keys
      ..remove(key)
      ..add(key);
    while (_keys.length > kSeenMediaUrlsMaxEntries) {
      _keys.remove(_keys.first);
    }
  }

  static int get length => _keys.length;

  @visibleForTesting
  static void clear() => _keys.clear();
}
