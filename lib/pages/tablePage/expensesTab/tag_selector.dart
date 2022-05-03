import 'package:expensesapp/components/expense_tag_chip.dart';
import 'package:flutter/material.dart';

import '../../../models/expenses_table.dart';

class TagSelector extends StatelessWidget {
  final ExpensesTable table;
  final List<String> selected;
  final Function(List<String>) onChange;

  const TagSelector(
      {Key? key,
      required this.table,
      required this.selected,
      required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: table.tagList
              .map(
                (e) => ExpenseTagChip(
                  title: e.getName(),
                  color: e.getColor(),
                  outlined: !selected.contains(e.getName()),
                  onTap: () {
                    if (selected.contains(e.getName())) {
                      onChange(selected
                          .where((selectedTag) => selectedTag != e.getName())
                          .toList());
                    } else {
                      onChange(selected..add(e.getName()));
                    }
                  },
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
