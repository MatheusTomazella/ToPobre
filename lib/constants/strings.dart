// ignore_for_file: constant_identifier_names

class StringConsts {
  static const String APP_TITLE = "TôPobre";

  static const String LIST_PAGE_TITLE = "Tabelas";

  // Table List Item Menu
  static const String LIST_MENU_EDIT_OPTION = "Editar";
  static const String LIST_MENU_DELETE_OPTION = "Excluir";
  static const String LIST_MENU_COPY_OPTION = "Duplicar";
  static const String LIST_MENU_EXPORT_OPTION = "Exportar";
  static const String LIST_MENU_INFO_OPTION = "Detalhes";

  // Default names
  static const String DEFAULT_TABLE_NAME = "Nova Tabela";
  static const String DEFAULT_INCOME_DESCRIPTION = "Nova Entrada";
  static const String DEFAULT_DEPOSIT_NAME = "Novo Depósito";
  static const String DEFAULT_EXPENSE_DESCRIPTION = "Nova Despesa";
  static const String DEFAULT_EXPENSE_TAG_NAME = "Nova Etiqueta";
  static const String COPY_TRAILER = " (cópia)";

  // Tables
  // Headers
  // Income
  static const String INCOME_ID_LABEL = "";
  static const String INCOME_DESCRIPTION_LABEL = "Descrição";
  static const String INCOME_VALUE_LABEL = "Valor";
  // Deposit
  static const String DEPOSIT_ID_LABEL = "";
  static const String DEPOSIT_NAME_LABEL = "Nome";
  static const String DEPOSIT_PREVIOUS_LABEL = "Valor Anterior";
  static const String DEPOSIT_INCREMENT_LABEL = "Incremento";
  static const String DEPOSIT_DISCOUNT_LABEL = "Desconto";
  static const String DEPOSIT_BEFORE_DECREMENT_LABEL = "Saldo";
  static const String DEPOSIT_DECREMENT_LABEL = "Desconto";
  static const String DEPOSIT_VALUE_LABEL = "Valor";
  // Expenses
  static const String EXPENSES_ID_LABEL = "";
  static const String EXPENSES_DESCRIPTION_LABEL = "Descrição";
  static const String EXPENSES_VALUE_LABEL = "Valor";
  static const String EXPENSES_DATE_LABEL = "Data";
  static const String EXPENSES_DEPOSIT_ID_LABEL = "Fonte";
  static const String EXPENSES_TAGS_LABEL = "Etiquetas";
  // Titles
  static const String INCOME_TABLE_TITLE = "Entradas";
  static const String DEPOSIT_BEFORE_TABLE_TITLE = "Depósitos";
  static const String DEPOSIT_AFTER_TABLE_TITLE = "Depósitos Descontado";
  static const String EXPENSES_TABLE_TITLE = "Despesas";

  // Table Configurations
  static const String TABLE_CONFIG_TAG_TITLE = "Etiquetas";

  // Metrics
  static const String METRICS_TITLE = "Métricas";
  static const String METRIC_GENERAL_TOTAL = "Total";
  static const String METRIC_GROWTH = "Aumento";
  static const String METRIC_GROWTH_PERCENTAGE = "Aumento (%)";
  static const String METRIC_TOTAL_DEPOSITED = "Total Depositado";
  static const String METRIC_TOTAL_INCOME = "Total de Entrada";
  static const String METRIC_TOTAL_PREVIOUS = "Total Anterior";

  // ---------------------------------------------------------------------------
  // DIALOGS

  // Default Buttons
  static const String DEFAULT_DELETION_DIALOG_TITLE = "Tem certeza?";
  static const String DEFAULT_DELETION_DIALOG_TEXT =
      "Tem certeza que quer deletar esse item? Essa ação não pode ser desfeita.";

  // Rename Dialog
  static const String RENAME_DIALOG_TITLE = "Renomear";
  static const String RENAME_DIALOG_PLACEHOLDER = "Novo nome";
  static const String RENAME_DIALOG_CONFIRM_BUTTON_TEXT = "Renomear";
  static const String RENAME_DIALOG_CANCEL_BUTTON_TEXT = "Cancelar";

  // Confirmation Dialog
  static const String DEFAULT_CONFIRMATION_DIALOG_TITLE = "Confirmação";
  static const String DEFAULT_CONFIRMATION_DIALOG_TEXT = "Confirma ação?";
  static const String DEFAULT_CONFIRMATION_DIALOG_CONFIRM_BUTTON_TEXT =
      "Confirmar";
  static const String DEFAULT_CONFIRMATION_DIALOG_CANCEL_BUTTON_TEXT =
      "Cancelar";

