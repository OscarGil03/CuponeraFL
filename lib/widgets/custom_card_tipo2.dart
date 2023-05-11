import 'package:cuponera_fl/themes/themes.dart';
import 'package:flutter/material.dart';

class CustomCardTipo2 extends StatelessWidget {

  final String imageUrl;
  final String? name;
  final String? desc;
  final Widget screen;
   
  const CustomCardTipo2({
    Key? key, 
    this.name, 
    this.desc,
    required this.imageUrl, 
    required this.screen, 
    }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
                    PageRouteBuilder(
                      transitionDuration: const Duration(
                        milliseconds: 300,
                      ),
                      pageBuilder: (context, animation, secondaryAnimation) => screen,
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0, -1);
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
      child: Card(
        /*Esta we es por si los elementos dentro del widget Card
        se salen de su "Espacio Seguro" y pues tienen las esquinas
        puntiagudas o algun rollo del estilo*/
        clipBehavior: Clip.antiAlias,
        //La propiedad esta es pa modificar la forma del widget Card
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 25,
        shadowColor: AppTheme.primary.withOpacity(0.3),
        child: Column(
          children: [
        
            FadeInImage(
              image: NetworkImage(imageUrl),
              placeholder: const AssetImage('assets/jar-loading.gif'),
              width: double.infinity,
              height: 170,
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 300),
            ),
        
            /* En flutter se pueden poner condiciones dentro 
            de arreglos (WTF esto esta bien roto) */
            
            if(name != null)
        
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              tileColor: AppTheme.terciary,
              // onTap: () {},
              title: Column(
                children: [
                  Text(name!, style: TextStyle(color: AppTheme.primary)),
                  if(desc !=null)
                  Text(desc!,style: TextStyle(color: AppTheme.primary)),
                ],
              ),
              trailing: Icon(Icons.arrow_forward, color: AppTheme.primary),
            ),
          ],
        ),
      ),
    ); 
  }
}