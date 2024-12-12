import 'package:poncho_pokemon/domain/entities/pokemon_entity.dart';
import 'package:poncho_pokemon/domain/repositories/pokemon_repository.dart';

class GetPokemonDetailUsecase {
  final PokemonRepository repository;
  GetPokemonDetailUsecase(
    this.repository
  );

  Future<PokemonEntity> call(String pokemonName) async{
    return await repository.getPokemonDetail(pokemonName);
  }

}