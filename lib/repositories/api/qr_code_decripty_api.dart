import 'dart:convert';

import 'package:dartz/dartz.dart';

import '../../core/constants/mapping_envs.dart';
import '../../domain/objects/custom_exception.dart';
import '../../domain/qr_code_decripty/dtos/customer_profile_dto.dart';
import '../../domain/qr_code_decripty/entities/qr_code_decripty.dart';
import '../api.dart';
import '../service.dart';

QrCodeDecriptyApi newQrCodeDecriptyApi(HttpClientService service) =>
    _QrCodeDecriptyApi(service);

class _QrCodeDecriptyApi extends QrCodeDecriptyApi {
  final HttpClientService _service;

  _QrCodeDecriptyApi(this._service);

  @override
  Future<Either<CustomException, CustomerProfileDto>> decriptyQrCode(
      {required List<QrCodeDecripty> qrCodeDecripty}) async {
    final res = await _service.post('${EnvsConstants.url}/decripty-qrcode',
        data: jsonEncode(qrCodeDecripty.toList()));

    return res.fold(Left.new, (r) {
      if (r.data['error'] != 0) {
        return Left(CustomException(message: r.data['message']));
      }
      return Right(CustomerProfileDto.fromJson(r.data['data']));
    });
  }
}
