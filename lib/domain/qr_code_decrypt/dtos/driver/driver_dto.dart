import '../../../../core/constants/mapping_db.dart';

class DriverDto {
  final String name;
  final String cpfDocument;
  final String moment;
  final String selfieUrl;
  final String usrId;
  final String cmpId;
  final String qrCode;
  final int score;
  final bool active;

  DriverDto.fromJson(json)
      : name = json[TbDriver.name],
        cpfDocument = json[TbDriver.cpfDocument] ?? '',
        moment = json[TbDriver.moment] ?? '',
        selfieUrl = json[TbDriver.selfieUrl] ?? '',
        usrId = json[TbDriver.usrId] ?? '',
        cmpId = json[TbDriver.cmpId] ?? '',
        qrCode = json[TbDriver.qrCode] ?? '',
        score = json[TbDriver.score] ?? '',
        active = json[TbDriver.active] ?? '';
}
