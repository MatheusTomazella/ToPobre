import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/services/calculate_growth_service.dart';
import 'package:expensesapp/services/calculate_total_after_discount_service.dart';
import 'package:expensesapp/services/calculate_total_deposited_service.dart';
import 'package:expensesapp/services/calculate_total_income_service.dart';
import 'package:expensesapp/services/calculate_total_previous_service.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

Future<void> showMetricsBottomSheet({
  required BuildContext context,
  required ExpensesTable table,
}) {
  var data = [
    [
      StringConsts.METRIC_GENERAL_TOTAL,
      CalculateTotalAfterDiscountService.calculateReturnMoney(table).toString()
    ],
    [StringConsts.METRIC_GROWTH, CalculateGrowthService.calculateReturnMoney(table).toString()],
    [
      StringConsts.METRIC_GROWTH_PERCENTAGE,
      CalculateGrowthService.calculatePercentage(table).toStringAsFixed(1) + " %"
    ],
    [
      StringConsts.METRIC_TOTAL_DEPOSITED,
      Money.fromNum(CalculateTotalDepositedService.calculate(table),
              code: CurrencyConsts.DEFAULT_CURRENCY_CODE)
          .toString()
    ],
    [
      StringConsts.METRIC_TOTAL_INCOME,
      Money.fromNum(CalculateTotalIncomeService.calculate(table),
              code: CurrencyConsts.DEFAULT_CURRENCY_CODE)
          .toString()
    ],
    [
      StringConsts.METRIC_TOTAL_PREVIOUS,
      CalculateTotalPreviousService.calculateReturnMoney(table).toString()
    ],
  ];

  return showModalBottomSheet<void>(
      context: context,
      backgroundColor: Colors.white,
      barrierColor: Colors.black12,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.7,
          widthFactor: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                const Text(
                  StringConsts.METRICS_TITLE,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ...data.map((row) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            row[0],
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          row[1],
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      });
}
