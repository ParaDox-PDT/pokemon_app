class ValorantModel {
  final String name;
  final String developerName;
  final String img;
  final List<String> colors;

  ValorantModel(
      {required this.name,
      required this.img,
      required this.colors,
      required this.developerName});

  factory ValorantModel.fromJson(Map<String, dynamic> json) {
    return ValorantModel(
        name: json["displayName"] as String? ?? "",
        img: json["displayIcon"] as String? ?? "",
        colors: json["backgroundGradientColors"] as List<String>? ?? [],
        developerName: json["developerName"] as String? ?? "");
  }
}