

import '../entities/pokemon_entity.dart';
import '../repositories/pokemon_repository.dart';
class GetPokemonList {
  final PokemonRepository repository;

  GetPokemonList(this.repository);

  Future<List<PokemonEntity>> call() async {
    print('Fetching Pokémon list...');
    return await repository.getPokemonList();
  }
}
