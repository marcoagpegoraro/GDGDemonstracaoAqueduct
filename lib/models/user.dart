import 'package:gdg_demo/gdg_demo.dart';

class User extends Serializable {
  int id;
  String name;
  String password;

  @override
  Map<String, dynamic> asMap() {
    return {
      "id": id,
      "name": name,
      "password": password,
    };
  }

  @override
  void readFromMap(Map<String, dynamic> object) {
    id = object["id"] as int;
    name = object["name"] as String;
    password = object["password"] as String;
  }
}
