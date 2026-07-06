const Set<String> kKnownMultiTokenCodeFenceLanguages = <String>{
  'ada',
  'agda',
  'ansi',
  'adoc',
  'ansible',
  'asciidoc',
  'asm',
  'awk',
  'bash',
  'bat',
  'batch',
  'c',
  'c#',
  'c++',
  'caddy',
  'capnp',
  'cedar',
  'cedarschema',
  'cfg',
  'cl',
  'clj',
  'cljc',
  'cljs',
  'clojure',
  'cmake',
  'cmd',
  'cobol',
  'commonlisp',
  'conf',
  'config',
  'cpp',
  'cs',
  'csharp',
  'css',
  'dart',
  'docker',
  'dockerfile',
  'elixir',
  'elm',
  'erlang',
  'ex',
  'exs',
  'fsharp',
  'go',
  'groovy',
  'haskell',
  'hs',
  'html',
  'ini',
  'java',
  'javascript',
  'js',
  'json',
  'jsx',
  'julia',
  'katex',
  'kotlin',
  'kt',
  'latex',
  'less',
  'lisp',
  'lua',
  'make',
  'makefile',
  'markdown',
  'md',
  'nginx',
  'nim',
  'nix',
  'objc',
  'objective-c',
  'ocaml',
  'perl',
  'php',
  'pl',
  'powershell',
  'proto',
  'protobuf',
  'ps1',
  'py',
  'python',
  'r',
  'rb',
  'regex',
  'rs',
  'ruby',
  'rust',
  'sass',
  'scala',
  'scheme',
  'scss',
  'sh',
  'shell',
  'sql',
  'swift',
  'tex',
  'toml',
  'ts',
  'tsx',
  'typescript',
  'vb',
  'vim',
  'xml',
  'yaml',
  'yml',
  'zig',
};

bool _isFenceLanguageChar(int codeUnit) {
  return (codeUnit >= 0x30 && codeUnit <= 0x39) ||
      (codeUnit >= 0x41 && codeUnit <= 0x5A) ||
      (codeUnit >= 0x61 && codeUnit <= 0x7A) ||
      codeUnit == 0x5F ||
      codeUnit == 0x2B ||
      codeUnit == 0x2E ||
      codeUnit == 0x23 ||
      codeUnit == 0x2F ||
      codeUnit == 0x2D;
}

bool hasValidCodeFenceLanguage(String language) {
  if (language.isEmpty) {
    return false;
  }
  final int firstCodeUnit = language.codeUnitAt(0);
  if (firstCodeUnit == 0x20 || firstCodeUnit == 0x09) {
    return false;
  }
  final String trimmedValue = language.trim();
  if (trimmedValue.isEmpty) {
    return false;
  }
  final String primary = trimmedValue.split(RegExp(r'[ \t]')).first;
  if (primary.isEmpty) {
    return false;
  }
  if (!primary.codeUnits.every(_isFenceLanguageChar)) {
    return false;
  }
  if (primary.length == trimmedValue.length) {
    return true;
  }
  return kKnownMultiTokenCodeFenceLanguages.contains(primary.toLowerCase());
}

String? parseCodeFenceLanguage(String info) {
  if (!hasValidCodeFenceLanguage(info)) {
    return null;
  }
  return info.trim().split(RegExp(r'[ \t]')).first;
}
