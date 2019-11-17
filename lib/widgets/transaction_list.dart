import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Column(
              children:
                 _userTransactions.map((tx){
                   return Card(
                     child: Row(
                       children: <Widget>[
                         Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(
                             color: Colors.purple,
                             width: 2, )
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 5),
                          child: Text(
                            '\$${tx.amount}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            ),
                            ),
                           ),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: <Widget>[
                             Text(
                              tx.title,
                              style: TextStyle(
                                fontSize: 16, 
                                fontWeight: FontWeight.bold) 
                              ),
                             Text(
                              DateFormat.yMMMd().format(tx.date),
                              style: TextStyle(color: Colors.grey),
                              )
                           ],
                         ),
                       ],
                     ),
                     );
                 }).toList(),
            );
  }
}