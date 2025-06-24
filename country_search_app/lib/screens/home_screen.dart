import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/country_provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countries')),
      body: Consumer<CountryProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text(provider.errorMessage));
          }
          final countries = provider.countries;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) {
                    provider.filterCountries(value);
                  },
                  decoration: InputDecoration(
                    hintText: 'Search countries',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                child:
                    countries.isEmpty
                        ? Center(child: Text('No countries found'))
                        : GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                              ),
                          itemCount: countries.length,
                          itemBuilder: (context, index) {
                            final country = countries[index];
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
                                      country.flagUrl,
                                      height: 50,
                                      fit: BoxFit.cover,
                                      errorBuilder: (
                                        context,
                                        error,
                                        stackTrace,
                                      ) {
                                        return Icon(
                                          Icons.error,
                                        ); // Fallback if image fails to load
                                      },
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      country.commonName,
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      '${country.population.toString()}',
                                      textAlign: TextAlign.center,
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        provider.favorites.contains(country)
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: Colors.red,
                                      ),
                                      onPressed:
                                          () =>
                                              provider.toggleFavorite(country),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/favorites');
          }
        },
      ),
    );
  }
}
