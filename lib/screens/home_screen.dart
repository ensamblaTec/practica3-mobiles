import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/services/change_theme_provider.dart';
import 'package:tarea3/services/local_storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String typeOfTheme = 'Light';

  @override
  Widget build(BuildContext context) {
      final changeTheme = Provider.of<ThemeProvider>(context);
      return Scaffold(
        appBar: AppBar(title: const Text('Home Page')),
        drawer: _buildDrawer(changeTheme, context),
      );
  }

  Drawer _buildDrawer(ThemeProvider changeTheme, BuildContext context) {
    return Drawer(
            child: ListView(children: [
              ListTile(
                title: Text('Theme $typeOfTheme'),
                trailing: Switch(
                  value: changeTheme.isLightTheme,
                  onChanged: (value) {
                    setState(() {
                      LocalStorage.prefs.setBool('isThemeLight', value);
                      changeTheme.isLightTheme = value;
                    });
                  },
                ),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Sign Out"),
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
            ]),
          );
  }
}
