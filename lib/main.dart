// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0; // 0 for system, 1 for light, 2 for dark, 3 for custom
  ThemeMode _themeMode = ThemeMode.system;
  Color _backgroundColor = Colors.white;
  Color _appBarColor = Colors.blue;
  double _appBarElevation = 4.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Theme app',
      themeMode: _themeMode,
      theme: ThemeData(
        primaryColor: _appBarColor,
        scaffoldBackgroundColor: _backgroundColor,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Theme app'),
          backgroundColor: _appBarColor,
          elevation: _appBarElevation,
          actions: [
            IconButton(
              icon: Icon(_themeMode == ThemeMode.dark
                  ? Icons.brightness_4
                  : Icons.brightness_5),
              onPressed: () {
                setState(() {
                  _themeMode = _themeMode == ThemeMode.dark
                      ? ThemeMode.light
                      : ThemeMode.dark;
                  _updateColors();
                });
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioListTile<int>(
                title: const Text('Light'),
                value: 1,
                groupValue: _selectedIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = value!;
                    _updateThemeMode();
                  });
                },
              ),
              RadioListTile<int>(
                title: const Text('Dark'),
                value: 2,
                groupValue: _selectedIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = value!;
                    _updateThemeMode();
                  });
                },
              ),
              RadioListTile<int>(
                title: Text('Custom'),
                value: 3,
                groupValue: _selectedIndex,
                onChanged: (value) {
                  setState(() {
                    _selectedIndex = value!;
                    _updateCustomColors();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _updateColors() {
    if (_themeMode == ThemeMode.dark) {
      _backgroundColor = Colors.grey[600]!;
      _appBarColor = Colors.grey;
      _appBarElevation = 0.0;
    } else {
      _backgroundColor = Colors.white;
      _appBarColor = Colors.blue;
      _appBarElevation = 4.0;
    }
  }

  void _updateThemeMode() {
    switch (_selectedIndex) {
      case 0:
        _themeMode = ThemeMode.system;
        break;
      case 1:
        _themeMode = ThemeMode.light;
        break;
      case 2:
        _themeMode = ThemeMode.dark;
        break;
      case 3:
        _updateCustomColors();
        return;
    }
    _updateColors();
  }

  void _updateCustomColors() {
    _backgroundColor = Colors.purpleAccent;
    _appBarColor = Colors.purple;
    _appBarElevation = 8.0;
    _themeMode = ThemeMode.light; // Use light theme for custom colors
  }
}
