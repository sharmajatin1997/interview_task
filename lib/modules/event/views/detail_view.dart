import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/animations/staggered_list_animation.dart';
import 'package:interview_task/helper/app_helpers/app_buttons.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
import 'package:interview_task/helper/responsive.dart';
import 'package:interview_task/helper/shimmer/shimmer_box.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/modules/dashBoard/controllers/dashboard_controller.dart';
import 'package:interview_task/modules/event/controllers/event_controller.dart';
import 'package:interview_task/routes/app_pages.dart';

class EventDetailView extends GetView<EventController> {
  EventDetailView({super.key});

  late Map<String, dynamic> args;

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null) {
      args = Get.arguments;
    } else {
      args = {};
    }
    controller.getData(args['uid']);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
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
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: Responsive.isMobile(context)?24:30,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 10),
                          AppText(
                            text: 'Event Detail',
                            textSize: MediaQuery.of(context).size.width * 0.03,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      wrapChildren(
                        children: [
                          SizedBox(
                            width: Get.width,
                            height: MediaQuery.sizeOf(context).height / 3.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/broken_image.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          controller.isLoadingData.value?
                          ShimmerBox(height: 20): Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                  text: 'Event Name:- ',
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
                            height: 10,
                          ),
                          controller.isLoadingData.value?
                          ShimmerBox(height: 20):Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                  text: 'Event Date:- ',
                                  textSize: MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                width: 10,
                              ),
                              AppText(
                                  text: controller.model.value?.date??'',
                                  textSize: MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          controller.isLoadingData.value?
                          ShimmerBox(height: 20):Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                  text: 'Event Time:- ',
                                  textSize: MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.w500),
                              SizedBox(
                                width: 10,
                              ),
                              AppText(
                                  text: controller.model.value?.time??'',
                                  textSize: MediaQuery.of(context).size.width * 0.03,
                                  fontWeight: FontWeight.w500),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AppText(
                              text: "Description",
                              textSize: MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w500),
                          SizedBox(
                            height: 10,
                          ),
                          controller.isLoadingData.value?
                          Column(
                            children: [
                              ShimmerBox(height: 15),
                              SizedBox(
                                height: 10,
                              ),
                              ShimmerBox(height: 15),
                              SizedBox(
                                height: 10,
                              ),
                              ShimmerBox(height: 15),
                            ],
                          ):AppText(
                              text: controller.model.value?.description??'',
                              textSize: MediaQuery.of(context).size.width * 0.03,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ],
                  ),
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
