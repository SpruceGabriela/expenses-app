import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _ctlTitle = TextEditingController();

  final _ctlAmount = TextEditingController();

  void submitData(){
    final enteredTitle = _ctlTitle.text;
    final enteredAmount = double.parse(_ctlAmount.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0){
      return;
    }

    widget.addTx(
      _ctlTitle.text,
      double.parse(_ctlAmount.text)
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                             labelText: 'Title'),
                      controller: _ctlTitle,
                      onSubmitted: (_) => submitData(),
                      ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount'),
                      controller: _ctlAmount,
                      keyboardType: TextInputType.numberWithOptions(decimal: true),
                      onSubmitted: (_) => submitData(),
                      ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Theme.of(context).primaryColor,
                      onPressed: submitData,
                      ),
                  ],
                ),
              ),
            );
  }
}