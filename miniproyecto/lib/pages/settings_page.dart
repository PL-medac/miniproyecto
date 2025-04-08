import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:miniproyecto/repository/auth_service.dart';
import 'package:miniproyecto/screens/login/login_screen.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = true;
  bool valNotify2 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: ListView(
        children: [
          SizedBox(height: 10),

          Row(
            children: [
              Icon(Icons.account_circle_sharp),
              SizedBox(width: 10),
              Text(
                S.of(context).account,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Divider(height: 20, thickness: 1),
          SizedBox(height: 10),
          buildAccountOption(context, S.of(context).passwchange),
          buildAccountOption(context, S.of(context).language),
          buildAccountOption(context, S.of(context).privacy),
          SizedBox(height: 40),
          Row(
            children: [
              Icon(Icons.volume_up_rounded),
              SizedBox(width: 10),
              Text(
                S.of(context).notif,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Divider(height: 20, thickness: 1),
          SizedBox(height: 10),
          buildNotificationOption(
            S.of(context).theme,
            valNotify1,
            onChangeFunction1,
          ),
          buildNotificationOption(
            S.of(context).act_notif,
            valNotify2,
            onChangeFunction2,
          ),
          SizedBox(height: 50),

          
         Center(
  child: OutlinedButton(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    onPressed: () async {
      final authservice = AuthService();
      await authservice.signOut();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
        (route) => false,
      );
    },
    child: Text(
            S.of(context).exit,
      style: TextStyle(
        fontSize: 16,
        letterSpacing: 2.2,
        color: Colors.black,
      ),
    ),
  ),
)


        ],
      ),
    );
  }

  Padding buildNotificationOption(
    String title,
    bool value,
    Function onChangedMethod,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: value,
              onChanged: (bool newValue) {
                onChangedMethod(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
  if (title == S.of(context).language) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(S.of(context).language),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Español"),
                onTap: () {
                  context.read<LocaleProvider>().setLocale(Locale('es'));
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text("English"),
                onTap: () {
                  context.read<LocaleProvider>().setLocale(Locale('en'));
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(S.of(context).close),
              ),
            ],
          );
      },
    );
  } else {
    // comportamiento normal para otras opciones
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Text("Option 1"), Text("Option 2")],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(S.of(context).close),
            ),
          ],
        );
      },
    );
  }
},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.grey[600],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
