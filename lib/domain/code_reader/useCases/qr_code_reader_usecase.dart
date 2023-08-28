import 'package:dartz/dartz.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../../repositories/code_reader.dart';
import '../../objects/custom_exception.dart';
import '../entities/code.dart';
import '../repositories/qr_code_reader_repository.dart';

QrCodeReaderUsecase newQrCodeReaderUsecase(CodeReader qrCodeReader) =>
    _QrCodeReaderUsecase(qrCodeReader);

class _QrCodeReaderUsecase extends QrCodeReaderUsecase {
  final CodeReader _qrCodeReader;

  _QrCodeReaderUsecase(this._qrCodeReader);

  @override
  Future<Either<CustomException, Code>> readOneQrCode(
      {String? lineColor, String? cancelButtonTitle, bool? flashOn}) async {
    final res = await _qrCodeReader.readOneQrCode(
        scanMode: ScanMode.QR,
        lineColor: lineColor,
        cancelButtonTitle: cancelButtonTitle,
        flashOn: flashOn);
    return res.fold(Left.new, (r) => Right(Code(description: r)));
  }

  @override
  Future<Either<CustomException, List<Code>>> readMultiplesQrCodes(
      {String? lineColor, String? cancelButtonTitle, bool? flashOn}) async {
    final res = await _qrCodeReader.readMultiplesQrCodes(
        scanMode: ScanMode.QR,
        lineColor: lineColor,
        cancelButtonTitle: cancelButtonTitle,
        flashOn: flashOn);
    return res.fold(Left.new, (r) {
      List<Code> list = [];
      for (var element in r) {
        list.add(Code(description: element));
      }
      return Right(list);
    });
  }
}
