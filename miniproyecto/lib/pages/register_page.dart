import 'package:flutter/material.dart';
import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/repository/auth_service.dart';
import 'dart:ui'; // Necesario para el BackdropFilter


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final Color primaryColor = const Color(0xFF248F8D);

  void singUp() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    // Validar misma contraseña
    if (password != confirmPassword) {
      ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(content: Text(S.of(context).notmatch)),
      );
      return;
    }

    try {
      await authService.signUpWithEmailPassword(email, password);
      Navigator.pop(context);
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
          // Fondo con la imagen desenfocada
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
                color: Colors.black.withOpacity(0.7), // Opacidad para mejorar contraste
              ),
            ),
          ),
          // Contenido principal
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset(
                    'assets/portada.png',
                    height: 120,
                  ),
                  const SizedBox(height: 20),

                  Text(
                     S.of(context).registration,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
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
                        labelStyle: TextStyle(color: Colors.white), // Etiqueta blanca
                        prefixIcon: Icon(Icons.email_outlined, color: primaryColor),
                        filled: true, // Fondo
                        fillColor: Colors.transparent, // Fondo transparente
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white), // Borde blanco
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white), // Borde blanco
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: primaryColor), // Borde color primario
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
                        labelText:  S.of(context).password,
                        labelStyle: TextStyle(color: Colors.white), // Etiqueta blanca
                        prefixIcon: Icon(Icons.lock_outline, color: primaryColor),
                        filled: true, // Fondo
                        fillColor: Colors.transparent, // Fondo transparente
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white), // Borde blanco
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white), // Borde blanco
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: primaryColor), // Borde color primario
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Texto blanco
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Confirm Password input
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5, // 50% width
                    child: TextField(
                      controller: _confirmPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: S.of(context).passwconfirm,
                        labelStyle: TextStyle(color: Colors.white), // Etiqueta blanca
                        prefixIcon: Icon(Icons.lock_outline, color: primaryColor),
                        filled: true, // Fondo
                        fillColor: Colors.transparent, // Fondo transparente
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white), // Borde blanco
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.white), // Borde blanco
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: primaryColor), // Borde color primario
                        ),
                      ),
                      style: TextStyle(color: Colors.white), // Texto blanco
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Register button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.3, // 30% width
                    padding: const EdgeInsets.symmetric(vertical: 12), // Padding vertical
                    child: ElevatedButton(
                      onPressed: singUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 20), // Más padding para el botón
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        S.of(context).signup,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Navigate to login page
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // Navigate back to login page
                    },
                    child: Text(
                      S.of(context).no_login,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: primaryColor,
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
