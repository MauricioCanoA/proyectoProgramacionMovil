import 'package:flutter/material.dart';
import 'package:practica_2/src/utils/color_settings.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    ElevatedButton btnLogin = ElevatedButton(
      style: ElevatedButton.styleFrom(primary: ColorSettings.colorButton),
      onPressed: () {
        //print(txtEmail.text);
        isLoading = true;
        setState(() {});
        Future.delayed(Duration(seconds: 5), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DashBoardScreen()));
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Icon(Icons.login), Text('Login')],
      ),
    );

    TextFormField txtEmail = TextFormField(
        maxLength: 5,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            hintStyle:
                TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            hintText: 'Introduce el email',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)));

    TextFormField txtPwd = TextFormField(
        maxLength: 5,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Introduce el password',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5)));

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/redblack.jpg'), fit: BoxFit.fill)),
        ),
        Card(
          margin: EdgeInsets.only(left: 15, right: 15, bottom: 20),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(shrinkWrap: true, children: [
              txtEmail,
              SizedBox(
                height: 5,
              ),
              txtPwd,
              btnLogin
            ]),
          ),
        ),
        Positioned(
          child: Image.asset('assets/nerv.png', width: 300),
          top: 100,
        ),
        Positioned(
            child: isLoading == true
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red))
                : Container(),
            top: 200)
      ],
    );
  }
}
