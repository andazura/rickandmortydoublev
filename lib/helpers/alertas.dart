import 'dart:ui';

import 'package:flutter/material.dart';

Future<dynamic> fadeInRigthTransition(BuildContext context, Widget widget,
    {bool barrierDismissible = false}) async {
  return showGeneralDialog(
    context: context,
    barrierLabel: "Barrier",
    barrierDismissible: barrierDismissible,
    barrierColor: const Color.fromRGBO(0, 175, 170, 0.6),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (_, __, ___) {
      return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2), child: widget);
    },
    transitionBuilder: (_, anim, __, child) {
      Tween<Offset> tween;
      if (anim.status == AnimationStatus.reverse) {
        tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
      } else {
        tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
      }

      return SlideTransition(
        position: tween.animate(anim),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
  );
}
