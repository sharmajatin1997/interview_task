import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/helper/app_helpers/app_textfields.dart';
import 'package:interview_task/modules/authentication/controllers/auth_controller.dart';
import 'package:interview_task/modules/authentication/validator_case/case_validator.dart';

class SignupView extends GetView<AuthController> {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppTextFields(
            textFieldColor: const Color(0xffFBFBFB),
            borderRadius: 15,
            textInputType: TextInputType.emailAddress,
            hintText: "Email",
            controller: controller.email,
            validator: (String? value) => CaseValidator.validator(value!, "email"),
            textLimit: 50,
          ),
        ],
      ),
    );
  }

}