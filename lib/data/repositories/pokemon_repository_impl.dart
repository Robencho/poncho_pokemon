

import '../../domain/entities/pokemon_entity.dart';
import '../../domain/repositories/pokemon_repository.dart';
import '../datasources/local/pokemon_local_datasource.dart';
import '../datasources/remote/pokemon_remote_datasource.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;
  final PokemonLocalDataSource localDataSource;

  PokemonRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<List<PokemonEntity>> getPokemonList() async {
    try {
      final remotePokemons = await remoteDataSource.fetchPokemonList();
      await localDataSource.cachePokemonList(remotePokemons);
      return remotePokemons.map((model) => PokemonEntity(
        id: model.id,
        name: model.name,
        imageUrl: model.imageUrl, 
        weight: 200, height: 200, types: [], abilities: [], stats: [],
      )).toList();
    } catch (e) {
      // Si falla la fuente remota, intentar cargar de la base de datos local.
      final localPokemons = await localDataSource.getPokemonList();
      return localPokemons.map((model) => PokemonEntity(
        id: model.id,
        name: model.name,
        imageUrl: model.imageUrl, weight: 200, height: 200, types: [], abilities: [], stats: [],
      )).toList();
    }
  }
  
  @override
  Future<PokemonEntity> getPokemonDetail(String pokemonName) async {
      return await remoteDataSource.fetchPokemonDetails(pokemonName);
  }
}
