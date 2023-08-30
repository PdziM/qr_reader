import 'package:dartz/dartz.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../domain/objects/custom_exception.dart';
import '../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';

abstract class CodeReader {
  Future<Either<CustomException, String>> readOneQrCode(
      {required ScanMode scanMode,
      String? lineColor,
      String? cancelButtonTitle,
      bool? flashOn});
  Future<Either<CustomException, List<QrCodeDecrypt>>> readMultiplesQrCodes(
      {required ScanMode scanMode,
      String? lineColor,
      String? cancelButtonTitle,
      bool? flashOn});
}
