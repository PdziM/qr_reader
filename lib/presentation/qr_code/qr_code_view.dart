import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';
import 'package:read_qrcode/utils/functions.dart';

import '../../main_state.dart';
import 'qr_code_state.dart';

class QrCodeView extends StatelessWidget {
  const QrCodeView({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<ThemeMode> themeNotifier =
        context.read<MainState>().themeNotifier;

    return ChangeNotifierProvider(
      create: (_) => QrCodeState(context),
      child: Consumer<QrCodeState>(
        builder: (_, state, __) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: const Text(
                'Reader QRCODE',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    nPrint(themeNotifier.value);
                    themeNotifier.value = themeNotifier.value == ThemeMode.light
                        ? context.read<MainState>().setThemeMode(ThemeMode.dark)
                        : context
                            .read<MainState>()
                            .setThemeMode(ThemeMode.light);
                  },
                  icon: themeNotifier.value == ThemeMode.dark
                      ? const Icon(
                          PhosphorIcons.moon_bold,
                          color: Colors.white,
                        )
                      : const Icon(
                          PhosphorIcons.sun_bold,
                          color: Colors.white,
                        ),
                ),
              ],
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
              backgroundColor: Theme.of(context).colorScheme.primary,
              onPressed: state.readMultiplesQrCodes,
              tooltip: 'Read QrCode',
              child: const Icon(
                PhosphorIcons.qr_code_bold,
                color: Colors.white,
              ),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}
