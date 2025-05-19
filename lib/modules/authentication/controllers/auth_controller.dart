import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/firebase_services/firestore.dart';
import 'package:interview_task/helper/utils/app_toasts.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/models/userModel.dart';
import 'package:interview_task/routes/app_pages.dart';


class AuthController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var isLoading = false.obs;
  var isLoadingLogin = false.obs;
  RxBool loginPassVisibility = RxBool(false);
  RxBool signupPassVisibility = RxBool(false);

  TextEditingController emailSignup = TextEditingController();
  TextEditingController nameSignup = TextEditingController();
  TextEditingController passwordSignup = TextEditingController();

  final auth = Get.find<AuthService>();
  final firebase = Get.find<FirebaseFire>();

  void signUp({
    required BuildContext context,
    required String email,
    required String name,
    required String password,
  }) async{
    isLoading.value = true;
    var res = await auth.register(email, password);
    if(res!=null){
      UserModel model = UserModel(
          name: name,
          image: '--',
          email: email,
          password: password,
          uid: res.user!.uid);
      firebase.saveUser(model);
      AppToasts.callToast(type: MessageType.success, context: context, message: 'Account created successfully');
      Get.toNamed(Routes.login);
      emailSignup.clear();
      passwordSignup.clear();
      isLoading.value = false;
    }else{
      isLoading.value = false;
    }
  }



  void login({
    required BuildContext context,
    required String email1,
    required String password1,
  }) async {
    isLoadingLogin.value = true;
    var res = await auth.login(email1, password1);
    if (res!=null) {
      isLoadingLogin.value = false;
      SharedPreferenceHelper().saveUserId(res.user!.uid);
      AppToasts.callToast(type: MessageType.success, context: context, message: 'Login successfully');
      Get.toNamed(Routes.dashboard);
      email.clear();
      password.clear();

    } else {
      isLoadingLogin.value = false;
    }
  }

  }
