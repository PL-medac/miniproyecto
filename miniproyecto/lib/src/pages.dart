import 'package:flutter/material.dart';
import 'package:miniproyecto/src/home.dart';
import 'package:provider/provider.dart';

class PageOfPage extends StatefulWidget {
  const PageOfPage({super.key});
  @override
  State<PageOfPage> createState() => _PageOfPageState();
}

class _PageOfPageState extends State<PageOfPage> {
  @override
  Widget build(BuildContext context) {
    var selectedIndex = Provider.of<MyAppState>(context).selectedIndex;
    Widget page;
    switch (selectedIndex) {
      case 0: //home. Se agrega un valor váliso para evitar error
        page = Container(); // ⬅️ No mostramos ninguna pantalla aquí
        break;
      case 1: //crud
        page = StockPage();
        break;
      case 2: //input
        page = DataInputPage();
        break;
      case 3: //setting
        page = SettingsPage();
        break;
      case 4: //exit
        Navigator.pop(context);
        return Scaffold(); // Devolvemos un Scaffold vacío

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    // Para el fondo de pantalla y el cambio de pestañas:
    var mainArea = ColoredBox(
      color: Color.fromARGB(255, 238, 248, 246),
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            // Use a more mobile-friendly layout with BottomNavigationBar
            // on narrow screens.

            return Column(
              children: [
                Expanded(
                  child: mainArea,
                  //aquí el contenido de las pág
                ),
                SafeArea(
                  child: BottomNavigationBar(
                    backgroundColor: Color.fromARGB(255, 10, 40, 50),
                    items: [
                      
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home, 
                        color: Colors.white),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.assessment_outlined,
                          color: Colors.white,
                        ),
                        label: 'BBDD',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add_box_outlined, color: Colors.white),
                        label: 'Data Input',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings, color: Colors.white),
                        label: 'Settings',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.exit_to_app, color: Colors.white),
                        label: 'Exit',
                        
                      ),
                    ],
                    currentIndex: selectedIndex,
                    selectedItemColor: Color.fromARGB(255, 7, 219, 194),
                    unselectedItemColor: Colors.white,
                    
                    onTap: (selectedIndex) {
                      final myAppState = Provider.of<MyAppState>(
                        context,
                        listen: false,
                      );
                      if (selectedIndex == 0) {
                        // Navegar a Home + eliminar todo el historial
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ), 
                          (route) =>
                              false, 
                        );
                      } else {
                        setState(() {
                          myAppState.selectedIndex = selectedIndex;
                        });
                        if (selectedIndex != 4) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageOfPage(),
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    //para estrecha la barra, pero no me convence:
                    //minWidth: 56,
                    //groupAlignment: -1,
                    backgroundColor: Color.fromARGB(255, 10, 40, 50),
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home, color: Colors.white),
                        label: Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.assessment_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          'BBDD',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_box_outlined, color: Colors.white),
                        label: Text(
                          'Data Input',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings, color: Colors.white),
                        label: Text(
                          'Settings',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.exit_to_app, color: Colors.white),
                        label: Text(
                          'Exit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    
                    onDestinationSelected: (selectedIndex) {
                      final myAppState = Provider.of<MyAppState>(
                        context,
                        listen: false,
                      );
                      if (selectedIndex == 0) {
                        // Navegar a Home + eliminar todo el historial
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyHomePage(),
                          ), 
                          (route) =>
                              false, // Elimina todas las pantallas anteriores
                        );
                      } else {
                        setState(() {
                          myAppState.selectedIndex = selectedIndex;
                        });

                        if (selectedIndex != 4) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageOfPage(),
                            ),
                          );
                        } else {
                          Navigator.pop(context);
                        }
                      }
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

class StockPage extends StatefulWidget {
  const StockPage({super.key});
  @override
  State<StockPage> createState() => _StockPage();
}

class _StockPage extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.favorite),
        label: Text('Like'),
      ),
    );
  }
}

class DataInputPage extends StatefulWidget {
  const DataInputPage({super.key});
  @override
  State<DataInputPage> createState() => _DataInputPage();
}

class _DataInputPage extends State<DataInputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.favorite),
        label: Text('Hate'),
      ),
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(Icons.favorite),
        label: Text('Love'),
      ),
    );
  }
}
