import 'package:cuponera_fl/routes/routes.dart';
import 'package:cuponera_fl/themes/themes.dart';
import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final routeOptions = AppRoutes.routeOptions;

    return SafeArea(
      child: Drawer(
          backgroundColor: AppTheme.secondary,
          width: size.width * 0.65,
          child: ListView(
            children: const [
              DrawerHeader(
                  child: Image(image: AssetImage('assets/saxevil-logo.png'))),
              CustomDrawerOption(
                optionIcon: Icons.person,
                optionName: 'Perfil',
              ),
              CustomDrawerOption(
                optionIcon: Icons.logout_outlined,
                optionName: 'Cerrar Sesion',
              ),
            ],
          )),
    );
  }
}
