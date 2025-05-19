import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/animations/staggered_list_animation.dart';
import 'package:interview_task/helper/app_helpers/app_buttons.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/app_helpers/app_textfields.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
import 'package:interview_task/modules/authentication/controllers/auth_controller.dart';
import 'package:interview_task/modules/authentication/validator_case/case_validator.dart';
import 'package:interview_task/routes/app_pages.dart';

class SignUpView extends GetView<AuthController> {
  SignUpView({super.key});

  final formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).padding.top + 20,
                  ),
                  StaggeredListAnimation(
                      initialDelay: 100,
                      interval: 100,
                      children: [
                        wrapChildren(children: [
                          const AppText(
                            text: "Hey there,",
                            textSize: 15.0,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const AppText(
                            text: "Create an Account",
                            textSize: 17.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ]),
                        const SizedBox(height: 40),
                        wrapChildren(children: [
                          const AppText(
                            text: "Name",
                            textSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 10),
                          AppTextFields(
                            hintText: "e.g johndyer",
                            textLimit: 50,
                            readOnly: false,
                            validator: (String? value) =>
                                CaseValidator.validator(value!, "name"),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(19.0),
                              child: Image.asset(
                                Assets.assetsIcSignupProfile,
                                scale: 3,
                              ),
                            ),
                            controller: controller.nameSignup,
                          )
                        ]),
                        const SizedBox(height: 20),
                        wrapChildren(children: [
                          const AppText(
                            text: "Email Id",
                            textSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 10),
                          AppTextFields(
                            hintText: "e.g johndyer@gmail.com",
                            textLimit: 50,
                            readOnly: false,
                            validator: (String? value) =>
                                CaseValidator.validator(value!, "email"),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(19.0),
                              child: Image.asset(
                                Assets.assetsIcSignupEmail,
                                scale: 3,
                              ),
                            ),
                            controller: controller.emailSignup,
                          )
                        ]),
                        const SizedBox(height: 20),
                        wrapChildren(children: [
                          const AppText(
                            text: "Password",
                            textSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(height: 10),
                          Obx(
                                () => AppTextFields(
                              hintText: "************",
                              textLimit: 16,
                              obscureText: !controller.signupPassVisibility.value,
                              readOnly: false,
                                  validator: (String? value) =>
                                      CaseValidator.validator(value!, "password"),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(19.0),
                                child: Image.asset(
                                  Assets.assetsIcPassword,
                                  scale: 3,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  controller.signupPassVisibility.value =
                                  !controller.signupPassVisibility.value;
                                },
                                child: Icon(!controller.signupPassVisibility.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined),
                              ),
                              controller: controller.passwordSignup,
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: 15,
                        ),
                      ]),
                  Obx(()=> controller.isLoading.value?
                  Container(
                    width: Get.width,
                    margin: const EdgeInsets.only(top: 20, bottom: 10),
                    height: 60,
                    decoration: BoxDecoration(
                        border:Border.all(color: Colors.transparent, width: 0.0),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.appColor),
                    child: const Center(
                        child: SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            color: AppColors.white,
                          ),
                        )),
                  ):
                  AppButtons(
                    text: "Signup",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.signUp(context: context, email: controller.emailSignup.text, password: controller.passwordSignup.text,name:controller.nameSignup.text);
                      }
                    },
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    borderRadius: 10,
                    margin: const EdgeInsets.only(top: 50, bottom: 15),
                  ).animate().fadeIn(delay: GetNumUtils(1.4).seconds, duration: 700.ms, curve: Curves.linearToEaseOut)),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(Routes.login);
                                },
                              text: 'Login',
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.appColor,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                  ).animate().fadeIn(delay: GetNumUtils(2).seconds, duration: 700.ms, curve: Curves.linearToEaseOut),
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget wrapChildren({required List<Widget> children}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}