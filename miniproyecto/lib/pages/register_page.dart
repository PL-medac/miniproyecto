import 'package:flutter/material.dart';
import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/repository/auth_service.dart';

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

  void singUp() async {
    final email = _emailController.text;
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
      appBar: AppBar(title:  Text(S.of(context).registration)),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        children: [
          TextField(
            controller: _emailController,
            decoration:  InputDecoration(labelText: S.of(context).email),
          ), // Email

          TextField(
            controller: _passwordController,
            decoration:  InputDecoration(labelText: S.of(context).password),
          ), // Password

          TextField(
            controller: _confirmPasswordController,
            decoration:  InputDecoration(
              labelText: S.of(context).passwconfirm,
            ),
          ), // Confirm Password

          ElevatedButton(onPressed: singUp, child:  Text( S.of(context).signup)),

          // Register Page link
          GestureDetector(
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                ),
            child: Center(
              child: Text(S.of(context).no_signup),
            ),
          ),
        ],
      ),
    );
  }
}
