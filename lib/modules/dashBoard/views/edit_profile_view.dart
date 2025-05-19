import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/app_helpers/app_buttons.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/app_helpers/app_textfields.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/modules/authentication/validator_case/case_validator.dart';
import 'package:interview_task/modules/dashBoard/controllers/dashboard_controller.dart';

class EditProfileView extends GetView<DashboardController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.black,
       body:Padding(
         padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
         child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   GestureDetector(
                     onTap: (){
                       Get.back();
                     },
                       child: Icon(Icons.arrow_back_ios,size: 24,color: Colors.white,)),
                   SizedBox(
                     width: 10,
                   ),
                   AppText(
                    text: 'Edit Profile',
                   textSize: 14.0,
                   fontWeight: FontWeight.w500),


                 ],
               ),
               SizedBox(
                 height: 20,
               ),
               Image.asset(
                 Assets.assetsUser,
                 height: 200,
                 width: 200,
               ),
               SizedBox(
                 height: 30,
               ),
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
                   validator: (String? value) => CaseValidator.validator(value!, "name"),
                   prefixIcon: Padding(
                     padding: const EdgeInsets.all(19.0),
                     child: Image.asset(
                       Assets.assetsIcSignupProfile,
                       scale: 3,
                     ),
                   ),
                   controller: controller.name,
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
                   readOnly: true,
                   validator: (String? value) =>
                       CaseValidator.validator(value!, "email"),
                   prefixIcon: Padding(
                     padding: const EdgeInsets.all(19.0),
                     child: Image.asset(
                       Assets.assetsIcSignupEmail,
                       scale: 3,
                     ),
                   ),
                   controller: controller.email,
                 )
               ]),

               SizedBox(
                 height: 30,
               ),
               AppButtons(
                 text: "Update Profile",
                 onTap: () {
                   Map<String, dynamic> user = controller.model.value!.toJson();
                   user['name']=controller.name.text;
                   controller.firebase.updateUserInfo(user);
                 },
                 padding: const EdgeInsets.symmetric(vertical: 20),
                 borderRadius: 10,
                 margin: const EdgeInsets.only(top: 50, bottom: 15),
               )
             ],
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


