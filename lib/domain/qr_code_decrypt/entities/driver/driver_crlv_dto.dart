import 'dart:convert';

import '../../dtos/driver/driver_crlv_dto.dart';

class DriverCrlv {
  final String renavam;
  final String chassi;
  final String manufactureYear;
  final String plate;
  final String driId;
  final String modelYear;
  final String color;
  final String fuel;

  DriverCrlv({
    required this.renavam,
    required this.chassi,
    required this.manufactureYear,
    required this.plate,
    required this.driId,
    required this.modelYear,
    required this.color,
    required this.fuel,
  });

  DriverCrlv copyWith({
    String? renavam,
    String? chassi,
    String? manufactureYear,
    String? plate,
    String? driId,
    String? modelYear,
    String? color,
    String? fuel,
  }) {
    return DriverCrlv(
      renavam: renavam ?? this.renavam,
      chassi: chassi ?? this.chassi,
      manufactureYear: manufactureYear ?? this.manufactureYear,
      plate: plate ?? this.plate,
      driId: driId ?? this.driId,
      modelYear: modelYear ?? this.modelYear,
      color: color ?? this.color,
      fuel: fuel ?? this.fuel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'renavam': renavam,
      'chassi': chassi,
      'manufacture_year': manufactureYear,
      'plate': plate,
      'dri_id': driId,
      'model_year': modelYear,
      'color': color,
      'fuel': fuel,
    };
  }

  factory DriverCrlv.fromMap(Map<String, dynamic> map) {
    return DriverCrlv(
      renavam: map['renavam'] as String,
      chassi: map['chassi'] as String,
      manufactureYear: map['manufacture_year'] as String,
      plate: map['plate'] as String,
      driId: map['dri_id'] as String,
      modelYear: map['model_year'] as String,
      color: map['color'] as String,
      fuel: map['fuel'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverCrlv.fromJson(String source) =>
      DriverCrlv.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DriverCrlv(renavam: $renavam, chassi: $chassi, manufactureYear: $manufactureYear, plate: $plate, driId: $driId, modelYear: $modelYear, color: $color, fuel: $fuel)';
  }

  @override
  bool operator ==(covariant DriverCrlv other) {
    if (identical(this, other)) return true;

    return other.renavam == renavam &&
        other.chassi == chassi &&
        other.manufactureYear == manufactureYear &&
        other.plate == plate &&
        other.driId == driId &&
        other.modelYear == modelYear &&
        other.color == color &&
        other.fuel == fuel;
  }

  @override
  int get hashCode {
    return renavam.hashCode ^
        chassi.hashCode ^
        manufactureYear.hashCode ^
        plate.hashCode ^
        driId.hashCode ^
        modelYear.hashCode ^
        color.hashCode ^
        fuel.hashCode;
  }

  factory DriverCrlv.fromDto(DriverCrlvDto dto) {
    return DriverCrlv(
        chassi: dto.chassi,
        renavam: dto.renavam,
        manufactureYear: dto.manufactureYear,
        plate: dto.plate,
        driId: dto.driId,
        modelYear: dto.modelYear,
        color: dto.color,
        fuel: dto.fuel);
  }
}
