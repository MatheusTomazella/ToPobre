import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/deposit.dart';
import 'package:expensesapp/models/expense.dart';
import 'package:expensesapp/models/expense_tag.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/models/income.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

Money genMoney(double amount) =>
    Money.fromNum(amount, code: CurrencyConsts.DEFAULT_CURRENCY_CODE);

ExpensesTable generateExampleTable() {
  return ExpensesTable.filled(
    "Tabela Exemplo",
    DateTime.now(),
    true,
    [
      Income.filled(
        1,
        "Salário",
        genMoney(2500),
      ),
      Income.filled(
        2,
        "Bônus",
        genMoney(500),
      ),
    ],
    [
      Deposit.filled(
        1,
        "Poupança",
        genMoney(5000),
        genMoney(2500),
      ),
      Deposit.filled(
        2,
        "Deposito Viagem",
        genMoney(2500),
        genMoney(200),
      ),
      Deposit.filled(
        3,
        "Sair",
        genMoney(300),
        genMoney(100),
      ),
      Deposit.filled(
        4,
        "Gastos Esporádicos",
        genMoney(500),
        genMoney(200),
      ),
    ],
    [
      Expense.filled(
        1,
        DateTime.now(),
        "Conta Eletricidade",
        1,
        genMoney(200),
        [
          "Necessário",
          "Conta",
          "Recorrente",
        ],
      ),
      Expense.filled(
        2,
        DateTime.now(),
        "Conta Água",
        1,
        genMoney(100),
        [
          "Necessário",
          "Conta",
          "Recorrente",
        ],
      ),
      Expense.filled(
        3,
        DateTime.now(),
        "Faculdade",
        1,
        genMoney(600),
        [
          "Necessário",
          "Conta",
          "Recorrente",
        ],
      ),
      Expense.filled(
        4,
        DateTime.now(),
        "Presente Aniversário",
        4,
        genMoney(50),
        [
          "Desnecessário",
          "Esporádico",
        ],
      ),
      Expense.filled(
        5,
        DateTime.now(),
        "Restaurante",
        1,
        genMoney(150),
        [
          "Desnecessário",
          "Esporádico",
          "Comida",
        ],
      ),
      Expense.filled(
        6,
        DateTime.now(),
        "Ifood",
        1,
        genMoney(45),
        [
          "Desnecessário",
          "Esporádico",
          "Comida",
        ],
      ),
    ],
    [
      ExpenseTag.fromColor(name: "Necessário", color: Colors.blue),
      ExpenseTag.fromColor(name: "Desnecessário", color: Colors.red),
      ExpenseTag.fromColor(name: "Conta", color: Colors.green),
      ExpenseTag.fromColor(name: "Comida", color: Colors.yellow),
      ExpenseTag.fromColor(name: "Recorrente", color: Colors.orange),
      ExpenseTag.fromColor(name: "Esporádico", color: Colors.purple),
    ],
    [
      ChartModel(type: CHART_TYPES.SPENT_VS_DEPOSITED_PIE),
      ChartModel(type: CHART_TYPES.SPENT_VS_INCOME_PIE),
      ChartModel(
        type: CHART_TYPES.TAG_PIE,
        title: "Necessário x Desnecessário",
        tags: [
          "Necessário",
          "Desnecessário",
        ],
      ),
      ChartModel(
        type: CHART_TYPES.TAG_PIE,
        title: "Recorrente x Esporádico",
        tags: [
          "Recorrente",
          "Esporádico",
        ],
      ),
    ],
  );
}
