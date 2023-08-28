import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';

import '../../domain/code_reader/repositories/qr_code_reader_repository.dart';
import '../../domain/qr_code_decripty/entities/qr_code_decripty.dart';
import '../../domain/qr_code_decripty/repositories/qr_code_decripty_repository.dart';
import '../../utils/functions.dart';

class QrCodeState extends ChangeNotifier {
  final BuildContext context;
  String ticket = '';
  List<QrCodeDecripty> qrCodeDecriptyList = [];

  QrCodeState(this.context) {
    init();
  }

  init() {}

  Future<void> readOneQrCode() async {
    final res = await context.read<QrCodeReaderUsecase>().readOneQrCode();

    res.fold(Left.new, (r) {
      ticket = r.description;
      notifyListeners();
    });
  }

  Future<void> readMultiplesQrCodes() async {
    try {
      FlutterBarcodeScanner.getBarcodeStreamReceiver(
              "#ff6666", "Cancel", false, ScanMode.QR)!
          .listen((barcode) async {
        QrCodeDecripty qrCodeDecripty = QrCodeDecripty.fromJson(barcode);

        if (!qrCodeDecriptyList.contains(qrCodeDecripty)) {
          qrCodeDecriptyList.add(qrCodeDecripty);
          notifyListeners();
        }

        if (qrCodeDecriptyList.length == qrCodeDecripty.total) {
          final res = await context
              .read<QrCodeDecriptyUsecase>()
              .decriptyQrCode(qrCodeDecriptyList: qrCodeDecriptyList);

          res.fold((l) {
            showCustomError(context: context, message: 'Opss.. ${l.message}');
          }, (r) {
            // context.read<MainState>().setSession(r);
            // callBase();
          });

          nPrint('realizar chamada!');
          nPrint('LIST: ${qrCodeDecriptyList}');
        }
      });
      // log('TEMP LIST: ${tempList}');
    } catch (e) {
      log('ERROR: ${e.toString()}');
    }
  }

  void back() {
    Navigator.of(context).pop();
  }
}
