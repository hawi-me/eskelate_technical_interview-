class Country {
  final String commonName;
  final String officialName;
  final Map<String, Map<String, String>> nativeName;
  final String flag; // Keep the emoji for reference if needed
  final int population;
  final double area;
  final String region;
  final String? subregion;
  final List<String> timezones;

  Country({
    required this.commonName,
    required this.officialName,
    required this.nativeName,
    required this.flag,
    required this.population,
    required this.area,
    required this.region,
    this.subregion,
    required this.timezones,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      commonName: json['name']['common'] ?? 'Unknown',
      officialName: json['name']['official'] ?? 'Unknown',
      nativeName: (json['name']['nativeName'] as Map<String, dynamic>).map(
        (key, value) => MapEntry(key, {
          'official': value['official'] as String,
          'common': value['common'] as String,
        }),
      ),
      flag: json['flag'] as String,
      population: json['population'] as int,
      area: (json['area'] as num).toDouble(),
      region: json['region'] as String,
      subregion: json['subregion'] as String?,
      timezones: (json['timezones'] as List<dynamic>).cast<String>(),
    );
  }

  // Method to generate flag URL
  String get flagUrl => 'https://flagcdn.com/w320/$flag.png';
}
