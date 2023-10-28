import 'package:flutter/material.dart';
import 'package:rick_morty_doubelv/config/styles/colors.dart';

Stream<String> getLoadingMessages() {
  const messages = <String>[
    "Obteniendo Info de otras dimensiones",
    "Cargando inventos",
    "Wubba Lubba Dub Dub.",
    'Ya mero...'
  ];

  return Stream.periodic(const Duration(milliseconds: 500), (step) {
    return messages[step];
  }).take(messages.length);
}

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getLoadingMessages(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return const Column(
            children: [
              CircularProgressIndicator(
                color: colorGreen,
              ),
              SizedBox(height: 5),
              Text("Cargando..."),
            ],
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              color: colorGreen,
            ),
            const SizedBox(height: 5),
            TweenAnimationBuilder(
              key: Key(snapshot.data),
              curve: Curves.easeInOut,
              tween: Tween<double>(begin: 1, end: 0),
              duration: const Duration(milliseconds: 500),
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: Transform.translate(
                      offset: Offset(0, value), child: Text(snapshot.data!)),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
