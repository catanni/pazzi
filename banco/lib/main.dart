import 'package:banco/view/deposito_screen.dart';
import 'package:banco/view/extrato_screen.dart';
import 'package:banco/view/home_screen.dart';
import 'package:banco/view/login.dart';
import 'package:banco/view/saque_screen.dart';
import 'package:banco/view/transferencia_screen.dart';
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
      initialRoute: '/home',
      routes: {
        '/login': (context) => Login(),
        //'/ATMScreen': (context) => ATMScreen(),
        '/home': (context) => HomeScreen(
              account1: null,
            ),
        '/deposit': (context) => DepositoScreen(),
        '/saque': (context) => SaqueScreen(),
        //'/transferencia': (context) => TransferenciaScreen(),
        '/extrato': (context) => ExtratoScreen(),
      },
    );
  }
}
