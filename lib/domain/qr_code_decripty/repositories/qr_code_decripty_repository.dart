import 'package:dartz/dartz.dart';

import '../../objects/custom_exception.dart';
import '../entities/customer_profile.dart';
import '../entities/qr_code_decripty.dart';

abstract class QrCodeDecriptyUsecase {
  Future<Either<CustomException, CustomerProfile>> decriptyQrCode(
      {required List<QrCodeDecripty> qrCodeDecriptyList});
}
