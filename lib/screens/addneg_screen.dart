import 'package:flutter/material.dart';

class AddNegocioScreen extends StatelessWidget {
  const AddNegocioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir negocios'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('AddNegocioScreen'),
      ),
    );
  }
}
