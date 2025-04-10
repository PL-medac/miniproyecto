import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:miniproyecto/providers/auth_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/navigation/navigation_screen.dart';
import 'screens/auth/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //para asegurar q flutter esté correctamente inicializado

  await dotenv.load( //carga var entorno desde .env (para info sensible)
    fileName: ".env",
  ); 

  final supabaseUrl = dotenv.env['SUPABASE_URL'] ?? ''; //URL
  final supabaseAnonKey =
      dotenv.env['SUPABASE_ANON_KEY'] ??
      ''; //obtiene clave anónima de supabase desde el archivo .env

  if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
    throw Exception(
      "SUPABASE_URL o SUPABASE_ANON_KEY no están configurados en el archivo .env",
    );
  }

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  ); //inicializa conexión con supabase

  runApp(MyApp());
}
