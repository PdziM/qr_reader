import 'dart:async';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/code_reader/repositories/qr_code_reader_repository.dart';
import '../../domain/qr_code_decrypt/entities/customer_profile.dart';
import '../../domain/qr_code_decrypt/entities/qr_code_decrypt.dart';
import '../../domain/qr_code_decrypt/repositories/qr_code_decrypt_repository.dart';
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

      final res =
          await context.read<QrCodeReaderUsecase>().readMultiplesQrCodes();

      res.fold((l) {
        showCustomError(context: context, message: 'Opss.. ${l.message}');
        back();
      }, (r) async {
        final res = await context
            .read<QrCodeDecryptUsecase>()
            .decriptyQrCode(qrCodeDecriptyList: r);

        res.fold((l) {
          showCustomError(context: context, message: 'Opss.. ${l.message}');
          back();
        }, (r) {
          nPrint('readMultiplesQrCodes: ${r.toMap()}');
          callProfile(customerProfile: r);
        });
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

  void callProfile({required CustomerProfile customerProfile}) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ProfileView(customerProfile: customerProfile),
      ),
    );
  }
}
