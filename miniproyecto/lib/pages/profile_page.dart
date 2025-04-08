import 'package:flutter/material.dart';
import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/repository/auth_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final authService = AuthService();

  void logout() async {
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(S.of(context).profile),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout)),
        ],
      ),
    );
  }
}
