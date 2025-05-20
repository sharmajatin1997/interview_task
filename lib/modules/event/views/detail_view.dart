import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/animations/staggered_list_animation.dart';
import 'package:interview_task/helper/app_helpers/app_buttons.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
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
                            size: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        AppText(
                          text: 'Event Detail',
                          textSize: 14.0,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                                text: 'Event Name:- ',
                                textSize: 14.0,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                                text: args['name'],
                                textSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            AppText(
                                text: 'Event Date & Time:- ',
                                textSize: 14.0,
                                fontWeight: FontWeight.w500),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                                text: args['date']+' at '+args['time'],
                                textSize: 14.0,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text: "Description",
                            textSize: 14.0,
                            fontWeight: FontWeight.w500),
                        SizedBox(
                          height: 10,
                        ),
                        AppText(
                            text: args['description'],
                            textSize: 14.0,
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