  // Information Dialog
  static const String DEFAULT_INFORMATION_DIALOG_TITLE = "Informação";
  static const String DEFAULT_INFORMATION_DIALOG_TEXT = "Informação";
  static const String DEFAULT_INFORMATION_DIALOG_CONFIRM_BUTTON_TEXT = "Ok";

  // Deletion Dialog
  static const String DELETION_DIALOG_TITLE = "Excluir";
  static const String DELETION_DIALOG_TEXT =
      "Confirma a exclusão?\nEssa ação não poderá ser desfeita.";
  static const String DELETION_DIALOG_CONFIRM_BUTTON_TEXT = "Excluir";

  // Copy Dialog
  static const String COPY_DIALOG_TITLE = "Duplicar";
  static const String COPY_DIALOG_TEXT = "Duplicar tabela?";
  static const String COPY_DIALOG_CONFIRM_BUTTON_TEXT = "Duplicar";

  // New Table Dialog
  static const String NEW_TABLE_DIALOG_TITLE = "Criar nova tabela";
  static const String NEW_TABLE_DIALOG_PLACEHOLDER = "Nome da tabela";
  static const String NEW_TABLE_DIALOG_CONFIRM_BUTTON_TEXT = "Criar";
  static const String NEW_TABLE_DIALOG_CANCEL_BUTTON_TEXT = "Cancelar";

  // Table Details Dialog
  static const String TABLE_DETAILS_DIALOG_TITLE = "Detalhes da tabela";
  static const String TABLE_DETAILS_NAME_LABEL = "Nome";
  static const String TABLE_DETAILS_CREATION_DATE_LABEL = "Data de criação";

  // Tag Deletion Dialog
  static const String TAG_DELETION_DIALOG_TITLE = "Excluir etiqueta?";
  static const String TAG_DELETION_DIALOG_TEXT =
      "Tem certeza que deseja excluir a etiqueta \"[tag.name]\"?\n"
      "Essa ação não poderá ser desfeita e a etiqueta será excluída em todas as despesas.";
  static const String TAG_DELETION_DIALOG_CONFIRM_BUTTON_TEXT = "Excluir";
  static const String TAG_DELETION_DIALOG_CANCEL_BUTTON_TEXT = "Cancelar";

  // New Tag Dialog
  static const String NEW_TAG_DIALOG_TITLE = "Nova etiqueta";
  static const String NEW_TAG_DIALOG_NAME_PLACEHOLDER = "Nome da etiqueta";
  static const String NEW_TAG_DIALOG_CONFIRM_BUTTON_TEXT = "Criar";
  static const String NEW_TAG_DIALOG_CANCEL_BUTTON_TEXT = "Cancelar";
  // Edit Tag Dialog
  static const String EDIT_TAG_DIALOG_TITLE = "Editar etiqueta";
  static const String EDIT_TAG_CONFIRM_BUTTON_TEXT = "Salvar";
  // Invalid Name Dialog
  static const String INVALID_NAME_DIALOG_TITLE = "Nome inválido";
  static const String INVALID_NAME_DIALOG_TEXT =
      "O nome da etiqueta não pode ser vazio.";
  // Confirm Tag Update Dialog
  static const String CONFIRM_TAG_UPDATE_DIALOG_TITLE =
      "Confirmar atualização?";
  static const String CONFIRM_TAG_UPDATE_DIALOG_TEXT =
      "Tem certeza que deseja salvar essas alterações?\n";
  static const String CONFIRM_TAG_UPDATE_DIALOG_CONFIRM_BUTTON_TEXT = "Salvar";
  static const String CONFIRM_TAG_UPDATE_DIALOG_CANCEL_BUTTON_TEXT = "Cancelar";

  // New Tag Chip
  static const String NEW_TAG_CHIP_LABEL = "Adicionar Etiqueta";

