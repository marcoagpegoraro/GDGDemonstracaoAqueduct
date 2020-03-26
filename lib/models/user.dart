import 'package:gdg_demo/gdg_demo.dart';

class User extends ManagedObject<_User> implements _User {}

class _User {
  @primaryKey
  int id;
  String name;
  String password;
}
