
import 'package:flutter/material.dart';
import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../../pages/medicamentos_page.dart';
import '../../pages/data_input_page.dart';
import '../../pages/settings_page.dart';

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
        backgroundColor: Color(0xFF248F8D), // Nuevo color aplicado

        title: Image.asset(
          "assets/logo.png", // Ruta de la imagen en assets
          height: 50, // Ajusta el tamaño según sea necesario
        ),

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
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    backgroundColor: Color(0xFF494949),
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home, color: Colors.white),
                        label: S.of(context).home,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.assessment_outlined,
                          color: Colors.white,
                        ),
                        label: S.of(context).page1,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.add_box_outlined, color: Colors.white),
                        label: S.of(context).page2,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings, color: Colors.white),
                        label: S.of(context).page3,
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.exit_to_app, color: Colors.white),
                        label: S.of(context).exit,
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
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                          (route) => false,
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
                    backgroundColor: Color(0xFF494949),
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home, color: Colors.white),
                        label: Text(
                          S.of(context).home,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.assessment_outlined,
                          color: Colors.white,
                        ),
                        label: Text(
                          S.of(context).page1,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.add_box_outlined, color: Colors.white),
                        label: Text(
                          S.of(context).page2,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.settings, color: Colors.white),
                        label: Text(
                          S.of(context).page3,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.exit_to_app, color: Colors.white),
                        label: Text(
                          S.of(context).exit,
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
                          MaterialPageRoute(builder: (context) => MyHomePage()),
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

class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MedicamentosStockPage());
  }
}
