import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:practica_2/src/database/database_helper_profile.dart';
import 'package:practica_2/src/utils/color_settings.dart';

class ProfileScreenSet extends StatefulWidget {
  ProfileScreenSet({Key? key}) : super(key: key);

  @override
  _ProfileScreenSetState createState() => _ProfileScreenSetState();
}

class _ProfileScreenSetState extends State<ProfileScreenSet> {
  var db = Mysql();
  var userId = 1;
  var nombreUser = '';
  var apellidoPatUser = '';
  var apellidoMatUser = '';
  var numeroTelefono = '';
  var email = '';
  var imageRoute = '';

  @override
  void initState() {
    super.initState();
    db.getConnection().then((conn) {
      print('Open Connection');
      String sql = 'select * from userinf where userId = ?;';
      conn.query(sql, [userId]).then((results) {
        for (var row in results) {
          setState(() {
            nombreUser = row[1];
            apellidoPatUser = row[2];
            apellidoMatUser = row[3];
            numeroTelefono = row[4];
            email = row[5];
            imageRoute = row[6];
          });
        }
      });
    });
  }

  File? imageTemp;

  Future imageGallery() async {
    try {
      final imageGallery =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imageGallery == null) return;
      final imageTemp = File(imageGallery.path);
      setState(() => this.imageTemp = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future imageCamera() async {
    try {
      final imageCamera =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (imageCamera == null) return;
      final imageTemp = File(imageCamera.path);
      setState(() => this.imageTemp = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final controllerNombreUser = TextEditingController(text: nombreUser);
    final controllerApellidoPat = TextEditingController(text: apellidoPatUser);
    final controllerApellidoMat = TextEditingController(text: apellidoMatUser);
    final controllerNumTel = TextEditingController(text: numeroTelefono);
    final controllerEmail = TextEditingController(text: email);

    CircleAvatar avatar =
        CircleAvatar(backgroundImage: AssetImage(imageRoute), radius: 80);

    TextField tfNombreUser = TextField(
      controller: controllerNombreUser,
      maxLines: 1,
      maxLength: 20,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          hintText: 'Nombre Usuario',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: ColorSettings.colorPrimary, width: 2.0))),
    );

    TextField tfApellidoPatUser = TextField(
      controller: controllerApellidoPat,
      maxLength: 20,
      maxLines: 1,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          hintText: 'Apellido Paterno',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: ColorSettings.colorPrimary, width: 2.0))),
    );

    TextField tfApellidoMatUser = TextField(
      controller: controllerApellidoMat,
      maxLength: 20,
      maxLines: 1,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          icon: Icon(Icons.perm_identity),
          hintText: 'Apellido Materno',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: ColorSettings.colorPrimary, width: 2.0))),
    );

    TextField tfNumeroTel = TextField(
      controller: controllerNumTel,
      maxLength: 10,
      maxLines: 1,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          icon: Icon(Icons.phone_android),
          hintText: 'Telefono',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: ColorSettings.colorPrimary, width: 2.0))),
    );

    TextField tfEmail = TextField(
      controller: controllerEmail,
      maxLength: 50,
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          icon: Icon(Icons.mail),
          hintText: 'Correo',
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide:
                  BorderSide(color: ColorSettings.colorPrimary, width: 2.0))),
    );

    ElevatedButton btnGuardarPerf = ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: ColorSettings.colorBackground,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            textStyle: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Icon(Icons.save_rounded), Text(' Guardar')],
        ));

    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/profileEdit.jpg'), fit: BoxFit.fill),
          ),
        ),
        Card(
          elevation: 3,
          margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 20),
          color: ColorSettings.colorPrimary,
          child: Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: ListView(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                          child: ClipOval(
                            child: imageTemp == null
                                ? avatar
                                : Image.file(imageTemp!,
                                    width: 160, height: 160, fit: BoxFit.cover),
                          ),
                          alignment: Alignment.center),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorSettings.colorBackground,
                              child: IconButton(
                                  onPressed: () {
                                    imageCamera();
                                  },
                                  icon: Icon(Icons.camera_enhance),
                                  color: ColorSettings.colorIcon)),
                          SizedBox(width: 20),
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: ColorSettings.colorBackground,
                              child: IconButton(
                                  onPressed: () {
                                    imageGallery();
                                  },
                                  icon: Icon(Icons.photo),
                                  color: ColorSettings.colorIcon))
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30, width: 10),
                  SizedBox(child: tfNombreUser, height: 70),
                  SizedBox(height: 10, width: 10),
                  SizedBox(child: tfApellidoPatUser, height: 70),
                  SizedBox(height: 10, width: 10),
                  SizedBox(child: tfApellidoMatUser, height: 70),
                  SizedBox(height: 10, width: 10),
                  SizedBox(child: tfNumeroTel, height: 70),
                  SizedBox(height: 10, width: 10),
                  SizedBox(child: tfEmail, height: 70),
                  SizedBox(height: 10, width: 10),
                  SizedBox(child: btnGuardarPerf, width: 40)
                ],
              )),
        )
      ],
    );
  }
}
