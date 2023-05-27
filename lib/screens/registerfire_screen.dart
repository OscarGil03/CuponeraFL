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
  final TextEditingController _controllerPasswordConfirm =
      TextEditingController();
  //Utilizado en el metodo screenChange
  bool _screenHandler = false;

  //Cambia la pantalla una vez que la informacion de los campos es valida
  screenChange() {
    _screenHandler ? Navigator.popAndPushNamed(context, 'home') : null;
  }

  Future signUp() async {
    try {
      if (_controllerPassword.text == _controllerPasswordConfirm.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _controllerEmail.text.trim(),
          password: _controllerPassword.text.trim(),
        );
      } else {
        return print('Las contraseñas no son iguales');
      }
      /*Si la informacion de los campos es correcta la variable privdad _screenHandler se vuelve
      verdadera y se llama el metodo para cambiar pantalla*/
      _screenHandler = true;
      screenChange();
    } catch (signUpError) {
      if (signUpError is PlatformException) {
        if (signUpError.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
          print('El usuario ${_controllerEmail.text} ya existe');
        }
        if (signUpError.code == 'ERROR_WEAK_PASSWORD') {
          print('La contraseña es muy debil');
        }
        if (signUpError.code == 'ERROR_INVALID_EMAIL') {
          print('El usuario ${_controllerEmail.text} ya existe');
        }
      }
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
                //Input Correo

                TextField(
                  controller: _controllerEmail,
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Correo Electronico',
                  ),
                ),

                const SizedBox(height: 15),
                //Input Contraseña

                TextField(
                  controller: _controllerPassword,
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Contraseña',
                  ),
                ),

                const SizedBox(height: 20),

                //Input Contraseña

                TextField(
                  controller: _controllerPasswordConfirm,
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.name,
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Confirmar contraseña',
                  ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
