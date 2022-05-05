import 'dart:convert';

import 'package:expensesapp/models/expense_tag.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/utils/color_utils.dart';
import 'package:expensesapp/utils/money_to_string.dart';
import '../models/deposit.dart';
import '../models/expense.dart';
import '../models/income.dart';

class SerializationService {}

extension TableSerializationExtension on ExpensesTable {
  toJson() {
    return jsonEncode(<String, dynamic>{
      'name': getName(),
      'creationDate': getCreationDate().toString(),
      'favorite': getFavorite().toString(),
      'incomeList': incomeList.map((e) => e.toJson()).toList(),
      'depositList': depositList.map((e) => e.toJson()).toList(),
      'expenseList': expenseList.map((e) => e.toJson()).toList(),
      'tagList': tagList.map((e) => e.toJson()).toList(),
    });
  }
}

extension IncomeSerializationExtension on Income {
  toJson() {
    return jsonEncode(<String, String>{
      'id': getId().toString(),
      'description': getDescription(),
      'value': moneyToString(getValue()),
    });
  }
}

extension DepositSerializationExtension on Deposit {
  toJson() {
    return jsonEncode(<String, String>{
      'id': getId().toString(),
      'name': getName(),
      'previous': moneyToString(getPrevious()),
      'increment': moneyToString(getIncrement()),
    });
  }
}

extension ExpenseSerializationExtension on Expense {
  toJson() {
    return jsonEncode(<String, dynamic>{
      'id': getId().toString(),
      'description': getDescription(),
      'value': moneyToString(getValue()),
      'tags': getTags(),
    });
  }
}

extension TagSerializationExtension on ExpenseTag {
  toJson() {
    return jsonEncode(<String, String>{
      'name': getName(),
      'color': getColor().toRgbString(),
    });
  }
}
