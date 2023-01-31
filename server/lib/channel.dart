import 'package:server/server.dart';

import 'controller/player.dart';

class ServerChannel extends ApplicationChannel {
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }
  @override
  Controller get entryPoint {
    final router = Router();
    router.route("/").linkFunction(root);
    router.route("/players/[:id]").link(PlayerController.new);

    /*router.route("/createPlayer/:playerName").linkFunction(createPlayer);
    router.route("/players").linkFunction(getPlayers);*/

    return router;
  }

  Future<Response> root(Request request) async {
    final list = List.generate(18, (i) => ((i + 1)/2 -5).floor());

    return Response.ok({"ok":"HI welcome to DnD Reloaded API", "list": list});
  }
}
