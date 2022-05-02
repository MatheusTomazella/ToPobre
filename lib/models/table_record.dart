class TableRecord {
  late int _id;

  TableRecord(int id) {
    if (id < 0) throw Exception("Id cannot be negative");
    setId(id);
  }

  static List<String> getHeaders() => ["id"];
  List<String> getValues()  => [getId().toString()];

  int getId() => _id;
  void setId(int id) => _id = id;
}
