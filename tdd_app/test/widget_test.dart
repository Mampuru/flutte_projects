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


}
