import 'package:flutter/material.dart';
import 'package:rick_morty_doubelv/config/styles/colors.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData().copyWith(
        appBarTheme: const AppBarTheme().copyWith(
          iconTheme: const IconThemeData(
            color: colorVerde,
          ),
        ),
        radioTheme: const RadioThemeData(
            fillColor: MaterialStatePropertyAll(colorBlue)),
        inputDecorationTheme: const InputDecorationTheme().copyWith(
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 1,
                color: colorGreen,
              )),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 1,
                color: colorGreen,
              )),
          focusedErrorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 2,
                color: colorRed,
              )),
          errorBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                width: 2,
                color: colorRed,
              )),
        ),
        cardTheme: const CardTheme(
            color: Colors.white, surfaceTintColor: Colors.white),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: CustomTransitionBuilder(),
        }),
        dividerColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(selectedItemColor: colorGreen),
        useMaterial3: true,
      );
}

class CustomTransitionBuilder extends PageTransitionsBuilder {
  const CustomTransitionBuilder();
  @override
  Widget buildTransitions<T>(
      PageRoute<T> route,
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    final tween =
        Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.ease));
    return ScaleTransition(scale: animation.drive(tween), child: child);
  }
}
