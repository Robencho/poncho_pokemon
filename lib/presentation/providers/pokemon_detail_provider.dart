import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:poncho_pokemon/domain/usecases/get_pokemon_detail_usecase.dart';
import '../../domain/entities/pokemon_entity.dart';

final pokemonDetailProvider =
    FutureProvider.family<PokemonEntity, String>((ref, pokemonName) async {
  final getPokemonDetails = GetIt.instance<GetPokemonDetailUsecase>();
  return await getPokemonDetails(pokemonName);
});
