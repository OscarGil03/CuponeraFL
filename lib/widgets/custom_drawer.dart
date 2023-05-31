import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuponera_fl/routes/routes.dart';
import 'package:cuponera_fl/themes/themes.dart';
import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    required this.size,
  });

  final Size size;
  //Instacia actual de FirebaseAuth
  final currentUser = FirebaseAuth.instance.currentUser!;
  //Coleccion de datos a usar en firestore
  final userCollection = FirebaseFirestore.instance.collection('usuarios');

  @override
  Widget build(BuildContext context) {
    // final routeOptions = AppRoutes.routeOptions;

    Future signOut() async {
      await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: AppTheme.secondary,
          title: const Text('Cerrar sesion'),
          actions: [
            //Opcion de cancelar
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancelar',
                  style: TextStyle(color: AppTheme.decline),
                )),
            //Opcion de aceptar
            TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await FirebaseAuth.instance.signOut();
                },
                child: Text(
                  'Aceptar',
                  style: TextStyle(color: AppTheme.accept),
                ))
          ],
        ),
      );
    }

    return SafeArea(
      child: Drawer(
          backgroundColor: AppTheme.secondary,
          width: size.width * 0.65,
          child: ListView(
            children: [
              const DrawerHeader(
                child: Image(
                  image: AssetImage('assets/saxevil-logo.png'),
                ),
              ),
              DrawerOption(
                optionIcon: Icons.person,
                optionName: 'Perfil',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, 'profile');
                },
              ),
              DrawerOption(
                optionIcon: Icons.logout_outlined,
                optionName: 'Cerrar Sesion',
                onTap: () {
                  signOut();
                },
              ),
            ],
          )),
    );
  }
}
