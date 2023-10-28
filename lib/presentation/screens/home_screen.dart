import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rick_morty_doubelv/presentation/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _BottomNavigationModel(),
      child: const _Pages(),
    );
  }
}

class _Pages extends StatelessWidget {
  const _Pages();

  @override
  Widget build(BuildContext context) {
    final bottomModel = Provider.of<_BottomNavigationModel>(context);
    return Scaffold(
      body: PageView(
        controller: bottomModel.pageController,
        children: [
          const CharactersScreen(),
          const LocationsScreen(),
          EpisodesScreen()
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomModel = Provider.of<_BottomNavigationModel>(context);

    return BottomNavigationBar(
        currentIndex: bottomModel.paginaActual,
        onTap: (value) {
          bottomModel.paginaActual = value;
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.family_restroom), label: "Characters"),
          BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined), label: "Locations"),
          BottomNavigationBarItem(
              icon: Icon(Icons.live_tv_rounded), label: "Episodes"),
        ]);
  }
}

class _BottomNavigationModel extends ChangeNotifier {
  int _currentIndex = 0;

  int get paginaActual => _currentIndex;

  final PageController _pageController = PageController();

  set paginaActual(int valor) {
    _currentIndex = valor;
    notifyListeners();
    _pageController.animateToPage(valor,
        duration: const Duration(milliseconds: 250), curve: Curves.easeInCubic);
  }

  PageController get pageController => _pageController;
}
