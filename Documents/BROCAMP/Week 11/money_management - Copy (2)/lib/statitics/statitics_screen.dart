import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:money_management/db/transaction_db.dart';
import 'package:money_management/models/transactions/transaction_model.dart';
import 'package:money_management/statitics/screen_expense.dart';
import 'package:money_management/statitics/screen_income.dart';
import 'package:money_management/statitics/statitics_all.dart';
import 'package:money_management/widgets/app_bar.dart';

ValueNotifier<List<TransactionModel>> overViewGraphNotifier =
    ValueNotifier(TransactionDB.instance.transactionListNotifer.value);

class Statitics extends StatefulWidget {
  const Statitics({
    super.key,
  });

  @override
  State<Statitics> createState() => _TransactionInsightsAllState();
}

class _TransactionInsightsAllState extends State<Statitics> {


  @override
  void initState() {
    super.initState();
    overViewGraphNotifier.value =
        TransactionDB.instance.transactionListNotifer.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      appBar: appbar('Statistics', false),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Expanded(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: ButtonsTabBar(
                      backgroundColor: const Color.fromARGB(255, 250, 197, 37),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 40),
                      tabs: const [
                        Tab(
                          iconMargin: EdgeInsets.all(30),
                          text: 'All',
                        ),
                        Tab(
                          text: 'Income',
                        ),
                        Tab(
                          text: 'Expense',
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                      child: TabBarView(children: [
                    ScreenAll(),
                    ScreenIncomeChart(),
                    ScreenExpenseChart(),
                  ]))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
