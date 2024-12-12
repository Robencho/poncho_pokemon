import 'package:dio/dio.dart';
import 'package:poncho_pokemon/domain/entities/pokemon_entity.dart';

import '../../models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> fetchPokemonList();
  Future<PokemonEntity> fetchPokemonDetails(String pokemonName);
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;

  PokemonRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PokemonModel>> fetchPokemonList() async {
    final response = await dio.get('https://pokeapi.co/api/v2/pokemon');
    final results = response.data['results'] as List;

    return results.map((json) {
      final name = json['name'];
      final url = json['url'];
      final id = int.parse(url.split('/').reversed.elementAt(1));
      return PokemonModel(
        id: id,
        name: name,
        imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json['id']}.png',
      );
    }).toList();
  }
  
  @override
  Future<PokemonEntity> fetchPokemonDetails(String pokemonName) async {
      try {
        final deateilResponse = await dio.get('https://pokeapi.co/api/v2/pokemon/$pokemonName');
        final data = deateilResponse.data;

        return PokemonEntity(id: data['id'], name: data['name'], imageUrl:data['sprites']['other']['official-artwork']['front_default'], 
        weight: data['weight'], 
        height: data['height'], 
        types: (data['types'] as List<dynamic>)
        .map((type)=>type['type']['name'] as String).toList(), 
        abilities: (data['abilities'] as List<dynamic>)
        .map((ability)=> ability['ability']['name'] as String).toList(), 
        stats: (data['stats'] as List<dynamic>).map(
          (stat)=>{
            'name': stat['stat']['name'],
            'value': stat['base_stat'],
          }
        ).toList(),);
      }catch(e){
         throw Exception('Error fetching Pókemon Detail: $e');
      }
  }
}
