import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../domain/objects/custom_exception.dart';
import '../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';

abstract class HttpClientService {
  Dio get dio;
  Future<Either<CustomException, Response>> get(String path,
      {Map<String, dynamic>? queryParameters});
  Future<Either<CustomException, Response>> post(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Either<CustomException, Response>> put(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Either<CustomException, Response>> patch(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
  Future<Either<CustomException, Response>> delete(String path,
      {dynamic data, Map<String, dynamic>? queryParameters});
}

abstract class CodeReaderService {
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

  Future<Either<Exception, bool>> stopScan();
}
