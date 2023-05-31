import 'package:flutter/material.dart';

class CustomTextBox extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final String nombreSeccion;
  const CustomTextBox({
    Key? key,
    required this.text,
    required this.nombreSeccion,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Nombre de la seccion
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                nombreSeccion,
                style: const TextStyle(color: Colors.grey),
              ),
              IconButton(onPressed: onPressed, icon: const Icon(Icons.settings))
            ],
          ),
          //Texto de la seccion
          Text(text),
        ],
      ),
    );
  }
}
