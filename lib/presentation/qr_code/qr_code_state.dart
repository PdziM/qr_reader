import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../../domain/code_reader/repositories/qr_code_reader_repository.dart';
import '../../domain/qr_code_decripty/entities/qr_code_decripty.dart';
import '../../domain/qr_code_decripty/repositories/qr_code_decripty_repository.dart';
import '../../utils/functions.dart';
import '../profile/profile_view.dart';

class QrCodeState extends ChangeNotifier {
  final BuildContext context;
  String ticket = '';
  List<QrCodeDecripty> qrCodeDecriptyList = [];
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
        QrCodeDecripty qrCodeDecripty = QrCodeDecripty.fromJson(barcode);

        if (!qrCodeDecriptyList.contains(qrCodeDecripty)) {
          qrCodeDecriptyList.add(qrCodeDecripty);
        }

        if (qrCodeDecriptyList.length == qrCodeDecripty.total) {
          final res = await context
              .read<QrCodeDecriptyUsecase>()
              .decriptyQrCode(qrCodeDecriptyList: qrCodeDecriptyList);

          res.fold((l) {
            showCustomError(context: context, message: 'Opss.. ${l.message}');
          }, (r) {});
        }
      });
      isLoading = false;
      notifyListeners();
      callProfile();
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
