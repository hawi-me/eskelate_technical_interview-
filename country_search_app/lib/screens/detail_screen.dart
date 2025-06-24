import 'package:flutter/material.dart';
import '../models/country.dart';

class CountryDetailScreen extends StatelessWidget {
  final Country country;

  CountryDetailScreen({required this.country});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Country Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              country.flagUrl,
              height: 150,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.error); // Fallback if image fails to load
              },
            ),
            SizedBox(height: 10),
            Text(
              'Common Name: ${country.commonName}',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              'Official Name: ${country.officialName}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Population: ${country.population.toString()}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Area: ${country.area.toStringAsFixed(2)} sq km',
              style: TextStyle(fontSize: 16),
            ),
            Text('Region: ${country.region}', style: TextStyle(fontSize: 16)),
            Text(
              'Subregion: ${country.subregion ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Time Zones: ${country.timezones.join(', ')}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Native Name (First): ${country.nativeName.entries.first.value['common'] ?? 'N/A'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
