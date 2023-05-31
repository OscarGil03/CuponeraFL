import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:cuponera_fl/themes/themes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //Instacia actual de FirebaseAuth
  final currentUser = FirebaseAuth.instance.currentUser!;
  //Coleccion de datos a usar en firestore
  final userCollection = FirebaseFirestore.instance.collection('usuarios');
  //Metodo para editar campos

  Future<void> editarCampo(String field) async {
    String campoEditado = '';

    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.secondary,
        title: Text('Editar $field'),
        content: TextField(
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(hintText: 'Editar $field'),
          onChanged: (value) {
            campoEditado = value;
          },
        ),
        actions: [
          //Opcion de cancelar
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancelar',
                style: TextStyle(color: AppTheme.decline),
              )),
          //Opcion de aceptar
          TextButton(
              onPressed: () async {
                Navigator.of(context).pop(campoEditado);
                if (campoEditado.trim().isNotEmpty) {
                  await userCollection
                      .doc(currentUser.email)
                      .update({field: campoEditado});
                }
              },
              child: Text(
                'Aceptar',
                style: TextStyle(color: AppTheme.accept),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
        centerTitle: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('usuarios')
            .doc(currentUser.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userInfo = snapshot.data!.data() as Map<String, dynamic>;

            return ListView(
              children: [
                const SizedBox(
                  height: 20,
                ),
                // Imagen de perfil
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Center(
                        child: Wrap(
                          children: [
                            //Nombre del usuario
                            Center(
                              child: Text(
                                '${userInfo['nombres']}',
                                style: const TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),

                            //Imagen de usuario
                            Center(
                              child: CircleAvatar(
                                maxRadius: 30,
                                backgroundImage:
                                    NetworkImage('${userInfo['perfil']}'),
                              ),
                            ),

                            //Boton para editar
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                TextButton(
                                    onPressed: () => editarCampo('perfil'),
                                    child: Row(
                                      children: [
                                        Text(
                                          'Editar imagen',
                                          style: AppTheme.buttonTextAccept,
                                        ),
                                        Icon(
                                          Icons.mode_edit_outlined,
                                          color: AppTheme.primary,
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                //Correo electronico
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Correo electronico: ${currentUser.email}',
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),

                //Nombre de Usuario
                MyProfileCard(
                  nombreSeccion: 'Nombre de usuario',
                  textoSeccion: userInfo['nombres'],
                  onPressed: () => editarCampo('nombres'),
                ),
                const SizedBox(
                  height: 15,
                ),
                //Apellidos de usuario
                MyProfileCard(
                  nombreSeccion: 'Apellidos del usuario',
                  textoSeccion: userInfo['apellidos'],
                  onPressed: () => editarCampo('apellidos'),
                ),
                const SizedBox(
                  height: 15,
                ),
                //Edad
                MyProfileCard(
                  nombreSeccion: 'Edad del usuario',
                  textoSeccion: userInfo['edad'],
                  onPressed: () => editarCampo('edad'),
                ),
                const SizedBox(
                  height: 15,
                ),
                //Email del usuario
                MyProfileCard(
                  nombreSeccion: 'Email del usuario',
                  textoSeccion: userInfo['email'],
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error${snapshot.error}'),
            );
          }

          return Center(
              child: CircularProgressIndicator(
            color: AppTheme.terciary,
          ));
        },
      ),
    );
  }
}
