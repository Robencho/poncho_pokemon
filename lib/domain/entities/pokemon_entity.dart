class PokemonEntity {
  final int id;
  final String name;
  final String imageUrl;
  final int weight;
  final int height;
  final List<String> types;
  final List<String>abilities;
  final List<Map<String, dynamic>> stats;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.weight,
    required this.height,
    required this.types,
    required this.abilities,
    required this.stats,
  });

  String get officialImageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}
