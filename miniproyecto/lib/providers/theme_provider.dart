import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _lightTheme = ThemeData.light(); // Tema claro
  ThemeData _darkTheme = ThemeData.dark(); // Tema oscuro
  ThemeMode _themeMode = ThemeMode.system; // Valor por defecto

  ThemeMode get themeMode => _themeMode; // Getter para el modo de tema


  ThemeProvider() {
    _loadTheme(); // Cargar el tema almacenado al iniciar
  }


  /// Establece el modo de tema, notifica a los oyentes y guarda la configuración en SharedPreferences.
  void setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'theme',
      mode.toString(),
    ); // Guardar el tema en SharedPreferences
  }

  /// Carga el tema almacenado en las preferencias compartidas y actualiza el modo de tema.
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final themeString = prefs.getString('theme') ?? 'ThemeMode.system';
    _themeMode = ThemeMode.values.firstWhere(
      (e) => e.toString() == themeString,
      orElse: () => ThemeMode.system,
    );
    notifyListeners();
  }



  // TEMA CLARO
  ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Color(0xFF085F63), // Color primario
      scaffoldBackgroundColor: Color.fromARGB(255, 240, 245, 249), // Color de fondo claro
      brightness: Brightness.light,

      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF085F63), // Color de fondo del AppBar
        foregroundColor: Colors.white, // Color del texto y iconos en el AppBar
        elevation: 4, // Sombra del AppBar
          toolbarTextStyle: TextStyle( 
            fontWeight: FontWeight.bold, // Texto en negrita
          ), 
      ),

      // Estilo de botones
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF085F63), // Color de fondo de los botones
        textTheme: ButtonTextTheme.primary, // Color del texto del botón
      ),

      // Estilo de ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF085F63), // Color de fondo del botón elevado
          foregroundColor: Colors.white, // Color del texto del botón elevado
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Bordes redondeados
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Padding del botón
          textStyle: TextStyle(fontWeight: FontWeight.bold), // Texto en negrita
        ),
      ),

      // Estilo de texto
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16, // Tamaño del texto
          color: Colors.black87, // Color del texto
          fontWeight: FontWeight.w400, // Peso del texto
        ),

        // Estilo de texto para el cuerpo
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black54),
        titleLarge: TextStyle(
          fontSize: 20, // Tamaño del texto del título
          color: Colors.black87, // Color del texto del título
          fontWeight: FontWeight.bold, // Peso del texto del título
        ),
        labelLarge: TextStyle(color: Colors.white), // Color del texto de las etiquetas
      ),

      // Estilo de tarjetas
      cardTheme: CardTheme(
        elevation: 5, // Sombra de las tarjetas
        shadowColor: Colors.grey.withOpacity(0.3), // Color de la sombra
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Bordes redondeados
      ),

      // Estilo de iconos
      iconTheme: IconThemeData(
        color: Colors.black87, // Color de los iconos
      ), 
      
      // Estilo de FloatingActionButton
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF085F63), // Color de fondo
        foregroundColor: Colors.white, // Color del icono
      ),

      // Estilo de BottomNavigationBar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white, // Color de fondo
        selectedItemColor: Color(0xFF085F63), // Color del ítem seleccionado
        unselectedItemColor: Colors.grey, // Color de los ítems no seleccionados
      ),
    );
  }


 // -----------------------------------------------------------------------------------------------------------------------------------------------------------------


  // TEMA OSCURO
  ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Color(0xFF2C3E50), // Color primario
      scaffoldBackgroundColor: Color(0xFF1A1A1E), // Color de fondo oscuro
      brightness: Brightness.dark, // Modo oscuro

      // Estilo del AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF2C3E50), // Color de fondo del AppBar
        foregroundColor: Colors.white, // Color del texto y iconos en el AppBar
        elevation: 6, // Agregar más sombra al AppBar en modo oscuro
        toolbarTextStyle: TextStyle(fontWeight: FontWeight.bold), // Texto en negrita
      ),

      // Estilo de botones
      buttonTheme: ButtonThemeData(
        buttonColor: Color(0xFF2C3E50), // Color de fondo de los botones
        textTheme: ButtonTextTheme.primary, // Color del texto del botón
      ),

      // Estilo de ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF2C3E50), // Color de fondo del botón elevado
          foregroundColor: Colors.white, // Color del texto del botón elevado
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Bordes redondeados
          ),
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Padding del botón
          textStyle: TextStyle(fontWeight: FontWeight.bold), // Texto en negrita
        ),
      ),

      // Estilo de texto
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          fontSize: 16, // Tamaño del texto
          color: Colors.white70, // Color del texto
          fontWeight: FontWeight.w400, // Peso del texto
        ),
        bodyMedium: TextStyle(fontSize: 14, color: Colors.white60), // Color del texto
        titleLarge: TextStyle(
          fontSize: 20, // Tamaño del texto del título
          color: Colors.white, // Color del texto del título
          fontWeight: FontWeight.bold, // Peso del texto del título
        ),
        labelLarge: TextStyle(color: Colors.white), // Color del texto de las etiquetas
      ),

      // Estilo de tarjetas
      cardTheme: CardTheme(
        elevation: 5, // Sombra de las tarjetas
        shadowColor: Color.fromARGB(255, 0, 0, 0), // Color de la sombra
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), // Bordes redondeados
      ),

      // Estilo de iconos
      iconTheme: IconThemeData(color: Colors.white70), // Color de los iconos

      // Estilo de FloatingActionButton
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF2C3E50), // Color de fondo
        foregroundColor: Colors.white, // Color del icono
      ),

      // Estilo de BottomNavigationBar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF121212), // Color de fondo
        selectedItemColor: Color(0xFF2C3E50), // Color del ítem seleccionado
        unselectedItemColor: Colors.grey, // Color de los ítems no seleccionados
      ),
    );
  }
}
