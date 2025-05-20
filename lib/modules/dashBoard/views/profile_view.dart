import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/animations/staggered_list_animation.dart';
import 'package:interview_task/helper/app_helpers/app_buttons.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
import 'package:interview_task/helper/responsive.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/modules/dashBoard/controllers/dashboard_controller.dart';
import 'package:interview_task/routes/app_pages.dart';

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
               StaggeredListAnimation(
                 initialDelay: 100,
                 interval: 100,
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
                   text: 'Profile',
                       textSize: MediaQuery.of(context).size.width * 0.03,
                       fontWeight: FontWeight.w500),
                     ],
                   ),
                   SizedBox(
                     height: 20,
                   ),
                   wrapChildren(children: [
                     Center(
                       child: Image.asset(
                         Assets.assetsUser,
                         height: Responsive.isMobile(context)?200:300,
                         width:  Responsive.isMobile(context)?200:300,
                       ),
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
                             textSize: MediaQuery.of(context).size.width * 0.03,
                             fontWeight: FontWeight.w500),
                         SizedBox(
                           width: 10,
                         ),
                         AppText(
                             text: controller.model.value?.name??'',
                             textSize: MediaQuery.of(context).size.width * 0.03,
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
                             textSize: MediaQuery.of(context).size.width * 0.03,
                             fontWeight: FontWeight.w500),
                         SizedBox(
                           width: 10,
                         ),
                         AppText(
                             text: controller.model.value?.email??'',
                             textSize: MediaQuery.of(context).size.width * 0.03,
                             fontWeight: FontWeight.w500),
                       ],
                     ),
                   ]),
                   SizedBox(
                     height: 30,
                   ),
                   AppButtons(
                     text: "Edit Profile",
                     textSize: MediaQuery.of(context).size.width * 0.03,
                     onTap: () async{
                       var res=await Get.toNamed(Routes.editProfileView);
                       if(res){
                         controller.getData(SharedPreferenceHelper().getUserId()!);
                       }
                     },
                     padding:  EdgeInsets.symmetric(vertical: Responsive.isMobile(context)?20:30),
                     borderRadius: 10,
                     margin: const EdgeInsets.only(top: 50,),
                   ),
                   AppButtons(
                     text: "Logout",
                     textSize: MediaQuery.of(context).size.width * 0.03,
                     onTap: () async{
                       Get.find<AuthService>().logout();
                     },
                     padding:  EdgeInsets.symmetric(vertical: Responsive.isMobile(context)?20:30),
                     borderRadius: 10,
                     margin: const EdgeInsets.only(top: 20, bottom: 15),
                   ),
                 ],
               ),
             ],
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


