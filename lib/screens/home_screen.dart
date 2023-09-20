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

  @override
  Widget build(BuildContext context) {
      final changeTheme = Provider.of<ThemeProvider>(context);
      return Scaffold(
        // backgroundColor: Color.fromARGB(190,255,98,180),
        appBar: AppBar(title: const Text('Home Page')),
        drawer: _buildDrawer(changeTheme, context),
      );
  }

  Drawer _buildDrawer(ThemeProvider changeTheme, BuildContext context) {
    return Drawer(
            child: ListView(children: [
              ListTile(
                title: Text('Theme ${LocalStorage.prefs.getBool("isThemeLight") == true ? "Light" : "Dark"}'),
                trailing: Switch(
                  inactiveThumbColor: const Color(0xFF3b83bd),
                  inactiveTrackColor: const Color(0XFF04dafa),
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
