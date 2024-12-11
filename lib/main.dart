import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poncho_pokemon/core/service_locator.dart' as di;
import 'package:poncho_pokemon/presentation/pages/splash_page.dart';

import 'domain/entities/pokemon_entity.dart';
import 'presentation/pages/pokemon_detail_page.dart';
import 'presentation/pages/pokemon_list_page.dart';

void main() async {
  // Inicialización de dependencias
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  title: 'Pokémon App',
  theme: ThemeData(primarySwatch: Colors.blue),
  initialRoute: '/',
  routes: {
    '/': (context) => PokemonListPage(),
    '/pokemon-detail': (context) => PokemonDetailPage(
          pokemon: ModalRoute.of(context)!.settings.arguments as PokemonEntity,
        ),
  },
);
  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Poke  poncho',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashPage(),
    );
  }
}
