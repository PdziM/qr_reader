import 'dart:convert';

import '../../dtos/driver/driver_cnh_dto.dart';

class DriverCnh {
  final String cnhDocument;
  final String rgDocument;
  final String firstLicense;
  final String validity;
  final String issueDate;
  final String category;
  final String driId;
  final String birthDate;

  DriverCnh({
    required this.cnhDocument,
    required this.rgDocument,
    required this.firstLicense,
    required this.validity,
    required this.issueDate,
    required this.category,
    required this.driId,
    required this.birthDate,
  });

  DriverCnh copyWith({
    String? cnhDocument,
    String? rgDocument,
    String? firstLicense,
    String? validity,
    String? issueDate,
    String? category,
    String? driId,
    String? birthDate,
  }) {
    return DriverCnh(
      cnhDocument: cnhDocument ?? this.cnhDocument,
      rgDocument: rgDocument ?? this.rgDocument,
      firstLicense: firstLicense ?? this.firstLicense,
      validity: validity ?? this.validity,
      issueDate: issueDate ?? this.issueDate,
      category: category ?? this.category,
      driId: driId ?? this.driId,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cnhDocument': cnhDocument,
      'rgDocument': rgDocument,
      'firstLicense': firstLicense,
      'validity': validity,
      'issueDate': issueDate,
      'category': category,
      'driId': driId,
      'birthDate': birthDate,
    };
  }

  factory DriverCnh.fromMap(Map<String, dynamic> map) {
    return DriverCnh(
      cnhDocument: map['cnhDocument'] as String,
      rgDocument: map['rgDocument'] as String,
      firstLicense: map['firstLicense'] as String,
      validity: map['validity'] as String,
      issueDate: map['issueDate'] as String,
      category: map['category'] as String,
      driId: map['driId'] as String,
      birthDate: map['birthDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverCnh.fromJson(String source) =>
      DriverCnh.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DriverCnh(cnhDocument: $cnhDocument, rgDocument: $rgDocument, firstLicense: $firstLicense, validity: $validity, issueDate: $issueDate, category: $category, driId: $driId, birthDate: $birthDate)';
  }

  @override
  bool operator ==(covariant DriverCnh other) {
    if (identical(this, other)) return true;

    return other.cnhDocument == cnhDocument &&
        other.rgDocument == rgDocument &&
        other.firstLicense == firstLicense &&
        other.validity == validity &&
        other.issueDate == issueDate &&
        other.category == category &&
        other.driId == driId &&
        other.birthDate == birthDate;
  }

  @override
  int get hashCode {
    return cnhDocument.hashCode ^
        rgDocument.hashCode ^
        firstLicense.hashCode ^
        validity.hashCode ^
        issueDate.hashCode ^
        category.hashCode ^
        driId.hashCode ^
        birthDate.hashCode;
  }

  factory DriverCnh.fromDto(DriverCnhDto dto) {
    return DriverCnh(
        cnhDocument: dto.cnhDocument,
        rgDocument: dto.rgDocument,
        firstLicense: dto.firstLicense,
        validity: dto.validity,
        issueDate: dto.issueDate,
        category: dto.category,
        driId: dto.driId,
        birthDate: dto.birthDate);
  }
}
