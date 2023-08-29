import 'package:dartz/dartz.dart';

import '../../objects/custom_exception.dart';
import '../entities/customer_profile.dart';
import '../entities/qr_code_decrypt.dart';

abstract class QrCodeDecryptUsecase {
  Future<Either<CustomException, CustomerProfile>> decriptyQrCode(
      {required List<QrCodeDecrypt> qrCodeDecriptyList});
}
