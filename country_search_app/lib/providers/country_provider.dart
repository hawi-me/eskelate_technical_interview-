import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/country.dart';
import '../services/api_service.dart';

class CountryProvider with ChangeNotifier {
  List<Country> _countries = [];
  List<Country> _favorites = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<Country> get countries => _countries;
  List<Country> get favorites => _favorites;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  CountryProvider() {
    _loadFavorites();
    _fetchCountries();
  }

  Future<void> _fetchCountries() async {
    _isLoading = true;
    notifyListeners();
    try {
      _countries = await ApiService().fetchCountries();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      notifyListeners();
      return;
    }
    _countries =
        _countries
            .where(
              (country) => country.commonName.toLowerCase().contains(
                query.toLowerCase(),
              ),
            )
            .toList();
    notifyListeners();
  }

  void toggleFavorite(Country country) {
    if (_favorites.contains(country)) {
      _favorites.remove(country);
    } else {
      _favorites.add(country);
    }
    _saveFavorites();
    notifyListeners();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteNames = prefs.getStringList('favorites') ?? [];
    _favorites =
        _countries
            .where((country) => favoriteNames.contains(country.commonName))
            .toList();
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteNames =
        _favorites.map((country) => country.commonName).toList();
    await prefs.setStringList('favorites', favoriteNames);
  }
}
