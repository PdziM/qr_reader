import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:read_qrcode/domain/objects/custom_exception.dart';
import 'package:read_qrcode/utils/functions.dart';

import '../../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';
import '../service.dart';

CodeReaderService newCodeReaderService() => _CodeReaderService();

class _CodeReaderService extends CodeReaderService {
  late StreamSubscription<dynamic> subscription;
  List<QrCodeDecrypt> qrCodeDecriptyList = [];

  bool isLoading = false;
  @override
  Future<Either<CustomException, String>> readOneQrCode(
      {required ScanMode scanMode,
      String? lineColor,
      String? cancelButtonTitle,
      bool? flashOn}) async {
    try {
      String code = await FlutterBarcodeScanner.scanBarcode(
        lineColor ?? '#ff6666',
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
  Future<Either<CustomException, List<QrCodeDecrypt>>> readMultiplesQrCodes(
      {required ScanMode scanMode,
      String? lineColor,
      String? cancelButtonTitle,
      bool? flashOn}) async {
    try {
      subscription = FlutterBarcodeScanner.getBarcodeStreamReceiver(
              lineColor ?? "#ff6666",
              cancelButtonTitle ?? "Cancelar",
              flashOn ?? false,
              scanMode)!
          .listen((barcode) {
        QrCodeDecrypt qrCodeDecripty = QrCodeDecrypt.fromJson(barcode);

        if (qrCodeDecriptyList.length != qrCodeDecripty.total) {
          if (!qrCodeDecriptyList.contains(qrCodeDecripty)) {
            qrCodeDecriptyList.add(qrCodeDecripty);
            nPrint('BARCODE: $barcode');
          }
        }
      });
      return Right(qrCodeDecriptyList);
    } catch (e) {
      subscription.cancel();
      return Left(CustomException(message: e.toString()));
    }
  }
}
