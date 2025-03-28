/*import 'package:flutter/material.dart';

class DataInputPage extends StatefulWidget {
  const DataInputPage({super.key});
  @override
  State<DataInputPage> createState() => _DataInputPage();
}

class _DataInputPage extends State<DataInputPage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    
    Widget page;
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
    }

    // Para el navegador, que se coloree
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
                
                
                ),
                SafeArea(
                  child: BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.assessment_outlined),
                        label: 'BBDD',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add_box_outlined),
                        label: 'Data Input',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.exit_to_app),
                        label: 'Exit',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
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
                    
                    backgroundColor: Color.fromARGB(255, 10, 40, 50),
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home, color: Colors.white,),
                        label: Text('Home', style: TextStyle(color: Colors.white)),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.assessment_outlined, color: Colors.white,),
                        label: Text('BBDD', style: TextStyle(color: Colors.white)),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_box_outlined, color: Colors.white,),
                        label: Text('Data Input', style: TextStyle(color: Colors.white)),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings, color: Colors.white,),
                        label: Text('Settings', style: TextStyle(color: Colors.white)),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.exit_to_app, color: Colors.white,),
                        label: Text('Exit', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
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
*/