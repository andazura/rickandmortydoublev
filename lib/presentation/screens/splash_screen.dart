import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/presentation/widgets/custom_safe_area.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer navigationSplash;
  @override
  void initState() {
    navigationSplash = Timer(const Duration(milliseconds: 1600), () {
      context.pushReplacement("/home");
    });
    super.initState();
  }

  @override
  void dispose() {
    navigationSplash.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CustomSafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder(
              tween: Tween<double>(begin: size.width, end: 0),
              curve: Curves.easeInOutExpo,
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, child) {
                return Transform.translate(
                    offset: Offset(value, 0), child: child);
              },
              child: const Text("Rick y Morty", style: rickTextStyle45),
            ),
            const SizedBox(height: 45),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: -size.width, end: 0),
              curve: Curves.easeInOutExpo,
              duration: const Duration(milliseconds: 1500),
              builder: (context, value, child) {
                return Transform.translate(
                    offset: Offset(value, 0), child: child);
              },
              child: Image.asset(
                "assets/images/logo_splash.png",
                width: size.width,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
