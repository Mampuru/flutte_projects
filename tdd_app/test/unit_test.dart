
import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_app/database.dart';
import 'package:tdd_app/source_enum.dart';
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

    test('Move user to archived when moveToArchived method is called', () {
      //Act
      database.moveToArchived(user);

      //Assert
      expect(database.activeUsers.contains(user), false);
      expect(database.archivedUsers.contains(user), true);
    });

    test('Delete user from active when deleteUser is called on an active user', () {
      database.deleteUser(user: user, source: Source.active);
      expect(database.activeUsers.contains(user), false);
    });

  });


}