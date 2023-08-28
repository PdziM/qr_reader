import 'package:dartz/dartz.dart';

import '../../objects/custom_exception.dart';
import '../entities/code.dart';

abstract class QrCodeReaderUsecase {
  Future<Either<CustomException, Code>> readOneQrCode(
      {String? lineColor, String? cancelButtonTitle, bool? flashOn});
  Future<Either<CustomException, List<Code>>> readMultiplesQrCodes(
      {String? lineColor, String? cancelButtonTitle, bool? flashOn});
}
