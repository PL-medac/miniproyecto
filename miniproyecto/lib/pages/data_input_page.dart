import 'package:flutter/material.dart';
import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/providers/theme_provider.dart';
import 'package:provider/provider.dart';

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
    // Obtener el ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.themeMode == ThemeMode.dark ? themeProvider.darkTheme : themeProvider.lightTheme;

    // Extraer los colores del tema actual
    final backgroundColor = theme.scaffoldBackgroundColor;
    final textColor = theme.brightness == Brightness.dark ? Colors.white : Colors.black;
    final iconColor = theme.iconTheme.color ?? Colors.black;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                // Nombre del Medicamento
                _buildTextField(label: S.of(context).name_med, textColor: textColor),
                SizedBox(height: 15),

                // Número de Registro
                _buildTextField(
                  label: S.of(context).num_reg,
                  readOnly: true,
                  hintText: S.of(context).num_reg,
                  textColor: textColor,
                ),
                SizedBox(height: 15),

                // Categoría
                _buildDropdown(
                  label: S.of(context).category,
                  items: [
                  S.of(context).category1,
                  S.of(context).category2,
                  S.of(context).category3,
                  ],
                  textColor: textColor,
                ),
                SizedBox(height: 15),

                // Fecha de Caducidad
                TextFormField(
                  controller: _dateController,
                  decoration: InputDecoration(
                  labelText: S.of(context).expiration_date,
                  suffixIcon: Icon(Icons.calendar_today, color: iconColor),
                  labelStyle: TextStyle(color: textColor),
                  ),
                  readOnly: true,
                  onTap: () => _seleccionarFecha(context),
                ),
                SizedBox(height: 15),

                // Fecha de Creación
                _buildTextField(
                  label: S.of(context).creation_date,
                  readOnly: true,
                  hintText: "01/04/2025",
                  textColor: textColor,
                ),
                SizedBox(height: 15),

                // Laboratorio
                Row(
                  children: [
                  Expanded(
                  child: _buildDropdown(
                  label: S.of(context).laboratory,
                  items: ["Lab A", "Lab B", "Lab C"],
                  textColor: textColor,
                  ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_box_rounded),
                  color: iconColor,
                  ),
                  ],
                ),
                SizedBox(height: 15),

                // Dirección y CIF
                Row(
                  children: [
                  Expanded(
                  child: _buildTextField(
                  label: S.of(context).cif,
                  readOnly: true,
                  textColor: textColor,
                  ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                  child: _buildTextField(
                  label: S.of(context).address,
                  readOnly: true,
                  textColor: textColor,
                  ),
                  ),
                  ],
                ),
                SizedBox(height: 15),

                // Precio y Stock
                Row(
                  children: [
                  Expanded(
                  child: _buildTextField(label: S.of(context).price, textColor: textColor),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                  child: _buildTextField(label: S.of(context).stock, textColor: textColor),
                  ),
                  ],
                ),
                SizedBox(height: 15),

                // Imagen
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text(
                  S.of(context).image,
                  style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                  ),
                  ),
                  SizedBox(width: 10),
                  SizedBox(
                  width: 200,
                  height: 150,
                  child: Container(
                  decoration: BoxDecoration(
                    color: theme.brightness == Brightness.dark ? Colors.grey[800] : Colors.grey[300],
                    border: Border.all(color: textColor),
                  ),
                  child: Image.asset('', fit: BoxFit.contain),
                  ),
                  ),
                  IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add_a_photo),
                  color: iconColor,
                  ),
                  ],
                ),
                SizedBox(height: 15),

                // Botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  _buildButton(
                  label: S.of(context).nuevo,
                  color: theme.brightness == Brightness.dark ? Color.fromARGB(255, 68, 51, 67) : Colors.blue,
                  ),
                  SizedBox(width: 10),
                  _buildButton(
                  label: S.of(context).edit,
                  color: theme.brightness == Brightness.dark ? Color.fromARGB(255, 68, 51, 67): Colors.blue,
                  ),
                  SizedBox(width: 10),
                  _buildButton(
                  label: S.of(context).save,
                  color: theme.brightness == Brightness.dark ? Color.fromARGB(255, 68, 51, 67) : Colors.blue,
                  ),
                  SizedBox(width: 10),
                  _buildButton(
                  label: S.of(context).delete,
                  color: theme.brightness == Brightness.dark ? Color.fromARGB(255, 68, 51, 67) : Colors.blue,
                  ),
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
    required Color textColor,
  }) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        labelStyle: TextStyle(color: textColor),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: textColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: textColor),
        ),
      ),
      readOnly: readOnly,
    );
  }

  // Método reutilizable para Dropdowns
  Widget _buildDropdown({
    required String label,
    required List<String> items,
    required Color textColor,
  }) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: textColor),
      ),
      items: items
          .map((item) => DropdownMenuItem(value: item, child: Text(item, style: TextStyle(color: textColor))))
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
