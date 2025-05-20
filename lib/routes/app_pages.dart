import 'package:get/get.dart';
import 'package:interview_task/modules/authentication/bindings/auth_bindings.dart';
import 'package:interview_task/modules/authentication/views/login.dart';
import 'package:interview_task/modules/authentication/views/signup.dart';
import 'package:interview_task/modules/authentication/views/splash_view.dart';
import 'package:interview_task/modules/dashBoard/bindings/dashboard_bindings.dart';
import 'package:interview_task/modules/dashBoard/views/edit_profile_view.dart';
import 'package:interview_task/modules/dashBoard/views/home_view.dart';
import 'package:interview_task/modules/dashBoard/views/profile_view.dart';
import 'package:interview_task/modules/event/bindings/event_bindings.dart';
import 'package:interview_task/modules/event/views/detail_view.dart';
import 'package:interview_task/modules/event/views/edit_event_view.dart';
import 'package:interview_task/modules/event/views/event_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String initial = Routes.splash;

  static final routes = [
    GetPage(
        name: Routes.splash,
        page: () => const SplashView(),
        binding: AuthBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.signup,
        page: () => SignUpView(),
        binding: AuthBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.login,
        page: () =>  LoginView(),
        binding: AuthBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.dashboard,
        page: () =>  HomeView(),
        binding: DashboardBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.profileView,
        page: () =>  ProfileView(),
        binding: DashboardBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.editProfileView,
        page: () =>  EditProfileView(),
        binding: DashboardBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.eventView,
        page: () =>  EventView(),
        binding: EventBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.eventDetailView,
        page: () =>  EventDetailView(),
        binding: EventBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
    GetPage(
        name: Routes.editEventView,
        page: () =>  EditEventView(),
        binding: EventBinding(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 500)),
  ];
}
