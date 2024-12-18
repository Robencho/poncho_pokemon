

import '../entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemonList();
  Future<PokemonEntity> getPokemonDetail(String pokemonName);
}
