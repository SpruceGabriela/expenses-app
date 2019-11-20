import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: widget.transactions.isEmpty
      ? Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Not transactions added yet!', style: Theme.of(context).textTheme.title),
          SizedBox(height: 20,),
          Container(
            height: 200,
            child: Image.asset('assets/images/image/waiting.png', fit: BoxFit.cover,)
            ),
        ],
      )
       : ListView.builder(
        itemCount: widget.transactions.length,
        itemBuilder: (context, index){
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                margin: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2, )
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5),
                child: Text(
                  '\$${widget.transactions[index].amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                  ),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                    widget.transactions[index].title,
                    style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                    DateFormat.yMMMd().format(widget.transactions[index].date),
                    style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}