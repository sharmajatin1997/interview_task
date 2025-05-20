import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/animations/staggered_list_animation.dart';
import 'package:interview_task/helper/app_helpers/app_buttons.dart';
import 'package:interview_task/helper/app_helpers/app_text.dart';
import 'package:interview_task/helper/app_helpers/app_textfields.dart';
import 'package:interview_task/helper/colors/app_colors.dart';
import 'package:interview_task/helper/responsive.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/modules/dashBoard/controllers/dashboard_controller.dart';
import 'package:interview_task/modules/event/controllers/event_controller.dart';
import 'package:interview_task/modules/event/validator_case_event/event_case_validator.dart';
import 'package:interview_task/routes/app_pages.dart';

class EventView extends GetView<EventController> {
  EventView({super.key});
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       backgroundColor: Colors.black,
       body:Form(
         key: formKey,
         child: Padding(
           padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
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
                             onTap: (){
                               Get.back(result: true);
                             },
                               child: Icon(Icons.arrow_back_ios,size: Responsive.isMobile(context)? 24:30,color: Colors.white,)),
                           SizedBox(
                             width: 10,
                           ),
                           AppText(text: 'Add Event',
                               textSize: MediaQuery.of(context).size.width * 0.03,
                           fontWeight: FontWeight.w500),
                         ],
                       ),
                       SizedBox(
                         height: Responsive.isMobile(context)? 20:30,
                       ),
                       wrapChildren(children: [
                          AppText(
                           text: "Event Name",
                           textSize: MediaQuery.of(context).size.width * 0.03,
                           fontWeight: FontWeight.w500,
                         ),
                          SizedBox(height: Responsive.isMobile(context)? 10:20),
                         AppTextFields(
                           hintText: "e.g johndyer",
                           textSize: MediaQuery.of(context).size.width * 0.03,
                           textLimit: 50,
                           readOnly: false,
                           validator: (String? value) => EventCaseValidator.validatorEvent(value!, "name"),
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
                        SizedBox(height: Responsive.isMobile(context)? 20:30),
                       wrapChildren(children: [
                          AppText(
                           text: "Event Date",
                           textSize: MediaQuery.of(context).size.width * 0.03,
                           fontWeight: FontWeight.w500,
                         ),
                          SizedBox(height:Responsive.isMobile(context)? 10:20),
                         AppTextFields(
                           onTap: (){
                             controller.selectDate(context);
                           },
                           hintText: "e.g dd/mm/yyyy",
                           textLimit: 50,
                           textSize: MediaQuery.of(context).size.width * 0.03,
                           readOnly: true,
                           validator: (String? value) =>
                               EventCaseValidator.validatorEvent(value!, "date"),
                           prefixIcon: Padding(
                             padding: const EdgeInsets.all(19.0),
                             child: Icon(Icons.calendar_month,size: 24,color: Colors.black,)
                           ),
                           controller: controller.date,
                         )
                       ]),
                        SizedBox(height: Responsive.isMobile(context)? 20:30),
                       wrapChildren(children: [
                          AppText(
                           text: "Event Date",
                           textSize: MediaQuery.of(context).size.width * 0.03,
                           fontWeight: FontWeight.w500,
                         ),
                          SizedBox(height: Responsive.isMobile(context)? 10:20),
                         AppTextFields(
                           hintText: "e.g hh:mm",
                           onTap: (){
                             controller.selectTime(context);
                           },
                           textLimit: 50,
                           textSize: MediaQuery.of(context).size.width * 0.03,
                           readOnly: true,
                           validator: (String? value) =>
                               EventCaseValidator.validatorEvent(value!, "time"),
                           prefixIcon: Padding(
                               padding: const EdgeInsets.all(19.0),
                               child: Icon(Icons.alarm,size: 24,color: Colors.black,)
                           ),
                           controller: controller.time,
                         )
                       ]),
                        SizedBox(height: Responsive.isMobile(context)? 20:30),
                       wrapChildren(children: [
                          AppText(
                           text: "Event Description",
                           textSize: MediaQuery.of(context).size.width * 0.03,
                           fontWeight: FontWeight.w500,
                         ),
                          SizedBox(height:Responsive.isMobile(context)?  10:20),
                         AppTextFields(
                           hintText: "e.g event party",
                           textLimit: 200,
                           readOnly: false,
                           maxLines: 4,
                           textSize: MediaQuery.of(context).size.width * 0.03,
                           validator: (String? value) =>
                               EventCaseValidator.validatorEvent(value!, "description"),
                           controller: controller.description,
                         )
                       ]),
                        SizedBox(height: Responsive.isMobile(context)? 20:30),
                       AppButtons(
                         text: "Add Event",
                         textSize: MediaQuery.of(context).size.width * 0.03,
                         onTap: () async{
                           if (formKey.currentState!.validate()) {
                             var data={
                               'name':controller.name.text,
                               'date':controller.date.text,
                               'time':controller.time.text,
                               'hour':controller.hour.value,
                               'min':controller.min.value,
                               'description':controller.description.text,
                             };
                             controller.firebase.saveEvent(data);
                           }
                         },
                         padding:  EdgeInsets.symmetric(vertical: Responsive.isMobile(context)? 20:30),
                         borderRadius: 10,
                         margin: const EdgeInsets.only(top: 50, bottom: 15),
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


