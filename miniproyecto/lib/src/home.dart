import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:miniproyecto/src/dataInput.dart';
import 'package:miniproyecto/src/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './crud.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PharmaStock',
        theme: ThemeData(primaryColor: Color.fromARGB(255, 5, 157, 149)),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  //funciones de la lógica
  //notifyListeners();
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    //var colorScheme = Theme.of(context).colorScheme;

    /*Widget page;
    switch (selectedIndex) {
      case 0: //login
        page = Placeholder();
        break;
      case 1: //home
        page = Placeholder();
        break;
      case 2: //crud
        page = Placeholder();
        break;
      case 3: //input
        page = Placeholder();
        break;
      case 4: //setings
        page = Placeholder();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }*/

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 133, 214, 204),
          /*
        Intento de poner imagen del logo:
          title: Image.asset(
            "assets/logo.pdf",  
            height: 40,
          ),*/
          title: Text("PharmaStock"),
          centerTitle: true,
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 16.0),
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
      ),
    );
  }
}

class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State<ElevatedButtonExample> createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 23, 109, 97),
      foregroundColor: Colors.white,
      textStyle: const TextStyle(fontSize: 30, color: Colors.white),
      minimumSize: const Size(400, 70),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10), // Margen lateral
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StockPage()),
                  );
                },
                child: const Text('Stock'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DataInputPage()),
                  );
                },
                child: const Text('New'),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
                child: const Text('Settings'),
              ),
              const SizedBox(height: 30),
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
      ),
    );
  }
}
          
          
         /* 
          (
            onPressed: (){}, 
            child: Text("Stock")
        ),
        
        ElevatedButton(
            onPressed: (){}, 
            child: Text("Input")
        ),

        ElevatedButton(
            onPressed: (){}, 
            child: Text("Settings")
        ),

        ElevatedButton(
            onPressed: (){}, 
            child: Text("Exit")
      ),
      ),
    ),
    );
  }
}

*/