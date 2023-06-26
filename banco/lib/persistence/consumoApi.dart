import 'dart:convert';

import 'package:dio/dio.dart';

void postData() async {
  Dio dio = Dio();
  String apiUrl = 'http://localhost:8080/auth';
  var headers = {'Content-Type': 'application/json'};
  var data = {
    'id': null,
    'name': 'Julia',
    'pin': '123',
    'balance': '12.00',
  };

  try {
    var response =
        await dio.post(apiUrl, data: data, options: Options(headers: headers));

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

  void updateAccount() async {
    var url = Uri.parse('http://localhost:8080/account/5');
    var headers = {'Content-Type': 'application/json'};
    var data = jsonEncode({
      'balance': '16',
    });

    var response =
        await dio.post(apiUrl, data: data, options: Options(headers: headers));

    if (response.statusCode == 200) {
      // A solicitação foi bem-sucedida
      var responseData = jsonDecode(response.data);
      // Faça algo com a resposta aqui
    } else {
      // A solicitação falhou
      // Lide com o erro aqui
    }
  }

  void createTransaction() async {
    var url = Uri.parse('http://localhost:8080/transaction');
    var headers = {'Content-Type': 'application/json'};
    var data = jsonEncode({
      'id': null,
      'accountId': 5,
      'type': 'foi',
      'balance': '15',
    });

    var response =
        await dio.post(apiUrl, data: data, options: Options(headers: headers));

    if (response.statusCode == 200) {
      // A solicitação foi bem-sucedida
      var responseData = jsonDecode(response.data);
      // Faça algo com a resposta aqui
    } else {
      // A solicitação falhou
      // Lide com o erro aqui
    }
  }

  void authenticate() async {
    var url = Uri.parse('http://localhost:8080/auth');
    var headers = {'Content-Type': 'application/json'};
    var data = jsonEncode({
      'name': 'jess',
      'pin': '123',
    });

    var response =
        await dio.post(apiUrl, data: data, options: Options(headers: headers));

    if (response.statusCode == 200) {
      // A solicitação foi bem-sucedida
      var responseData = jsonDecode(response.data);
      // Faça algo com a resposta aqui
    } else {
      // A solicitação falhou
      // Lide com o erro aqui
    }
  }
}
