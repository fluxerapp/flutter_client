class KeybindCombo {
  const KeybindCombo({
    required this.key,
    this.code,
    this.ctrlOrMeta = false,
    this.ctrl = false,
    this.alt = false,
    this.shift = false,
    this.meta = false,
  });

  final String key;
  final String? code;
  final bool ctrlOrMeta;
  final bool ctrl;
  final bool alt;
  final bool shift;
  final bool meta;

  bool get hasTrigger => key.isNotEmpty || (code != null && code!.isNotEmpty);

  KeybindCombo copyWith({
    String? key,
    String? code,
    bool? ctrlOrMeta,
    bool? ctrl,
    bool? alt,
    bool? shift,
    bool? meta,
  }) {
    return KeybindCombo(
      key: key ?? this.key,
      code: code ?? this.code,
      ctrlOrMeta: ctrlOrMeta ?? this.ctrlOrMeta,
      ctrl: ctrl ?? this.ctrl,
      alt: alt ?? this.alt,
      shift: shift ?? this.shift,
      meta: meta ?? this.meta,
    );
  }
}
