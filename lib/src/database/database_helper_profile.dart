import 'package:mysql1/mysql1.dart';

class Mysql {
  static final _host = '192.168.1.65';
  static final _user = 'userapp1';
  static final _password = 'password';
  static final _db = 'flutter';
  static final _port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = new ConnectionSettings(
        host: _host, port: _port, user: _user, password: _password, db: _db);
    return await MySqlConnection.connect(settings);
  }
}
