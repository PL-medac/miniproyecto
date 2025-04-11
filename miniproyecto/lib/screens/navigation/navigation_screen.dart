// IMPORTS
import 'package:flutter/material.dart';
import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/screens/home/home_screen.dart';
import 'package:provider/provider.dart';
import '../../pages/crud/medicamentos_page.dart';
import '../../pages/crud/data_input_page.dart';
import '../../pages/settings/settings_page.dart';
// -------------------------------------------------------------------------------------------------------------------------------------------------------------------


/// Widget de estado completo que representa una página dentro de la navegación.
class PageOfPage extends StatefulWidget {
  const PageOfPage({super.key});
  @override
  State<PageOfPage> createState() => _PageOfPageState();
}

class _PageOfPageState extends State<PageOfPage> {
  @override
  Widget build(BuildContext context) {
    var selectedIndex = Provider.of<MyAppState>(context).selectedIndex; // Obtiene el índice de la pestaña seleccionada
    var brightness = Theme.of(context).brightness; // Detecta el modo de tema

    /// Muestra una página según el índice seleccionado o realiza una acción específica.
    Widget page;
    switch (selectedIndex) {
      case 0: // Se agrega un valor válido para evitar error
        page = Container(); // ⬅️ No mostramos ninguna pantalla aquí
        break;
      case 1: // Listado Medicamentos
        page = StockPage();
        break;
      case 2: // CRUD
        page = DataInputPage();
        break;
      case 3: // Ajustes
        page = SettingsPage();
        break;
      case 4: // Cerrar sesion 
        Navigator.pop(context);
        return Scaffold(); // Devolvemos un Scaffold vacío

      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }


    // Fondo principal que cambia dependiendo del tema
    var mainArea = ColoredBox(
      color:
          brightness == Brightness.dark
              ? Colors.black // Fondo oscuro
              : Color.fromARGB(255, 238, 248, 246), // Fondo claro
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200), // Duración de la animación
        child: page,
      ),
    );

    // Scaffold que contiene el AppBar y el cuerpo principal
    return Scaffold(

      // AppBar con imagen y botón de notificaciones
      appBar: AppBar(
        backgroundColor:
            brightness == Brightness.dark
                ? const Color(0xFF1E1E1E) // Tema oscuro
                : Color(0xFF248F8D), // Tema claro
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
              icon: Icon(
                Icons.email,
                color:
                    brightness == Brightness.dark
                        ? Colors.white
                        : const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ), // Ícono acorde al tema
              ),
            ),
          ),
        ],
      ),


      // Cuerpo principal que cambia según el tamaño de la pantalla
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    /// Establece el color de fondo de la barra de navegación inferior según el modo (oscuro o claro).
                    backgroundColor:
                        brightness == Brightness.dark
                            ? Colors.black
                            : Color(0xFF494949),
                    items: [

                      /// Elemento de la barra de navegación inferior que representa la pantalla de inicio.
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: S.of(context).home,
                      ),

                      /// Elemento de la barra de navegación inferior que representa la pantalla de medicamentos.
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.assessment_outlined,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: S.of(context).page1,
                      ),

                      /// Elemento de la barra de navegación inferior que representa la pantalla de CRUD.
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.add_box_outlined,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: S.of(context).page2,
                      ),

                      /// Elemento de la barra de navegación inferior que representa la pantalla de ajustes.
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: S.of(context).page3,
                      ),

                      /// Elemento de la barra de navegación inferior que representa la acción de cerrar sesión.
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.exit_to_app,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: S.of(context).exit,
                      ),

                    ],

                    /// Establece el índice seleccionado de la barra de navegación inferior.
                    currentIndex: selectedIndex, // ⬅️ Índice seleccionado
                    selectedItemColor: Color.fromARGB(255, 7, 219, 194), // ⬅️ Color de selección
                    unselectedItemColor: // ⬅️ Color no seleccionado
                        brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,

                    /// Maneja la navegación según el índice seleccionado, actualizando el estado o navegando entre pantallas.
                    onTap: (selectedIndex) {
                      final myAppState = Provider.of<MyAppState>(
                        context,
                        listen: false,
                      );
                      if (selectedIndex == 0) {
                        Navigator.pushAndRemoveUntil( // Eliminar todo el historial
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()), // Navegar a Home 
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
                              builder: (context) => PageOfPage(), // Navegar a la página correspondiente
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
                    backgroundColor:
                        brightness == Brightness.dark
                            ? Color(0xFF121214) // Tema oscuro
                            : Color(0xFF93C8BF), // Tema claro 
                    extended: constraints.maxWidth >= 600,
                    destinations: [

                      /// Elemento de la barra de navegación lateral que representa la pantalla de inicio.
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.home,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: Text(
                          S.of(context).home,
                          style: TextStyle(
                            color:
                                brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),

                      /// Elemento de la barra de navegación lateral que representa la pantalla de medicamentos.
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.assessment_outlined,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: Text(
                          S.of(context).page1,
                          style: TextStyle(
                            color:
                                brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),

                      /// Elemento de la barra de navegación lateral que representa la pantalla de CRUD.
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.add_box_outlined,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: Text(
                          S.of(context).page2,
                          style: TextStyle(
                            color:
                                brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),

                      /// Elemento de la barra de navegación lateral que representa la pantalla de ajustes.
                      NavigationRailDestination(
                        icon: Icon(
                          Icons.settings,
                          color:
                              brightness == Brightness.dark
                                  ? Colors.white
                                  : Colors.black,
                        ),
                        label: Text(
                          S.of(context).page3,
                          style: TextStyle(
                            color:
                                brightness == Brightness.dark
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    ],


                    selectedIndex: selectedIndex, // ⬅️ Índice seleccionado
                    onDestinationSelected: (selectedIndex) {
                      final myAppState = Provider.of<MyAppState>(
                        context,
                        listen: false,
                      );
                      if (selectedIndex == 0) {
                        Navigator.pushAndRemoveUntil( // Eliminar todo el historial
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()), // Navegar a Home 
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

/// Un widget sin estado que muestra la página MedicamentosStockPage dentro de un Scaffold.
class StockPage extends StatelessWidget {
  const StockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MedicamentosStockPage());
  }
}
