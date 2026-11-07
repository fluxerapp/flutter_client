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
  'ksh': bash,
  'sh': bash,
  'shell': shell,
  'shellscript': bash,
  'zsh': bash,
  'c': cpp,
  'c++': cpp,
  'cc': cpp,
  'cpp': cpp,
  'cxx': cpp,
  'h': cpp,
  'hh': cpp,
  'hpp': cpp,
  'hxx': cpp,
  'c#': cs,
  'cs': cs,
  'csharp': cs,
  'css': css,
  'dart': dart,
  'diff': diff,
  'patch': diff,
  'docker': dockerfile,
  'dockerfile': dockerfile,
  'go': go,
  'graphql': graphql,
  'gql': graphql,
  'graphqls': graphql,
  'java': java,
  'javascript': javascript,
  'cjs': javascript,
  'ecmascript': javascript,
  'js': javascript,
  'mjs': javascript,
  'node': javascript,
  'json': json,
  'json5': json,
  'jsonc': json,
  'kotlin': kotlin,
  'kt': kotlin,
  'kts': kotlin,
  'lua': lua,
  'makefile': makefile,
  'markdown': markdown,
  'md': markdown,
  'mdown': markdown,
  'mkdn': markdown,
  'nginx': nginx,
  'mm': objectivec,
  'obj-c': objectivec,
  'objc': objectivec,
  'objective-c': objectivec,
  'objectivec': objectivec,
  'php': php,
  'powershell': powershell,
  'ps1': powershell,
  'psd1': powershell,
  'psm1': powershell,
  'pwsh': powershell,
  'py': python,
  'py3': python,
  'python': python,
  'python3': python,
  'rb': ruby,
  'rs': rust,
  'ruby': ruby,
  'rust': rust,
  'scala': scala,
  'scss': scss,
  'sql': sql,
  'pgsql': sql,
  'postgres': sql,
  'postgresql': sql,
  'psql': sql,
  'swift': swift,
  'cts': typescript,
  'mts': typescript,
  'ts': typescript,
  'typescript': typescript,
  'htm': xml,
  'html': xml,
  'plist': xml,
  'svg': xml,
  'xhtml': xml,
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
