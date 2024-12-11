import 'package:riverpod/riverpod.dart';
import '../../domain/entities/pokemon_entity.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

import '../../domain/usecases/get_pokemon_list.dart';

final pokemonListProvider = FutureProvider<List<PokemonEntity>>((ref) async {
  final getPokemonList = GetIt.instance<GetPokemonList>();
  return await getPokemonList();
});
