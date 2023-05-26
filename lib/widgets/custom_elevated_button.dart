import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String destinationRoute;
  final String text;
  const CustomElevatedButton({
    super.key,
    required this.destinationRoute,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, destinationRoute);
          },
          child: SizedBox(
              // width: double.infinity,
              child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: const Center(child: Text('Iniciar Sesion')),
          ))),
    );
  }
}
