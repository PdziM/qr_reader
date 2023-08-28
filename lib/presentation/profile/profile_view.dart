import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'profile_state.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProfileState(context),
      child: Consumer<ProfileState>(
        builder: (_, state, __) {
          return Container();
        },
      ),
    );
  }
}
