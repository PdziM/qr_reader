import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../../domain/code_reader/repositories/qr_code_reader_repository.dart';
import '../../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';
import '../../repositories/mock/qr_code_decrypt_mock_api.dart';
import '../../utils/functions.dart';
import '../profile/profile_view.dart';

class QrCodeState extends ChangeNotifier {
  final BuildContext context;
  String ticket = '';
  List<QrCodeDecrypt> qrCodeDecriptyList = [];
  late StreamSubscription<dynamic> subscription;
  bool isLoading = false;

  QrCodeState(this.context) {
    init();
  }

  init() {}

  Future<void> readOneQrCode() async {
    isLoading = true;
    notifyListeners();

    final res = await context
        .read<QrCodeReaderUsecase>()
        .readOneQrCode(lineColor: "#ff6666");

    res.fold(Left.new, (r) {
      ticket = r.description;
      notifyListeners();
    });
  }

  Future<void> readMultiplesQrCodes() async {
    try {
      isLoading = true;
      notifyListeners();
      subscription = FlutterBarcodeScanner.getBarcodeStreamReceiver(
              "#ff6666", "Cancel", false, ScanMode.QR)!
          .listen((barcode) async {
        QrCodeDecrypt qrCodeDecripty = QrCodeDecrypt.fromJson(barcode);

        if (!qrCodeDecriptyList.contains(qrCodeDecripty)) {
          qrCodeDecriptyList.add(qrCodeDecripty);
          nPrint('BARCODE: $barcode');
        }

        if (qrCodeDecriptyList.length == qrCodeDecripty.total) {
          final mock = newQrCodeDecryptMockApi();
          mock.decryptQrCode(qrCodeDecripty: qrCodeDecriptyList).then((value) {
            nPrint('VALUE: $value');
          });

          // final res = await context
          //     .read<QrCodeDecryptUsecase>()
          //     .decriptyQrCode(qrCodeDecriptyList: qrCodeDecriptyList);

          // res.fold((l) {
          //   showCustomError(context: context, message: 'Opss.. ${l.message}');
          //   // callProfile();
          // }, (r) {
          //   callProfile();
          // });
        }
      });

      isLoading = false;
      notifyListeners();
    } catch (e) {
      log('ERROR: ${e.toString()}');
    }
  }

  void back() {
    Navigator.of(context).pop();
  }

  void callProfile() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ProfileView()));
  }
}
