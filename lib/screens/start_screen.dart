import 'package:flutter/material.dart';

import 'package:cuponera_fl/widgets/widgets.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   title: const Text('Pantalla de Inicio'),
      // ),
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: const Center(
          child: Stack(
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: AssetImage('assets/cuponera_start_image.png'),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomBottomContainer(destinationRoute: 'check'),
                ],
              )
            ],
          ),
          // child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          //   CustomBottomContainer(destinationRoute: 'login'),
          // ]),
        ),
      ),
    );
  }
}
