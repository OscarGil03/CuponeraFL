import 'package:cuponera_fl/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:cuponera_fl/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Los controladores para saber que texto hay en los campos
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    /*final Map<String, String> formValues = {
      'correo': '',
      'contraseña': '',
    };*/

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      /* Esta webada es necesaria para cuando se abra
      el teclado permita hacer scroll */
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Form(
              key: myFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: CircleAvatar(
                      maxRadius: 80,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/saxevil-logo.png'),
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'INICIA SESION',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 40),
                  //Espacio de correo
                  TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese Email',
                    ),
                  ),
                  /*CustomInputField(
                      prefixIcon: Icons.mail,
                      formProperty: 'correo',
                      formValues: formValues,
                      textCapitalization: TextCapitalization.none,
                      hintText: 'Correo Electronico',
                      labelText: 'Introduzca su Correo Electronico',
                      helperText: 'Letra y simbolos',
                      keyboardType: TextInputType.emailAddress),*/
                  //Espacio de Contraseña
                  const SizedBox(height: 30),
                  TextField(
                    controller: passController,
                    decoration: const InputDecoration(
                      hintText: 'Ingrese Contraseña',
                    ),
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                  ),
                  /*CustomInputField(
                      prefixIcon: Icons.lock_outline_rounded,
                      formProperty: 'contraseña',
                      formValues: formValues,
                      textCapitalization: TextCapitalization.none,
                      hintText: 'Contraseña',
                      labelText: 'Introduzca su contraseña',
                      helperText: 'Letra y simbolos',
                      obscureText: true,
                      keyboardType: TextInputType.name),
*/
                  const SizedBox(height: 30),

                  //Texto para los iconos
                  const Text(
                    'o',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'Ingresa con',
                    style: TextStyle(fontSize: 20),
                  ),

                  const SizedBox(height: 30),

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
                  const SizedBox(height: 50),
                  //Boton Iniciar Sesion
                  ElevatedButton(
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (!myFormKey.currentState!.validate()) {
                          print('Formulario no valido');
                          return;
                        } else {
                          await addUser(
                                  emailController.text, passController.text)
                              .then((_) => {
                                    Navigator.pushReplacementNamed(
                                        context, 'home')
                                  });
                        }
                        /*print(formValues);
                        print('Formulario valido, navegando a inicio');
                        Navigator.pushReplacementNamed(context, 'home');*/
                      },
                      child: const SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Center(child: Text('Iniciar Sesion')),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
