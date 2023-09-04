import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_management/db/transaction_db.dart';
import 'package:money_management/screens/home_screen.dart';
import 'package:money_management/screens/search_field.dart';
import 'package:money_management/screens/transaction/transactionlist.dart';

ValueNotifier showCategory = ValueNotifier('All');

class Transactions extends StatefulWidget {
  const Transactions({super.key});

  @override
  State<Transactions> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  ValueNotifier showCategory = ValueNotifier('All');

  @override
  void initState() {
    overViewListNotifier.value =
        TransactionDB.instance.transactionListNotifer.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [
            SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 20,
            ),
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(247, 22, 22, 0.878),
                Color.fromRGBO(255, 67, 40, 0.88),
                Color.fromRGBO(255, 152, 100, 0.88),
              ]),
            ),
          ),
          title: const Center(
            child: Text('Transactions'),
          ),
        ),
        body: const Column(
          children: [
            SearchField(),
            Expanded(
              child: TransactionList(),
            ),
          ],
        ),
      ),
    );
  }
}

popoutfunction(BuildContext context) {
  return Navigator.of(context).pop();
}

String parseDate(DateTime date) {
  return '${day[date.weekday - 1]}-${date.year}${DateFormat.MMMd().format(date)}';
}
