import 'package:cuponera_fl/themes/themes.dart';
import 'package:flutter/material.dart';


class CustomCardTipo1 extends StatelessWidget {
  const CustomCardTipo1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.tiktok_outlined, color: AppTheme.primary,),
            title: const Text('Soy un titulo'),
            subtitle: const Text('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA'),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Cancelar'),
                ),
          
                TextButton(
                  onPressed: (){}, 
                  child: const Text('Aceptar')
                ),
                
              ]
            ),
          ),
        ],
      ),
    );
  }
}