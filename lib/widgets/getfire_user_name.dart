import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuponera_fl/themes/themes.dart';

class GetUserName extends StatelessWidget {
  final String documentId;

  const GetUserName({
    Key? key,
    required this.documentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Llamar a la coleccion de la BD
    CollectionReference users =
        FirebaseFirestore.instance.collection('usuarios');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Center(
            child: Column(
              children: [
                Text('Nombre de usuario: ${data['nombres']}'),
                Text('Apellidos de Usuario: ${data['apellidos']}'),
              ],
            ),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: AppTheme.terciary,
          ));
        }
      },
    );
  }
}
