import 'package:dartz/dartz.dart';

import '../domain/objects/custom_exception.dart';
import '../domain/qr_code_decripty/dtos/customer_profile_dto.dart';
import '../domain/qr_code_decripty/entities/qr_code_decripty.dart';

abstract class QrCodeDecriptyApi {
  Future<Either<CustomException, CustomerProfileDto>> decriptyQrCode(
      {required List<QrCodeDecripty> qrCodeDecripty});
}
