import 'package:dartz/dartz.dart';

import '../../../repositories/api.dart';
import '../../objects/custom_exception.dart';
import '../entities/customer_profile.dart';
import '../entities/qr_code_decripty.dart';
import '../repositories/qr_code_decripty_repository.dart';

QrCodeDecriptyUsecase newQrCodeDecriptyUseCase(QrCodeDecriptyApi api) =>
    _QrCodeDecriptyUsecase(api);

class _QrCodeDecriptyUsecase extends QrCodeDecriptyUsecase {
  final QrCodeDecriptyApi _api;

  _QrCodeDecriptyUsecase(this._api);

  @override
  Future<Either<CustomException, CustomerProfile>> decriptyQrCode(
      {required List<QrCodeDecripty> qrCodeDecriptyList}) async {
    final res = await _api.decriptyQrCode(qrCodeDecripty: qrCodeDecriptyList);

    return res.fold((l) => Left(l), (r) async {
      return Right(CustomerProfile.fromDto(r));
    });
  }
}
