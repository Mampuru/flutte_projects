import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tdd_app/main.dart';
import 'package:tdd_app/screens/add_user.dart';

void main() {
  testWidgets('Verify add user button present on ActiveUsers page',
          (WidgetTester tester) async {
        //Arrange - Pump MyApp() widget to tester
        await tester.pumpWidget(const MyApp());

        //Act - Find button by type
        var fab = find.byType(FloatingActionButton);

        //Assert - Check that button widget is present
        expect(fab, findsOneWidget);
      });

  testWidgets(
      'Verify that the two input widgets are present on the add user page',
          (WidgetTester tester) async {
        //Arrange - Pump AddUser() widget to tester
        await tester.pumpWidget(MaterialApp(home: AddUser()));

        //Act - Find button by type
        var textField = find.byType(TextFormField);

        //Assert - Check that exactly 2 Text input widgets are present
        expect(textField, findsNWidgets(2));
      });

  testWidgets('Verify that the add user button adds user to database',
          (WidgetTester tester) async {
        //Arrange - Pump AddUser() widget to tester
        await tester.pumpWidget(MyApp(child: AddUser()));

        //Act - Find TextFormFields and button
        var fNameField = find.byKey(const Key("firstNameKey"));
        var lNameField = find.byKey(const Key("lastNameKey"));
        var submitBtn = find.byType(ElevatedButton);

        //Fill text inputs
        await tester.enterText(fNameField, "John");
        await tester.enterText(lNameField, "Doe");

        await tester.tap(submitBtn);

        //Listen for change in widget state
        await tester.pump();

        //Assert - Check that success snackbar pops up
        expect(find.text("User added successfully"), findsOneWidget);
      });
}
