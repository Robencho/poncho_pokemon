import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/local/pokemon_database.dart';
import '../data/datasources/local/pokemon_local_datasource.dart';
import '../data/datasources/remote/pokemon_remote_datasource.dart';
import '../data/repositories/pokemon_repository_impl.dart';
import '../domain/repositories/pokemon_repository.dart';
import '../domain/usecases/get_pokemon_list.dart';

final sl = GetIt.instance;

void init(){
  // Database
  sl.registerLazySingleton(() => PokemonDatabase());
  
  // Registrer DIO
  sl.registerLazySingleton(()=> Dio());

  // Register Datasources
  sl.registerLazySingleton<PokemonRemoteDataSource>(
      () => PokemonRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<PokemonLocalDataSource>(
      () => PokemonLocalDataSourceImpl(sl()));

    // Register repositories
  sl.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(sl(), sl()));

      // Use cases
  sl.registerLazySingleton(() => GetPokemonList(sl()));
}