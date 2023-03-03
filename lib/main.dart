import 'dart:math';
import 'package:flutter/material.dart';
import 'package:expenses/models/transaction.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';


main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _transaction = [
    Transaction(id: 't1', title: 'Novo tênis de corrida', value: 300.76, date: DateTime.now()),
    Transaction(id: 't2', title: 'Conta de luz', value: 211.30, date: DateTime.now()),
    Transaction(id: 't3', title: 'Conta de água', value: 211.30, date: DateTime.now()),
    Transaction(id: 't4', title: 'Conta de telefone', value: 211.30, date: DateTime.now()),
    Transaction(id: 't5', title: 'Conta de gás', value: 211.30, date: DateTime.now()),
    Transaction(id: 't6', title: 'Conta de colefio', value: 211.30, date: DateTime.now()),
    Transaction(id: 't7', title: 'Conta de carro', value: 211.30, date: DateTime.now()),
    Transaction(id: 't8', title: 'Conta de moto', value: 211.30, date: DateTime.now())
  ];


  _addTransactions(String title, double value) {
    final newTransaction = Transaction(id: Random().nextDouble().toString(), title: title, value: value, date: DateTime.now());

    setState(() {
      _transaction.add(newTransaction);
    });
  }

  _openTransactionOpenModel(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionForm(_addTransactions);
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas pessoais'),
        actions: <Widget>[
          IconButton(
              onPressed: () => _openTransactionOpenModel(context),
              icon: const Icon(Icons.add)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: const Card(
                color: Colors.blue,
                elevation: 5,
                child: Text('Gráfico'),
              )
            ),
            Column(
              children: [
                TransactionList(_transaction),
                TransactionForm(_addTransactions)
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openTransactionOpenModel(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}