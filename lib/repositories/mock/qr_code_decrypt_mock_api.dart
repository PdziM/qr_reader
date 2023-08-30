import 'package:dartz/dartz.dart';

import '../../domain/objects/custom_exception.dart';
import '../../domain/qr_code_decrypt/dtos/customer_profile_dto.dart';
import '../../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';
import '../api.dart';

QrCodeDecryptApi newQrCodeDecryptMockApi() => _QrCodeDecryptMockApi();

class _QrCodeDecryptMockApi extends QrCodeDecryptApi {
  _QrCodeDecryptMockApi();

  // CustomerProfile customerProfile = CustomerProfile(
  //   driver: Driver(
  //     name: 'Octavio Luiz',
  //     cpfDocument: '35747136810',
  //     moment: '20-04-1987',
  //     selfieUrl:
  //         'https://e7.pngegg.com/pngimages/550/997/png-clipart-user-icon-foreigners-avatar-child-face.png',
  //     usrId: '',
  //     cmpId: '',
  //     qrCode: '',
  //     score: '600',
  //     active: '',
  //   ),
  //   driverAddress: DriverAddress(
  //     street: 'Rua Calil José Kfouri',
  //     number: '73',
  //     complement: 'Casa',
  //     district: 'Bebedouro',
  //     city: 'Bebedouro',
  //     state: 'SP',
  //     zipCode: '14702108',
  //     driId: '',
  //   ),
  //   driverCnh: DriverCnh(
  //     cnhDocument: '213123123',
  //     rgDocument: '401.400.873-x',
  //     firstLicense: '12-09-2019',
  //     validity: '12-09-2029',
  //     issueDate: '12-09-2019',
  //     category: 'AB',
  //     driId: '',
  //     birthDate: '20-04-1987',
  //   ),
  //   driverCrlv: DriverCrlv(
  //     renavam: '12323123',
  //     chassi: '12312321',
  //     manufactureYear: '2019',
  //     plate: 'bcs6754',
  //     driId: '',
  //     modelYear: '2019',
  //     color: 'Branca',
  //     fuel: 'Gasolina',
  //   ),
  // );

  var customerProfile = {
    "driver": {
      // "id": "51387b64-c2b3-4e2e-be86-78131da74194",
      "name": "Caio Viale de Lima",
      "cpf_document": "42124192892",
      "moment": "2023-08-10T18:13:28.334Z",
      "selfie_url":
          "https://cdn.pixabay.com/photo/2020/07/01/12/58/icon-5359553_1280.png",
      "usr_id": "3179b0ad-e91b-4090-aa7f-bebcb10329f0",
      "cmp_id": null,
      "qr_code": null,
      "score": 750,
      "active": true
    },
    "driverCnh": {
      // "id": "956f7384-8d45-451e-b779-cd57e4922897",
      "cnh_document": "07478235720",
      "rg_document": "59258045 SSP SP",
      "first_license": "2020-10-17",
      "validity": "2025-01-30",
      "issue_date": "2021-10-20",
      "category": "AB",
      "dri_id": "51387b64-c2b3-4e2e-be86-78131da74194",
      "birth_date": "2002-01-15",
      "father_name": "LEANDRO RODRIGO DE LIMA",
      "mother_name": "LUCIA PASCOALINA VIALE DE LIMA"
    },
    "driverCrlv": {
      // "id": "851766fb-2127-4eb1-a8f4-b0368d854631",
      "renavam": "01147042710",
      "chassi": "98861110XJK170175",
      "manufacture_year": "2018",
      "plate": "FON2108",
      "dri_id": "51387b64-c2b3-4e2e-be86-78131da74194",
      "model_year": "2018",
      "color": "PRETA",
      "fuel": "ALCOOL/GASOLINA"
    },
    "driverAddress": {
      // "id": "e69be2b7-09af-4397-b323-2667d4ed371c",
      "street": "AVENIDA RAUL FURQUIM",
      "number": null,
      "complement": null,
      "district": "JARDIM MARAJA",
      "city": "BEBEDOURO",
      "state": "SP",
      "zip_code": "14706100",
      "dri_id": "51387b64-c2b3-4e2e-be86-78131da74194"
    }
  };

  @override
  Future<Either<CustomException, CustomerProfileDto>> decryptQrCode(
      {required List<QrCodeDecrypt> qrCodeDecripty}) async {
    return Right(CustomerProfileDto.fromJson(customerProfile));
  }
}
