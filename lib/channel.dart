import 'package:gdg_demo/controllers/user_controller.dart';

import 'gdg_demo.dart';

class GdgDemoChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  @override
  Controller get entryPoint {
    final router = Router();

    router.route("/users").link(() => UserController());

    return router;
  }
}
