import 'package:alumni_dk/core/constant/prefs_name.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppearanceProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  // Initialize the provider by loading AppType and darkMode from SharedPreferences
  Future<void> initialize() async {
    _isDarkMode = await _getDarkModeFromPrefs(); // Load dark mode setting
    notifyListeners();
  }

  // Setter for dark mode
  void setDarkMode(bool value) async {
    if (_isDarkMode != value) {
      _isDarkMode = value;
      await _saveDarkModeToPrefs(value); // Save to SharedPreferences
      notifyListeners();
    }
  }

  // Save darkMode to SharedPreferences
  Future<void> _saveDarkModeToPrefs(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(PrefsName.isDarkMode, value);
  }

  // Retrieve darkMode setting from SharedPreferences
  Future<bool> _getDarkModeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(PrefsName.isDarkMode) ?? false;
  }
}
