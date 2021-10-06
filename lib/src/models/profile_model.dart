import 'package:mysql1/src/results/row.dart';

class ProfileModel {
  int? idUser;
  String? nombreUser;
  String? apellidoPatUser;
  String? apellidoMatUser;
  String? numeroTelefono;
  String? email;
  String? imageRoute;

  ProfileModel(
      {this.idUser,
      this.nombreUser,
      this.apellidoPatUser,
      this.apellidoMatUser,
      this.numeroTelefono,
      this.email,
      this.imageRoute});

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
        idUser: map['idUser'],
        nombreUser: map['nombreUser'],
        apellidoPatUser: map['apellidoPatUser'],
        apellidoMatUser: map['apellidoMatUser'],
        numeroTelefono: map['numeroTelefono'],
        email: map['email'],
        imageRoute: map['imageRoute']);
  }

  Map<String, dynamic> toMap(ResultRow first) {
    return {
      'idUser': idUser,
      'nombreUser': nombreUser,
      'apellidoPatUser': apellidoPatUser,
      'apellidoMatUser': apellidoMatUser,
      'numeroTelefono': numeroTelefono,
      'email': email,
      'imageRoute': imageRoute
    };
  }
}
