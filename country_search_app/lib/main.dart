import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/country_provider.dart';
import 'screens/home_screen.dart';
import 'screens/detail_screen.dart';
import 'screens/favorites_screen.dart';
import 'models/country.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountryProvider(),
      child: MaterialApp(
        title: 'Countries App',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
          '/detail':
              (context) => CountryDetailScreen(
                country: ModalRoute.of(context)!.settings.arguments as Country,
              ),
          '/favorites': (context) => FavoritesScreen(),
        },
      ),
    );
  }
}
