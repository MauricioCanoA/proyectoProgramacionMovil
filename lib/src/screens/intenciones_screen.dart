import 'package:flutter/material.dart';
import 'package:practica_2/src/utils/color_settings.dart';
import 'package:url_launcher/url_launcher.dart';

class IntencionesScreen extends StatefulWidget {
  IntencionesScreen({Key? key}) : super(key: key);

  @override
  _IntencionesScreenState createState() => _IntencionesScreenState();
}

class _IntencionesScreenState extends State<IntencionesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Intenciones Implicitas'),
          backgroundColor: ColorSettings.colorPrimary,
        ),
        body: ListView(
          children: [
            Card(
              elevation: 8.0,
              child: ListTile(
                title: Text('Abrir Página Web'),
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded, size: 18.0),
                    Text('https://celaya.tecnm.mx'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.language, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: _abrirWeb,
              ),
            ),
            Card(
              elevation: 8.0,
              child: ListTile(
                title: Text('Llamada Telefonica'),
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded, size: 18.0),
                    Text('Cel: 4611883770'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.phone_android, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: _llamadaTelefonica,
              ),
            ),
            Card(
              elevation: 8.0,
              child: ListTile(
                title: Text('Enviar SMS'),
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded, size: 18.0),
                    Text('Cel. 4611883770'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.sms_sharp, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: _enviarSMS,
              ),
            ),
            Card(
              elevation: 8.0,
              child: ListTile(
                title: Text('Enviar E-mail'),
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded, size: 18.0),
                    Text('To: 17030487@itcelaya.edu.mx'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.email_outlined, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: _enviarEmail,
              ),
            ),
            Card(
              elevation: 8.0,
              child: ListTile(
                title: Text('Tomar Foto'),
                subtitle: Row(
                  children: [
                    Icon(Icons.touch_app_rounded, size: 18.0),
                    Text('Sonrie :)'),
                  ],
                ),
                leading: Container(
                  height: 40.0,
                  padding: EdgeInsets.only(right: 10.0),
                  child: Icon(Icons.photo, color: Colors.black),
                  decoration: BoxDecoration(
                      border: Border(right: BorderSide(width: 1.0))),
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {},
              ),
            )
          ],
        ));
  }

  _abrirWeb() async {
    const url = "https://celaya.tecnm.mx/";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  _llamadaTelefonica() async {
    const url = "tel:4611883770";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  _enviarSMS() async {
    const url = "sms:4611883770";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  _enviarEmail() async {
    final Uri params = Uri(
        scheme: 'mailto',
        path: '17030487@itceleya.edu.mx',
        query: 'subject=Saludos&body=Bienvenido :)');

    var email = params.toString();
    if (await canLaunch(email)) {
      await launch(email);
    }
  }

  tomarFoto() {}
}
