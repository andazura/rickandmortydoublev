import 'package:flutter/material.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';

class NotFound extends StatelessWidget {
  const NotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset("assets/images/portal.png"),
          Text(
            "no information was found in this dimension",
            style: rickTextStyle45.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
