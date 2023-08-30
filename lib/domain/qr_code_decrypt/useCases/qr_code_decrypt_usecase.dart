import 'package:dartz/dartz.dart';

import '../../../repositories/api.dart';
import '../../objects/custom_exception.dart';
import '../entities/customer_profile.dart';
import '../entities/qr_code_decrypt.dart';
import '../repositories/qr_code_decrypt_repository.dart';

QrCodeDecryptUsecase newQrCodeDecriptyUseCase(QrCodeDecryptApi api) =>
    _QrCodeDecriptyUsecase(api);

class _QrCodeDecriptyUsecase extends QrCodeDecryptUsecase {
  final QrCodeDecryptApi _api;

  _QrCodeDecriptyUsecase(this._api);

  @override
  Future<Either<CustomException, CustomerProfile>> decriptyQrCode(
      {required List<QrCodeDecrypt> qrCodeDecriptyList}) async {
    final res = await _api.decryptQrCode(qrCodeDecripty: qrCodeDecriptyList);
    return res.fold((l) => Left(l), (r) async {
      return Right(CustomerProfile.fromDto(r));
    });
  }
}
