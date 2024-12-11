import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PokemonItem extends StatelessWidget{

final String name;
final String imageUrl;
final VoidCallback onTap;

const PokemonItem({
  super.key,
  required this.name,
  required this.imageUrl,
  required this.onTap
});

    @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  imageUrl,
                  width: 64.0,
                  height: 64.0,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if(loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded/(loadingProgress.expectedTotalBytes ?? 1): null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    size: 64.0,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(child: Text(
                name,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ))
            ],
          ),),

      )
    );
  }
}