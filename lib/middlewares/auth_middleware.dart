import 'package:gdg_demo/gdg_demo.dart';
import 'dart:convert';

class AuthMiddleware extends Controller {
  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    //Buscando informações do header
    final token = request.raw.headers["authorization"][0];

    //Pegando somente a parte criptografada do header
    final tokenBase64 = token.split(" ")[1];

    //decriptando o token
    final decryptToken = utf8.fuse(base64).decode(tokenBase64);

    //pegando os valores de username e senha
    final username = decryptToken.split(":")[0];
    final password = decryptToken.split(":")[1];

    if (username == "marco" && password == "12345") {
      return request;
    }

    return Response.unauthorized();
  }
}
