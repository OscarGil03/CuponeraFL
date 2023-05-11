import 'package:cuponera_fl/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomProfileCard extends StatelessWidget {
  const CustomProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [

                // Nombre de Usuario
                const Text('Guerrero03', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                
                //Texto e Icono para editar cuenta
                Row(
                  children: [
                    TextButton(onPressed: (){},
                    child: 
                    Row(
                      children: [
                        Text('Editar Cuenta', style: AppTheme.buttonTextAccept,),
                        Icon(Icons.mode_edit_outlined, color: AppTheme.primary,),
                      ],
                    )
                    ),
                  ],
                ),
              ],
            ),
            
            //Imagen de usuario
            const CircleAvatar(
              maxRadius: 50,
              backgroundImage: NetworkImage('https://i.ibb.co/NshW15G/image.png'),
            ),
                    
          ],
        ),
      ),
    );
  }
}