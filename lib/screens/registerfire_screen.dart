import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuponera_fl/themes/app_theme.dart';

class RegisterFireScreen extends StatefulWidget {
  const RegisterFireScreen({Key? key}) : super(key: key);

  @override
  State<RegisterFireScreen> createState() => _RegisterFireScreenState();
}

class _RegisterFireScreenState extends State<RegisterFireScreen> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerPassC = TextEditingController();
  final TextEditingController _controllerNombre = TextEditingController();
  final TextEditingController _controllerApellido = TextEditingController();
  final TextEditingController _controllerEdad = TextEditingController();
  //Utilizado en el metodo screenChange
  bool _screenHandler = false;

  //Cambia la pantalla una vez que la informacion de los campos es valida
  screenChange() {
    _screenHandler ? Navigator.popAndPushNamed(context, 'home') : null;
  }

  Future signUp() async {
    try {
      if (_controllerPassword.text == _controllerPassC.text) {
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _controllerEmail.text.trim(),
          password: _controllerPassword.text.trim(),
        );

        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userCredential.user!.email)
            .set({
          'nombres': _controllerNombre.text.trim(),
          'apellidos': _controllerApellido.text.trim(),
          'email': _controllerEmail.text.trim(),
          'edad': _controllerEdad.text.trim(),
          'perfil':
              'https://img.freepik.com/iconos-gratis/usuario_318-159711.jpg',
        });
      } else {
        return showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Las contraseñas no son iguales'),
          ),
        );
      }
      //TODO: Cambiar esta webada para que sea como en el archivo PASSWORDFIRE.dart
      /*Si la informacion de los campos es correcta la variable privdad _screenHandler se vuelve
      verdadera y se llama el metodo para cambiar pantalla*/
      _screenHandler = true;
      screenChange();
    } on FirebaseAuthException catch (signUpError) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // content: Text(restartError.message.toString()),
            content: Text(signUpError.message.toString()),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prueba de Register Fire'),
      ),
      body: GestureDetector(
        /*Permite quitar el foco de los campos de texto al presionar en cualquier lugar
        de la pantalla*/
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: Column(
              children: [
                //Logo Saxevilito
                const CircleAvatar(
                  maxRadius: 80,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/saxevil-logo.png'),
                ),
                const SizedBox(height: 20),

                //Mensaje

                const Text(
                  'REGISTRATE',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),
                //Input Nombre

                CustomTextField(
                  hintText: 'Nombres',
                  textCapitalization: TextCapitalization.words,
                  controller: _controllerNombre,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //Input Apellido
                CustomTextField(
                  hintText: 'Apellidos',
                  textCapitalization: TextCapitalization.words,
                  controller: _controllerApellido,
                  keyboardType: TextInputType.name,
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //Input Edad
                CustomTextField(
                  hintText: 'Edad en años',
                  textCapitalization: TextCapitalization.none,
                  controller: _controllerEdad,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //Input Correo
                CustomTextField(
                  hintText: 'Correo Electronico',
                  textCapitalization: TextCapitalization.none,
                  controller: _controllerEmail,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                ),

                const SizedBox(height: 15),
                //Input Contraseña
                CustomTextField(
                  hintText: 'Contraseña',
                  textCapitalization: TextCapitalization.none,
                  controller: _controllerPassword,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                //Input Contraseña
                CustomTextField(
                  hintText: 'Confirmar contraseña',
                  textCapitalization: TextCapitalization.none,
                  controller: _controllerPassC,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                ),

                const SizedBox(height: 20),

                //Boton enviar registro de usuario

                ElevatedButton(
                  onPressed: () {
                    signUp();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    child: Text('Registrarse'),
                  ),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
