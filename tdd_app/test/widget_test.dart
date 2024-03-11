import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tdd_app/main.dart';

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

}
