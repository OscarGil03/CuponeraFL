import 'package:flutter/material.dart';
import 'package:cuponera_fl/screens/screens.dart';
import 'package:cuponera_fl/themes/themes.dart';
import 'package:cuponera_fl/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  final List<String> options = const['Jak and Daxter', 'Minecraft', 'Dark Souls', 'The Legend of Zelda', 'Call of Duty'];

  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return Scaffold(
      drawer: CustomDrawer(size: size),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pantalla de Home'),
        // leading: Container(
        //   margin: const EdgeInsets.only(left: 5),
        //   child: const CircleAvatar(
        //     backgroundColor: Colors.transparent,
        //     backgroundImage: NetworkImage('https://i.ibb.co/37qHwFr/Logo-Saxevil-2.png'),
        //   ),
        // ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: GestureDetector(
              onTap: (){

                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: const Duration(
                      milliseconds: 300,
                    ),
                    pageBuilder: (context, animation, secondaryAnimation) => const ProfileScreen(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1, 0);
                      const end = Offset.zero;
                      const curve = Curves.easeInToLinear;

                      var tween = Tween(begin: begin,end: end)
                      .chain(CurveTween(curve: curve));

                      return SlideTransition(
                        position: animation.drive(tween),
                        child: child,
                      );
                    },
                  )
                );
              },
              child: CircleAvatar(
                maxRadius: 25,
                backgroundColor: AppTheme.primary,
                backgroundImage: const NetworkImage('https://i.ibb.co/NshW15G/image.png'),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 10),
        children: const [
          Placeholder(
            color: Colors.green,
            fallbackHeight: 50,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Center(
                child: Text('Aca va la searchbar')),
            ),
          ),
          SizedBox(height: 10,),
          CustomCardTipo2(name: 'Tacos "Polvo"' , desc: 'Los mejores de todo Navojoa',imageUrl: 'https://i.ibb.co/pnHCRDV/tacos-polvo.jpg',screen: ProfileScreen(),),
          SizedBox(height: 30,),
          CustomCardTipo2(name: 'Tostadas "El Bryan"', desc: 'Estan tremendas',imageUrl: 'https://i.ibb.co/n00bmmF/image.png',screen: ProfileScreen()),
          SizedBox(height: 30,),
          CustomCardTipo2(name: 'Tortas Morbius', desc: 'It\'s Tortas Time!!!', imageUrl: 'https://i.ibb.co/KLHc2Yk/image.png',screen: ProfileScreen()),
          SizedBox(height: 30,),
        ],
      )
    );
  }
}
