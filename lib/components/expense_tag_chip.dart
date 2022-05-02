import 'package:expensesapp/constants/color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpenseTagChip extends StatelessWidget {
  final String title;
  final Color color;
  VoidCallback? onDelete;
  VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  bool outlined = false;

  ExpenseTagChip({
    Key? key,
    required this.title,
    required this.color,
    this.onDelete,
    this.onTap,
    this.padding = const EdgeInsets.all(0),
    this.outlined = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: TextButton(
          onPressed: onTap,
          child: Chip(
            label: Text(
              title,
              style: TextStyle(
                  color: outlined ? color : ColorConsts.TAG_TEXT_COLOR),
            ),
            backgroundColor: outlined ? Colors.transparent : color,
            side: BorderSide(color: color),
            deleteIcon: onDelete != null
                ? const Icon(
                    Icons.close,
                    color: Colors.white,
                  )
                : null,
            onDeleted: onDelete,
          ),
        ));
  }
}
