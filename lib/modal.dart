import 'dart:convert';

List<TopLevel> topLevelFromJson(String str) => List<TopLevel>.from(json.decode(str).map((x) => TopLevel.fromJson(x)));

String topLevelToJson(List<TopLevel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TopLevel {
  Name name;
  List<String> capital;
  Map<String, String> languages;
  int population;

  TopLevel({
    required this.name,
    required this.capital,
    required this.languages,
    required this.population,
  });

  factory TopLevel.fromJson(Map<String, dynamic> json) => TopLevel(
    name: Name.fromJson(json["name"]),
    capital: List<String>.from(json["capital"].map((x) => x)),
    languages: Map.from(json["languages"]).map((k, v) => MapEntry<String, String>(k, v)),
    population: json["population"],
  );

  Map<String, dynamic> toJson() => {
    "name": name.toJson(),
    "capital": List<dynamic>.from(capital.map((x) => x)),
    "languages": Map.from(languages).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "population": population,
  };
}

class Name {
  String common;
  String official;
  Map<String, NativeName> nativeName;

  Name({
    required this.common,
    required this.official,
    required this.nativeName,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
    common: json["common"],
    official: json["official"],
    nativeName: Map.from(json["nativeName"]).map((k, v) => MapEntry<String, NativeName>(k, NativeName.fromJson(v))),
  );

  Map<String, dynamic> toJson() => {
    "common": common,
    "official": official,
    "nativeName": Map.from(nativeName).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
  };
}

class NativeName {
  String official;
  String common;

  NativeName({
    required this.official,
    required this.common,
  });

  factory NativeName.fromJson(Map<String, dynamic> json) => NativeName(
    official: json["official"],
    common: json["common"],
  );

  Map<String, dynamic> toJson() => {
    "official": official,
    "common": common,
  };
}
