import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/deposit.dart';
import 'package:expensesapp/models/expense_tag.dart';
import 'package:expensesapp/models/income.dart';

import '../constants/chart_types.dart';
import '../utils/get_next_available_id.dart';
import 'expense.dart';

class ExpensesTable {
  String _name = StringConsts.DEFAULT_TABLE_NAME;
  DateTime _creationDate = DateTime.now();
  bool favorite = false;

  List<Income> incomeList = [];
  List<Deposit> depositList = [];
  List<Expense> expenseList = [];
  List<ExpenseTag> tagList = [];
  List<ChartModel> chartList = [
    ChartModel(title: '', type: CHART_TYPES.SPENT_VS_DEPOSITED_PIE),
    ChartModel(title: '', type: CHART_TYPES.SPENT_VS_INCOME_PIE),
    ChartModel(title: '', type: CHART_TYPES.PREVIOUS_CURRENT_COMPARISON_BAR),
    ChartModel(title: '', type: CHART_TYPES.TAG_BAR),
    ChartModel(title: '', type: CHART_TYPES.TAG_PIE, tags: ['teste 1', 'teste 2']),
  ];

  ExpensesTable(String name) {
    setName(name);
  }

  ExpensesTable.defaultValues() {
    setName(StringConsts.DEFAULT_TABLE_NAME);
    setCreationDate(DateTime.now());
    setFavorite(false);
    incomeList = [Income(0)];
    depositList = [Deposit(0)];
    expenseList = [];
    tagList = [];
  }

  ExpensesTable.filled(
    String name,
    DateTime creationDate,
    bool favorite,
    List<Income> incomeList,
    List<Deposit> depositList,
    List<Expense> expenseList,
    List<ExpenseTag> tagList,
  ) {
    setName(name);
    setCreationDate(creationDate);
    setFavorite(favorite);
    this.incomeList = List.from(incomeList);
    this.depositList = List.from(depositList);
    this.expenseList = List.from(expenseList);
    this.tagList = List.from(tagList);
  }

  ExpensesTable.from(ExpensesTable table)
      : this.filled(
          table.getName(),
          table.getCreationDate(),
          table.getFavorite(),
          table.incomeList,
          table.depositList,
          table.expenseList,
          table.tagList,
        );

  void addIncome(Income income) => incomeList.add(income);
  void addIncomeUsingAvailableId(Income income) {
    income.setId(getNextAvailableId(incomeList));
    addIncome(income);
  }

  void addIncomeList(List<Income> incomeList) =>
      this.incomeList.addAll(incomeList);

  void addDeposit(Deposit deposit) => depositList.add(deposit);
  void addDepositUsingAvailableId(Deposit deposit) {
    deposit.setId(getNextAvailableId(depositList));
    depositList.add(deposit);
  }

  void addDepositList(List<Deposit> depositList) =>
      this.depositList.addAll(depositList);

  void addExpense(Expense expense) => expenseList.add(expense);
  void addExpenseUsingAvailableId(Expense expense) {
    expense.setId(getNextAvailableId(expenseList));
    expenseList.add(expense);
  }

  void addExpenseList(List<Expense> expenseList) =>
      this.expenseList.addAll(expenseList);

  void addTag(ExpenseTag tag) => tagList.add(tag);
  void addTagList(List<ExpenseTag> newTags) => tagList.addAll(newTags);
  void updateTag(ExpenseTag oldTag, ExpenseTag newTag) {
    for (var expense in expenseList) {
      for (var tag in expense.getTags()) {
        if (tag == oldTag.getName()) {
          expense.removeTag(tag);
          expense.addTag(newTag.getName());
        }
      }
    }
    for (var tag in tagList) {
      if (tag.getName() == oldTag.getName()) {
        tag.setName(newTag.getName());
        tag.setColor(newTag.getColor());
      }
    }
  }

  void removeTag(ExpenseTag tag) {
    tagList.remove(tag);
    for (var e in expenseList) {
      e.removeTag(tag.getName());
    }
  }

  String getName() => _name;
  setName(String name) {
    if (name.isEmpty) throw Exception("Table name cannot be empty");
    _name = name;
  }

  DateTime getCreationDate() => _creationDate;
  setCreationDate(DateTime creationDate) => _creationDate = creationDate;
  String getCreationDateString() => getCreationDateString().toString();

  bool getFavorite() => favorite;
  setFavorite(bool favorite) => this.favorite = favorite;
  toggleFavorite() => setFavorite(!getFavorite());

  bool equals(ExpensesTable table) =>
      getName() == table.getName() &&
      getCreationDate() == table.getCreationDate();

  String toPrintableString() {
    String result =
        "ExpensesTable(name: ${getName()}, creationDate: ${getCreationDateString()}\n\n";
    result += "Incomes:\n";
    for (Income income in incomeList) {
      result += income.toPrintableString();
    }
    result += "\nDeposits:\n";
    for (Deposit deposit in depositList) {
      result += deposit.toPrintableString();
    }
    result += "\n)";
    return result;
  }
}
