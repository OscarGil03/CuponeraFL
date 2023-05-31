import 'package:cuponera_fl/themes/themes.dart';
import 'package:flutter/material.dart';

class MyProfileCard extends StatelessWidget {
  final String nombreSeccion;
  final String textoSeccion;
  final void Function()? onPressed;
  const MyProfileCard({
    super.key,
    required this.nombreSeccion,
    required this.textoSeccion,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(right: 15, left: 15, top: 15),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '$nombreSeccion: ',
                  style: const TextStyle(color: Colors.grey),
                ),
                IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      Icons.mode_edit_outlined,
                      color: AppTheme.primary,
                      size: 30,
                    ))
              ],
            ),
            Text(textoSeccion),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
