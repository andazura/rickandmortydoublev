import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_doubelv/config/styles/colors.dart';
import 'package:rick_morty_doubelv/config/styles/font_styles.dart';
import 'package:rick_morty_doubelv/presentation/providers/episodes_provider.dart';
import 'package:rick_morty_doubelv/presentation/providers/locations_provider.dart';

class ButtonPrimary extends StatelessWidget {
  final void Function()? onpressParam;
  final String textButton;
  final bool isActive;
  final double? width;
  final EdgeInsetsGeometry? padding;
  final double? lineHeight;
  const ButtonPrimary(
      {super.key,
      this.onpressParam,
      required this.textButton,
      this.isActive = true,
      this.padding,
      this.lineHeight,
      this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: ElevatedButton(
          onPressed: isActive ? onpressParam : null,
          style: ButtonStyle(
              padding: MaterialStatePropertyAll(padding ??
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
              foregroundColor: const MaterialStatePropertyAll(colorBlue),
              elevation: const MaterialStatePropertyAll(0),
              minimumSize: const MaterialStatePropertyAll(Size(140, 40)),
              textStyle: const MaterialStatePropertyAll(rickTextStyle20),
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                return colorBlue;
              }),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
          child: Text(textButton,
              textAlign: TextAlign.center,
              style: rickTextStyle20.copyWith(
                  height: lineHeight,
                  color: isActive ? Colors.black : const Color(0XFF3F3E3E)))),
    );
  }
}

class GoToLocation extends StatelessWidget {
  final int id;
  const GoToLocation({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final locationsProvider =
              Provider.of<LocationsProvider>(context, listen: false);
          await locationsProvider.getOneLocation(id);
          await context.push("/location_detail");
        },
        icon: Image.asset(
          "assets/images/nave.png",
          width: 40,
        ));
  }
}

class GoToEpisode extends StatelessWidget {
  final int id;
  const GoToEpisode({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () async {
          final episodesProvider =
              Provider.of<EpisodesProvider>(context, listen: false);
          await episodesProvider.getOneepisode(id);
          context.push("/episode_detail");
        },
        icon: const Icon(
          Icons.play_arrow,
          color: colorGreen,
        ));
  }
}
