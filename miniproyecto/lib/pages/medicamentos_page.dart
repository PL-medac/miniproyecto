import 'package:flutter/material.dart';
import 'package:miniproyecto/generated/l10n.dart';

class MedicamentosStockPage extends StatelessWidget {
  // Lista de medicamentos con parámetros predefinidos, cargar aqui los medicamentos desde la base de datos
  final List<Map<String, String>> medicamentos = [
    {
      'nombre': 'Paracetamol',
      'stock': '50',
      'fecha_expiracion': '2025-06-01',
      'precio': '5.00 €',
      'categoria': 'Analgésico',
      'laboratorio': 'Laboratorios X',
      'imagen': '../../assets/medicamento.png',
    },
    {
      'nombre': 'Ibuprofeno',
      'stock': '30',
      'fecha_expiracion': '2025-05-15',
      'precio': '7.00 €',
      'categoria': 'Antiinflamatorio',
      'laboratorio': 'Laboratorios Y',
      'imagen': '../../assets/medicamento.png',
    },
    {
      'nombre': 'Amoxicilina',
      'stock': '20',
      'fecha_expiracion': '2025-07-10',
      'precio': '10.00 €',
      'categoria': 'Antibiótico',
      'laboratorio': 'Laboratorios Z',
      'imagen': '../../assets/medicamento.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).page1)),
      body: ListView.builder(
        itemCount: medicamentos.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              contentPadding: EdgeInsets.all(
                10,
              ), // Espaciado alrededor del contenido
              leading:
                  medicamentos[index]['imagen']!.isEmpty
                      ? Icon(
                        Icons.medical_services,
                        size: 100, // Ajusta el tamaño del ícono
                      )
                      : Image.asset(
                        medicamentos[index]['imagen']!,
                        height: 100, // Ajusta la altura de la imagen
                        width: 100, // Ajusta el ancho de la imagen
                      ),
              title: Text(
                medicamentos[index]['nombre']!,
                style: TextStyle(
                  fontSize: 22, // Tamaño de fuente más grande
                  fontWeight: FontWeight.bold, // Texto en negrita
                ),
              ),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${S.of(context).stock}: ${medicamentos[index]['stock']}'),
                        Text(
                          '${S.of(context).expiration_date}: ${medicamentos[index]['fecha_expiracion']}',
                        ),
                        Text('${S.of(context).price}: ${medicamentos[index]['precio']}'),
                        Text('${S.of(context).category}: ${medicamentos[index]['categoria']}'),
                        Text(
                          '${S.of(context).laboratory}: ${medicamentos[index]['laboratorio']}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
