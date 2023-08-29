import 'dart:convert';

import '../dtos/customer_profile_dto.dart';
import 'driver/driver.dart';
import 'driver/driver_address.dart';
import 'driver/driver_cnh.dart';
import 'driver/driver_crlv_dto.dart';

class CustomerProfile {
  final Driver driver;
  final DriverAddress driverAddress;
  final DriverCnh driverCnh;
  final DriverCrlv driverCrlv;

  CustomerProfile({
    required this.driver,
    required this.driverAddress,
    required this.driverCnh,
    required this.driverCrlv,
  });

  CustomerProfile copyWith({
    Driver? driver,
    DriverAddress? driverAddress,
    DriverCnh? driverCnh,
    DriverCrlv? driverCrlv,
  }) {
    return CustomerProfile(
      driver: driver ?? this.driver,
      driverAddress: driverAddress ?? this.driverAddress,
      driverCnh: driverCnh ?? this.driverCnh,
      driverCrlv: driverCrlv ?? this.driverCrlv,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'driver': driver.toMap(),
      'driverAddress': driverAddress.toMap(),
      'driverCnh': driverCnh.toMap(),
      'driverCrlv': driverCrlv.toMap(),
    };
  }

  factory CustomerProfile.fromMap(Map<String, dynamic> map) {
    return CustomerProfile(
      driver: Driver.fromMap(map['driver'] as Map<String, dynamic>),
      driverAddress:
          DriverAddress.fromMap(map['driverAddress'] as Map<String, dynamic>),
      driverCnh: DriverCnh.fromMap(map['driverCnh'] as Map<String, dynamic>),
      driverCrlv: DriverCrlv.fromMap(map['driverCrlv'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerProfile.fromJson(String source) =>
      CustomerProfile.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomerProfile(driver: $driver, driverAddress: $driverAddress, driverCnh: $driverCnh, driverCrlv: $driverCrlv)';
  }

  @override
  bool operator ==(covariant CustomerProfile other) {
    if (identical(this, other)) return true;

    return other.driver == driver &&
        other.driverAddress == driverAddress &&
        other.driverCnh == driverCnh &&
        other.driverCrlv == driverCrlv;
  }

  @override
  int get hashCode {
    return driver.hashCode ^
        driverAddress.hashCode ^
        driverCnh.hashCode ^
        driverCrlv.hashCode;
  }

  factory CustomerProfile.fromDto(CustomerProfileDto dto) {
    return CustomerProfile(
        driver: Driver(
            name: dto.driverDto!.name,
            cpfDocument: dto.driverDto!.cpfDocument,
            moment: dto.driverDto!.moment,
            selfieUrl: dto.driverDto!.selfieUrl,
            usrId: dto.driverDto!.usrId,
            cmpId: dto.driverDto!.cmpId,
            qrCode: dto.driverDto!.qrCode,
            score: dto.driverDto!.score,
            active: dto.driverDto!.active),
        driverAddress: DriverAddress(
            city: dto.driverAddressDto!.city,
            street: dto.driverAddressDto!.street,
            number: dto.driverAddressDto!.number,
            complement: dto.driverAddressDto!.complement,
            district: dto.driverAddressDto!.district,
            state: dto.driverAddressDto!.state,
            zipCode: dto.driverAddressDto!.zipCode,
            driId: dto.driverAddressDto!.driId),
        driverCnh: DriverCnh(
            cnhDocument: dto.driverCnhDto!.cnhDocument,
            rgDocument: dto.driverCnhDto!.rgDocument,
            firstLicense: dto.driverCnhDto!.firstLicense,
            validity: dto.driverCnhDto!.validity,
            issueDate: dto.driverCnhDto!.issueDate,
            category: dto.driverCnhDto!.category,
            driId: dto.driverCnhDto!.driId,
            birthDate: dto.driverCnhDto!.birthDate),
        driverCrlv: DriverCrlv(
            renavam: dto.driverCrlvDto!.renavam,
            chassi: dto.driverCrlvDto!.chassi,
            manufactureYear: dto.driverCrlvDto!.manufactureYear,
            plate: dto.driverCrlvDto!.plate,
            driId: dto.driverCrlvDto!.driId,
            modelYear: dto.driverCrlvDto!.modelYear,
            color: dto.driverCrlvDto!.color,
            fuel: dto.driverCrlvDto!.fuel));
  }
}
