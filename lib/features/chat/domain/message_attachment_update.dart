class MessageAttachmentUpdate {
  const MessageAttachmentUpdate({required this.id, this.title, this.flags})
    : _description = _absent;

  const MessageAttachmentUpdate.withDescription({
    required this.id,
    required String? this._description,
    this.title,
    this.flags,
  });

  static const Object _absent = Object();

  final String id;
  final String? title;
  final int? flags;
  final Object? _description;

  bool get hasDescription => _description != _absent;
  String? get description => hasDescription ? _description as String? : null;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      if (title != null) 'title': title,
      if (hasDescription) 'description': description,
      if (flags != null) 'flags': flags,
    };
  }
}
