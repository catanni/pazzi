import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Future<void> authenticate() async {
    Dio dio = Dio();
    String apiUrl = 'http://localhost:3306/auth';
    var url = 'http://localhost:3306/auth';
    var headers = {'Content-Type': 'application/json'};
    var data = {
      'name': 'jess',
      'pin': '123',
    };

    try {
      var response =
          await dio.post(url, data: data, options: Options(headers: headers));

      if (response.statusCode == 200) {
        Navigator.pushNamed(context, '/home');
        var responseData = response.data;
        // Faça algo com a resposta aqui
      } else {
        Text('erro');
      }
    } catch (error) {
      // Ocorreu um erro durante a solicitação
      // Lide com o erro aqui
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const TextField(
                keyboardType: TextInputType.text,
                autofocus: true,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  label: Text("Nome"),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const TextField(
                keyboardType: TextInputType.text,
                autofocus: true,
                obscureText: true,
                style: TextStyle(color: Colors.white, fontSize: 20),
                decoration: InputDecoration(
                  label: Text("Senha"),
                  labelStyle: TextStyle(color: Colors.white, fontSize: 30),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              ElevatedButton(
                  onPressed: () {
                    authenticate();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * 0.75, 40),
                  ),
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
