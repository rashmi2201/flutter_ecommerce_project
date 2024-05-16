import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/styles/spacing_styles.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/login/widgets/login_form.dart';

import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
// ignore: unused_import
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: TLoginForm(
            dark: dark,
          ),
        ),
      ),
    );
  }
}
