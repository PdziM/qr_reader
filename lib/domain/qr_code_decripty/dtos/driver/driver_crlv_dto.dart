import '../../../../core/constants/mapping_db.dart';

class DriverCrlvDto {
  final String renavam;
  final String chassi;
  final String manufactureYear;
  final String plate;
  final String driId;
  final String modelYear;
  final String color;
  final String fuel;

  DriverCrlvDto.fromJson(json)
      : renavam = json[TbDriverCrlv.renavam],
        chassi = json[TbDriverCrlv.chassi],
        manufactureYear = json[TbDriverCrlv.manufactureYear],
        plate = json[TbDriverCrlv.plate],
        driId = json[TbDriverCrlv.driId],
        modelYear = json[TbDriverCrlv.modelYear],
        color = json[TbDriverCrlv.color],
        fuel = json[TbDriverCrlv.fuel];
}
