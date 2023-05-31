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
  //Coleccion de datos a usar en firestore
  final userCollection = FirebaseFirestore.instance.collection('usuarios');

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        endDrawer: CustomDrawer(size: size),
        drawer: CustomDrawer(size: size),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pantalla de Home'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            const SizedBox(
              height: 10,
            ),
            //Texto ver la cuenta en la que se inicio sesion
            Center(
                child: Text(
              'Inicio sesion como: ${currentUser.email}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
            const SizedBox(
              height: 10,
            ),
            //Searchbar
            const Placeholder(
              color: Colors.green,
              fallbackHeight: 50,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Center(child: Text('Aca va la searchbar')),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //NEGOCIOS
            const CustomCardTipo2(
              name: 'Tacos "Polvo"',
              desc: 'Los mejores de todo Navojoa',
              imageUrl: 'https://i.ibb.co/pnHCRDV/tacos-polvo.jpg',
              screen: ProfileScreen(),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomCardTipo2(
              name: 'Tostadas "El Bryan"',
              desc: 'Estan tremendas',
              imageUrl: 'https://i.ibb.co/n00bmmF/image.png',
              screen: ProfileScreen(),
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomCardTipo2(
              name: 'Tortas Morbius',
              desc: 'It\'s Tortas Time!!!',
              imageUrl: 'https://i.ibb.co/KLHc2Yk/image.png',
              screen: ProfileScreen(),
            ),
            const SizedBox(
              height: 30,
            ),
            //Boton para añadir negocios
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  backgroundColor: AppTheme.terciary,
                  onPressed: () {},
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
