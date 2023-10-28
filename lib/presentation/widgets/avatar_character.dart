import 'package:flutter/material.dart';
import 'package:rick_morty_doubelv/characters/domain/entities/characters_response.dart';

class AvatarCharacter extends StatelessWidget {
  const AvatarCharacter({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id,
      child: ClipOval(
          child: Image.network(
        character.image,
        width: 250,
        height: 250,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Image.asset(
            "assets/images/loading.gif",
            height: 200,
            width: 200,
          );
        },
      )),
      flightShuttleBuilder: (BuildContext flightContext,
          Animation<double> animation,
          HeroFlightDirection flightDirection,
          BuildContext fromHeroContext,
          BuildContext toHeroContext) {
        return AnimatedBuilder(
          animation: animation,
          builder: (context, child) {
            final scale = animation.value;
            return Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/images/portal.png",
                ),
                Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(50)),
                    child: Transform.scale(scale: scale + 0.3, child: child!)),
              ],
            );
          },
          child: ClipOval(
            child: Image.network(
              character.image,
            ),
          ),
        );
      },
    );
  }
}
