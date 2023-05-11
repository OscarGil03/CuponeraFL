import 'package:flutter/material.dart';
import 'package:cuponera_fl/themes/themes.dart';

class CustomButton extends StatelessWidget {

  final void Function()? onTap;
  
  const CustomButton({
    super.key, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          color: AppTheme.terciary,
          borderRadius: const BorderRadius.all(Radius.circular(40))
        ),
        child: Center(
          child: Text(
            'Iniciar sesion', 
            style: TextStyle(color: AppTheme.primary, 
            fontSize: 30, 
            fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}