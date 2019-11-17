import 'package:flutter/material.dart';
import 'package:expenses/widgets/new_transaction.dart';
import 'package:expenses/widgets/transaction_list.dart';

class _UserTransaction extends StatefulWidget {
  @override
  __UserTransactionState createState() => __UserTransactionState();
}

class __UserTransactionState extends State<_UserTransaction> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(),
        TransactionList()
      ],
    );
  }
}