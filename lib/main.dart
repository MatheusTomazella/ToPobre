// ignore_for_file: constant_identifier_names
import 'package:expensesapp/constants/database.dart';
import 'package:expensesapp/pages/tableConfigPage/table_config_page.dart';
import 'package:expensesapp/pages/tableListPage/table_list_page.dart';
import 'package:expensesapp/pages/tablePage/table_page.dart';
import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:expensesapp/providers/tables_provider.dart';
import 'package:expensesapp/services/database_service.dart';
import 'package:expensesapp/components/quick_actions_manager.dart';
import 'package:flutter/material.dart';

import 'package:expensesapp/constants/strings.dart';
import 'package:provider/provider.dart';
import 'package:quick_actions/quick_actions.dart';

const bool SERIALIZATION_ENABLED = true;
const bool INSERT_EXAMPLE_TABLE_IF_NO_TABLE = true;

void main() {
  runApp(const ExpensesApp());

  if (!SERIALIZATION_ENABLED) {
    DatabaseService.save('', DatabaseConsts.TABLE_DATABASE_NAME);
  }
}

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        TablesProvider.getProvider(),
      ],
      child: App(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        builder: (context, tableListNotifier, _) => FutureBuilder(
          future: Provider.of<TablesNotifier>(context, listen: false).init(),
          builder: (context, snapshot) {
            try {
              QuickActionsManager(
                items: () {
                  var provider =
                      Provider.of<TablesNotifier>(context, listen: false);
                  List<ShortcutItem> items = [];
                  for (var i = 0; i < 5 && i < provider.tables.length; i++) {
                    var table = provider.tables[i];
                    if (!table.getFavorite()) continue;
                    items.add(ShortcutItem(
                      type: 'table_$i',
                      localizedTitle: provider.tables[i].getName(),
                      icon: 'add_icon'
                    ));
                  }
                  return items;
                }(),
                onAction: (String actionType) {
                  var provider =
                      Provider.of<TablesNotifier>(context, listen: false);
                  if (actionType.startsWith('table')) {
                    var index = actionType.split('_')[1];
                    provider.selectTable(provider.tables[int.parse(index)]);
                    Navigator.pushNamed(context, '/table', arguments: {'go_to_add_expense': true});
                    return;
                  }
                },
              );

              return TableListPage(
                tables: tableListNotifier.getOrderedTables(),
              );
            } catch (e) {
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
                color: Colors.white,
              );
            }
          },
        ),
      ),
    );
  }
}
