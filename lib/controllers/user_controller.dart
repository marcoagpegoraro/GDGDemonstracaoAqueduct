import 'package:gdg_demo/gdg_demo.dart';
import 'package:gdg_demo/models/user.dart';

class UserController extends ResourceController {
  // UserController(this.context) {
  //   acceptedContentTypes = [ContentType.json];
  // }

  // ManagedContext context;

  final userList = [
    User()
      ..id = 1
      ..name = "Marco"
      ..password = "123"
  ];

  @Operation.get()
  Future<Response> getUsers() async {
    return Response.ok(userList);
  }
}
