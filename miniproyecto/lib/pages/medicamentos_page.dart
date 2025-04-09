import 'package:flutter/material.dart';
import 'package:miniproyecto/generated/l10n.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MedicamentosStockPage extends StatefulWidget {
  @override
  State<MedicamentosStockPage> createState() => _MedicamentosStockPageState();
}

class _MedicamentosStockPageState extends State<MedicamentosStockPage> {
  // Lista de medicamentos con parámetros predefinidos, cargar aqui los medicamentos desde la base de datos
  List<dynamic> medicamentos = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMedicamentos();
  }

  Future<void> fetchMedicamentos() async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('products').select();
    setState(() {
      medicamentos = response;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).page1)),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                itemCount: medicamentos.length,
                itemBuilder: (context, index) {
                  final item = medicamentos[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(
                        10,
                      ), // Espaciado alrededor del contenido
                      leading:Icon(
                                Icons.medical_services,
                                size: 100, // Ajusta el tamaño del ícono
                              ),
                              title : Text(
                              /*Image.asset(
                                medicamentos[index]['imagen']!,
                                height: 100, // Ajusta la altura de la imagen
                                width: 100, // Ajusta el ancho de la imagen
                              ),*/
                              item['name']?? 'Sin nombre',
                              style: const TextStyle(
                                fontSize: 22, // Tamaño de fuente más grande
                                fontWeight: FontWeight.bold, // Texto en negrita
                              ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                                Text(
                                  '${S.of(context).stock}: ${medicamentos[index]['stock']}',
                                ),
                                Text(
                                  '${S.of(context).expiration_date}: ${medicamentos[index]['expiration_date']}',
                                ),
                                Text(
                                  '${S.of(context).price}: ${medicamentos[index]['price']}',
                                ),
                                Text(
                                  '${S.of(context).category}: ${medicamentos[index]['id_category']}',
                                ),
                                Text(
                                  '${S.of(context).laboratory}: ${medicamentos[index]['id_laboratory']}',
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
