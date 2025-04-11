import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:miniproyecto/generated/l10n.dart';
import 'package:miniproyecto/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'package:miniproyecto/repository/auth_service.dart';
import 'package:miniproyecto/screens/auth/login_screen.dart';
import 'package:miniproyecto/providers/theme_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool valNotify1 = false;
  bool valNotify2 = false;

  @override
  void initState() {
    super.initState();
    valNotify1 =
        Provider.of<ThemeProvider>(context, listen: false).themeMode ==
        ThemeMode.dark;
  }

  // Lógica para cambiar el tema
  void onChangeFunction1(bool newValue1) {
    setState(() {
      valNotify1 = newValue1;
    });
    // Actualizar el ThemeProvider con el valor del switch
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    themeProvider.setThemeMode(newValue1 ? ThemeMode.dark : ThemeMode.light);
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valNotify2 = newValue2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        bool isDarkMode = themeProvider.themeMode == ThemeMode.dark;

        return Scaffold(
          backgroundColor:
              isDarkMode
                  ? themeProvider.darkTheme.scaffoldBackgroundColor
                  : themeProvider.lightTheme.scaffoldBackgroundColor,

          body: Container(
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(
                      Icons.account_circle_sharp,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      S.of(context).account,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                Divider(height: 20, thickness: 1),
                SizedBox(height: 10),
                buildAccountOption(
                  context,
                  S.of(context).passwchange,
                  isDarkMode,
                ),
                buildAccountOption(context, S.of(context).language, isDarkMode),
                buildAccountOption(context, S.of(context).privacy, isDarkMode),
                SizedBox(height: 40),
                Row(
                  children: [
                    Icon(
                      Icons.volume_up_rounded,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    SizedBox(width: 10),
                    Text(
                      S.of(context).notif,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
                Divider(height: 20, thickness: 1),
                SizedBox(height: 10),
                buildNotificationOption(
                  S.of(context).theme,
                  valNotify1,
                  onChangeFunction1,
                  isDarkMode,
                ),
                buildNotificationOption(
                  S.of(context).act_notif,
                  valNotify2,
                  onChangeFunction2,
                  isDarkMode,
                ),
                SizedBox(height: 50),
                Center(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      side: BorderSide(
                        color:
                            isDarkMode
                                ? Colors.white
                                : Colors.black, // Color bordes
                        width: 2,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.logout,
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                        SizedBox(width: 8),
                        Text(
                          S.of(context).exit,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2.2,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Padding buildNotificationOption(
    String title,
    bool value,
    Function onChangedMethod,
    bool isDarkMode,
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
              color: isDarkMode ? Colors.white : Colors.black,
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

  GestureDetector buildAccountOption(
    BuildContext context,
    String title,
    bool isDarkMode,
  ) {
    return GestureDetector(
      onTap: () {
        if (title == S.of(context).language) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  S.of(context).language,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(
                        "Español",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      onTap: () {
                        context.read<LocaleProvider>().setLocale(Locale('es'));
                        Navigator.of(context).pop();
                      },
                    ),
                    ListTile(
                      title: Text(
                        "English",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
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
                    child: Text(
                      S.of(context).close,
                      style: TextStyle(
                        color: isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
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
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: isDarkMode ? Colors.white : Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
