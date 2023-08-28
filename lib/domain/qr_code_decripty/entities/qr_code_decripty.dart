import 'dart:convert';

import 'qr_content_encripty.dart';

class QrCodeDecripty {
  final int position;
  final int total;
  final QrContentEncripty content;

  QrCodeDecripty({
    required this.position,
    required this.total,
    required this.content,
  });

  QrCodeDecripty copyWith({
    int? position,
    int? total,
    QrContentEncripty? content,
  }) {
    return QrCodeDecripty(
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

  factory QrCodeDecripty.fromMap(Map<String, dynamic> map) {
    return QrCodeDecripty(
      position: map['position'],
      total: map['total'],
      content: QrContentEncripty.fromMap(map['content']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QrCodeDecripty.fromJson(String source) =>
      QrCodeDecripty.fromMap(json.decode(source));

  @override
  String toString() =>
      'CodeDecripty(position: $position, total: $total, content: $content)';

  @override
  bool operator ==(covariant QrCodeDecripty other) {
    if (identical(this, other)) return true;

    return other.position == position &&
        other.total == total &&
        other.content == content;
  }

  @override
  int get hashCode => position.hashCode ^ total.hashCode ^ content.hashCode;
}
