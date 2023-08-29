import 'package:dartz/dartz.dart';
import 'package:read_qrcode/utils/functions.dart';

import '../../domain/objects/custom_exception.dart';
import '../../domain/qr_code_decrypt/dtos/customer_profile_dto.dart';
import '../../domain/qr_code_decrypt/entities/customer_profile.dart';
import '../../domain/qr_code_decrypt/entities/driver/driver.dart';
import '../../domain/qr_code_decrypt/entities/driver/driver_address.dart';
import '../../domain/qr_code_decrypt/entities/driver/driver_cnh.dart';
import '../../domain/qr_code_decrypt/entities/driver/driver_crlv_dto.dart';
import '../../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';
import '../api.dart';

QrCodeDecryptApi newQrCodeDecryptMockApi() => _QrCodeDecryptMockApi();

class _QrCodeDecryptMockApi extends QrCodeDecryptApi {
  _QrCodeDecryptMockApi();

  CustomerProfile customerProfile = CustomerProfile(
    driver: Driver(
      name: 'Octavio Luiz',
      cpfDocument: '35747136810',
      moment: '20-04-1987',
      selfieUrl:
          'https://e7.pngegg.com/pngimages/550/997/png-clipart-user-icon-foreigners-avatar-child-face.png',
      usrId: '',
      cmpId: '',
      qrCode: '',
      score: '600',
      active: '',
    ),
    driverAddress: DriverAddress(
      street: 'Rua Calil José Kfouri',
      number: '73',
      complement: 'Casa',
      district: 'Bebedouro',
      city: 'Bebedouro',
      state: 'SP',
      zipCode: '14702108',
      driId: '',
    ),
    driverCnh: DriverCnh(
      cnhDocument: '213123123',
      rgDocument: '401.400.873-x',
      firstLicense: '12-09-2019',
      validity: '12-09-2029',
      issueDate: '12-09-2019',
      category: 'AB',
      driId: '',
      birthDate: '20-04-1987',
    ),
    driverCrlv: DriverCrlv(
      renavam: '12323123',
      chassi: '12312321',
      manufactureYear: '2019',
      plate: 'bcs6754',
      driId: '',
      modelYear: '2019',
      color: 'Branca',
      fuel: 'Gasolina',
    ),
  );

  @override
  Future<Either<CustomException, CustomerProfileDto>> decryptQrCode(
      {required List<QrCodeDecrypt> qrCodeDecripty}) async {
    nPrint(customerProfile.toJson());

    return Right(CustomerProfileDto.fromJson(customerProfile.toJson()));
  }
}
