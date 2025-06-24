import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/country_provider.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: Consumer<CountryProvider>(
        builder: (context, provider, child) {
          final favorites = provider.favorites;
          if (favorites.isEmpty) {
            return Center(child: Text('No favorites added'));
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.5,
            ),
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final country = favorites[index];
              return Card(
                child: InkWell(
                  onTap:
                      () => Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: country,
                      ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        country.flag,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 5),
                      Text(country.commonName, textAlign: TextAlign.center),
                      Text(
                        '${country.population.toString()}',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
