import 'package:flutter/material.dart';
import 'package:expenses/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'models/transaction.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
    final List<Transaction> _userTransactions = [
      Transaction(
        id: 't1',
        title: 'New Shoes',
        amount: 69.99,
        date: DateTime.now(),
      ),
      Transaction(
          id: 't2',
          title: 'Weekly Groceries',
          amount: 35.67,
          date: DateTime.now()
      ),
    ];

    void _addNewTransaction(String txTitle, double txAmount){
      final newTx = Transaction(
          title: txTitle,
          amount: txAmount,
          date: DateTime.now(),
          id: DateTime.now().toString()
      );

      setState(() {
        _userTransactions.add(newTx);
      });
    }

    void _startAddNewTransaction(BuildContext ctx){
      showModalBottomSheet(
        context: ctx,
        builder: (_){
          return GestureDetector(
            onTap: (){},
            behavior: HitTestBehavior.opaque,
            child: NewTransaction(_addNewTransaction),
          );
        },
      );
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Expenses'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () =>_startAddNewTransaction(context),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Card(
                  child: Text('CHART'),
                  elevation: 5,
                ),
              ),
              TransactionList(_userTransactions),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () =>_startAddNewTransaction(context),
        ),
      );
    }
  }