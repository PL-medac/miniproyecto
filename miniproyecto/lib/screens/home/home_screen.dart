import 'package:miniproyecto/repository/auth_service.dart';
import 'package:miniproyecto/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PharmaStock',
        theme: ThemeData(
          primaryColor: Color(0xFF085F63),
          scaffoldBackgroundColor: Color.fromARGB(255, 240, 245, 249),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF085F63),
            foregroundColor: Colors.white,
          ),
        ),
        home: const LoginPage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  int selectedIndex = 0;

  void updateIndex(int newIndex) {
    selectedIndex = newIndex;
    notifyListeners(); // notifica los widgets dependientes
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF248F8D),

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

      body: ListView(

        children: [
          // Espacio arriba del logo
          SizedBox(height: 75),

          // Logo encima de los enlaces
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              "assets/portada.png", // Ruta de la imagen en assets
              height: 200, // Ajusta el tamaño del logo según sea necesario
            ),
          ),

          // Espacio debajo del logo
          SizedBox(height: 15),

          // Botones de navegación
          ElevatedButtonExample(),

          // Espacio para separar el contenido del footer
          Spacer(), // Esto empuja el footer hacia abajo
          
          // Footer básico
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 10),
          //   color: Colors.grey[200], // Color de fondo del footer
          //   child: Center(
          //     child: Text(
          //       '© 2025 PharmaStock - Todos los derechos reservados',
          //       style: TextStyle(color: Colors.black54, fontSize: 14),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class ElevatedButtonExample extends StatelessWidget {
  const ElevatedButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: const Color.fromARGB(255, 23, 109, 97),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 18),
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

              child: const Text('Listado Medicamentos'),

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

              child: const Text('Gestión CRUD'),

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

              child: const Text('Ajustes'),

            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: style,

              onPressed: () async {
                final authservice = AuthService();
                await authservice.signOut();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false,
                );
              },
              child: const Text('Exit'),

            ),
          ],
        ),
      ),
    );
  }
}
