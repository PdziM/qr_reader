import 'dart:convert';

import '../../dtos/driver/driver_dto.dart';

class Driver {
  final String name;
  final String cpfDocument;
  final String moment;
  final String selfieUrl;
  final String usrId;
  final String cmpId;
  final String qrCode;
  final String score;
  final String active;

  Driver({
    required this.name,
    required this.cpfDocument,
    required this.moment,
    required this.selfieUrl,
    required this.usrId,
    required this.cmpId,
    required this.qrCode,
    required this.score,
    required this.active,
  });

  Driver copyWith({
    String? name,
    String? cpfDocument,
    String? moment,
    String? selfieUrl,
    String? usrId,
    String? cmpId,
    String? qrCode,
    String? score,
    String? active,
  }) {
    return Driver(
      name: name ?? this.name,
      cpfDocument: cpfDocument ?? this.cpfDocument,
      moment: moment ?? this.moment,
      selfieUrl: selfieUrl ?? this.selfieUrl,
      usrId: usrId ?? this.usrId,
      cmpId: cmpId ?? this.cmpId,
      qrCode: qrCode ?? this.qrCode,
      score: score ?? this.score,
      active: active ?? this.active,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'cpfDocument': cpfDocument,
      'moment': moment,
      'selfieUrl': selfieUrl,
      'usrId': usrId,
      'cmpId': cmpId,
      'qrCode': qrCode,
      'score': score,
      'active': active,
    };
  }

  factory Driver.fromMap(Map<String, dynamic> map) {
    return Driver(
      name: map['name'] as String,
      cpfDocument: map['cpfDocument'] as String,
      moment: map['moment'] as String,
      selfieUrl: map['selfieUrl'] as String,
      usrId: map['usrId'] as String,
      cmpId: map['cmpId'] as String,
      qrCode: map['qrCode'] as String,
      score: map['score'] as String,
      active: map['active'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Driver.fromJson(String source) =>
      Driver.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Driver(name: $name, cpfDocument: $cpfDocument, moment: $moment, selfieUrl: $selfieUrl, usrId: $usrId, cmpId: $cmpId, qrCode: $qrCode, score: $score, active: $active)';
  }

  @override
  bool operator ==(covariant Driver other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.cpfDocument == cpfDocument &&
        other.moment == moment &&
        other.selfieUrl == selfieUrl &&
        other.usrId == usrId &&
        other.cmpId == cmpId &&
        other.qrCode == qrCode &&
        other.score == score &&
        other.active == active;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        cpfDocument.hashCode ^
        moment.hashCode ^
        selfieUrl.hashCode ^
        usrId.hashCode ^
        cmpId.hashCode ^
        qrCode.hashCode ^
        score.hashCode ^
        active.hashCode;
  }

  factory Driver.fromDto(DriverDto dto) {
    return Driver(
        name: dto.name,
        cpfDocument: dto.cpfDocument,
        moment: dto.moment,
        selfieUrl: dto.selfieUrl,
        usrId: dto.usrId,
        cmpId: dto.cmpId,
        qrCode: dto.qrCode,
        score: dto.score,
        active: dto.active);
  }
}
