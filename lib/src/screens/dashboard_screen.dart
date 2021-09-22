import 'package:flutter/material.dart';
import 'package:practica_2/src/utils/color_settings.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSettings.colorBackground,
      appBar: AppBar(
        title: Text('DASHBOARD'),
        backgroundColor: ColorSettings.colorPrimary,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Mauricio Cano'),
              accountEmail: Text('17030487@itcelaya.edu.mx'),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://i.pinimg.com/280x280_RS/9f/48/1c/9f481cbebae4ae30f95d9b6092479676.jpg')),
              decoration: BoxDecoration(color: ColorSettings.colorPrimary),
            ),
            ListTile(
              title: Text('Propinas'),
              subtitle: Text('Calculadora de Propinas'),
              leading: Icon(Icons.add_business_rounded),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/calPro');
              },
            ),
            ListTile(
              title: Text('Intenciones'),
              subtitle: Text('Intenciones Implicitas'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/intenciones');
              },
            ),
            ListTile(
              title: Text('Notas'),
              subtitle: Text('CRUD Notas'),
              leading: Icon(Icons.phone_android),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/notas');
              },
            )
          ],
        ),
      ),
    );
  }
}
