import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/firebase_services/firestore.dart';
import 'package:interview_task/modules/event/controllers/event_controller.dart';

class EventBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EventController>(() => EventController());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<FirebaseFire>(() => FirebaseFire());
  }
}