import 'package:drift/drift.dart';

import '../../models/pokemon_model.dart';
import 'pokemon_database.dart';


abstract class PokemonLocalDataSource {
  Future<void> cachePokemonList(List<PokemonModel> pokemons);
  Future<List<PokemonModel>> getPokemonList();
}



class PokemonLocalDataSourceImpl implements PokemonLocalDataSource {
  final PokemonDatabase database;

  PokemonLocalDataSourceImpl(this.database);

  @override
  Future<void> cachePokemonList(List<PokemonModel> pokemons) async {
    // Usa una transacción para realizar operaciones en batch
    await database.transaction(() async {
      for (var pokemon in pokemons) {
        await database.into(database.pokemonTables).insert(
          PokemonTablesCompanion(
            id: Value(pokemon.id),
            name: Value(pokemon.name),
            imageUrl: Value(pokemon.imageUrl),
          ),
          mode: InsertMode.insertOrReplace, // Reemplaza si ya existe
        );
      }
    });
  }

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    final pokemonRows = await database.select(database.pokemonTables).get();
    return pokemonRows.map((row) => PokemonModel(
      id: row.id,
      name: row.name,
      imageUrl: row.imageUrl,
    )).toList();
  }
}
