import 'package:miniproyecto/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:miniproyecto/repository/auth_service.dart';
import 'package:miniproyecto/screens/auth/register_screen.dart';
import 'package:miniproyecto/screens/home/home_screen.dart';
import 'dart:ui'; // Necesario para el BackdropFilter

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

 // Colores definidos para modo claro y oscuro
  Color get primaryColor {
    final theme = Theme.of(context);
    return theme.brightness == Brightness.dark
        ? const Color.fromARGB(255, 116, 67, 112)  // Color para modo oscuro
        : const Color(0xFF248F8D);  // Color para modo claro (puedes cambiarlo a otro color)
  }

  void login() async {
    final email = _emailController.text;

    final password = _passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);

      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const MyHomePage()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Error: $e")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagen de fondo desenfocada
          Positioned.fill(
            child: Image.asset(
              'assets/fondo.png', // Asegúrate de tener la imagen en assets
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0), // Desenfoque
              child: Container(
                color: Colors.black.withOpacity(
                  0.8,
                ), // Opacidad para mejorar contraste
              ),
            ),
          ),
          // El contenido del login
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    // Logo
                    Image.asset(
                    Theme.of(context).brightness == Brightness.dark
                      ? 'assets/logo.png'
                      : 'assets/portada.png',
                    height: 120,
                    ),
                    const SizedBox(height: 20),

                   Text(
                    S.of(context).login,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                      shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0), // Slight offset
                        blurRadius: 4.0, // Blur effect
                        color: Colors.black, // Black shadow
                      ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                    ),
                  const SizedBox(height: 40),

                  // Email input
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5, // 50% width
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: S.of(context).email,
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ), // Etiqueta blanca
                        prefixIcon: Icon(
                          Icons.email_outlined,
                          color: primaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ), // Borde blanco
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ), // Borde blanco cuando está habilitado
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ), // Borde al enfocar (color primario)
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Texto blanco
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password input
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5, // 50% width
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: S.of(context).password,
                        labelStyle: TextStyle(
                          color: Colors.white,
                        ), // Etiqueta blanca
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: primaryColor,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ), // Borde blanco
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ), // Borde blanco cuando está habilitado
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: primaryColor,
                          ), // Borde al enfocar (color primario)
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Texto blanco
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Login button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3, // 30% width
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ), // Padding vertical en el contenedor
                    child: ElevatedButton(
                      onPressed: login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          vertical: 20,
                        ), // Más padding vertical para el botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        S.of(context).login,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Register page link
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const RegisterPage()),
                      );
                    },
                     child: Text(
                      S.of(context).no_signup,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: primaryColor,
                      fontSize: 16, // Increased font size
                       shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0), // Slight offset
                        blurRadius: 4.0, // Blur effect
                        color: Colors.black, // Black shadow
                      ),
                      ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
