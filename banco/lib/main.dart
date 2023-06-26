import 'package:banco/view/home_screen.dart';
import 'package:banco/view/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banco ATM',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        //'/ATMScreen': (context) => ATMScreen(),
        '/home': (context) => HomeScreen(),
        //'/deposit': (context) => DepositoScreen(),
        //'/saque': (context) => SaqueScreen(),
        //'/extrato': (context) => ExtratoScreen(),
      },
    );
  }
}
