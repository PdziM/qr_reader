import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';
import 'package:provider/provider.dart';

import '../../shared/buttons/custom_button_text.dart';
import 'components/title_and_subtitle.dart';
import 'profile_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileState(context),
      child: Consumer<ProfileState>(
        builder: (_, state, __) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color(0xFF71AEF3),
              leading: IconButton(
                icon: const Icon(PhosphorIcons.arrow_left_bold),
                onPressed: state.callQrCodeView,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Dados do motorista',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          state.customerProfile.driver.selfieUrl,
                        ),
                      ),
                    ),
                  ),
                  TitleAndSubtitle(
                    title: 'Nome',
                    subTitle: state.customerProfile.driver.name,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TitleAndSubtitle(
                          title: 'CPF',
                          subTitle: UtilBrasilFields.obterCpf(
                              state.customerProfile.driver.cpfDocument),
                        ),
                      ),
                      Expanded(
                        child: TitleAndSubtitle(
                          title: 'Pontuação',
                          subTitle: state.customerProfile.driver.score,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TitleAndSubtitle(
                          title: 'Telefone',
                          // subTitle: state.customerProfile.driver.,
                          subTitle:
                              UtilBrasilFields.obterTelefone('17992117181'),
                        ),
                      ),
                      Expanded(
                        child: TitleAndSubtitle(
                          title: 'CNH',
                          subTitle: state.customerProfile.driverCnh.cnhDocument,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TitleAndSubtitle(
                          title: 'Cidade',
                          subTitle: state.customerProfile.driverAddress.city,
                        ),
                      ),
                      Expanded(
                        child: TitleAndSubtitle(
                          title: 'Estado',
                          subTitle: state.customerProfile.driverAddress.state,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Expanded(
                      child: CustomButtonText(
                        title: 'Historico de cargas',
                        onTap: () {},
                        iconData: PhosphorIcons.truck_bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
