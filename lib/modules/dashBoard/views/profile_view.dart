import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/generated/assets.dart';
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
       body:Column(
         children: [
           Padding(
             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
             child:   Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Icon(Icons.arrow_back_ios,size: 24,color: Colors.white,),
                 AppText(
             text: 'Profile',
                 textSize: 14.0,
                 fontWeight: FontWeight.w500),

               ],
             ),
           ),
         ],
       ),
     ),
   );
  }

}


