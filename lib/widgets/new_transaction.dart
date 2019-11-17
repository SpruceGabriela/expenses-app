import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTx;
  final _ctlTitle = TextEditingController();
  final _ctlAmount = TextEditingController();

  NewTransaction(this.addTx);

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
                      // onChanged: (value) => titleInput = value,
                      ),
                    TextField(
                      decoration: InputDecoration(
                        labelText: 'Amount'),
                      controller: _ctlAmount,
                      // onChanged: (value) => amountInput = value,
                      ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      textColor: Colors.purple,
                      onPressed: (){
                        addTx(_ctlTitle.text, double.parse(_ctlAmount.text));
                      },
                      ),
                  ],
                ),
              ),
            );
  }
}