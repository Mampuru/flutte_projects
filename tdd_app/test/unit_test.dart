import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app/database.dart';
import 'package:tdd_app/user_model.dart';

void main() {
  late Database database;
  late User user;

  setUp(() {
    database = Database();
    user = User(firstName: "John", lastName: "Doe");
  });

  group('Test database crud functions', () {
    test('Create new user when addNewUser method is called', () {
      //Act
      database.addNewUser(user);

      //Assert
      expect(database.activeUsers.contains(user), true);
    });


  });


}