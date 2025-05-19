import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AuthController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // void signupApi({
  //   required BuildContext context,
  //   required int type,
  //   String? email,
  //   String? countryCode,
  //   String? phoneNumber,
  // }) {
  //   isLoadingSignup.value = true;
  //   _authApiCalls.signup(
  //       context: context,
  //       type: type,
  //       role: 1,
  //       email:
  //           signupEmail.text.trim().isNotEmpty ? signupEmail.text.trim() : null,
  //       name: signupFullName.text.trim(),
  //       userName: signupUsername.text.trim(),
  //       countryCode: type == 1 ? countryCode : null,
  //       phoneNumber: type == 1 ? phoneNumber : null,
  //       gender: selectedGender.value,
  //       password: type == 1 ? null : setPassword.value.text.trim(),
  //       device_token: '123456789',
  //       image:profileImage.value.isNotEmpty?profileImage.value:null,
  //       device_type: GetPlatform.isAndroid ? '0' : '1',
  //       onSuccess: (data) {
  //         isLoadingSignup.value = false;
  //         SharedPreferenceHelper().saveUserToken(data["token"]);
  //         SharedPreferenceHelper().saveUserId(data["_id"]);
  //         token.value = data["token"];
  //         if (type == 1) {
  //           SocketHelper().connectUser();
  //           Get.toNamed(Routes.profileSetup);
  //         }
  //         else {
  //           Utils.callToast(
  //               type: MessageType.success,
  //               context: context,
  //               message:
  //                   "Your OTP is sent on your email. please check your mail.");
  //           resetCreatePassword();
  //           Get.offAllNamed(Routes.verification, arguments: {
  //             "from": "signup_email",
  //             "display": data["email"],
  //             "otp": "",
  //             "token":token.value,
  //             "id":data["_id"],
  //           });
  //         }
  //         signupFullName.clear();
  //         signupEmail.clear();
  //         signupUsername.clear();
  //         selectedGender.value = '';
  //       },
  //       onError: (data) {
  //         isLoadingSignup.value = false;
  //       });
  // }

  // void login({
  //   required BuildContext context,
  //   required String email,
  //   required String password,
  // }) async{
  //   isLoadingLogin.value = true;
  //   String? token;
  //   token='12345678';
  //   // if(SharedPreferenceHelper().getDeviceToken()!=null){
  //   //   token=SharedPreferenceHelper().getDeviceToken();
  //   // }else{
  //   //   token=await FirebaseMessaging.instance.getToken();
  //   // }
  //   _authApiCalls.login(
  //       context: context,
  //       role: 1,
  //       email: email,
  //       device_token: token,
  //       device_type: GetPlatform.isAndroid ? '0' : '1',
  //       password: password,
  //       onSuccess: (data) {
  //         isLoadingLogin.value = false;
  //         SharedPreferenceHelper().saveUserToken(data["token"]);
  //         SharedPreferenceHelper().saveUserName(data["full_name"]);
  //         SharedPreferenceHelper().saveUserId(data["id"]);
  //
  //         if (data['user_name'] != null &&
  //             data['full_name'] != null &&
  //             data['qualification'] == null &&
  //             data['experience'] == null) {
  //           Get.toNamed(Routes.profileSetup);
  //         } else if (data['user_name'] != null &&
  //             data['full_name'] != null &&
  //             data['qualification'] != null &&
  //             data['experience'] != null &&
  //             data['is_slot_set'] == false) {
  //
  //           Get.offAllNamed(Routes.setAvailability);
  //         } else {
  //           Get.offAllNamed(Routes.dashboard);
  //         }
  //         loginEmail.clear();
  //         loginPassword.clear();
  //       },
  //       onError: (data) {
  //         isLoadingLogin.value = false;
  //       });
  // }
}
