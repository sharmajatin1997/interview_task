import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/animations/staggered_list_animation.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/app_helpers/image_view_chat.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
import 'package:interview_task/helper/responsive.dart';
import 'package:interview_task/helper/shimmer/shimmer_box.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/modules/dashBoard/controllers/dashboard_controller.dart';
import 'package:interview_task/routes/app_pages.dart';

class HomeView extends GetView<DashboardController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getData(SharedPreferenceHelper().getUserId()!);
    controller.getEventList();
   return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.black,
       body:Padding(
         padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             StaggeredListAnimation(
               initialDelay: 100,
               interval: 100,
               children: [
                 wrapChildren(children: [
                   GestureDetector(
                     onTap: (){
                       Get.toNamed(Routes.profileView);
                     },
                     child: Row(
                       children: [
                         Image.asset(
                           Assets.assetsUser,
                           height: Responsive.isMobile(context)?50:60,
                           width:  Responsive.isMobile(context)?50:60,
                         ),
                         Obx(
                               ()=> AppText(
                               text: controller.model.value?.name??'',
                               textSize: MediaQuery.of(context).size.width * 0.03,
                               fontWeight: FontWeight.w500),
                         ),
                       ],
                     ),
                   ),
                 ]),
                 SizedBox(
                   height: 20,
                 ),
                 wrapChildren(children: [
                   Padding(
                     padding: const EdgeInsets.symmetric(
                         horizontal: 20),
                     child: AppText(
                         text: 'Upcoming Events',
                         textSize: MediaQuery.of(context).size.width * 0.03,
                         fontWeight: FontWeight.w500),
                   ),
                 ]),
                 SizedBox(
                   height: 20,
                 ),
                 Obx(() =>controller.isLoading.value?
                   ListView.builder(
                       padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                       shrinkWrap: true,
                       physics: const ClampingScrollPhysics(),
                       itemCount: 2,
                       itemBuilder: (context, index) {
                         return  Column(
                           children: [
                             ShimmerBox(
                                 width: Get.width,
                                 height: MediaQuery.sizeOf(context).height/3.5),
                             SizedBox(
                               height: 20,
                             )
                           ],
                         );
                       }) :controller.eventList.isNotEmpty ? ListView.separated(
                         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                         shrinkWrap: true,
                         physics: const ClampingScrollPhysics(),
                         itemCount: controller.eventList.length,
                         itemBuilder: (context, index) {
                           return AnimationConfiguration.staggeredList(
                             position: index,
                             duration: const Duration(milliseconds: 700),
                             child: SlideAnimation(
                               verticalOffset: 50.0,
                               child: FadeInAnimation(
                                 child: InkWell(
                                   onTap: () {
                                      Get.toNamed(Routes.eventDetailView,arguments:controller.eventList[index].toJson());
                                   },
                                   child: Container(
                                     decoration: BoxDecoration(
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(10),
                                       border:
                                       Border.all(width: 2, color: Colors.white),
                                     ),
                                     child: Stack(
                                       alignment: Alignment.bottomLeft,
                                       children: [
                                         SizedBox(
                                             width: Get.width,
                                             height: MediaQuery.sizeOf(context).height/3.5,
                                             child: ClipRRect(
                                               borderRadius:
                                               BorderRadius.circular(10),
                                               child:controller.eventList[index].image!=null?
                                               ImageViewSquare(
                                                   image: controller
                                                       .eventList[index].image)
                                                   :Image.asset(
                                                 "assets/broken_image.png",
                                                 fit: BoxFit.cover,
                                               ),
                                             )),
                                         Container(
                                           width: Get.width,
                                           decoration: BoxDecoration(
                                               color: Colors.grey.withOpacity(0.6),
                                               borderRadius: BorderRadius.only(
                                                 bottomLeft: Radius.circular(10),
                                                 bottomRight: Radius.circular(10),
                                               )),
                                           child: Padding(
                                             padding: const EdgeInsets.all(8.0),
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Row(
                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                   crossAxisAlignment: CrossAxisAlignment.center,
                                                   children: [
                                                     Flexible(
                                                       child: Text(
                                                         controller.eventList[index].name ??
                                                             "",
                                                         style: TextStyle(
                                                             color: Colors.white,
                                                             fontSize: MediaQuery.of(context).size.width * 0.03),
                                                       ),
                                                     ),
                                                     Flexible(
                                                       child: Text(
                                                         '${controller.eventList[index].date!} ${controller.eventList[index].time!}',
                                                         style: TextStyle(
                                                             color: Colors.white,
                                                             fontSize: MediaQuery.of(context).size.width * 0.03),
                                                       ),
                                                     ),
                                                   ],
                                                 ),
                                                 SizedBox(
                                                   height: 10,
                                                 ),
                                                 AppText(
                                                   text: controller.eventList[index].description ?? "",
                                                   maxlines: 2,
                                                     textSize: MediaQuery.of(context).size.width * 0.03,
                                                     fontWeight: FontWeight.w500
                                                 ),
                                               ],
                                             ),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           );
                         }, separatorBuilder: (BuildContext context, int index) {
                         return SizedBox(
                           height: 20,
                         );

                       },) : Expanded(
                     child: Center(
                         child:  const Text(
                           "No Events available",
                           style: TextStyle(color: Colors.white, fontSize: 16),
                         )),
                   ),
                   ),
               ],
             ),
           ],
         ),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
       floatingActionButton: FloatingActionButton(
         backgroundColor: AppColors.appColor,
         foregroundColor: Colors.white,
         onPressed: () async{
          var res=await Get.toNamed(Routes.eventView);
          if(res){
            controller.getEventList();
          }
         },
         child: Icon(Icons.add),
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


