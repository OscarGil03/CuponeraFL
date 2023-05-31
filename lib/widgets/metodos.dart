import 'package:cuponera_fl/themes/themes.dart';
import 'package:flutter/material.dart';

//Metodo para hacer una alerta que al presionar el boton se cierra
Future<dynamic> customPopDialog(
    {required String mensaje,
    required String botonAccept,
    required BuildContext context}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              botonAccept,
              style: TextStyle(color: AppTheme.accept),
            ),
          ),
        ],
      );
    },
  );
}

//Metodo para hacer una alerta que al presionar el boton se cierra
Future<dynamic> customPopPushDialog(
    {required String mensaje,
    required String botonAccept,
    required BuildContext context,
    required String screen}) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        content: Text(mensaje),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(screen);
            },
            child: Text(
              botonAccept,
              style: TextStyle(color: AppTheme.accept),
            ),
          ),
        ],
      );
    },
  );
}
