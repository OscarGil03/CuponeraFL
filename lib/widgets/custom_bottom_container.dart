import 'package:flutter/material.dart';

import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:cuponera_fl/themes/themes.dart';

class CustomBottomContainer extends StatelessWidget {
  final String loginDestinationRoute;
  final String registerDestinationRoute;

  const CustomBottomContainer({
    super.key,
    required this.loginDestinationRoute,
    required this.registerDestinationRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.secondary,
          shape: BoxShape.rectangle,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            CustomElevatedButton(
              destinationRoute: loginDestinationRoute,
              text: 'Iniciar Sesion',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Aun no tienes cuenta?',
                  style: TextStyle(color: AppTheme.primary, fontSize: 20),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, registerDestinationRoute);
                    },
                    child: Text('Registrate',
                        style: TextStyle(
                            color: AppTheme.accept,
                            fontSize: 20,
                            decoration: TextDecoration.underline)))
              ],
            )
          ],
        ),
      ),
    );
  }
}
