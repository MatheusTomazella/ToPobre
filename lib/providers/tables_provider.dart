import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class TablesProvider {
  static ChangeNotifierProvider<TablesNotifier> getProvider() => _instance;

  static final ChangeNotifierProvider<TablesNotifier> _instance = ChangeNotifierProvider(
    create: (_) => TablesNotifier(),
  );
}
