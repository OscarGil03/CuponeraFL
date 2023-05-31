import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cuponera_fl/themes/themes.dart';

class LoginFireScreen extends StatefulWidget {
  const LoginFireScreen({Key? key}) : super(key: key);

  @override
  State<LoginFireScreen> createState() => _LoginFireScreenState();
}

class _LoginFireScreenState extends State<LoginFireScreen> {
  //Controladores para los campos de texto

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  //Metodo de inicio de sesion
  /*Esperaba a la instacia de FirebaseAuth y su metodo de inicion con correo y contraseña.
    Una vez se recibe respuesta, se le envian los controladores de los campos de correo y
    contraseña.
  */
  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _controllerEmail.text.trim(),
        password: _controllerPassword.text.trim(),
      );
    } on FirebaseAuthException catch (exception) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // content: Text(restartError.message.toString()),
            content: Text(exception.message.toString()),
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
        title: const Text('Prueba de Login Fire'),
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

                //Mensaje

                const SizedBox(height: 20),

                const Text(
                  'INICIA SESION',
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

                const SizedBox(height: 10),

                //Olvidaste tu contraseña?
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Olvidaste tu contraseña?',
                      style: TextStyle(color: AppTheme.primary, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'passfire');
                      },
                      child: Text('Restablecer contraseña',
                          style: TextStyle(
                              color: AppTheme.accept,
                              fontSize: 16,
                              decoration: TextDecoration.underline)),
                    )
                  ],
                ),
                const SizedBox(height: 10),
                //Boton enviar

                ElevatedButton(
                  onPressed: signIn,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    child: Text('Iniciar Sesion'),
                  ),
                ),

                //-------------------Temporal----------------------
                //O ingresa con...
                const SizedBox(height: 20),

                Text(
                  'O ingresa con',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.mail, size: 30)),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.facebook, size: 30)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
