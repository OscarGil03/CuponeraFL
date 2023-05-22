import 'package:cuponera_fl/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Pruebas extends StatelessWidget {
  const Pruebas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pruebas'),
      ),
      body: FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Text(snapshot.data?[index]['email']);
              },
            );
          } else {
            return const Center(
              child: Text('Cargando...'),
            );
          }
        },
      ),
    );
  }
}
