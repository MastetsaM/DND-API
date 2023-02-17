import 'package:server/rules/player.dart';

import '../server.dart';

int newId = 0;

class PlayerController extends ResourceController {
  @Operation.post()
  Future<Response> createPlayer() async {
    final body = await request!.body.decode();
    if (body["name"] == null)
      return Response.badRequest(body: "Missing Player Name");
    final String playerName = body["name"].toString();

    final Player p = Player(newId, playerName);

    players.add(p);
    newId++;

    return Response.ok(p.toJson());
  }

  @Operation.get()
  Future<Response> getAllPlayers() async {
    final result = players.map((p) => p.toJson()).toList();
    return Response.ok(result);
  }

  @Operation.get("id")
  Future<Response> getPlayer() async {
    final String aux = request!.path.variables["id"]!;
    final int id = int.parse(aux);

    if (players.length - 1 >= id) {
      final Player p = players.firstWhere((p) => p.id == id);
      return Response.ok(p.toJson());
    } else
      return Response.noContent();
  }

  @Operation.put("id", "idClass")
  Future<Response> addClass() async {
    String aux = request!.path.variables["id"]!;
    final int id = int.parse(aux);

    aux = request!.path.variables["idClass"]!;
    final int idClass = int.parse(aux);
    final Player p = players.firstWhere((element) => element.id == id);
    p.addClass(idClass);

    return Response.ok(p);
  }

  @Operation.put("id", "idRace")
  Future<Response> addRace() async {
    String aux = request!.path.variables["id"]!;
    final int id = int.parse(aux);

    aux = request!.path.variables["idRace"]!;
    final int idRace = int.parse(aux);
    final Player p = players.firstWhere((element) => element.id == id);
    p.addRace(idRace);

    return Response.ok(p);
  }
}
