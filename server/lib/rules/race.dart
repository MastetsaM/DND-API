import 'package:server/rules/utils.dart';

class Race {
  Race(this.id, this.name, abilityScore) {
    abilityScoreIncrement.fromJson(abilityScore);
  }

  int id;
  String name;

  AbilityScore abilityScoreIncrement = AbilityScore();

  Map toJson() => {
        'id': id,
        'name': name,
        'baseScore': abilityScoreIncrement.toJson(),
      };
}
