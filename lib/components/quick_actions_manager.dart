import 'package:quick_actions/quick_actions.dart';

// ignore: must_be_immutable
class QuickActionsManager {
  final QuickActions _quickActions = const QuickActions();
  List<ShortcutItem> items;
  Function(String actionType) onAction;

  QuickActionsManager({required this.onAction, required this.items}) {
    initialize();
  }

  void initialize() {
    _quickActions.initialize(onAction);
    setShortcutItems();
  }

  void setShortcutItems() {
    _quickActions.setShortcutItems(items);
  }
}
