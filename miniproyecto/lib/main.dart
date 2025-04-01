import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:miniproyecto/auth/auth_gate.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'screens/dashboard_screen.dart';
import 'screens/login_screen.dart';



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

}
