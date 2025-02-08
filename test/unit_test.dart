import 'package:flutter_test/flutter_test.dart';

import 'package:pet_adoption_app/models/pet_model.dart';

void main() {
  group('Pet Adoption Status', () {
    test('Adopting a pet should change its status to adopted', () {
      // Setup
      final pet = Pet(
          id: '1',
          name: 'Bailey',
          age: 3,
          price: 90.0,
          imageUrl: 'https://images.unsplash.com/photo-1517423440428-a5a00ad493e8');

      // do
      pet.adopt();

      // test
      expect(pet.isAdopted, true);
    });
  });
}
