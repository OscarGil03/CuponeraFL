import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cuponera_fl/themes/themes.dart';

class LoginScreen2 extends StatelessWidget {
  
  LoginScreen2({Key? key}) : super(key: key);

  //Controladores de los inputs
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Metodo de registro

  void signIn(){

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                //Logo de Saxevilito
                  
                const Image(
                  image: AssetImage('assets/saxevil-logo.png'),
                  width: 180,
                  height: 180,
                ),      

                const SizedBox(height: 30),      

                //Texto: Inicia Sesion

                Text('Inicia Sesion', 
                style: TextStyle(
                  color: AppTheme.primary, 
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),
                  
                //TextField Correo

                CustomTextField(controller: emailController, hintText: 'Correo electronico', obscureText: false,),
                const SizedBox(height: 30),      
                //TextField Contraseña

                CustomTextField(controller: passwordController, hintText: 'Contraseña', obscureText: true,),
                const SizedBox(height: 10),
                  
                //Olvidaste tu contraseña?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Olvidaste tu contraseña?',
                        style: TextStyle( color: AppTheme.primary),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 25),

                //Boton de ingresar
                CustomButton(onTap: signIn,),
                const CustomElevatedButton(destinationRoute: 'home', text: 'Iniciar sesion')

                //Texto: o, ingresa con
                
                //Logos de Google y FB
                  
                //Aun no te haz registrado?
              ],
            ),
          ),
        ),
      ),
    );
  }
}