import '../../../../core/constants/mapping_db.dart';

class DriverCnhDto {
  final String cnhDocument;
  final String rgDocument;
  final String firstLicense;
  final String validity;
  final String issueDate;
  final String category;
  final String driId;
  final String birthDate;

  DriverCnhDto.fromJson(json)
      : cnhDocument = json[TbDriverCnh.cnhDocument] ?? '',
        rgDocument = json[TbDriverCnh.rgDocument] ?? '',
        firstLicense = json[TbDriverCnh.firstLicense] ?? '',
        validity = json[TbDriverCnh.validity] ?? '',
        issueDate = json[TbDriverCnh.issueDate] ?? '',
        category = json[TbDriverCnh.category] ?? '',
        driId = json[TbDriverCnh.driId] ?? '',
        birthDate = json[TbDriverCnh.birthDate] ?? '';
}
