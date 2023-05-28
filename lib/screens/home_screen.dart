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
  final user = FirebaseAuth.instance.currentUser!;

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        drawer: CustomDrawer(size: size),
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Pantalla de Home'),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: GestureDetector(
                //Metodo de navegacion con animacion personalizada
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    transitionDuration: const Duration(
                      milliseconds: 300,
                    ),
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const ProfileFireScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1, 0);
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
                child: CircleAvatar(
                  maxRadius: 25,
                  backgroundColor: AppTheme.primary,
                  backgroundImage:
                      const NetworkImage('https://i.ibb.co/NshW15G/image.png'),
                ),
              ),
            )
          ],
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
              'Inicio sesion como: ${user.email}',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            )),
            //------------------------------------------------
            //Boton para cerrar la sesion
            Center(
                child: ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.popAndPushNamed(context, 'start');
              },
              child: const Text('Cierrame la sesion'),
            )),
            //------------------------------------------------
            const SizedBox(
              height: 10,
            ),
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
          ],
        ));
  }
}
