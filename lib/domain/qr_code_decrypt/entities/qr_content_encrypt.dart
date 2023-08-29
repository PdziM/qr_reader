import 'dart:convert';

class QrContentEncrypt {
  final String iv;
  final String content;

  QrContentEncrypt({
    required this.iv,
    required this.content,
  });

  QrContentEncrypt copyWith({
    String? iv,
    String? content,
  }) {
    return QrContentEncrypt(
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

  factory QrContentEncrypt.fromMap(Map<String, dynamic> map) {
    return QrContentEncrypt(
      iv: map['iv'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QrContentEncrypt.fromJson(String source) =>
      QrContentEncrypt.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ContentDecripty(iv: $iv, content: $content)';

  @override
  bool operator ==(covariant QrContentEncrypt other) {
    if (identical(this, other)) return true;

    return other.iv == iv && other.content == content;
  }

  @override
  int get hashCode => iv.hashCode ^ content.hashCode;
}
