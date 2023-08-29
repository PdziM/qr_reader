import 'package:dartz/dartz.dart';

import '../domain/objects/custom_exception.dart';
import '../domain/qr_code_decrypt/dtos/customer_profile_dto.dart';
import '../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';

abstract class QrCodeDecryptApi {
  Future<Either<CustomException, CustomerProfileDto>> decryptQrCode(
      {required List<QrCodeDecrypt> qrCodeDecripty});
}
