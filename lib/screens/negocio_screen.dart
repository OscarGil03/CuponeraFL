import 'package:cuponera_fl/themes/themes.dart';
import 'package:flutter/material.dart';

class NegocioScreen extends StatelessWidget {
  final String negName;
  final String negDesc;
  final String negImg;
  const NegocioScreen(
      {Key? key,
      required this.negName,
      required this.negDesc,
      required this.negImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(negName),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Center(
          child: Column(
            children: [
              //Imagen negocio
              const SizedBox(
                height: 20,
              ),
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(negImg),
                  ),
                ),
              ),

              const SizedBox(
                height: 20,
              ),
              //Nombre del negocio
              Text(
                negName,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //Descripcion del negocio
              Text(
                negDesc,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Divider(
                  color: AppTheme.primary,
                  height: 10,
                  thickness: 2,
                ),
              ),
              //TODO: CUPONES
              //Cupones del negocio
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Cupones Disponibles',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'No hay cupones disponibles',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //----------------------------------------------------
            ],
          ),
        ),
      ),
    );
  }
}
