import 'package:flutter/material.dart';
import 'package:tarea3/screens/home_screen.dart';
import 'package:tarea3/screens/login_screen.dart';

Map<String, WidgetBuilder> getRoutes(){
  return{
    '/home' : (BuildContext context) => const HomeScreen(),
    '/login' : (BuildContext context) => const LoginScreen()
};
}