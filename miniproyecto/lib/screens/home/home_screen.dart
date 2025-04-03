import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PharmaStock',
        theme: ThemeData(
          primaryColor: Color(0xFF085F63), // Color principal
          scaffoldBackgroundColor: Color.fromARGB(
            255,
            240,
            245,
            249,
          ), // Fondo de la app
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF085F63),
            foregroundColor: Colors.white, // Color de los iconos y texto
          ),
          /*elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(
                Color.fromARGB(255, 23, 109, 97),
              ),
              foregroundColor: WidgetStateProperty.all(Colors.white),
              textStyle: WidgetStateProperty.all(
                TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Color(0xFF0A2832),
            selectedItemColor: Colors.white, // Color del icono seleccionado
            unselectedItemColor: Colors.grey, // Color de icono sin seleccionar
          ),
          navigationRailTheme: NavigationRailThemeData(
            backgroundColor: Color(0xFF0A2832),
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            selectedLabelTextStyle: TextStyle(color: Colors.white),
            unselectedLabelTextStyle: TextStyle(color: Colors.grey),
          ),*/
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  int selectedIndex = 0;

  void updateIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners(); //notifica los widgets dependientes
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF248F8D),
          
          title: Image.asset(
            "assets/logo.png", // Ruta de la imagen en assets
            height: 50, // Ajusta el tamaño según sea necesario
          ),

          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: IconButton(
                onPressed: () {
                  debugPrint("Notificaciones");
                },
                icon: Icon(Icons.email),
              ),
            ),
          ],
        ),
        body: ElevatedButtonExample(),
      
    );
  }
}

class ElevatedButtonExample extends StatelessWidget {
  const ElevatedButtonExample({super.key});

  @override
 
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 23, 109, 97),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 18,),
      minimumSize: const Size(400, 60),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    );

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10), // Margen lateral
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                style: style,
                onPressed: () {
                  //Provider.of<MyAppState>( context, listen: false,).updateIndex(1);
                  context.read<MyAppState>().updateIndex(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PageOfPage()),
                  );
                },
                child: const Text('Stock'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: style,
                onPressed: () {
                  //Provider.of<MyAppState>(context,listen: false, ).updateIndex(2);
                  context.read<MyAppState>().updateIndex(2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PageOfPage()),
                  );
                },
                child: const Text('New Input'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: style,
                onPressed: () {
                  //Provider.of<MyAppState>(context,listen: false,).updateIndex(3);
                  context.read<MyAppState>().updateIndex(3);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PageOfPage()),
                  );
                },
                child: const Text('Settings'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: style,
                onPressed: () {
                  debugPrint("Exit");
                },
                child: const Text('Exit'),
              ),
            ],
          ),
        ),
     
    );
  }
}
