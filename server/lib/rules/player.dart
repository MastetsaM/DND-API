import 'package:server/rules/utils.dart';

class Player {
  Player(this.id, this.name);

  int id, lvl = 1;
  String name;
  int? class_, race_;
  AbilityScore? baseAbilityScore;

  void setBaseAbilityScore(Map abilityScore) {
    baseAbilityScore ??= AbilityScore();
    baseAbilityScore!.fromJson(abilityScore);
  }

  void addClass(int newClass) {
    class_ = newClass;
  }

  void addRace(int newRace) {
    race_ = newRace;
  }

  Map toJson() {
    final player = {
      'id': id,
      'name': name,
      'level': lvl,
    };
    if (baseAbilityScore != null) {
      player['baseAbilityScore'] = baseAbilityScore!.toJson();
    }
    if (class_ != null) {
      player['class'] = class_!;
    }
    if (race_ != null) {
      player['race'] = race_!;
    }

    return player;
  }
}
