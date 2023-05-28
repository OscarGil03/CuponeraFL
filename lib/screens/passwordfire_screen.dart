import 'package:cuponera_fl/themes/themes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PasswordFireScreen extends StatefulWidget {
  const PasswordFireScreen({Key? key}) : super(key: key);

  @override
  State<PasswordFireScreen> createState() => _PasswordFireScreenState();
}

class _PasswordFireScreenState extends State<PasswordFireScreen> {
  final TextEditingController _controllerEmail = TextEditingController();

  Future restablecerPass(BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _controllerEmail.text.trim(),
      );
      //Comprueba que el widget asociado a este context
      //ya esta montado en el arbol
      if (context.mounted) {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                  'Correo enviado. Favor de revisar su bandeja de entrada'),
            );
          },
        );
      }
    } on FirebaseAuthException catch (restartError) {
      print(restartError);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // content: Text(restartError.message.toString()),
            content: Text(restartError.message.toString()),
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restablecer contraseña'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Texto para restablecer contraseña
                const Text(
                  'Introduzca su correo electronico y le enviaremos un correo para que restablezca su contraseña',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Campo que recibe el correo a donde se enviara el mensaje
                TextField(
                  controller: _controllerEmail,
                  cursorColor: AppTheme.primary,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    hintText: 'Correo Electronico',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Boton de enviar
                ElevatedButton(
                  onPressed: () {
                    restablecerPass(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    child: Text('Enviar correo'),
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
