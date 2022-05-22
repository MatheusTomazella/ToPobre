import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/services/calculate_total_after_discount_service.dart';
import 'package:expensesapp/services/calculate_total_previous_service.dart';
import 'package:money2/money2.dart';

class CalculateGrowthService {
  static Money calculateReturnMoney(ExpensesTable table) {
    return CalculateTotalAfterDiscountService.calculateReturnMoney(table) -
        CalculateTotalPreviousService.calculateReturnMoney(table);
  }

  static double calculatePercentage(ExpensesTable table) {
    var previousTotal =
        CalculateTotalPreviousService.calculateReturnMoney(table)
            .amount
            .toDecimal()
            .toDouble();
    if (previousTotal == 0) return 100.0;
    return calculateReturnMoney(table).amount.toDecimal().toDouble() /
        previousTotal *
        100;
  }
}
