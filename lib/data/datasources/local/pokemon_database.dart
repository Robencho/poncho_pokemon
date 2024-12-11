import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'pokemon_database.g.dart';

@DataClassName('PokemonTable')
class PokemonTables extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
}

@DriftDatabase(tables: [PokemonTables])
class PokemonDatabase extends _$PokemonDatabase {
  PokemonDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pokemon.sqlite'));
    return NativeDatabase(file);
  });
}
