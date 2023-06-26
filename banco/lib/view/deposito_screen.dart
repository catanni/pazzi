import 'package:flutter/material.dart';

import '../model/account_Model.dart';

class DepositoScreen extends StatefulWidget {
  final Account? account1;

  DepositoScreen({this.account1});

  @override
  _DepositoScreenState createState() => _DepositoScreenState();
}

class _DepositoScreenState extends State<DepositoScreen> {
  final TextEditingController _valorController = TextEditingController();

  @override
  void dispose() {
    _valorController.dispose();
    super.dispose();
  }

  /*void _depositUser(BuildContext context) async {
    String balance = _valorController.text;
    double? balanceParsed = double.tryParse(balance);

    if (balanceParsed == null || balanceParsed == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Valor inválido'),
            content: const Text('O valor de depósito informado não é válido.'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return; // Abortar a operação de depósito
    }

    setState(() {
      widget.account1!.balance += double.parse(balance);
    });

    var account = AccountUpdate(
      id: widget.account1?.id,
      pin: widget.account1?.pin,
      balance: widget.account1!.balance,
    );

    await DBHelper.updateAccount(account);

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('O deposito foi realizado com sucesso!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: const Text('Depósito'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Informe o valor do depósito:',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: _valorController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Valor do depósito',
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.black),
                  child: const Text(
                    'Confirmar',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () => _depositUser(context),
                ),*/
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.black),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
