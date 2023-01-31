import 'package:server/rules/player.dart';

import '../server.dart';

  List<Player> ok = [];
  int newId = 0;

class PlayerController extends ResourceController {

  @Operation.get()
  Future<Response> getAllPlayers() async {
    final result = ok.map((p) => p.toJson()).toList();
    return Response.ok(result);
  }

  @Operation.get("id")
  Future<Response> getPlayer() async {
    final String aux = request!.path.variables["id"]!;
    final int id = int.parse(aux);
    
    if (ok.length-1>=id){
      final Player p = ok.firstWhere((p) => p.id==id);
      return Response.ok(p.toJson());
    } else
      return Response.noContent();
  }

  @Operation.post()
  Future<Response> createPlayer() async {
    final body = await request!.body.decode();
    if(body["name"]==null)
      return Response.badRequest(body: "Missing Player Name");
    final String playerName = body["name"].toString();

    final Player p;
    if(body["as"]==null)
      p = Player(newId, playerName);
    else
      p = Player(newId, playerName, body["as"]);

    ok.add(p);
    newId++;

    return Response.ok(p.toJson());
  }

  /*@Operation.put()
  Future<Response> addClass() async {
    final body = await request!.body.decode();
    if(body["name"]==null)
      return Response.badRequest(body: "Missing Player Name");
    final String playerName = body["name"].toString();

    final Player p;
    if(body["as"]==null)
      p = Player(newId, playerName);
    else
      p = Player(newId, playerName, body["as"]);
      
    ok.add(p);
    newId++;

    return Response.ok(p.toJson());
  }

  @Operation.put()
  Future<Response> addRace() async {
    final body = await request!.body.decode();
    if(body["name"]==null)
      return Response.badRequest(body: "Missing Player Name");
    final String playerName = body["name"].toString();

    final Player p;
    if(body["as"]==null)
      p = Player(newId, playerName);
    else
      p = Player(newId, playerName, body["as"]);
      
    ok.add(p);
    newId++;

    return Response.ok(p.toJson());
  }

  @Operation.put()
  Future<Response> addAbilities () async {
    final body = await request!.body.decode();
    if(body["name"]==null)
      return Response.badRequest(body: "Missing Player Name");
    final String playerName = body["name"].toString();

    final Player p;
    if(body["as"]==null)
      p = Player(newId, playerName);
    else
      p = Player(newId, playerName, body["as"]);
      
    ok.add(p);
    newId++;

    return Response.ok(p.toJson());
  }

  @Operation.put()
  Future<Response> addEquipment () async {
    final body = await request!.body.decode();
    if(body["name"]==null)
      return Response.badRequest(body: "Missing Player Name");
    final String playerName = body["name"].toString();

    final Player p;
    if(body["as"]==null)
      p = Player(newId, playerName);
    else
      p = Player(newId, playerName, body["as"]);
      
    ok.add(p);
    newId++;

    return Response.ok(p.toJson());
  }

  @Operation.put()
  Future<Response> addDescription () async {
    final body = await request!.body.decode();
    if(body["name"]==null)
      return Response.badRequest(body: "Missing Player Name");
    final String playerName = body["name"].toString();

    final Player p;
    if(body["as"]==null)
      p = Player(newId, playerName);
    else
      p = Player(newId, playerName, body["as"]);
      
    ok.add(p);
    newId++;

    return Response.ok(p.toJson());
  }*/
}
