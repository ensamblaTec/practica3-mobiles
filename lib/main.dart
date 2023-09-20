import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea3/routes/routes.dart';
import 'package:tarea3/screens/home_screen.dart';
import 'package:tarea3/screens/login_screen.dart';
import 'package:tarea3/services/change_theme_provider.dart';
import 'package:tarea3/services/local_storage.dart';
import 'package:tarea3/settings/styles_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();

  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool isActive = false;

  @override
  void initState() {
    if (LocalStorage.prefs.getBool('isActiveSession') != null) {
      LocalStorage.prefs.getBool('isActiveSession') as bool == true 
          ? isActive = true 
          : isActive = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final changeTheme = Provider.of<ThemeProvider>(context);
        // final isActive = Provider.of<SignIn>(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: getRoutes(),
          theme: changeTheme.isLightTheme 
              ? StylesApp.lightTheme(context)
              : StylesApp.darkTheme(context),
          home: isActive ? const HomeScreen() : const LoginScreen(),
        );
      },
    );
    // child: Builder(builder: (context) {
    //   final changeTheme = Provider.of<ThemeProvider>(context);
    //   return MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     routes: getRoutes(),
    //     theme: changeTheme.isLightTheme
    //         ? StylesApp.lightTheme(context)
    //         : StylesApp.darkTheme(context),
    //     home: isActiveSession ? const HomeScreen() : const LoginScreen(),
    //   );
    // }));
  }
}
