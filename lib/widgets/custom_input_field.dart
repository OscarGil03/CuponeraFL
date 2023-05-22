import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? icon;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final bool obscureText;

/* Comentario util pa cuando queramos guardar los campos

formProperty hace referencia a que campo
del Map queremos meterle contenido. formValues
es el contenido de dicho campo 

En otras palabras, este Widget recibe el Map con su contenido(
  {'nombre':'gonzalo', 'apellido':'barrantes'}
) 
  
Y el nombre de la propiedad ('nombre'), todo esto por medio del constructor. 
Recibir dichas propiedades servira para reescribir su contenido en un futuro.
Si quisieramos recibir la pura estructura, podriamos definir los campos comp
un String vacio ({ 'nombre': '' })
*/

  final String formProperty;
  final Map<String, String> formValues;

  const CustomInputField({
    super.key,
    this.hintText,
    this.labelText,
    this.helperText,
    this.icon,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.words,
    required this.formProperty,
    required this.formValues,
    required TextEditingController controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      textCapitalization: textCapitalization,
      keyboardType: keyboardType,
      obscureText: obscureText,
      /* Aqui se iguala el valor de value (Que es el contenido del FormField)
        al valor de que tenga el Mapa (formValues) en la propiedad
        que elijamos (formProperty). El Mapa actualizado es enviado
        de regreso a la pantalla inputs_screen.dart.
        
        Se podria ver como:
        
        Map<String, String>['nombre'] = value;
        */
      onChanged: (value) => formValues[formProperty] = value,
      validator: (value) {
        if (value == null) return 'Este campo es requerido';
        return value.length < 3
            ? 'El campo tiene que tener por lo menos 6 letras'
            : null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        counterText: 'Te faltan caracteres',
        prefixIcon: prefixIcon == null ? null : Icon(prefixIcon),
        suffixIcon: suffixIcon == null ? null : Icon(suffixIcon),
        icon: icon == null ? null : Icon(icon),
      ),
    );
  }
}
