import 'package:expensesapp/pages/tableConfigPage/table_config_page.dart';
import 'package:expensesapp/pages/tableListPage/table_list_page.dart';
import 'package:expensesapp/pages/tablePage/table_page.dart';
import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:expensesapp/providers/tables_provider.dart';
import 'package:flutter/material.dart';

import 'package:expensesapp/constants/strings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ExpensesApp());
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        TablesProvider.getProvider(),
      ],
      child: MaterialApp(
        title: StringConsts.APP_TITLE,
        theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.white,
        ),
        routes: <String, WidgetBuilder>{
          '/table': (BuildContext context) => Consumer<TablesNotifier>(
                builder: (context, notifier, child) {
                  if (notifier.currentTable == null) Navigator.pop(context);
                  return TablePage(
                    table: notifier.currentTable!,
                  );
                },
              ),
          '/table/config': (BuildContext context) => Consumer<TablesNotifier>(
                builder: (context, notifier, child) {
                  if (notifier.currentTable == null) Navigator.pop(context);
                  return TableConfigPage(
                    table: notifier.currentTable!,
                  );
                },
              ),
        },
        home: Consumer<TablesNotifier>(
          builder: (context, tableListNotifier, _) => TableListPage(
            tables: tableListNotifier.getOrderedTables(),
          ),
        ),
      ),
    );
  }
}
