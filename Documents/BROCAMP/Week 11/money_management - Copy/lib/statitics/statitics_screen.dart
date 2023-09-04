import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:money_management/widgets/app_bar.dart';

class Statitics extends StatefulWidget {
  const Statitics({
    super.key,
  });

  @override
  StatiticsState createState() => StatiticsState();
}

class StatiticsState extends State<Statitics> {
  String dateFilterTitle = "All";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      appBar: appbar('Statistics', false),
      body: Column(
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                const Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PopupMenuButton<int>(
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Row(
                    children: [
                      Text(
                        dateFilterTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        Icons.arrow_drop_down,
                        size: 30,
                      ),
                    ],
                  ),
                  itemBuilder: (BuildContext context) => [
                    for (var i = 1; i <= 4; i++)
                      PopupMenuItem<int>(
                        value: i,
                        child: Text(getPopupMenuItemText(i)),
                      ),
                  ],
                  onSelected: (int value) {
                    setState(() {
                      dateFilterTitle = getPopupMenuItemText(value);
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: [
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getPopupMenuItemText(int value) {
    switch (value) {
      case 1:
        return 'All';
      case 2:
        return 'Today';
      case 3:
        return 'Yesterday';
      case 4:
        return 'Month';
      default:
        return '';
    }
  }
}
