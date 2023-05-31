import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cuponera_fl/screens/screens.dart';
import 'package:cuponera_fl/themes/themes.dart';
import 'package:cuponera_fl/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //Instacia actual de FirebaseAuth
  final currentUser = FirebaseAuth.instance.currentUser!;
  //Varriable de firestores para usar con multiples conexiones
  FirebaseFirestore db = FirebaseFirestore.instance;
  //Coleccion de datos a usar en firestore para los usuarios
  final userCollection = FirebaseFirestore.instance.collection('usuarios');

  //TODO: MOVER controladores de negocios A UN ARCHIVO APARTE
  //Controladores para negocios
  final TextEditingController _nombreNegController = TextEditingController();
  final TextEditingController _descNegController = TextEditingController();
  final TextEditingController _imgNegController = TextEditingController();

  //Metodo para obtener los negocios de la BD en Firestore
  Future<List?> getNegocio() async {
    try {
      List negocios = [];
      CollectionReference referenceNegocios = db.collection('negocios');
      QuerySnapshot queryNeg = await referenceNegocios.get();

      for (var documento in queryNeg.docs) {
        negocios.add(documento.data());
      }

      return negocios;
    } catch (e) {
      print(e);
    }
    return null;
  }

  //Interfaz para añadir negocio
  //TODO: MOVER addNegocios A UN ARCHIVO APARTE
  //Metodo para añadir negocios a la BD en Firestore
  Future<void> addNegocio(String desc, String imageUrl, String name) async {
    try {
      await FirebaseFirestore.instance.collection('negocios').add({
        'desc': desc,
        'imageUrl': imageUrl,
        'name': name,
      });
    } on FirebaseException catch (e) {
      print(e);
    }
  }

  // Future addUserInfo(
  //     String nombre, String apellido, String email, int edad) async {
  //   try {
  //     await FirebaseFirestore.instance.collection('usuarios').add({
  //       'nombres': nombre,
  //       'apellidos': apellido,
  //       'edad': edad,
  //       'email': email,
  //     });
  //   } on FirebaseException catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      endDrawer: CustomDrawer(size: size),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 2),
          child: FloatingActionButton(
            backgroundColor: AppTheme.terciary,
            //TODO: Hacer un metodo reutilizable
            onPressed: () {
              Navigator.of(context).push(PageRouteBuilder(
                transitionDuration: const Duration(
                  milliseconds: 300,
                ),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    const AddNegocioScreen(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0, 1);
                  const end = Offset.zero;
                  const curve = Curves.easeInToLinear;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ));
            },
            child: Icon(
              Icons.add,
              color: AppTheme.secondary,
            ),
          ),
        )
      ],

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pantalla de Home'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getNegocio(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(top: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomCardTipo2(
                          name: snapshot.data?[index]['name'],
                          desc: snapshot.data?[index]['desc'],
                          imageUrl: snapshot.data?[index]['imageUrl'],
                          screen: ProfileScreen(),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.terciary,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      // body: ListView(
      //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      //   children: [
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     //Texto ver la cuenta en la que se inicio sesion
      //     Center(
      //         child: Text(
      //       'Inicio sesion como: ${currentUser.email}',
      //       style: const TextStyle(
      //         fontSize: 14,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     )),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     //Searchbar
      //     const Placeholder(
      //       color: Colors.green,
      //       fallbackHeight: 50,
      //       child: Padding(
      //         padding: EdgeInsets.all(5.0),
      //         child: Center(child: Text('Aca va la searchbar')),
      //       ),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     //NEGOCIOS
      //     const CustomCardTipo2(
      //       name: 'Tacos "Polvo"',
      //       desc: 'Los mejores de todo Navojoa',
      //       imageUrl: 'https://i.ibb.co/pnHCRDV/tacos-polvo.jpg',
      //       screen: ProfileScreen(),
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     const CustomCardTipo2(
      //       name: 'Tostadas "El Bryan"',
      //       desc: 'Estan tremendas',
      //       imageUrl: 'https://i.ibb.co/n00bmmF/image.png',
      //       screen: ProfileScreen(),
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     const CustomCardTipo2(
      //       name: 'Tortas Morbius',
      //       desc: 'It\'s Tortas Time!!!',
      //       imageUrl: 'https://i.ibb.co/KLHc2Yk/image.png',
      //       screen: ProfileScreen(),
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //     //Boton para añadir negocios
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.end,
      //       children: [
      //         FloatingActionButton(
      //           backgroundColor: AppTheme.terciary,
      //           onPressed: () {},
      //           child: const Icon(
      //             Icons.add,
      //           ),
      //         ),
      //       ],
      //     ),
      //     const SizedBox(
      //       height: 30,
      //     ),
      //   ],
      // ),
    );
  }
}
