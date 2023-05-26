/*Esta pagina solo sirve para comprobar si el usuario incio
sesion correctamente. Una vez se comprueba el inicio de sesion
se redirige al usuario a una de las 2 opciones:

1- La pagina de Home
2- La pagina de Login

*/

import 'package:cuponera_fl/screens/screens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check User'),
      ),
      body: StreamBuilder<User?>(
        builder: (context, snapshot) {
          //Podemos cambiarlo a operador ternario
          if (snapshot.hasData) {
            return const HomeScreen();
          } else {
            return const LoginFireScreen();
          }
        },
        stream: FirebaseAuth.instance.authStateChanges(),
      ),
    );
  }
}
