import 'package:flutter/material.dart';
import '../feaatures/auth/presentation/auth_page.dart'; // Импортируем вашу страницу авторизации

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Устанавливаем LoginPage как домашний экран
      // Если вы планируете использовать навигацию по именам:
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const LoginPage(),
      //   '/home': (context) => const HomePage(), // Пример страницы после входа
      //   '/register': (context) => const RegisterPage(), // Пример страницы регистрации
      // },
    );
  }
}