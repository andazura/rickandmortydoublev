import 'package:go_router/go_router.dart';
import 'package:rick_morty_doubelv/presentation/screens/screens.dart';

final appRoutes = GoRouter(initialLocation: "/splash", routes: [
  GoRoute(
    path: "/splash",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/home",
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
      path: "/character",
      builder: (context, state) {
        return const CharacterDetailScreen();
      }),
  GoRoute(
      path: "/location_detail",
      builder: (context, state) => const LocationDetailScreen()),
  GoRoute(
      path: "/episode_detail",
      builder: (context, state) => const EpisodeDetailScreen())
]);
