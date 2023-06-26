import 'package:flutter/material.dart';

import '../model/account_Model.dart';
import '../model/transacoes.dart';

class ExtratoScreen extends StatefulWidget {
  final Account? account1;

  ExtratoScreen({this.account1});

  @override
  _ExtratoScreenState createState() => _ExtratoScreenState();
}

class _ExtratoScreenState extends State<ExtratoScreen> {
  TextEditingController _valorController = TextEditingController();
  List<Transacoes> _transacoes = [];

  @override
  /*void initState() {
    super.initState();
    _getTransacoes();
  }*/

  /*Future<void> _getTransacoes() async {
    List<Transacoes> transacoes =
        await DBHelper.getTransactionsByAccount(widget.account1!.id);
    setState(() {
      _transacoes = transacoes;
    });
  }*/

  @override
  void dispose() {
    _valorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Extrato'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Extrato de Operações:',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            /*Expanded(
              /*child: ListView.builder(
                itemCount: _transacoes.length,
                itemBuilder: (context, index) {
                  Transacoes transacoes = _transacoes[index];
                  return ListTile(
                    title: Text('Tipo: ${transacoes.tipo}'),
                    subtitle: Text('Valor: ${transacoes.valor}'),
                  );
                },*/
              ),
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.black),
                  child: const Text('Confirmar'),
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: Colors.black),
                  child: const Text('Voltar'),
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
