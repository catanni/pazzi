import 'package:flutter/material.dart';

import '../model/account_Model.dart';

class TransferenciaScreen extends StatefulWidget {
  final Account? sourceAccount;
  final Account? destinationAccount;

  const TransferenciaScreen({
    required this.sourceAccount,
    required this.destinationAccount,
    Key? key,
  }) : super(key: key);

  @override
  State<TransferenciaScreen> createState() => _TransferenciaScreenState();
}

class _TransferenciaScreenState extends State<TransferenciaScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _amountController = TextEditingController();

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void _transferFunds() async {
    if (_formKey.currentState!.validate()) {
      double amount = double.parse(_amountController.text);

      // Verificar se há saldo suficiente na conta de origem
      double currentBalance = widget.sourceAccount!.balance;
      if (amount > currentBalance) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Erro'),
              content: Text('Saldo insuficiente na conta de origem.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
        return;
      }

      //Definindo os valores
      var newBalance = currentBalance - amount;
      var newBalance2 = widget.destinationAccount!.balance + amount;

      /*var ac1 = AccountUpdate(
        id: widget.sourceAccount?.id,
        pin: widget.sourceAccount?.pin,
        balance: newBalance,
      );*/

      // var ac2 = AccountUpdate(
      // id: widget.destinationAccount?.id,
      // pin: widget.destinationAccount?.pin,
      // / balance: newBalance2,
      //);

      // Atualizar os dados no banco de dados
      // await DBHelper.updateAccount(ac1);
      //await DBHelper.updateAccount(ac2);

      // Limpar o campo de texto após a transferência
      _amountController.clear();

      // Exibir um diálogo de sucesso ou redirecionar para outra tela
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sucesso'),
            content: Text('Transferência realizada com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Transferencia'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Conta de Origem: ${widget.sourceAccount!.name}'),
              Text('Conta de Destino: ${widget.destinationAccount!.name}'),
              TextFormField(
                controller: _amountController,
                decoration:
                    InputDecoration(labelText: 'Valor da Transferência'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, insira o valor da transferência';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _transferFunds,
                child: Text('Transferir'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
