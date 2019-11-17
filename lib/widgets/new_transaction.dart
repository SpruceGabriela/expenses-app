import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final _ctlTitle = TextEditingController();
  final _ctlAmount = TextEditingController();

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
                        print(_ctlAmount.text);
                      },
                      ),
                  ],
                ),
              ),
            );
  }
}