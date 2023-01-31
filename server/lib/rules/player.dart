class Player {
  Player(this.id, this.name, [ab]){
    if(ab==null) {
      return;
    }

    baseScore = {
      "str_": ab["str"]!=null ? ab["str"] : 0,
      "dex_": ab["dex"]!=null ? ab["dex"] : 0,
      "con_": ab["con"]!=null ? ab["con"] : 0,
      "int_": ab["int"]!=null ? ab["int"] : 0,
      "wis_": ab["wis"]!=null ? ab["wis"] : 0,
      "cha_": ab["cha"]!=null ? ab["cha"] : 0,
    };

  }
  int id;

  String? name;
  int lvl = 1;
  Map? baseScore;
  

  void addAbilityScore(int str_, int dex_, int con_, int int_, int wis_, int cha_){
    baseScore = {
      "str_": str_,
      "dex_": dex_, 
      "con_": con_, 
      "int_": int_, 
      "wis_": wis_, 
      "cha_": cha_
    };
  }
  
  
  Map toJson() => {
    'id': id,
    'name': name,
    'level': lvl,
    'baseScore': baseScore,
  };
}