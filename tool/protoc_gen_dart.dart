import 'dart:io';

import 'package:protoc_plugin/protoc.dart';

Future<void> main() => CodeGenerator(stdin, stdout).generate();
