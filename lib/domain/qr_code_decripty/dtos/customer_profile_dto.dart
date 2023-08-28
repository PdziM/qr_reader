import '../../../core/constants/mapping_db.dart';
import 'driver/driver_address_dto.dart';
import 'driver/driver_cnh_dto.dart';
import 'driver/driver_crlv_dto.dart';
import 'driver/driver_dto.dart';

class CustomerProfileDto {
  final DriverDto? driverDto;
  final DriverAddressDto? driverAddressDto;
  final DriverCnhDto? driverCnhDto;
  final DriverCrlvDto? driverCrlvDto;

  CustomerProfileDto.fromJson(json)
      : driverDto = json[TbCustomerProfile.driver] == null
            ? null
            : DriverDto.fromJson(json[TbCustomerProfile.driver]),
        driverAddressDto = json[TbCustomerProfile.driverAddress] == null
            ? null
            : DriverAddressDto.fromJson(json[TbCustomerProfile.driverAddress]),
        driverCnhDto = json[TbCustomerProfile.driverCnh] == null
            ? null
            : DriverCnhDto.fromJson(json[TbCustomerProfile.driverCnh]),
        driverCrlvDto = json[TbCustomerProfile.driverCrlv] == null
            ? null
            : DriverCrlvDto.fromJson(json[TbCustomerProfile.driverCrlv]);
}
