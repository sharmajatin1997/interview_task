import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/app_helpers/app_buttons.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/modules/dashBoard/controllers/dashboard_controller.dart';

class ProfileView extends GetView<DashboardController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getData(SharedPreferenceHelper().getUserId()!);
   return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.black,
       body:Padding(
         padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
         child: Obx(
           ()=> Column(
             mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Icon(Icons.arrow_back_ios,size: 24,color: Colors.white,),
                   SizedBox(
                     width: 10,
                   ),
                   AppText(
               text: 'Profile',
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
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   AppText(
                       text: 'Name',
                       textSize: 14.0,
                       fontWeight: FontWeight.w500),
                   SizedBox(
                     width: 10,
                   ),
                   AppText(
                       text: controller.model.value?.name??'',
                       textSize: 14.0,
                       fontWeight: FontWeight.w500),
                 ],
               ),
               SizedBox(
                 height: 30,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   AppText(
                       text: 'Email',
                       textSize: 14.0,
                       fontWeight: FontWeight.w500),
                   SizedBox(
                     width: 10,
                   ),
                   AppText(
                       text: controller.model.value?.email??'',
                       textSize: 14.0,
                       fontWeight: FontWeight.w500),
                 ],
               ),
               SizedBox(
                 height: 30,
               ),
               AppButtons(
                 text: "Edit Profile",
                 onTap: () {

                 },
                 padding: const EdgeInsets.symmetric(vertical: 20),
                 borderRadius: 10,
                 margin: const EdgeInsets.only(top: 50, bottom: 15),
               )
             ],
           ),
         ),
       ),
     ),
   );
  }

}


