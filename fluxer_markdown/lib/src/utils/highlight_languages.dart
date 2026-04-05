import 'package:highlight/highlight.dart' show Mode, highlight;
import 'package:highlight/languages/bash.dart';
import 'package:highlight/languages/cpp.dart';
import 'package:highlight/languages/cs.dart';
import 'package:highlight/languages/css.dart';
import 'package:highlight/languages/dart.dart';
import 'package:highlight/languages/diff.dart';
import 'package:highlight/languages/dockerfile.dart';
import 'package:highlight/languages/go.dart';
import 'package:highlight/languages/graphql.dart';
import 'package:highlight/languages/java.dart';
import 'package:highlight/languages/javascript.dart';
import 'package:highlight/languages/json.dart';
import 'package:highlight/languages/kotlin.dart';
import 'package:highlight/languages/lua.dart';
import 'package:highlight/languages/makefile.dart';
import 'package:highlight/languages/markdown.dart';
import 'package:highlight/languages/nginx.dart';
import 'package:highlight/languages/objectivec.dart';
import 'package:highlight/languages/php.dart';
import 'package:highlight/languages/powershell.dart';
import 'package:highlight/languages/python.dart';
import 'package:highlight/languages/ruby.dart';
import 'package:highlight/languages/rust.dart';
import 'package:highlight/languages/scala.dart';
import 'package:highlight/languages/scss.dart';
import 'package:highlight/languages/shell.dart';
import 'package:highlight/languages/sql.dart';
import 'package:highlight/languages/swift.dart';
import 'package:highlight/languages/typescript.dart';
import 'package:highlight/languages/xml.dart';
import 'package:highlight/languages/yaml.dart';

final Map<String, Mode> kFluxerMarkdownLanguages = {
  'bash': bash,
  'sh': bash,
  'shell': shell,
  'zsh': bash,
  'c': cpp,
  'c++': cpp,
  'cpp': cpp,
  'cs': cs,
  'csharp': cs,
  'css': css,
  'dart': dart,
  'diff': diff,
  'docker': dockerfile,
  'dockerfile': dockerfile,
  'go': go,
  'graphql': graphql,
  'java': java,
  'javascript': javascript,
  'js': javascript,
  'json': json,
  'kotlin': kotlin,
  'lua': lua,
  'makefile': makefile,
  'markdown': markdown,
  'md': markdown,
  'nginx': nginx,
  'objc': objectivec,
  'objectivec': objectivec,
  'php': php,
  'powershell': powershell,
  'ps1': powershell,
  'py': python,
  'python': python,
  'rb': ruby,
  'rs': rust,
  'ruby': ruby,
  'rust': rust,
  'scala': scala,
  'scss': scss,
  'sql': sql,
  'swift': swift,
  'ts': typescript,
  'typescript': typescript,
  'html': xml,
  'xml': xml,
  'yaml': yaml,
  'yml': yaml,
};

bool _languagesRegistered = false;

void ensureFluxerMarkdownLanguagesRegistered() {
  if (_languagesRegistered) {
    return;
  }
  _languagesRegistered = true;
  kFluxerMarkdownLanguages.forEach(highlight.registerLanguage);
}

