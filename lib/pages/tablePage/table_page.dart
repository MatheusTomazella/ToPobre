import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/pages/tablePage/chartsTab/charts_tab.dart';
import 'package:expensesapp/pages/tablePage/expensesTab/expenses_tab.dart';
import 'package:expensesapp/pages/tablePage/mainTableTab/main_table_tab.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  final ExpensesTable table;

  const TablePage({Key? key, required this.table}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> with TickerProviderStateMixin {
  late TabController tabcontroller;

  @override
  void initState() {
    super.initState();
    tabcontroller = TabController(length: tabs.length, vsync: this);
  }

  List<Widget> tabs = [
    const Tab(
        child: Icon(
      Icons.table_chart_outlined,
      color: Colors.red,
    )),
    const Tab(
        child: Icon(
      Icons.attach_money,
      color: Colors.red,
    )),
    const Tab(
        child: Icon(
      Icons.analytics_outlined,
      color: Colors.red,
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.pop(context),
          padding: const EdgeInsets.only(left: 10),
        ),
        title: Text(
          widget.table.getName(),
          style: const TextStyle(color: Colors.black54),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black54,
              size: 30,
            ),
            onPressed: () => Navigator.pushNamed(context, '/table/config'),
          ),
        ],
        bottom: TabBar(
          controller: tabcontroller,
          tabs: tabs,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: TabBarView(
        controller: tabcontroller,
        children: <Widget>[
          MainTableTab(table: widget.table),
          ExpensesTab(table: widget.table),
          ChartsTab(table: widget.table),
        ],
      ),
    );
  }
}
