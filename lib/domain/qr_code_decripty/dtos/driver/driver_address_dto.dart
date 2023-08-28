import '../../../../core/constants/mapping_db.dart';

class DriverAddressDto {
  final String street;
  final String number;
  final String complement;
  final String district;
  final String city;
  final String state;
  final String zipCode;
  final String driId;

  DriverAddressDto.fromJson(json)
      : street = json[TbDriverAddress.street],
        number = json[TbDriverAddress.number],
        complement = json[TbDriverAddress.complement],
        district = json[TbDriverAddress.district],
        city = json[TbDriverAddress.city],
        state = json[TbDriverAddress.state],
        zipCode = json[TbDriverAddress.zipCode],
        driId = json[TbDriverAddress.driId];
}
