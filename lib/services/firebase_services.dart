import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Para Obtener un documento de Firestore (Puede ser util para los cupones si no encontramos otra mnanera)
Future<List> getUser() async {
  List users = [];
  CollectionReference cru = db.collection('user');
  QuerySnapshot queryUser = await cru.get();

  queryUser.docs.forEach((documento) {
    users.add(documento.data());
  });

  return users;
}

//Para agregar usuarios (Habria que acomodar un poco y saldria bien)
//Para gestionar los documentos en Firestore tiene una similitud a JSON
Future<void> addUser(String email, String pass) async {
  await db.collection('user').add({'email': email, 'pass': pass, 'type': 1});
}
