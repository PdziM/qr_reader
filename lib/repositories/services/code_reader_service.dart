import 'package:dartz/dartz.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:read_qrcode/domain/objects/custom_exception.dart';

import '../service.dart';

CodeReaderService newCodeReaderService() => _CodeReaderService();

class _CodeReaderService extends CodeReaderService {
  @override
  Future<Either<CustomException, String>> readOneQrCode(
      {required ScanMode scanMode,
      String? lineColor,
      String? cancelButtonTitle,
      bool? flashOn}) async {
    try {
      String code = await FlutterBarcodeScanner.scanBarcode(
        lineColor ?? '#FFFFFF',
        cancelButtonTitle ?? 'Cancelar',
        flashOn ?? false,
        scanMode,
      );

      if (code != '-1') {
        return Right(code);
      } else {
        return Left(CustomException(message: 'Leitura inválida!'));
      }
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }

  @override
  Future<Either<CustomException, List<String>>> readMultiplesQrCodes(
      {required ScanMode scanMode,
      String? lineColor,
      String? cancelButtonTitle,
      bool? flashOn}) async {
    try {
      // IMPLEMENTAR
      List<String> list = [];
      return Right(list);
    } catch (e) {
      return Left(CustomException(message: e.toString()));
    }
  }
}
