import '../server.dart';

class Race { 
  Race(this.name);
  String name;
  Map abs = {'description':""};
}

List<Race> races = [];

Future<Response> createPlayer(Request request) async {
  final String playerName = request.path.variables["playerName"]!;
  final Race player = Race(playerName);

  races.add(player);
  return Response.ok(playerName);
}

Future<Response> getPlayers(Request request) async {
  return Response.ok(races.map((p) => p.name).toList());
}