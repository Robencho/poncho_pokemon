import 'package:dio/dio.dart';

import '../../models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> fetchPokemonList();
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
}
