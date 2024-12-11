class PokemonEntity {
  final int id;
  final String name;
  final String imageUrl;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  String get officialImageUrl => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png';
}
