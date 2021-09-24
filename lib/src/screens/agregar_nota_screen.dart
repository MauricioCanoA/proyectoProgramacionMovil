import 'package:flutter/material.dart';
import 'package:practica_2/src/database/database_helper.dart';
import 'package:practica_2/src/models/notas_model.dart';
import 'package:practica_2/src/utils/color_settings.dart';

class AgregarNotasScreen extends StatefulWidget {
  AgregarNotasScreen({Key? key}) : super(key: key);

  @override
  _AgregarNotasScreenState createState() => _AgregarNotasScreenState();
}

class _AgregarNotasScreenState extends State<AgregarNotasScreen> {
  late DatabaseHelper _databaseHelper;

  TextEditingController _controllerTitulo = TextEditingController();
  TextEditingController _controllerDetalle = TextEditingController();

  @override
  void initState() {
    super.initState();
    _databaseHelper = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorSettings.colorPrimary,
        title: Text('Agregar Nota'),
      ),
      body: ListView(
        children: [
          _crearTextFieldTitulo(),
          SizedBox(
            height: 10,
          ),
          _crearTextFieldDetalle(),
          ElevatedButton(
              onPressed: () {
                NotasModel nota = NotasModel(
                    titulo: _controllerTitulo.text,
                    detalle: _controllerDetalle.text);

                _databaseHelper.insert(nota.toMap()).then((value) {
                  if (value > 0) {
                    //Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Registro Insertado correctamente')));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('La Solicitud no se concreto')));
                  }
                });
              },
              child: Text('Guarda Nota'))
        ],
      ),
    );
  }

  Widget _crearTextFieldTitulo() {
    return TextField(
      keyboardType: TextInputType.text,
      controller: _controllerTitulo,
      maxLength: 5,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          labelText: "Titulo de la nota",
          errorText: "Este Campio es obligatorio"),
      onChanged: (value) {},
    );
  }

  Widget _crearTextFieldDetalle() {
    return TextField(
        keyboardType: TextInputType.text,
        controller: _controllerDetalle,
        maxLines: 8,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: "Detalle de la nota",
            errorText: "Este Campio es obligatorio"),
        onChanged: (value) {});
  }
}
