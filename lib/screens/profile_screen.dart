import 'package:flutter/material.dart';
import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:cuponera_fl/themes/themes.dart';


class ProfileScreen extends StatelessWidget {
   
  const ProfileScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              //Tarjeta de Perfil
              CustomProfileCard(),

              //Divisor de las tarjetas

              //Inputs de edicion

              //Botones para guardar o cancelar (Puede ser alerta)
            ],
          ),
        ),
      ),
    );
  }
}