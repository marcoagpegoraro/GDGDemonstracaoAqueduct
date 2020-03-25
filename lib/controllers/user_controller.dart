import 'package:gdg_demo/gdg_demo.dart';

class UserController extends ResourceController {
  // UserController(this.context) {
  //   acceptedContentTypes = [ContentType.json];
  // }

  // ManagedContext context;

  @Operation.get()
  Future<Response> getUsers() async {
    return Response.ok("teste");
  }
}
