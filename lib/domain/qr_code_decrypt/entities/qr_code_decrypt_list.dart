import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'qr_code_decrypt.dart';

class QrCodeDecryptList {
  final List<QrCodeDecrypt> decrypt;

  QrCodeDecryptList({
    required this.decrypt,
  });

  QrCodeDecryptList copyWith({
    List<QrCodeDecrypt>? decrypt,
  }) {
    return QrCodeDecryptList(
      decrypt: decrypt ?? this.decrypt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'list': decrypt.map((x) => x.toMap()).toList(),
    };
  }

  factory QrCodeDecryptList.fromMap(Map<String, dynamic> map) {
    return QrCodeDecryptList(
      decrypt: List<QrCodeDecrypt>.from(
        (map['list'] as List<int>).map<QrCodeDecrypt>(
          (x) => QrCodeDecrypt.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QrCodeDecryptList.fromJson(String source) =>
      QrCodeDecryptList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'QrCodeDecriptyList(list: $decrypt)';

  @override
  bool operator ==(covariant QrCodeDecryptList other) {
    if (identical(this, other)) return true;

    return listEquals(other.decrypt, decrypt);
  }

  @override
  int get hashCode => decrypt.hashCode;
}
