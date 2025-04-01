import 'package:flutter/material.dart';
import 'package:miniproyecto/auth/auth_service.dart';
import 'package:miniproyecto/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final authService = AuthService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    try {
      await authService.signInWithEmailPassword(email, password);
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
    // TODO: implement build
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: "Email"),
          ),

          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: "Contraseña"),
          ),

          ElevatedButton(onPressed: login, child: const Text("Login")),

          // Register Page link
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                ),
            child: const Center(
              child: Text("¿No tienes una cuenta? Registrate"),
            ),
          ),
        ],
      ),
    );
  }
}
