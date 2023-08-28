import 'dart:convert';

class QrContentEncripty {
  final String iv;
  final String content;

  QrContentEncripty({
    required this.iv,
    required this.content,
  });

  QrContentEncripty copyWith({
    String? iv,
    String? content,
  }) {
    return QrContentEncripty(
      iv: iv ?? this.iv,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'iv': iv,
      'content': content,
    };
  }

  factory QrContentEncripty.fromMap(Map<String, dynamic> map) {
    return QrContentEncripty(
      iv: map['iv'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QrContentEncripty.fromJson(String source) =>
      QrContentEncripty.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ContentDecripty(iv: $iv, content: $content)';

  @override
  bool operator ==(covariant QrContentEncripty other) {
    if (identical(this, other)) return true;

    return other.iv == iv && other.content == content;
  }

  @override
  int get hashCode => iv.hashCode ^ content.hashCode;
}
