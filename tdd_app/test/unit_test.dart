import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app/database.dart';
import 'package:tdd_app/user_model.dart';

void main() {
  late Database database;
  late User user;

  setUp(() {
    database = Database();
    user = User(firstName: "Ikay", lastName: "Codes");
  });

}