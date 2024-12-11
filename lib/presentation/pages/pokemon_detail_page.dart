import 'package:flutter/material.dart';

import '../../domain/entities/pokemon_entity.dart';

class PokemonDetailPage extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonDetailPage({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            pokemon.officialImageUrl, 
          width: MediaQuery.of(context).size.width, height: 300,
          fit: BoxFit.contain,
          ),
          SizedBox(height: 20),
          Text(
            pokemon.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          // Puedes agregar más detalles aquí
        ],
      ),
    );
  }
}
