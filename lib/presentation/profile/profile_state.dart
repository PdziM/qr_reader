import 'package:flutter/material.dart';

import '../qr_code/qr_code_view.dart';

class ProfileState extends ChangeNotifier {
  final BuildContext context;
  // final CustomerProfile customerProfile;

  // ProfileState(this.context, this.customerProfile);
  ProfileState(this.context);

  void callQrCodeView() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const QrCodeView()));
  }
}
