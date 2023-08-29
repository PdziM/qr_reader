import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../core/constants/mapping_envs.dart';
import '../../domain/objects/custom_exception.dart';
import '../../domain/qr_code_decrypt/dtos/customer_profile_dto.dart';
import '../../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';
import '../../domain/qr_code_decrypt/entities/qr_code_decrypt_list.dart';
import '../api.dart';
import '../service.dart';

QrCodeDecryptApi newQrCodeDecryptMockApi(HttpClientService service) =>
    _QrCodeDecryptMockApi(service);

class _QrCodeDecryptMockApi extends QrCodeDecryptApi {
  final HttpClientService _service;

  _QrCodeDecryptMockApi(this._service);

  @override
  Future<Either<CustomException, CustomerProfileDto>> decryptQrCode(
      {required List<QrCodeDecrypt> qrCodeDecripty}) async {
    var decrypt = QrCodeDecryptList(decrypt: qrCodeDecripty);

    final res = await _service.post('${EnvsConstants.url}/decripty-qrcode',
        data: jsonEncode(decrypt.toMap()));

    return res.fold(Left.new, (r) {
      if (r.data['error'] != 0) {
        return Left(CustomException(message: r.data['message']));
      }
      return Right(CustomerProfileDto.fromJson(r.data['data']));
    });
  }
}
