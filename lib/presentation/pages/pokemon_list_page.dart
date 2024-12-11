import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poncho_pokemon/presentation/providers/pokemon_provider.dart';
import 'package:poncho_pokemon/presentation/widgets/pokemon_card.dart';
class PokemonListPage extends ConsumerWidget {
  const PokemonListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pokemonList = ref.watch(pokemonListProvider);
    print("Entró en lista");

    return Scaffold(
      appBar: AppBar(title: const Text('Pokémon List')),
      body: pokemonList.when(
        data: (pokemons) => ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index];
            return PokemonItem(
              name: pokemon.name, 
              imageUrl: pokemon.officialImageUrl, 
              onTap: (){
                Navigator.pushNamed(context, 
                '/pokemon-detail',
                arguments: pokemon,
                );
              },
              );
          },
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}
