import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption_app/models/pet_model.dart';
import 'package:pet_adoption_app/widgets/pet_card.dart';

void main() {
  group('PetCard Widget Test', () {
    setUpAll(() => HttpOverrides.global = null);  // Disable network restrictions for testing

    testWidgets('PetCard displays pet details and handles tap correctly', (WidgetTester tester) async {
      bool wasTapped = false;

      // Arrange: Create a test Pet instance
      final pet = Pet(
        id: '1',
        name: 'Fluffy',
        age: 2,
        price: 200,
        imageUrl: 'https://example.com/pet.jpg',  // Use a placeholder image
        isAdopted: false,
        date: DateTime.now(),
      );

      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(
              pet: pet,
              onTap: () {
                wasTapped = true;
              },
            ),
          ),
        ),
      );

      // Replace NetworkImage with an empty container or a mocked image for the test
      await tester.pumpAndSettle();

      // Assert: Verify the initial UI
      expect(find.text('Fluffy'), findsOneWidget);
      expect(find.text('Age: 2 years'), findsOneWidget);
      expect(find.textContaining(RegExp(r'Price: \$200')), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
      expect(find.text('Already Adopted'), findsNothing);

      // Act: Simulate a tap on the PetCard
      await tester.tap(find.byType(InkWell));
      await tester.pump();

      // Assert: Verify the tap callback was triggered
      expect(wasTapped, true);
    });

    testWidgets('PetCard shows "Already Adopted" label when pet is adopted', (WidgetTester tester) async {
      final pet = Pet(
        id: '2',
        name: 'Buddy',
        age: 4,
        price: 300,
        imageUrl: 'https://example.com/pet2.jpg',
        isAdopted: true,
        date: DateTime.now(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PetCard(
              pet: pet,
              onTap: () {},
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Buddy'), findsOneWidget);
      expect(find.text('Age: 4 years'), findsOneWidget);
      expect(find.textContaining(RegExp(r'Price: \$300')), findsOneWidget);
      expect(find.text('Already Adopted'), findsOneWidget);  // Verify the adopted label
    });
  });
}
