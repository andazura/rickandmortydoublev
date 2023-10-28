import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty_doubelv/config/app_router/app_routes.dart';
import 'package:rick_morty_doubelv/config/app_theme/app_theme.dart';
import 'package:rick_morty_doubelv/presentation/providers/providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CharactersProvider(),
        ),
        ChangeNotifierProvider(create: (context) => LocationsProvider()),
        ChangeNotifierProvider(create: (context) => EpisodesProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),
      ],
      child: MaterialApp.router(
        title: 'Rick and Morty',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        routerConfig: appRoutes,
      ),
    );
  }
}
