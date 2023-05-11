import 'package:flutter/material.dart';

import 'package:cuponera_fl/widgets/widgets.dart';

class StartScreen extends StatelessWidget {
   
  const StartScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        
        const FadeInImage(
        fit: BoxFit.cover,
        placeholder: AssetImage('assets/jar-loading.gif'), 
        image: AssetImage('assets/cuponera_start_image.png'),
        ),
        
        Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   title: const Text('Pantalla de Inicio'),
        // ),
        body: Center(
          child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children:const [
            CustomBottomContainer(destinationRoute: 'login'),
           ]
          ),
        ),
      ),
      ],
    );
  }
}

