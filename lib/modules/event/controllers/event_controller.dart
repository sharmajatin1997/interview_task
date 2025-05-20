import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/firebase_services/firestore.dart';
import 'package:interview_task/helper/utils_helper/date_helper.dart';
import 'package:interview_task/models/eventModel.dart';
import 'package:interview_task/models/userModel.dart';

class EventController extends GetxController {

  final auth = Get.find<AuthService>();
  final firebase = Get.find<FirebaseFire>();

  TextEditingController name=TextEditingController();
  TextEditingController date=TextEditingController();
  TextEditingController time=TextEditingController();
  TextEditingController description=TextEditingController();
  DateTime? selectedDate;
  var hour=''.obs;
  var min=''.obs;
  TimeOfDay? selectedTime;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      date.text=DateHelper.getGoal(selectedDate!);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime) {
        selectedTime = picked;
        hour.value=selectedTime!.hour.toString();
        min.value=selectedTime!.minute.toString();
        time.text=formatTime(selectedTime!);
    }
  }
  var isLoadingData = false.obs;
  Rxn<EventModel> model=Rxn();

  Future getData(String uid)async{
    isLoadingData.value=true;
    var res=await firebase.getEventById(uid);
    if(res?.uid!=null){
      model.value=res!;
      model.refresh();
      name.text=model.value?.name??'';
      date.text=model.value?.date??'';
      time.text=model.value?.time??'';
      description.text=model.value?.description??'';
      hour.value=model.value?.hour??'';
      min.value=model.value?.min??'';
    }
    isLoadingData.value=false;
  }
  String formatTime(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(Get.context!);
  }
}
