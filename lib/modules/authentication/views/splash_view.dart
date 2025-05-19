import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 2), () {
    //   return Navigator.push(
    //     context,
    //     PageRouteBuilder(
    //       pageBuilder: (context, animation, secondaryAnimation) =>SharedPreferenceHelper().getUserToken()!=null &&  SharedPreferenceHelper().getUserId()!=null && SharedPreferenceHelper().getUserModel()?.bankDetails!=null?
    //       const AppBottomNavigation():const GetStartedView(),
    //       transitionDuration: const Duration(milliseconds: 600),
    //       transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //         return HolePageTransitionsBuilder().buildTransitions(
    //           MaterialPageRoute(
    //             builder: (context) =>SharedPreferenceHelper().getUserToken()!=null &&  SharedPreferenceHelper().getUserId()!=null && SharedPreferenceHelper().getUserModel()?.bankDetails!=null?
    //             const AppBottomNavigation():const GetStartedView(),
    //           ),
    //           context,
    //           animation,
    //           secondaryAnimation,
    //           child,
    //         );
    //       },
    //     ),
    //   );
    // });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // SizedBox(
          //     height: context.height,
          //     width: context.width,
          //     child: Image.asset(
          //       Assets.assetsSplash,
          //       fit: BoxFit.cover,
          //     )),

        ],
      ),
    );
  }
}

