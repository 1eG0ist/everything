import 'package:everything/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = darkTheme;
  bool _isDarkTheme = true;

  ThemeProvider() {
    _initializeTheme();
  }

  ThemeData get themeData => _themeData;
  bool get isDarkTheme => _isDarkTheme;

  bool toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _themeData = _isDarkTheme ? darkTheme : lightTheme;
    _saveThemePreference();
    notifyListeners();
    return _isDarkTheme;
  }

  Future<void> _initializeTheme() async {
    _isDarkTheme = await getDarkThemePreference();
    _themeData = _isDarkTheme ? darkTheme : lightTheme;
    notifyListeners();
  }

  void _saveThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', _isDarkTheme);
  }

  Future<bool> getDarkThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isDarkTheme') ?? true;
  }
}