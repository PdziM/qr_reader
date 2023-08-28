import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'domain/code_reader/repositories/qr_code_reader_repository.dart';
import 'domain/qr_code_decripty/repositories/qr_code_decripty_repository.dart';
import 'main_state.dart';
import 'presentation/qr_code/qr_code_view.dart';
import 'repositories/code_reader.dart';
import 'repositories/service.dart';
import 'utils/config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //SERVICES
        Provider<HttpClientService>(create: (_) => Config.httpClientService),
        Provider<CodeReaderService>(create: (_) => Config.qrCodeService),
        Provider<CodeReader>(create: (_) => Config.qrCodeReader),
        //USE CASES
        Provider<QrCodeReaderUsecase>(
            create: (_) => Config.qrCodeReaderUsecase),
        Provider<QrCodeDecriptyUsecase>(
            create: (_) => Config.qrCodeDecriptyUsecase),
        //SINGLETON
        ListenableProvider<MainState>(create: (_) => MainState(context))
      ],
      child: Consumer<MainState>(
        builder: (_, state, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme:
                  ColorScheme.fromSeed(seedColor: const Color(0xFF71AEF3)),
              useMaterial3: true,
            ),
            home: const QrCodeView(),
          );
        },
      ),
    );
  }
}
