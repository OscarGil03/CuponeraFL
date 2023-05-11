import 'package:cuponera_fl/routes/routes.dart';
import 'package:cuponera_fl/themes/themes.dart';
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

            DrawerHeader(child: Image(image: AssetImage('assets/saxevil-logo.png'))),
            CustomDrawerOption(optionIcon: Icons.person, optionName: 'Perfil',),
            CustomDrawerOption(optionIcon: Icons.add_business_rounded, optionName: 'Negocios',),
            CustomDrawerOption(optionIcon: Icons.local_attraction_sharp, optionName: 'Cupones',),
            CustomDrawerOption(optionIcon: Icons.save_as, optionName: 'Cupones Guardados',),
            CustomDrawerOption(optionIcon: Icons.nightlight, optionName: 'Temas',),
            CustomDrawerOption(optionIcon: Icons.settings, optionName: 'Configuracion',),
            CustomDrawerOption(optionIcon: Icons.close_outlined, optionName: 'Cerrar Sesion',),
          ],
        )
      ),
    );
  }
}

class CustomDrawerOption extends StatelessWidget {
  
  final String optionName;
  final IconData optionIcon;
  
  const CustomDrawerOption({
    super.key, 
    required this.optionName, 
    required this.optionIcon, 
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(optionName),
      trailing: Icon(optionIcon),
      onTap: (){},
    );
  }
}