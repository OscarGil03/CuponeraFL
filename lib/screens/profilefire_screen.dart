import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuponera_fl/themes/themes.dart';

class ProfileFireScreen extends StatefulWidget {
  const ProfileFireScreen({Key? key}) : super(key: key);

  @override
  State<ProfileFireScreen> createState() => _ProfileFireScreenState();
}

class _ProfileFireScreenState extends State<ProfileFireScreen> {
  static final user = FirebaseAuth.instance.currentUser!;

  // Document IDS
  List<String> docIDs = [];

  // Get Document IDS
  Future getDocIds() async {
    await FirebaseFirestore.instance
        .collection('usuarios')
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              print(document.reference);
              docIDs.add(document.reference.id);
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Fire'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Inicio Sesion como: ${user.email}',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.accept,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              /*Nota placosona: Si metes un ListView dentro de un Widget Column
              dara un error, esto se debe a que Column abarca todo el espacio de la
              pantalla y le asigna a cada hijo una parte de dicho espacio,
              el problema surge debido a que ListView predeterminadamente tambien
              utiliza todo el espacio de la pantalla, por lo que el error es debido a 
              que el espacio que este ultimo puede utilizar no se especifica, por
              eso en el codigo de abajo el ListView se encuenta dentro de un Expanded
              
              Expanded utiliza todo el espacio restante disponible y se lo asigna
              al Widget que le demos.
              
              Tambien se podria usar SizedBox si quisieramos que que abarque un espacio
              más especifico*/
              Expanded(
                child: FutureBuilder(
                  future: getDocIds(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: docIDs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor: Colors.grey[100],
                            title: GetUserName(documentId: docIDs[index]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
