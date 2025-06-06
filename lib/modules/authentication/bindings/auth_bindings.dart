import 'package:get/get.dart';
import 'package:interview_task/firebase_services/auth_service.dart';
import 'package:interview_task/firebase_services/firestore.dart';
import 'package:interview_task/modules/authentication/controllers/auth_controller.dart';
import 'package:interview_task/modules/dashBoard/controllers/dashboard_controller.dart';
import 'package:interview_task/modules/event/controllers/event_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<EventController>(() => EventController());
    Get.lazyPut<AuthService>(() => AuthService());
    Get.lazyPut<FirebaseFire>(() => FirebaseFire());
  }
}