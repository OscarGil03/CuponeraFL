import 'package:flutter/material.dart';
import 'package:cuponera_fl/screens/screens.dart';
import 'package:cuponera_fl/models/models.dart';

class AppRoutes {
  static const initialRoute = 'start';

  static final routeOptions = <RouteOption>[
    RouteOption(
        route: 'home',
        icon: Icons.home,
        name: 'Pantalla de Home',
        screen: const HomeScreen()),
    RouteOption(
        route: 'loginfire',
        icon: Icons.home,
        name: 'Pantalla de LoginFire',
        screen: const LoginFireScreen()),
    RouteOption(
        route: 'registerfire',
        icon: Icons.home,
        name: 'Pantalla de RegisterFire',
        screen: const RegisterFireScreen()),
    RouteOption(
        route: 'check',
        icon: Icons.play_arrow_outlined,
        name: 'Check Login',
        screen: const CheckScreen()),
    RouteOption(
        route: 'start',
        icon: Icons.play_arrow_outlined,
        name: 'Pantalla de Inicio',
        screen: const StartScreen()),
    RouteOption(
        route: 'profile',
        icon: Icons.play_arrow_outlined,
        name: 'Pantalla de Perfil',
        screen: const ProfileScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    appRoutes.addAll({'home': (context) => const HomeScreen()});

    for (final option in routeOptions) {
      /* La cosa de abajo hace para cada dato del Map lo sig:
      { 'nombre_ruta' : Widget Funcion con Build context } 
      */
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
}
