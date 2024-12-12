import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poncho_pokemon/domain/entities/pokemon_entity.dart';
import '../../presentation/providers/pokemon_detail_provider.dart';

class PokemonDetailPage extends ConsumerWidget {
  final PokemonEntity pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Escucha el estado del provider
    final pokemonDetail = ref.watch(pokemonDetailProvider(pokemon.name));

    return Scaffold(
      appBar: AppBar(
        title: Text(pokemon.name.toUpperCase()),
      ),
      body: pokemonDetail.when(
        data: (pokemon) => _buildPokemonDetail(context, pokemon),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            Center(child: Text('Error: ${error.toString()}')),
      ),
    );
  }

  Widget _buildPokemonDetail(BuildContext context, PokemonEntity pokemon) {
    return Column(
      children: [
        Image.network(
          pokemon.imageUrl
        ),
        Expanded(
          child: Stack(
            children: [
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(30),
                          ),
                          color: Colors.grey[200],
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  pokemon.name.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Weight: ${pokemon.weight}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Height: ${pokemon.height}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Types: ${pokemon.types.join(', ')}'),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Abilities: ${pokemon.abilities.join(', ')}'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
