import 'package:flutter/material.dart';
import 'package:practica_2/src/utils/color_settings.dart';

class CalculadoraPropina extends StatefulWidget {
  CalculadoraPropina({Key? key}) : super(key: key);

  @override
  _CalculadoraPropinaState createState() => _CalculadoraPropinaState();
}

class _CalculadoraPropinaState extends State<CalculadoraPropina> {
  final controllerTFcampo = TextEditingController();
  int monto = 0;
  double propina = 0;

  @override
  void dispose() {
    controllerTFcampo.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    TextField tfcampo = TextField(
      controller: controllerTFcampo,
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: Icon(Icons.money),
          hintText: 'Monto',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: ColorSettings.colorPrimary, width: 2.0))),
    );

    ElevatedButton btnPropina = ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: ColorSettings.colorBackground,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        onPressed: () {
          monto = int.parse(controllerTFcampo.text);
          propina = (monto * 0.1);
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => AlertDialog(
              title: Text('Cantidad Propina'),
              content:
                  Text('En base al 10% del consumo la propina es : $propina'),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: ColorSettings.colorPrimary,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop('Ok');
                    },
                    child: Text('OK'))
              ],
            ),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Icon(Icons.add_business_rounded), Text('Calcular')],
        ));

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/restaurant.jpg'),
                  fit: BoxFit.fill)),
        ),
        Card(
            margin: EdgeInsets.only(left: 50, right: 50, top: 200, bottom: 200),
            color: ColorSettings.colorPrimary,
            child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tfcampo,
                    SizedBox(height: 50, width: 50),
                    btnPropina
                  ],
                )))
      ],
    );
  }
}
