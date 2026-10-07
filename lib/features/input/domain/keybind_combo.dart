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
}
