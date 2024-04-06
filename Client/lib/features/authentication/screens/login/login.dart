import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/common/styles/spacing_styles.dart';
import 'package:solution_challenge/features/authentication/screens/login/widgets/login_form.dart';
import 'package:solution_challenge/features/authentication/screens/login/widgets/login_header.dart';
import 'package:solution_challenge/utils/constants/sizes.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// logo title & subtitle
              TLoginHeader(),

              /// Form
              TLoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
