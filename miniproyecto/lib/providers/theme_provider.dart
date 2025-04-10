import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _lightTheme = ThemeData.light();
  ThemeData _darkTheme = ThemeData.dark();
  ThemeMode _themeMode = ThemeMode.system; // Valor por defecto

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _loadTheme(); // Cargar el tema almacenado al iniciar
  }

  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'theme',
      mode.toString(),
    ); // Guardar el tema en SharedPreferences
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('theme') ?? 'ThemeMode.system';
    _themeMode = ThemeMode.values.firstWhere(
      (e) => e.toString() == themeString,
      orElse: () => ThemeMode.system,
    );
    notifyListeners();
  }

  // Tema claro
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Color(0xFF085F63),
      scaffoldBackgroundColor: Color.fromARGB(255, 240, 245, 249),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF085F63),
        foregroundColor: Colors.white,
        elevation: 4, // Agregar sombra al AppBar
        toolbarTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ), // Estilo de texto en AppBar
      ),
      brightness: Brightness.light,
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF085F63), // Color de fondo de los botones
        textTheme: ButtonTextTheme.primary, // Color del texto del botón
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF085F63),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        titleLarge: TextStyle(
          fontSize: 20,
          color: Colors.black87,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(color: Colors.white),
      ),
      cardTheme: CardTheme(
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      iconTheme: IconThemeData(
        color: Colors.black87,
      ), // Iconos con color más oscuro
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF085F63),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Color(0xFF085F63),
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Tema oscuro
  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Color(0xFF2C3E50),
      scaffoldBackgroundColor: Color(0xFF1A1A1E),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF2C3E50),
        foregroundColor: Colors.white,
        elevation: 6, // Agregar más sombra al AppBar en modo oscuro
        toolbarTextStyle: TextStyle(fontWeight: FontWeight.bold),
      ),
      brightness: Brightness.dark,
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF2C3E50),
        textTheme: ButtonTextTheme.primary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2C3E50),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          textStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.white70,
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.white60),
        titleLarge: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: TextStyle(color: Colors.white),
      ),
      cardTheme: CardTheme(
        elevation: 5,
        shadowColor: Color.fromARGB(255, 0, 0, 0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      iconTheme: IconThemeData(color: Colors.white70),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF2C3E50),
        foregroundColor: Colors.white,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF121212),
        selectedItemColor: Color(0xFF2C3E50),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
