import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactionList(this.transactions, this.deleteTx);

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  Transaction _deletedTx;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.all(6),
                  child: FittedBox(child: Text('\$${widget.transactions[index].amount.toStringAsFixed(2)}'),),
                ),
              ),
              title: Text(
                widget.transactions[index].title,
                style: Theme.of(context).textTheme.title,
                ),
              subtitle: Text(DateFormat("dd/MM/yyyy").format(widget.transactions[index].date),),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                  _deletedTx = widget.transactions[index];
                  widget.deleteTx(widget.transactions[index].id);

                  final snackBar = SnackBar(
                    content: Text("${_deletedTx.title} was deleted"),
                    action: SnackBarAction(
                      label: "undo",
                      onPressed: () {
                        setState(() {
                          widget.transactions.add(_deletedTx);
                        });
                      },
                    ),
                  );

                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),  
            ),
          );
        },
      ),
    );
  }
}