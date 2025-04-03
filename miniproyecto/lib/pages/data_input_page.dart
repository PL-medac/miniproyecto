import 'package:flutter/material.dart';

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
