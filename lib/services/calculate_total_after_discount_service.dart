import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/services/calculate_total_deposited_service.dart';
import 'package:expensesapp/services/calculate_total_discount_service.dart';
import 'package:money2/money2.dart';

class CalculateTotalAfterDiscountService {
  static Money calculateReturnMoney(ExpensesTable table) {
    return CalculateTotalDepositedService.calculateReturnMoney(table) -
        CalculateTotalDiscountService.fromList(table.expenseList);
  }
}
