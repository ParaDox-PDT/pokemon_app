class PokemonModel {
  final num id;
  final String number;
  final String name;
  final String img;
  final List<dynamic> type;
  final String height;
  final String weight;
  final String candy;
  final num candyCount;
  final String egg;
  final num spawnChance;
  final num avgSpawn;
  final String spawnTime;
  final List<dynamic> weaknesses;

  PokemonModel(
      {required this.id,
      required this.number,
      required this.img,
      required this.height,
      required this.name,
      required this.type,
      required this.avgSpawn,
      required this.candy,
      required this.candyCount,
      required this.egg,
      required this.spawnChance,
      required this.spawnTime,
      required this.weaknesses,
      required this.weight});

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        id: json["id"] as num? ?? 0,
        number: json["num"] as String? ?? "",
        img: json["img"] as String? ?? "",
        height: json["height"] as String? ?? "",
        name: json["name"] as String? ?? "",
        type: json["type"],
        avgSpawn: json["avg_spawns"] as num? ?? 0,
        candy:json["candy"] as String? ?? "" ,
        candyCount: json["candy_count"] as num? ?? 0,
        egg: json["egg"] as String? ?? "",
        spawnChance: json["spawn_chance"] as num? ?? 0,
        spawnTime: json["spawn_time"] as String? ?? "",
        weaknesses: json["weaknesses"],
        weight: json["weight"] as String? ?? "");
  }
}
