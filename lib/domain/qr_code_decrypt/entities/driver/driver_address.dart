import 'dart:convert';

import '../../dtos/driver/driver_address_dto.dart';

class DriverAddress {
  final String street;
  final String number;
  final String complement;
  final String district;
  final String city;
  final String state;
  final String zipCode;
  final String driId;

  DriverAddress({
    required this.street,
    required this.number,
    required this.complement,
    required this.district,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.driId,
  });

  DriverAddress copyWith({
    String? street,
    String? number,
    String? complement,
    String? district,
    String? city,
    String? state,
    String? zipCode,
    String? driId,
  }) {
    return DriverAddress(
      street: street ?? this.street,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      district: district ?? this.district,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      driId: driId ?? this.driId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'number': number,
      'complement': complement,
      'district': district,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'dri_id': driId,
    };
  }

  factory DriverAddress.fromMap(Map<String, dynamic> map) {
    return DriverAddress(
      street: map['street'] as String,
      number: map['number'] as String,
      complement: map['complement'] as String,
      district: map['district'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      zipCode: map['zip_code'] as String,
      driId: map['dri_id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DriverAddress.fromJson(String source) =>
      DriverAddress.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DriverAddress(street: $street, number: $number, complement: $complement, district: $district, city: $city, state: $state, zipCode: $zipCode, driId: $driId)';
  }

  @override
  bool operator ==(covariant DriverAddress other) {
    if (identical(this, other)) return true;

    return other.street == street &&
        other.number == number &&
        other.complement == complement &&
        other.district == district &&
        other.city == city &&
        other.state == state &&
        other.zipCode == zipCode &&
        other.driId == driId;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        number.hashCode ^
        complement.hashCode ^
        district.hashCode ^
        city.hashCode ^
        state.hashCode ^
        zipCode.hashCode ^
        driId.hashCode;
  }

  factory DriverAddress.fromDto(DriverAddressDto dto) {
    return DriverAddress(
        street: dto.street,
        number: dto.number,
        complement: dto.complement,
        district: dto.district,
        city: dto.city,
        state: dto.state,
        zipCode: dto.zipCode,
        driId: dto.driId);
  }
}
