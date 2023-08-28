import 'package:dartz/dartz.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:read_qrcode/domain/objects/custom_exception.dart';

import '../code_reader.dart';
import '../service.dart';

CodeReader newQrCodeReader(CodeReaderService service) => _QrCodeReader(service);

class _QrCodeReader extends CodeReader {
  final CodeReaderService _service;

  _QrCodeReader(this._service);

  @override
  Future<Either<CustomException, String>> readOneQrCode(
      {required ScanMode scanMode,
      String? lineColor,
      String? cancelButtonTitle,
      bool? flashOn}) async {
    final code = await _service.readOneQrCode(
        scanMode: ScanMode.QR,
        lineColor: lineColor,
        cancelButtonTitle: cancelButtonTitle,
        flashOn: flashOn);
    return code.fold(Left.new, (r) => Right(r));
  }

  @override
  Future<Either<CustomException, List<String>>> readMultiplesQrCodes(
      {required ScanMode scanMode,
      String? lineColor,
      String? cancelButtonTitle,
      bool? flashOn}) {
    throw UnimplementedError();
  }
}
