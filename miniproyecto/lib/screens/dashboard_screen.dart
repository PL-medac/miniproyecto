import 'package:flutter/material.dart';
import 'package:miniproyecto/screens/home_screen.dart';
import 'package:provider/provider.dart';
import '../pages/medicamentos_pages.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MedicamentosStockPage());
  }
}

class DataInputPage extends StatefulWidget {
  const DataInputPage({super.key});
  @override
  State<DataInputPage> createState() => _DataInputPage();
}

class _DataInputPage extends State<DataInputPage> {
  DateTime? selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nombre del Medicamento
                _buildTextField(label: "Nombre del medicamento"),
                SizedBox(height: 15),

                // Número de Registro
                _buildTextField(
                  label: "Número de registro",
                  readOnly: true,
                  hintText: "Nº Registro",
                ),
                SizedBox(height: 15),

                // Categoría
                _buildDropdown(
                  label: "Categoría",
                  items: ["Analgésico", "Antibiótico", "Antiinflamatorio"],
                ),
                SizedBox(height: 15),

                // Fecha de Caducidad
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    labelText: "Fecha de caducidad",
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  readOnly: true,
                  onTap: () => _seleccionarFecha(context),
                ),
                SizedBox(height: 15),

                // Fecha de Creación
                _buildTextField(
                  label: "Fecha de creación",
                  readOnly: true,
                  hintText: "01/04/2025",
                ),
                SizedBox(height: 15),

                // Laboratorio
                Row(
                  children: [
                    Expanded(
                      child: _buildDropdown(
                        label: "Laboratorio",
                        items: ["Lab A", "Lab B", "Lab C"],
                      ),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_box_rounded),
                      color: Color(0xFF494949),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Dirección y CIF
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(label: "CIF", readOnly: true),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(
                        label: "Dirección",
                        readOnly: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Precio y Stock
                Row(
                  children: [
                    Expanded(child: _buildTextField(label: "Precio")),
                    SizedBox(width: 10),
                    Expanded(child: _buildTextField(label: "Stock")),
                  ],
                ),
                SizedBox(height: 15),

                // Imagen
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Imagen',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 200,
                      height: 150,
                      child: Image.asset('', fit: BoxFit.contain),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.add_a_photo),
                      color: Color(0xFF494949),
                    ),
                  ],
                ),
                SizedBox(height: 15),

                // Botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _buildButton(label: "Nuevo", color: Color(0xFF494949)),
                    SizedBox(width: 10),
                    _buildButton(label: "Editar", color: Color(0xFF494949)),
                    SizedBox(width: 10),
                    _buildButton(label: "Guardar", color: Color(0xFF494949)),
                    SizedBox(width: 10),
                    _buildButton(label: "Borrar", color: Color(0xFF494949)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método reutilizable para TextFields
  Widget _buildTextField({
    required String label,
    bool readOnly = false,
    String? hintText,
  }) {
    return TextFormField(
      decoration: InputDecoration(labelText: label, hintText: hintText),
      readOnly: readOnly,
    );
  }

  // Método reutilizable para Dropdowns
  Widget _buildDropdown({required String label, required List<String> items}) {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: label),
      items:
          items
              .map((item) => DropdownMenuItem(value: item, child: Text(item)))
              .toList(),
      onChanged: (value) {},
    );
  }

  // Método reutilizable para botones
  Widget _buildButton({required String label, required Color color}) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
      ),
      child: Text(label),
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
