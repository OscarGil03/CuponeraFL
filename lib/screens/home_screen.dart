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

  //Metodo para refrescar la pantalla
  Future<void> refreshScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    //Probablemente existan mejores manera de hacerlo pero lo que hace este metodo es volver a dibujar
    //la pantalla
    setState(() {});
  }

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
      body: RefreshIndicator(
        color: AppTheme.terciary,
        onRefresh: () => refreshScreen(),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: getNegocio(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data?[index]['name'];
                        String desc = snapshot.data?[index]['desc'];
                        String imageUrl = snapshot.data?[index]['imageUrl'];
                        return Container(
                          margin: const EdgeInsets.only(top: 15),
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomCardTipo2(
                            name: name,
                            desc: desc,
                            imageUrl: imageUrl,
                            screen: NegocioScreen(
                              negName: snapshot.data?[index]['name'],
                              negDesc: snapshot.data?[index]['desc'],
                              negImg: snapshot.data?[index]['imageUrl'],
                            ),
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
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => NegocioScreen(hola: 'Hola buena'),
            //           ));
            //     },
            //     child: const Text('picale'))
          ],
        ),
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
