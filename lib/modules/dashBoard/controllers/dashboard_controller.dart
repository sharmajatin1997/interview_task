import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/firebase_services/firestore.dart';
import 'package:interview_task/models/eventModel.dart';
import 'package:interview_task/models/userModel.dart';


class DashboardController extends GetxController {

  final auth = Get.find<AuthService>();
  final firebase = Get.find<FirebaseFire>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  Rxn<UserModel> model=Rxn();
  RxList<EventModel> eventList = RxList();
  var isLoadingData = false.obs;
  var isLoading = false.obs;

  Future getData(String uid)async{
    isLoadingData.value=true;
    var res=await firebase.getUserById(uid);
    if(res?.uid!=null){
      model.value=res!;
      model.refresh();
      name.text=model.value?.name??'';
      email.text=model.value?.email??'';
    }
  }

  Future getEventList()async{
    isLoading.value=true;
    var res=await firebase.getAllEvents();
    if(res!.isNotEmpty){
      isLoading.value=false;
      eventList.value=res!;
    }else{
      isLoading.value=false;
    }
  }

}
