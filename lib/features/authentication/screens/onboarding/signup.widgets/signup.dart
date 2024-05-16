import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/form_divider.dart';
import 'package:flutter_ecommerce_project/common/widgets/social_buttons.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/signup.widgets/signup_form.dart';

import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';
import 'package:get/utils.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: Tsized.spaceBtwItems),

              //form
              const TSignupForm(),
              //divider
              TFormDivider(dividerText: TTexts.orSignInwith.capitalize!),
              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),
              //soicial button
              const TSocialButton(),
              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