  // New Income Dialog
  static const String NEW_INCOME_DIALOG_TITLE = "Nova entrada";
  static const String NEW_INCOME_DIALOG_NAME_LABEL = "Descrição";
  static const String NEW_INCOME_DIALOG_NAME_PLACEHOLDER =
      "Descrição da entrada";
  static const String NEW_INCOME_DIALOG_VALUE_LABEL = "Valor";
  static const String NEW_INCOME_DIALOG_VALUE_PLACEHOLDER = "Valor da entrada";
  static const String NEW_INCOME_DIALOG_CONFIRM_BUTTON_TEXT = "Salvar";
  static const String NEW_INCOME_DIALOG_CANCEL_BUTTON_TEXT = "Cancelar";
  // Edit Income Dialog
  static const String EDIT_INCOME_DIALOG_TITLE = "Editar entrada";
  // Confirmation Dialog (new)
  static const String NEW_INCOME_CONFIRMATION_DIALOG_TITLE = "Salvar entrada?";
  static const String NEW_INCOME_CONFIRMATION_DIALOG_TEXT =
      "Tem certeza que deseja criar uma nova entrada?\n";
  // Confirmation Dialog (edit)
  static const String EDIT_INCOME_CONFIMATION_DIALOG_TEXT =
      "Tem certeza que deseja salvar essas alterações?\n";
  // Error Dialog
  static const String INVALID_INCOME_DIALOG_TITLE = "Erro";
  static const String INVALID_INCOME_DIALOG_TEXT_EMPTY_DESCRIPTION =
      "A descrição não pode ser vazia.";
  static const String INVALID_INCOME_DIALOG_TEXT_INVALID_VALUE =
      "O valor não é válido.";

  // New Deposit Dialog
  static const String NEW_DEPOSIT_DIALOG_TITLE = "Novo depósito";
  static const String NEW_DEPOSIT_DIALOG_NAME_LABEL = "Nome";
  static const String NEW_DEPOSIT_DIALOG_NAME_PLACEHOLDER = "Nome do depósito";
  static const String NEW_DEPOSIT_DIALOG_PREVIOUS_VALUE_LABEL = "Anterior";
  static const String NEW_DEPOSIT_DIALOG_PREVIOUS_VALUE_PLACEHOLDER =
      "Valor restante na tabela anterior";
  static const String NEW_DEPOSIT_DIALOG_INCREMENT_VALUE_LABEL = "Adição";
  static const String NEW_DEPOSIT_DIALOG_INCREMENT_VALUE_PLACEHOLDER =
      "Valor adicionado";
  static const String NEW_DEPOSIT_DIALOG_CONFIRM_BUTTON_TEXT = "Salvar";
  static const String NEW_DEPOSIT_DIALOG_CANCEL_BUTTON_TEXT = "Cancelar";
  // Edit Deposit Dialog
  static const String EDIT_DEPOSIT_DIALOG_TITLE = "Editar entrada";
  // Confirmation Dialog (new)
  static const String NEW_DEPOSIT_CONFIRMATION_DIALOG_TITLE =
      "Salvar depósito?";
  static const String NEW_DEPOSIT_CONFIRMATION_DIALOG_TEXT =
      "Tem certeza que deseja criar um novo depósito?\n";
  // Confirmation Dialog (edit)
  static const String EDIT_DEPOSIT_CONFIMATION_DIALOG_TEXT =
      "Tem certeza que deseja salvar essas alterações?\n";
  // Error Dialog
  static const String INVALID_DEPOSIT_DIALOG_TITLE = "Erro";
  static const String INVALID_DEPOSIT_DIALOG_TEXT_EMPTY_NAME =
      "O nome não pode ser vazio.";
  static const String INVALID_DEPOSIT_DIALOG_TEXT_INVALID_PREVIOUS =
      "O valor anterior não é válido.";
  static const String INVALID_DEPOSIT_DIALOG_TEXT_INVALID_INCREMENT =
      "O valor adicionado não é válido.";

  // New Expense Dialog
  static const String NEW_EXPENSE_DIALOG_TITLE = "Nova despesa";
  static const String NEW_EXPENSE_DIALOG_DESCRIPTION_LABEL = "Descrição";
  static const String NEW_EXPENSE_DIALOG_DESCRIPTION_PLACEHOLDER =
      "Descrição da despesa";
  static const String NEW_EXPENSE_DIALOG_VALUE_LABEL = "Valor";
  static const String NEW_EXPENSE_DIALOG_VALUE_PLACEHOLDER = "Valor da despesa";
  static const String NEW_EXPENSE_DIALOG_CONFIRM_BUTTON_TEXT = "Salvar";
  static const String NEW_EXPENSE_DIALOG_CANCEL_BUTTON_TEXT = "Cancelar";
  // Edit Expense Dialog
  static const String EDIT_EXPENSE_DIALOG_TITLE = "Editar despesa";
  // Confirmation Dialog (new)
  static const String NEW_EXPENSE_CONFIRMATION_DIALOG_TITLE = "Salvar despesa?";
  static const String NEW_EXPENSE_CONFIRMATION_DIALOG_TEXT =
      "Tem certeza que deseja criar uma nova despesa?\n";
  // Confirmation Dialog (edit)
  static const String EDIT_EXPENSE_CONFIMATION_DIALOG_TEXT =
      "Tem certeza que deseja salvar essas alterações?\n";
  // Error Dialog
  static const String INVALID_EXPENSE_DIALOG_TITLE = "Erro";
  static const String INVALID_EXPENSE_DIALOG_TEXT_EMPTY_DESCRIPTION =
      "A descrição não pode ser vazia.";
  static const String INVALID_EXPENSE_DIALOG_TEXT_INVALID_VALUE =
      "O valor não é válido.";

