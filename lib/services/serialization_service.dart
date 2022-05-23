import 'dart:convert';

import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/expense_tag.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/utils/color_utils.dart';
import 'package:expensesapp/utils/money_to_clean_money_string.dart';
import '../models/deposit.dart';
import '../models/expense.dart';
import '../models/income.dart';

class SerializationService {
  static String serializeTableList(List<ExpensesTable> tables) {
    return jsonEncode(tables.map((table) => table.toJson()).toList());
  }
}

extension TableSerializationExtension on ExpensesTable {
  String toJson() {
    return jsonEncode(<String, dynamic>{
      'name': getName(),
      'creationDate': getCreationDate().toIso8601String(),
      'favorite': getFavorite().toString(),
      'incomeList': incomeList.map((e) => e.toJson()).toList(),
      'depositList': depositList.map((e) => e.toJson()).toList(),
      'expenseList': expenseList.map((e) => e.toJson()).toList(),
      'tagList': tagList.map((e) => e.toJson()).toList(),
      'chartList': chartList.map((e) => e.toJson()).toList(),
    });
  }
}

extension IncomeSerializationExtension on Income {
  toJson() {
    return jsonEncode(<String, String>{
      'id': getId().toString(),
      'description': getDescription(),
      'value': moneyToCleanMoneyString(getValue()),
    });
  }
}

extension DepositSerializationExtension on Deposit {
  toJson() {
    return jsonEncode(<String, String>{
      'id': getId().toString(),
      'name': getName(),
      'previous': moneyToCleanMoneyString(getPrevious()),
      'increment': moneyToCleanMoneyString(getIncrement()),
    });
  }
}

extension ExpenseSerializationExtension on Expense {
  toJson() {
    return jsonEncode(<String, dynamic>{
      'id': getId().toString(),
      'date': getDate().toIso8601String(),
      'description': getDescription(),
      'depositId': getDepositId().toString(),
      'value': moneyToCleanMoneyString(getValue()),
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

extension ChartModelSerializationExtension on ChartModel {
  toJson() {
    return jsonEncode(<String, dynamic>{
      'uuid': uuid,
      'title': title,
      'type': type.toString(),
      'tags': tags,
    });
  }
}
