import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cuponera_fl/themes/app_theme.dart';
import 'package:cuponera_fl/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNegocioScreen extends StatefulWidget {
  const AddNegocioScreen({Key? key}) : super(key: key);

  @override
  State<AddNegocioScreen> createState() => _AddNegocioScreenState();
}

class _AddNegocioScreenState extends State<AddNegocioScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  //Varriable de firestores para usar con multiples conexiones
  FirebaseFirestore db = FirebaseFirestore.instance;

  //Controladores para negocios
  final TextEditingController _nombreNegController = TextEditingController();
  final TextEditingController _descNegController = TextEditingController();
  final TextEditingController _imgNegController = TextEditingController();

  //Interfaz para añadir negocio
  //Metodo para añadir negocios a la BD en Firestore
  Future<void> addNegocio(String name, String desc, String imageUrl) async {
    try {
      if (_nombreNegController.text.isNotEmpty &&
          _descNegController.text.isNotEmpty &&
          _imgNegController.text.isNotEmpty) {
        await FirebaseFirestore.instance.collection('negocios').add({
          'desc': desc,
          'imageUrl': imageUrl,
          'name': name,
        });
        if (context.mounted) {
          customPopPushDialog(
            mensaje: 'Se agrego negocio corectamente',
            botonAccept: 'Osker',
            context: context,
            screen: 'home',
          );
        }
      } else {
        return customPopDialog(
          mensaje:
              'Alguno de los campos esta vacio, favor de llenarlos correctamente',
          botonAccept: 'Ok',
          context: context,
        );
      }
    } on FirebaseException catch (e) {
      customPopDialog(
        mensaje: e.message.toString(),
        botonAccept: 'Okas',
        context: context,
      );
    }
  }

  @override
  void dispose() {
    _nombreNegController.dispose();
    _imgNegController.dispose();
    _descNegController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir negocios'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Center(
          child: Column(
            children: [
              //Imagen header
              const SizedBox(
                height: 15,
              ),
              const Image(
                image: AssetImage('assets/logo_negocios.png'),
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 15,
              ),
              //Texto de añadir negocios
              const Text(
                'AÑADE TU NEGOCIO',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              //Input nombre de negocio
              CustomTextField(
                hintText: 'Nombre del negocio:',
                textCapitalization: TextCapitalization.words,
                controller: _nombreNegController,
                keyboardType: TextInputType.name,
                obscureText: false,
              ),
              const SizedBox(
                height: 15,
              ),
              //Input descripcion del negocio
              CustomTextField(
                hintText: 'Descripcion del negocio: ',
                textCapitalization: TextCapitalization.sentences,
                controller: _descNegController,
                keyboardType: TextInputType.text,
                obscureText: false,
              ),
              const SizedBox(
                height: 15,
              ),
              //Input imagen
              //TODO: Cambiar a que la imagen pueda ser obtenida de la galeria
              CustomTextField(
                hintText: 'Url de la imagen: ',
                textCapitalization: TextCapitalization.none,
                controller: _imgNegController,
                keyboardType: TextInputType.url,
                obscureText: false,
              ),
              const SizedBox(
                height: 25,
              ),
              //Boton para enviar
              ElevatedButton(
                onPressed: () => addNegocio(
                  _nombreNegController.text,
                  _descNegController.text,
                  _imgNegController.text,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                  child: Text('Añadir negocio'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
