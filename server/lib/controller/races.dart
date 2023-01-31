import '../server.dart';


class RaceController extends ResourceController {
  List<String> ok = ["ok"];

  @Operation.get()
  Future<Response> getAllRaces() async {
    return Response.ok({'players': ok, 'size': ok.length});
  }

  @Operation.get('name')
  Future<Response> createPlayer() async {
    final String playerName = request!.path.variables['name'].toString();
    ok.add(playerName);
    return Response.ok(ok.length);
  }
}