import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

// ignore: must_be_immutable
class QuickActionsManager extends StatelessWidget {
  final QuickActions _quickActions = const QuickActions();
  Widget child;
  Function(String actionType) onAction;

  QuickActionsManager({Key? key, required this.child, required this.onAction}) : super(key: key) {
    initialize();
  }

  void initialize() {
    _quickActions.initialize(onAction);
    setShortcutItems();
  }

  void setShortcutItems() {
    _quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(type: 'action_test', localizedTitle: "Test"),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
