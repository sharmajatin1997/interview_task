
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/helper/utils/utils.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/models/eventModel.dart';
import 'package:interview_task/models/userModel.dart';
import 'package:intl/intl.dart';

class FirebaseFire extends GetxController {
  Rxn<UserModel> userModel = Rxn();
  RxList<EventModel> eventList = RxList();
  RxList<EventModel> upcomingList = RxList();
  @override
  void onInit() {
    super.onInit();
  }

  final databaseUserPath = FirebaseFirestore.instance.collection('users');
  final databaseEventPath = FirebaseFirestore.instance.collection('events');

  void saveUser(UserModel model) async {
    if (await Utils.hasNetwork()) {
      final userId = databaseUserPath.doc(model.uid);
      Map<String, dynamic> user = model.toJson();
      await userId.set(user);
    }
  }

  void updateUserInfo(Map<String, dynamic> model) async {
    if (await Utils.hasNetwork()) {
      final userId = databaseUserPath.doc(model["uid"]);
      await userId.update(model);
      Get.back(result: true);
    }
  }


  Future<UserModel?> getUserById(uid) async {
    if (await Utils.hasNetwork()) {
      var response = await databaseUserPath.doc(uid).get();
      final data = response.data();
      if (data != null) {
        userModel.value = UserModel.fromJson(data);
        userModel.refresh();
        SharedPreferenceHelper().saveUserModel(userModel.value);
        return UserModel.fromJson(data);
      }else{
        return UserModel();
      }
    }else{
      return UserModel();
    }
  }


  void saveEvent(Map<String,dynamic> data) async {
    if (await Utils.hasNetwork()) {
      var uid=generateRandomString(15);
      final eventId = databaseEventPath.doc(SharedPreferenceHelper().getUserId()).collection('list').doc(uid);
      data['uid']=uid;
      await eventId.set(data);
     Get.back(result: true);
    }
  }

  String generateRandomString(int length) {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rand = Random.secure();
    return List.generate(length, (index) => chars[rand.nextInt(chars.length)]).join();
  }

  Future<List<EventModel>?> getAllEvents() async {
    if (await Utils.hasNetwork()) {
      QuerySnapshot querySnapshot = await databaseEventPath
          .doc(SharedPreferenceHelper().getUserId())
          .collection('list')
          .get();
      final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
      List<dynamic> list = allData;
      eventList.clear();
      upcomingList.clear();
      for (var element in list) {
        eventList.add(EventModel.fromJson(element as Map<String, dynamic>));
      }
      eventList.refresh();
      for(var data in eventList){
        String dateString = data.date!;
        DateFormat format = DateFormat("dd/MM/yyyy");
        DateTime parsedDate = format.parse(dateString);
        DateTime combinedDateTime = combineDateAndTime(parsedDate, parseTimeOfDay(int.parse(data.hour!),int.parse(data.min!)));
        DateTime now = DateTime.now();

        if (combinedDateTime.isBefore(now)) {
          print('The selected datetime is in the past');
        } else if (combinedDateTime.isAfter(now)) {
          print('The selected datetime is in the future');
          upcomingList.add(data);
        } else {
          print('The selected datetime is now');
        }

      }
      upcomingList.refresh();


      return upcomingList;
    }else{
      return upcomingList;
    }
  }

  DateTime combineDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  TimeOfDay parseTimeOfDay(int hour,int minute) {
    return TimeOfDay(hour: hour, minute: minute);
  }

}
