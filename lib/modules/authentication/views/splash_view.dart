import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_task/generated/assets.dart';
import 'package:interview_task/helper/utils_helper/get_storage.dart';
import 'package:interview_task/modules/authentication/views/login.dart';
import 'package:interview_task/modules/dashBoard/views/home_view.dart';


class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      return Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => SharedPreferenceHelper().getIsLoggedIn()?HomeView():LoginView(),
          transitionDuration: const Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return HolePageTransitionsBuilder().buildTransitions(
              MaterialPageRoute(
                builder: (context) => SharedPreferenceHelper().getIsLoggedIn()?HomeView():LoginView(),
              ),
              context,
              animation,
              secondaryAnimation,
              child,
            );
          },
        ),
      );
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
                height: 300,
                width: 400,
                child: Image.asset(
                  Assets.assetsSplash,
                )),
          ),

        ],
      ),
    );
  }
}

class HolePageTransitionsBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(PageRoute<T> route, BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ClipPath(
      clipper: _HoleClipper(animation),
      child: child,
    );
  }
}

class _HoleClipper extends CustomClipper<Path> {
  _HoleClipper(this.animation);

  final Animation<double> animation;
  late final curve = CurvedAnimation(
    parent: animation,
    curve: Curves.easeOut,
    reverseCurve: Curves.easeIn,
  );

  @override
  Path getClip(Size size) {
    final rightBottom = size.bottomRight(Offset.zero);
    final radius = lerpDouble(0, rightBottom.distance, curve.value)!;
    final oval = Rect.fromCircle(center: rightBottom, radius: radius);
    return Path()..addOval(oval);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}


