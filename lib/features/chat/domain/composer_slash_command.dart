import 'package:flutter/foundation.dart';
import 'package:fluxer_app/core/permissions/permission.dart';

enum ComposerCommandOptionType {
  string,
  user,
  channel,
  role,
  integer,
  number,
  boolean,
  choice,
}

@immutable
class ComposerCommandChoice {
  const ComposerCommandChoice({required this.name, required this.value});

  final String name;
  final String value;
}

@immutable
class ComposerCommandOption {
  const ComposerCommandOption({
    required this.name,
    required this.description,
    required this.type,
    required this.required,
    this.allowEmpty = false,
    this.choices = const <ComposerCommandChoice>[],
  });

  final String name;
  final String description;
  final ComposerCommandOptionType type;
  final bool required;
  final bool allowEmpty;
  final List<ComposerCommandChoice> choices;
}

sealed class ComposerSlashCommand {
  const ComposerSlashCommand({required this.name, required this.description});

  final String name;
  final String description;
}

@immutable
class ComposerSimpleSlashCommand extends ComposerSlashCommand {
  const ComposerSimpleSlashCommand({
    required super.name,
    required super.description,
    required this.content,
  });

  final String content;
}

@immutable
class ComposerActionSlashCommand extends ComposerSlashCommand {
  const ComposerActionSlashCommand({
    required super.name,
    required super.description,
    this.permission,
    this.requiresGuild = false,
    this.options = const <ComposerCommandOption>[],
  });

  final Permission? permission;
  final bool requiresGuild;
  final List<ComposerCommandOption> options;
}
