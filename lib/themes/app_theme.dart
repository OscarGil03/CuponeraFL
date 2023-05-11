import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = const Color(0xFF383838);
  static Color secondary = const Color(0xFFD1D1D6);
  static Color terciary = const Color(0xFFCDBE78);
  static Color accept = Colors.teal;
  static Color decline = Colors.red;

  //Propiedades para aplicar a 1 elemento

  //TODO: Revisar si la webada esta es util
  
  // static TextStyle buttonTextAccept = TextStyle(
  //     fontSize: 20,
  //     // fontStyle: FontStyle.italic,
  //     color: accept,
  //     decoration: TextDecoration.underline);

  //Estilo Global de la App
  static ThemeData lightTheme = ThemeData.light().copyWith(
    
    //Estilo Scaffold
    scaffoldBackgroundColor: secondary,

    //Estilo del App Bar
    appBarTheme: AppBarTheme(
      color: primary,
      elevation: 0,
    ),

//TODO: Poner temas globales para los componentes de abajo
    //Estilo ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
        foregroundColor: primary,
        textStyle: const TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: terciary,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
    )),

    //Tema de los inputs
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelStyle: TextStyle(color: primary),
      enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide( color: Colors.white)
          ),
    
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide( color: primary)
          ),

          fillColor: Colors.white54,
          filled: true,
    )
    
    // //Estilo TextButton
    // textButtonTheme: TextButtonThemeData(
    //   style: TextButton.styleFrom(
    //       foregroundColor: primary,
    //       textStyle: const TextStyle(
    //           fontSize: 18,
    //           fontStyle: FontStyle.italic,
    //           decoration: TextDecoration.underline)),
    // ),
  );
}
