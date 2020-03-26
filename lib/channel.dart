import 'package:gdg_demo/controllers/user_controller.dart';
import 'package:gdg_demo/middlewares/auth_middleware.dart';

import 'gdg_demo.dart';

class GdgDemoChannel extends ApplicationChannel {
  ManagedContext context;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "postgres", "postgres", "localhost", 5432, "postgres");

    context = ManagedContext(dataModel, persistentStore);
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router
        .route("/users/[:id]")
        .link(() => AuthMiddleware())
        .link(() => UserController(context));

    return router;
  }
}
