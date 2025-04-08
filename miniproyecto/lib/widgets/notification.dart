import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class NotificationS extends StatelessWidget {
  const NotificationS({super.key});

  @override
  Widget build(BuildContext context) {
    final stream = Supabase.instance.client
        .from('products')
        .stream(primaryKey: ['id'])
        .lt('stock', 100);

    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: stream,
      builder: (context, snapshot) {
        final count = snapshot.data?.length ?? 0;

        return Stack(
          children: [
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        title: const Text("¡Alerta de Stock!"),
                        content:
                            snapshot.hasData && snapshot.data!.isNotEmpty
                                ? Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children:
                                      snapshot.data!
                                          .map(
                                            (item) => ListTile(
                                              title: Text(item['name']),
                                              subtitle: Text(
                                                "Stock: ${item['stock']}",
                                              ),
                                            ),
                                          )
                                          .toList(),
                                )
                                : const Text("Todo en orden"),
                      ),
                );
              },
              icon: const Icon(Icons.email),
            ),
            if (count > 0)
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '$count',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ),
          ],
        );
      },
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
