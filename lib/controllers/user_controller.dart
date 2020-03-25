import 'package:gdg_demo/gdg_demo.dart';

class UserController extends ResourceController {
  @Operation.get()
  Future<Response> getUsers() async {
    return Response.ok("teste");
  }
}
