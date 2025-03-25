import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './src/navigation.dart';
import 'package:provider/provider.dart';
import './src/crud.dart';
import './src/dashboard.dart';
import './src/dataInput.dart';
import './src/settings.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //para asegurar q flutter esté correctamente inicializado

  await dotenv.load(
    fileName: ".env",
  ); //caga var entorno desde .env (para info sensible)

  String supabaseUrl = dotenv.env['SUPABASE_URL'] ?? ''; //URL
  String supabaseAnonKey =
      dotenv.env['SUPABASE_ANON_KEY'] ??
      ''; //obtiene clave anónima de supabase desde el archivo .env

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  ); //inicializa conexión con supabase

  runApp(MyApp());
}
