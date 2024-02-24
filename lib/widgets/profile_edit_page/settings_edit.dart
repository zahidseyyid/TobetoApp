import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constant_padding.dart';
import 'package:flutter_application_1/constants/page_constants.dart';
import 'package:flutter_application_1/logic/blocs/auth_bloc/auth_bloc.dart';
import 'package:flutter_application_1/logic/blocs/auth_bloc/auth_event.dart';
import 'package:flutter_application_1/widgets/home_page/tabbar_widgets/custom_widget/custom_elevated_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsEdit extends StatefulWidget {
  const SettingsEdit({super.key});

  @override
  State<SettingsEdit> createState() => _SettingsEditState();
}

class _SettingsEditState extends State<SettingsEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        children: [
          Padding(padding: paddingSmall),
          CustomElevatedButton(
              text: SettingsPageConstants.deleteAccount,
              onPressed: () {
                context.read<AuthBloc>().add(AuthDeleteUser());
              },
              buttonColor: Colors.red),
        ],
      )),
    );
  }
}
