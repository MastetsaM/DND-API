class Languages {
  String? name;
}

class AbilityScore {
  int str_ = 0, dex_ = 0, con_ = 0, int_ = 0, wis_ = 0, cha_ = 0;

  void fromJson(dynamic abilityScore) {
    if (abilityScore["str"] != null) {
      str_ = int.parse(abilityScore["str"]!.toString());
    }
    if (abilityScore["dex"] != null) {
      dex_ = int.parse(abilityScore["dex"]!.toString());
    }
    if (abilityScore["con_"] != null) {
      con_ = int.parse(abilityScore["con"]!.toString());
    }
    if (abilityScore["int"] != null) {
      int_ = int.parse(abilityScore["int"]!.toString());
    }
    if (abilityScore["wis"] != null) {
      wis_ = int.parse(abilityScore["wis"]!.toString());
    }
    if (abilityScore["cha"] != null) {
      cha_ = int.parse(abilityScore["cha"]!.toString());
    }
  }

  Map toJson() => {
        "str_": str_,
        "dex_": dex_,
        "con_": con_,
        "int_": int_,
        "wis_": wis_,
        "cha_": cha_
      };
}
