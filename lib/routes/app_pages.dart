import 'package:get/get.dart';
import 'package:interview_task/modules/authentication/bindings/auth_bindings.dart';
import 'package:interview_task/modules/authentication/views/splash_view.dart';


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
    // GetPage(
    //     name: Routes.signup,
    //     page: () => SignupView(),
    //     binding: AuthBinding(),
    //     transition: Transition.fadeIn,
    //     transitionDuration: const Duration(milliseconds: 500)),
    // GetPage(
    //     name: Routes.login,
    //     page: () =>  LoginView(),
    //     binding: AuthBinding(),
    //     transition: Transition.fadeIn,
    //     transitionDuration: const Duration(milliseconds: 500)),
  ];
}
