import 'package:flutter/material.dart';
import 'package:cuponera_fl/screens/screens.dart';
import 'package:cuponera_fl/models/models.dart';

class AppRoutes{

  static const initialRoute = 'start';

  static final routeOptions = <RouteOption>[
    RouteOption(route: 'home', icon: Icons.home, name: 'Pantalla de Home', screen: const HomeScreen()),
    RouteOption(route: 'login', icon: Icons.home, name: 'Pantalla de Login', screen: const LoginScreen()),
    RouteOption(route: 'login_2', icon: Icons.home, name: 'Pantalla de Login 2', screen: LoginScreen2()),
    RouteOption(route: 'start', icon: Icons.play_arrow_outlined, name: 'Pantalla de Inicio', screen: const StartScreen()),
    RouteOption(route: 'profile', icon: Icons.play_arrow_outlined, name: 'Pantalla de Perfil', screen: const ProfileScreen()),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    
    appRoutes.addAll({'home' : (context) => const HomeScreen()});

    for (final option in routeOptions) {
      /* La cosa de abajo hace para cada dato del Map lo sig:
      { 'nombre_ruta' : Widget Funcion con Build context } 
      */
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }
  
}