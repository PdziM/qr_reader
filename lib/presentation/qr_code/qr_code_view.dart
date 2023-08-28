import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

import 'qr_code_state.dart';

class QrCodeView extends StatelessWidget {
  const QrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => QrCodeState(context),
      child: Consumer<QrCodeState>(
        builder: (_, state, __) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: const Text('Reader QRCODE'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (state.ticket != '') ...[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        'Ticket: ${state.ticket}',
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: state.readMultiplesQrCodes,
              tooltip: 'Read QrCode',
              child: const Icon(PhosphorIcons.qr_code_bold),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}
