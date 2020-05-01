import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function newTx;

  NewTransaction(this.newTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitted() {
    final enterdedData = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if (enterdedData.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.newTx(
      enterdedData,
      enteredAmount,
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
                labelText: 'Article',
              ),
              onSubmitted: (_) => submitted(),
              controller: titleController,
              
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Cost',
              ),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitted(),
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: () => submitted,
            )
          ],
        ),
      ),
    );
  }
}
