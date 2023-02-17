import 'dart:html';

import 'package:server/rules/player.dart';
import 'package:server/rules/race.dart';
import 'package:server/server.dart';

import 'controller/player.dart';

List<Player> players = [];
List<Race> races = [];

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

    router.route("/playerDB").linkFunction(playerPopulate);
    router.route("/player/[:id[/class/:idClass]]").link(PlayerController.new);
    router.route("/player/:id/race/:idRace").link(PlayerController.new);

    //router.route("/players").linkFunction(getPlayers);

    return router;
  }

  Future<Response> root(Request request) async {
    return Response.ok("root");
  }

  Future<Response> playerPopulate(Request request) async {
    for (int i = 0; i < 5; i++) {
      Playerp
    }
    return Response.ok("populate");
  }
}
