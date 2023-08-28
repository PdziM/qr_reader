import 'package:dio/dio.dart';

import '../domain/code_reader/useCases/qr_code_reader_usecase.dart';
import '../domain/qr_code_decripty/useCases/qr_code_decripty_usecase.dart';
import '../repositories/api/qr_code_decripty_api.dart';
import '../repositories/code_reader/qr_code_reader.dart';
import '../repositories/services/code_reader_service.dart';
import '../repositories/services/http_client_service.dart';

class Config {
  // SERVICES HTTP
  static final dio = Dio();
  static final httpClientService = newHttpClientService(dio);

  // SERVICES
  static final qrCodeService = newCodeReaderService();
  static final qrCodeReader = newQrCodeReader(qrCodeService);

  // API
  static final qrCodeDecriptyApi = newQrCodeDecriptyApi(httpClientService);

  // USECASES
  static final qrCodeReaderUsecase = newQrCodeReaderUsecase(qrCodeReader);
  static final qrCodeDecriptyUsecase =
      newQrCodeDecriptyUseCase(qrCodeDecriptyApi);
}
