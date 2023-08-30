import 'package:dartz/dartz.dart';

import '../../objects/custom_exception.dart';
import '../../qr_code_decrypt/entities/qr_code_decrypt.dart';
import '../entities/code.dart';

abstract class QrCodeReaderUsecase {
  Future<Either<CustomException, Code>> readOneQrCode(
      {String? lineColor, String? cancelButtonTitle, bool? flashOn});
  Future<Either<CustomException, List<QrCodeDecrypt>>> readMultiplesQrCodes(
      {String? lineColor, String? cancelButtonTitle, bool? flashOn});
}
