// IMPORTS
import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/repository/auth_service.dart';
import 'package:miniproyecto/screens/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../navigation/navigation_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:miniproyecto/providers/theme_provider.dart';
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// Construye la aplicación principal con múltiples proveedores y configuración de tema y localización.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyAppState()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: Consumer2<LocaleProvider, ThemeProvider>(
        builder: (context, localeProvider, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // Desactiva la etiqueta de depuración
            title: 'PharmaStock', // Título de la aplicación
            theme: themeProvider.lightTheme, // Tema claro
            darkTheme: themeProvider.darkTheme, // Tema oscuro
            themeMode: themeProvider.themeMode, // Establece el modo de tema
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate, // localización de Material
              GlobalWidgetsLocalizations.delegate, // localización de widgets
              GlobalCupertinoLocalizations.delegate, // localización de Cupertino
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: localeProvider.locale,
            home: const LoginPage(),
          );
        },
      ),
    );
  }
}


/// Clase que gestiona el estado de la aplicación y notifica a los widgets dependientes cuando cambia el índice seleccionado.
class MyAppState extends ChangeNotifier {
  int selectedIndex = 0;

  void updateIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners(); // notifica los widgets dependientes
  }
}


/// Página principal del estado de la aplicación.
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// / Estado de la página principal que construye la interfaz de usuario.
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo de la página
      appBar: AppBar( 
        backgroundColor:
            Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
                ? const Color(0xFF1E1E1E) // Color para modo oscuro
                : const Color(0xFF248F8D), // Color para modo claro

      /// Agrega un botón de ícono en la barra de acciones que imprime "Notificaciones" al presionarlo.
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              onPressed: () {
                debugPrint("Notificaciones");
              },
              icon: const Icon(Icons.email),
            ),
          ),
        ],
      ),

      // Contenido de la página
      body: ListView(
        children: [
          SizedBox(height: 75),  // Espacio arriba del logo

          // Logo 
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
                  ? "assets/logo.png" // Ruta de la imagen para modo oscuro
                  : "assets/portada.png", // Ruta de la imagen para modo claro
              height: 200, // Ajusta el tamaño del logo según sea necesario
            ),
          ),

          SizedBox(height: 15), // Espacio debajo del logo

          ElevatedButtonExample(), // Botones de navegación

          SizedBox(height: 75), // Espacio debajo de los botones
        ],
      ),
    );
  }
}

class ElevatedButtonExample extends StatelessWidget {
  const ElevatedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {

    /// Estilos botón 
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor:
          Provider.of<ThemeProvider>(context).themeMode == ThemeMode.dark
              ? const Color.fromARGB(255, 68, 51, 67) // Color para modo oscuro
              : const Color.fromARGB(255, 23, 109, 97), // Color para modo claro
      foregroundColor: Colors.white, // Color del texto del botón
      textStyle: const TextStyle(fontSize: 18), // Tamaño del texto
      minimumSize: const Size(400, 60), // Tamaño mínimo del botón
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Bordes redondeados
    );
    

    // Construcción de la interfaz de usuario
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10), // Margen lateral
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Tamaño mínimo de la columna
          children: <Widget>[


            // Botón para la primera página
            ElevatedButton(
              style: style,
              onPressed: () {
                //Provider.of<MyAppState>( context, listen: false,).updateIndex(1);
                context.read<MyAppState>().updateIndex(1);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PageOfPage()), // Página de navegación
                );
              },
              child: Text(S.of(context).page1), // Texto del botón
            ),



            const SizedBox(height: 20), // Espacio entre botones
         


            // Botón para la segunda página
            ElevatedButton(
              style: style,
              onPressed: () {
                //Provider.of<MyAppState>(context,listen: false, ).updateIndex(2);
                context.read<MyAppState>().updateIndex(2);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PageOfPage()), // Página de navegación
                );
              },
              child: Text(S.of(context).page2), // Texto del botón
            ),



            const SizedBox(height: 20), // Espacio entre botones



            // Botón para la tercera página
            ElevatedButton(
              style: style,
              onPressed: () {
                //Provider.of<MyAppState>(context,listen: false,).updateIndex(3);
                context.read<MyAppState>().updateIndex(3);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PageOfPage()), // Página de navegación
                );
              },
              child: Text(S.of(context).page3), // Texto del botón
            ),



            const SizedBox(height: 20), // Espacio entre botones



            // Botón para cerrar sesión
            ElevatedButton(
              style: style,
              /// Maneja el cierre de sesión del usuario y redirige a la página de inicio de sesión.
              onPressed: () async {
                final authservice = AuthService(); // Instancia del servicio de autenticación
                await authservice.signOut(); // Cierra sesión del usuario
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()), // Página de inicio de sesión
                  (route) => false,
                );
              },
              child: Text(S.of(context).exit), // Texto del botón
            ),



          ],
        ),
      ),
    );
  }
}


/// Proveedor de configuración de idioma que gestiona el idioma de la aplicación y lo guarda en preferencias compartidas.
class LocaleProvider with ChangeNotifier {
  Locale _locale = const Locale('es'); // idioma por defecto
  Locale get locale => _locale;
  LocaleProvider() {
    _loadLocale(); // cargar idioma guardado
  }


  /// Carga la configuración de idioma almacenada en preferencias compartidas y notifica a los oyentes.
  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final code = prefs.getString('localeCoder') ?? 'es';
    _locale = Locale(code);
    notifyListeners();
  }


  /// Establece el idioma de la aplicación y guarda la configuración en SharedPreferences.
  Future<void> setLocale(Locale locale) async {
    if (!['es', 'en'].contains(locale.languageCode)) return;
    _locale = locale;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('localeCode', locale.languageCode);
    notifyListeners();
  }
}
