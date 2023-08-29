import 'dart:convert';

import 'qr_content_encrypt.dart';

class QrCodeDecrypt {
  final int position;
  final int total;
  final QrContentEncrypt content;

  QrCodeDecrypt({
    required this.position,
    required this.total,
    required this.content,
  });

  QrCodeDecrypt copyWith({
    int? position,
    int? total,
    QrContentEncrypt? content,
  }) {
    return QrCodeDecrypt(
      position: position ?? this.position,
      total: total ?? this.total,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'position': position,
      'total': total,
      'content': content.toMap(),
    };
  }

  factory QrCodeDecrypt.fromMap(Map<String, dynamic> map) {
    return QrCodeDecrypt(
      position: map['position'] as int,
      total: map['total'] as int,
      content: QrContentEncrypt.fromMap(map['content'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory QrCodeDecrypt.fromJson(String source) =>
      QrCodeDecrypt.fromMap(jsonDecode(source));

  @override
  String toString() =>
      'QrCodeDecripty(position: $position, total: $total, content: $content)';

  @override
  bool operator ==(covariant QrCodeDecrypt other) {
    if (identical(this, other)) return true;

    return other.position == position &&
        other.total == total &&
        other.content == content;
  }

  @override
  int get hashCode => position.hashCode ^ total.hashCode ^ content.hashCode;
}