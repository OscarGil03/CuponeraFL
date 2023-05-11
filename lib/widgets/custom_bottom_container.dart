import 'package:flutter/material.dart';

import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:cuponera_fl/themes/themes.dart';

class CustomBottomContainer extends StatelessWidget {
  
  final String destinationRoute;
  
  const CustomBottomContainer({
    super.key, 
    required this.destinationRoute,
  });

@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.secondary,
        shape: BoxShape.rectangle,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
      ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
      
            CustomElevatedButton(destinationRoute: destinationRoute, text: 'Iniciar Sesion',),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Aun no tienes cuenta?', style: TextStyle(color: AppTheme.primary, fontSize: 20),),
                TextButton(
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, 'home');
                  }, 
                  child: Text('Registrate', style: TextStyle(color: AppTheme.accept, fontSize: 20, decoration: TextDecoration.underline))
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       height: 300,
//       decoration: BoxDecoration(
//         color: AppTheme.secondary,
//         borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          
//           children: [
      
//             ElevatedButton(
//                 onPressed: () {},
//                 child: SizedBox(
//                   width: double.infinity,                        
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     child: Center(
//                       child: Text('Iniciar Sesion', style: TextStyle(color: AppTheme.primary))
//                     ),
//                   )
//                 )
//             ),
      
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Text('Aun no tienes cuenta?', style: TextStyle(color: AppTheme.primary, fontSize: 20 ),),
//                 TextButton(
//                   onPressed: (){}, 
//                   child: Text('Registrate', style: TextStyle(color: AppTheme.accept))
//                   )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }