import 'package:flutter/material.dart';

class EventModel {
  String? name;
  String? date;
  String? time;
  String? hour;
  String? min;
  String? image;
  String? uid;
  String? description;

  EventModel({
     this.name,
     this.date,
     this.hour,
     this.min,
     this.time,
     this.image,
     this.uid,
     this.description,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    date = json['date'];
    hour = json['hour'];
    min = json['min'];
    time = json['time'];
    image = json['image'];
    uid = json['uid'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    void writeNotNull(String key, dynamic value) {
      if (value != null && value.toString().isNotEmpty) {
        data[key] = value;
      }
    }
    writeNotNull("name", name);
    writeNotNull("date", date);
    writeNotNull("min", min);
    writeNotNull("hour", hour);
    writeNotNull("time", time);
    writeNotNull("image", image);
    writeNotNull("description", description);
    writeNotNull("uid", uid);
    return data;



  }

}
