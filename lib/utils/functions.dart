import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void nPrint(value) {
  if (kDebugMode) {
    log(value.toString());
  }
}

DateTime now = DateTime.now();

dynamic showCustomSuccess(
    {required BuildContext context,
    required String message,
    Duration? duration}) async {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    icon: const Icon(Icons.check_circle, color: Colors.white),
    messageText: Text(message, style: const TextStyle(color: Colors.white)),
    duration: const Duration(seconds: 6),
    backgroundColor: Colors.green,
  ).show(context).then((value) {
    // Navigator.pop(context);
  });
}

dynamic showCustomError(
    {required BuildContext context,
    required String message,
    Duration? duration}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 6),
    backgroundColor: Colors.orange,
  ).show(context);
}

dynamic showCustomFail(
    {required BuildContext context,
    required String message,
    Duration? duration}) {
  Flushbar(
    flushbarPosition: FlushbarPosition.TOP,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 6),
    backgroundColor: Colors.red,
  ).show(context);
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
