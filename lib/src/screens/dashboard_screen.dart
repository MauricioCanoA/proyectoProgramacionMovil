import 'package:flutter/material.dart';
import 'package:practica_2/src/utils/color_settings.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  void initState() {
    super.initState();
  }

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
                accountName: Text('Mauricio'),
                accountEmail: Text('maurici@gmail.com'),
                currentAccountPicture:
                    CircleAvatar(backgroundImage: AssetImage('assets/photoProfile.jpeg')),
                decoration: BoxDecoration(color: ColorSettings.colorPrimary),
                onDetailsPressed: () {
                  Icon(Icons.settings);
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settProf');
                }),
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
            ),
            ListTile(
              title: Text('Movies'),
              subtitle: Text('Prueba API REST'),
              leading: Icon(Icons.movie),
              trailing: Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/movie');
              },
            )
          ],
        ),
      ),
    );
  }
}
