import 'package:gdg_demo/gdg_demo.dart';
import 'package:gdg_demo/models/user.dart';

class UserController extends ResourceController {
  UserController(this.context) {
    acceptedContentTypes = [ContentType.json];
  }

  ManagedContext context;

  @Operation.get()
  Future<Response> getUsers() async {
    final query = Query<User>(context);
    final users = await query.fetch();

    return Response.ok(users);
  }

  @Operation.get("id")
  Future<Response> getUserById() async {
    final id = int.parse(request.path.variables['id']);

    final query = Query<User>(context)..where((user) => user.id).equalTo(id);
    final users = await query.fetchOne();

    return Response.ok(users);
  }

  @Operation.post()
  Future<Response> postTodo() async {
    final body = User()..read(await request.body.decode(), ignore: ["id"]);

    final query = Query<User>(context)
      ..values.name = body.name
      ..values.password = body.password;
    final users = await query.insert();

    return Response.ok(
        {"message": "Usuário ${body.name} foi inserido com sucesso!"});
  }
}
