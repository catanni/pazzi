import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Authentication extends StatelessWidget {
  Authentication({super.key});
  final Dio dio = Dio();

  Future<void> authenticate() async {
    var url = 'http://localhost:8080/auth';
    var headers = {'Content-Type': 'application/json'};
    var data = {
      'name': 'jess',
      'pin': '123',
    };

    try {
      var response =
          await dio.post(url, data: data, options: Options(headers: headers));

      if (response.statusCode == 200) {
        // A solicitação foi bem-sucedida
        var responseData = response.data;
        // Faça algo com a resposta aqui
      } else {
        // A solicitação falhou
        // Lide com o erro aqui
      }
    } catch (error) {
      // Ocorreu um erro durante a solicitação
      // Lide com o erro aqui
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