  // Chart Rename Dialog
  static const String CHART_RENAME_DIALOG_TITLE = "Renomear Gráfico";
  static const String CHART_RENAME_DIALOG_INPUT_PLACEHOLDER = "Título";
  static const String CHART_RENAME_DIALOG_CANCEL = "Cancelar";
  static const String CHART_RENAME_DIALOG_SAVE = "Salvar";
  // Error Dialog
  static const String CHART_RENAME_DIALOG_ERROR_TITLE = "Erro ao renomear";
  static const String CHART_RENAME_DIALOG_ERROR_EMPTY_TITLE =
      "O título do gráfico não pode ser vazio";

  // Delete Chart Dialog
  static const String CHART_DELETE_DIALOG_TITLE = "Deletar Gráfico?";
  static const String CHART_DELETE_DIALOG_TEXT =
      "Tem certeza que deve excluir o gráfico? Essa ação não pode ser desfeita.";
  static const String CHART_DELETE_DIALOG_CANCEL = "Cancelar";
  static const String CHART_DELETE_DIALOG_CONFIRM = "Excluir";

  // Tag Chart Dialog
  static const String TAG_CHART_CONFIG_DIALOG_TITLE = "Gráfico de Etiquetas";
  static const String TAG_CHART_CONFIG_DIALOG_CANCEL = "Cancelar";
  static const String TAG_CHART_CONFIG_DIALOG_SAVE = "Salvar";
  // Confirmation Dialog
  static const String TAG_CHART_CONFIG_DIALOG_CONFIRMATION_TITLE =
      "Salvar Configurações";
  static const String TAG_CHART_CONFIG_DIALOG_CONFIRMATION_TEXT =
      "Deseja salvar as configurações do gráfico?";
  // Error Dialog
  static const String TAG_CHART_CONFIG_DIALOG_ERROR_TITLE = "Erro ao salvar";
  static const String TAG_CHART_CONFIG_DIALOG_ERROR_MINIMUM_TAGS =
      "Selecione ao menos duas etiquetas";

  // New Chart Dialog
  static const String NEW_CHART_DIALOG_TITLE = "Adicionar Gráfico";
  static const String NEW_CHART_DIALOG_CANCEL = "Cancelar";
  static const String NEW_CHART_DIALOG_SAVE = "Adicionar";
  // Error Dialog
  static const String NEW_CHART_DIALOG_ERROR_TITLE = "Erro ao adicionar";
  static const String NEW_CHART_DIALOG_ERROR_MINIMUM_TAGS =
      "Adicione ao menos duas etiquetas à sua tabela para usar esse gráfico";

  // ---------------------------------------------------------------------------
  // CHARTS

  static const FAILED_TO_LOAD_CHART = 'Falha ao mostrar gráfico';

  // Default titles
  static const PREVIOUS_CURRENT_COMPARISON_BAR_DEFAULT_TITLE =
      "Valores Anteriores x Atuais";
  static const TAG_PIE_DEFAULT_TITLE = "Comparação por Etiquetas";
  static const TAG_BAR_DEFAULT_TITLE = "Comparação por Etiquetas";
  static const SPENT_VS_DEPOSITED_PIE_DEFAULT_TITLE = "Gasto x Depositado";
  static const SPENT_VS_INCOME_PIE_DEFAULT_TITLE = "Gasto x Entrada";

  static const String BAR_CHART_TYPE = "barra";
  static const String PIE_CHART_TYPE = "pizza";

  // Popup Menu
  static const CHART_POPUP_MENU_RENAME = "Renomear";
  static const CHART_POPUP_MENU_DELETE = "Excluir";
  static const CHART_POPUP_MENU_UP = "Mover Acima";
  static const CHART_POPUP_MENU_DOWN = "Mover Abaixo";
  static const CHART_POPUP_MENU_CONFIG = "Configurar";

  // Button
  static const String ADD_CHART_BUTTON = "+ Adicionar Gráfico";

  // Labels
  static const CHART_LABEL_REMAINING = "Restante";
  static const CHART_LABEL_SPENT = "Gasto";
}
